From: "Joey Lee" <jlee@novell.com>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Tue, 31 May 2011 03:42:02 -0600
Message-ID: <4DE5448A020000230002D51E@novprvlin0050.provo.novell.com>
References: <4DAB18C3.7010106@flanto.de> <4DAB9566.7010601@canonical.com>
 <4DB92866.4000008@flanto.de> <4DE48486.1050702@canonical.com>
 <4DE51718020000230002D4CF@novprvlin0050.provo.novell.com>
 <4DE48CD5.1080008@canonical.com> <4DE49815.4010901@flanto.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <4DE49815.4010901@flanto.de>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: heyho@flanto.de
Cc: ike.pan@canonical.com, Joey Lee <JLee@novell.com>, platform-driver-x86@vger.kernel.org

Hi Florian,=20

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-05-31 =E6=96=BC 09:26 +0200=EF=BC=8CFl=
orian Heyer =E6=8F=90=E5=88=B0=EF=BC=9A
> On 31.05.2011 08:38, Ike Panhc wrote:
> > Hi Joey,
> >=20
> > I put it at http://people.canonical.com/~ikepanhc/DSDTs/acpidump-id=
eapad-s10-3t.dat
>=20
> Hi Ike,
>=20
> i think this acpi-dump is for another system (it's for a ideapad s10)=
=2E
>=20
> I put the one for Ideapad s205 at
> http://www.heyer-it.de/dl/s205/acpidump-ideapad-s205.txt
>=20
>=20
> Regards

Just checked your DSDT, it declared the AMW0 methods, I agreed Ike's
suggestion that will be better you direct test acer-wmi on your machine=
=2E

Please modprobe acer-wmi driver, then try to turn on/off bluetooth or
wireless device by rfkill.


Thank's
Joey Lee
