From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC, PATCH v1] platform/x86: intel-vbtn: Convert to pure ACPI
 driver
Date: Wed, 07 Feb 2018 15:18:52 +0200
Message-ID: <1518009532.22495.140.camel@linux.intel.com>
References: <20180131182614.19524-1-andriy.shevchenko@linux.intel.com>
         <CAHp75VeFSuQYu67DdnJDjZDoaLZiPuo7ag7Lz0q6eSCDjayobw@mail.gmail.com>
         <2235169.mLvk2uMpgf@aspire.rjw.lan> <4289605.mKSTaFlacu@aspire.rjw.lan>
         <20180207095522.qhs2wns4goif76u3@pali>
         <8d143fabe24f43de933dc60ce6480d00@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:8499 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753696AbeBGNS4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Feb 2018 08:18:56 -0500
In-Reply-To: <8d143fabe24f43de933dc60ce6480d00@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com, pali.rohar@gmail.com, rjw@rjwysocki.net
Cc: andy.shevchenko@gmail.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, acelan.kao@canonical.com, linux-kernel@vger.kernel.org

On Wed, 2018-02-07 at 13:08 +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Wednesday, February 7, 2018 3:55 AM
> > To: Rafael J. Wysocki <rjw@rjwysocki.net>
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; Limonciello, Mario
> > <Mario_Limonciello@Dell.com>; andriy.shevchenko@linux.intel.com;
> > dvhart@infradead.org; platform-driver-x86@vger.kernel.org;
> > acelan.kao@canonical.com; linux-kernel@vger.kernel.org
> > Subject: Re: [RFC, PATCH v1] platform/x86: intel-vbtn: Convert to
> > pure ACPI driver
> > 
> > On Wednesday 07 February 2018 10:47:57 Rafael J. Wysocki wrote:
> > > BTW, please CC patches with ACPI material to linux-acpi.  They are
> > > less likely
> > > to be overlooked by me then and the others on that list may have
> > > opinions on
> > > them too.
> > 
> > Maybe we can update MAINTAINERS file for acpi based platform-x86
> > drivers
> > to include linux-acpi list? Darren, Andy, any idea?
> > 
> 
> I would also wonder if the intel-vbtn driver should still live in
> platform-x86 as it's
> now pure ACPI driver with this change Andy proposed.
> 
> Btw Andy for your v2 with your fixups that were in your review branch
> feel free
> to add:
> Tested-by: Mario Limonciello <mario.limonciello@dell.com>
> 
> When you resubmit it.

Mario, Rafael clarifies the matter and NACKed this one (which kinda was
expected by me, that's why RFC was in the first place).

I'm going to drop this patch from my queue.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
