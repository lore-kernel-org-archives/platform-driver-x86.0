From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform:x86 decouple telemetry driver from the optional
 IPC resources
Date: Thu, 14 Apr 2016 17:32:36 -0700
Message-ID: <20160415003236.GA3232@f23x64.localdomain>
References: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
 <CAHp75VeKgVwOQ7U9=a92hcts8tPJriRtNJ3h2nHL_BXVXc7D5Q@mail.gmail.com>
 <570A5948.8000405@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52226 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752406AbcDOAcj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Apr 2016 20:32:39 -0400
Content-Disposition: inline
In-Reply-To: <570A5948.8000405@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Li, Aubrey" <aubrey.li@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, qipeng.zha@intel.com, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Apr 10, 2016 at 09:46:48PM +0800, Li, Aubrey wrote:
> On 2016/4/10 21:17, Andy Shevchenko wrote:
> > On Thu, Mar 31, 2016 at 10:28 PM, Aubrey Li <aubrey.li@linux.intel.=
com> wrote:
> >> Currently the optional IPC resources prevent telemetry driver from
> >> probing if these resources are not in ACPI table. This patch decou=
ples
> >> telemetry driver from these optional resources, so that telemetry =
driver
> >> has dependency only on the necessary ACPI resources.
> >=20
> > Darren, I have comments as well.
> >=20
> >>
> >> Signed-off-by: Aubrey Li <aubrey.li@linux.intel.com>
> >> ---
> >>  drivers/platform/x86/intel_pmc_ipc.c   |   48 +++++++++++++++----=
-------------
> >>  drivers/platform/x86/intel_punit_ipc.c |   48 +++++++++++++++++++=
++-----------
> >>  2 files changed, 54 insertions(+), 42 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platfo=
rm/x86/intel_pmc_ipc.c
> >> index 092519e..29d9c02 100644
> >> --- a/drivers/platform/x86/intel_pmc_ipc.c
> >> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> >> @@ -686,8 +686,8 @@ static int ipc_plat_get_res(struct platform_de=
vice *pdev)
> >>         ipcdev.acpi_io_size =3D size;
> >>         dev_info(&pdev->dev, "io res: %pR\n", res);
> >>
> >> -       /* This is index 0 to cover BIOS data register */
> >>         punit_res =3D punit_res_array;
> >> +       /* This is index 0 to cover BIOS data register */
> >>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> >>                                     PLAT_RESOURCE_BIOS_DATA_INDEX)=
;
> >>         if (!res) {
> >> @@ -697,55 +697,51 @@ static int ipc_plat_get_res(struct platform_=
device *pdev)
> >>         *punit_res =3D *res;
> >>         dev_info(&pdev->dev, "punit BIOS data res: %pR\n", res);
> >>
> >> +       /* This is index 1 to cover BIOS interface register */
> >>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> >>                                     PLAT_RESOURCE_BIOS_IFACE_INDEX=
);
> >>         if (!res) {
> >>                 dev_err(&pdev->dev, "Failed to get res of punit BI=
OS iface\n");
> >>                 return -ENXIO;
> >>         }
> >> -       /* This is index 1 to cover BIOS interface register */
> >>         *++punit_res =3D *res;
> >>         dev_info(&pdev->dev, "punit BIOS interface res: %pR\n", re=
s);
> >>
> >> +       /* This is index 2 to cover ISP data register, optional */
> >=20
> > All above looks like a commentary fixes (except an additional
> > 'optional' word in one case). Can you do this separately?
>=20
> I don't think it's necessary.
>=20

This is typically necessary as you would not want the comment fixes abo=
ve to be
backed out if the functional changes below were found to be buggy and r=
everted.
This is why we encourage small functional changes. It protects against
inadvertent reverts and facilitates review.

That said, these comment changes continue below in a way that makes it =
a bit
difficult to isolate them out, so I do not particularly object.

That said, everyone should understand that Andy is part of the
platform-driver-x86 maintainer team so please respect his comments as s=
uch.

> >=20
> >=20
> >>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> >>                                     PLAT_RESOURCE_ISP_DATA_INDEX);
> >> -       if (!res) {
> >> -               dev_err(&pdev->dev, "Failed to get res of punit IS=
P data\n");
> >> -               return -ENXIO;
> >> +       ++punit_res;
> >> +       if (res) {
> >> +               *punit_res =3D *res;
> >> +               dev_info(&pdev->dev, "punit ISP data res: %pR\n", =
res);
> >=20
> > Okay, what if you re-arrange this to some helper first
> >=20
>=20
> Thanks for the idea, but I don't like a helper here, did you see
> anything harmful of the current implementation?

In both arguments, we need to identify the WHY.

I imagine Andy is trying to reduce the copy and paste potential for err=
or as
well as error introduction in future patches. There are... 7 or so case=
s with
near identical usage, that's a compelling argument for a refactor such =
as the
helper Andy suggests.

Aubrey, you said you don't like it. Why is that? Will it not save enoug=
h lines
of code to be worth it? Are you concerned about revalidating the change=
?

In my opinion, a refactor is a good suggestion, but I would be OK with =
this
patch as it is and a refactor to follow. I hesitate to do this when the=
 refactor
is really critical as it may not happen, but in this case, it doesn't s=
eem
absolutely necessary.

>=20
> > int =E2=80=A6_assign_res(*pdev, index, *punit_res)
> > {
> >  struct resource res;
> >  res =3D platform_get_resource(pdev, =E2=80=A6, index);
> >  if (!res)
> >   return -ERRNO;
> >  *punit_res =3D *res;
> >  dev_dbg(%pR);
> >  return 0;
> > }
> >=20
> > In this patch you move to optional by
> > dev_err -> dev_warn
> >=20
> > and use
> >=20
> > if (ret)
> >   dev_warn( "=E2=80=A6skip  optional resource=E2=80=A6" );
> >=20
> > instead of
> > if (ret) {
> >  dev_err();
> >  return ret;
> > }
> >=20
> >>         }
> >> -       /* This is index 2 to cover ISP data register */
> >> -       *++punit_res =3D *res;
> >> -       dev_info(&pdev->dev, "punit ISP data res: %pR\n", res);
> >>
> >> +       /* This is index 3 to cover ISP interface register, option=
al */
> >>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> >>                                     PLAT_RESOURCE_ISP_IFACE_INDEX)=
;
> >> -       if (!res) {
> >> -               dev_err(&pdev->dev, "Failed to get res of punit IS=
P iface\n");
> >> -               return -ENXIO;
> >> +       ++punit_res;
> >> +       if (res) {
> >> +               *punit_res =3D *res;
> >> +               dev_info(&pdev->dev, "punit ISP interface res: %pR=
\n", res);
> >>         }
> >> -       /* This is index 3 to cover ISP interface register */
> >> -       *++punit_res =3D *res;
> >> -       dev_info(&pdev->dev, "punit ISP interface res: %pR\n", res=
);
> >>
> >> +       /* This is index 4 to cover GTD data register, optional */
> >>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> >>                                     PLAT_RESOURCE_GTD_DATA_INDEX);
> >> -       if (!res) {
> >> -               dev_err(&pdev->dev, "Failed to get res of punit GT=
D data\n");
> >> -               return -ENXIO;
> >> +       ++punit_res;
> >> +       if (res) {
> >> +               *punit_res =3D *res;
> >> +               dev_info(&pdev->dev, "punit GTD data res: %pR\n", =
res);
> >>         }
> >> -       /* This is index 4 to cover GTD data register */
> >> -       *++punit_res =3D *res;
> >> -       dev_info(&pdev->dev, "punit GTD data res: %pR\n", res);
> >>
> >> +       /* This is index 5 to cover GTD interface register, option=
al */
> >>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> >>                                     PLAT_RESOURCE_GTD_IFACE_INDEX)=
;
> >> -       if (!res) {
> >> -               dev_err(&pdev->dev, "Failed to get res of punit GT=
D iface\n");
> >> -               return -ENXIO;
> >> +       ++punit_res;
> >> +       if (res) {
> >> +               *punit_res =3D *res;
> >> +               dev_info(&pdev->dev, "punit GTD interface res: %pR=
\n", res);
> >>         }
> >> -       /* This is index 5 to cover GTD interface register */
> >> -       *++punit_res =3D *res;
> >> -       dev_info(&pdev->dev, "punit GTD interface res: %pR\n", res=
);
> >>
> >>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> >>                                     PLAT_RESOURCE_IPC_INDEX);
> >> diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/plat=
form/x86/intel_punit_ipc.c
> >> index bd87540..a47a41f 100644
> >> --- a/drivers/platform/x86/intel_punit_ipc.c
> >> +++ b/drivers/platform/x86/intel_punit_ipc.c
> >> @@ -227,6 +227,11 @@ static int intel_punit_get_bars(struct platfo=
rm_device *pdev)
> >>         struct resource *res;
> >>         void __iomem *addr;
> >>
> >> +       /*
> >> +        * The following resources are required
> >> +        * - BIOS_IPC BASE_DATA
> >> +        * - BIOS_IPC BASE_IFACE
> >> +        */
> >>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >>         addr =3D devm_ioremap_resource(&pdev->dev, res);
> >>         if (IS_ERR(addr))
> >> @@ -239,29 +244,40 @@ static int intel_punit_get_bars(struct platf=
orm_device *pdev)
> >>                 return PTR_ERR(addr);
> >>         punit_ipcdev->base[BIOS_IPC][BASE_IFACE] =3D addr;
> >>
> >> +       /*
> >> +        * The following resources are optional
> >> +        * - ISPDRIVER_IPC BASE_DATA
> >> +        * - ISPDRIVER_IPC BASE_IFACE
> >> +        * - GTDRIVER_IPC BASE_DATA
> >> +        * - GTDRIVER_IPC BASE_IFACE
> >> +        */
> >>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
> >> -       addr =3D devm_ioremap_resource(&pdev->dev, res);
> >> -       if (IS_ERR(addr))
> >> -               return PTR_ERR(addr);
> >> -       punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] =3D addr;
> >> +       if (res) {
> >> +               addr =3D devm_ioremap_resource(&pdev->dev, res);
> >> +               if (!IS_ERR(addr))
> >> +                       punit_ipcdev->base[ISPDRIVER_IPC][BASE_DAT=
A] =3D addr;
> >> +       }
> >=20
> > And here, what about just replacing return to dev_warn()?
>=20
> I don't think we need to continue the subsequent ops if an error addr=
ess
> returns.

Why is that? Will the driver fail to provide any functionality? Or coul=
d it be
the other IFACEs could still be of some use?

This one does need a justification.

>=20
> Thanks,
> -Aubrey
>=20
