Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BA6C6FD19
	for <platform-driver-x86@archiver.kernel.org>; Sun, 12 Mar 2023 03:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjCLDhv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Mar 2023 22:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjCLDhv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Mar 2023 22:37:51 -0500
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3945A193
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 19:37:49 -0800 (PST)
Date:   Sun, 12 Mar 2023 03:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1678592268; bh=46PsHM/aoZVw3bubgcReS+oLTOQrMdAVTBKE6Lt4ymY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LniVDcm4JmPmpOk9IODTJFrdPi6Zs2DqB7YkMe+NDeYOx9/Rrc46Oy1H/P7sZtukK
         WTZAVXcKBhuF6trbdu2L47Q3G49I2kXlflrBd6qqixJeEsDY92rviOXHyCUsZkcXPk
         43y1NCvN6IoJvRdXg0u/Qr2+KdYJHwM/7Gsz0lTg=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: think-lmi: Add possible_values for
 ThinkStation
Message-ID: <84477e76-da8d-4eaa-b229-2f7e4fe858d4@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230312024635.518769-1-mpearson-lenovo@squebb.ca>
 <20230312024635.518769-2-mpearson-lenovo@squebb.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312024635.518769-2-mpearson-lenovo@squebb.ca>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Mar 11, 2023 at 09:46:35PM -0500, Mark Pearson wrote:
> ThinkStation platforms don't support the API to return possible_values
> but instead embed it in the settings string.
> 
> Try and extract this information and set the possible_values attribute
> appropriately.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/platform/x86/think-lmi.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 495a5e045069..52f3472fd1e0 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -1432,6 +1432,29 @@ static int tlmi_analyze(void)
>  			if (ret || !setting->possible_values)
>  				pr_info("Error retrieving possible values for %d : %s\n",
>  						i, setting->display_name);
> +		} else {
> +			/*
> +			 * Older Thinkstations don't support the bios_selections API.
> +			 * Instead they store this as a [Optional:Option1,Option2] section of the
> +			 * name string.
> +			 * Try and pull that out if it's available.
> +			 */
> +			char *item, *optstart, *optend;
> +
> +			if (!tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID)) {
> +				optstart = strstr(item, "[Optional:");
> +				if (optstart) {
> +					optstart += strlen("[Optional:");
> +					optend = strstr(optstart, "]");
> +					if (optend) {
> +						setting->possible_values =
> +							kmalloc(optend - optstart, GFP_KERNEL);
> +						strncpy(setting->possible_values,
> +								optstart, optend - optstart);
> +						setting->possible_values[optend - optstart] = '\0';

Same as for patch 1.

kmalloc() can fail, etc.

kstrndup() would be much easier.

> +					}
> +				}
> +			}
>  		}
>  		/* If we don't have a possible value mark as N/A */
>  		if (!setting->possible_values) {
> -- 
> 2.39.1
> 
