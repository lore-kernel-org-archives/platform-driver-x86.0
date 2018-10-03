From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: Bad MAINTAINERS pattern in section 'INTEL PMC CORE DRIVER'
Date: Wed, 3 Oct 2018 11:00:00 +0300
Message-ID: <CAHp75Ve-LfScEuYg6Luzy4Sekatm3qVbr3wsQAJVR-YUN-10Ww@mail.gmail.com>
References: <20180928215339.29516-1-joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180928215339.29516-1-joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 29, 2018 at 12:54 AM Joe Perches <joe@perches.com> wrote:
>
> Please fix this defect appropriately.
>
> linux-next MAINTAINERS section:
>
>         7441    INTEL PMC CORE DRIVER
>         7442    M:      Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
>         7443    M:      Vishwanath Somayaji <vishwanath.somayaji@intel.com>
>         7444    L:      platform-driver-x86@vger.kernel.org
>         7445    S:      Maintained
> -->     7446    F:      arch/x86/include/asm/pmc_core.h
>         7447    F:      drivers/platform/x86/intel_pmc_core*
>
> Commit that introduced this:

This is strange the shuffle of the MAINTAINERS based on the script is
a culprit of the above inconsistency.

Btw, I run parse-maintainers.pl against it and there are a lot more
"unsorted" lines.
What Linus or me or both did miss?

>
> commit 7683e9e529258d01ce99216ad3be21f59eff83ec
>  Author: Linus Torvalds <torvalds@linux-foundation.org>
>  Date:   Sun Jul 23 16:06:21 2017 -0700
>
>      Properly alphabetize MAINTAINERS file
>
>      This adds a perl script to actually parse the MAINTAINERS file, clean up
>      some whitespace in it, warn about errors in it, and then properly sort
>      the end result.
>
>      My perl-fu is atrocious, so the script has basically been created by
>      randomly putting various characters in a pile, mixing them around, and
>      then looking it the end result does anything interesting when used as a
>      perl script.
>
>      Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
>
>   MAINTAINERS                  | 3585 +++++++++++++++++++++---------------------
>   scripts/parse-maintainers.pl |   77 +
>   2 files changed, 1868 insertions(+), 1794 deletions(-)
>
> Last commit with arch/x86/include/asm/pmc_core.h
>
> commit 941691ef2197944a202d7870dcd7da3fb0391c65
> Author: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> Date:   Wed Jan 31 11:50:22 2018 +0530
>
>     platform/x86: intel_pmc_core: Remove unused header file
>
>     Recently sent patch 'platform/x86: intel_pmc_core: Remove unused EXPORTED
>     API' missed to remove the header file 'arch/x86/include/asm/pmc_core.h'
>     which was solely used to declare the EXPORTED API
>     'intel_pmc_slp_s0_counter_read'. This patch provides the errata fix for the
>     same.
>
>     Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
>     Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
>  arch/x86/include/asm/pmc_core.h       | 27 ---------------------------
>  drivers/platform/x86/intel_pmc_core.c |  1 -
>  2 files changed, 28 deletions(-)



-- 
With Best Regards,
Andy Shevchenko
