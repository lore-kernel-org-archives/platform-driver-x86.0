From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 18/26] intel_scu_ipc: constify local structures
Date: Mon, 12 Sep 2016 14:37:46 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1609121436510.3049@hadrien>
References: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr> <1473599168-30561-19-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1473599168-30561-19-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On Sun, 11 Sep 2016, Julia Lawall wrote:

> For structure types defined in the same file or local header files, find
> top-level static structure declarations that have the following
> properties:
> 1. Never reassigned.
> 2. Address never taken
> 3. Not passed to a top-level macro call
> 4. No pointer or array-typed field passed to a function or stored in a
> variable.
> Declare structures having all of these properties as const.

Actually, this patch should be dropped.  Coccinelle didn't recognize
kernel_ulong_t as a type, so it considered that eg

(kernel_ulong_t)&intel_scu_ipc_lincroft_pdata

was a bit and operation.

julia

> Done using Coccinelle.
> Based on a suggestion by Joe Perches <joe@perches.com>.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
> The semantic patch seems too long for a commit log, but is in the cover
> letter.
>
>  drivers/platform/x86/intel_scu_ipc.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
> index e81daff..257837f 100644
> --- a/drivers/platform/x86/intel_scu_ipc.c
> +++ b/drivers/platform/x86/intel_scu_ipc.c
> @@ -72,20 +72,20 @@ struct intel_scu_ipc_pdata_t {
>  	u8 irq_mode;
>  };
>
> -static struct intel_scu_ipc_pdata_t intel_scu_ipc_lincroft_pdata = {
> +static const struct intel_scu_ipc_pdata_t intel_scu_ipc_lincroft_pdata = {
>  	.i2c_base = 0xff12b000,
>  	.i2c_len = 0x10,
>  	.irq_mode = 0,
>  };
>
>  /* Penwell and Cloverview */
> -static struct intel_scu_ipc_pdata_t intel_scu_ipc_penwell_pdata = {
> +static const struct intel_scu_ipc_pdata_t intel_scu_ipc_penwell_pdata = {
>  	.i2c_base = 0xff12b000,
>  	.i2c_len = 0x10,
>  	.irq_mode = 1,
>  };
>
> -static struct intel_scu_ipc_pdata_t intel_scu_ipc_tangier_pdata = {
> +static const struct intel_scu_ipc_pdata_t intel_scu_ipc_tangier_pdata = {
>  	.i2c_base  = 0xff00d000,
>  	.i2c_len = 0x10,
>  	.irq_mode = 0,
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
