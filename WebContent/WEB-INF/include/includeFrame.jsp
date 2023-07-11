<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<script>
		$(document).ajaxSend(function(event, request, settings) {
			request.setRequestHeader('AJAX', 'true'); // ajax 호출을  header에 기록
			// 생성된 ajax 함수가 아닌 일반 ajax사용 할때를 대비하여 코드추가
		});
		
		function Lpad(str, len){  // hh mm형식으로 표기하기 위한 함수
			str = str + "";
			while(str.length < len){
				str = "0" + str;
			}
			return str;
		}
		
		document.onkeydown = doNotReload;
		
		function doNotReload(){
			//ctrl+N , ctrl+R
			// function F5
			if((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116)){
				event.keyCode = 0;
				event.cancelBubble = true;
				event.returnValue = false;
			}
		}
		
		function exportExcel(grid, fileNm){
			// step 1. workbook 생성
			var wb = XLSX.utils.book_new();
			
			// step 2. 시트 만들기
			var ws = XLSX.utils.table_to_sheet(document.getElementById("gview_" + grid));
			
			//첫번째 로우 삭제
			delete_row(ws, 1);
			
			var objectMaxLength = [];
			
			for(i in ws){
				if(typeof(ws[i]) != "object") continue;
				
				let cell = XLSX.utils.decode_cell(i);
				
				if(XLSX.utils.decode_cell(i).c == 0 && XLSX.utils.decode_cell(i).r == 0){
					if(ws[i].v == ""){
						delete_cols(ws, 0, 1);
					}
				}
				
				ws[i].s = { // styling for all cells
						fill: {
							patternType: "solid"
							, fgColor: {
								rgb: "ffffff"
							}
						}
						, font: {
							name: "arial"
						}
						, alignment: {
							vertical: "center"
							, horizontal: "center"
							, wrapText: '1'
						}
						, border: {
							top: {
								style: "thin"
								, color: "000000"
							}
							, bottom: {
								style: "thin"
								, color: "000000"
							}
							, right: {
								style: "thin"
								, color: "000000"
							}
							, left: {
								style: "thin"
								, color: "000000"
							}
						}
				};
				
				if (cell.r == 0 ) { // first row
					ws[i].s.fill.fgColor = {
						rgb: "D9D9D9"
					};
				
					ws[i].s.font.bold = true;
					var value = ws[i].v.toString();
					objectMaxLength.push({width: (value.length * 1.5) + 10});
				}
				else if(cell.r > 0 && XLSX.utils.decode_range(ws["!ref"]).e.r > cell.r){
					var value = ws[i].v.toString();
					objectMaxLength[cell.c] = objectMaxLength[cell.c].width > (value.length * 1.5) + 10 ? objectMaxLength[cell.c] : {width: (value.length * 1.5) + 10}
				}
			}
			
			ws['!cols'] = objectMaxLength;
			
			// step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.
			XLSX.utils.book_append_sheet(wb, ws, "Sheet1");
			
			// step 4. 엑셀 파일 만들기 
			var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});
			
			// step 5. 엑셀 파일 내보내기 
			saveAs(new Blob([s2ab(wbout)], {type:"application/octet-stream"}), fileNm + "_" + toDate() + ".xlsx");
		}
		
		function s2ab(s) {
			var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
			var view = new Uint8Array(buf);  //create uint8array as viewer
			for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
			return buf;
		}
		
		//엑셀 시트 행삭제
		function delete_row(ws, rowIdx){
			var value = XLSX.utils.decode_range(ws["!ref"]);
			
			for(var R = rowIdx; R < value.e.r; ++R){
				for(var C = value.s.c; C <= value.e.c; ++C){
					ws[XLSX.utils.encode_cell({r: R, c: C})] = ws[XLSX.utils.encode_cell({r: R + 1, c: C})];
				}
			}
			value.e.r--;
			ws['!ref'] = XLSX.utils.encode_range(value.s, value.e);
		}
		
		function clamp_range(range) {
			if(range.e.r >= (1<<20)) range.e.r = (1<<20)-1;
			if(range.e.c >= (1<<14)) range.e.c = (1<<14)-1;
			return range;
		}
		
		//엑셀 시트 컬럼 삭제
		function delete_cols(ws, start_col, ncols) {
			if(!ws) throw new Error("operation expects a worksheet");
			
			var crefregex = /(^|[^._A-Z0-9])([$]?)([A-Z]{1,2}|[A-W][A-Z]{2}|X[A-E][A-Z]|XF[A-D])([$]?)([1-9]\d{0,5}|10[0-3]\d{4}|104[0-7]\d{3}|1048[0-4]\d{2}|10485[0-6]\d|104857[0-6])(?![_.\(A-Za-z0-9])/g;
			
			var dense = Array.isArray(ws);
			if(!ncols) ncols = 1;
			if(!start_col) start_col = 0;
			
			/* extract original range */
			var range = XLSX.utils.decode_range(ws["!ref"]);
			var R = 0, C = 0;
			
			var formula_cb = function($0, $1, $2, $3, $4, $5) {
				var _R = XLSX.utils.decode_row($5), _C = XLSX.utils.decode_col($3);
				if(_C >= start_col) {
					_C -= ncols;
					if(_C < start_col) return "#REF!";
				}
				return $1+($2=="$" ? $2+$3 : XLSX.utils.encode_col(_C))+($4=="$" ? $4+$5 : XLSX.utils.encode_row(_R));
			};
			
			var addr, naddr;
			for(C = start_col + ncols; C <= range.e.c; ++C) {
				for(R = range.s.r; R <= range.e.r; ++R) {
					addr = XLSX.utils.encode_cell({r:R, c:C});
					naddr = XLSX.utils.encode_cell({r:R, c:C - ncols});
					if(!ws[addr]) { delete ws[naddr]; continue; }
					if(ws[addr].f) ws[addr].f = ws[addr].f.replace(crefregex, formula_cb);
					ws[naddr] = ws[addr];
				}
			}
			
			for(C = range.e.c; C > range.e.c - ncols; --C) {
				for(R = range.s.r; R <= range.e.r; ++R) {
					addr = XLSX.utils.encode_cell({r:R, c:C});
					delete ws[addr];
				}
			}
			
			for(C = 0; C < start_col; ++C) {
				for(R = range.s.r; R <= range.e.r; ++R) {
					addr = XLSX.utils.encode_cell({r:R, c:C});
					if(ws[addr] && ws[addr].f) ws[addr].f = ws[addr].f.replace(crefregex, formula_cb);
				}
			}
			
			/* write new range */
			range.e.c -= ncols;
			if(range.e.c < range.s.c) range.e.c = range.s.c;
			ws["!ref"] = XLSX.utils.encode_range(clamp_range(range));
			
			/* merge cells */
			if(ws["!merges"]) ws["!merges"].forEach(function(merge, idx) {
				var mergerange;
				switch(typeof merge) {
					case 'string': mergerange = XLSX.utils.decode_range(merge); break;
					case 'object': mergerange = merge; break;
					default: throw new Error("Unexpected merge ref " + merge);
				}
				if(mergerange.s.c >= start_col) {
					mergerange.s.c = Math.max(mergerange.s.c - ncols, start_col);
					if(mergerange.e.c < start_col + ncols) { delete ws["!merges"][idx]; return; }
					mergerange.e.c -= ncols;
					if(mergerange.e.c < mergerange.s.c) { delete ws["!merges"][idx]; return; }
				} else if(mergerange.e.c >= start_col) mergerange.e.c = Math.max(mergerange.e.c - ncols, start_col);
				
				clamp_range(mergerange);
				ws["!merges"][idx] = mergerange;
			});
			
			if(ws["!merges"]) ws["!merges"] = ws["!merges"].filter(function(x) { return !!x; });
			
			/* cols */
			if(ws["!cols"]) ws["!cols"].splice(start_col, ncols);
		}
</script>
</html>