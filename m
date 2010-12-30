From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] Add Lenovo Ideapad S12 to acer blacklist
Date: Wed, 29 Dec 2010 19:09:24 -0700
Message-ID: <4D1C848402000023000262E8@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: vpivaini@cs.helsinki.fi, corentincj@iksaif.net, dtor@mail.ru, carlos@strangeworlds.co.uk, trenn@suse.de, platform-driver-x86@vger.kernel.org

Add Cc. issue reporter Ville-Pekka Vainio <vpivaini@cs.helsinki.fi>

Hi Matthew,=20

=E6=96=BC =E5=9B=9B=EF=BC=8C2010-12-30 =E6=96=BC 01:41 +0000=EF=BC=8CMa=
tthew Garrett =E6=8F=90=E5=88=B0=EF=BC=9A
> On Thu, Dec 30, 2010 at 09:32:54AM +0800, Lee, Chun-Yi wrote:
> > The Lenovo Ideapad S12's _WDG have GUID that matches with AMW0, it =
causes
> > acer-wmi driver auto-probe when system boot but there already have
> > ideapad-laptop driver to support Ideapad serial.
> > So, add Lenovo Ideapad S12 to acer blacklist to disable it.
>=20
> This seems like it could be handled better. Does the interface fail, =
or=20
> does it merely duplicate the functionality of the ideapad driver?
>=20

Ville-Pekka Vainio reported this issue, acer-wmi adds a soft blocked
wifi killswitch, which can't be unblocked with rfkill. It causes
NetworkManager on Fedora have problem.

Vainio said ideapad-laptop driver handle the killswitches better, there
is mail loop for discuss this issue:

http://www.mail-archive.com/platform-driver-x86@vger.kernel.org/msg0102=
7.html


Thank's a lot!
Joey Lee


                                =E5=BE=9E:=20
Ville-Pekka Vainio
<vpivaini@cs.helsinki.fi>
                                =E8=87=B3:=20
platform-driver-x86@vger.kernel.org
                              =E4=B8=BB=E6=97=A8:=20
acer-wmi is unnecessarily loaded on
a Lenovo Ideapad S12
                              =E6=97=A5=E6=9C=9F:=20
Tue, 28 Dec 2010 14:31:45 +0200
(20:31 CST)


Hi,

I hope I'm on the right mailing list for this issue. The kernel (I'm
using Fedora's 2.6.37rc7) loads the acer-wmi module on a Lenovo Ideapad
S12 netbook and I think that's not necessary. Loading the module causes
problems with NetworkManager, the wireless network can't be enabled at
all. This seems to happen because acer-wmi adds a soft blocked wifi
killswitch, which can't be unblocked with rfkill.

Now that the kernel has the ideapad-laptop module, which seems to handl=
e
the killswitches better, acer-wmi could probably be disabled with this
netbook. I know almost nothing about ACPI/WMI myself, which is why I'm
writing on the list instead of just fixing this.

--=20
Ville-Pekka Vainio
