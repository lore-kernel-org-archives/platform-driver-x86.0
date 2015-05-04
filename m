From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 1/2] x86/quark: Add Quark embedded SRAM support
Date: Mon, 4 May 2015 17:00:04 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1505041608530.4225@nanos>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie> <1430705875-6990-2-git-send-email-pure.logic@nexus-software.ie>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:45492 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751334AbbEDPAB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 May 2015 11:00:01 -0400
In-Reply-To: <1430705875-6990-2-git-send-email-pure.logic@nexus-software.ie>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com

On Mon, 4 May 2015, Bryan O'Donoghue wrote:
> +++ b/arch/x86/include/asm/esram.h

This should be in platform/quark/....

> +++ b/arch/x86/platform/intel-quark/esram.c

> +#define esram_to_phys(x)	((x) << PAGE_SHIFT)

Unused macro.

> +#define phys_to_esram(x)	((x) >> PAGE_SHIFT)

There is a single usage size for this lousy documented magic.

> +/**
> + * struct esram_page
> + *
> + * Represents an eSRAM page.
> + */
> +struct esram_page {
> +	u32 id;
> +	struct list_head list;
> +	phys_addr_t addr;

Please tab align the struct member names as you did below.

> +};
> +
> +/**
> + * struct esram_dev
> + *
> + * Structre to represent module state/data/etc.
> + */
> +struct esram_dev {
> +	struct dentry		*dbg;

So dbgfs is a hard requirement for this to work?

> +	void			*overlay;
> +	struct esram_page	*pages;
> +	struct gen_pool		*pool;
> +	u8			cbuf[PAGE_SIZE];
> +	bool			init;
> +	struct mutex		lock;
> +	u32			num_bytes;
> +	struct list_head	page_list;
> +	u32			total_pages;

Lots of magic fields ....

> +};
> +
> +static struct esram_dev esram_dev;
> +
> +/**
> + * esram_dbgfs_state_show - print state of eSRAM registers.
> + *
> + * @s:		pointer to seq_file for output.
> + * @unused:	unused parameter.
> + * @return:	0 on success or error code passed from mbi_iosf on failure.

I don't think kerneldoc is happy about that one, but I might be wrong

> + */
> +static int esram_dbgfs_state_show(struct seq_file *s, void *unused)
> +{
> +	struct esram_dev *edev = &esram_dev;
> +	u32 data;
> +	u32 reg = (u32)s->private;

You really like to waste lines. What's wrong with:

    	u32 data, reg = .....

> +	int ret;
> +
> +	mutex_lock(&edev->lock);
> +	ret = iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MM_READ, reg, &data);
> +	if (ret == 0)

  	if (!ret)

> +		seq_printf(s, "0x%08x\n", data);



> +/**
> + * esram_dump_fault - dump eSRAM registers and BUG().
> + *
> + * @return:

Sigh. Please generate kernel docs from your file to catch all those
function comment failures.

> + */
> +static void esram_dump_fault(struct esram_page *ep)
> +{
> +	u32 pgc;
> +	u32 pgd;
> +	u32 pgb;

One line please for all of these.

> +
> +	/* Show the page state. */
> +	iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MMESRAM_READ, ep->id, &pgd);
> +	pr_err("fault @ page %d state 0x%08x\n", ep->id, pgd);
> +
> +	/* Get state. */
> +	iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MM_READ, ESRAMCTRL_REG, &pgc);
> +	iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MM_READ, ESRAMPGBLOCK_REG, &pgb);
> +	pr_err("page-control=0x%08x, page-block=0x%08x\n", pgc, pgb);
> +
> +	BUG();

So we force BUG() here. Why?

> +}
> +
> +/**
> + * esram_page_enable - Enable an eSRAM page spinning for page to become ready.
> + *
> + * @param ep: struct esram_page carries data to program to register.
> + * @return	zero on success < 0 on error.
> + */
> +static int esram_page_enable(struct esram_page *ep)
> +{
> +	int ret = 0;
> +
> +	/* Enable a busy page => EINVAL, return IOSF error as necessary. */

Why is EINVAL a good return code if the page is busy?

> +	ret = esram_page_busy(ep);
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
> +	/* Enable page overlay - with automatic flush on S3 entry. */
> +	ret = iosf_mbi_write(QRK_MBI_UNIT_MM, QRK_MBI_MMESRAM_WRITE, ep->id,
> +			     ESRAMPGCTRL_FLUSH_PAGE_EN | ESRAMPGCTRL_EN |
> +			     phys_to_esram(ep->addr));
> +	if (ret)
> +		return ret;
> +
> +	/* Busy bit true is good, ret < 0 means IOSF read error. */
> +	ret = esram_page_busy(ep);
> +	if (ret)
> +		ret = 0;
> +
> +	return ret;

Why not just return 0 unconitionally?

> +/**
> + * esram_page_overlay - Overlay a page with fast access eSRAM.
> + *
> + * This function takes a 4 KiB aligned physical address and programs an
> + * eSRAM page to overlay that 4 KiB region. We require and verify that the
> + * target memory is read-write - since we don't support overlay of read-only
> + * memory regions - such as kernel .text areas. Overlay of .text areas is
> + * not supported because eSRAM isn't self-populating and we cannot guarantee
> + * atomicity of the overlay operation. It is assumed and required that the
> + * caller of the overlay function is overlaying a data buffer not kernel
> + * code.
> + *
> + * @param ep:	Pointer to eSRAM page desciptor.
> + * @return:		0 on success < 0 on failure.
> + */
> +static int esram_page_overlay(struct esram_dev *edev, struct esram_page *ep)
> +{
> +	int level = 0;
> +	void *vaddr = __va(ep->addr);
> +	pte_t *pte = lookup_address((unsigned long)vaddr, &level);
> +	int ret;
> +
> +	/* We only support overlay for r/w memory. */

Well, the check below is not really checking for a valid memory
mapping. You can have a r/w PTE for some peripheral device space as
well.

> +	if (pte == NULL || !(pte_write(*pte))) {
> +		pr_err("invalid address for overlay %pa\n", &ep->addr);
> +		return -ENOMEM;
> +	}

Also what makes sure that the mapping is not going away under you?

Nothing, but the whole thing is not required at all. Because you map a
kernel buffer from init(), so these half baken sanity checks are
really useless.

> +
> +	/* eSRAM does not autopopulate so save the contents. */
> +	memcpy(&edev->cbuf, vaddr, PAGE_SIZE);
> +	ret = esram_page_enable(ep);
> +	if (ret) {
> +		esram_dump_fault(ep);
> +		goto err;

  		return ret perhaps?

> +	}
> +
> +	/* Overlay complete, repopulate the eSRAM page with original data. */
> +	memcpy((void *)vaddr, &esram_dev.cbuf,  PAGE_SIZE);

So the caller must ensure that the DRAM content cannot change between
the two memcpys, right? Otherwise you end up with inconsistent data.

At init() time I can see how that works, on resume() rather not.

> +err:
> +	return ret;
> +}
> +
> +/**
> + * esram_map_page - Overlay a vritual address range aligned to 4 KiB.
> + *
> + * @param page:		Page to map.
> + * @return:		0 success < 0 failure.
> + */
> +static int esram_map_page(struct esram_dev *edev, struct esram_page *ep)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&edev->lock);
> +	ret = esram_page_overlay(edev, ep);
> +	if (ret)
> +		goto err;

