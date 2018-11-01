From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V5 2/8]  misc/pvpanic: Remove one extra semicolon
Date: Thu, 1 Nov 2018 11:33:55 +0000
Message-ID: <20181101113355.z6l3l33buhcpukl4@lakrids.cambridge.arm.com>
References: <1541085002-42993-1-git-send-email-peng.hao2@zte.com.cn>
 <1541085002-42993-2-git-send-email-peng.hao2@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541085002-42993-2-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Hao <peng.hao2@zte.com.cn>
Cc: robh+dt@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 01, 2018 at 11:09:56PM +0800, Peng Hao wrote:
> There is an extra semicolon in pvpanic_device_ids, remove it.

This is a comma, not a semicolon.

How about:

  Since there should be nothing after the sentinel entry in an
  acpi_device_id list, it doesn't make sense for it to have a trailing
  comma.

  This patch removes the redundant comma.

... with that commit message (and the title fixed to say 'comma' rather
than 'semicolon':

Acked-by: Mark Rutland <mark.rutland@arm.com>

Either that, or simply drop this patch entirely.

Thanks,
Mark.

> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/pvpanic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index fd86dab..059005c 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -35,7 +35,7 @@
>  
>  static const struct acpi_device_id pvpanic_device_ids[] = {
>  	{ "QEMU0001", 0 },
> -	{ "", 0 },
> +	{ "", 0 }
>  };
>  MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
>  
> -- 
> 1.8.3.1
> 
