From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: dell-laptop: Mark expected switch
 fall-throughs
Date: Wed, 28 Nov 2018 16:15:33 -0800
Message-ID: <20181129001533.GA2468@fedora.eng.vmware.com>
References: <20180705203807.GA10327@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180705203807.GA10327@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 05, 2018 at 03:38:07PM -0500, Gustavo A. R. Silva wrote:
> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
> where we are expecting to fall through.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

I've applied this patch, but not the acer or sony fall through patches
due to the pending questions there. Happy to revisit those as needed,
but closing these out of the patch queue.

> ---
>  drivers/platform/x86/dell-laptop.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
> index f1fa861..1938f11 100644
> --- a/drivers/platform/x86/dell-laptop.c
> +++ b/drivers/platform/x86/dell-laptop.c
> @@ -1565,8 +1565,10 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
>  		switch (unit) {
>  		case KBD_TIMEOUT_DAYS:
>  			value *= 24;
> +			/* fall through */
>  		case KBD_TIMEOUT_HOURS:
>  			value *= 60;
> +			/* fall through */
>  		case KBD_TIMEOUT_MINUTES:
>  			value *= 60;
>  			unit = KBD_TIMEOUT_SECONDS;
> -- 
> 2.7.4
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
