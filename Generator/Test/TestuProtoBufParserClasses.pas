unit TestuProtoBufParserClasses;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework,
  System.Classes,
  System.Generics.Collections,
  uProtoBufParserClasses,
  uProtoBufParserAbstractClasses;

type
  //anchestor class:
  TestTAbstractProtoBufParserItem = class(TTestCase)
  strict protected
    FLastiPos: Integer;
  public
    procedure CallParseFromProto(const Proto: string; AParserItem: TAbstractProtoBufParserItem);

    property LastiPos: Integer read FLastiPos;
  end;
  // Test methods for class TProtoBufPropOption

  TestTProtoBufPropOption = class(TTestCase)
  strict private
    FProtoBufPropOption: TProtoBufPropOption;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;
  // Test methods for class TProtoBufPropOptions

  TestTProtoBufPropOptions = class(TTestCase)
  strict private
    FProtoBufPropOptions: TProtoBufPropOptions;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;
  // Test methods for class TProtoBufProperty

  TestTProtoBufProperty = class(TTestCase)
  strict private
    FProtoBufProperty: TProtoBufProperty;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParseFromProto;
  end;
  // Test methods for class TProtoBufEnumValue

  TestTProtoBufEnumValue = class(TestTAbstractProtoBufParserItem)
  strict private
    FProtoBufEnumValue: TProtoBufEnumValue;

    procedure ParserErrorEnumValueNameMissing;
    procedure ParserErrorEnumValueEqualsMissing;
    procedure ParserErrorEnumValueValueMissing;
    procedure ParserErrorEnumValueTerminatorMissing;
    procedure ParserErrorEnumValueStrToIntFailure;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParseFromProto;
    procedure TestParseFromProtoHexValue;
    procedure TestParseFromProtoErrors;
  end;
  // Test methods for class TProtoBufEnum

  TestTProtoBufEnum = class(TTestCase)
  strict private
    FProtoBufEnum: TProtoBufEnum;
    FLastiPos: Integer;

    procedure ParserErrorOptionNameMissing;
    procedure ParserErrorOptionEqualsMissing;
    procedure ParserErrorOptionValueMissing;
    procedure ParserErrorOptionTerminatorMissing;
    procedure ParserErrorOptionUnknownOptionName;
  private
    procedure CallParseFromProto(const AProto: string);
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParseFromProto;
    procedure TestEnumAliasOption;
    procedure TestEnumAliasOptionParserErrors;
  end;
  // Test methods for class TProtoBufOne

  TestTProtoBufOneOf = class(TestTAbstractProtoBufParserItem)
  strict private
    FProtoBufProperty: TProtoBufProperty;

    procedure ParserErrorNameMissing;
    procedure ParserErrorOpenBracketMissing;
    procedure ParserErrorUnexpectedFieldNumber;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParseFromProto;
  end;
  // Test methods for class TProtoBufMessage

  TestTProtoBufMessage = class(TTestCase)
  strict private
    FProtoBufMessage: TProtoBufMessage;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParseFromProto;
  end;
  // Test methods for class TProtoBufEnumList

  TestTProtoBufEnumList = class(TTestCase)
  strict private
    FProtoBufEnumList: TProtoBufEnumList;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;
  // Test methods for class TProtoBufMessageList

  TestTProtoBufMessageList = class(TTestCase)
  strict private
    FProtoBufMessageList: TProtoBufMessageList;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;
  // Test methods for class TProtoFile

  TestTProtoFile = class(TTestCase)
  strict private
    FProtoFile: TProtoFile;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestParseFromProto;
    procedure TestParseFromProto1;
    procedure TestNestedEnum;
    procedure TestParseSyntaxReservedWord;
  end;

implementation

uses
  System.SysUtils;

{ TestTAbstractProtoBufParserItem }

procedure TestTAbstractProtoBufParserItem.CallParseFromProto(
  const Proto: string; AParserItem: TAbstractProtoBufParserItem);
begin
  FLastiPos:= 1;
  AParserItem.ParseFromProto(Proto, FLastiPos);
end;

procedure TestTProtoBufPropOption.SetUp;
begin
  FProtoBufPropOption := TProtoBufPropOption.Create(nil);
