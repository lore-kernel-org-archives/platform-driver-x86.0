Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C909C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 May 2022 06:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233641AbiEDGPY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 May 2022 02:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233453AbiEDGPX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 May 2022 02:15:23 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA0615A13
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 May 2022 23:11:48 -0700 (PDT)
Date:   Wed, 4 May 2022 08:11:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=t-8ch.de; s=mail;
        t=1651644705; bh=nWTipHjTqTixz8w7jR6LGAhjzxtDgYSt6f8e52i1jrw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dbkzM5Os0HaoN0m3n0bE07BwSBSUITGaZj7o9fUUOiMuWq/gwc69iZVSxvMH+Gnzf
         rgok5QF/OWTGHjJZvm3WkTICZuQWG+rEkap3J+g20D/d8dYXppQIVrnxjOkXQeXnH/
         Zyted4FLIfRwqHUcEcrLkMkXuU9hwGbv4ETSOQmo=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, lyude@redhat.com
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Correct dual fan probe
Message-ID: <bcc78237-fa4c-4d9f-86a6-4d1a8ea0e0fe@t-8ch.de>
References: <markpearson@lenovo.com>
 <20220502191200.63470-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220502191200.63470-1-markpearson@lenovo.com>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks!

On 2022-05-02 15:12-0400, Mark Pearson wrote:
> Date: Mon, 2 May 2022 15:12:00 -0400
> From: Mark Pearson <markpearson@lenovo.com>
> To: markpearson@lenovo.com
> CC: hdegoede@redhat.com, markgross@kernel.org,
>  platform-driver-x86@vger.kernel.org, lyude@redhat.com, thomas@t-8ch.de
> Subject: [PATCH] platform/x86: thinkpad_acpi: Correct dual fan probe
> X-Mailer: git-send-email 2.35.1
> 
> There was an issue with the dual fan probe whereby the probe was
> failing as it assuming that second_fan support was not available.
> 
> Corrected the logic so the probe works correctly. Cleaned up so
> quirks only used if 2nd fan not detected.
> 
> Tested on X1 Carbon 10 (2 fans), X1 Carbon 9 (2 fans) and T490 (1 fan)
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index f385450af864..5eea6651a312 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8862,24 +8862,27 @@ static int __init fan_init(struct ibm_init_struct *iibm)
>  			fan_status_access_mode = TPACPI_FAN_RD_TPEC;
>  			if (quirks & TPACPI_FAN_Q1)
>  				fan_quirk1_setup();
> -			if (quirks & TPACPI_FAN_2FAN) {
> -				tp_features.second_fan = 1;
> -				pr_info("secondary fan support enabled\n");
> -			}
> -			if (quirks & TPACPI_FAN_2CTL) {
> -				tp_features.second_fan = 1;
> -				tp_features.second_fan_ctl = 1;
> -				pr_info("secondary fan control enabled\n");
> -			}
>  			/* Try and probe the 2nd fan */
> +			tp_features.second_fan = 1; /* needed for get_speed to work */
>  			res = fan2_get_speed(&speed);
>  			if (res >= 0) {
>  				/* It responded - so let's assume it's there */
>  				tp_features.second_fan = 1;
>  				tp_features.second_fan_ctl = 1;
>  				pr_info("secondary fan control detected & enabled\n");
> +			} else {
> +				/* Fan not auto-detected */
> +				tp_features.second_fan = 0;
> +				if (quirks & TPACPI_FAN_2FAN) {
> +					tp_features.second_fan = 1;
> +					pr_info("secondary fan support enabled\n");
> +				}
> +				if (quirks & TPACPI_FAN_2CTL) {
> +					tp_features.second_fan = 1;
> +					tp_features.second_fan_ctl = 1;
> +					pr_info("secondary fan control enabled\n");
> +				}
>  			}
> -
>  		} else {
>  			pr_err("ThinkPad ACPI EC access misbehaving, fan status and control unavailable\n");
>  			return -ENODEV;
> -- 
> 2.35.1
> 

Tested-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

FYI this now inverts the logic from "platform/x86: thinkpad_acpi: Don't probe 2nd fan if enabled by quirk" [0]
Instead of skipping the probe when there is a quirk the quirk is skipped if the
probe succeeds first.

Going after the rationale in the patch it might be better to turn this around
here, too:

	"If we already know that the system in question has a quirk telling us that
	the system has a second fan, there's no purpose in probing the second fan -
	especially when probing the second fan may not work properly with systems
	relying on quirks."

[0] https://lore.kernel.org/platform-driver-x86/20220429211418.4546-3-lyude@redhat.com/
