Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3221C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 16:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjCRQgE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 12:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjCRQgE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 12:36:04 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888D236080
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 09:36:02 -0700 (PDT)
Date:   Sat, 18 Mar 2023 16:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1679157358; bh=5zuGStLU05CVaICSs6q/WwYzmnVD/YH2/pW+Qxgqb44=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E75t5k9SBkSn8Okm7UX0uKaeTEUq2DvYMVbhd8wVQhRbfMKp2rS9XYTlM/JStjJec
         o5tkZMuOcnZM1yCoEjKuSREfY/jZA+1bF5amogeewbypNc7f3E10l5ZsdpOMQvBYSn
         IIg3aPb3kaRHZLHSmpbzRAq98Zd7APHXXHxO8e9s=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 2/3] platform/x86: think-lmi: Add possible_values for
 ThinkStation
Message-ID: <c6175d59-2000-4145-95a6-b022631bf3a3@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230317154635.39692-1-mpearson-lenovo@squebb.ca>
 <20230317154635.39692-2-mpearson-lenovo@squebb.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317154635.39692-2-mpearson-lenovo@squebb.ca>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

please also CC linux-kernel@vger.kernel.org and previous reviewers.

On Fri, Mar 17, 2023 at 11:46:34AM -0400, Mark Pearson wrote:
> ThinkStation platforms don't support the API to return possible_values
> but instead embed it in the settings string.
> 
> Try and extract this information and set the possible_values attribute
> appropriately.
> 
> If there aren't any values possible then don't display possible_values.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in V3:
>  - Use is_visible attribute to determine if possible_values should be
>    available
>  - Code got refactored a bit to make compilation cleaner
> Changes in V2:
>  - Move no value for possible_values handling into show function
>  - use kstrndup for allocating string
> 
>  drivers/platform/x86/think-lmi.c | 82 ++++++++++++++++++++++----------
>  1 file changed, 56 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 5fa5451c4802..d89a1c9bdbf1 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -917,6 +917,8 @@ static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *at
>  	return sysfs_emit(buf, "%s\n", setting->display_name);
>  }
>  
> +static struct kobj_attribute attr_displ_name = __ATTR_RO(display_name);
> +
>  static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
>  {
>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> @@ -937,30 +939,6 @@ static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *a
>  	return ret;
>  }
>  
> -static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> -{
> -	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> -
> -	if (!tlmi_priv.can_get_bios_selections)
> -		return -EOPNOTSUPP;
> -
> -	return sysfs_emit(buf, "%s\n", setting->possible_values);
> -}
> -
> -static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> -		char *buf)
> -{
> -	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> -
> -	if (setting->possible_values) {
> -		/* Figure out what setting type is as BIOS does not return this */
> -		if (strchr(setting->possible_values, ','))
> -			return sysfs_emit(buf, "enumeration\n");
> -	}
> -	/* Anything else is going to be a string */
> -	return sysfs_emit(buf, "string\n");
> -}
> -
>  static ssize_t current_value_store(struct kobject *kobj,
>  		struct kobj_attribute *attr,
>  		const char *buf, size_t count)
> @@ -1044,14 +1022,46 @@ static ssize_t current_value_store(struct kobject *kobj,
>  	return ret ?: count;
>  }
>  
> -static struct kobj_attribute attr_displ_name = __ATTR_RO(display_name);
> +static struct kobj_attribute attr_current_val = __ATTR_RW_MODE(current_value, 0600);
> +
> +static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> +
> +	return sysfs_emit(buf, "%s\n", setting->possible_values);
> +}
>  
>  static struct kobj_attribute attr_possible_values = __ATTR_RO(possible_values);
>  
> -static struct kobj_attribute attr_current_val = __ATTR_RW_MODE(current_value, 0600);
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +		char *buf)
> +{
> +	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> +
> +	if (setting->possible_values) {
> +		/* Figure out what setting type is as BIOS does not return this */
> +		if (strchr(setting->possible_values, ','))
> +			return sysfs_emit(buf, "enumeration\n");
> +	}
> +	/* Anything else is going to be a string */
> +	return sysfs_emit(buf, "string\n");
> +}

This patch seems to introduce a lot of churn, is it intentional?
>  
>  static struct kobj_attribute attr_type = __ATTR_RO(type);
>  
> +static umode_t attr_is_visible(struct kobject *kobj,
> +					     struct attribute *attr, int n)
> +{
> +	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> +
> +	/* We don't want to display possible_values attributes if not available */
> +	if (attr == (struct attribute *)&attr_possible_values)

This cast is unsafe, if the struct kobj_attribute order is randomised it
will break.

You can use

	if (attr == &attr_possible_values.attr)

> +		if (!setting->possible_values)
> +			return 0;
> +
> +	return attr->mode;
> +}
> +
>  static struct attribute *tlmi_attrs[] = {
>  	&attr_displ_name.attr,
>  	&attr_current_val.attr,
> @@ -1061,6 +1071,7 @@ static struct attribute *tlmi_attrs[] = {
>  };
>  
>  static const struct attribute_group tlmi_attr_group = {
> +	.is_visible = attr_is_visible,
>  	.attrs = tlmi_attrs,
>  };
>  
> @@ -1440,6 +1451,25 @@ static int tlmi_analyze(void)
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
> +					if (optend)
> +						setting->possible_values =
> +							kstrndup(optstart, optend - optstart, GFP_KERNEL);
> +				}
> +			}

The patch now does two things:
1) Hide the sysfs attributes if the value is not available
2) Extract the value from the description

Maybe it could be split in two?

Another observation:
Would it make sense to remove the part
"[Optional:Option1,Option2]" from the name attribute?

>  		}
>  		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
>  		tlmi_priv.setting[i] = setting;
> -- 
> 2.39.2
> 
