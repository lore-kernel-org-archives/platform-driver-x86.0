From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform:x86 decouple telemetry driver from the optional
 IPC resources
Date: Sun, 10 Apr 2016 16:17:20 +0300
Message-ID: <CAHp75VeKgVwOQ7U9=a92hcts8tPJriRtNJ3h2nHL_BXVXc7D5Q@mail.gmail.com>
References: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459452489-46827-1-git-send-email-aubrey.li@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aubrey Li <aubrey.li@linux.intel.com>
Cc: qipeng.zha@intel.com, "dvhart@infradead.org" <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Mar 31, 2016 at 10:28 PM, Aubrey Li <aubrey.li@linux.intel.com>=
 wrote:
> Currently the optional IPC resources prevent telemetry driver from
> probing if these resources are not in ACPI table. This patch decouple=
s
> telemetry driver from these optional resources, so that telemetry dri=
ver
> has dependency only on the necessary ACPI resources.

Darren, I have comments as well.

>
> Signed-off-by: Aubrey Li <aubrey.li@linux.intel.com>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c   |   48 +++++++++++++++-------=
----------
>  drivers/platform/x86/intel_punit_ipc.c |   48 +++++++++++++++++++++-=
----------
>  2 files changed, 54 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/=
x86/intel_pmc_ipc.c
> index 092519e..29d9c02 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -686,8 +686,8 @@ static int ipc_plat_get_res(struct platform_devic=
e *pdev)
>         ipcdev.acpi_io_size =3D size;
>         dev_info(&pdev->dev, "io res: %pR\n", res);
>
> -       /* This is index 0 to cover BIOS data register */
>         punit_res =3D punit_res_array;
> +       /* This is index 0 to cover BIOS data register */
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>                                     PLAT_RESOURCE_BIOS_DATA_INDEX);
>         if (!res) {
> @@ -697,55 +697,51 @@ static int ipc_plat_get_res(struct platform_dev=
ice *pdev)
>         *punit_res =3D *res;
>         dev_info(&pdev->dev, "punit BIOS data res: %pR\n", res);
>
> +       /* This is index 1 to cover BIOS interface register */
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>                                     PLAT_RESOURCE_BIOS_IFACE_INDEX);
>         if (!res) {
>                 dev_err(&pdev->dev, "Failed to get res of punit BIOS =
iface\n");
>                 return -ENXIO;
>         }
> -       /* This is index 1 to cover BIOS interface register */
>         *++punit_res =3D *res;
>         dev_info(&pdev->dev, "punit BIOS interface res: %pR\n", res);
>
> +       /* This is index 2 to cover ISP data register, optional */

All above looks like a commentary fixes (except an additional
'optional' word in one case). Can you do this separately?


>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>                                     PLAT_RESOURCE_ISP_DATA_INDEX);
> -       if (!res) {
> -               dev_err(&pdev->dev, "Failed to get res of punit ISP d=
ata\n");
> -               return -ENXIO;
> +       ++punit_res;
> +       if (res) {
> +               *punit_res =3D *res;
> +               dev_info(&pdev->dev, "punit ISP data res: %pR\n", res=
);

Okay, what if you re-arrange this to some helper first

int =E2=80=A6_assign_res(*pdev, index, *punit_res)
{
 struct resource res;
 res =3D platform_get_resource(pdev, =E2=80=A6, index);
 if (!res)
  return -ERRNO;
 *punit_res =3D *res;
 dev_dbg(%pR);
 return 0;
}

In this patch you move to optional by
dev_err -> dev_warn

and use

if (ret)
  dev_warn( "=E2=80=A6skip  optional resource=E2=80=A6" );

instead of
if (ret) {
 dev_err();
 return ret;
}

>         }
> -       /* This is index 2 to cover ISP data register */
> -       *++punit_res =3D *res;
> -       dev_info(&pdev->dev, "punit ISP data res: %pR\n", res);
>
> +       /* This is index 3 to cover ISP interface register, optional =
*/
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>                                     PLAT_RESOURCE_ISP_IFACE_INDEX);
> -       if (!res) {
> -               dev_err(&pdev->dev, "Failed to get res of punit ISP i=
face\n");
> -               return -ENXIO;
> +       ++punit_res;
> +       if (res) {
> +               *punit_res =3D *res;
> +               dev_info(&pdev->dev, "punit ISP interface res: %pR\n"=
, res);
>         }
> -       /* This is index 3 to cover ISP interface register */
> -       *++punit_res =3D *res;
> -       dev_info(&pdev->dev, "punit ISP interface res: %pR\n", res);
>
> +       /* This is index 4 to cover GTD data register, optional */
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>                                     PLAT_RESOURCE_GTD_DATA_INDEX);
> -       if (!res) {
> -               dev_err(&pdev->dev, "Failed to get res of punit GTD d=
ata\n");
> -               return -ENXIO;
> +       ++punit_res;
> +       if (res) {
> +               *punit_res =3D *res;
> +               dev_info(&pdev->dev, "punit GTD data res: %pR\n", res=
);
>         }
> -       /* This is index 4 to cover GTD data register */
> -       *++punit_res =3D *res;
> -       dev_info(&pdev->dev, "punit GTD data res: %pR\n", res);
>
> +       /* This is index 5 to cover GTD interface register, optional =
*/
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>                                     PLAT_RESOURCE_GTD_IFACE_INDEX);
> -       if (!res) {
> -               dev_err(&pdev->dev, "Failed to get res of punit GTD i=
face\n");
> -               return -ENXIO;
> +       ++punit_res;
> +       if (res) {
> +               *punit_res =3D *res;
> +               dev_info(&pdev->dev, "punit GTD interface res: %pR\n"=
, res);
>         }
> -       /* This is index 5 to cover GTD interface register */
> -       *++punit_res =3D *res;
> -       dev_info(&pdev->dev, "punit GTD interface res: %pR\n", res);
>
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM,
>                                     PLAT_RESOURCE_IPC_INDEX);
> diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platfor=
m/x86/intel_punit_ipc.c
> index bd87540..a47a41f 100644
> --- a/drivers/platform/x86/intel_punit_ipc.c
> +++ b/drivers/platform/x86/intel_punit_ipc.c
> @@ -227,6 +227,11 @@ static int intel_punit_get_bars(struct platform_=
device *pdev)
>         struct resource *res;
>         void __iomem *addr;
>
> +       /*
> +        * The following resources are required
> +        * - BIOS_IPC BASE_DATA
> +        * - BIOS_IPC BASE_IFACE
> +        */
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         addr =3D devm_ioremap_resource(&pdev->dev, res);
>         if (IS_ERR(addr))
> @@ -239,29 +244,40 @@ static int intel_punit_get_bars(struct platform=
_device *pdev)
>                 return PTR_ERR(addr);
>         punit_ipcdev->base[BIOS_IPC][BASE_IFACE] =3D addr;
>
> +       /*
> +        * The following resources are optional
> +        * - ISPDRIVER_IPC BASE_DATA
> +        * - ISPDRIVER_IPC BASE_IFACE
> +        * - GTDRIVER_IPC BASE_DATA
> +        * - GTDRIVER_IPC BASE_IFACE
> +        */
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 2);
> -       addr =3D devm_ioremap_resource(&pdev->dev, res);
> -       if (IS_ERR(addr))
> -               return PTR_ERR(addr);
> -       punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] =3D addr;
> +       if (res) {
> +               addr =3D devm_ioremap_resource(&pdev->dev, res);
> +               if (!IS_ERR(addr))
> +                       punit_ipcdev->base[ISPDRIVER_IPC][BASE_DATA] =
=3D addr;
> +       }

And here, what about just replacing return to dev_warn()?

>
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 3);
> -       addr =3D devm_ioremap_resource(&pdev->dev, res);
> -       if (IS_ERR(addr))
> -               return PTR_ERR(addr);
> -       punit_ipcdev->base[ISPDRIVER_IPC][BASE_IFACE] =3D addr;
> +       if (res) {
> +               addr =3D devm_ioremap_resource(&pdev->dev, res);
> +               if (!IS_ERR(addr))
> +                       punit_ipcdev->base[ISPDRIVER_IPC][BASE_IFACE]=
 =3D addr;
> +       }
>
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 4);
> -       addr =3D devm_ioremap_resource(&pdev->dev, res);
> -       if (IS_ERR(addr))
> -               return PTR_ERR(addr);
> -       punit_ipcdev->base[GTDRIVER_IPC][BASE_DATA] =3D addr;
> +       if (res) {
> +               addr =3D devm_ioremap_resource(&pdev->dev, res);
> +               if (!IS_ERR(addr))
> +                       punit_ipcdev->base[GTDRIVER_IPC][BASE_DATA] =3D=
 addr;
> +       }
>
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 5);
> -       addr =3D devm_ioremap_resource(&pdev->dev, res);
> -       if (IS_ERR(addr))
> -               return PTR_ERR(addr);
> -       punit_ipcdev->base[GTDRIVER_IPC][BASE_IFACE] =3D addr;
> +       if (res) {
> +               addr =3D devm_ioremap_resource(&pdev->dev, res);
> +               if (!IS_ERR(addr))
> +                       punit_ipcdev->base[GTDRIVER_IPC][BASE_IFACE] =
=3D addr;
> +       }
>
>         return 0;
>  }
> --
> 1.7.10.4
>



--=20
With Best Regards,
Andy Shevchenko
