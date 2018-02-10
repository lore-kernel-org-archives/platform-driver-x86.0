From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v2 1/3] platform/x86: mlx-platform: Add support for new
 msn274x system type
Date: Fri, 9 Feb 2018 17:36:18 -0800
Message-ID: <20180210013618.GA15238@fury>
References: <1518220772-98492-1-git-send-email-vadimp@mellanox.com>
 <1518220772-98492-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1518220772-98492-2-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 09, 2018 at 11:59:30PM +0000, Vadim Pasternak wrote:
> It adds support for new Mellanox system types of basic class msn274x,
> containing system MSN2740 (32x100GbE Ethernet switch with cost reduction)
> and its derivatives. These are the Top of the Rack system, equipped with
> Mellanox Small Form Factor carrier board and switch board with Mellanox
> Spectrum device, which supports Ethernet switching with 32X100G ports line
> rate of up to EDR speed.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Hi Vadim,

For timing reasons, I've queued these for review - thanks. A few comments to
make this more smooth in the future:

> v1->v2
>   Comments pointed out by Darren:
>   - Break the patch into series of patches per system type.

Patch changelogs go below the --- line...

> ---

Here. This makes it so the intermediate patch changelog (Since v1... stuff) is
dropped automatically from the commit when using git am to apply the patch. As
these are coming in, I have to apply and then "git rebase -i" to (r)eword each
one individually to prune out the v1->v2 stuff.

For the official description of this process, please see:
Documentation/process/submitting-patches.rst
14) The canonical patch format

>  drivers/platform/x86/mlx-platform.c | 124 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 124 insertions(+)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index e87fe34..3a13285 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -94,6 +94,7 @@
>  /* Hotplug devices adapter numbers */
>  #define MLXPLAT_CPLD_NR_NONE			-1
>  #define MLXPLAT_CPLD_PSU_DEFAULT_NR		10
> +#define MLXPLAT_CPLD_PSU_MSNXXXX_NR		4
>  #define MLXPLAT_CPLD_FAN1_DEFAULT_NR		11
>  #define MLXPLAT_CPLD_FAN2_DEFAULT_NR		12
>  #define MLXPLAT_CPLD_FAN3_DEFAULT_NR		13
> @@ -335,6 +336,108 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_msn21xx_data = {
>  	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
>  };
>  
> +/* Platform hotplug msn274x system family data */
> +static struct mlxreg_core_data mlxplat_mlxcpld_msn274x_psu_items_data[] = {
> +	{
> +		.label = "psu1",
> +		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +		.mask = BIT(0),
> +		.hpdev.brdinfo = &mlxplat_mlxcpld_psu[0],
> +		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
> +	},
> +	{
> +		.label = "psu2",
> +		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
> +		.mask = BIT(1),
> +		.hpdev.brdinfo = &mlxplat_mlxcpld_psu[1],
> +		.hpdev.nr = MLXPLAT_CPLD_PSU_MSNXXXX_NR,
> +	},
> +};
> +
> +static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_pwr_items_data[] = {

This is OK as is, but in terms of helping articulate what I'm looking for with
respect to breaking up patches into atomic functional patches, the
"*default_ng*" structs are something that may have been better off in their own
patch. Here's why.

Let's say something turned out to be bad with this (1/3) patch. If I were to
revert it, I would break everything that was dependent on the
...default_ng_pwr... struct. The idea is to remove as many interdependencies as
possible and to make each patch as self contained as possible. This makes them
easier to review as well as easier to use in a patch-granular way for stable,
distro, and future mainline debug and maintenance work.

No need to resend, the risk is minimal here and these are highly contained to
just the one file. Something to apply to future work.

Thanks!
-- 
Darren Hart
VMware Open Source Technology Center
