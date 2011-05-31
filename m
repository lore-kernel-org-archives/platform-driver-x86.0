From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Tue, 31 May 2011 16:50:21 -0600
Message-ID: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <JLee@novell.com>
Cc: ike.pan@canonical.com, heyho@flanto.de, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-05-31 =E6=96=BC 13:58 +0000=EF=BC=8Cjo=
eyli(Joey Lee) =E6=8F=90=E5=88=B0=EF=BC=9A
> Hi Florian,=20
>=20
> =E6=96=BC =E4=BA=8C=EF=BC=8C2011-05-31 =E6=96=BC 15:02 +0200=EF=BC=8C=
=46lorian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> > On 05/31/2011 11:42 AM, Joey Lee wrote:
> > > Just checked your DSDT, it declared the AMW0 methods, I agreed Ik=
e's
> > > suggestion that will be better you direct test acer-wmi on your m=
achine.
> > >
> > > Please modprobe acer-wmi driver, then try to turn on/off bluetoot=
h or
> > > wireless device by rfkill.
> >=20
> > Hello Joey,
> >=20
> > here are some findings with acer_wmi. I execute the following steps=
 from=20
> > top to bottom, and only after the last step my wifi works. After ea=
ch=20
> > step you find the output of "rfkill list":
> >=20
> > after booting (no ideapad_laptop, no acer_wmi):
> > 0: hci0: Bluetooth
> > 	Soft blocked: no
> > 	Hard blocked: no
> > 1: phy0: Wireless LAN
> > 	Soft blocked: no
> > 	Hard blocked: yes
> >=20
> > after loading acer_wmi (wifi switch is on):
> > 0: hci0: Bluetooth
> > 	Soft blocked: no
> > 	Hard blocked: no
> > 1: phy0: Wireless LAN
> > 	Soft blocked: no
> > 	Hard blocked: no
> > 2: acer-wireless: Wireless LAN
> > 	Soft blocked: yes
> > 	Hard blocked: no
> >=20
> > after switching off:
> > 1: phy0: Wireless LAN
> > 	Soft blocked: no
> > 	Hard blocked: no
> > 2: acer-wireless: Wireless LAN
> > 	Soft blocked: yes
> > 	Hard blocked: no
> >=20
> > switching on again:
> > 1: phy0: Wireless LAN
> > 	Soft blocked: no
> > 	Hard blocked: yes
> > 2: acer-wireless: Wireless LAN
> > 	Soft blocked: yes
> > 	Hard blocked: no
> > 3: hci0: Bluetooth
> > 	Soft blocked: no
> > 	Hard blocked: no
> >=20
> > after removing acer_wmi with modprobe -r:
> > 1: phy0: Wireless LAN
> > 	Soft blocked: no
> > 	Hard blocked: no
> > 3: hci0: Bluetooth
> > 	Soft blocked: no
> > 	Hard blocked: no
> >=20
> > Now wifi networking can be used!
> > The optimal solution would be to have ideapad_laptop make all=20
> > initialisations so wifi can be used after booting with no manual st=
eps=20
> > necessary.
> >=20
> > Regards
>=20
> Your wmi method type is AMW0 and I thought acer-wmi query wrong EC
> register address so your acer-wireless was always soft-blocked.
>=20
> Please kindly help me to find out which register on your machine is
> mapping to wireless status, please reference to Carlos's acer_ec.pl
> tool:
>=20
> http://code.google.com/p/aceracpi/wiki/EmbeddedController
>=20
> Simple use:
> 	watch -n 1 perl acer_ec.pl regs
>=20
> Then press your wireless Fn key to monitor which register changed whe=
n
> you press Fn key:
>=20
> e.g. the register at row B0 and column 0A is register 0xBA (0x is use=
d
> to indicate this is a hexadecimal number).
>=20
> There maybe have other EC register changing when you press key, pleas=
e
> do a couple of times and make sure you find out the right one.
>=20
> If we are lucky, we can find out one EC register mapping to your
> wireless state.
>=20
>=20
> Thank's
> Joey Lee

After traced S205 DSDT, I thought you will got a result is 0x71, please
help to use acer_ec.pl to confirm this register changed. Please give me
the value when wireless on/off.

And,=20
Please attached on dmidecode, just need:=20
	dmidecode > dmidecode.log

I need add your dmi information to quirk table in acer-wmi.


Thank's
Joey Lee
