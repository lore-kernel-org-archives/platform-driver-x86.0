From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v6 01/11] intel_sgx: updated MAINTAINERS
Date: Sat, 25 Nov 2017 12:19:42 -0800
Message-ID: <1511641182.2503.14.camel@perches.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
         <20171125193132.24321-2-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171125193132.24321-2-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 2017-11-25 at 21:29 +0200, Jarkko Sakkinen wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -14932,6 +14932,11 @@ L:	linux-mm@kvack.org
>  S:	Maintained
>  F:	mm/zswap.c
>  
> +INTEL SGX
> +M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> +L:	intel-sgx-kernel-dev@lists.01.org
> +Q:	https://patchwork.kernel.org/project/intel-sgx/list/

Alphabetical order please and this should
have at least an "F:" pattern like:

F:	drivers/platform/x86/intel_sgx/

and maybe a "K: pattern like:

K:	\bSGX_

The lower case version matches too many other subsystems

$ git grep -i -P --name-only "\b_?sgx_"
arch/arm/boot/dts/omap36xx-am35xx-omap3430es2plus-clocks.dtsi
arch/arm/boot/dts/omap44xx-clocks.dtsi
arch/arm/mach-omap2/clockdomains3xxx_data.c
arch/arm/mach-omap2/clockdomains81xx_data.c
arch/arm/mach-omap2/cm3xxx.c
arch/arm/mach-omap2/omap_hwmod_44xx_data.c
arch/arm/mach-omap2/powerdomains3xxx_data.c
drivers/clk/ti/clk-3xxx-legacy.c
drivers/clk/ti/clk-3xxx.c
drivers/clk/ti/clk-44xx.c
drivers/gpu/drm/gma500/cdv_device.c
drivers/gpu/drm/gma500/mdfld_device.c
drivers/gpu/drm/gma500/oaktrail_device.c
drivers/gpu/drm/gma500/psb_device.c
drivers/gpu/drm/gma500/psb_drv.c
drivers/gpu/drm/gma500/psb_drv.h
drivers/gpu/drm/gma500/psb_irq.c

> +
>  THE REST
>  M:	Linus Torvalds <torvalds@linux-foundation.org>
>  L:	linux-kernel@vger.kernel.org
