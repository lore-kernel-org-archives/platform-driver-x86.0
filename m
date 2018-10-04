From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: intel_pmc_core: Update MAINTAINERS
Date: Thu, 4 Oct 2018 15:41:43 +0300
Message-ID: <CAHp75Vf980Wih6+cfEd-SjRDZNKdMT20wbocvsRFZ0OjHaGbhg@mail.gmail.com>
References: <20181003115110.25996-1-rajneesh.bhardwaj@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181003115110.25996-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@linux.intel.com
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 3, 2018 at 2:53 PM Rajneesh Bhardwaj
<rajneesh.bhardwaj@linux.intel.com> wrote:
>
> This removes the entry for pmc_core.h file in the MAINTAINERS as the
> file is already removed by a previous commit.
> "platform/x86: intel_pmc_core: Remove unused header file"
>

Pushed to our for-next branch directly, thanks!

> Reported-by: Joe Perches <joe@perches.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9ad052aeac39..60d029b65767 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7468,7 +7468,6 @@ M:        Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
>  M:     Vishwanath Somayaji <vishwanath.somayaji@intel.com>
>  L:     platform-driver-x86@vger.kernel.org
>  S:     Maintained
> -F:     arch/x86/include/asm/pmc_core.h
>  F:     drivers/platform/x86/intel_pmc_core*
>
>  INTEL PMC/P-Unit IPC DRIVER
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
