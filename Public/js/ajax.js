function refreshFetcherData(start,end,status,name){
  var target = './index.php?m=&c=Log&a=getDataFectherByTime&start='+start+'&end='+end+'&status='+status+'&name='+name;
   $.get(target).success(function(data){
    if(data.status ==1){
      Highcharts.setOptions({
        global: {
          useUTC: false //开启UTC
        }
      });
      $('#quxiantu_fetcher').highcharts({
        chart: {
                type: 'spline'
            },
            title: {
                text: '爬虫下载平台————Fetcher模块下载日志统计'
            },
            subtitle: {
                text: '解析数据分析'
            },
            xAxis: {
                type: 'datetime',
                dateTimeLabelFormats: { // don't display the dummy year
                    hour: '%H:%M',
                  month: '%e. %b',
                    year: '%b'
                }
            },
            yAxis: {
                title: {
                    text: 'download count'
                },
                min: 0
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br>'+
                        Highcharts.dateFormat('%b. %e %H:%M', this.x) +'__value: '+ this.y;
                }
            },
            series: data.curve
      });
    }else{
      $('#quxiantu_fetcher').html('');
    }
      
  });
}
function refreshHandlerData(start,end,status,name){
  var target = 'index.php?m=&c=Log&a=getDataHandlerByTime&start='+start+'&end='+end+'&status='+status+'&name='+name;
   $.get(target).success(function(data){
    if(data.status ==1){
       Highcharts.setOptions({
          global: {
            useUTC: false //开启UTC
          }
        });
      $('#quxiantu_handler').highcharts({
        chart: {
                type: 'spline'
            },
            title: {
                text: '爬虫下载平台————Handler模块下载日志统计'
            },
            subtitle: {
                text: '解析数据分析'
            },
            xAxis: {
                type: 'datetime',
                dateTimeLabelFormats: { // don't display the dummy year
                    hour: '%H:%M',
                  month: '%e. %b',
                    year: '%b'
                }
            },
            yAxis: {
                title: {
                    text: 'download count'
                },
                min: 0
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br>'+
                        Highcharts.dateFormat('%b. %e %H:%M', this.x) +'__value: '+ this.y;
                }
            },
            series: data.curve
      });
    }else{
      $('#quxiantu_handler').html('');
    }
      
  });
}