From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH V9 1/2] intel_pmc_ipc: update acpi resource structure
 for Punit
Date: Thu, 10 Dec 2015 13:13:01 +0200
Message-ID: <1449745981.30729.71.camel@linux.intel.com>
References: <1449771661-40300-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:31608 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751375AbbLJLMs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Dec 2015 06:12:48 -0500
In-Reply-To: <1449771661-40300-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Qipeng Zha <qipeng.zha@intel.com>, platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org

On Fri, 2015-12-11 at 02:21 +0800, Qipeng Zha wrote:
> BIOS restructure exported memory resources for Punit
> in acpi table, So update resources for Punit.
>=20
> Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
>=20

Almost. See below.

> ---
> change in v9
> =C2=A0rename indexes of all acpi resources;
> =C2=A0add comments for punit_res;
> ---
> =C2=A0drivers/platform/x86/intel_pmc_ipc.c | 114 ++++++++++++++++++++=
++++-
> ----------
> =C2=A01 file changed, 80 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c
> b/drivers/platform/x86/intel_pmc_ipc.c
> index 28b2a12..00812a4 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -68,8 +68,12 @@
> =C2=A0#define PLAT_RESOURCE_IPC_INDEX		0
> =C2=A0#define PLAT_RESOURCE_IPC_SIZE		0x1000
> =C2=A0#define PLAT_RESOURCE_GCR_SIZE		0x1000
> -#define PLAT_RESOURCE_PUNIT_DATA_INDEX	1
> -#define PLAT_RESOURCE_PUNIT_INTER_INDEX	2
> +#define PLAT_RESOURCE_BIOS_DATA_INDEX	1
> +#define PLAT_RESOURCE_BIOS_INTER_INDEX	2

Since there is a comment and new version will be anticipated I also
would like to propose to change INTER to IFACE because latter more
particular. Darren?

