From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Tue, 31 May 2011 07:58:44 -0600
Message-ID: <4DE580B4020000230002D582@novprvlin0050.provo.novell.com>
References: <4DAB18C3.7010106@flanto.de> <4DAB9566.7010601@canonical.com>
 <4DB92866.4000008@flanto.de> <4DE48486.1050702@canonical.com>
 <4DE51718020000230002D4CF@novprvlin0050.provo.novell.com>
 <4DE48CD5.1080008@canonical.com> <4DE49815.4010901@flanto.de>
 <4DE5448A020000230002D51E@novprvlin0050.provo.novell.com>
 <4DE4E6EC.7080005@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <4DE4E6EC.7080005@flanto.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: heyho@flanto.de
Cc: ike.pan@canonical.com, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

Hi Florian,=20

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-05-31 =E6=96=BC 15:02 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> On 05/31/2011 11:42 AM, Joey Lee wrote:
> > Just checked your DSDT, it declared the AMW0 methods, I agreed Ike'=
s
> > suggestion that will be better you direct test acer-wmi on your mac=
hine.
> >
> > Please modprobe acer-wmi driver, then try to turn on/off bluetooth =
or
> > wireless device by rfkill.
>=20
> Hello Joey,
>=20
> here are some findings with acer_wmi. I execute the following steps f=
rom=20
> top to bottom, and only after the last step my wifi works. After each=
=20
> step you find the output of "rfkill list":
>=20
> after booting (no ideapad_laptop, no acer_wmi):
> 0: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: yes
>=20
> after loading acer_wmi (wifi switch is on):
> 0: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 2: acer-wireless: Wireless LAN
> 	Soft blocked: yes
> 	Hard blocked: no
>=20
> after switching off:
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 2: acer-wireless: Wireless LAN
> 	Soft blocked: yes
> 	Hard blocked: no
>=20
> switching on again:
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: yes
> 2: acer-wireless: Wireless LAN
> 	Soft blocked: yes
> 	Hard blocked: no
> 3: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
>=20
> after removing acer_wmi with modprobe -r:
> 1: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 3: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
>=20
> Now wifi networking can be used!
> The optimal solution would be to have ideapad_laptop make all=20
> initialisations so wifi can be used after booting with no manual step=
s=20
> necessary.
>=20
> Regards

Your wmi method type is AMW0 and I thought acer-wmi query wrong EC
register address so your acer-wireless was always soft-blocked.

Please kindly help me to find out which register on your machine is
mapping to wireless status, please reference to Carlos's acer_ec.pl
tool:

http://code.google.com/p/aceracpi/wiki/EmbeddedController

Simple use:
	watch -n 1 perl acer_ec.pl regs

Then press your wireless Fn key to monitor which register changed when
you press Fn key:

e.g. the register at row B0 and column 0A is register 0xBA (0x is used
to indicate this is a hexadecimal number).

There maybe have other EC register changing when you press key, please
do a couple of times and make sure you find out the right one.

If we are lucky, we can find out one EC register mapping to your
wireless state.


Thank's
Joey Lee