end;

procedure TestTProtoBufPropOption.TearDown;
begin
  FProtoBufPropOption.Free;
  FProtoBufPropOption := nil;
end;

procedure TestTProtoBufPropOptions.SetUp;
begin
  FProtoBufPropOptions := TProtoBufPropOptions.Create(nil);
end;

procedure TestTProtoBufPropOptions.TearDown;
begin
  FProtoBufPropOptions.Free;
  FProtoBufPropOptions := nil;
end;

procedure TestTProtoBufProperty.SetUp;
begin
  FProtoBufProperty := TProtoBufProperty.Create(nil);
end;

procedure TestTProtoBufProperty.TearDown;
begin
  FProtoBufProperty.Free;
  FProtoBufProperty := nil;
end;

procedure TestTProtoBufProperty.TestParseFromProto;
var
  iPos: Integer;
  Proto: string;
begin
  iPos := 1;
  Proto := 'int32 DefField1  = 1;';
  // TODO: Setup method call parameters
  FProtoBufProperty.ParseFromProto(Proto, iPos);
  // TODO: Validate method results
  CheckTrue(ptDefaultOptional = FProtoBufProperty.PropKind);
  CheckEquals('int32', FProtoBufProperty.PropType);
  CheckEquals('DefField1', FProtoBufProperty.Name);
  CheckEquals(1, FProtoBufProperty.PropFieldNum);
  CheckEquals(0, FProtoBufProperty.PropOptions.Count);
  CheckEquals('', FProtoBufProperty.PropComment);

  iPos := 1;
  Proto := 'int32 DefField1=1;';
  // TODO: Setup method call parameters
  FProtoBufProperty.ParseFromProto(Proto, iPos);
  // TODO: Validate method results
  CheckTrue(ptDefaultOptional = FProtoBufProperty.PropKind);
  CheckEquals('int32', FProtoBufProperty.PropType);
  CheckEquals('DefField1', FProtoBufProperty.Name);
  CheckEquals(1, FProtoBufProperty.PropFieldNum);
  CheckEquals(0, FProtoBufProperty.PropOptions.Count);
  CheckEquals('', FProtoBufProperty.PropComment);

  iPos := 1;
  Proto := 'optional int32   DefField1  = 1  [default = Val2, packed = true  ]; // def field 1, default value 2';
  // TODO: Setup method call parameters
  FProtoBufProperty.ParseFromProto(Proto, iPos);
  // TODO: Validate method results
  CheckTrue(ptOptional = FProtoBufProperty.PropKind);
  CheckEquals('int32', FProtoBufProperty.PropType);
  CheckEquals('DefField1', FProtoBufProperty.Name);
  CheckEquals(1, FProtoBufProperty.PropFieldNum);
  CheckEquals(2, FProtoBufProperty.PropOptions.Count);
  CheckEquals('default', FProtoBufProperty.PropOptions[0].Name);
  CheckEquals('Val2', FProtoBufProperty.PropOptions[0].OptionValue);
  CheckEquals('packed', FProtoBufProperty.PropOptions[1].Name);
  CheckEquals('true', FProtoBufProperty.PropOptions[1].OptionValue);
  CheckEquals('def field 1, default value 2', Trim(FProtoBufProperty.PropComment));

  iPos := 1;
  Proto := 'optional int32   DefField1  = 1  [default = Val2, packed = "true"" value"""'#13#10' ]; // def field 1, default value 2';
  // TODO: Setup method call parameters
  FProtoBufProperty.ParseFromProto(Proto, iPos);
  // TODO: Validate method results
  CheckTrue(ptOptional = FProtoBufProperty.PropKind);
  CheckEquals('int32', FProtoBufProperty.PropType);
  CheckEquals('DefField1', FProtoBufProperty.Name);
  CheckEquals(1, FProtoBufProperty.PropFieldNum);
  CheckEquals(2, FProtoBufProperty.PropOptions.Count);
  CheckEquals('default', FProtoBufProperty.PropOptions[0].Name);
  CheckEquals('Val2', FProtoBufProperty.PropOptions[0].OptionValue);
  CheckEquals('packed', FProtoBufProperty.PropOptions[1].Name);
  CheckEquals('"true"" value"""', FProtoBufProperty.PropOptions[1].OptionValue);
  CheckEquals('def field 1, default value 2', Trim(FProtoBufProperty.PropComment));

  iPos := 1;
  Proto := 'required   int32   DefField1  = 1  [default = Val2, packed = "true value" ]; // def field 1, default value 2';
  // TODO: Setup method call parameters
  FProtoBufProperty.ParseFromProto(Proto, iPos);
  // TODO: Validate method results
  CheckTrue(ptRequired = FProtoBufProperty.PropKind);
  CheckEquals('int32', FProtoBufProperty.PropType);
  CheckEquals('DefField1', FProtoBufProperty.Name);
  CheckEquals(1, FProtoBufProperty.PropFieldNum);
  CheckEquals(2, FProtoBufProperty.PropOptions.Count);
  CheckEquals('default', FProtoBufProperty.PropOptions[0].Name);
  CheckEquals('Val2', FProtoBufProperty.PropOptions[0].OptionValue);
  CheckEquals('packed', FProtoBufProperty.PropOptions[1].Name);
  CheckEquals('"true value"', FProtoBufProperty.PropOptions[1].OptionValue);
  CheckEquals('def field 1, default value 2', Trim(FProtoBufProperty.PropComment));

  iPos := 1;
  Proto := 'repeated   string   DefField1  = 1  [default = "Va""l2" , packed = true ]; // def field 1, default value 2';
  // TODO: Setup method call parameters
  FProtoBufProperty.ParseFromProto(Proto, iPos);
  // TODO: Validate method results
  CheckTrue(ptRepeated = FProtoBufProperty.PropKind);
  CheckEquals('string', FProtoBufProperty.PropType);
  CheckEquals('DefField1', FProtoBufProperty.Name);
  CheckEquals(1, FProtoBufProperty.PropFieldNum);
  CheckEquals(2, FProtoBufProperty.PropOptions.Count);
  CheckEquals('default', FProtoBufProperty.PropOptions[0].Name);
  CheckEquals('"Va""l2"', FProtoBufProperty.PropOptions[0].OptionValue);
  CheckEquals('packed', FProtoBufProperty.PropOptions[1].Name);
  CheckEquals('true', FProtoBufProperty.PropOptions[1].OptionValue);
  CheckEquals('def field 1, default value 2', Trim(FProtoBufProperty.PropComment));
