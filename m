From: "Joey Lee" <jlee@novell.com>
Subject: Re: drivers/platform/x86:
 Backlight-Add-backlight-type-v2.patch
Date: Wed, 27 Oct 2010 09:58:31 -0600
Message-ID: <4CC8E6D70200002300022D7C@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com
Cc: michel@daenzer.net, sedat.dilek@gmail.com, dri-devel@lists.freedesktop.org, acpi4asus-user@lists.sourceforge.net, mjg@redhat.com, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org

Hi Corentin,=20

=E6=96=BC =E4=B8=89=EF=BC=8C2010-10-27 =E6=96=BC 13:39 +0200=EF=BC=8CCo=
rentin Chary =E6=8F=90=E5=88=B0=EF=BC=9A
> On Wed, Oct 27, 2010 at 1:06 PM, Sedat Dilek <sedat.dilek@googlemail.=
com> wrote:
> > Hi,
> >
> > while testing linux-next I wanted to reactivate the backlight type
> > patches laying in my build-dir.
> >
> > Within 2.6.36-rcX cycle I had successfully tested the backlight typ=
e
> > patch [1] with an additional patch for radeon by Michel (posted to
> > dri-devel ML, see [2]).
> >
> > The main patch needs a little refreshing.
> >
> > v2: drivers/platform/x86/asus-laptop.c: Refreshed to fit linux-next
> > (next-20101027)
> >
> >
> > Kind Regards,
> > - Sedat -
> >
> > [1] https://patchwork.kernel.org/patch/163971/
> > [2] https://patchwork.kernel.org/patch/182352/
> >
>=20
> Hi,
>=20
> I think rfkill has the same problem, on some platforms, the platform
> driver will add a rfkill switch, but the network (wlan/wimax/whatever=
)
> driver may also add one. AFAIK, the platform one is more likely to be
> able to power down the device completly.
>=20

Agreed your point!
x86/laptop or wmi driver borrow rfkill interface for power control but
confuse with userland applications.


Thank's
Joey Lee
