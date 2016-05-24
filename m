From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5] platform:x86: Add PMC Driver for Intel Core SoC
Date: Tue, 24 May 2016 13:45:42 -0700
Message-ID: <20160524204542.GB5857@f23x64.localdomain>
References: <1464099946-15078-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <CAHp75VfKowT6ZJ1_hy8LFWJ6dHmva3OQafOy4_LpDp4sU-jZsw@mail.gmail.com>
 <20160524193844.GJ2735@f23x64.localdomain>
 <CAHp75VfXztjrq7ESKv_Oy6AWb3SAS-zLRhdLOpoQ0hj_oFkgZg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41735 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753601AbcEXUpl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 May 2016 16:45:41 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VfXztjrq7ESKv_Oy6AWb3SAS-zLRhdLOpoQ0hj_oFkgZg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, dbasehore@google.com, vishwanath.somayaji@intel.com

On Tue, May 24, 2016 at 11:10:56PM +0300, Andy Shevchenko wrote:
> On Tue, May 24, 2016 at 10:38 PM, Darren Hart <dvhart@infradead.org> wrote:
> > On Tue, May 24, 2016 at 09:54:36PM +0300, Andy Shevchenko wrote:

...

> >> > +static void intel_pmc_core_remove(struct pci_dev *pdev)
> >> > +{
> >> > +       pmc_core_dbgfs_unregister(&pmc);
> >> > +}
> >> > +
> >> > +static struct pci_driver intel_pmc_core_driver = {
> >> > +       .name = "intel_pmc_core",
> >> > +       .id_table = pmc_pci_ids,
> >> > +       .probe = pmc_core_probe,
> >> > +       .remove = intel_pmc_core_remove,
> >> > +};
> >> > +module_pci_driver(intel_pmc_core_driver);
> >> > +
> >> > +MODULE_AUTHOR("Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>");
> >> > +MODULE_AUTHOR("Vishwanath Somayaji <vishwanath.somayaji@intel.com>");
> >> > +MODULE_DESCRIPTION("Intel CORE SoC Power Management Controller Interface");
> >> > +MODULE_LICENSE("GPL v2");
> >>
> >> So, since you have symbol defined as boolean, most of the above lines
> >> are redundant including ->remove() and module.h inclusion.
> >>
> >> Do we need it as a module? In that case you have to set to false
> >> pmcdev->initialized variable.
> >
> > It was determined best not to build as a module given the it's primary consumer
> > was a built-in. Some of that is still being built, so we'll leave it as built-in
> > until it's in, and we can re-evaluate as needed.
> 
> Yeah, I saw several patches floating around that removes module
> support for boolean symbols. Thus my question is how we suppose to
> proceed. In case we might have module support I would rather remove
> extra stuff and apply it later when it would be needed. What do you
> think?

Agreed, if it is to be boolean, then the modular-specific code should be
removed.

-- 
Darren Hart
Intel Open Source Technology Center
