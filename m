From: kbuild test robot <lkp@intel.com>
Subject: Re: [patch v2 1/2] drivers/platform/x86: move module mlx-platform
 from arch/x86 to drivers/platform/x86
Date: Fri, 28 Oct 2016 03:20:32 +0800
Message-ID: <201610280340.Vev5gfhk%fengguang.wu@intel.com>
References: <1477597999-4261-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477597999-4261-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, dvhart@infradead.org, fengguang.wu@intel.com, davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, andriy.shevchenko@linux.intel.com, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vadim,

[auto build test ERROR on platform-drivers-x86/for-next]
[also build test ERROR on next-20161027]
[cannot apply to v4.9-rc2]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
[Suggest to use git(>=2.9.0) format-patch --base=<commit> (or --base=auto for convenience) to record what (public, well-known) commit your patch series was built on]
[Check https://git-scm.com/docs/git-format-patch for more information]

url:    https://github.com/0day-ci/linux/commits/Vadim-Pasternak/drivers-platform-x86-move-module-mlx-platform-from-arch-x86-to-drivers-platform-x86/20161028-030308
base:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-next
config: i386-tinyconfig (attached as .config)
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

>> scripts/Makefile.build:44: arch/x86/platform/mellanox/Makefile: No such file or directory
>> make[4]: *** No rule to make target 'arch/x86/platform/mellanox/Makefile'.
   make[4]: Failed to remake makefile 'arch/x86/platform/mellanox/Makefile'.

vim +44 scripts/Makefile.build

f77bf0142 Sam Ravnborg     2007-10-15  28  ldflags-y  :=
d72e5edbf Sam Ravnborg     2007-05-28  29  
720097d89 Sam Ravnborg     2009-04-19  30  subdir-asflags-y :=
720097d89 Sam Ravnborg     2009-04-19  31  subdir-ccflags-y :=
720097d89 Sam Ravnborg     2009-04-19  32  
3156fd052 Robert P. J. Day 2008-02-18  33  # Read auto.conf if it exists, otherwise ignore
c955ccafc Roman Zippel     2006-06-08  34  -include include/config/auto.conf
^1da177e4 Linus Torvalds   2005-04-16  35  
20a468b51 Sam Ravnborg     2006-01-22  36  include scripts/Kbuild.include
20a468b51 Sam Ravnborg     2006-01-22  37  
3156fd052 Robert P. J. Day 2008-02-18  38  # For backward compatibility check that these variables do not change
0c53c8e6e Sam Ravnborg     2007-10-14  39  save-cflags := $(CFLAGS)
0c53c8e6e Sam Ravnborg     2007-10-14  40  
2a6914703 Sam Ravnborg     2005-07-25  41  # The filename Kbuild has precedence over Makefile
db8c1a7b2 Sam Ravnborg     2005-07-27  42  kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
0c53c8e6e Sam Ravnborg     2007-10-14  43  kbuild-file := $(if $(wildcard $(kbuild-dir)/Kbuild),$(kbuild-dir)/Kbuild,$(kbuild-dir)/Makefile)
0c53c8e6e Sam Ravnborg     2007-10-14 @44  include $(kbuild-file)
^1da177e4 Linus Torvalds   2005-04-16  45  
0c53c8e6e Sam Ravnborg     2007-10-14  46  # If the save-* variables changed error out
0c53c8e6e Sam Ravnborg     2007-10-14  47  ifeq ($(KBUILD_NOPEDANTIC),)
0c53c8e6e Sam Ravnborg     2007-10-14  48          ifneq ("$(save-cflags)","$(CFLAGS)")
49c57d254 Arnaud Lacombe   2011-08-15  49                  $(error CFLAGS was changed in "$(kbuild-file)". Fix it to use ccflags-y)
0c53c8e6e Sam Ravnborg     2007-10-14  50          endif
0c53c8e6e Sam Ravnborg     2007-10-14  51  endif
4a5838ad9 Borislav Petkov  2011-03-01  52  

:::::: The code at line 44 was first introduced by commit
:::::: 0c53c8e6eb456cde30f2305421c605713856abc8 kbuild: check for wrong use of CFLAGS

:::::: TO: Sam Ravnborg <sam@neptun.(none)>
:::::: CC: Sam Ravnborg <sam@neptun.(none)>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--UugvWAfsgieZRqgk
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICJxRElgAAy5jb25maWcAjDzZctu4su/nK1iZ+5CpupN4i4+nbvkBAkEJI4JkCFKS/cJS
ZDpRxZZ8tMwkf3+7AVLcGsqZqpmx0I2190aDv/3rN48dD9vX5WG9Wr68/PS+lptytzyUT97z
+qX8P8+PvSjOPOHL7AMgh+vN8cfH9fXdrXfz4c8PF3/sVpfetNxtyhePbzfP669H6L3ebv71
G2DzOArkuLi9GcnMW++9zfbg7cvDv6r2xd1tcX11/7P1u/khI52lOc9kHBW+4LEv0gYY51mS
Z0UQp4pl9+/Kl+frqz9wVe9qDJbyCfQL7M/7d8vd6tvHH3e3H1dmlXuzh+KpfLa/T/3CmE99
kRQ6T5I4zZopdcb4NEsZF0OYUnnzw8ysFEuKNPIL2LkulIzu787B2eL+8pZG4LFKWPbLcTpo
neEiIfxCjwtfsSIU0TibNGsdi0ikkhdSM4QPAZO5kONJ1t8deygmbCaKhBeBzxtoOtdCFQs+
GTPfL1g4jlOZTdRwXM5COUpZJoBGIXvojT9huuBJXqQAW1AwxieiCGUEtJCPosEwi9Iiy5Mi
EakZg6WitS9zGDVIqBH8CmSqs4JP8mjqwEvYWNBodkVyJNKIGU5NYq3lKBQ9FJ3rRACVHOA5
i7JiksMsiQJaTWDNFIY5PBYazCwcDeYwXKmLOMmkgmPxQYbgjGQ0dmH6YpSPzfZYCIzfkUSQ
zCJkjw/FWLu650kaj0QLHMhFIVgaPsDvQokW3e1MaeyzrEWNZJwxOA1gy5kI9f1Vgx3U4ig1
yPfHl/WXj6/bp+NLuf/4P3nElEDeEEyLjx96AizTz8U8TltEGuUy9OFIRCEWdj7dkd5sAiyC
hxXE8J8iYxo7GwU2NtrwBZXW8Q1a6hHTeCqiAjapVdJWWTIrRDSDY8KVK5ndX5/2xFOgvRFT
CfR/965Rj1VbkQlNaUkgDAtnItXAX51+bUDB8iwmOhuBmAJ7irAYP8qkJyoVZASQKxoUPrbV
QhuyeHT1iF2AGwCclt9aVXvhfbhZ2zkEXCGx8/Yqh13i8yPeEAMCU7I8BDmNdYYceP/u/Wa7
KX9vUUQ/6JlMODm2pT8IRZw+FCwDazIh8YIJi/xQkLBcC1CbLjIb4WQ5WGpYB7BGWHMxiIS3
P37Z/9wfyteGi0/KHyTGSDJhFwCkJ/G8xePQAmaXg3axctNRLzphqRaI1LRxNKk6zqEPqLGM
T/y4r5DaKF0N0YbMwGb4aDJChpr4gYfEio2cz5oD6NsdHA+0TZTps0A0tQXz/8p1RuCpGJUf
rqU+4mz9Wu721ClPHtGOyNiXvM2JUYwQ6aK0AZOQCdhjUH7a7DTVbRzrcyX5x2y5/+4dYEne
cvPk7Q/Lw95brlbb4+aw3nxt1pZJPrVGkvM4jzJLy9NUSGtzng14MF3Kc08Pdw24DwXA2sPB
T9DAcBiUltM9ZNTCGruQh4BDgUMWhqg8VRyRSFkqhME0XptzHFwSyIwoRnGckVjGgIBrFV3R
oi2n9g+XYObgylq7A26Lb9msvVc+TuM80bTamAg+TWIJ5h+InsUpvRE7MhoBMxa9WfS06A2G
U1BvM2PAUp9eBz/5FSj/yNPG+466J+vA7nppLAKDJSNw6XXPUuTSv2zFACjGWQgU4iIx7pWh
ZK9PwnUyhQWFLMMVNVDLa+2DVqC/JSjRlD5D8KoUsF1RaQ8a6UEH+izGFAD6QdHkTFKg5NTB
ZWO6S3d/dF/whIogd6woyDOxICEiiV37lOOIhQHNDEb1OGBGfzpgoyQ4f7gTsI8khEnaYjN/
JmHr1aD0mSPBjel2rArmHLE0lV22qLeDMYIv/D7TwZDFyY4YTVhFwUm5e97uXpebVemJv8sN
qF4GSpij8gUT0ajI7hCn1VQ+OQJh4cVMGdecXPhM2f6F0c49Y9BxLzEyTGm20yEbOQA55Wro
MB611wtHn0HMh2a7AGdUBpKbUMjB/nEgw54daZ9rbDFaMl63FJGSlvHas/+VqwT8gZGgGaqK
UGhDivOZ1AQEqsDtqD85F1q71iYC2JvE84YIpNOj584g3dBmgBEsRnrO+l63BC2OcTssLuuB
pv2QyramIiMBoGTpDrYVI5SA0plwlr0Ws3CDOonjaQ+IqQP4nclxHueE4wRRkHFlKpeQiF0h
1nwApxkdNKNhTWqnN0sqxhpsg29TLdXRFizpLxVXA61WUnqwyRwYXTBrMXswJRdAsQaszYx9
CwTKAtqzPI3ACcuAndt5p77sEwdpoMTAtUSn1fb8XPX5wpxWw9GDxIclXKFZIMAHTTDN0huh
arWhoQPmx7kjAwGhS2Ed+DrcJNanBUeNArF+mA2OZgyGPwnzsYw6Oq3V7BIuwDDngjIhOPg5
HQepD6Rdji4OkC8SZ0dBMuUho72BITYwbezWXPYYZTYBobcUDlKIEvtsQPjUDkmMMJgSVWII
czStfGPs5yGINyoaESK7DZlFWwjIU6yGObJhErKHIBagF0lx7va661IxTh7qfEoWdnigmRbW
Roe+mIUc5UbkKQKHQE/wdPh0zlK/td4YnHNwV6oc2/UAwEwSucMJEPJAhNUo9CA4YyPMome4
a0PXQQg05vHsjy/Lffnkfbc+wNtu+7x+6YRaJ6ogdlHbtE6MaiWoUqlW5U4EckArlYV+nkaX
4P6y5cBYdiDOrGYUEwqFoNjzpH0OI4xEiG4mbwgTJcDLeYRI3ZC+ghsyW/g5GNl3nmLI5ejc
BnZ7dxOQLIvRpKRq3sNAwficixwz37AJk0Rwo6TzGqFxmeHAHrsOoaF1stuuyv1+u/MOP99s
eP1cLg/HXblv33g8Iqv63bxU4zEpOj7DpGsgGJge0POoOtxYmACpUTFtSKOOQQAC6RA2HEcs
MpAYzHSfCy6qZLBMJT2NjT2BEplVeYWxro4ga/IAhhB8dtCn45xOeIJkYihu88cNk9/c3dLu
+6czgEzTrjPClFpQInNrbqEaTFAqEDQqKemBTuDzcPpoa+gNDZ06Njb9t6P9jm7naa5jOnGg
jBIUDn9dzWXEJ+AXOBZSga9dgVXIHOOOBUT/48XlGWgR0jGr4g+pXDjPeyYZvy7ojLEBOs6O
g1Pu6IVqxikZlcJ2XG8aQcBMR3VnpScyyO4/tVHCyx6sM3wCpgJEnU6zIALqMYNkMkU6byVA
EAwC0G2o3MDbm35zPOu2KBlJlStjLANw3cOH7rqN+82zUOmOrwZLQb8d/SURguNEWXIYEXS4
OZyW/aubDX07F8M1hCmfQAcRYnk6BBgfSgmIS6mxcsVte6OaEpHZCJMktq8oryQyV4QazPFp
/0KoJBt4n3X7LA7B7WMpnYmrsJzchoeQSFqnGaJ1+cTarFZG4nW7WR+2O+uaNLO2Iho4Y1Dg
c8chGIYV4FI9gEfk0LtOQBYDi49ooyjv6PQETpgKtAeBXLiSpOAEANeBlLnPRbv3A/STPkXa
GHPtPTNUNd3QuboKentDhQkzpZMQjOR1J8netGI07zhQi3JFT9qAfznCJbUuc70dgwsssvuL
H/zC/tNTQ4zSP8aRCsB3gD0XImLExbeJJ91goyLqWzHwVtv6QIbIaWHtTuD9Ty7uL06JqHN9
60UpFuUmEm68ldOKLIzYVtW5O1phtLjt1wrcm+EgOMhkS9nanINQo66L22muBm0PaAtXpOYQ
5LS7d2OSykGyl9ZRj/NPS0OSJ5mZyCipm15WkLsTdZMHUAW+nxaZs3xnJlPQlzGGbJ07Vq0I
5Pr21ESP9nLNT+9vLv68bV/YDINeSi7btRnTjnTyULDIWFM6pnd45I9JHNMJxMdRTvs2j3qY
mK3d7iqEM5UQdbLPXYIRiDTFOMWkxKww4j1Me1tGS6F5h5g7xiKCNM2TPu06ClODk40R3/z+
tkV0laW0GjRrsrkCp5qEDbvjFmPKwZ2lXbYqZ0SrzMfi8uKCyqo8FlefLjqc/1hcd1F7o9DD
3MMw/WhlkuLdJ31/IxaCIiuKhOSgj0DQU9SUl31FmQrMu5mrvnP9Te4Y+l/1uleJ+pmv6bsO
rnwTHY9czAo6UAYPRehn1C2L9QW2/5Q7D3yB5dfytdwcTATLeCK97RuW7XWi2CqjQisImlF0
IAdzgph6wa78z7HcrH56+9Xyped+GA8zFZ/JnvLppewjO6/NDR+jftAnPLwcSULhDwYfHff1
pr33CZdeeVh9+L3jFnE6xqjyVFTixNbRVUnrdgdH5IxMQILi0FFHAtxDC1kksk+fLuiIKuFo
Ttyi/aCD0eCAxI9ydTwsv7yUphbUM07kYe999MTr8WU5YJcRGCOVYdqRvvyzYM1TmVDmxOba
4ryj+apO2HxuUCUdcT5GdZhpd85nM0gytiq6fZiD8/DLv9fgQvu79d/2Iq8pEVuvqmYvHopR
bi/pJiJMXKGFmGUqceQgQd1EPsPkpytiMMMHMlVzsJ22WoFEDeZgEZjvWASas7kpA6AOrbVW
vJ/0UzlzbsYgiFnqyGBZBExbVcOA4oTo01HYAH5IkzOi01x1WQ5IPEwrOZkKbWNhnURd8dSK
75gtvfThCIOASP6hxngyTNCh72dQ3IUYSUf2IKOJEQfEIm2CHStuT/W14A9VxcYNyW3TYH1q
vV9RCwRaqgfMo5ILEREPY42ZRHQa+qfXECJltMrnV+RihIATVt7++Pa23R3ay7GQ4s9rvrgd
dMvKH8u9Jzf7w+74am7P99+Wu/LJO+yWmz0O5YH5KL0n2Ov6Df+sBZG9HMrd0guSMQN9tXv9
B7p5T9t/Ni/b5ZNnq0drXLk5lC8eSL6hqRXdGqa5DIjmWZwQrc1Ak+3+4ATy5e6JmsaJv307
JZr1YXkoPdWY7Pc81ur3vh7C9Z2Ga86aTxzOxCI0twlOIAvyWjzjxHltJ/1TCZzmWlbc16L6
ydJpif5JJxLDNleSXDEOPmWsJ9UihoVucvN2PAwnbIxulORDtpwAJQxnyI+xh126Hg9W6v13
cmlQO5ecTAlSEjgw8HIFzEnJZpbRiSBQZK5aGABNXTCZKFnYClJH/n1+zs+PZi4pT/jdv69v
fxTjxFGJE2nuBsKKxjaAcefXMg7/OtxKCC54/67KMsEVJ2nvqNTTCe3R6UTRgIke+rMJiAMx
Z5IMeRTbqhc1W1MeWvey0CzxVi/b1fc+QGyM1wURA5b7oosO/ggWtWMQYY4QnAKVYB3NYQuz
ld7hW+ktn57W6HwsX+yo+w/t5SFtesXDJ9jc4TViGrBgM0cpm4FiqEm7ZhaOgW5Is/hk7qzc
nIhUMTrIqUuIqYSHHrVfWFittN2sV3tPr1/Wq+3GGy1X399elptOSAH9iNFGHByC/nCjHRiT
1fbV27+Vq/Uz+H1MjVjHC+4lGaxlPr4c1s/HzQrpU+usp5MCb7Re4Bvvi1aJCEwh/heOOy2A
i8VDBBhhwrTjRjtDlwIC0WvnGFOhEocHiWCV3V7/6bhEAbBWriCEjRafLi7O7w/jVtddFIAz
WTB1ff1pgfcazHefQ6YcmsiWfGQOV1IJX7I6OTOg4ni3fPuG3ERIv9+9PLUeCU+89+z4tN6C
QT/dHP8+eChnkIPd8rX0vhyfn8FQ+ENDEdCii/UQoTFMIfeplTc54DHDFKXDzY7ziMqB5yBS
8YTLIpRZBsG0iOCAWnVBCB88h8PGU73DhHeMfq6HgSa2Gc/uqevSYHvy7ecenyZ64fInWtCh
zOBsoBZpoxQnBr7gQs5IDISOmT92KDEE52Ei+/F+gzCn6aKUgzmF0s7UUyQgQhM+PZOth5Mj
CaR4IEglfMbreBaC7Lz1PsyAGjI13iG0EyOloCPAVDT9sUHxy5vbu8u7CtIIVIYPJ1zqBtw7
IiSz4bRiEGeReaeHiGN9mSPHky98qRNXLXvuEHyTrXb5krP1DlZBcRd2kzGQsztsFW+tdtv9
9vngTX6+lbs/Zt7XYwlRAKEeQPLGvbLXTgamLsCgAtjGLZ9A3CROuMNtnJxb/bbeGMeiJ1Hc
NOrtcdexP/X44VSnvJB3V59aVVTQKmYZ0ToK/VNrQ51MibBIJC1O4M4bB7Dg6hcIKsvpePqE
kSn6bYhQFQLImSO0kOEoppNoMlYqdxqAtHzdHkoMzShW0Zkw11CqSPESfNj77XX/tU8RDYjv
tXk948UbiBXWb783zkUvxjt5H3rLyRXk0UK6I3WYq3CcSWI4r5+Ebc50kTnNsrl/ow/TIYrJ
nLohYsD9Y9Bdii2KKG3Xt8kEyyldGth4oKY8OY1DV9gTqCE90Gi0ny4NEkouq4JOeLJgxdVd
pDBCoDV9BwvsCM3O4C4W0zhiBsM9I/rS3HH/ovjQpBJ3/pRaStlQibDN0267fmqjQcCYxpJ2
CSNnnKozR4xq7oqyyWBmk7rpOEdAn8GaDdaga53w8YdSIXxHOrTOmMIGXHdbvgjDIh3Rmsbn
/oi5Su/icShOUxDrhfjOcl5LAfu2EAgivdbLgma9GsMRuQAQHRqJBWotQLN3y7GjWsJUniKG
yyAF2lS+OxITZ2DSwgrnE6uAnen9OY8zOhlkIDyjd43J3EDfFI70eYAFUg5YDM4A+BE9sOWd
5epbzwHXg4tlK2r78vi0NVckDUEbyQVL4JrewPhEhn4qaOWKD5Jd1wL4EI0O8eznAc5Di/7l
euNlmP8BFzkGwLsWw0P25Q+NFIXDI60eSH2DELz7CtV8VEOmn4OQjXXLTzW93nbrzeG7SYI8
vZZgQBuH8WSBtMZb8xBFbgaqpao1uL+pSLl9fQPi/GEexAJVV9/3ZriVbd9RLqi9o8DqClrS
TDFLAaKNHydJUsEhsHK8h7OoKjdfjxBkvbUtm8XR7i8vrm7aKjSVScG0KpwvCrHQ2szANK1u
8wgkACNrNYodL+RsBdA8OnujE5BJYIH3SdrubPiMTQv7ARfgGYV5G5qTe0j2WOMopKKc5rVK
p9a4V7z9qyrkakexeZMu2LQuJ3H4i+iWALd3L1A6Q9kvB9Q8q8BP3P2EKP7L8evXfq0dnrUp
vNau4pveZzncJIMt6jhyqXE7TDz6C87XmcCvlg8mMIRzGFKwhpyZwb52ybVLoVismSuZbYAQ
ZeWOhJ/FqMq8sDLm/FbMalCxB6H5bgG12BrsGskwGe7cxdaT3mVadT8M5PZCiLCOb1bDTJab
rx21glY3T2CU4TOm1hQIBD0d2VfwdBb0M5kIbbFHBDwLQhXTlzcdeL+yzgIxiMLb+EHtjFMr
WrBlB/zazUDd9Y4RZ5gKkVDfFcBjbATIe7+vItr9/3qvx0P5o4Q/sGDjQ7dko6JP9ebjHD/h
m+izF9TzuUXCF6/zhGW08rK4xt86I6xpPDvvcpkBMD13ZpI6txPCkf1iLTCNeSKpRRi434eY
SYENT89IHG58/eGrM5NOrZo5tyzpGL/SdvJXGPqclqufap4jKE+Fj88tGOGb4IcmaHVtSOf6
DkX1vRP8jMQ5c/PLMzYDYBH2WYz/aphffOzic/XVp3OMX33hpUjdNrE+70KkaZyCSvhLuItJ
beUniVP7KKd3sY4vrBm1HOQRbz4D0X97eoKOU5ZMaJz6ETL5KLoLNG85qYe8FViZ55uAwCFa
66FU1Xd2Dfatcf8xbtXRjvL/fVxNU4MwEP1LrXUcrxCoRmvKQHCKl4w6PXhypurBf+9+IAmw
m2P7lkLJZrPZ7HsRxCtw8grF2v1qZNlzUdQFElt//vpe+C612OCsIsErufwQXznSRXXPKolC
qOIcm26up4gjzwN8oPv6pDYXkQEmve5u7JeSJzTZPYKhV+p4ZEBiG3IzGuGl9dq+n/C+V2oe
hLbIY101ey7+q0Z1nXHYM09QqZotkJ3oIbt4amRCaJLe3FWzOj5+1vJtPMfpy65w8MuQgKGq
CzNX4/hHoj8bumNwmh4JWeTuxc0PwXbclFbP20bAPSA/yjRIYEEdMrzy2HGjvKKHw/3ZGUUW
Ksx7dFb90DLaZCIq697ps2eMu7IrM1+fYmgul4IN/6HXiNVc1YYprKtb4AmHEnztkVUagx+a
OmxOt5uYKy4xGKutjLEvR5G/OUp0qd0Ko5ulnbQRUPbbk0Vm7kw2btFVOb3ScclKHzFNhE1T
rKfuiE3CR4n64mKwIAtRSuYTsS7slZW36VFlEOPt+gn4ROH8/nP5+P6VyhqP9aBUk2rTt9YP
EJjqjmrqNMuytnJBIKH5t5BuwYYAF3cUBogO9f9+410Lo6NzscR2aDJKh88zOsi4rbQvuiJN
aV3RDsJSwbuQj7fLK+zkL58/sLiek6LTJH3iW2eaIeyxpRH/qaCOAiaH2ino3rp/DdLSCmJz
jbFTe/ICUr8WxCCIMk76V83BzjV0TGuCMdbLow3oVqbz4XV+u6msvMQibD0kpBq6k09EAJG7
Sw62pKs0fUUjs59JEXHUGWSGhUDZjYkONcftrvKJzOkFNYkzUCjNg+ikHY5ayi3jrzDgznlg
tA6S9mZSmW0r5bGrSt55kLajqvE1csQ0cMmKWvpUh0fShXWCu+FqEmhBAvAPEc34sGZaAAA=

--UugvWAfsgieZRqgk--
