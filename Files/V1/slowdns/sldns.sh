#!/bin/bash
# +-------------------------+
# | Modder : MD             |
# +-------------------------+
skip=27
set -C
umask=`umask`
umask 77
tmpxfile=`mktemp -p /tmp` || exit 1
if tail +$skip "$0" | bzip2 -cd >> $tmpxfile; then
  umask $umask
  /bin/chmod 700 $tmpxfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpxfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpxfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpxfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpxfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpxfile) 2>/dev/null &
    $tmpxfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
  echo "Mod by MD"
fi; exit $res
BZh91AY&SY4�� ����������������������������������R���Ϲ���}��޽�����w>�} �w���˾ק���������z�k�m;�*lS�@F��'�?S�L�Ʌ?@&�SL�i���2z��dd��SdƦ���Fjb��2a�7���1=L�Q�L&��F��=�A����F�51�6�eS�4�)�'��'�`��L�5?S4�h�M1O�i�e=����	�&LM�=�zi��e=3"c	�F����ѩ��Jzi���M��M�#P�cL��4hё��F�=	�e�щ�����SM�P���jz��m&jd�jzd����ț(��=OI��������6��1��)��ځ��zzeM�M��)�=O&�OM�mM�)��zM���14�CT�j5<��h�{B�&�OS4����f*f��ڞF��lF���a=FL��yO�O�hƦ�C�����(�d�Dɽ�jzi���4i��Q�&h#C!�='��M2b4ѓL��0�m'�4�=#�h�ɐ������L&M�i�dh5@!���=�e<�lL�OR~�d4Ɣ�i�S�2m2��ѦM42jz)����I�l�&G�f!��51�6��Sʞɧ�z�Bd�)���2dI�I�S5=Q��K�q?D��MMFO��̎f����t�ɱ��(����Y�߂\��SQC�Ů��)=<��:�������p��]���}}���a�l�[K{z����^k��s����׵O]�DҎ�k�[A�e9��?=�������o�V�L�_hT{Z�g�=�.��/��4-�á�ͤp�����V�@q�b���P!\�d��N��y
�g�$�1~��8��R�bI��0��z�ϯ��|�:R6�ա�@nO��+"�a�;�'J�2��[9{���\ Me�-!�K^)i�<���w�M�l^*��f��$9P����f{Ј&Zit���`V,�<*�vY=,�*�Ŕ6�g�)�����o���ʽ�^^.�-}쟦i��b����7������c�Y�)A���({a8Q�屠4W/�M��?�y�Y��k7��I2]�Lg��~��2 Vߤ��D��;�	��\�y�!������O@��d�4P0��!�����Ny}���s�� 'Z��l���9E��ȑc���ޤf�5�;���I����R����[���l�k��8��2 fJ�=U�_1v�$H�d�%�=�Ǿ�j���B�̈�P|s.��߈R9`,�X$僾 o`��1U�a����6�Au�UԄ�E��ײ*jJ�P�,xS�SC����~Zh�s�Ƙ���L�|eA�(������U��B�h��� |�6&Vs��R[^�e��kl K�3�+���+ry�:���G�Grc9CA����xqsg����x6%��;ScYW��g�k�/���K�TQ�����(�/�x�>?���l55,����Wc��=S�ul��Ta`BU(=��q-�A.��]���+��
i�I��A�/��$UD��X���^u��9���daG"�fa�z��&,3�M��Ju���j�}(Hd�g�"�VD��ͤ@VW8g��$�N��k���o!���_��7�G����]������N@�۹�) A a[EYZ�7�z��],������.���-HX���yޅߛɄ�n�oC~����Q��D@yHx�Gr�q�?�����DR� ]e���z�����S!������陗Yk"i�|-�����<.CUdc�bk͚�:�<���i�DΧD��b������0~�Kϩi�� �V�?�]��f�.�e���)�@��m=���<��!Q{������v/D��4��%1'g3y��w=`�OOَ���H�L����1���5kJ�T���"��Ҥo}Q��R�X49h:��8i3=ZG��L�>#&]�.6%/%�ݹ��F���ɤ=��
��k�`q�6��[��N�AgD���Z'����E�����,&��k�p&vfhk	~.�,�-fSQ��/w�iD����o6T;
7��� ��^G�]o��2�ɩq��Q��2ȶ����"����O�i��"Ϙ�C�1�����1D�.�=pyy)�����S���k��.�e��Lu�����0�uP�O���?�"�ceh�|K��>5�Mop���h��u])W����׬��^y����
�<�}<Gh^YNfE&�5\j�L�R����0䓹�nt]�܁�ς�%~�1~f�i��$�T(�.3�D7en%,k,�֐�`��G�<6��J|(���,����{ߏ���2:6��~��n�Db�tL�Ղbp&+-։?�hY��o'��a#��8��ֲƻ'!Y2�E	}��p@�:C�7��Z+Z	^"Vl`H ����BI ��X�fj���B�ax����ukLwX�R�u�N&������^/���U�D7Z-���C9��pi9%e�T��&�&0���N�υ{��~Vx�(0���ᢸ6!�[
LS�m���@���[�J�B��%8�5j=�ጏ������u���ԋ;%0��{\0R�zL,r� �-s���=Bۏ�|t�,��	��<�;SW��,7U܆�/C��ס֓�I(�0�,-�̵�]���Kש��１�+�w��Q�T�=]�EW�ȡzJj������-�&�AZ�O��j ��v��K��Ӷ�i�.��f�|^�D_�d�3q�<�m1@�9TMJ�ηrRr��R��3��A�.�w(��J�ː����i�%䟥��H	����6�� Q�7=�j�u���@�r�.ę�����hZycA����uL�a�H����0�:A=u�vi�k�V@�7EF��W�v�$f~��[��3͔]bq������r�ϕK*0��h]��yG}�IGb�¹�k���`J�	�v���"H��e�.��oiT�t�o.������:� :o2�Nuq���,ǋ�]�m#���Q������#+YG�F/h�ו.�#���q����k�S���@
��ex�q+P���XM��dQ�pz�����R,>��k~ltnL��.Y@%�t�EV����X|}h�z����I���R�I�҅��=�&A0oS������sJG>"���zݹ�����LGH������a�|�c�'�s���h�QS�������%ň��5qj��x*5�������������W�07�=$[K$^@ٓ��R ��@@��TG5�N�t���'�昝�1�)�bJ$ߗW�W�D��_��w�]q�s�tQ}�c�v�����ɳ�I�$ة �����c�^B}���o��+F���x��k���nA�KtI����ٕ�-z�����,���SJ���n���?�CBz�M�m! R�M܀(>)�4��w6�_�3�/m����O۴FGGn�����_��`
�)(Ç�dB,J�d3�뷪B��K���6{��R�ۮẛ��z��0�kT�]"���~s��H=Ah�3�:�X�����bM����d��z�َd��iq��K�8P�Q(��>`�9�#K��fJ�g���u�k���~����y�h+�ǆ4z�%�p� ����@�|)y��*}]��b��u�wϏ�HD��Wʂu�7[���)�)�E����MϹK��-�ATt1�^q�8�$�����[���V�˯qP
*�Z���dSO,��iӆ��Ͼ�QH�=��%.���7Fn
�p�O��}�b����L������-�_�*̵R�S|��&gcDރ��@4��C��$ ��O�PՔ��Ux݆��헌�]�g0?z��\G>��N�	�b��A�(��(���=}T��=��B,	��jY����=%;�m��-'-�N�9�����2"@��׳�YQu�A������};G�C�r�n"h`
ݓ�p mo`��փ�Gn��h�K�P�yyCm����p���#¥��6�M�| %Q��!lO��
�4z� ���l��9C�g�Q�C���$��x���0��O ��ҵ�4�:s�� �l����>�����d�ͥ�Y�٭�&@f��e�%� �~_�'C��̚rlD˞L��5�}����=�!��m�O�<Ƶs�>���K�89��ǐ�\H�}*ذ0�	@���z���#��G����ks�ua�&���������(>�Q�xT��N��drT���f�+�*m�e�*p�/G	Zv-Dqd�+�Y����Y)����l��Qк�}/�cR�sӴvx��+�X�UD��P���x8d+A�C@�&�!j�IF]�X���F�}�}Z4��j�h����{��]�kҚ��5Bȃ%��W�~�B�NX�Y�����6�S/�"ȧ^y��d��	a���n
p�J���y/���b�{V�N=U�-�ǂ��os#�p��Ԙ��~2� �Ȧ��.��oBd���Ѫ$Gж���4�Pt�J�T/N١�4�ΉD�j�����TQ���[dnP��U���-A�0*v�&Zi�k1�S�:QI����8�s����G���[����.�j9�7C��Mr����uZ�Z��N�KO�yK����5��) S:NS
�k�s���E\p�(�*��s�:��%�o�3��KH�+׉�)|�yb�8��A��&I&E妓���a��`o(1� ��{��Œ`�{���ZM�{,�D$���5 jLhg*y�I[2��kVPciJ����3?my:,��5^��.�6���nc�쟴F]�B2��6���^ƈ:F3P��
��2)�.���ա�(�����R��s����Ӎ����ͼ_�"�jD���Ζ*���}��>$ @2e��s�"Ge��[�+��/��T�r���v��W�vv
b�֐K)I��Fո+{	�m����|�u���������h���,�0�?�e��	(y���X�����i��wDK#�
oA���3H����8ȟ�4 ���A���u�T������r<�j?�2|�����x�<���b����=��3�uzq��̈lA�j��a�jp�L ��ӭq�C,�<![-4��gt�SF����t�ȏU�x"y+�X���;S���H��I-�B����	B�p=)5�#��禷�]��X3�\�h�н�ʮd�9�	�k�ca=9{g��?6�y�8�sc��� ��Z>��v��$2�M�n�\�L>�bj�x:��yU��\�~>�ٍ�c����e� �ȏJ�5r���rF��I9T���馪�ϤA�)E�80V���z辯Z�à���n�uQ8E��f�,��1�v~ʈ��e7L�)(<��x9���Zl����2�%�iz����9��?ᬇ P����3�ՠѥ��׻�f�:)�sp1�^ůb��Y~�
i�f�n}o�^��#3}'9�͟�0��
O�i��%������x^GSH�/oo�󮽳��@�{Y9��Zpɺ���ј�m�!	�t�`���+5:%? [�����|n �Ar�Ma���V*��Ź�wz�J�G�^6\����}�t�u��|��y�V�	&q����>� �E�U�͔�Da�������UiuBک���W�j��Vp�$*:b��_�"Zo�9a����j�	���r�&��Y ��H���{��m��:�8��B)/,g�dWA��3�`N��w��W�� �E��ր�@_�lI�ł|�Ζ�"}�(2Nȭ��c�B{�l�',~�ħ\�X�L1��aO;_�=G�}0��D�,r�ΰ���E%�w(i�ck|��r��=�bm �Y�yu�YƟR��򆨳8.d�L���\�!x1ecM��"�.٧�O~ݩ��8�X~��A�t-�Z�i-q��tXq*�:�<���Q��sar�ߊ~�%��SG�k�n��b����1�^M'�|�,���V���/	��x��Z�b��K���U���y�P9��&���:Q(��-M0U̓ ��*���ܘ��J�Ws����BA�$�����05Rs��S-*�ҝ�ē�.}59�6�8�=�}�OZ���_b���G��;��#�d�Y�kspƉʄ������[��<���&�<�9�w�qO(� ����\5�F��nQ���_S�ү�P��ѹ3��ˈ`|�G��̏�a�=�/��h�~qcxg�"3���]��x�.��c<7D&��/ �%7A<K� Pp�cʱ��=lY�p�XBư�X�N�ʗã�-�rW��y��n8	q��1�]>���xS��$oh�! i��.�N�v��N�w�ʧ�FY5`���ܶ\ܜ�	���-��p��}j׶!��_Uh0���aK/���E�+� 2w�bi�H兤ux���JK�<���ܰ�aaU�;;^�~Ϋ��ct�Y`*��_���>�n�0Qj��N�(�0�Ev�aȆId�r0;b�d�R E�V�T$6!f�������[;"�!	�2��s�n'3N�2k���BOK�=�ռ1�#t�Y�G��~�ci�iB�ؐ��a<3DD���쌆�����&Ճ8��-f��2�ql ��	m�ߢ�][N�=czU�(�A��I�HR�8FU���p[v]�ÛpժK���|�8
4m�F|=`�2N�VV+����n߽Wp��R�W5��|}��� @m�\϶O��2�ba~�c��`��P_��ck����S�7��	Ҝ�Hա�����������-v��8ƯEZ�²�v�Vc��B;S:Њch�U6�R�p"�ݟ���ݞO�S; b�IԶ�� E3K���	&�4`V`G�b���Fqݡ��s�̏Z���4�Y��.��[������(����1A�-�mִ�&��jꨤ^�qC��z�Ilp{Hɵ��H�4sw���
O-y4w�2�+�qU�Ko�������=:��y�C�owp���&��~��Q���T.cl�X����pW7�.Gf��(��eL�q9�P1h���kˆ�� '���Aj�u��~�4E�ћ8��1�2����,�]ٗgЩ�Mf���Y0���i�?�I>��J{���Kc,�rY�¦�1�W&�PmZ��}J<"3������@u�_*����v��lIm%��R��W�x���3E&�|�;�%O�ы$�'P.+�j,ޔ�4�F�<���C^���²�����h�?�"���AV[�����"�(HZ