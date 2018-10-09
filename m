From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: intel_telemetry: Update maintainers info
Date: Tue, 9 Oct 2018 14:37:11 +0300
Message-ID: <CAHp75VfNsasf-hpiubrfw=x+iVjBOOcY=uj6dB97iVpkoT6K=w@mail.gmail.com>
References: <20181008144303.23878-1-rajneesh.bhardwaj@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008144303.23878-1-rajneesh.bhardwaj@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rajneesh.bhardwaj@linux.intel.com
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, David Box <david.e.box@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 8, 2018 at 5:44 PM Rajneesh Bhardwaj
<rajneesh.bhardwaj@linux.intel.com> wrote:
>
> Add myself and David as the new maintainers for Intel Telemetry driver.
>

There is no explanation why.
(Like previous one left the company, and / or you are doing set of the
drivers related to PMC where telemetry is part of, etc)

> Signed-off-by: Box, David E <david.e.box@linux.intel.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 22065048d89d..f33ebd1b8034 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7530,7 +7530,8 @@ F:        arch/x86/crypto/sha*-mb/
>  F:     crypto/mcryptd.c
>
>  INTEL TELEMETRY DRIVER
> -M:     Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
> +M:     Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
> +M:     Box, David E <david.e.box@linux.intel.com>
>  L:     platform-driver-x86@vger.kernel.org
>  S:     Maintained
>  F:     arch/x86/include/asm/intel_telemetry.h
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
