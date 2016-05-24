From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4] platform:x86: Add PMC Driver for Intel Core SOC
Date: Tue, 24 May 2016 21:27:38 +0300
Message-ID: <CAHp75VdycD2Ea6hJFA4hwGabAA+Aa=h50Cp0xjYDUbnnhcdHvg@mail.gmail.com>
References: <1463061001-23210-1-git-send-email-rajneesh.bhardwaj@intel.com>
	<CAHp75VfHzh2mBtNBGDHcz9BZ5C8eAdSxUqXq1Cdn-ujm9mtX8g@mail.gmail.com>
	<20160516101550.GA3037@rajaneesh-OptiPlex-9010>
	<20160516225913.GA3402@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34395 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754114AbcEXS1k (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 May 2016 14:27:40 -0400
In-Reply-To: <20160516225913.GA3402@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, vishwanath.somayaji@intel.com

On Tue, May 17, 2016 at 1:59 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Mon, May 16, 2016 at 03:45:50PM +0530, Rajneesh Bhardwaj wrote:
>> On Thu, May 12, 2016 at 06:02:45PM +0300, Andy Shevchenko wrote:
>> > On Thu, May 12, 2016 at 4:50 PM, Rajneesh Bhardwaj
>> > <rajneesh.bhardwaj@intel.com> wrote:

>> > > +INTEL PMC CORE DRIVER
>> > > +M:      Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
>> > > +M:      Vishwanath Somayaji <vishwanath.somayaji@intel.com>
>> > > +L:      platform-driver-x86@vger.kernel.org
>> > > +S:      Maintained
>> > > +F:      drivers/platform/x86/intel_pmc_core.h
>> > > +F:      drivers/platform/x86/intel_pmc_core.c
>> >
>> > So, we have arch/x86/platform/atom/pmc_atom.c
>> >
>> > This driver looks very similar (by what functional is), so, we have to
>> > become clear what our layout is.
>> > Either we go with drivers/platform/x86 or with arch/x86/platform.
>> >
>>
>> IMHO, the functianality provided by this driver is platform specific and
>> not architecture specific.
>>
>> There are few similar drivers present in this location already i.e.
>> intel_telemetry_core.c, intel_pmc_ipc.c etc.
>>
>> We had initially put this driver along with pmc_atom.c but later we thought
>> that driver/platform/x86 would be a more apt place for it because of the
>> above mentioned reasons.
>>
>> Please advise for the right location for this driver if its not placed in the
>> expected location.
>
> We're experiencing some repeat discussion due to some of the reviews having
> taken place off list. Sorry Andy, I've been trying to steer this back to list,
> so you're missing some context to no fault of your own.
>
> It's possible some of the existing drivers in arch really shouldn't be there.
> It's not particularly well defined, however, if it isn't used outside the kernel
> or by other subsystems within the kernel, it seems that drivers/platform/x86
> would be the appropriate location.

Roughly it's what I also expected, but here we export function to the
users. If they are all be located under pdx86 I'm pretty okay with
current approach. Otherwise might be good to think a bit.

> Thomas, Peter - do you have a criteria for what you prefer to have in
> arch/x86/platform versus drivers/platform/x86?

+1 to the question. It would be nice to have a formal criteria to
choose a location.

>> > > --- a/drivers/platform/x86/Kconfig
>> > > +++ b/drivers/platform/x86/Kconfig
>> > > @@ -821,6 +821,18 @@ config INTEL_IPS
>> > >           functionality.  If in doubt, say Y here; it will only load on
>> > >           supported platforms.
>> > >
>> > > +config INTEL_PMC_CORE
>> >
>> > Better to locate this in alphabetical order.
>> >
>>
>> Agreed, i tried to put it in alphabetical order but there are quite a few entries
>> in Kconfig that are skewed e.g. INTEL_MFLD is placed above INTEL_IPS.
>>
>> Placing INTEL_PMC_CORE after INTEL_IMR would be ok?

At least. At some point we might sort entire file alphabetically.

>> > > +static struct pmc_dev pmc;
>> > > +
>> > > +static const struct pci_device_id pmc_pci_ids[] = {
>> > > +       { PCI_VDEVICE(INTEL, SPT_PMC_PCI_DEVICE_ID), (kernel_ulong_t)NULL },
>> >
>> > No need to have an explicit NULL
>> >
>>
>> There is a precedent in the kernel for such usage and in previous reviews we agreed
>> to stick to this format. I hope thats fine?
>
> I'm fine with this, even if redundant, so long as you are consistent throughout
> the driver. This is consistent with the other drivers in drivers/platform/x86.

Yeah, it's minor, so just one format for all entries.

>> > > +EXPORT_SYMBOL_GPL(intel_pmc_slp_s0_counter_read);
>> >
>> > Who is going to be a user of that?
>> >
>>
>> This is expected to be used by a framework (upcoming) for detecting slp_s0
>> signal assertion related failures.

It might be good to put few words in the commit message about expecting user(s).

>> > > +static void pmc_core_dbgfs_unregister(struct pmc_dev *pmc)
>> > > +{
>> > > +       debugfs_remove_recursive(pmc->dbgfs_dir);
>> > > +}
>> >
>> > No need to keep this under #ifdef.
>> >
>>
>> Based on some previus review comments we decided to put the dummy functions
>> for !CONIG_DEBUG_FS case. Can you please elaborate more on this change request?
>>
>
> I think Andy's point is that there is no reason to specialize this function
> since debugs_remove_recursive checks for null.
>
> The problem of course is that dbgfs_dir only exists if CONFIG_DEBUG_FS exists. I
> don't know if that's worth ifdeffing out of the struct, but there is precendent
> for doing it that way, and I didn't feel strongly one way or the other, so I
> left it up to you.

> If you want to conditionally include the field in the struct, then this is fine
> as is.

Yeah, for the consistency either way is okay. I prefer to have less
#ifdef:s, but here it's a not bit burden.

>> > > +       pmc.regmap = ioremap_nocache(pmc.base_addr, SPT_PMC_MMIO_REG_LEN);
>> Do you recommend devm_ioremap_nocache as well?

Good point.

-- 
With Best Regards,
Andy Shevchenko
