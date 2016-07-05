From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] platform/x86/intel_pmc_core: Convert to
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Tue, 05 Jul 2016 18:07:26 +0300
Message-ID: <1467731246.30123.483.camel@linux.intel.com>
References: <1467635988-64195-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <20160705134055.GA3400@rajaneesh-OptiPlex-9010>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160705134055.GA3400@rajaneesh-OptiPlex-9010>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2016-07-05 at 19:10 +0530, Rajneesh Bhardwaj wrote:
> On Mon, Jul 04, 2016 at 03:39:48PM +0300, Andy Shevchenko wrote:
> > This patch does the following:
> > - refactors code to use recently introduced
> > DEFINE_DEBUGFS_ATTRIBUTE() macro
> > - makes absence of DEBUG_FS non-fatal error
> >=20
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> Reviewed-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
>=20
> Compiled & tested this on Ubuntu 16.04.
> Kernel: 4.7.0-rc6
> Hardware: Skylake based reference board

Thanks!

Darren, I think we may use Reviewed-and-tested-by tag.

>=20
> > ---
> > In v2:
> > - address Rajneesh's comments
> > =C2=A0drivers/platform/x86/intel_pmc_core.c | 45 ++++++++----------=
----
> > -------------
> > =C2=A0drivers/platform/x86/intel_pmc_core.h |=C2=A0=C2=A03 +--
> > =C2=A02 files changed, 11 insertions(+), 37 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/intel_pmc_core.c
> > b/drivers/platform/x86/intel_pmc_core.c
> > index 2776bec..d8379cd 100644
> > --- a/drivers/platform/x86/intel_pmc_core.c
> > +++ b/drivers/platform/x86/intel_pmc_core.c
> > @@ -23,7 +23,6 @@
> > =C2=A0#include <linux/init.h>
> > =C2=A0#include <linux/io.h>
> > =C2=A0#include <linux/pci.h>
> > -#include <linux/seq_file.h>
> > =C2=A0
> > =C2=A0#include <asm/cpu_device_id.h>
> > =C2=A0#include <asm/pmc_core.h>
> > @@ -77,30 +76,18 @@ int intel_pmc_slp_s0_counter_read(u32 *data)
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(intel_pmc_slp_s0_counter_read);
> > =C2=A0
> > -#if IS_ENABLED(CONFIG_DEBUG_FS)
> > -static int pmc_core_dev_state_show(struct seq_file *s, void
> > *unused)
> > +static int pmc_core_dev_state_get(void *data, u64 *val)
> > =C2=A0{
> > -	struct pmc_dev *pmcdev =3D s->private;
> > -	u32 counter_val;
> > +	struct pmc_dev *pmcdev =3D data;
> > +	u32 value;
> > =C2=A0
> > -	counter_val =3D pmc_core_reg_read(pmcdev,
> > -					SPT_PMC_SLP_S0_RES_COUNTER_
> > OFFSET);
> > -	seq_printf(s, "%u\n",
> > pmc_core_adjust_slp_s0_step(counter_val));
> > +	value =3D pmc_core_reg_read(pmcdev,
> > SPT_PMC_SLP_S0_RES_COUNTER_OFFSET);
> > +	*val =3D pmc_core_adjust_slp_s0_step(value);
> > =C2=A0
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > -static int pmc_core_dev_state_open(struct inode *inode, struct fil=
e
> > *file)
> > -{
> > -	return single_open(file, pmc_core_dev_state_show, inode-
> > >i_private);
> > -}
> > -
> > -static const struct file_operations pmc_core_dev_state_ops =3D {
> > -	.open=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=3D pmc_core_dev_state_open,
> > -	.read=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=3D seq_read,
> > -	.llseek=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D =
seq_lseek,
> > -	.release=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D singl=
e_release,
> > -};
> > +DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state,
> > pmc_core_dev_state_get, NULL, "%llu\n");
> > =C2=A0
> > =C2=A0static void pmc_core_dbgfs_unregister(struct pmc_dev *pmcdev)
> > =C2=A0{
> > @@ -112,12 +99,12 @@ static int pmc_core_dbgfs_register(struct
> > pmc_dev *pmcdev)
> > =C2=A0	struct dentry *dir, *file;
> > =C2=A0
> > =C2=A0	dir =3D debugfs_create_dir("pmc_core", NULL);
> > -	if (!dir)
> > +	if (IS_ERR_OR_NULL(dir))
> > =C2=A0		return -ENOMEM;
> > =C2=A0
> > =C2=A0	pmcdev->dbgfs_dir =3D dir;
> > =C2=A0	file =3D debugfs_create_file("slp_s0_residency_usec", S_IFRE=
G
> > | S_IRUGO,
> > -				=C2=A0=C2=A0=C2=A0dir, pmcdev,
> > &pmc_core_dev_state_ops);
> > +				=C2=A0=C2=A0=C2=A0dir, pmcdev,
> > &pmc_core_dev_state);
> > =C2=A0
> > =C2=A0	if (!file) {
> > =C2=A0		pmc_core_dbgfs_unregister(pmcdev);
> > @@ -126,16 +113,6 @@ static int pmc_core_dbgfs_register(struct
> > pmc_dev *pmcdev)
> > =C2=A0
> > =C2=A0	return 0;
> > =C2=A0}
> > -#else
> > -static inline int pmc_core_dbgfs_register(struct pmc_dev *pmcdev)
> > -{
> > -	return 0;
> > -}
> > -
> > -static inline void pmc_core_dbgfs_unregister(struct pmc_dev
> > *pmcdev)
> > -{
> > -}
> > -#endif /* CONFIG_DEBUG_FS */
> > =C2=A0
> > =C2=A0static const struct x86_cpu_id intel_pmc_core_ids[] =3D {
> > =C2=A0	{ X86_VENDOR_INTEL, 6, 0x4e, X86_FEATURE_MWAIT,
> > @@ -182,10 +159,8 @@ static int pmc_core_probe(struct pci_dev *dev,
> > const struct pci_device_id *id)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	err =3D pmc_core_dbgfs_register(pmcdev);
> > -	if (err < 0) {
> > -		dev_err(&dev->dev, "PMC Core: debugfs register
> > failed.\n");
> > -		return err;
> > -	}
> > +	if (err < 0)
> > +		dev_warn(&dev->dev, "PMC Core: debugfs register
> > failed.\n");
> > =C2=A0
> > =C2=A0	pmc.has_slp_s0_res =3D true;
> > =C2=A0	return 0;
> > diff --git a/drivers/platform/x86/intel_pmc_core.h
> > b/drivers/platform/x86/intel_pmc_core.h
> > index a9dadaf..e3f671f 100644
> > --- a/drivers/platform/x86/intel_pmc_core.h
> > +++ b/drivers/platform/x86/intel_pmc_core.h
> > @@ -23,6 +23,7 @@
> > =C2=A0
> > =C2=A0/* Sunrise Point Power Management Controller PCI Device ID */
> > =C2=A0#define SPT_PMC_PCI_DEVICE_ID			0x9d21
> > +
> > =C2=A0#define SPT_PMC_BASE_ADDR_OFFSET		0x48
> > =C2=A0#define SPT_PMC_SLP_S0_RES_COUNTER_OFFSET	0x13c
> > =C2=A0#define SPT_PMC_MMIO_REG_LEN			0x100
> > @@ -42,9 +43,7 @@
> > =C2=A0struct pmc_dev {
> > =C2=A0	u32 base_addr;
> > =C2=A0	void __iomem *regbase;
> > -#if IS_ENABLED(CONFIG_DEBUG_FS)
> > =C2=A0	struct dentry *dbgfs_dir;
> > -#endif /* CONFIG_DEBUG_FS */
> > =C2=A0	bool has_slp_s0_res;
> > =C2=A0};
> > =C2=A0
> > --=C2=A0
> > 2.8.1
> >=20
>=20

--=20

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
