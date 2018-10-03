From: Joe Perches <joe@perches.com>
Subject: Re: Bad MAINTAINERS pattern in section 'INTEL PMC CORE DRIVER'
Date: Wed, 03 Oct 2018 03:10:58 -0700
Message-ID: <c505fe842c58abd6f91e0dba3dd552ce01e4ea39.camel@perches.com>
References: <20180928215339.29516-1-joe@perches.com>
         <CAHp75Ve-LfScEuYg6Luzy4Sekatm3qVbr3wsQAJVR-YUN-10Ww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Ve-LfScEuYg6Luzy4Sekatm3qVbr3wsQAJVR-YUN-10Ww@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2018-10-03 at 11:00 +0300, Andy Shevchenko wrote:
> On Sat, Sep 29, 2018 at 12:54 AM Joe Perches <joe@perches.com> wrote:
> > Please fix this defect appropriately.
> > 
> > linux-next MAINTAINERS section:
> > 
> >         7441    INTEL PMC CORE DRIVER
> >         7442    M:      Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> >         7443    M:      Vishwanath Somayaji <vishwanath.somayaji@intel.com>
> >         7444    L:      platform-driver-x86@vger.kernel.org
> >         7445    S:      Maintained
> > -->     7446    F:      arch/x86/include/asm/pmc_core.h
> >         7447    F:      drivers/platform/x86/intel_pmc_core*
> > 
> > Commit that introduced this:
> 
> This is strange the shuffle of the MAINTAINERS based on the script is
> a culprit of the above inconsistency.
> 
> Btw, I run parse-maintainers.pl against it and there are a lot more
> "unsorted" lines.
> What Linus or me or both did miss?

Nothing really.

The script used git-blame on the specific line, that's all.

There is no simple way to actually find a specific
commit that adds a particular line to a file if there is
any refactoring done to the file after it was added.

commit b740d2e9233cb33626d3b62210bcfc6a34baa839
Author: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Date:   Thu May 26 14:41:19 2016 +0530

    platform/x86: Add PMC Driver for Intel Core SoC

Anyway, the real cause of the file pattern being unused
was also written below:

> > Last commit with arch/x86/include/asm/pmc_core.h
> > 
> > commit 941691ef2197944a202d7870dcd7da3fb0391c65
> > Author: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> > Date:   Wed Jan 31 11:50:22 2018 +0530
> > 
> >     platform/x86: intel_pmc_core: Remove unused header file
> > 
> >     Recently sent patch 'platform/x86: intel_pmc_core: Remove unused EXPORTED
> >     API' missed to remove the header file 'arch/x86/include/asm/pmc_core.h'
> >     which was solely used to declare the EXPORTED API
> >     'intel_pmc_slp_s0_counter_read'. This patch provides the errata fix for the
> >     same.
> > 
> >     Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> >     Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> >  arch/x86/include/asm/pmc_core.h       | 27 ---------------------------
> >  drivers/platform/x86/intel_pmc_core.c |  1 -
> >  2 files changed, 28 deletions(-)


> 
