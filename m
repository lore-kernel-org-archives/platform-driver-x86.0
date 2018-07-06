From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: sony-laptop: Mark expected switch
 fall-through
Date: Fri, 6 Jul 2018 16:24:27 -0700
Message-ID: <20180706232427.GC3041@fury>
References: <20180705204703.GA12352@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180705204703.GA12352@embeddedor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Mattia Dongili <malattia@linux.it>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 05, 2018 at 03:47:03PM -0500, Gustavo A. R. Silva wrote:
> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
> where we are expecting to fall through.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/platform/x86/sony-laptop.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index b205b03..e614cb7 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -4427,6 +4427,7 @@ sony_pic_read_possible_resource(struct acpi_resource *resource, void *context)
>  	default:
>  		dprintk("Resource %d isn't an IRQ nor an IO port\n",
>  			resource->type);
> +		/* fall through */

Here too, I wonder if this is intentional. Either way, from what I can see, the
final line in the function:

	return AE_CTRL_TERMINATE;

Is unreachable as there are no "break" statements in the switch, and the default
falls through to return AE_OK. Something doesn't seem right here.

-- 
Darren Hart
VMware Open Source Technology Center
