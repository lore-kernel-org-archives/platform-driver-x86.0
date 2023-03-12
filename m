Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BDBC6FD19
	for <platform-driver-x86@archiver.kernel.org>; Sun, 12 Mar 2023 03:33:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjCLDdh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Mar 2023 22:33:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjCLDdg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Mar 2023 22:33:36 -0500
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF6930B1F
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 19:33:34 -0800 (PST)
Date:   Sun, 12 Mar 2023 03:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
        t=1678592011; bh=1xblWa4hqI8ARm+JrvZ+RtB080k//BPp06V4849lvSg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e+Er7ZTXNWfHwnsMkayvQIOsfOSabmRQHK3gNFmEp+dTxVxcpUj88/HP9aY6Vjhjv
         /tOwio6T0LrCr7yCjXQdZqBUK63Y1zVnvdSqzCOsNa2CllZV73NFWq0B595tAT+M8s
         TmIWAxYFzlu+tMZpO8NNaJueNP0m6Jbd316QlW+M=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To:     Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     hdegoede@redhat.com, markgross@kernel.org, markpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: think-lmi: add missing type attribute
Message-ID: <0bc6d16a-5c58-462b-92d5-d827d92b65ed@t-8ch.de>
References: <mpearson-lenovo@squebb.ca>
 <20230312024635.518769-1-mpearson-lenovo@squebb.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312024635.518769-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Mar 11, 2023 at 09:46:34PM -0500, Mark Pearson wrote:
> This driver was missing the mandatory type attribute...oops.
> 
> Add it in along with logic to determine whether the attribute is an
> enumeration type or a string by parsing the possible_values attribute.
> 
> Some platforms (and some attributes) don't return possible_values so to
> prevent trying to scan NULL strings mark these as "N/A".
> 
> Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=216460

Afaik Fixes: is only for references to commits.
Instead a Reported-by/Link would be better.

> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  drivers/platform/x86/think-lmi.c | 26 +++++++++++++++++++++++---
>  drivers/platform/x86/think-lmi.h |  6 ++++++
>  2 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 86b33b74519b..495a5e045069 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -941,12 +941,18 @@ static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute
>  {
>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
>  
> -	if (!tlmi_priv.can_get_bios_selections)
> -		return -EOPNOTSUPP;
> -
>  	return sysfs_emit(buf, "%s\n", setting->possible_values);
>  }
>  
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +		char *buf)
> +{
> +	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> +
> +	return sysfs_emit(buf, "%s\n",
> +			setting->type == TLMI_ENUMERATION ? "enumeration" : "string");
> +}
> +
>  static ssize_t current_value_store(struct kobject *kobj,
>  		struct kobj_attribute *attr,
>  		const char *buf, size_t count)
> @@ -1036,10 +1042,13 @@ static struct kobj_attribute attr_possible_values = __ATTR_RO(possible_values);
>  
>  static struct kobj_attribute attr_current_val = __ATTR_RW_MODE(current_value, 0600);
>  
> +static struct kobj_attribute attr_type = __ATTR_RO(type);
> +
>  static struct attribute *tlmi_attrs[] = {
>  	&attr_displ_name.attr,
>  	&attr_current_val.attr,
>  	&attr_possible_values.attr,
> +	&attr_type.attr,
>  	NULL
>  };
>  
> @@ -1424,6 +1433,17 @@ static int tlmi_analyze(void)
>  				pr_info("Error retrieving possible values for %d : %s\n",
>  						i, setting->display_name);
>  		}
> +		/* If we don't have a possible value mark as N/A */
> +		if (!setting->possible_values) {
> +			setting->possible_values = kmalloc(strlen("N/A"), GFP_KERNEL);

kmalloc() can fail.

> +			sprintf(setting->possible_values, "N/A");

This writes the '\0' out of bounds?

kmalloc() and sprintf() could be replaced with kstrdup().

Instead of having to do allocations, check for failure, worry about how
sysfs_emit() will handle the NULL it would be easier to just check of
NULL inside possible_values_show() and fall back to N/A there.

> +		}
> +		/* Figure out what setting type is as BIOS does not return this */
> +		if (strchr(setting->possible_values, ','))

possible_values could be NULL if the sprintf would not have dereferenced
it before.

> +			setting->type = TLMI_ENUMERATION;
> +		else
> +			setting->type = TLMI_STRING;
> +

Is it worth introducing a new enum and field in struct
tlmi_attr_setting?
The check could also be done directly in type_show().
(with a NULL-check).

>  		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
>  		tlmi_priv.setting[i] = setting;
>  		kfree(item);
> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
> index 4daba6151cd6..b76edcb9b1af 100644
> --- a/drivers/platform/x86/think-lmi.h
> +++ b/drivers/platform/x86/think-lmi.h
> @@ -27,6 +27,11 @@ enum level_option {
>  	TLMI_LEVEL_MASTER,
>  };
>  
> +enum attr_type {
> +	TLMI_ENUMERATION,
> +	TLMI_STRING,
> +};
> +
>  /* password configuration details */
>  struct tlmi_pwdcfg_core {
>  	uint32_t password_mode;
> @@ -73,6 +78,7 @@ struct tlmi_attr_setting {
>  	int index;
>  	char display_name[TLMI_SETTINGS_MAXLEN];
>  	char *possible_values;
> +	enum attr_type type;
>  };
>  
>  struct think_lmi {
> -- 
> 2.39.1
> 
