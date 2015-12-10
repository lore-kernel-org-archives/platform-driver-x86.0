From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH V9 1/2] intel_pmc_ipc: update acpi resource structure for
 Punit
Date: Thu, 10 Dec 2015 14:59:11 -0800
Message-ID: <20151210225911.GE11972@malice.jf.intel.com>
References: <1449771661-40300-1-git-send-email-qipeng.zha@intel.com>
 <1449745981.30729.71.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49951 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750715AbbLJW7N (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Dec 2015 17:59:13 -0500
Content-Disposition: inline
In-Reply-To: <1449745981.30729.71.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qipeng Zha <qipeng.zha@intel.com>, platform-driver-x86@vger.kernel.org

On Thu, Dec 10, 2015 at 01:13:01PM +0200, Andy Shevchenko wrote:
> On Fri, 2015-12-11 at 02:21 +0800, Qipeng Zha wrote:
> > BIOS restructure exported memory resources for Punit
> > in acpi table, So update resources for Punit.
> >=20
> > Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> >=20
>=20
> Almost. See below.
>=20
> > ---
> > change in v9
> > =A0rename indexes of all acpi resources;
> > =A0add comments for punit_res;
> > ---
> > =A0drivers/platform/x86/intel_pmc_ipc.c | 114 +++++++++++++++++++++=
+++-
> > ----------
> > =A01 file changed, 80 insertions(+), 34 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/intel_pmc_ipc.c
> > b/drivers/platform/x86/intel_pmc_ipc.c
> > index 28b2a12..00812a4 100644
> > --- a/drivers/platform/x86/intel_pmc_ipc.c
> > +++ b/drivers/platform/x86/intel_pmc_ipc.c
> > @@ -68,8 +68,12 @@
> > =A0#define PLAT_RESOURCE_IPC_INDEX		0
> > =A0#define PLAT_RESOURCE_IPC_SIZE		0x1000
> > =A0#define PLAT_RESOURCE_GCR_SIZE		0x1000
> > -#define PLAT_RESOURCE_PUNIT_DATA_INDEX	1
> > -#define PLAT_RESOURCE_PUNIT_INTER_INDEX	2
> > +#define PLAT_RESOURCE_BIOS_DATA_INDEX	1
> > +#define PLAT_RESOURCE_BIOS_INTER_INDEX	2
>=20
> Since there is a comment and new version will be anticipated I also
> would like to propose to change INTER to IFACE because latter more
> particular. Darren?

Yes, I had the same thought, but wasn't going to request the change jus=
t for
this. Andriy did point out the pointer format below previously however.=
 Please
do correct that - updating INTER to IFACE would be a welcome improvemen=
t as
well.

> > -	size =3D resource_size(res);
> > -	ipcdev.punit_base2 =3D res->start;
> > -	ipcdev.punit_size2 =3D size;
> > -	dev_info(&pdev->dev, "punit interface res: %llx %x\n",
> > +	/* This is index 1 to cover BIOS interface register */
> > +	*++punit_res =3D *res;
> > +	dev_info(&pdev->dev, "punit BIOS interface res: %llx %x\n",
> > +		=A0(long long)res->start, (int)resource_size(res));
>=20
> There is a specifier to print struct resource, please use it instead.
> %pR IIRC.
>=20

Yes, %pR, see Documentation/printk-formats.txt

> Same for all similar cases below.
>=20
--=20
Darren Hart
Intel Open Source Technology Center
