From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: add alternative representation for Yoga
 2 to DMI table
Date: Tue, 28 Jul 2015 21:35:29 -0700
Message-ID: <20150729043529.GA76828@vmdeb7>
References: <1437261021-25632-1-git-send-email-dos@dosowisko.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48017 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752414AbbG2FwL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jul 2015 01:52:11 -0400
Content-Disposition: inline
In-Reply-To: <1437261021-25632-1-git-send-email-dos@dosowisko.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sebastian Krzyszkowiak <dos@dosowisko.net>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org

On Sun, Jul 19, 2015 at 01:10:21AM +0200, Sebastian Krzyszkowiak wrote:
> There is at least one (mine) Yoga 2 Pro in existence that has incorrect
> product version stored in DMI (reading as "INVALID"), causing it to not be
> recognized as Yoga 2 by ideapad-laptop module, which in turn causes
> non-existent hardware rfkills to be always reported as blocked.
> 
> This change adds a second check by board name, which is "Yoga2".
> Looks like it also happens to be "INVALID" on some other Yoga 2 machines
> where product version is correct instead, so the original check is left
> intact to catch both cases.
> 
> Signed-off-by: Sebastian Krzyszkowiak <dos@dosowisko.net>

Hi Sebastien,

Please Cc the full list reported by get_maintainer in the future.

Ike, any concerns from you if I pull this in?

> ---
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 76b5738..4241262 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -853,6 +853,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
>  		},
>  	},
>  	{
> +		.ident = "Lenovo Yoga 2 11 / 13 / Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "Yoga2"),
> +		},
> +	},
> +	{
>  		.ident = "Lenovo Yoga 3 Pro 1370",
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> -- 
> 2.4.6
> 
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Darren Hart
Intel Open Source Technology Center