Useless goto to further obfuscate the code.

> +	list_add(&ep->list, &edev->page_list);
> +err:
> +	mutex_unlock(&edev->lock);
> +	return ret;
> +}
> +
> +/**
> + * esram_resume - restore eSRAM overlays on S3=>S0 transition.
> + *
> + * @return:
> + */
> +static void esram_resume(void)
> +{
> +	struct esram_dev *edev = &esram_dev;
> +	struct esram_page *ep = NULL;
> +
> +	mutex_lock(&edev->lock);
> +	list_for_each_entry(ep, &edev->page_list, list)
> +		if (esram_page_overlay(edev, ep))
> +			pr_err("restore page %d phys %pa fail!\n",
> +				ep->id, &ep->addr);
> +	mutex_unlock(&edev->lock);
> +}
> +
> +/* Shutdown is done by RMU. Kernel needs to-do the resume() though. */
> +static struct syscore_ops esram_syscore_ops = {
> +	.resume		= esram_resume,
> +};
> +
> +/**
> + * esram_get_genpool - return pointer to esram genpool structure.
> + *
> + * @return:
> + */
> +struct gen_pool *esram_get_genpool(void)
> +{
> +	struct esram_dev *edev = &esram_dev;
> +
> +	return edev->init ? edev->pool : NULL;
> +}
> +EXPORT_SYMBOL_GPL(esram_get_genpool);
> +
> +static const struct x86_cpu_id esram_ids[] __initconst = {
> +	{ X86_VENDOR_INTEL, 5, 9 },	/* Intel Quark SoC X1000. */
> +	{}
> +};
> +MODULE_DEVICE_TABLE(x86cpu, esram_ids);
> +
> + /**
> + * esram_init - entry point for eSRAM driver.
> + *
> + * This driver manages eSRAM on a per-page basis. Therefore if we find block
> + * mode is enabled, or any global, block-level or page-level locks are in place
> + * at module initialisation time - we bail out.
> + *
> + * return: -ENODEV for no eSRAM support 0 if good to go.
> + */
> +static int __init esram_init(void)
> +{
> +	u32 block;
> +	u32 ctrl;
> +	struct esram_page *ep = NULL;
> +	struct esram_dev *edev = &esram_dev;
> +	phys_addr_t addr;
> +	int i;
> +	int ret;
> +

If there is a scheme in your variable declaration blocks, I rather
don't want to know about it.

> +	/* Calculate # of pages silicon supports. */
> +	edev->num_bytes = ESRAMCTRL_SIZE(ctrl);
> +	edev->total_pages = edev->num_bytes / PAGE_SIZE;
> +	if (edev->total_pages == 0)
> +		return -ENOMEM;
> +
> +	/* Get an array of esram pages. */
> +	edev->pages = kzalloc(edev->total_pages *
> +		sizeof(struct esram_page), GFP_KERNEL);
> +	if (IS_ERR(edev->pages)) {
> +		ret = PTR_ERR(edev->pages);
> +		goto err;
> +	}
> +
> +	/* Make an area for the gen_pool to operate from. */
> +	edev->overlay = kmalloc(edev->num_bytes, GFP_KERNEL);

This better be page aligned, right? How's that guaranteed?

> +	/* Overlay contiguous region with eSRAM pages. */
> +	addr = __pa(edev->overlay);
> +	for (i = 0; i < edev->total_pages; i++) {
> +		ep = &edev->pages[i];
> +		ep->id = i;
> +		ep->addr = addr;
> +
> +		/* Validate page state is not busy. */
> +		ret = esram_page_busy(ep);
> +		if (ret) {
> +			esram_dump_fault(ep);
> +			ret = ret < 0 ? ret : -ENOMEM;

This return value juggling is really horrible and hard to follow.

> +			goto err;
> +		}
> +
> +		/* Overlay. */
> +		ret = esram_map_page(edev, ep);
> +		if (ret)
> +			goto err;

What undoes already established mappings?

> +static void __exit esram_exit(void)
> +{
> +	struct esram_dev *edev = &esram_dev;

Again. What happens to the mappings?

Thanks,

	tglx
