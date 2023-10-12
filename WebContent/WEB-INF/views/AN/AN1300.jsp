<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	.upload-name {
		display: inline-block;
		height: 40px;
		padding: 0 10px;
		vertical-align: middle;
		border: 1px solid #dddddd;
		width: 78%;
		color: #999999;
	}
	label {
		display: inline-block;
		padding: 10px 20px;
		color: #fff;
		vertical-align: middle;
		background-color: #999999;
		cursor: pointer;
		height: 40px;
		margin-left: 10px;
	}
	input[type="file"] {
		position: absolute;
		width: 0;
		height: 0;
		padding: 0;
		overflow: hidden;
		border: 0;
	}
	section {
		display: flex;
		flex-direction: column;
	}
	#txt01_FILE_PATH {
		cursor: pointer;
	}
	#pdfIframe {
		width: 100%;
		height: 100vh;
	}
	.pdfObjectTag {
		width: 100%;
		height: 100vh;
	}
</style>
	<body>
		<!-- .contents-wrap 컨텐츠영역 START -->
		<div class="contents-wrap an1100-page">
			<!-- .page-title-wrap 타이블영역 START -->
			<div class="page-title-wrap">
				<div class="page-title">
					<h2>업무캘린더</h2>
					<ul class="title-btn">
						<li><a href="javascript:reset();" id="btn01_REFLESH" class="btn-refresh" title="검색조건 초기화"></a></li>
					</ul>
	           </div>
	           <div class="page-btn-wrap">
		            <ul>
		                <li><a href="javascript:void(0);" id="btn01_IFRAME_CLOSE" class="btn-close">닫기</a></li>
		            </ul>
	           </div>
	       </div>
			<!-- .page-title-wrap 타이블영역 END -->
	           
	        <!-- .search-wrap 검색영역 START -->
			<div class="search-zone">
				<div class="search-wrap">
					<div class="sch-box">
						<dl id="sch-box-left" class="dl-2n">
							<dt>첨부파일</dt>
							<dd>
								<form enctype="multipart/form-data">
									<input id="txt01_FILE_PATH" class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
									<label for="txt01_FILE">파일찾기</label>
									<input type="file" name="file" id="txt01_FILE"  accept=".pdf">
								</form>
							</dd>
						</dl>
						<dl class="dl-2n">
							<dt>첨부파일 목록</dt>
							<dd class="fl-sb">
								<select id="sel01_FILE"></select>
							</dd>
						</dl>
					</div>
					<div id="srch-btn" class="srch-btn">
		                <ul>
							<li><a href="javascript:void(0);" id="btn01_DELETE" class="btn-file">삭제</a></li>
		                    <li><a href="javascript:void(0);" id="btn01_CONFIRM" class="btn-confirm">저장</a></li>
		                </ul>
		            </div>
				</div>
			</div>
			<!-- .search-wrap 검색영역 END -->
			
			<!-- .title-wrap TABLE영역 START -->
			<div class="row row-1">
				<div class="col col-1 wp100">
					<section>
						<div class="title-wrap">
							<div class="title-zone">
								<h2 class="title1"></h2>
							</div>
						</div>
						<iframe id="pdfIframe"></iframe>
					</section>
				</div>
			</div>
			<!-- .title-wrap TABLE영역 END -->
		</div>
		<!-- .contents-wrap 컨텐츠영역 END -->
	</body>
	<script type="text/javascript">
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 공통코드
		/* 공통코드_다국어 */
		let langHead;
		const txt01_FILE = document.querySelector('#txt01_FILE');
		const txt01_FILE_PATH = document.querySelector('#txt01_FILE_PATH');
		const pdfIframe = document.querySelector("#pdfIframe");
		const titleWrap = document.querySelector(".title1")
		getAjaxJsonData("/an1300/files", "", "fileListCallBack", "GET")

		const userDept = '${User.DEPT_CD}'

		if (userDept.indexOf("M") < 0) {
			$("#sch-box-left").remove();
			$("#srch-btn").remove();
		}
		
		//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: 버튼
		/*첨부 파일*/
		$("#txt01_FILE").on('change', () => {
			let fileName = $("#txt01_FILE").val();
			$(".upload-name").val(fileName);
		});

		$("#txt01_FILE_PATH").on('click', () => {
			$("#txt01_FILE").click();
		});


		$("#sel01_FILE").on('change', () => {
			let num = $("#sel01_FILE").val();
			if (num > 0) {
				getAjaxJsonData("/an1300/file?num="+num, "", "pdfFileToIframe", "GET");
			}
		});

		$("#btn01_CONFIRM").on('click', () => {
			if (txt01_FILE.value != "") {
				confirms("첨부파일을 저장하시겠습니까?", "C");
			} else {
				toast("정보", "첨부파일을 추가해주세요.", "info");
			}
		});

		$("#btn01_DELETE").on('click', () => {
			let num = $("#sel01_FILE").val();
			if (num == "-1") {
				toast("정보", "삭제할 첨부파일을 선택해주세요.", "info");
			} else {
				confirms("선택한 첨부파일을 삭제하겠습니까?", "D");
			}
		});

		function confirmYes(action){
			if(action == "C"){
				const form = document.querySelector("form");
				const formDate = new FormData(form);

				$.ajax({
					type: "POST",
					enctype: 'multipart/form-data',
					url: "/an1300/file",
					data: formDate,
					processData: false,
					contentType: false,
					cache: false,
					timeout: 600000,
					success: function (data) {
						console.log('uploadFile > ajax > success', data);

						getAjaxJsonData("/an1300/file", "", "pdfToCanvas", "GET");
						getAjaxJsonData("/an1300/files", "", "fileListCallBack", "GET");

						txt01_FILE.value = "";
						txt01_FILE_PATH.value = "";
						toast("성공", "첨부파일을 저장하였습니다.", "success");
					},
					error: function (e) {
						console.log('uploadFile > ajax > error', e);
						toast("경고", "첨부파일 저장에 문제가 생겼습니다.", "error");
					}
				});
			}else if (action == "D") {
				let num = $("#sel01_FILE").val();
				getAjaxJsonData("/an1300/file?num="+num, "", "fileListCallBack", "PATCH");
			}
		}
		function fileListCallBack(datas) {
			$("#sel01_FILE").empty();
			$("#sel01_FILE").append($("<option value='-1'>첨부파일 목록</option>"));
			datas.forEach((data, i) => {
				let option = $("<option value=" + data.FILE_NUM + ">" + (i + 1) + ". " + data.FILE_ORIGINAL_NAME + "</option>");
				$("#sel01_FILE").append(option);
			});

			if (datas.length > 0) {
				getAjaxJsonData("/an1300/file", "", "pdfFileToIframe", "GET");
			}
		}

		function pdfFileToIframe(data) {
			if (data.isempty) {
				return false;
			}

			let src = "an1300/file/"
					.concat(data.fileChangeName)
					.concat("#toolbar=0&navpanes=0&scrollbar=0");
			pdfIframe.setAttribute("src", src);

			titleWrap.innerText = data.fileOriginalName
		}
	</script>
</html>