From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V5 3/8]  misc/pvpanic: revmove unnecessary header file
Date: Thu, 1 Nov 2018 11:34:29 +0000
Message-ID: <20181101113428.h7i5ku54jpwxlc7q@lakrids.cambridge.arm.com>
References: <1541085002-42993-1-git-send-email-peng.hao2@zte.com.cn>
 <1541085002-42993-3-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541085002-42993-3-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Hao <peng.hao2@zte.com.cn>
Cc: robh+dt@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 01, 2018 at 11:09:57PM +0800, Peng Hao wrote:
> remove unnecessary header file init.h.
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  drivers/misc/pvpanic.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index 059005c..66534d4 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -22,7 +22,6 @@
>  
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/init.h>
>  #include <linux/types.h>
>  #include <linux/acpi.h>
>  
> -- 
> 1.8.3.1
> 
