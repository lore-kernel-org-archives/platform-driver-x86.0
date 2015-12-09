From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH V8 1/2] intel_pmc_ipc: update acpi resource structure for
 Punit
Date: Wed, 9 Dec 2015 08:33:53 -0800
Message-ID: <20151209163353.GD11972@malice.jf.intel.com>
References: <1449507305-51709-1-git-send-email-qipeng.zha@intel.com>
 <20151207234514.GA12897@malice.jf.intel.com>
 <1449579438.30729.48.camel@linux.intel.com>
 <20151209002105.GB11972@malice.jf.intel.com>
 <1449659391.30729.56.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40890 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751779AbbLIQdy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Dec 2015 11:33:54 -0500
Content-Disposition: inline
In-Reply-To: <1449659391.30729.56.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qipeng Zha <qipeng.zha@intel.com>, platform-driver-x86@vger.kernel.org

On Wed, Dec 09, 2015 at 01:09:51PM +0200, Andy Shevchenko wrote:
> On Tue, 2015-12-08 at 16:21 -0800, Darren Hart wrote:
> > On Tue, Dec 08, 2015 at 02:57:18PM +0200, Andy Shevchenko wrote:
> > > On Mon, 2015-12-07 at 15:45 -0800, Darren Hart wrote:
> > > > On Tue, Dec 08, 2015 at 12:55:04AM +0800, Qipeng Zha wrote:
> > > > > BIOS restructure exported memory resources for Punit
> > > > > in acpi table, So update resources for Punit.
> > > > >=20
> > > > > Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> > > >=20
> > > > Thank you for the update Qipeng. I will review shortly.
> > > >=20
> > > > +Andriy who originally raised the concern over the ACPI resourc=
e
> > > > assumptions in
> > > > the previous version. Andriy, this resource allocation looks to
> > > > be a
> > > > substantial
> > > > improvement to me. Do you have any further concerns?
> > >=20
> > > Here I have few mostly stylish concerns.
> > >=20
> > > >=20
> > > > > ---
> > > > > =C2=A0drivers/platform/x86/intel_pmc_ipc.c | 142
> > > > > +++++++++++++++++++++++------------
> > > > > =C2=A01 file changed, 96 insertions(+), 46 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/platform/x86/intel_pmc_ipc.c
> > > > > b/drivers/platform/x86/intel_pmc_ipc.c
> > > > > index 28b2a12..c699950 100644
> > > > > --- a/drivers/platform/x86/intel_pmc_ipc.c
> > > > > +++ b/drivers/platform/x86/intel_pmc_ipc.c
> > > > > @@ -65,12 +65,16 @@
> > > > > =C2=A0#define IPC_TRIGGER_MODE_IRQ		true
> > > > > =C2=A0
> > > > > =C2=A0/* exported resources from IFWI */
> > > > > -#define PLAT_RESOURCE_IPC_INDEX		0
> > > > > -#define PLAT_RESOURCE_IPC_SIZE		0x1000
> > > > > -#define PLAT_RESOURCE_GCR_SIZE		0x1000
> > > > > -#define PLAT_RESOURCE_PUNIT_DATA_INDEX	1
> > > > > -#define PLAT_RESOURCE_PUNIT_INTER_INDEX	2
> > > > > -#define PLAT_RESOURCE_ACPI_IO_INDEX	0
> > > > > +#define PLAT_RES_IPC_INDEX		0
> > > > > +#define PLAT_RES_IPC_SIZE		0x1000
> > > > > +#define PLAT_RES_GCR_SIZE		0x1000
> > > > > +#define PLAT_RES_PUNIT_BIOS_DATA_INDEX	1
> > > > > +#define PLAT_RES_PUNIT_BIOS_INTER_INDEX	2
> > > > > +#define PLAT_RES_PUNIT_ISP_DATA_INDEX	4
> > > > > +#define PLAT_RES_PUNIT_ISP_INTER_INDEX	5
> > > > > +#define PLAT_RES_PUNIT_GTD_DATA_INDEX	6
> > > > > +#define PLAT_RES_PUNIT_GTD_INTER_INDEX	7
> > > > > +#define PLAT_RES_ACPI_IO_INDEX	0
> > >=20
> > > May I propose to rename a bit this one?
> > > For me looks like PUNIT is not needed in the naming.
> > >=20
> > > What about
> > >=20
> > > /* Resource indexes */
> > > #define PLAT_RESOURCE_IPC_INDEX		0
> > > /* P-Unit */
> > > #define PLAT_RESOURCE_BIOS_DATA_INDEX	1
> > > =E2=80=A6
> > >=20
> > > #define PLAT_RESOURCE_GTD_INTER_INDEX	7
> >=20
> >=20
> > Seems reasonable, Qipeng, does PUNIT provide some kind of namespaci=
ng
> > that
> > relevantly separates this from PLAT_RES_IPC_INDEX for example? Is i=
t
> > a different
> > component?
> >=20
> > I don't want to bikeshed too much over this though, certainly don't
> > want to hold
> > up getting this in next over it. But as we do have some items below
> > to address,
> > please consider this.
> >=20
> > ...
> >=20
> > > > > @@ -606,37 +609,84 @@ static int ipc_plat_get_res(struct
> > > > > platform_device *pdev)
> > > > > =C2=A0	dev_info(&pdev->dev, "io res: %llx %x\n",
> > > > > =C2=A0		=C2=A0(long long)res->start,
> > > > > (int)resource_size(res));
> > > > > =C2=A0
> > > > > +	punit_res =3D punit_res_array;
> > > > > =C2=A0	res =3D platform_get_resource(pdev, IORESOURCE_MEM,
> > > > > -				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RESOURCE_PUNIT_DATA_I
> > > > > NDEX
> > > > > );
> > > > > +				=C2=A0=C2=A0=C2=A0=C2=A0PLAT_RES_PUNIT_BIOS_DATA_I
> > > > > NDEX
> > > > > );
> > > > > =C2=A0	if (!res) {
> > > > > -		dev_err(&pdev->dev, "Failed to get punit
> > > > > resource\n");
> > > > > +		dev_err(&pdev->dev, "Failed to get res of
> > > > > punit
> > > > > BIOS data\n");
> > > > > =C2=A0		return -ENXIO;
> > > > > =C2=A0	}
> > > > > -	size =3D resource_size(res);
> > > > > -	ipcdev.punit_base =3D res->start;
> > > > > -	ipcdev.punit_size =3D size;
> > > > > -	dev_info(&pdev->dev, "punit data res: %llx %x\n",
> > >=20
> > > > > +	punit_res->start =3D res->start;
> > > > > +	punit_res->end =3D res->start + resource_size(res) - 1;
> > >=20
> > > Seems like=C2=A0
> > >=20
> > > *punit_res =3D *res;
> > >=20
> > > Though punit_res is assigned to punit_res_array which seems not
> > > right
> > > to me.
> > >=20
> > > If it's a member of that array we have to explicitly show the
> > > index.
> > >=20
> >=20
> > It seems fairly clear to me that punit_res is used to iterate throu=
gh
> > the items
> > of the array using pointer arithmetic, but if it could be clearer,
> > great. What
> > would you prefer to see Andriy?
> >=20
> > Unfortunatley, we can't use the defined indices for the ACPI
> > resources as they
> > are neither 0 based nor sequential. This does mean that the punit
> > driver relies
> > on the order the pmc driver populates this array, rather than defin=
ed
> > indices.
> > This binding, however, is contained entirely within the kernel, so
> > I'm not so
> > concerned as I was with the ACPI resources being assumed contiguous=
=2E
> >=20
> > We could move the DATA, INTERFACE enums to intel_punit_ipc.h and us=
e
> > the
> > following indices without introducing new enums...
> >=20
> > (2 * BIOS_IPC) + DATA
> > (2 * BIOS_IPC) + INTERFACE
> > (2 * GTDRIVER_IPC) + DATA
> > (2 * GTDRIVER_IPC) + INTERFACE
> > (2 * GTDRIVER_IPC) + DATA
> > (2 * GTDRIVER_IPC) + INTERFACE
> >=20
> > But that's pretty horrible, so I suppose the only real solution wou=
ld
> > be to
> > introduce yet another set of defines:
> >=20
> > #define PUNIT_PLAT_RES_BIOS_IPC_DATA_INDEX 0
> > #define PUNIT_PLAT_RES_BIOS_IPC_INTERFACE_INDEX 1
> > #define PUNIT_PLAT_RES_GTDRIVER_IPC_DATA_INDEX 2
> > #define PUNIT_PLAT_RES_GTDRIVER_IPC_INTERFACE_INDEX 3
> > #define PUNIT_PLAT_RES_ISPDRIVER_IPC_DATA_INDEX 4
> > #define PUNIT_PLAT_RES_ISPDRIVER_IPC_INTERFACE_INDEX 5
> >=20
> > I'm not really sure this is better given the lengthy list for defin=
es
> > already
> > present.
> >=20
> > So, if you would like to a change, please recommend what you would
> > prefer
> > Andriy, because I can see the argument for either approach.
>=20
> For simplicity sake let's leave this as current iterative approach.
>=20
> Maybe we may go with the comment before each punit_res++; line to
> explain "this is index N to cover Y".

Sounds like a plan to me. Qipeng, could you include that in your final =
version?

--=20
Darren Hart
Intel Open Source Technology Center
