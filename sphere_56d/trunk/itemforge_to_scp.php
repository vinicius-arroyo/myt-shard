<?

//TODO: work on a tempfile to avoid corruption

function fileOpen(){
	global $fp;

	$fp = fopen("scripts/myt/itemforge_data.scp","w");
}

function fileClose(){
	global $fp;

	fclose($fp);
}

function writeln( $ln ){
	global $fp;
//	echo "$ln\n";
	fwrite( $fp,"$ln\n" );
}

function writeMultiLine($token,$data){
	$a = explode(";",$data);

	foreach( $a AS $v ){
		if( !$v )
			continue;

		if( $token )
			writeUtf8( "$token=$v" );
		else
			writeUtf8( "$v" );
	}
}

function writeFileHeader(){
	writeln("//*****************************************************************************");
	writeln("//*****************************************************************************");
	writeln("// ITEMFORGE - DATA");
	writeln("//");
	writeln("// Arquivo gerado automaticamente, não modifique!");
	writeln("//");
	writeln("// Gerado em: ".date("d/m/Y H:i")." pelo script versão 1");
	writeln("//*****************************************************************************");
}


function writeSectionHeader($cat,$sec){
	writeln("//*****************************************************************************");
	writeln("//*****************************************************************************");
	writeln("//Category: $cat -> $sec");
	writeln("//*****************************************************************************");
	writeln("//*****************************************************************************");
	writeln("");
}

function writeUtf8($s){
	writeln( utf8_encode( $s ) );
}

function writeItem($DB){
	writeUtf8("//*****************************************************************************");
	writeUtf8("//Item: ".$DB->f('itemdef') );
	writeUtf8("//*****************************************************************************");
	writeUtf8("//Rev: ".$DB->f('revision')." Ts: ".$DB->f('timestamp') );
	writeUtf8("[ITEMDEF ".$DB->f('itemdef')."]");
	writeUtf8("ID=".$DB->f('dispid'));
	writeUtf8("NAME=".$DB->f('name'));
	writeUtf8("CATEGORY=".$DB->f('category'));
	writeUtf8("SUBSECTION=".$DB->f('subsection'));
	writeUtf8("DESCRIPTION=".$DB->f('name'));
	writeUtf8("WEIGHT=".$DB->f('weight'));
	writeUtf8("VALUE=".$DB->f('value'));
	writeUtf8("TYPE=".$DB->f('type'));
	writeUtf8("RESOURCES=".$DB->f('resources'));
	writeUtf8("SKILLMAKE=".$DB->f('skillmake'));
	writeUtf8("LAYER=".$DB->f('layer'));
	writeUtf8("PILE=".$DB->f('pile'));
	writeUtf8("TDATA1=".$DB->f('tdata1'));
	writeUtf8("TDATA2=".$DB->f('tdata2'));
	writeUtf8("TDATA3=".$DB->f('tdata3'));
	writeUtf8("TDATA4=".$DB->f('tdata4'));

	if( strlen($DB->f('dam')) > 0 )
		writeUtf8("DAM=".$DB->f('dam'));
	else if( strlen($DB->f('armor')) > 0 )
		writeUtf8("ARMOR=".$DB->f('armor'));

	writeUtf8("SPEED=".$DB->f('speed'));
	writeUtf8("SKILL=".$DB->f('skill'));
	writeUtf8("REQSTR=".$DB->f('reqstr'));
	writeUtf8("TWOHANDS=".$DB->f('twohands'));
//	writeUtf8("TEVENTS=".$DB->f('tevents'));
	writeMultiLine("TEVENTS",$DB->f('tevents'));
	writeUtf8("");
	writeUtf8("ON=@CREATE");
	writeUtf8("COLOR=".$DB->f('color'));
	writeMultiLine( "",$DB->f('create'));
	writeUtf8("");
}

require("mysql.php");

$DB = new cMySql;
$DB->Database="mytserver";

$category = "";
$section = "";
$cnt = 0;
$fp = 0;


$DB->query("SELECT *, FORMAT(weight/10,1) AS weight FROM itemforge WHERE valid=1 ORDER BY category,subsection,name");

fileOpen();
writeFileHeader();

while( $DB->next_record() ){

	if( $DB->f('category') != $category  || $DB->f('subsection') != $section ){
		$category = $DB->f('category');
		$section = $DB->f('subsection');
		writeSectionHeader( $category, $section );
	}

	writeItem( $DB );
	$cnt++;
}

writeln("[EOF]");
fileClose();

//echo "$cnt items exportados";
?>