end;

procedure TestTProtoBufEnumValue.ParserErrorEnumValueEqualsMissing;
begin
  CallParseFromProto('Enum1 1;', FProtoBufEnumValue);
end;

procedure TestTProtoBufEnumValue.ParserErrorEnumValueNameMissing;
begin
  CallParseFromProto('= 1;', FProtoBufEnumValue);
end;

procedure TestTProtoBufEnumValue.ParserErrorEnumValueStrToIntFailure;
begin
  CallParseFromProto('Enum1= ThisIsNoInteger', FProtoBufEnumValue);
end;

procedure TestTProtoBufEnumValue.ParserErrorEnumValueTerminatorMissing;
begin
  CallParseFromProto('Enum1= 1', FProtoBufEnumValue);
end;

procedure TestTProtoBufEnumValue.ParserErrorEnumValueValueMissing;
begin
  CallParseFromProto('Enum1= ;', FProtoBufEnumValue);
end;

procedure TestTProtoBufEnumValue.SetUp;
begin
  FProtoBufEnumValue := TProtoBufEnumValue.Create(nil);
end;

procedure TestTProtoBufEnumValue.TearDown;
begin
  FProtoBufEnumValue.Free;
  FProtoBufEnumValue := nil;
end;

procedure TestTProtoBufEnumValue.TestParseFromProto;
begin
  CallParseFromProto('Enum1 = 1;', FProtoBufEnumValue);
  CheckEquals('Enum1', FProtoBufEnumValue.Name);
  CheckEquals(1, FProtoBufEnumValue.Value);
  CheckFalse(FProtoBufEnumValue.IsHexValue, 'HexValue recognized');

  CallParseFromProto('Enum1=1;', FProtoBufEnumValue);
  CheckEquals('Enum1', FProtoBufEnumValue.Name);
  CheckEquals(1, FProtoBufEnumValue.Value);
  CheckFalse(FProtoBufEnumValue.IsHexValue, 'HexValue recognized');

  CallParseFromProto('Enum1=1 ;', FProtoBufEnumValue);
  CheckEquals('Enum1', FProtoBufEnumValue.Name);
  CheckEquals(1, FProtoBufEnumValue.Value);
  CheckFalse(FProtoBufEnumValue.IsHexValue, 'HexValue recognized');

  CallParseFromProto('  Enum1 = 1  ;', FProtoBufEnumValue);
  CheckEquals('Enum1', FProtoBufEnumValue.Name);
  CheckEquals(1, FProtoBufEnumValue.Value);
  CheckFalse(FProtoBufEnumValue.IsHexValue, 'HexValue recognized');
