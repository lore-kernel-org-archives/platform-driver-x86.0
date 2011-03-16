From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] msi-laptop: use pr_<level> for messages
Date: Wed, 16 Mar 2011 03:59:47 -0600
Message-ID: <4D8124C30200002300029EBB@novprvlin0050.provo.novell.com>
References: <1299754954-27787-1-git-send-email-jlee@novell.com>
 <20110313063101.GE31566@core.coreip.homeip.net>
 <4D8107970200002300029E69@novprvlin0050.provo.novell.com>
 <20110316082211.GC25912@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20110316082211.GC25912@core.coreip.homeip.net>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dmitry.torokhov@gmail.com
Cc: corentincj@iksaif.net, mjg@redhat.com, carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=B8=89=EF=BC=8C2011-03-16 =E6=96=BC 01:22 -0700=EF=BC=8CDm=
itry Torokhov =E6=8F=90=E5=88=B0=EF=BC=9A
> Hi Joey,
>=20
> On Wed, Mar 16, 2011 at 01:55:19AM -0600, Joey Lee wrote:
> > Hi Dmitry,=20
> >=20
> > =E6=96=BC =E5=85=AD=EF=BC=8C2011-03-12 =E6=96=BC 22:31 -0800=EF=BC=8C=
Dmitry Torokhov =E6=8F=90=E5=88=B0=EF=BC=9A
> > > > =20
> > > >  static int dmi_check_cb(const struct dmi_system_id *id)
> > > >  {
> > > > -	printk(KERN_INFO "msi-laptop: Identified laptop model '%s'.\n=
",
> > > > -	       id->ident);
> > > > +	pr_info("msi-laptop: Identified laptop model '%s'.\n", id->id=
ent);
> > >=20
> > > No, you need to add:
> > >=20
> > > #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > >=20
> > > at the very beginning of your driver (before includes) and then j=
ust do
> > >=20
> > > 	pr_info("Identified laptop model '%s'.\n", id->ident);
> > >=20
> > > and pr_fmt() will ensure that alll your messages use consistent p=
refix.
> > >=20
> > > Thanks.
> > >=20
> >=20
> > Thank's for your teach, it works fine to me. Follow your suggestion=
, I
> > fixed my patch like the following, please kindly review it again:
> >=20
> >=20
> > >From 31123fcc91b073b329a970b075041eaec523b106 Mon Sep 17 00:00:00 =
2001
> > From: Lee, Chun-Yi <jlee@novell.com>
> > Date: Wed, 16 Mar 2011 15:44:40 +0800
> > Subject: [PATCH] msi-laptop: use pr_<level> for messages
> >=20
> > msi-laptop: use pr_<level> for messages
> >=20
> > Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> > Cc: Matthew Garrett <mjg@redhat.com>
> > Cc: Dmitry Torokhov <dtor@mail.ru>
> > Cc: Corentin Chary <corentincj@iksaif.net>
> > Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
>=20
> Looks good to me.
>=20
> Reviewed-by: Dmitry Torokhov <dtor@mail.ru>
>=20

Thank's for your kindly review. :-)

Joey Lee

> > ---
> >  drivers/platform/x86/msi-laptop.c |   14 +++++++-------
> >  1 files changed, 7 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x=
86/msi-laptop.c
> > index 028d2c6..0de6d43 100644
> > --- a/drivers/platform/x86/msi-laptop.c
> > +++ b/drivers/platform/x86/msi-laptop.c
> > @@ -51,6 +51,8 @@
> >   * laptop as MSI S270. YMMV.
> >   */
> > =20
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> >  #include <linux/module.h>
> >  #include <linux/kernel.h>
> >  #include <linux/init.h>
> > @@ -445,8 +447,7 @@ static struct platform_device *msipf_device;
> > =20
> >  static int dmi_check_cb(const struct dmi_system_id *id)
> >  {
> > -	printk(KERN_INFO "msi-laptop: Identified laptop model '%s'.\n",
> > -	       id->ident);
> > +	pr_info("Identified laptop model '%s'.\n", id->ident);
> >  	return 1;
> >  }
> > =20
> > @@ -834,8 +835,7 @@ static int load_scm_model_init(struct platform_=
device *sdev)
> > =20
> >  	result =3D i8042_install_filter(msi_laptop_i8042_filter);
> >  	if (result) {
> > -		printk(KERN_ERR
> > -			"msi-laptop: Unable to install key filter\n");
> > +		pr_err("Unable to install key filter\n");
> >  		goto fail_filter;
> >  	}
> > =20
> > @@ -875,7 +875,7 @@ static int __init msi_init(void)
> >  	/* Register backlight stuff */
> > =20
> >  	if (acpi_video_backlight_support()) {
> > -		printk(KERN_INFO "MSI: Brightness ignored, must be controlled "
> > +		pr_info("Brightness ignored, must be controlled "
> >  		       "by ACPI video driver\n");
> >  	} else {
> >  		struct backlight_properties props;
> > @@ -929,7 +929,7 @@ static int __init msi_init(void)
> >  	if (auto_brightness !=3D 2)
> >  		set_auto_brightness(auto_brightness);
> > =20
> > -	printk(KERN_INFO "msi-laptop: driver "MSI_DRIVER_VERSION" success=
fully loaded.\n");
> > +	pr_info("driver "MSI_DRIVER_VERSION" successfully loaded.\n");
> > =20
> >  	return 0;
> > =20
> > @@ -977,7 +977,7 @@ static void __exit msi_cleanup(void)
> >  	if (auto_brightness !=3D 2)
> >  		set_auto_brightness(1);
> > =20
> > -	printk(KERN_INFO "msi-laptop: driver unloaded.\n");
> > +	pr_info("driver unloaded.\n");
> >  }
> > =20
> >  module_init(msi_init);
> > --=20
> > 1.6.0.2
> >=20
> >=20
> >=20
> >=20
>=20
