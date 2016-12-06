<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output
            method="html"
            encoding="UTF-8"
            indent="yes"
            doctype-public="-//W3C//DTD HTML 4.01//EN"
            doctype-system="http://www.w3.org/TR/html4/strict.dtd"/>

    <xsl:template match="/addressbook">
        <html>
            <head>
                <style>

                    <!-- css -->

                </style>
            </head>
            <body>
                <div id="zahlavie">
                    <h1><xsl:value-of select="@title"/></h1>
                </div>
                <div id="obsah">
                    <div id="text">
                        <xsl:apply-templates select="*"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:transform>