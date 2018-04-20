From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: dell-smbios: Match on www.dell.com in OEM
 strings too
Date: Fri, 20 Apr 2018 14:39:32 +0000
Message-ID: <8649d2b7b64741b4beb7b17085aa9d56@ausx13mpc120.AMER.DELL.COM>
References: <1523994356-9598-1-git-send-email-mario.limonciello@dell.com>
 <20180419234324.GA11546@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180419234324.GA11546@fury>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Thursday, April 19, 2018 6:43 PM
> To: Limonciello, Mario
> Cc: Andy Shevchenko; LKML; platform-driver-x86@vger.kernel.org
> Subject: Re: [PATCH] platform/x86: dell-smbios: Match on www.dell.com in =
OEM
> strings too
>=20
> On Tue, Apr 17, 2018 at 02:45:56PM -0500, Mario Limonciello wrote:
> > Sergey reported that some much older Dell systems don't support
> > the OEM string "Dell System" but instead supported www.dell.com
> > in OEM strings.
> >
> > Match both of these to indicate that this driver is running on
> > a Dell system.
> >
> > Reported-by: Sergey Kubushyn <ksi@koi8.net>
> > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > Tested-by: Sergey Kubushyn <ksi@koi8.net>
> > ---
> >  drivers/platform/x86/dell-smbios-base.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/platform/x86/dell-smbios-base.c b/drivers/platform=
/x86/dell-
> smbios-base.c
> > index 2485c80..fbd6557 100644
> > --- a/drivers/platform/x86/dell-smbios-base.c
> > +++ b/drivers/platform/x86/dell-smbios-base.c
> > @@ -555,11 +555,15 @@ static void free_group(struct platform_device *pd=
ev)
> >
> >  static int __init dell_smbios_init(void)
> >  {
> > -	const struct dmi_device *valid;
> > +	const struct dmi_device *valid_dell_system;
> > +	const struct dmi_device *valid_www;
> >  	int ret, wmi, smm;
> >
> > -	valid =3D dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System",
> NULL);
> > -	if (!valid) {
> > +	valid_dell_system =3D
> > +		dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System",
> NULL);
> > +	valid_www =3D
> > +		dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com",
> NULL);
> > +	if (!valid_dell_system && !valid_www) {
> >  		pr_err("Unable to run on non-Dell system\n");
> >  		return -ENODEV;
> >  	}
>=20
> Hrm, rather than introduce another variable that we don't use and always =
perform
> both tests, when most of the time we only need to do the first, how about
> something like:
>=20

Darren,

That looks good to me, thanks!

>=20
> From 2cb5959dadec769167350a9bcb1d212a02b17af8 Mon Sep 17 00:00:00 2001
> Message-Id:
> <2cb5959dadec769167350a9bcb1d212a02b17af8.1524181265.git.dvhart@infrad
> ead.org>
> From: Mario Limonciello <mario.limonciello@dell.com>
> Date: Tue, 17 Apr 2018 14:45:56 -0500
> Subject: [PATCH] platform/x86: dell-smbios: Match on www.dell.com in OEM
>  strings too
>=20
> Sergey reported that some much older Dell systems don't support
> the OEM string "Dell System" but instead supported www.dell.com
> in OEM strings.
>=20
> Match both of these to indicate that this driver is running on
> a Dell system.
>=20
> Reported-by: Sergey Kubushyn <ksi@koi8.net>
> Tested-by: Sergey Kubushyn <ksi@koi8.net>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> [dvhart: Simplify DMI logic and eliminate unnecessary variables]
> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> ---
>  drivers/platform/x86/dell-smbios-base.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-smbios-base.c b/drivers/platform/x=
86/dell-
> smbios-base.c
> index 33fb2a20458a..9dc282ed5a9e 100644
> --- a/drivers/platform/x86/dell-smbios-base.c
> +++ b/drivers/platform/x86/dell-smbios-base.c
> @@ -555,11 +555,10 @@ static void free_group(struct platform_device *pdev=
)
>=20
>  static int __init dell_smbios_init(void)
>  {
> -	const struct dmi_device *valid;
>  	int ret, wmi, smm;
>=20
> -	valid =3D dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System",
> NULL);
> -	if (!valid) {
> +	if (!dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System", NULL)
> &&
> +	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com",
> NULL)) {
>  		pr_err("Unable to run on non-Dell system\n");
>  		return -ENODEV;
>  	}
> --
> 2.14.3
>=20
>=20
> --
> Darren Hart
> VMware Open Source Technology Center
