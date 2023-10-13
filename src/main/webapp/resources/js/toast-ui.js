


$(document).ready(function () {
    
    /* Grid */
    const grid = new tui.Grid({
        el: document.getElementById('grid'),
        data: treeData,
        rowHeaders: ['checkbox'],
        bodyHeight: 500,
        treeColumnOptions: {
            name: 'name',
            useCascadingCheckbox: true
            },
            columns: [
            {
                header: 'Name',
                name: 'name',
                width: 300
            },
            {
                header: 'Artist',
                name: 'artist'
            },
            {
                header: 'Type',
                name: 'type'
            },
            {
                header: 'Release',
                name: 'release'
            },
            {
                header: 'Genre',
                name: 'genre'
            }
            ]
        });
    
        grid.on('expand', ev => {
            const { rowKey } = ev;
            const descendantRows = grid.getDescendantRows(rowKey);
    
            console.log('rowKey: ' + rowKey);
            console.log('descendantRows: ' + descendantRows);
    
            if (!descendantRows.length) {
            grid.appendRow(
                {
                name: 'dynamic loading data',
                _children: [
                    {
                    name: 'leaf row'
                    },
                    {
                    name: 'internal row',
                    _children: []
                    }
                ]
                },
                { parentRowKey: rowKey }
            );
            }
        });
    
        grid.on('collapse', ev => {
            const { rowKey } = ev;
            const descendantRows = grid.getDescendantRows(rowKey);
    
            console.log('rowKey: ' + rowKey);
            console.log('descendantRows: ' + descendantRows);
        });
        

    /* CHART
    const el = document.getElementById('chart');
    const data = {
        categories: [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec',
        ],
        series: [
            {
            name: 'Seoul',
            data: [20, 40, 25, 50, 15, 45, 33, 34, 20, 30, 22, 13],
            },
            {
            name: 'Sydney',
            data: [5, 30, 21, 18, 59, 50, 28, 33, 7, 20, 10, 30],
            },
            {
            name: 'Moscow',
            data: [30, 5, 18, 21, 33, 41, 29, 15, 30, 10, 33, 5],
            },
        ],
    };
    const options = {
        chart: { 
            title: 'Basic Chart', 
            width: 600, 
            height: 400 
            },
        xAxis: { 
            pointOnColumn: false, 
            title: { text: 'Month' } 
            },
        yAxis: { title: 'Temperature (Celsius)' },
        series: { spline: false },
    };

    const chart = toastui.Chart.areaChart({ el, data, options });

 */
    /* Chart - Pie */
    
    const el = document.getElementById('chart-pie');
    const data = {
        categories: ['Browser'],
            series: [
                {
                name: 'Chrome',
                data: 46.02,
                },
                {
                name: 'IE',
                data: 20.47,
                },
                {
                name: 'Firefox',
                data: 17.71,
                },
                {
                name: 'Safari',
                data: 5.45,
                },
                {
                name: 'Opera',
                data: 3.1,
                },
                {
                name: 'Etc',
                data: 7.25,
                },
            ],
        };
        const options = {
            chart: { title: 'Usage share of web browsers', width: 600, height: 600 },
            series: {
                dataLabels: {
                    visible: true,
                    pieSeriesName: {
                        visible: true,
                    },
                    clockwise: false
                },
            },
        };

        const chart = toastui.Chart.pieChart({ el, data, options });
    


    /* EDITOR */
    const Editor = toastui.Editor;
    
    const editor = new Editor({
        el: document.querySelector('#editor'),
        height: '600px',
        initialEditType: 'markdown',
        previewStyle: 'vertical'
    });


});
