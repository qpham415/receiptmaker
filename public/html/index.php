<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta name="description" content="This is a fillable and printable work order / receipt. No download required. Automatic math calculation." />
    <link rel="stylesheet" href="reset-fonts-grids.css" type="text/css" />
    <link rel="stylesheet" href="style.css" type="text/css" />	
    <script type='text/javascript' src='jquery-1.4.2.js'></script>
    <script type='text/javascript' src='script.js'></script>
    <script type="text/javascript" src="ui/jquery.ui.core.js"></script>
    <script type="text/javascript" src="ui/jquery.ui.datepicker.js"></script>
    <link type="text/css" href="ui/ui-lightness/jquery.ui.all.css" rel="stylesheet" />
    <link type="text/css" href="demos.css" rel="stylesheet" />
    <script type="text/javascript">
    $(function() {
      $("#datepicker").datepicker();
    });
    </script>
    <style>
    @media print {
      #addrow {
        display: none;
      }
      #data th {
        border: 1px solid #984705;
      } 
    }
    </style>    
    <title>Free Receipt Maker</title>
    <!-- GOOGLE ANALYTICS --> 
    <script type="text/javascript"> 
      window.google_analytics_uacct = "UA-807594-33";
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-807594-33']);
      _gaq.push(['_trackPageview']);
 
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    </script> 
    <!-- GOOGLE ANALYTICS -->
  </head>
  <body>
      <div id="thead" class="no-print" style='width: 728px;margin: auto; padding: 30px 0;'> 
        <script type="text/javascript"><!--
google_ad_client = "pub-7736238313527981";
/* invoicetemplatefree 728 */
google_ad_slot = "9558536204";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>      </div> 
    <div id="pagewrap">
      <div id="workorder" style="margin:0">Receipt</div>
      <div id="header">
        <div id="logo">
          <img id="image" src="images/logo.jpg" alt="logo" height=100px />
        </div>
        <div id="logoclick">
          <div class="logobutton"><a id="changelogo" href="javascript:;">Change Logo</a></div>
          <div class="logobutton"><a id="deletelogo" href="javascript:;">Delete Logo</a></div>
          <div class="logobutton"><a id="cancellogo" href="javascript:;">Cancel</a></div>
        </div>
        <div id="changeform">
          <div class="logobutton"><a id="changesave" href="javascript:;">Save Logo</a></div>
          <div class="logobutton"><a id="changecancel" href="javascript:;">Cancel</a></div>
          <div class="clear"></div>
          <div id="imageinput"><input id="imageloc" type="text" value="" size="50"></div>
          <div class="clear"></div>
          <div id="imageinstr">Enter Logo URL</div>
        </div>  
        <table id="meta">
          <tbody>
            <tr>
              <td class="meta-head">Date</td>
              <td>
                <input type="text" id="datepicker" value="[Enter a Date]" />
              </td>
            </tr>
            <tr>
              <td class="meta-head">W.O. #</td>
              <td><input type="text" value="[100]" /></td>
            </tr>
          </tbody>
        </table>
        <div class="clear"></div>
      </div>
        <div id="line"></div>
        <div id="address">
          <div class="label" id="label-left">FROM</div>
            <textarea class="companyinfo" rows="6" cols="34">
[Your Company Name] 
[Street Address] 
[City, ST Zip Code]
Phone [000-000-0000] 
Fax [000-000-0000] 
[e-mail]</textarea>
          <div class="label">TO</div>
            <textarea class="companyinfo" rows="6" cols="34">
[Name] 
[Company Name] 
[Street Address] 
[City, ST Zip Code] 
Phone [000-000-0000] 
Customer ID [ABC123]</textarea>
          <div class="label">JOB</div>
            <textarea class="companyinfo" rows="6" cols="28">
[Your Job Description]
            </textarea>
        </div>
        <div class="clear"></div>
      <table id="data">
        <thead>
          <tr>
            <th id="cancelh"></th>
            <th id="qty">Qty</th>
            <th id="description">Description</th>
            <th id="price">Unit Price</th>
            <th id="total">Line Total</th>
          </tr>          
        </thead>
        <tbody>
          <tr class="odd data-row">
            <td class="cancelcell">
               <a class="cancel" href="javascript:;" ></a>
            </td>
            <td>
              <div class="wrapper">
                <input type="text" class="qty-value"/>
              </div>
            </td>
            <td>
              <div class="wrapper">
              <input type="text" />
              </div>
            </td>
            <td>
              <div class="wrapper">
              <input type="text" class="price-value"/>
              </div>
            </td>
            <td>
              <div class="wrapper">
              <input type="text" class="linetotal" />
              </div>
            </td>              
          </tr>
          <tr class="even data-row">
            <td class="cancelcell">
               <a class="cancel" href="javascript:;" ></a>
            </td>
            <td>
              <div class="wrapper">
                <input type="text" class="qty-value"/>
              </div>
            </td>
            <td>
              <div class="wrapper">
              <input type="text" />
              </div>
            </td>
            <td>
              <div class="wrapper">
              <input type="text" class="price-value"/>
              </div>
            </td>
            <td>
              <div class="wrapper">
              <input type="text" class="linetotal" />
              </div>
            </td>              
          </tr>
          <tr class="odd data-row">
            <td class="cancelcell">
               <a class="cancel" href="javascript:;" ></a>
            </td>
            <td>
              <div class="wrapper">
                <input type="text" class="qty-value"/>
              </div>
            </td>
            <td>
              <div class="wrapper">
              <input type="text" />
              </div>
            </td>
            <td>
              <div class="wrapper">
              <input type="text" class="price-value"/>
              </div>
            </td>
            <td>
              <div class="wrapper">
              <input type="text" class="linetotal" />
              </div>
            </td>              
          </tr>
          <tr class="even data-row" id="fakerow">
            <td class="cancelcell">
               <a class="cancel" href="javascript:;" ></a>
            </td>
            <td>
              <div class="wrapper">
                <input type="text" class="qty-value"/>
              </div>
            </td>
            <td>
              <div class="wrapper">
              <input type="text" />
              </div>
            </td>
            <td>
              <div class="wrapper">
              <input type="text" class="price-value"/>
              </div>
            </td>
            <td>
              <div class="wrapper">
              <input type="text" class="linetotal" />
              </div>
            </td>              
          </tr>
          <tr>
            <td class="nocancel"></td>
            <td id="add" colspan="4"><a id="addrow" href="javascript:;">Add Row</a></td>             
          </tr>
          <tr class="even">
            <td class="nocancel"></td>
            <td id="subtotal" colspan="3">Subtotal</td>
            <td>
              <div class="wrapperbottom">
              <input type="text" id="subtotal-value"/>
              </div>
            </td>              
          </tr>
          <tr>
            <td class="nocancel"></td>
            <td id="taxes" colspan="3">Sales Tax</td>
            <td>
              <div class="wrapperbottom">
              <input type="text" id="tax-value"/>
              </div>
            </td>              
          </tr>
          <tr class="even">
            <td class="nocancel"></td>
            <td id="finaltotal" colspan="3">Total</td>
            <td>
              <div class="wrapperbottom">
              <input type="text" id="total-value"/>
              </div>
            </td>              
          </tr>                                                                                         
        </tbody>                                        
      </table>  
      <div id="payable">Make all checks payable to 
        <input type="text" value="[Your Company Name]" />
      </div>
      <div id="thankyou">Thank you for your business!</div>
    </div>
  </body>  
</html>
