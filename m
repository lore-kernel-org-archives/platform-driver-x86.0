From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v7 2/8] efi: Add embedded peripheral firmware support
Date: Thu, 14 Nov 2019 19:42:33 +0000
Message-ID: <20191114194233.GE11244@42.do-not-panic.com>
References: <20191004145056.43267-1-hdegoede@redhat.com>
 <20191004145056.43267-3-hdegoede@redhat.com>
 <20191011144834.GL16384@42.do-not-panic.com>
 <e7bd40ff-20d1-3aed-8516-9fffd4c3a207@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e7bd40ff-20d1-3aed-8516-9fffd4c3a207@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 14, 2019 at 12:27:01PM +0100, Hans de Goede wrote:
> Hi Luis,
> 
> Thank you for the reviews and sorry for being a bit slow to respind.
> 
> On 11-10-2019 16:48, Luis Chamberlain wrote:
> > On Fri, Oct 04, 2019 at 04:50:50PM +0200, Hans de Goede wrote:
> > > +static int __init efi_check_md_for_embedded_firmware(
> > > +	efi_memory_desc_t *md, const struct efi_embedded_fw_desc *desc)
> > > +{
> > > +	const u64 prefix = *((u64 *)desc->prefix);
> > > +	struct sha256_state sctx;
> > > +	struct embedded_fw *fw;
> > > +	u8 sha256[32];
> > > +	u64 i, size;
> > > +	void *map;
> > > +
> > > +	size = md->num_pages << EFI_PAGE_SHIFT;
> > > +	map = memremap(md->phys_addr, size, MEMREMAP_WB);
> > 
> > Since our limitaiton is the init process must have mostly finished,
> > it implies early x86 boot code cannot use this, what measures can we
> > take to prevent / check for such conditions to be detected and
> > gracefully errored out?
> 
> As with all (EFI) early boot code, there simply is a certain order
> in which things need to be done. This needs to happen after the basic
> mm is setup, but before efi_free_boot_services() gets called, there
> isn't really a way to check for all these conditions. As with all
> early boot code, people making changes need to be careful to not
> break stuff.

I rather we take a proactive measure here and add whatever it is we need
to ensure the API works only when its supposed to, rather than try and
fail, and then expect the user to know these things.

I'd prefer if we at least try to address this.

> > > +	if (!map) {
> > > +		pr_err("Error mapping EFI mem at %#llx\n", md->phys_addr);
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	size -= desc->length;
> > 
> > Remind me again, why we decrement the size here?
> 
> Basically this is another way of writing:
> 
> 	for (i = 0; (i + desc->length) < size; i += 8) {
> 
> > I was going to ask if we didn't need a:
> > 
> > if (desc->length > size) {
> > 	memunmap(map);
> > 	return -EINVAL;
> > }
> 
> That is a good point, unlikely but still a good point,
> so I guess that writing:
> 
> 	for (i = 0; (i + desc->length) < size; i += 8) {
> 
> Instead would better as that avoids the need for that check.
> I will fix this for the next version.

Great thanks.

  Luis
