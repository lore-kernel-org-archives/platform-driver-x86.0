From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] platform: uv: fix missing checks for kcalloc
Date: Mon, 25 Mar 2019 13:55:28 +0100
Message-ID: <20190325125528.GM12016@zn.tnic>
References: <20190324225755.1702-1-kjlu@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190324225755.1702-1-kjlu@umn.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Kangjie Lu <kjlu@umn.edu>
Cc: pakki001@umn.edu, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Mike Travis <mike.travis@hpe.com>, Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Varsha Rao <rvarsha016@gmail.com>, Nicolai Stange <nstange@suse.de>, Andrew Banman <abanman@hpe.com>, Colin Ian King <colin.king@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Mar 24, 2019 at 05:57:53PM -0500, Kangjie Lu wrote:
> In case kcalloc fails, the patch return an error to avoid
> potential NULL pointer dereference.
> 
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
> ---
>  arch/x86/platform/uv/tlb_uv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
> index 2c53b0f19329..1ac777f14846 100644
> --- a/arch/x86/platform/uv/tlb_uv.c
> +++ b/arch/x86/platform/uv/tlb_uv.c
> @@ -2140,7 +2140,13 @@ static int __init init_per_cpu(int nuvhubs, int base_part_pnode)
>  		timeout_us = calculate_destination_timeout();
>  
>  	uvhub_descs = kcalloc(nuvhubs, sizeof(struct uvhub_desc), GFP_KERNEL);
> +	if (!uvhub_descs)
> +		return 1;

Here...

>  	uvhub_mask = kzalloc((nuvhubs+7)/8, GFP_KERNEL);
> +	if (!uvhub_mask) {
> +		kfree(uvhub_descs);
> +		return 1;
> +	}

... and here you can simply do

		goto fail;

instead. After having initialized uvhub_descs and uvhub_mask to NULL;

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
