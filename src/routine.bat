REM �e���v���[�g�t�@�C���̃p�X��ݒ�
SET TEMPLATE_PATH="C:\work\sampleBat_Beginner\src\_template"
REM �t�@�C�����ɓ����yyyyMMdd��ݒ�
SET TODAY_YYYYMMDD=%DATE:/=%

REM �e���v���[�g�̃t�H���_���A�z���܂߂ăR�s�[���ē��t�t�H���_���쐬
XCOPY /E /I %TEMPLATE_PATH% "C:\work\sampleBat_Beginner\src\%TODAY_YYYYMMDD%"
REM �R�s�[�����t�H���_�Ɉړ�
CD %TODAY_YYYYMMDD%
REM �����̃t�@�C��������t�t�@�C���ɕύX
RENAME "memo_yyyyMMdd.txt" "memo_%TODAY_YYYYMMDD%.txt"

REM �������Ń����t�@�C�����J��
START notepad "memo_%TODAY_YYYYMMDD%.txt"

REM �R�}���h�v�����v�g�����
EXIT