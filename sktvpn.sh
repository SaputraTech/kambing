#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�)��  �߀ }���~/߮����P�^ms6�w0�h��6�OF���b=ddơ�j��Ȕƚ��6��'�h� h G��&I<�Sژ��L�@z��4I��CG�z�q�&�CM��ѦL@��h�L Ʉ�'�OOP�y�yO(ڃ@��!� �z�j(=��d�N#������NpUB�f�XXSeMEI�
s������2��K,'��b�x	nΰy���~�]!�w$��`��E�j�/� �,)�y�mƪo)����&o���!�S�M4d��-��Ÿ^�(���s�L�^�oJ�ؐn�4����$~<pF@�u�il2ˣ�&����$|��*�Z6/5�i�_Ww4�1����Y�EM�3�7�2%��%�BlLɫ���Y��I+$OzU#�-I.��?��=�[}�m�3m�\��#�h�l�����B"�w�N�;f7�l6�$Ԅe�y'~�nfN�Sy��mɫnzÝ: m �K��(���y@�3"�����Vs3hT���)C*KQ
�
��T+xn��[vT�(���A&K������@l�N
�>2��6V� n/5 �����5������X���z����B c����L��G$��I�t���l��@F���R{�F0L�AkM�/!$�3�e�r�G�Ɲ��	^c��R8��4�@֮�ɑ�̆�R�7�2�vgm���	r���0fB"��.3Nŋ�(kI��L���JՙT�{:n�<�<3@��B�D�R�	�rT��
�3-�,���+p��؛��`<Y)��qF�VQ@lRq`K�Bcf�4Kq�2����U�-�c'b.r�3�0�Z�*4a%�K���Qqa�
�dX��.�*qdAX��"���tY��-$�H���%V�6@�(�$*�B�.ESN&���"��;8h[#�ʈ2L]1�!w"�d3�xX��&�'��7����nѼ+�P���02}����{$,a?�)���O�o�w$S�	�0