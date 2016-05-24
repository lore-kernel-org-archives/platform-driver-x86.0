From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5] platform:x86: Add PMC Driver for Intel Core SoC
Date: Tue, 24 May 2016 23:10:56 +0300
Message-ID: <CAHp75VfXztjrq7ESKv_Oy6AWb3SAS-zLRhdLOpoQ0hj_oFkgZg@mail.gmail.com>
References: <1464099946-15078-1-git-send-email-rajneesh.bhardwaj@intel.com>
	<CAHp75VfKowT6ZJ1_hy8LFWJ6dHmva3OQafOy4_LpDp4sU-jZsw@mail.gmail.com>
	<20160524193844.GJ2735@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160524193844.GJ2735@f23x64.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, dbasehore@google.com, vishwanath.somayaji@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Tue, May 24, 2016 at 10:38 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, May 24, 2016 at 09:54:36PM +0300, Andy Shevchenko wrote:
>> On Tue, May 24, 2016 at 5:25 PM, Rajneesh Bhardwaj
>> <rajneesh.bhardwaj@intel.com> wrote:

>> > +int intel_pmc_slp_s0_counter_read(u32 *data)
>> > +{
>> > +       struct pmc_dev *pmcdev = &pmc;
>> > +       u32 value;
>> > +
>> > +       if (!pmcdev->has_slp_s0_res)
>>
>> I would name this just initialized, so if you ever add something else
>> there will be no need to rename.
>>
>> if (!pmcdev->initialized)
>>
>
> Previously this was "has_feature" or similar and I asked for something more
> specific. "initialized" is going back the other way, and if the device can
> support some features and not others, then this will need to go back to a more
> specific naming. Let's leave this one as is for now. We can revisit it in the
> future when more features provide us information on how it will be used.

Okay, stick with the current name. As you may noticed most of the
comments are rather style ones, so, I have no objections to either
choice.

>> > +static void intel_pmc_core_remove(struct pci_dev *pdev)
>> > +{
>> > +       pmc_core_dbgfs_unregister(&pmc);
>> > +}
>> > +
>> > +static struct pci_driver intel_pmc_core_driver = {
>> > +       .name = "intel_pmc_core",
>> > +       .id_table = pmc_pci_ids,
>> > +       .probe = pmc_core_probe,
>> > +       .remove = intel_pmc_core_remove,
>> > +};
>> > +module_pci_driver(intel_pmc_core_driver);
>> > +
>> > +MODULE_AUTHOR("Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>");
>> > +MODULE_AUTHOR("Vishwanath Somayaji <vishwanath.somayaji@intel.com>");
>> > +MODULE_DESCRIPTION("Intel CORE SoC Power Management Controller Interface");
>> > +MODULE_LICENSE("GPL v2");
>>
>> So, since you have symbol defined as boolean, most of the above lines
>> are redundant including ->remove() and module.h inclusion.
>>
>> Do we need it as a module? In that case you have to set to false
>> pmcdev->initialized variable.
>
> It was determined best not to build as a module given the it's primary consumer
> was a built-in. Some of that is still being built, so we'll leave it as built-in
> until it's in, and we can re-evaluate as needed.

Yeah, I saw several patches floating around that removes module
support for boolean symbols. Thus my question is how we suppose to
proceed. In case we might have module support I would rather remove
extra stuff and apply it later when it would be needed. What do you
think?

>>
>> I doubt this header makes any sense to be exist.
>
> This is a very subjective call, and several folks have weighed in on how they
> would like to see it. This could be part of the C file, but there is nothing
> wrong with it like this. The important part to me is that the driver specific
> stuff is kept close to the driver in this directory, while the interface alone
> is exposed in the arch header.

Agreed.

-- 
With Best Regards,
Andy Shevchenko
