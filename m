From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH V8 1/2] intel_pmc_ipc: update acpi resource structure
 for Punit
Date: Tue, 08 Dec 2015 13:10:21 +0200
Message-ID: <1449573021.30729.34.camel@linux.intel.com>
References: <1449507305-51709-1-git-send-email-qipeng.zha@intel.com>
	 <20151207234514.GA12897@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:7271 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932569AbbLHLK0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Dec 2015 06:10:26 -0500
In-Reply-To: <20151207234514.GA12897@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Qipeng Zha <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, 2015-12-07 at 15:45 -0800, Darren Hart wrote:
> On Tue, Dec 08, 2015 at 12:55:04AM +0800, Qipeng Zha wrote:
> > BIOS restructure exported memory resources for Punit
> > in acpi table, So update resources for Punit.
> >=20
> > Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
>=20
> Thank you for the update Qipeng. I will review shortly.
>=20
> +Andriy who originally raised the concern over the ACPI resource
> assumptions in
> the previous version. Andriy, this resource allocation looks to be a
> substantial
> improvement to me. Do you have any further concerns?

I will check it later.

Hmm=E2=80=A6 I am not subscribed to platform-driver-x86@ and wasn't in =
Cc list,
so it might delay me response.

>=20
> > ---
> > =C2=A0drivers/platform/x86/intel_pmc_ipc.c | 142
> > +++++++++++++++++++++++------------
> > =C2=A01 file changed, 96 insertions(+), 46 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/intel_pmc_ipc.c
> > b/drivers/platform/x86/intel_pmc_ipc.c
> > index 28b2a12..c699950 100644
> > --- a/drivers/platform/x86/intel_pmc_ipc.c
> > +++ b/drivers/platform/x86/intel_pmc_ipc.c
> > @@ -65,12 +65,16 @@
> > =C2=A0#define IPC_TRIGGER_MODE_IRQ		true
> > =C2=A0
> > =C2=A0/* exported resources from IFWI */
> > -#define PLAT_RESOURCE_IPC_INDEX		0
> > -#define PLAT_RESOURCE_IPC_SIZE		0x1000
> > -#define PLAT_RESOURCE_GCR_SIZE		0x1000
> > -#define PLAT_RESOURCE_PUNIT_DATA_INDEX	1
> > -#define PLAT_RESOURCE_PUNIT_INTER_INDEX	2
> > -#define PLAT_RESOURCE_ACPI_IO_INDEX	0
> > +#define PLAT_RES_IPC_INDEX		0
> > +#define PLAT_RES_IPC_SIZE		0x1000
> > +#define PLAT_RES_GCR_SIZE		0x1000
> > +#define PLAT_RES_PUNIT_BIOS_DATA_INDEX	1
> > +#define PLAT_RES_PUNIT_BIOS_INTER_INDEX	2
> > +#define PLAT_RES_PUNIT_ISP_DATA_INDEX	4
> > +#define PLAT_RES_PUNIT_ISP_INTER_INDEX	5
> > +#define PLAT_RES_PUNIT_GTD_DATA_INDEX	6
> > +#define PLAT_RES_PUNIT_GTD_INTER_INDEX	7
> > +#define PLAT_RES_ACPI_IO_INDEX	0
> > =C2=A0
> > =C2=A0/*
> > =C2=A0 * BIOS does not create an ACPI device for each PMC function,
> > @@ -105,10 +109,6 @@ static struct intel_pmc_ipc_dev {
> > =C2=A0	int gcr_size;
> > =C2=A0
> > =C2=A0	/* punit */
> > -	resource_size_t punit_base;
> > -	int punit_size;
> > -	resource_size_t punit_base2;
> > -	int punit_size2;
> > =C2=A0	struct platform_device *punit_dev;
> > =C2=A0} ipcdev;
> > =C2=A0
> > @@ -444,9 +444,22 @@ static const struct attribute_group
> > intel_ipc_group =3D {
> > =C2=A0	.attrs =3D intel_ipc_attrs,
> > =C2=A0};
> > =C2=A0
> > -#define PUNIT_RESOURCE_INTER		1
> > -static struct resource punit_res[] =3D {
> > -	/* Punit */
> > +static struct resource punit_res_array[] =3D {
> > +	/* Punit BIOS */
> > +	{
> > +		.flags =3D IORESOURCE_MEM,
> > +	},
> > +	{
> > +		.flags =3D IORESOURCE_MEM,
> > +	},
> > +	/* Punit ISP */
> > +	{
> > +		.flags =3D IORESOURCE_MEM,
> > +	},
> > +	{
> > +		.flags =3D IORESOURCE_MEM,
> > +	},
> > +	/* Punit GTD */
> > =C2=A0	{
> > =C2=A0		.flags =3D IORESOURCE_MEM,
> > =C2=A0	},
> > @@ -481,7 +494,6 @@ static struct itco_wdt_platform_data tco_info =3D
> > {
> > =C2=A0static int ipc_create_punit_device(void)
> > =C2=A0{
> > =C2=A0	struct platform_device *pdev;
> > -	struct resource *res;
> > =C2=A0	int ret;
> > =C2=A0
> > =C2=A0	pdev =3D platform_device_alloc(PUNIT_DEVICE_NAME, -1);
> > @@ -491,17 +503,8 @@ static int ipc_create_punit_device(void)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	pdev->dev.parent =3D ipcdev.dev;
> > -
> > -	res =3D punit_res;
> > -	res->start =3D ipcdev.punit_base;
> > -	res->end =3D res->start + ipcdev.punit_size - 1;
> > -
> > -	res =3D punit_res + PUNIT_RESOURCE_INTER;
> > -	res->start =3D ipcdev.punit_base2;
> > -	res->end =3D res->start + ipcdev.punit_size2 - 1;
> > -
> > -	ret =3D platform_device_add_resources(pdev, punit_res,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0ARRAY_SIZE(punit_res))
> > ;
> > +	ret =3D platform_device_add_resources(pdev, punit_res_array,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0ARRAY_SIZE(punit_res_a
> > rray));
> > =C2=A0	if (ret) {
> > =C2=A0		dev_err(ipcdev.dev, "Failed to add platform punit
> > resources\n");
> > =C2=A0		goto err;
> > @@ -590,12 +593,12 @@ static int ipc_create_pmc_devices(void)
> > =C2=A0
> > =C2=A0static int ipc_plat_get_res(struct platform_device *pdev)
> > =C2=A0{
> > -	struct resource *res;
> > +	struct resource *res, *punit_res;
> > =C2=A0	void __iomem *addr;
> > =C2=A0	int size;
> > =C2=A0
> > =C2=A0	res =3D platform_get_resource(pdev, IORESOURCE_IO,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_ACPI_IO_INDEX);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RES_ACPI_IO_INDEX);
> > =C2=A0	if (!res) {
> > =C2=A0		dev_err(&pdev->dev, "Failed to get io
> > resource\n");
> > =C2=A0		return -ENXIO;
> > @@ -606,37 +609,84 @@ static int ipc_plat_get_res(struct
> > platform_device *pdev)
> > =C2=A0	dev_info(&pdev->dev, "io res: %llx %x\n",
> > =C2=A0		=C2=A0(long long)res->start, (int)resource_size(res));
> > =C2=A0
> > +	punit_res =3D punit_res_array;
> > =C2=A0	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_PUNIT_DATA_INDEX
> > );
> > +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RES_PUNIT_BIOS_DATA_INDEX
> > );
> > =C2=A0	if (!res) {
> > -		dev_err(&pdev->dev, "Failed to get punit
> > resource\n");
> > +		dev_err(&pdev->dev, "Failed to get res of punit
> > BIOS data\n");
> > =C2=A0		return -ENXIO;
> > =C2=A0	}
> > -	size =3D resource_size(res);
> > -	ipcdev.punit_base =3D res->start;
> > -	ipcdev.punit_size =3D size;
> > -	dev_info(&pdev->dev, "punit data res: %llx %x\n",
> > +	punit_res->start =3D res->start;
> > +	punit_res->end =3D res->start + resource_size(res) - 1;
> > +	dev_info(&pdev->dev, "punit BIOS data res: %llx %x\n",
> > =C2=A0		=C2=A0(long long)res->start, (int)resource_size(res));
> > =C2=A0
> > =C2=A0	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_PUNIT_INTER_INDE
> > X);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RES_PUNIT_BIOS_INTER_INDE
> > X);
> > =C2=A0	if (!res) {
> > -		dev_err(&pdev->dev, "Failed to get punit inter
> > resource\n");
> > +		dev_err(&pdev->dev, "Failed to get res of punit
> > BIOS inter\n");
> > =C2=A0		return -ENXIO;
> > =C2=A0	}
> > -	size =3D resource_size(res);
> > -	ipcdev.punit_base2 =3D res->start;
> > -	ipcdev.punit_size2 =3D size;
> > -	dev_info(&pdev->dev, "punit interface res: %llx %x\n",
> > +	punit_res++;
> > +	punit_res->start =3D res->start;
> > +	punit_res->end =3D res->start + resource_size(res) - 1;
> > +	dev_info(&pdev->dev, "punit BIOS interface res: %llx
> > %x\n",
> > +		=C2=A0(long long)res->start, (int)resource_size(res));
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RES_PUNIT_ISP_DATA_INDEX)
> > ;
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "Failed to get res of punit
> > ISP data\n");
> > +		return -ENXIO;
> > +	}
> > +	punit_res++;
> > +	punit_res->start =3D res->start;
> > +	punit_res->end =3D res->start + resource_size(res) - 1;
> > +	dev_info(&pdev->dev, "punit ISP data res: %llx %x\n",
> > =C2=A0		=C2=A0(long long)res->start, (int)resource_size(res));
> > =C2=A0
> > =C2=A0	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_IPC_INDEX);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RES_PUNIT_ISP_INTER_INDEX
> > );
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "Failed to get res of punit
> > ISP inter\n");
> > +		return -ENXIO;
> > +	}
> > +	punit_res++;
> > +	punit_res->start =3D res->start;
> > +	punit_res->end =3D res->start + resource_size(res) - 1;
> > +	dev_info(&pdev->dev, "punit ISP interface res: %llx %x\n",
> > +		=C2=A0(long long)res->start, (int)resource_size(res));
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RES_PUNIT_GTD_DATA_INDEX)
> > ;
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "Failed to get res of punit
> > GTD data\n");
> > +		return -ENXIO;
> > +	}
> > +	punit_res++;
> > +	punit_res->start =3D res->start;
> > +	punit_res->end =3D res->start + resource_size(res) - 1;
> > +	dev_info(&pdev->dev, "punit GTD data res: %llx %x\n",
> > +		=C2=A0(long long)res->start, (int)resource_size(res));
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RES_PUNIT_GTD_INTER_INDEX
> > );
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "Failed to get res of punit
> > GTD inter\n");
> > +		return -ENXIO;
> > +	}
> > +	punit_res++;
> > +	punit_res->start =3D res->start;
> > +	punit_res->end =3D res->start + resource_size(res) - 1;
> > +	dev_info(&pdev->dev, "punit GTD interface res: %llx %x\n",
> > +		=C2=A0(long long)res->start, (int)resource_size(res));
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > PLAT_RES_IPC_INDEX);
> > =C2=A0	if (!res) {
> > =C2=A0		dev_err(&pdev->dev, "Failed to get ipc
> > resource\n");
> > =C2=A0		return -ENXIO;
> > =C2=A0	}
> > -	size =3D PLAT_RESOURCE_IPC_SIZE;
> > +	size =3D PLAT_RES_IPC_SIZE;
> > =C2=A0	if (!request_mem_region(res->start, size, pdev->name)) {
> > =C2=A0		dev_err(&pdev->dev, "Failed to request ipc
> > resource\n");
> > =C2=A0		return -EBUSY;
> > @@ -650,7 +700,7 @@ static int ipc_plat_get_res(struct
> > platform_device *pdev)
> > =C2=A0	ipcdev.ipc_base =3D addr;
> > =C2=A0
> > =C2=A0	ipcdev.gcr_base =3D res->start + size;
> > -	ipcdev.gcr_size =3D PLAT_RESOURCE_GCR_SIZE;
> > +	ipcdev.gcr_size =3D PLAT_RES_GCR_SIZE;
> > =C2=A0	dev_info(&pdev->dev, "ipc res: %llx %x\n",
> > =C2=A0		=C2=A0(long long)res->start, (int)resource_size(res));
> > =C2=A0
> > @@ -714,9 +764,9 @@ err_irq:
> > =C2=A0err_device:
> > =C2=A0	iounmap(ipcdev.ipc_base);
> > =C2=A0	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_IPC_INDEX);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RES_IPC_INDEX);
> > =C2=A0	if (res)
> > -		release_mem_region(res->start,
> > PLAT_RESOURCE_IPC_SIZE);
> > +		release_mem_region(res->start, PLAT_RES_IPC_SIZE);
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > @@ -730,9 +780,9 @@ static int ipc_plat_remove(struct
> > platform_device *pdev)
> > =C2=A0	platform_device_unregister(ipcdev.punit_dev);
> > =C2=A0	iounmap(ipcdev.ipc_base);
> > =C2=A0	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_IPC_INDEX);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RES_IPC_INDEX);
> > =C2=A0	if (res)
> > -		release_mem_region(res->start,
> > PLAT_RESOURCE_IPC_SIZE);
> > +		release_mem_region(res->start, PLAT_RES_IPC_SIZE);
> > =C2=A0	ipcdev.dev =3D NULL;
> > =C2=A0	return 0;
> > =C2=A0}
> > --=20
> > 1.8.3.2
> >=20
> >=20
>=20

--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
