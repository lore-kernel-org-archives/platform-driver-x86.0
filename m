From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: Re: [PATCH 1/2] x86/quark: Add Quark embedded SRAM support
Date: Tue, 05 May 2015 06:48:07 -0700
Message-ID: <5548CA17.1030002@nexus-software.ie>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie> <1430705875-6990-2-git-send-email-pure.logic@nexus-software.ie> <alpine.DEB.2.11.1505041608530.4225@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from outbound-smtp05.blacknight.com ([81.17.249.38]:47954 "EHLO
	outbound-smtp05.blacknight.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S2992558AbbEENsT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 May 2015 09:48:19 -0400
Received: from mail.blacknight.com (pemlinmail06.blacknight.ie [81.17.255.152])
	by outbound-smtp05.blacknight.com (Postfix) with ESMTPS id 888FF210046
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2015 13:48:17 +0000 (UTC)
In-Reply-To: <alpine.DEB.2.11.1505041608530.4225@nanos>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com

On 04/05/15 08:00, Thomas Gleixner wrote:
> On Mon, 4 May 2015, Bryan O'Donoghue wrote:
>> +++ b/arch/x86/include/asm/esram.h
>
> This should be in platform/quark/....
>
>> +++ b/arch/x86/platform/intel-quark/esram.c

No problem.

>> +#define phys_to_esram(x)	((x) >> PAGE_SHIFT)
>
> There is a single usage size for this lousy documented magic.

Hmm - OK I'll add a comment like "stuff the address field of the eSRAM 
page register" or similar.

>> +struct esram_page {
>> +	u32 id;
>> +	struct list_head list;
>> +	phys_addr_t addr;
>
> Please tab align the struct member names as you did below.

OK

>> +};
>> +
>> +/**
>> + * struct esram_dev
>> + *
>> + * Structre to represent module state/data/etc.
>> + */
>> +struct esram_dev {
>> +	struct dentry		*dbg;
>
> So dbgfs is a hard requirement for this to work?

No it's not. I had an awful hard time making a kernel without dbgfs but, 
I'll add an #ifdef for the field

>> + */
>> +static int esram_dbgfs_state_show(struct seq_file *s, void *unused)
>> +{
>> +	struct esram_dev *edev = &esram_dev;
>> +	u32 data;
>> +	u32 reg = (u32)s->private;
>
> You really like to waste lines. What's wrong with:
>
>      	u32 data, reg = .....

Hmm, I had feedback when doing the IMR code *not* to do that, so kept 
that pattern for eSRAM. More than happy to rationalize the line-count here.

>> +/**
>> + * esram_dump_fault - dump eSRAM registers and BUG().
>> + *
>> + * @return:
>
> Sigh. Please generate kernel docs from your file to catch all those
> function comment failures.

Hmm - OK - I've missed a trick here clearly - I'll check.

>> +
>> +	/* Show the page state. */
>> +	iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MMESRAM_READ, ep->id, &pgd);
>> +	pr_err("fault @ page %d state 0x%08x\n", ep->id, pgd);
>> +
>> +	/* Get state. */
>> +	iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MM_READ, ESRAMCTRL_REG, &pgc);
>> +	iosf_mbi_read(QRK_MBI_UNIT_MM, QRK_MBI_MM_READ, ESRAMPGBLOCK_REG, &pgb);
>> +	pr_err("page-control=0x%08x, page-block=0x%08x\n", pgc, pgb);
>> +
>> +	BUG();
>
> So we force BUG() here. Why?

A nice way to generate a backtrace which was useful to the BSP version 
of this code since BSP version supported deallocation of eSRAM pages and 
had a /sysfs interface to add/remove mappings.

With the version I'm proposing here, we could just as easily not BUG() 
at all.


>> +/**
>> + * esram_page_enable - Enable an eSRAM page spinning for page to become ready.
>> + *
>> + * @param ep: struct esram_page carries data to program to register.
>> + * @return	zero on success < 0 on error.
>> + */
>> +static int esram_page_enable(struct esram_page *ep)
>> +{
>> +	int ret = 0;
>> +
>> +	/* Enable a busy page => EINVAL, return IOSF error as necessary. */
>
> Why is EINVAL a good return code if the page is busy?

You're right ENOMEM is more logical.

>
>> +	ret = esram_page_busy(ep);
>> +	if (ret)
>> +		return ret < 0 ? ret : -EINVAL;
>> +
>> +	/* Enable page overlay - with automatic flush on S3 entry. */
>> +	ret = iosf_mbi_write(QRK_MBI_UNIT_MM, QRK_MBI_MMESRAM_WRITE, ep->id,
>> +			     ESRAMPGCTRL_FLUSH_PAGE_EN | ESRAMPGCTRL_EN |
>> +			     phys_to_esram(ep->addr));
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Busy bit true is good, ret < 0 means IOSF read error. */
>> +	ret = esram_page_busy(ep);
>> +	if (ret)
>> +		ret = 0;
>> +
>> +	return ret;
>
> Why not just return 0 unconitionally?

That should be if (ret < 0) we need to transmit iosf bus errors upwards.

>
>> +	if (pte == NULL || !(pte_write(*pte))) {
>> +		pr_err("invalid address for overlay %pa\n", &ep->addr);
>> +		return -ENOMEM;
>> +	}
>
> Also what makes sure that the mapping is not going away under you?
>
> Nothing, but the whole thing is not required at all. Because you map a
> kernel buffer from init(), so these half baken sanity checks are
> really useless.

The BSP code was checking for memory as ro or rw and flipping the bit in 
the page to make it r/w so the memcpy() could continue.

You're right though since the data comes from a kzalloc() there's no 
point in validating it further.

>
>> +
>> +	/* eSRAM does not autopopulate so save the contents. */
>> +	memcpy(&edev->cbuf, vaddr, PAGE_SIZE);
>> +	ret = esram_page_enable(ep);
>> +	if (ret) {
>> +		esram_dump_fault(ep);
>> +		goto err;
>
>    		return ret perhaps?
>
>> +	}
>> +
>> +	/* Overlay complete, repopulate the eSRAM page with original data. */
>> +	memcpy((void *)vaddr, &esram_dev.cbuf,  PAGE_SIZE);
>
> So the caller must ensure that the DRAM content cannot change between
> the two memcpys, right? Otherwise you end up with inconsistent data.
 > At init() time I can see how that works, on resume() rather not.

Yes absolutely true. eSRAM is not self populating - ideally you'd want 
memory transactions to be stopped until the eSRAM had populated itself.

During init this is safe. The resume callback is done via syscore_ops so 
the resume path should be called with interrupts off.

memcpy(&edev->cbuf, vaddr, PAGE_SIZE);
ret = esram_page_enable(ep);
if (ret) {
		esram_dump_fault(ep);
	goto err;
}
memcpy((void *)vaddr, &esram_dev.cbuf,  PAGE_SIZE);



>> +	/* Calculate # of pages silicon supports. */
>> +	edev->num_bytes = ESRAMCTRL_SIZE(ctrl);
>> +	edev->total_pages = edev->num_bytes / PAGE_SIZE;
>> +	if (edev->total_pages == 0)
>> +		return -ENOMEM;
>> +
>> +	/* Get an array of esram pages. */
>> +	edev->pages = kzalloc(edev->total_pages *
>> +		sizeof(struct esram_page), GFP_KERNEL);
>> +	if (IS_ERR(edev->pages)) {
>> +		ret = PTR_ERR(edev->pages);
>> +		goto err;
>> +	}
>> +
>> +	/* Make an area for the gen_pool to operate from. */
>> +	edev->overlay = kmalloc(edev->num_bytes, GFP_KERNEL);
>
> This better be page aligned, right? How's that guaranteed?

The silicon guarantees that by returning the size of eSRAM in 4k pages.

329676_QuarkDatasheet.pdf : 12.7.4.37 : ESRAMCTRL

24:16 07Fh
RO eSRAM Size (eSRAM_SIZE): eSRAM size in 4k pages ( 0 means 1)
>> +		if (ret) {
>> +			esram_dump_fault(ep);
>> +			ret = ret < 0 ? ret : -ENOMEM;
>
> This return value juggling is really horrible and hard to follow.

NP - I'll change it.

>> +			goto err;
>> +		}
>> +
>> +		/* Overlay. */
>> +		ret = esram_map_page(edev, ep);
>> +		if (ret)
>> +			goto err;
>
> What undoes already established mappings?

Nothing - unmap() is not supported by silicon. Disabling a mapping once 
it's been setup is not supported.


>> +static void __exit esram_exit(void)
>> +{
>> +	struct esram_dev *edev = &esram_dev;
>
> Again. What happens to the mappings?

Stay as-is. So in fact I shouldn't be doing any kfree()'s on already 
mapped pages.

I'll change that too.

Thanks for the review.
Bryan
