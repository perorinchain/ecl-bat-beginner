REM @ECHO OFF����ƂȂ���������PAUSE�̂Ƃ��ɈႢ���킩��
REM @ECHO OFF

REM ���̃o�b�`�t�@�C���̃t�H���_�p�X���擾
SET THIS_BAT_DIR_PATH=%~dp0
REM ���X�g�t�@�C���̃p�X�������Ŏ擾
SET LIST_PATH=%1

REM ���������΍�ŕ����R�[�h�𒲐�
CHCP 932
REM �e�L�X�g�t�@�C���ɒǉ����镶������w��
SET STRING_TO_ADD=�ǉ�������

REM ���̎��_�Ŋ��ϐ��ɂǂ�Ȓl�������Ă��邩�m�F
ECHO %THIS_BAT_DIR_PATH%
ECHO %LIST_PATH%
ECHO %STRING_TO_ADD%
REM PAUSE�̂Ƃ���ň�x�~�܂��Ă����
PAUSE

IF NOT EXIST %LIST_PATH% EXIT

FOR /F "tokens=*" %%A in (%LIST_PATH%) DO (
  REM ���̎��_��%%A�ɂǂ�Ȓl�������Ă��邩�m�F
  ECHO %%A
  PAUSE
  
  REM ���̎��_�Ŋ��ϐ��ɂǂ�Ȓl�������Ă��邩�m�F
  ECHO %THIS_BAT_DIR_PATH%
  ECHO %LIST_PATH%
  ECHO %STRING_TO_ADD%
  PAUSE
  
  REM ���X�g�t�@�C���ɂ���t�@�C�����̃t�@�C���Ɏw�肵���������ǋL
  ECHO %STRING_TO_ADD% >> %THIS_BAT_DIR_PATH%%%A.txt
)

REM �R�}���h�v�����v�g�����
EXIT
