From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Thu, 5 Oct 2017 13:58:52 -0700
Message-ID: <20171005205852.GB12321@fury>
References: <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
 <20171005071619.GA25960@kroah.com>
 <aa10ae6ab119499c8bbdf613392a9605@ausx13mpc120.AMER.DELL.COM>
 <20171005154214.GB29347@kroah.com>
 <20171005155156.GZ10938@pali>
 <20171005162628.GA4993@kroah.com>
 <20171005173925.GD31452@fury>
 <20171005184728.GB9713@kroah.com>
 <750018cd00674782a55f2b50e8aef689@ausx13mpc120.AMER.DELL.COM>
 <20171005190948.GA21238@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171005190948.GA21238@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Mario.Limonciello@dell.com, pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 05, 2017 at 09:09:48PM +0200, Greg KH wrote:
> On Thu, Oct 05, 2017 at 07:03:24PM +0000, Mario.Limonciello@dell.com wrote:
...
> > It's up to firmware to block the crazy stuff that you can put in a buffer.
> 
> So userspace can pass any blob it wants to the firmware through this
> interface and the kernel does not parse anything?  How is that
> "protected"?
> 
> > > Again, I like my TPM to work, and I don't want a random rootkit exploit
> > > to be able to destroy it :)
> > 
> > I'd like to however point out you can't kill your TPM from this interface.
> 
> On _your_ platform, can you guarantee it on any other platform?  :)

The dell-smbios-wmi driver won't load on any other platform. No
character device is created for any other platform. When drivers are
written for those other platforms for different WMI GUIDs, we need to
review them.

This driver not having MOF data should be the exception. We'll have more
ability to inspect others. If drivers are submitted that don't look at
the MOF data even through it is present, we should reject them.

-- 
Darren Hart
VMware Open Source Technology Center
