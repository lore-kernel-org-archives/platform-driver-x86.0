Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5B4C6FD19
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Mar 2023 23:58:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjCMX6a (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Mar 2023 19:58:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjCMX63 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2023 19:58:29 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30BAA2B628
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 16:58:22 -0700 (PDT)
Date:   Mon, 13 Mar 2023 23:58:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
        s=mail; t=1678751900;
        bh=j3yCKYPJgLPaPtrxlzjTxcb5go3Ygr92vfeCEhdLfyk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qbkLkyJmGXOm8U///IF/AB8HYO4gP40ytY44HFA1jRZ6kW9sc4VA1HmnGX4ElcRpx
         feH22xGVmsZe7ciSISDwO/+QCj3byRxg9tsyiQUVhmz77uNYnIIblYGH/Z7xKNE5HZ
         bVpgNyaKWJvr2WQ5tA4ZySeZzt0+ZXpwtTWmOYHo=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/2] platform/x86: think-lmi: Add possible_values for
 ThinkStation
Message-ID: <9b2cbb46-6438-462d-b98f-82edfc34df64@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230313184541.193733-1-mpearson-lenovo@squebb.ca>
 <20230313184541.193733-2-mpearson-lenovo@squebb.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313184541.193733-2-mpearson-lenovo@squebb.ca>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

some more remarks, sorry not seeing this earlier.

On Mon, Mar 13, 2023 at 02:45:41PM -0400, Mark Pearson wrote:
> ThinkStation platforms don't support the API to return possible_values
> but instead embed it in the settings string.
> 
> Try and extract this information and set the possible_values attribute
> appropriately.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in V2:
>  - Move no value for possible_values handling into show function
>  - use kstrndup for allocating string
> 
>  drivers/platform/x86/think-lmi.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 5fa5451c4802..7dd8f72176f5 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -941,10 +941,9 @@ static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute
>  {
>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
>  
> -	if (!tlmi_priv.can_get_bios_selections)
> -		return -EOPNOTSUPP;
> -
> -	return sysfs_emit(buf, "%s\n", setting->possible_values);
> +	if (setting->possible_values)
> +		return sysfs_emit(buf, "%s\n", setting->possible_values);
> +	return sysfs_emit(buf, "not available\n");
>  }

As the attribute "possible_values" is not mandatory it should be
possible to hide it completely with an is_visible callback.

This would indicate absence clearer than a magic value.

>  static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> @@ -1440,6 +1439,25 @@ static int tlmi_analyze(void)
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

The values in possible_values are supposed to be separated by
semi-colons, not commas.
I don't know how this affects the existing parts of this driver but it
affects both patches of this series.

> +			char *item, *optstart, *optend;
> +
> +			if (!tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID)) {
> +				optstart = strstr(item, "[Optional:");
> +				if (optstart) {
> +					optstart += strlen("[Optional:");
> +					optend = strstr(optstart, "]");
> +					if (optend)
> +						setting->possible_values =
> +							kstrndup(optstart, optend - optstart, GFP_KERNEL);
> +				}
> +			}
>  		}
>  		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
>  		tlmi_priv.setting[i] = setting;
> -- 
> 2.39.2
> 
