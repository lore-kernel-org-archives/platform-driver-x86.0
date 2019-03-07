From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: Include mlxreg.h in Mellanox Platform
 Driver files
Date: Thu, 7 Mar 2019 09:06:57 +0200
Message-ID: <20190307070657.GB9224@smile.fi.intel.com>
References: <b0b6ac4eee58fbda83574f020d89651a12a8e40f.1551937716.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b0b6ac4eee58fbda83574f020d89651a12a8e40f.1551937716.git.dvhart@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Darren Hart (VMware)" <dvhart@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>, andy@infradead.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Mar 06, 2019 at 09:50:32PM -0800, Darren Hart (VMware) wrote:
> Avoid conflicts from other subsystems by including the header with the
> rest of the driver files.
> 

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Cc: Andy Shevchenko <andy@infradead.org>
> Cc: Vadim Pasternak <vadimp@mellanox.com>
> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 51029a425dbe..eb0b9aba4802 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9711,6 +9711,7 @@ M:	Vadim Pasternak <vadimp@mellanox.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Supported
>  F:	drivers/platform/mellanox/
> +F:	include/linux/platform_data/mlxreg.h
>  
>  MELLANOX MLX4 core VPI driver
>  M:	Tariq Toukan <tariqt@mellanox.com>
> -- 
> 2.17.2
> 
> 
> -- 
> Darren Hart
> VMware Open Source Technology Center

-- 
With Best Regards,
Andy Shevchenko
