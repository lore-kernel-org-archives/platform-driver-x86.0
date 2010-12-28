From: "Joey Lee" <jlee@novell.com>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Tue, 28 Dec 2010 08:36:45 -0700
Message-ID: <4D1A9EBD02000023000261D7@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: vpivaini@cs.helsinki.fi
Cc: platform-driver-x86@vger.kernel.org

Hi Vainio,=20

=E6=96=BC =E4=BA=8C=EF=BC=8C2010-12-28 =E6=96=BC 14:31 +0200=EF=BC=8CVi=
lle-Pekka Vainio =E6=8F=90=E5=88=B0=EF=BC=9A
> Hi,
>=20
> I hope I'm on the right mailing list for this issue. The kernel (I'm
> using Fedora's 2.6.37rc7) loads the acer-wmi module on a Lenovo Ideap=
ad
> S12 netbook and I think that's not necessary. Loading the module caus=
es
> problems with NetworkManager, the wireless network can't be enabled a=
t
> all. This seems to happen because acer-wmi adds a soft blocked wifi
> killswitch, which can't be unblocked with rfkill.
>=20
> Now that the kernel has the ideapad-laptop module, which seems to han=
dle
> the killswitches better, acer-wmi could probably be disabled with thi=
s
> netbook. I know almost nothing about ACPI/WMI myself, which is why I'=
m
> writing on the list instead of just fixing this.
>=20

It's odd, because acer-wmi driver in 2.6.37rc7 only auto-probe when the
it detected the following wmi GUIDs:

86 MODULE_ALIAS("wmi:67C3371D-95A3-4C37-BB61-DD47B491DAAB");
87 MODULE_ALIAS("wmi:6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3");

It's not make sense acer-wmi probe on Ideapad S12 netbook, could you
please help to attached the following information?

- modinfo acer-wmi > acer-wmi.log
- dmesg > dmesg.log

better attached:
- dmidecode > dmidecode.log
- acpidump > acpidump.dat


Thank's a lot!
Joey Lee
