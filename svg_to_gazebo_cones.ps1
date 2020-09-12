[System.Xml.XmlDocument] $xdoc = new-object System.Xml.XmlDocument
$file = Resolve-Path C:\Users\Hiero\Desktop\gokart_track.xml
$xdoc.Load($file)

$Doc = New-Object System.Xml.XmlDocument

$Doc.AppendChild($Doc.CreateElement("cones"))

$blue_cones = $xdoc.svg.left.ChildNodes

$count = 0;
ForEach($i in $blue_cones) {


[xml]$child = @"
<model name='blue_cone_$count'>
    <pose>$($i.x) $(-1*$i.y) 0 0 0 0</pose>
    <include>
         <uri>model:///blue_cone</uri>
    </include>
</model>
"@

$count++


$Doc.DocumentElement.AppendChild($Doc.ImportNode($child.LastChild,$true))
}

$yellow_cones = $xdoc.svg.right.ChildNodes
$count = 0;

ForEach($i in $yellow_cones) {


[xml]$child = @"
<model name='yellow_cone_$count'>
    <pose>$($i.x) $(-1*$i.y) 0 0 0 0</pose>
    <include>
         <uri>model:///yellow_cone</uri>
    </include>
</model>
"@

$count++


$Doc.DocumentElement.AppendChild($Doc.ImportNode($child.LastChild,$true))
}


$path = Resolve-Path C:\Users\Hiero\Desktop\test.xml

$Doc.Save($path)