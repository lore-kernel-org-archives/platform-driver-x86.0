From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: Actually use mask parameter in
 hp_wmi_hw_state
Date: Tue, 28 Nov 2017 08:57:54 -0800
Message-ID: <20171128165724.GA16349@fury>
References: <20171128151758.9234-1-michel@daenzer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171128151758.9234-1-michel@daenzer.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 28, 2017 at 04:17:58PM +0100, Michel Dänzer wrote:
> We were always checking bit 0 (which represents the docked state)
> regardless of the mask.
> 
> Fixes the "tablet mode" state always being reported the same as the
> docked state, which with current libinput can cause the built-in input
> devices of laptops to be incorrectly disabled while docked.
> 
> Cc: stable@vger.kernel.org
> Fixes: ("platform/x86: hp-wmi: Refactor dock and tablet state fetchers")
> Signed-off-by: Michel Dänzer <michel@daenzer.net>
> ---
>  drivers/platform/x86/hp-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index b4ed3dc983d5..2bdd6bbdb353 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -297,7 +297,7 @@ static int hp_wmi_hw_state(int mask)
>  	if (state < 0)
>  		return state;
>  
> -	return state & 0x1;
> +	return (state & mask) ? 1 : 0;

The current code does:

return !!(state & mask);

See:
9968e12 platform/x86: hp-wmi: Fix tablet mode detection for convertibles

Merged in 4.15-rc1

-- 
Darren Hart
VMware Open Source Technology Center
