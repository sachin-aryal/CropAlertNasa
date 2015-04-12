<%--
  Created by IntelliJ IDEA.
  User: sachin
  Date: 4/11/2015
  Time: 1:45 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Crop Alert</title>
</head>

<body>
<div class="container">
    <h1>${ActionName}</h1>
    <g:if test="${ActionName.equals("map")}">
        <div id="map">
            This is Map
        </div>
    </g:if>
    <g:elseif test="${ActionName.equals("graph")}">
        <div id="Chart">

        </div>
    </g:elseif>
    <g:else>
        <div id="tableData">
            <table class="table table-responsive table-hover table-condensed table-bordered" style="overflow: scroll">
                <thead style="font-weight: bold;">
                <tr>
                    <td>Crop Name</td>
                    <td>Disease</td>
                    <td>Affected %</td>
                    <td>Pesticide</td>
                    <td>Improve</td>
                    <td>Location</td>
                    <td>Start Date</td>
                    <td>Description</td>
                </tr>
                </thead>
                <tbody>
                <g:each in="${cropDetail}" var="crop">
                    <tr>
                        <td><g:link action="show" id="${crop.id}"> ${crop.cropName}</g:link></td>
                        <td>${crop.disease}</td>
                        <td>${crop.affected}</td>
                        <td>${crop.pesticide}</td>
                        <td>${crop.improve}</td>
                        <td>${crop.location}</td>
                        <td><g:formatDate format="yyyy-MM-dd" date="${crop.startDate}"/></td>
                        <td>${crop.description}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate next="Next" prev="Back" controller="crop" action="getData"
                            total="${cropDetailTotal}" params="${params}"/>
            </div>
        </div>
    </g:else>
</div>
<g:if test="${ActionName.equals("graph")}">
    <g:javascript>
    var myData=new Array();
    var data="${cropDetail.affected}".split(',');
    var i;
    var date
    date="${cropDetail.startDate})".split(',')
    for(i=0;i<(data.length);i++){
        if(data[i]!=null){
            myData.push([date[i].replace('[', '').replace(']',""),parseFloat(data[i].replace('[', '').replace(']',''))]);
        }
    }
var myChart = new JSChart('Chart', 'line');
myChart.setDataArray(myData);
myChart.setAxisNameFontSize(13);
myChart.setAxisValuesFontSize(11);
myChart.setAxisNameX('Disease');
myChart.setAxisNameY('Affected');
myChart.setAxisNameColor('#787878');
myChart.setAxisValuesNumberX(data.length);
//myChart.setAxisValuesNumberY(10);
myChart.setAxisValuesColor('#38a4d9');
myChart.setAxisColor('#38a4d9');
myChart.setLineColor('#8D9386');
myChart.setTitle('Disease Analysis');
myChart.setTitleFontSize(20);
myChart.setTitleColor("#1c4877");
myChart.setGraphExtend(true);
myChart.setGridColor('#38a4d9');
myChart.setSize(960, 400);
myChart.setAxisPaddingLeft(140);
myChart.setAxisPaddingRight(140);
myChart.setAxisPaddingTop(60);
myChart.setAxisPaddingBottom(45);
myChart.setTextPaddingLeft(105);
myChart.setTextPaddingBottom(12);
myChart.setLineSpeed(90);
myChart.setLineWidth(4);
    %{--myChart.setBackgroundImage('path/background.jpg');--}%
        %{--for(i=0;i<16;i++){--}%
        %{--if(data[i]!=null){--}%
        %{--myChart.setTooltip([i+1,semester[i].replace('[', '').replace(']', '')+"->"+examination[i].replace('[', '')--}%
                        %{--.replace(']', '')+" Percentage:"+data[i].replace('[', '').replace(']','')]);--}%
                    %{--}--}%
                %{--}--}%
            myChart.setTooltipBackground('#fff');
            myChart.setTooltipFontSize(18);
            //myChart.setTooltipSize(14);
            //myChart.setLegendForLine(1,sachin);
            myChart.draw();

    </g:javascript>
</g:if>
</body>
</html>