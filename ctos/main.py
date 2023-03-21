from lxml import etree
import pdfkit

# Load the XML and XSL files
xml_file = "ctos_sample_1.xml"
xsl_file = "ctos_report.xsl"
xml_doc = etree.parse(xml_file)
xslt_doc = etree.parse(xsl_file)

# Transform the XML using the XSLT and get the resulting HTML
transform = etree.XSLT(xslt_doc)
html_doc = transform(xml_doc)

# Convert the HTML to PDF
pdfkit.from_string(str(html_doc), "output.pdf")

