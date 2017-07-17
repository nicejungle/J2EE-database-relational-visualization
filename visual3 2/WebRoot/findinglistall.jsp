<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html;charset=UTF-8"%> 
<%  
   request.setCharacterEncoding("UTF-8");  
   response.setCharacterEncoding("UTF-8");  
   response.setContentType("text/html; charset=UTF-8");  
%> 
<html>
<head>

  <meta charset="UTF-8">
<title>社交网络</title>

 <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      /* Important styles */
#toggle {
  display: block;
  width: 28px;
  height: 30px;
  margin: 30px auto 10px;
}

#toggle span:after,
#toggle span:before {
  content: "";
  position: absolute;
  left: 0;
  top: -9px;
}
#toggle span:after{
  top: 9px;
}
#toggle span {
  position: relative;
  display: block;
}

#toggle span,
#toggle span:after,
#toggle span:before {
  width: 100%;
  height: 5px;
  background-color: #888;
  transition: all 0.3s;
  backface-visibility: hidden;
  border-radius: 2px;
}

/* on activation */
#toggle.on span {
  background-color: transparent;
}
#toggle.on span:before {
  transform: rotate(45deg) translate(5px, 5px);
}
#toggle.on span:after {
  transform: rotate(-45deg) translate(7px, -8px);
}
#toggle.on + #menu {
  opacity: 1;
  visibility: visible;
}



