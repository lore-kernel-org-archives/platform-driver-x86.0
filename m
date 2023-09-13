Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E16EE0211
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Sep 2023 23:33:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233122AbjIMXd4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Sep 2023 19:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbjIMXdz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2023 19:33:55 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA159F3
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 16:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
        s=mail; t=1694648029;
        bh=+YbmMum+zPhw7c3MMHEohMWFvdSlgxkg8aCsH5vW4AY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UiMTincnMvdOGkvsGo1+1U9YZamAKPA+vk8xtxW59zp7wF+/8hstQVBVRo2r8r3m5
         jsHmNCmJSyplili4azcOJDhp+vmSqcAskgbtskOVOjDeZa7XkLMLslQjLgF7jFP3iT
         uvvwNOlMcZVD3C+laQt/Pt+6Xl6OZspOs3oK5bq8=
Date:   Thu, 14 Sep 2023 01:33:47 +0200
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     admin@dennisbonke.com
Cc:     platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Take mutex in hotkey_resume
Message-ID: <900bedba-378e-4215-8b88-27dcc6353164@t-8ch.de>
References: <20230913231829.192842-1-admin@dennisbonke.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230913231829.192842-1-admin@dennisbonke.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dennis,

thanks for the fix!

On 2023-09-14 01:18:29+0200, admin@dennisbonke.com wrote:
> From: Dennis Bonke <admin@dennisbonke.com>
> 
> hotkey_status_{set,get} expect the hotkey_mutex to be held.
> It seems like it was missed here and that gives warnings while resuming.

Which kind of warnings?

If it's from lockdep then it's triggered by hotkey_mask_set() and the
commit message is a bit off.

Also then the patch needs:

Fixes: 38831eaf7d4c ("platform/x86: thinkpad_acpi: use lockdep annotations")
Cc: stable@vger.kernel.org

With those:

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

> 
> Signed-off-by: Dennis Bonke <admin@dennisbonke.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index d70c89d32534..de5859a5eb0d 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4116,9 +4116,11 @@ static void hotkey_resume(void)
>  {
>  	tpacpi_disable_brightness_delay();
>  
> +	mutex_lock(&hotkey_mutex)
>  	if (hotkey_status_set(true) < 0 ||
>  	    hotkey_mask_set(hotkey_acpi_mask) < 0)
>  		pr_err("error while attempting to reset the event firmware interface\n");
> +	mutex_unlock(&hotkey_mutex);
>  
>  	tpacpi_send_radiosw_update();
>  	tpacpi_input_send_tabletsw();
> -- 
> 2.40.1
> 