end;

procedure TestTProtoBufEnumValue.TestParseFromProtoErrors;
begin
  CheckException(ParserErrorEnumValueNameMissing, Exception, 'missing enum value name must cause exception');
  CheckException(ParserErrorEnumValueEqualsMissing, Exception, 'missing equal sign for enum value must cause exception');
  CheckException(ParserErrorEnumValueValueMissing, Exception, 'missing enum value must cause exception');
  CheckException(ParserErrorEnumValueTerminatorMissing, Exception, 'missing enum value terminator must cause exception');
  CheckException(ParserErrorEnumValueStrToIntFailure, Exception, 'incorrect string enum value must cause exception');
end;

procedure TestTProtoBufEnumValue.TestParseFromProtoHexValue;
begin
  CallParseFromProto('Enum1 = 0x02;', FProtoBufEnumValue);
  CheckEquals('Enum1', FProtoBufEnumValue.Name);
  CheckEquals($02, FProtoBufEnumValue.Value);
  Check(FProtoBufEnumValue.IsHexValue, 'HexValue not recognized');

  CallParseFromProto('Enum1 = 0xABCD  ;', FProtoBufEnumValue);
  CheckEquals('Enum1', FProtoBufEnumValue.Name);
  CheckEquals($ABCD, FProtoBufEnumValue.Value);
  Check(FProtoBufEnumValue.IsHexValue, 'HexValue not recognized');
end;

procedure TestTProtoBufEnum.CallParseFromProto(const AProto: string);
begin
  FLastiPos:= 1;
  FProtoBufEnum.ParseFromProto(AProto, FLastiPos);
end;

