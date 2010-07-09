From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] msi-laptop: make struct rfkill_ops const
Date: Fri, 09 Jul 2010 04:24:38 -0600
Message-ID: <4C378586020000230001CAF9@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@kroah.com
Cc: mzxreary@0pointer.de, axel.lin@gmail.com, rpurdie@linux.intel.com, mjg@redhat.com, gregkh@suse.de, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

Hi Greg,=20

=E6=96=BC =E5=9B=9B=EF=BC=8C2010-07-08 =E6=96=BC 11:39 -0700=EF=BC=8CGr=
eg KH =E6=8F=90=E5=88=B0=EF=BC=9A
> On Thu, Jul 08, 2010 at 11:53:15AM -0600, Joey Lee wrote:
> > Hi Axel,=20
> >=20
> > =E6=96=BC =E5=9B=9B=EF=BC=8C2010-07-08 =E6=96=BC 10:08 +0800=EF=BC=8C=
Axel Lin =E6=8F=90=E5=88=B0=EF=BC=9A
> > > rfkill uses a const struct rfkill_ops pointer.
> > >=20
> > > Signed-off-by: Axel Lin <axel.lin@gmail.com>
> > > ---
> > >  drivers/platform/x86/msi-laptop.c |    6 +++---
> > >  1 files changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform=
/x86/msi-laptop.c
> > > index afd762b..05634f8 100644
> > > --- a/drivers/platform/x86/msi-laptop.c
> > > +++ b/drivers/platform/x86/msi-laptop.c
> > > @@ -562,15 +562,15 @@ static int rfkill_threeg_set(void *data, bo=
ol blocked)
> > >  	return 0;
> > >  }
> > > =20
> > > -static struct rfkill_ops rfkill_bluetooth_ops =3D {
> > > +static const struct rfkill_ops rfkill_bluetooth_ops =3D {
> > >  	.set_block =3D rfkill_bluetooth_set
> > >  };
> > > =20
> > > -static struct rfkill_ops rfkill_wlan_ops =3D {
> > > +static const struct rfkill_ops rfkill_wlan_ops =3D {
> > >  	.set_block =3D rfkill_wlan_set
> > >  };
> > > =20
> > > -static struct rfkill_ops rfkill_threeg_ops =3D {
> > > +static const struct rfkill_ops rfkill_threeg_ops =3D {
> > >  	.set_block =3D rfkill_threeg_set
> > >  };
> > > =20
> >=20
> > The patch good to me, do I need Signed-off it?
> > How can I signed off a patch?
>=20
> You can say:
> 	Signed-off-by: your name <your_email>
>=20
> and then Matthew will add it.
>=20
> Or you can take the original patch, add your signed-off-by, and resen=
d
> it to Matthew keeping the correct authorship information there by mak=
ing
> sure the first line in the body of the email has:
> 	From: Original author <email>
>=20
> so git will get it right.
>=20
> hope this helps,

Thank's for your kindly teach, it's useful to a rookie. :-)

Joey Lee
