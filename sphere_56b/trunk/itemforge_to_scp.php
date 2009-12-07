<?

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
			writeln( "$token=$v" );
		else
			writeln( "$v" );
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

function writeItem($DB){
	writeln("//*****************************************************************************");
	writeln("//Item: ".$DB->f('itemdef') );
	writeln("//*****************************************************************************");
	writeln("//Rev: ".$DB->f('revision')." Ts: ".$DB->f('timestamp') );
	writeln("[ITEMDEF ".$DB->f('itemdef')."]");
	writeln("ID=".$DB->f('dispid'));
	writeln("NAME=".$DB->f('name'));
	writeln("CATEGORY=".$DB->f('category'));
	writeln("SUBSECTION=".$DB->f('subsection'));
	writeln("DESCRIPTION=".$DB->f('name'));
	writeln("WEIGHT=".$DB->f('weight'));
	writeln("VALUE=".$DB->f('value'));
	writeln("TYPE=".$DB->f('type'));
	writeln("RESOURCES=".$DB->f('resources'));
	writeln("SKILLMAKE=".$DB->f('skillmake'));
	writeln("LAYER=".$DB->f('layer'));
	writeln("PILE=".$DB->f('pile'));
	writeln("TDATA1=".$DB->f('tdata1'));
	writeln("TDATA2=".$DB->f('tdata2'));
	writeln("TDATA3=".$DB->f('tdata3'));
	writeln("TDATA4=".$DB->f('tdata4'));

	if( strlen($DB->f('dam')) > 0 )
		writeln("DAM=".$DB->f('dam'));
	else if( strlen($DB->f('armor')) > 0 )
		writeln("ARMOR=".$DB->f('armor'));

	writeln("SPEED=".$DB->f('speed'));
	writeln("SKILL=".$DB->f('skill'));
	writeln("REQSTR=".$DB->f('reqstr'));
	writeln("TWOHANDS=".$DB->f('twohands'));
//	writeln("TEVENTS=".$DB->f('tevents'));
	writeMultiLine("TEVENTS",$DB->f('tevents'));
	writeln("");
	writeln("ON=@CREATE");
	writeln("COLOR=".$DB->f('color'));
	writeMultiLine( "",$DB->f('create'));
	writeln("");
}

require("mysql.php");

$DB = new cMySql;
$DB->Database="mytserver";

$category = "";
$section = "";
$cnt = 0;
$fp = 0;

fileOpen();
writeFileHeader();

$DB->query("SELECT *, FORMAT(weight/10,1) AS weight FROM itemforge WHERE valid=1 ORDER BY category,subsection,name");
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