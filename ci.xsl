<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="library/general.xsl"/>
<xsl:include href="library/quick_purchase.xsl"/>
  <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="xml/input_request/search_name" /></title>
          <style type="text/css">
            <xsl:value-of select="document('library/xslt2.css')" disable-output-escaping="yes" />
          </style>
		<xsl:call-template name="xsl_link" />
      </head>
      <body>
		<div class="wrapper">
			<table width="100%">
				<tr>
					<td align="left"><img src="http://img.experian.com.my/ExperianLogo.png" width="176px" height="59px" /></td>
					<td align="right" valign="bottom" class="italic-bold"><p>CrediTrack by Experian</p><p><xsl:value-of select="xml/report_date"/></p></td>
				</tr>
			</table>
            <p class="h1">COMPANY INTELLIGENCE – (CI)</p>
            <xsl:apply-templates/>
			<br /><br /><br />
			<xsl:call-template name="bottom_term" />			
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>