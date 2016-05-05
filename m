From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/1] ideapad-laptop: Handle Yoga in tablet mode
Date: Thu, 5 May 2016 16:42:47 -0700
Message-ID: <20160505234247.GG2113@f23x64.localdomain>
References: <1459544569-29865-1-git-send-email-list@eworm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48184 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754614AbcEEXmu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 May 2016 19:42:50 -0400
Content-Disposition: inline
In-Reply-To: <1459544569-29865-1-git-send-email-list@eworm.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Christian Hesse <list@eworm.de>
Cc: platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>

On Fri, Apr 01, 2016 at 11:02:49PM +0200, Christian Hesse wrote:
> From: Christian Hesse <mail@eworm.de>
> 
> When Lenovo Yoga 700 is flipped to tablet mode it emmits event 10. Let's
> send touchpad key codes so software can disable touchpad.
> 
> Signed-off-by: Christian Hesse <mail@eworm.de>
> Signed-off-by: Michael Gisbers <michael@gisbers.de>

Queued, thanks.

> ---
>  drivers/platform/x86/ideapad-laptop.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index be3bc2f..1d49db1 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -809,6 +809,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>  			case 6:
>  				ideapad_input_report(priv, vpc_bit);
>  				break;
> +			case 10:
>  			case 5:
>  				ideapad_sync_touchpad_state(priv);
>  				break;
> -- 
> 2.8.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Darren Hart
Intel Open Source Technology Center