> +#define PLAT_RESOURCE_ISP_DATA_INDEX	4
> +#define PLAT_RESOURCE_ISP_INTER_INDEX	5
> +#define PLAT_RESOURCE_GTD_DATA_INDEX	6
> +#define PLAT_RESOURCE_GTD_INTER_INDEX	7
> =C2=A0#define PLAT_RESOURCE_ACPI_IO_INDEX	0
> =C2=A0
> =C2=A0/*
> @@ -105,10 +109,6 @@ static struct intel_pmc_ipc_dev {
> =C2=A0	int gcr_size;
> =C2=A0
> =C2=A0	/* punit */
> -	resource_size_t punit_base;
> -	int punit_size;
> -	resource_size_t punit_base2;
> -	int punit_size2;
> =C2=A0	struct platform_device *punit_dev;
> =C2=A0} ipcdev;
> =C2=A0
> @@ -444,9 +444,22 @@ static const struct attribute_group
> intel_ipc_group =3D {
> =C2=A0	.attrs =3D intel_ipc_attrs,
> =C2=A0};
> =C2=A0
> -#define PUNIT_RESOURCE_INTER		1
> -static struct resource punit_res[] =3D {
> -	/* Punit */
> +static struct resource punit_res_array[] =3D {
> +	/* Punit BIOS */
> +	{
> +		.flags =3D IORESOURCE_MEM,
> +	},
> +	{
> +		.flags =3D IORESOURCE_MEM,
> +	},
> +	/* Punit ISP */
> +	{
> +		.flags =3D IORESOURCE_MEM,
> +	},
> +	{
> +		.flags =3D IORESOURCE_MEM,
> +	},
> +	/* Punit GTD */
> =C2=A0	{
> =C2=A0		.flags =3D IORESOURCE_MEM,
> =C2=A0	},
> @@ -481,7 +494,6 @@ static struct itco_wdt_platform_data tco_info =3D=
 {
> =C2=A0static int ipc_create_punit_device(void)
> =C2=A0{
> =C2=A0	struct platform_device *pdev;
> -	struct resource *res;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	pdev =3D platform_device_alloc(PUNIT_DEVICE_NAME, -1);
> @@ -491,17 +503,8 @@ static int ipc_create_punit_device(void)
> =C2=A0	}
> =C2=A0
> =C2=A0	pdev->dev.parent =3D ipcdev.dev;
> -
> -	res =3D punit_res;
> -	res->start =3D ipcdev.punit_base;
> -	res->end =3D res->start + ipcdev.punit_size - 1;
> -
> -	res =3D punit_res + PUNIT_RESOURCE_INTER;
> -	res->start =3D ipcdev.punit_base2;
> -	res->end =3D res->start + ipcdev.punit_size2 - 1;
> -
> -	ret =3D platform_device_add_resources(pdev, punit_res,
> -					=C2=A0=C2=A0=C2=A0=C2=A0ARRAY_SIZE(punit_res));
> +	ret =3D platform_device_add_resources(pdev, punit_res_array,
> +					=C2=A0=C2=A0=C2=A0=C2=A0ARRAY_SIZE(punit_res_arr
> ay));
> =C2=A0	if (ret) {
> =C2=A0		dev_err(ipcdev.dev, "Failed to add platform punit
> resources\n");
> =C2=A0		goto err;
> @@ -590,7 +593,7 @@ static int ipc_create_pmc_devices(void)
> =C2=A0
> =C2=A0static int ipc_plat_get_res(struct platform_device *pdev)
> =C2=A0{
> -	struct resource *res;
> +	struct resource *res, *punit_res;
> =C2=A0	void __iomem *addr;
> =C2=A0	int size;
> =C2=A0
> @@ -606,28 +609,71 @@ static int ipc_plat_get_res(struct
> platform_device *pdev)
> =C2=A0	dev_info(&pdev->dev, "io res: %llx %x\n",
> =C2=A0		=C2=A0(long long)res->start, (int)resource_size(res));
> =C2=A0
> +	/* This is index 0 to cover BIOS data register */
> +	punit_res =3D punit_res_array;
> =C2=A0	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> -				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_PUNIT_DATA_INDEX);
> +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_BIOS_DATA_INDEX);
> =C2=A0	if (!res) {
> -		dev_err(&pdev->dev, "Failed to get punit
> resource\n");
> +		dev_err(&pdev->dev, "Failed to get res of punit BIOS
> data\n");
> =C2=A0		return -ENXIO;
> =C2=A0	}
> -	size =3D resource_size(res);
> -	ipcdev.punit_base =3D res->start;
> -	ipcdev.punit_size =3D size;
> -	dev_info(&pdev->dev, "punit data res: %llx %x\n",
> +	*punit_res =3D *res;
> +	dev_info(&pdev->dev, "punit BIOS data res: %llx %x\n",
> =C2=A0		=C2=A0(long long)res->start, (int)resource_size(res));
> =C2=A0
> =C2=A0	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> -				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_PUNIT_INTER_INDEX)
> ;
> +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_BIOS_INTER_INDEX);
> =C2=A0	if (!res) {
> -		dev_err(&pdev->dev, "Failed to get punit inter
> resource\n");
> +		dev_err(&pdev->dev, "Failed to get res of punit BIOS
> inter\n");
> =C2=A0		return -ENXIO;
> =C2=A0	}
> -	size =3D resource_size(res);
> -	ipcdev.punit_base2 =3D res->start;
> -	ipcdev.punit_size2 =3D size;
> -	dev_info(&pdev->dev, "punit interface res: %llx %x\n",
> +	/* This is index 1 to cover BIOS interface register */
> +	*++punit_res =3D *res;
> +	dev_info(&pdev->dev, "punit BIOS interface res: %llx %x\n",
> +		=C2=A0(long long)res->start, (int)resource_size(res));

There is a specifier to print struct resource, please use it instead.
%pR IIRC.

Same for all similar cases below.

> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_ISP_DATA_INDEX);
> +	if (!res) {
> +		dev_err(&pdev->dev, "Failed to get res of punit ISP
> data\n");
> +		return -ENXIO;
> +	}
> +	/* This is index 2 to cover ISP data register */
> +	*++punit_res =3D *res;
> +	dev_info(&pdev->dev, "punit ISP data res: %llx %x\n",
> +		=C2=A0(long long)res->start, (int)resource_size(res));
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_ISP_INTER_INDEX);
> +	if (!res) {
> +		dev_err(&pdev->dev, "Failed to get res of punit ISP
> inter\n");
> +		return -ENXIO;
> +	}
> +	/* This is index 3 to cover ISP interface register */
> +	*++punit_res =3D *res;
> +	dev_info(&pdev->dev, "punit ISP interface res: %llx %x\n",
> +		=C2=A0(long long)res->start, (int)resource_size(res));
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_GTD_DATA_INDEX);
> +	if (!res) {
> +		dev_err(&pdev->dev, "Failed to get res of punit GTD
> data\n");
> +		return -ENXIO;
> +	}
> +	/* This is index 4 to cover GTD data register */
> +	*++punit_res =3D *res;
> +	dev_info(&pdev->dev, "punit GTD data res: %llx %x\n",
> +		=C2=A0(long long)res->start, (int)resource_size(res));
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_GTD_INTER_INDEX);
> +	if (!res) {
> +		dev_err(&pdev->dev, "Failed to get res of punit GTD
> inter\n");
> +		return -ENXIO;
> +	}
> +	/* This is index 5 to cover GTD interface register */
> +	*++punit_res =3D *res;
> +	dev_info(&pdev->dev, "punit GTD interface res: %llx %x\n",
> =C2=A0		=C2=A0(long long)res->start, (int)resource_size(res));
> =C2=A0
> =C2=A0	res =3D platform_get_resource(pdev, IORESOURCE_MEM,

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
