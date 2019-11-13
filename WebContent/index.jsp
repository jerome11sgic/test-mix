<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>

  <jsp:include page="includes/meta.jsp" /> 
  <jsp:include page="includes/styleLinks.jsp" /> 


</head>

<body>
   <jsp:include page="includes/topNavigation.jsp" /> 

  <div class="container-fluid">
    <div class="row">
     <jsp:include page="includes/sideNavigation.jsp" /> 

      <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
          <h1 class="h2">Testing</h1>

        </div>

        <div class="table-responsive">
          <h5>Enter Test name :</h5>
          <input type="text" class="form-control" />
        </div>
        <br />
        <br />

        <div class="table-responsive">
          <h4>Step 1 - Enter Input parameters </h4>
          <table class="table table-striped table-sm">
            <thead>
              <tr>
                <th>Parameter Name</th>
                <th>Label Name</th>
                <th></th>
              </tr>
            </thead>
            <tbody id="tbl-input">




            </tbody>
          </table>
        </div>
        <br />
        <br />

        <div class="table-responsive">
          <h4>Step 2 - Enter the Ouput Logic </h4>
          <textarea class="form-control"></textarea>
        </div>

        <br />
        <button class="btn btn-sm" onclick="generateProgramme()">Generate Programme</button>

        <div id="section-programme">

        </div>
      </main>
    </div>
  </div>

  <!-- Bootstrap core JavaScript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
<jsp:include page="includes/jsScripts.jsp" /> 

  <script>

    inputArray = [];

    console.log(inputArray);

    function addToInputArray() {
      let parameter = document.getElementById("paramName").value;
      let label = document.getElementById("labelName").value;
      console.log(parameter);
      console.log(label);
      let obj = { parameter: parameter, label: label };
      console.log(obj);
      inputArray.push(obj);
      console.log(inputArray);
      generateTable();
    }

    generateTable();
    function generateTable() {
      let genScreen = `<table>`;
      inputArray.forEach(function (item, index) {
        //console.log(item['parameter'])
        genScreen +=
          `<tr>
          <td>${item['parameter']} </td >
          <td>${item['label']}  </td>
          <td><button class="btn btn-xs">-</button></td>
        </tr > `;
      })
      genScreen += `
      <tr>
        <td><input type="text" class="form-control" id="paramName" /></td>
        <td><input type="text" class="form-control" id="labelName" /></td>
        <td><button class="btn btn-xs" onclick='addToInputArray()'>+</button></td>
      </tr>
      </table >`;
      //console.log(genScreen)
      document.getElementById("tbl-input").innerHTML = genScreen;
    }

    function generateProgramme() {
      let genScreen = `<table>`;
      inputArray.forEach(function (item, index) {
        //console.log(item['parameter'])
        genScreen +=
          `<tr>
          <td>${item['label']} : </td >
          <td><input type="text" /> </td>
        </tr > `;
      })
      genScreen += `</table >`;
      //console.log(genScreen)
      document.getElementById("section-programme").innerHTML = genScreen;
    }
  </script>

</body>

</html>