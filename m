From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] intel_ips: quieten "power or thermal limit exceeded"
 messages
Date: Fri, 27 Aug 2010 01:18:53 +0100
Message-ID: <20100827011853.3faef5e7@lxorguk.ukuu.org.uk>
References: <4C74686D.8090707@cesarb.net>
	<1282865341-17607-1-git-send-email-cesarb@cesarb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:38616 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754832Ab0H0ABp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Aug 2010 20:01:45 -0400
In-Reply-To: <1282865341-17607-1-git-send-email-cesarb@cesarb.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Cesar Eduardo Barros <cesarb@cesarb.net>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 26 Aug 2010 20:29:01 -0300
Cesar Eduardo Barros <cesarb@cesarb.net> wrote:

> On my Dell Inspiron N4010, one of these messages is printed every five
> seconds. Change both to dev_dbg to quieten them even more.

It's not the kind of thing you want to quieten since in most cases it is
stuff you want to know about.

> 
> Signed-off-by: Cesar Eduardo Barros <cesarb@cesarb.net>
> ---
>  drivers/platform/x86/intel_ips.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> index 9024480..7833adc 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -607,7 +607,7 @@ static bool mcp_exceeded(struct ips_driver *ips)
>  	spin_unlock_irqrestore(&ips->turbo_status_lock, flags);
>  
>  	if (ret)
> -		dev_info(&ips->dev->dev,
> +		dev_dbg(&ips->dev->dev,
>  			 "MCP power or thermal limit exceeded\n");

Probably better to ratelimit it. Being told it occurs is important, being
told every five seconds is indeed excessive.

Alan
