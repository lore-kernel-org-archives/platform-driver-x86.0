Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1347C7618B
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 16:39:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjCRQjw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 12:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjCRQjv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 12:39:51 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907E7729E
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 09:39:50 -0700 (PDT)
Date:   Sat, 18 Mar 2023 16:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1679157588; bh=6atUGdrNB6qHUBeOJvEFY46K4Crm923OLGqR44kM/bI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KgSKhoztHUEPTi3U6Y1jO598csysXA0BnFGUwIEhCrhe+ZpzhpL3uzk9Y1R5BAs55
         DHy4hh79BLGvNPfSrtTSxzXbGLW6Py8NNyXgE4GN2lOzevaFqIKan+2cTcF1DR9mPa
         pubrH0zIsOHQIzE6/6cix72fpXyGzhrIHeH5jfqo=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 3/3] platform/x86: think-lmi: use correct
 possible_values delimters
Message-ID: <23e08752-777b-4af5-8dbb-c57b1afb822f@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-3-mpearson-lenovo@squebb.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317154635.39692-3-mpearson-lenovo@squebb.ca>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Mar 17, 2023 at 11:46:35AM -0400, Mark Pearson wrote:
> firmware-attributes class requires that possible values are delimited
> using ';' but the Lenovo firmware uses ',' instead.
> Parse string and replace where appropriate
> 
> Thanks to Thomas W for pointing this out.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  Changes in V3: New patch added to the series. No V1 & V2.
> 
>  drivers/platform/x86/think-lmi.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index d89a1c9bdbf1..204f1060a533 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -1040,7 +1040,7 @@ static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
>  
>  	if (setting->possible_values) {
>  		/* Figure out what setting type is as BIOS does not return this */
> -		if (strchr(setting->possible_values, ','))
> +		if (strchr(setting->possible_values, ';'))
>  			return sysfs_emit(buf, "enumeration\n");

I think this patch should be earlier in the series.
So the other patches can work directly from the beginning.

Also maybe this needs a Fixes: tag and a Cc: stable@ so it gets
backported.

>  	}
>  	/* Anything else is going to be a string */
> @@ -1471,6 +1471,17 @@ static int tlmi_analyze(void)
>  				}
>  			}
>  		}
> +		/*
> +		 * firmware-attributes requires that possible_values are separated by ';' but
> +		 * Lenovo FW uses ','. Replace appropriately.
> +		 */
> +		if (setting->possible_values) {
> +			char *tmp = setting->possible_values;
> +
> +			while ((tmp = strchr(tmp, ',')) != NULL)
> +				*tmp++ = ';';
> +		}
> +
>  		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
>  		tlmi_priv.setting[i] = setting;
>  		kfree(item);
> -- 
> 2.39.2
> 
