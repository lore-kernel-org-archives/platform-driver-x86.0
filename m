From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] msi-laptop: make struct rfkill_ops const
Date: Thu, 8 Jul 2010 11:39:03 -0700
Message-ID: <20100708183903.GD31823@kroah.com>
References: <4C369D2B020000230001CA27@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4C369D2B020000230001CA27@novprvlin0050.provo.novell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joey Lee <jlee@novell.com>
Cc: axel.lin@gmail.com, mzxreary@0pointer.de, rpurdie@linux.intel.com, mjg@redhat.com, gregkh@suse.de, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 08, 2010 at 11:53:15AM -0600, Joey Lee wrote:
> Hi Axel,=20
>=20
> =E6=96=BC =E5=9B=9B=EF=BC=8C2010-07-08 =E6=96=BC 10:08 +0800=EF=BC=8C=
Axel Lin =E6=8F=90=E5=88=B0=EF=BC=9A
> > rfkill uses a const struct rfkill_ops pointer.
> >=20
> > Signed-off-by: Axel Lin <axel.lin@gmail.com>
> > ---
> >  drivers/platform/x86/msi-laptop.c |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x=
86/msi-laptop.c
> > index afd762b..05634f8 100644
> > --- a/drivers/platform/x86/msi-laptop.c
> > +++ b/drivers/platform/x86/msi-laptop.c
> > @@ -562,15 +562,15 @@ static int rfkill_threeg_set(void *data, bool=
 blocked)
> >  	return 0;
> >  }
> > =20
> > -static struct rfkill_ops rfkill_bluetooth_ops =3D {
> > +static const struct rfkill_ops rfkill_bluetooth_ops =3D {
> >  	.set_block =3D rfkill_bluetooth_set
> >  };
> > =20
> > -static struct rfkill_ops rfkill_wlan_ops =3D {
> > +static const struct rfkill_ops rfkill_wlan_ops =3D {
> >  	.set_block =3D rfkill_wlan_set
> >  };
> > =20
> > -static struct rfkill_ops rfkill_threeg_ops =3D {
> > +static const struct rfkill_ops rfkill_threeg_ops =3D {
> >  	.set_block =3D rfkill_threeg_set
> >  };
> > =20
>=20
> The patch good to me, do I need Signed-off it?
> How can I signed off a patch?

You can say:
	Signed-off-by: your name <your_email>

and then Matthew will add it.

Or you can take the original patch, add your signed-off-by, and resend
it to Matthew keeping the correct authorship information there by makin=
g
sure the first line in the body of the email has:
	From: Original author <email>

so git will get it right.

hope this helps,

greg k-h