/* demo styles */
body { margin-top: 3em; background: #eee; color: #555; font-family: "Open Sans", "Segoe UI", Helvetica, Arial, sans-serif; }
p, p a { font-size: 12px;text-align: center; color: #888; }
</style>

   <script src="js/echarts.js"></script>
    <script src="js/datatool.js"></script>
    <script src="js/jquery.js"></script>  
 <script src="js/prefixfree.min.js"></script>
	<link rel="shortcut icon" type="image/png" href="zsign_files/logsmall.png">
    
  </head>

  <body>
        	
  <script>
		
</script>
<%  
String name=request.getParameter("thing"); //从表单获得
String id=request.getParameter("id"); //从表单获得
String price=request.getParameter("price"); //从表单获得        
try 
{ 
/** 连接数据库参数 **/ 
String driverName = "com.mysql.jdbc.Driver"; //驱动名称 
String DBUser = "root"; //mysql用户名 
String DBPasswd = "qwer"; //mysql密码 
String DBName = "Linkedindatabase"; //数据库名 

String connUrl = "jdbc:mysql://localhost/" + DBName + "?useUnicode=true&characterEncoding=utf8&user=" + DBUser + "&password=" + DBPasswd; 
Class.forName(driverName).newInstance(); 
Connection conn = DriverManager.getConnection(connUrl); 
Statement stmt = conn.createStatement(); 
stmt.executeQuery("SET NAMES UTF8"); 
String query_sql = "";
String query_sql2 = ""; 
String query_sql3 = ""; 
try{  
if(name != null && name != ""){ 
 query_sql = "select * from user where username='" + name + "'";
  
}
if(id != null && id != ""){ 
 query_sql = "select * from goods_tb where goodsid='" + id + "'"; 
} 
else if(price != null && price != ""){ 
 query_sql = "select * from goods_tb where goodsprice='" + price + "'"; 
}
}catch(Exception e){ 
e.printStackTrace(); 
}


try { 
ResultSet rs = stmt.executeQuery(query_sql);
while(rs.next()) { 
String userid=rs.getString("userid");
query_sql2 = "select * from experience where userid='" + userid + "'"; 

query_sql3 = "select * from education where userid='" + userid + "'"; 
%>          
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
   <div style="padding:20px;width:100%;height:100%;"> 

        <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
               <div id="main" style="width: 1104px;height:464px;">
                 
               </div>
           
      <div id='main_1' style="position: relative;height:15px;width: 100%;color:#A52A2A">节点关系提示区</div>
          
 </div>
    <script type="text/javascript">
           var data = [];
            data.push({
                        id : 0,
                        category : 0,
                        name : '<%=rs.getString("username")%>',
                        symbol : 'roundRect',
                        value : 20,
                        symbolSize : 50
                    },{
                        id : 1,
                        category : 1,
                        name : '<%=rs.getString("userEnglishname")%>',
                        value : 20,
                        symbolSize : 30
                    },{
                        id : 2,
                        category : 1,
                        name : '<%=rs.getString("Selfintroduction")%>',
                        value : 20,
                        symbolSize : 30
                    },{
                        id : 3,
                        category : 1,
                        name : '<%=rs.getString("Country")%>',
                        value : 20,
                        symbolSize : 30
                    },{
                        id : 4,
                        category : 1,
                        name : '<%=rs.getString("location")%>',
                        value : 20,
                        symbolSize : 30
                    },{
                        id : 5,
                        category : 1,
                        name : '<%=rs.getString("industry")%>',
                        value : 20,
                        symbolSize : 30
                    },{
                        id : 6,
                        category : 1,
                        name : '<%=rs.getString("title")%>',
                        value : 20,
                        symbolSize : 30
                    },{
                        id : 7,
                        category : 1,
                        name : '<%=rs.getString("companyname")%>',
                        value : 20,
                        symbolSize : 30
                    },{
                        id : 8,
                        category : 1,
                        name : '<%=rs.getString("graduatedschool")%>',
                        value : 20,
                        symbolSize : 30
                    },{
                        id : 9,
                        category : 1,
                        name : '工作经验',
                        value : 20,
                        symbolSize : 30
                    },{
                        id : 10,
                        category : 1,
                        name : '教育',
                        value : 20,
                        symbolSize : 30
                    });
                    
            
           var links = [];
           for (var i = 1; i < 11; i++) {
            links.push({
                        source : i,
                        target : 0
                    } ); 
    }
    
    
    
var ednum = 11;        

     // 指定图表的配置项和数据
       /*  
       
         var data = [ {
                        id : 0,
                        category : 0,
                        name : '用户名',
                        symbol : 'roundRect',
                        value : 20,
                        symbolSize : 50
                    }, {
                        id : 1,
                        category : 1,
                        name : '丛林',
                        value : 20,
                        symbolSize : 30
                    }
                    , {
                        id : 2,
                        category : 1,
                        name : '联迪恒星',
                        value : 20,
                        symbolSize : 30
                    }, {
                        id : 3,
                        category : 2,
                        name : '外包公司',
                        value : 20,
                        symbolSize : 30
                    }
                    ];
                               data.push({
                        id : 4,
                        category : 3,
                        name : 'javaweb',
                        value : 20,
                        symbolSize : 30
                    });
                  var links =   [ //edges是其别名代表节点间的关系数据。
                    {
                        source : 1,
                        target : 0
                    },{
                        source : 2,
                        target : 0
                    },{
                        source : 3,
                        target : 2
                    } ]   ;
                      links.push({
                        source : 4,
                        target : 3
                    } );    */
                 
               </script>

<% 
} 
}catch(Exception e) { 
e.printStackTrace(); 
}  
%> 



<%  
try { 
ResultSet ers = stmt.executeQuery(query_sql2);
while(ers.next()) { 
%>             
<script type="text/javascript">
    data.push({           
                        id : i,
                        category : 2,
                        name : '<%=ers.getString("title")%>',
                        value : i,
                        symbolSize : 45
              },{           
                        id : i+1,
                        category : 2,
                        name : '<%=ers.getString("companyname")%>',
                        value : i+1,
                        symbolSize : 30
              },{           
                        id : i+2,
                        category : 2,
                        name : '<%=ers.getString("timebegin")%>',
                        value : i+2,
                        symbolSize : 30
              },{           
                        id : i+3,
                        category : 2,
                        name : '<%=ers.getString("timeover")%>',
                        value : i+3,
                        symbolSize : 30
              });
              links.push(
              {
                        source : i,
                        target : 9  
             },
              {
                        source : i+1,
                        target : i  
             },{
                        source : i+2,
                        target : i  
             },{
                        source : i+3,
                        target : i  
             }
             );
             i=i+4;
            </script>
         
<% 
} 
}catch(Exception e) { 
e.printStackTrace(); 
} 

//rs.close(); 
try { 
ResultSet ed = stmt.executeQuery(query_sql3);
while(ed.next()) { 
%> 
<script type="text/javascript">
data.push({          
                        id : i,
                        category : 3,
                        name : '<%=ed.getString("degree")%>',
                        value : i,
                        symbolSize : 45
              },{          
                        id : i+1,
                        category : 3,
                        name : '<%=ed.getString("major")%>',
                        value : i,
                        symbolSize : 30
              },{          
                        id : i+2,
                        category : 3,
                        name : '<%=ed.getString("college")%>',
                        value : i,
                        symbolSize : 30
              },{          
                        id : i+3,
                        category : 3,
                        name : '<%=ed.getString("bigintime")%>',
                        value : i,
                        symbolSize : 30
              },{          
                        id : i+4,
                        category : 3,
                        name : '<%=ed.getString("overtime")%>',
                        value : i,
                        symbolSize : 30
              }
              
              );
                 links.push(
              {
                        source : i,
                        target : 10 
             },
              {
                        source : i+1,
                        target : i  
             },{
                        source : i+2,
                        target : i  
             },{
                        source : i+3,
                        target : i  
             },{
                        source : i+4,
                        target : i  
             }
             );
i=i+5;
</script>
<%
}

}catch (Exception e) { 
e.printStackTrace(); 
}
stmt.close(); 
conn.close(); 

}catch (Exception e) { 
e.printStackTrace(); 
} 
%> 



















 <script type="text/javascript">
                  // 基于准备好的dom，初始化ECharts实例
            var myChart = echarts.init(document.getElementById('main'), 'macarons');   
            var option = {
                tooltip : {
                   
                },

                legend : { //=========圖表控件
                    show : true,
                    data : [ {
                        name : '人员',
                        
                        icon : 'roundRect'//'circle', 'rect', 'roundRect', 'triangle', 'diamond', 'pin', 'arrow'
            
                    },
                    {
                        name : '基本信息',
                        
                        icon : 'roundRect'
                    }, {
                        name : '工作经历',
                        
                        icon : 'roundRect'
                    }, {
                        name : '教育经历',
                        
                        icon : 'roundRect'
                    } ]
                },
                  animationDuration: 1500,
        animationEasingUpdate: 'quinticInOut',
                series : [ {
                    type : 'graph', //关系图
                    name : "关系可视化系统", //系列名称，用于tooltip的显示，legend 的图例筛选，在 setOption 更新数据和配置项时用于指定对应的系列。
                    layout : 'force', //图的布局，类型为力导图，'circular' 采用环形布局，见示例 Les Miserables
                    legendHoverLink : true,//是否启用图例 hover(悬停) 时的联动高亮。
                    roam: true, 
                    force : { //力引导图基本配置
                        //initLayout: ,//力引导的初始化布局，默认使用xy轴的标点
                        repulsion : 100,//节点之间的斥力因子。支持数组表达斥力范围，值越大斥力越大。
                        gravity : 0.06,//节点受到的向中心的引力因子。该值越大节点越往中心点靠拢。
                        edgeLength :80,//边的两个节点之间的距离，这个距离也会受 repulsion。[10, 50] 。值越小则长度越长
                        layoutAnimation : true
                    //因为力引导布局会在多次迭代后才会稳定，这个参数决定是否显示布局的迭代动画，在浏览器端节点数据较多（>100）的时候不建议关闭，布局过程会造成浏览器假死。                        
                    },
                  
                     itemStyle : {//===============图形样式，有 normal 和 emphasis 两个状态。normal 是图形在默认状态下的样式；emphasis 是图形在高亮状态下的样式，比如在鼠标悬浮或者图例联动高亮时。
                        normal : { //默认样式
                            label : {
                                show : true
                            },
                           
                        },
                        emphasis : {//高亮状态

                        }
                    },
                   
                    //别名为nodes   name:影响图形标签显示,value:影响选中后值得显示,category:所在类目的index,symbol:类目节点标记图形,symbolSize:10图形大小
                    //label:标签样式。
                    data:data,
                    categories : [ //symbol name：用于和 legend 对应以及格式化 tooltip 的内容。 label有效
                    {
                        name : '人员',
                        symbol : 'roundRect',
                        label : { //标签样式
                        }
                    }, {
                        name : '基本信息',
                        symbol : 'roundRect'
                    }, {
                        name : '工作经历',
                        symbol : 'roundRect'
                    } , {
                        name : '教育经历',
                        symbol : 'roundRect'
                    }],label: {
                    normal: {
                        position: 'right',
                        formatter: '{b}'
                    }
                },
                    lineStyle: {
                    normal: {
                        color: 'source',
                        curveness: 0.3
                    }
                },
                    links : links     } ]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
            
            /*ECharts3 方法部分 开始*/
            function appendPath(params){    //拼接节点关系并显示在左下角，
                var option = myChart.getOption();
                var series = option.series[params.seriesIndex]; //获取图表
                var nodesOption = series.data;//获取所有数据
                var links= series.links;//获取所有连线
                if(params.dataType=="node"){ //dataType可以是edge(线条)或node(数据)
                    var id=params.data.id;
                    var categoryName = series.categories[params.data.category].name;//获取当前节点的图例名称
                    var str=categoryName+":"+nodesOption[id].name;
                    var i = 0;
                    var map = {};
                    for( i = 0 ; i < links.length; i++){
                        map[links[i].source] = links[i].target;
                    }
                   
                    while(true){           
                        if(map[id] == undefined){
                            break;
                        }
                        //获取父节点的图例名称并连接
                        str =series.categories[nodesOption[map[id]].category].name+":"+nodesOption[map[id]].name+"->" + str; 
                        id = map[id] ;
                    }
                    return str;
                }else if(params.dataType=="edge"){ //当鼠标停留在连线上时，暂不处理
                    return "";
                }
            }
            
            function openOrFold(params) {  //该事件会提示节点间关系
                var str = appendPath(params);
                document.getElementById("main_1").innerHTML = str;
                return str;
            }
            //var ecConfig = echarts.config; echarts2的获取事件方法，当前为echarts3
            myChart.on('mouseover', openOrFold);
            //'click'、'dblclick'、'mousedown'、'mousemove'、'mouseup'、'mouseover'、'mouseout' 
            /*ECharts3 方法部分 结束*/
            
            /*ECharts3 结束*/
    </script>      
         



















        
      
        </tbody>
      </table>
    </div>
  </div>
</body>

   










    
    
    
  </body>
</html>