procedure TestTProtoBufEnum.ParserErrorOptionEqualsMissing;
begin
  CallParseFromProto('Enum1{'#13#10'  option allow_alias; ');
end;

procedure TestTProtoBufEnum.ParserErrorOptionNameMissing;
begin
  CallParseFromProto('Enum1{'#13#10'  option; ');
end;

procedure TestTProtoBufEnum.ParserErrorOptionTerminatorMissing;
begin
  CallParseFromProto('Enum1{'#13#10'  option allow_alias = true '#13#10'  newvalue = 1');
end;

procedure TestTProtoBufEnum.ParserErrorOptionUnknownOptionName;
begin
  CallParseFromProto('Enum1{'#13#10'  option unknown = true;');
end;

procedure TestTProtoBufEnum.ParserErrorOptionValueMissing;
begin
  CallParseFromProto('Enum1{'#13#10'  option allow_alias = ;');
end;

procedure TestTProtoBufEnum.SetUp;
begin
  FProtoBufEnum := TProtoBufEnum.Create(nil);
end;

procedure TestTProtoBufEnum.TearDown;
begin
  FProtoBufEnum.Free;
  FProtoBufEnum := nil;
end;

procedure TestTProtoBufEnum.TestEnumAliasOption;
begin
  CallParseFromProto('Enum1{'#13#10'  option allow_alias = true; '#13#10'  Val1 = 1 ;'#13#10'  Val2= 2 ;'#13#10'  }');
  CheckEquals('Enum1', FProtoBufEnum.Name);
  Check(FProtoBufEnum.AllowAlias, 'AllowAlias not set');
  CheckEquals(2, FProtoBufEnum.Count);
  CheckEquals('Val1', FProtoBufEnum[0].Name);
  CheckEquals(1, FProtoBufEnum[0].Value);
  CheckEquals('Val2', FProtoBufEnum[1].Name);
  CheckEquals(2, FProtoBufEnum[1].Value);

  CallParseFromProto('Enum1{'#13#10'  option allow_alias = false; '#13#10'  Val1 = 1 ;'#13#10'  Val2= 2 ;'#13#10'  }');
  CheckEquals('Enum1', FProtoBufEnum.Name);
  Check(not FProtoBufEnum.AllowAlias, 'AllowAlias must be false');
  CheckEquals(2, FProtoBufEnum.Count);
  CheckEquals('Val1', FProtoBufEnum[0].Name);
  CheckEquals(1, FProtoBufEnum[0].Value);
  CheckEquals('Val2', FProtoBufEnum[1].Name);
  CheckEquals(2, FProtoBufEnum[1].Value);
end;

procedure TestTProtoBufEnum.TestEnumAliasOptionParserErrors;
begin
  CheckException(ParserErrorOptionNameMissing, Exception, 'missing option name must cause exception');
  CheckException(ParserErrorOptionEqualsMissing, Exception, 'missing equal sign for option must cause exception');
  CheckException(ParserErrorOptionValueMissing, Exception, 'missing option value must cause exception');
  CheckException(ParserErrorOptionTerminatorMissing, Exception, 'missing option terminator must cause exception');
  CheckException(ParserErrorOptionUnknownOptionName, Exception, 'unsupported option name must cause exception');
end;

procedure TestTProtoBufEnum.TestParseFromProto;
begin
  CallParseFromProto('Enum1{Val1=1;Val2=2;}');
  CheckEquals('Enum1', FProtoBufEnum.Name);
  CheckEquals(2, FProtoBufEnum.Count);
  CheckEquals('Val1', FProtoBufEnum[0].Name);
  CheckEquals(1, FProtoBufEnum[0].Value);
  CheckEquals('Val2', FProtoBufEnum[1].Name);
  CheckEquals(2, FProtoBufEnum[1].Value);

  CallParseFromProto('Enum1  {Val1=1;Val2=2;}');
  CheckEquals('Enum1', FProtoBufEnum.Name);
  CheckEquals(2, FProtoBufEnum.Count);
  CheckEquals('Val1', FProtoBufEnum[0].Name);
  CheckEquals(1, FProtoBufEnum[0].Value);
  CheckEquals('Val2', FProtoBufEnum[1].Name);
  CheckEquals(2, FProtoBufEnum[1].Value);

  CallParseFromProto('Enum1  {  Val1=1;Val2=2;}');
  CheckEquals('Enum1', FProtoBufEnum.Name);
  CheckEquals(2, FProtoBufEnum.Count);
  CheckEquals('Val1', FProtoBufEnum[0].Name);
  CheckEquals(1, FProtoBufEnum[0].Value);
  CheckEquals('Val2', FProtoBufEnum[1].Name);
  CheckEquals(2, FProtoBufEnum[1].Value);

  CallParseFromProto('Enum1{Val1 = 1 ; Val2= 2 ;  }');
  CheckEquals('Enum1', FProtoBufEnum.Name);
  CheckEquals(2, FProtoBufEnum.Count);
  CheckEquals('Val1', FProtoBufEnum[0].Name);
  CheckEquals(1, FProtoBufEnum[0].Value);
  CheckEquals('Val2', FProtoBufEnum[1].Name);
  CheckEquals(2, FProtoBufEnum[1].Value);

  CallParseFromProto('Enum1{'#13#10'  Val1 = 1 ;'#13#10'  Val2= 2 ;'#13#10'  }');
  CheckEquals('Enum1', FProtoBufEnum.Name);
  CheckEquals(2, FProtoBufEnum.Count);
  CheckEquals('Val1', FProtoBufEnum[0].Name);
  CheckEquals(1, FProtoBufEnum[0].Value);
  CheckEquals('Val2', FProtoBufEnum[1].Name);
  CheckEquals(2, FProtoBufEnum[1].Value);
end;

procedure TestTProtoBufMessage.SetUp;
begin
  FProtoBufMessage := TProtoBufMessage.Create(nil);
end;

procedure TestTProtoBufMessage.TearDown;
begin
  FProtoBufMessage.Free;
  FProtoBufMessage := nil;
end;

procedure TestTProtoBufMessage.TestParseFromProto;
var
  Proto: string;
  iPos: Integer;
begin
  Proto := 'TestMsg0 { required int32 Field1 = 1; required int64 Field2 = 2; }';
  iPos := 1;
  FProtoBufMessage.ParseFromProto(Proto, iPos);
  CheckEquals('TestMsg0', FProtoBufMessage.Name);
  CheckEquals(2, FProtoBufMessage.Count);
  CheckEquals('Field1', FProtoBufMessage[0].Name);
  CheckEquals('Field2', FProtoBufMessage[1].Name);
end;

procedure TestTProtoBufEnumList.SetUp;
begin
  FProtoBufEnumList := TProtoBufEnumList.Create;
end;

procedure TestTProtoBufEnumList.TearDown;
begin
  FProtoBufEnumList.Free;
  FProtoBufEnumList := nil;
end;

procedure TestTProtoBufMessageList.SetUp;
begin
  FProtoBufMessageList := TProtoBufMessageList.Create;
end;

procedure TestTProtoBufMessageList.TearDown;
begin
  FProtoBufMessageList.Free;
  FProtoBufMessageList := nil;
end;

procedure TestTProtoFile.SetUp;
begin
  FProtoFile := TProtoFile.Create(nil);
end;

procedure TestTProtoFile.TearDown;
begin
  FProtoFile.Free;
  FProtoFile := nil;
end;

procedure TestTProtoFile.TestNestedEnum;
var
  Proto: string;
  iPos: Integer;
begin
  Proto := '//   * Bytes type e.g. optional bytes   DefField10 = 10 [default = "123"];'#13#10 + //
    #13#10 + //
    'package test1;'#13#10 + //
    #13#10 + //
  // 'import "TestImport1.proto";'#13#10 + //
  // #13#10 + //
    '// enumeration'#13#10 + //
    'enum EnumG0 {'#13#10 + //
    '  // enum value 1'#13#10 + 'g1 = 1;'#13#10 + //
    'g2 = 2;'#13#10 + //
    '}'#13#10;
  Proto := Proto + 'message TestMsg1 {' + #13#10 + '' + #13#10 + '// fields with defaults' + #13#10 + 'optional int32   DefField1  = 1  [default = 2];'#13#10 +
    'optional int64   DefField2  = 2  [default = -1];'#13#10 + 'message NestedMsg0 { '#13#10 + '    optional int32 NestedField1 = 1; }' +
    'optional string  DefField3  = 3  [default = "yes it is"];'#13#10 + 'optional double  DefField4  = 4  [default = 1.1];'#13#10 +
    'optional bool    DefField5  = 5  [default = true];'#13#10 + 'optional EnumG0  DefField6  = 6  [default = g2];'#13#10 +
    'optional sint64  DefField7  = 7  [default = 100];'#13#10 + 'optional fixed32 DefField8  = 8  [default = 1];'#13#10 +
    'optional float   DefField9  = 9  [default = 1.23e1];'#13#10 + ''#13#10 + '// field of message type'#13#10 + 'optional NestedMsg0 FieldMsg0  = 20;'#13#10 +
    ''#13#10 + '// repeated fields'#13#10 + 'repeated int32    FieldArr1  = 40;'#13#10 + 'repeated int32    FieldArr2  = 41 [packed = true];'#13#10 +
    'repeated string   FieldArr3  = 42;'#13#10 + 'repeated Enum1    FieldArrE1 = 43;'#13#10 + 'repeated TestMsg0 FieldMArr2 = 44;'#13#10 + ''#13#10 +
    '// fields of imported types'#13#10 + 'optional EnumGlobal             FieldImp2 = 51;'#13#10 + ''#13#10 + '// extensions 1000 to 1999;'#13#10 + '}';

  iPos := 1;
  FProtoFile.ParseFromProto(Proto, iPos);

  CheckEquals('test1', FProtoFile.Name);
  CheckEquals(1, FProtoFile.ProtoBufEnums.Count);
  CheckEquals('EnumG0', FProtoFile.ProtoBufEnums[0].Name);
  CheckEquals(2, FProtoFile.ProtoBufMessages.Count);
  CheckEquals('NestedMsg0', FProtoFile.ProtoBufMessages[0].Name);
  CheckEquals(1, FProtoFile.ProtoBufMessages[0].Count);
  CheckEquals('TestMsg1', FProtoFile.ProtoBufMessages[1].Name);
  CheckEquals(16, FProtoFile.ProtoBufMessages[1].Count);

  // all others check tested in TestuProtoBufParserClasses.pas
end;

procedure TestTProtoFile.TestParseFromProto;
var
  Proto: string;
  iPos: Integer;
begin
  Proto := '//   * Bytes type e.g. optional bytes   DefField10 = 10 [default = "123"];'#13#10 + //
    #13#10 + //
    'package test1;'#13#10 + //
    #13#10 + //
  // 'import "TestImport1.proto";'#13#10 + //
  // #13#10 + //
    '// enumeration'#13#10 + //
    'enum EnumG0 {'#13#10 + //
    '  // enum value 1'#13#10 + 'g1 = 1;'#13#10 + //
    'g2 = 2;'#13#10 + //
    '};';
  iPos := 1;
  FProtoFile.FileName := ChangeFileExt(ParamStr(0), '.proto');
  FProtoFile.ParseFromProto(Proto, iPos);

  CheckEquals('test1', FProtoFile.Name);
  CheckEquals(1, FProtoFile.ProtoBufEnums.Count);
  CheckEquals('EnumG0', FProtoFile.ProtoBufEnums[0].Name);
end;

procedure TestTProtoFile.TestParseFromProto1;
var
  Proto: string;
  iPos: Integer;
begin
  Proto := '//   * Bytes type e.g. optional bytes   DefField10 = 10 [default = "123"];'#13#10 + //
    #13#10 + //
    'package test1;'#13#10 + //
    #13#10 + //
  // 'import "TestImport1.proto";'#13#10 + //
  // #13#10 + //
    '// enumeration'#13#10 + //
    'enum EnumG0 {'#13#10 + //
    '  // enum value 1'#13#10 + 'g1 = 1;'#13#10 + //
    'g2 = 2;'#13#10 + //
    '}'#13#10;
  Proto := Proto + 'message TestMsg1 {' + #13#10 + '' + #13#10 + '// fields with defaults' + #13#10 + 'optional int32   DefField1  = 1  [default = 2];' + #13#10
    + 'optional int64   DefField2  = 2  [default = -1];' + #13#10 + 'optional string  DefField3  = 3  [default = "yes it is"];' + #13#10 +
    'optional double  DefField4  = 4  [default = 1.1];' + #13#10 + 'optional bool    DefField5  = 5  [default = true];' + #13#10 +
    'optional EnumG0  DefField6  = 6  [default = g2];' + #13#10 + 'optional sint64  DefField7  = 7  [default = 100];' + #13#10 +
    'optional fixed32 DefField8  = 8  [default = 1];' + #13#10 + 'optional float   DefField9  = 9  [default = 1.23e1];' + #13#10 + '' + #13#10 +
    '// field of message type' + #13#10 + 'optional TestMsg0 FieldMsg1  = 20;' + #13#10 + '' + #13#10 + '// repeated fields' + #13#10 +
    'repeated int32    FieldArr1  = 40;' + #13#10 + 'repeated int32    FieldArr2  = 41 [packed = true];' + #13#10 + 'repeated string   FieldArr3  = 42;' +
    #13#10 + 'repeated Enum1    FieldArrE1 = 43;' + #13#10 + 'repeated TestMsg0 FieldMArr2 = 44;' + #13#10 + '' + #13#10 + '// fields of imported types' +
    #13#10 + 'optional EnumGlobal             FieldImp2 = 51;' + #13#10 + '' + #13#10 + '// extensions 1000 to 1999;' + #13#10 + '}';

  iPos := 1;
  FProtoFile.ParseFromProto(Proto, iPos);

  CheckEquals('test1', FProtoFile.Name);
  CheckEquals(1, FProtoFile.ProtoBufEnums.Count);
  CheckEquals('EnumG0', FProtoFile.ProtoBufEnums[0].Name);
  CheckEquals(1, FProtoFile.ProtoBufMessages.Count);
  CheckEquals('TestMsg1', FProtoFile.ProtoBufMessages[0].Name);
  CheckEquals(16, FProtoFile.ProtoBufMessages[0].Count);
end;

procedure TestTProtoFile.TestParseSyntaxReservedWord;
var
  Proto: string;
  iPos: Integer;
begin
  Proto := 'syntax = "proto3";'#13#10 + //
    ' //   * Bytes type e.g. optional bytes   DefField10 = 10 [default = "123"];'#13#10 + //
    #13#10 + //
    'package test1;'#13#10 + //
    #13#10 + //
    '// enumeration'#13#10 + //
    'enum EnumG0 {'#13#10 + //
    '  // enum value 1'#13#10 + //
    'g1 = 1;'#13#10 + //
    'g2 = 2;'#13#10 + //
    '}';
  iPos := 1;
  FProtoFile.ParseFromProto(Proto, iPos);

  CheckTrue(FProtoFile.ProtoSyntaxVersion = psv3);
  CheckEquals('test1', FProtoFile.Name);
  CheckEquals(1, FProtoFile.ProtoBufEnums.Count);
  CheckEquals('EnumG0', FProtoFile.ProtoBufEnums[0].Name);
  CheckEquals(0, FProtoFile.ProtoBufMessages.Count);
  // all others check tested in another tests in TestuProtoBufParserClasses.pas
end;

{ TestTProtoBufOneOf }

procedure TestTProtoBufOneOf.ParserErrorNameMissing;
begin
  CallParseFromProto('oneof { }', FProtoBufProperty);
end;

procedure TestTProtoBufOneOf.ParserErrorOpenBracketMissing;
begin
  CallParseFromProto('oneof field_oneof', FProtoBufProperty);
end;

procedure TestTProtoBufOneOf.ParserErrorUnexpectedFieldNumber;
begin
  CallParseFromProto('oneof field_oneof = 25 { }', FProtoBufProperty);
end;

procedure TestTProtoBufOneOf.SetUp;
begin
  inherited;
  FProtoBufProperty := TProtoBufProperty.Create(nil);
end;

procedure TestTProtoBufOneOf.TearDown;
begin
  inherited;
  FProtoBufProperty.Free;
  FProtoBufProperty := nil;
end;

procedure TestTProtoBufOneOf.TestParseFromProto;
begin
  CallParseFromProto('oneof field_oneof { }}', FProtoBufProperty);
  CheckTrue(ptOneOf = FProtoBufProperty.PropKind);
  CheckEquals('field_oneof', FProtoBufProperty.PropType);
  CheckEquals('field_oneof', FProtoBufProperty.Name);
  CheckEquals(0, FProtoBufProperty.PropFieldNum); //oneof has no num!
  CheckEquals(0, FProtoBufProperty.PropOptions.Count);
  CheckEquals('', FProtoBufProperty.PropComment);

  CheckException(ParserErrorNameMissing, Exception, 'ParserErrorNameMissing did not raise Exception');
  CheckException(ParserErrorOpenBracketMissing, Exception, 'ParserErrorOpenBracketMissing did not raise Exception');
  CheckException(ParserErrorUnexpectedFieldNumber, Exception, 'ParserErrorUnexpectedFieldNumber did not raise Exception');
end;

initialization
  RegisterTest('Parser', TestTProtoBufPropOption.Suite);
  RegisterTest('Parser', TestTProtoBufPropOptions.Suite);
  RegisterTest('Parser', TestTProtoBufProperty.Suite);
  RegisterTest('Parser', TestTProtoBufOneOf.Suite);
  RegisterTest('Parser', TestTProtoBufEnumValue.Suite);
  RegisterTest('Parser', TestTProtoBufEnum.Suite);
  RegisterTest('Parser', TestTProtoBufMessage.Suite);
  RegisterTest('Parser', TestTProtoBufEnumList.Suite);
  RegisterTest('Parser', TestTProtoBufMessageList.Suite);
  RegisterTest('Parser', TestTProtoFile.Suite);
end.
