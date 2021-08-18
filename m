Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB74C43214
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 07:44:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC6B660FDA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 07:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239128AbhHRHpP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 03:45:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45592 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239297AbhHRHpN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 03:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629272679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MI1DMsHbp62Or49BgJmJk6BLknMCFVLiGYypueRUiB0=;
        b=ZCo1mv4a1FgLFlzBJANSIaWi0Kd3rbsrf4VUDc6EzAdFz7/ljTLcA5FD+Do5dbm4ksbrLm
        BDsSP/H8e3TVjIdJYyY+Ja9iy3vGKNlpIz5VsJ/7X1vgPmHaEZI68tzw3QECxEeRlqaYFd
        LOq5afdmUOPOUNUvY+NSQqNh02O5J+o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-cwUYf8lENUOyZoIF-kRohg-1; Wed, 18 Aug 2021 03:44:37 -0400
X-MC-Unique: cwUYf8lENUOyZoIF-kRohg-1
Received: by mail-ed1-f70.google.com with SMTP id x4-20020a50d9c4000000b003bed5199871so591965edj.14
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 00:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MI1DMsHbp62Or49BgJmJk6BLknMCFVLiGYypueRUiB0=;
        b=TVRFnRRgwehU6ZxbU8hUBPQXISwxV7GF3nS8JEK4FfBcsZQBwYz0/QQb//WcM+0f23
         ibM7iTkV0C2HnvOVonwcM6o9kZtTsVXWgW8zQ5uVJJm6+Y3XxSnkkGmRIwJ1MK9CpY67
         1isrH2Q36rXBoOxMbqrGReIwxGlvL6CtxzgnRTsa60BEE5RbvfPoXW5Q+m8j18sJn4ZC
         aBeJrtdWBsgm0DmIULhWGfmE9+fPpVt/LiFVd5P9tUo3C7KZqRfcL80qGpKLhEMhJZgQ
         WLVwPqTpgdKvtumKwAOqTLSbzQU6gTvCFzaNd7zwY/SdjMsAN8mtje96IDKSL1YhzOym
         aJTA==
X-Gm-Message-State: AOAM533yKFsBBaYcdQxHj8lDOmzUJNe7jJdfsJsSP31auvfNUFlfIlI8
        101vUQx0ot+FRxrKoRSomd/BDRhIGNxTUoVrwrIo9Ues598jVvy6HhQOmcUYDv/YAmUyBur7UuG
        oesswblu8wyfvy/dIbtPP1xKoqos63zV6Xauye5aWBve+cs0Bw8ix7QP6fi2ziyJdVFwYwIQQS7
        ZwLkAyq2BivA==
X-Received: by 2002:a05:6402:2158:: with SMTP id bq24mr8835544edb.8.1629272676514;
        Wed, 18 Aug 2021 00:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm3kW4iIijdLYyoWflDqHhbXxvrKXJuTFtoBuGhWgHvXpT6CgsF82qpyPAVsO7GoHMyshjvA==
X-Received: by 2002:a05:6402:2158:: with SMTP id bq24mr8835532edb.8.1629272676357;
        Wed, 18 Aug 2021 00:44:36 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v1sm2164982edx.69.2021.08.18.00.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 00:44:36 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: think-lmi: add debug_cmd
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20210817001501.293501-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <07f7c7d6-176a-9328-ffd2-2ca5cb8040c8@redhat.com>
Date:   Wed, 18 Aug 2021 09:44:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817001501.293501-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/17/21 2:15 AM, Mark Pearson wrote:
> Many Lenovo BIOS's support the ability to send a debug command which
> is useful for debugging and testing unreleased or early features.
> 
> Adding support for this feature as a module parameter.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
> Changes in v2: 
>  - Updated to use debug_support parameter to enable feature
>  - remove changes to pending_reboot as that was integrated separately
> 
>  .../testing/sysfs-class-firmware-attributes   | 11 +++
>  drivers/platform/x86/think-lmi.c              | 80 +++++++++++++++++++
>  drivers/platform/x86/think-lmi.h              |  1 +
>  3 files changed, 92 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 0b43997b76e3..90fdf935aa5e 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -272,3 +272,14 @@ Description:
>  
>  		Note that any changes to this attribute requires a reboot
>  		for changes to take effect.
> +
> +What:		/sys/class/firmware-attributes/*/attributes/debug_cmd
> +Date:		July 2021
> +KernelVersion:	5.14
> +Contact:	Mark Pearson <markpearson@lenovo.com>
> +Description:
> +		This write only attribute can be used to send debug commands to the BIOS.
> +		This should only be used when recommended by the BIOS vendor. Vendors may
> +		use it to enable extra debug attributes or BIOS features for testing purposes.
> +
> +		Note that any changes to this attribute requires a reboot for changes to take effect.
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 6cfed4427fb0..4d246bfe4907 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -20,6 +20,10 @@
>  #include "firmware_attributes_class.h"
>  #include "think-lmi.h"
>  
> +static bool debug_support;
> +module_param(debug_support, bool, 0644);

0644 implies the setting can be changed at runtime, but it is checked
only at driver bind + unbind time, so this should be 0444.

Since the rest of the patch looks good, I've fixed this up while merging
the patch.

###

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> +MODULE_PARM_DESC(debug_support, "Enable debug command support");
> +
>  /*
>   * Name:
>   *  Lenovo_BiosSetting
> @@ -116,6 +120,14 @@
>   */
>  #define LENOVO_GET_BIOS_SELECTIONS_GUID	"7364651A-132F-4FE7-ADAA-40C6C7EE2E3B"
>  
> +/*
> + * Name:
> + *  Lenovo_DebugCmdGUID
> + * Description
> + *  Debug entry GUID method for entering debug commands to the BIOS
> + */
> +#define LENOVO_DEBUG_CMD_GUID "7FF47003-3B6C-4E5E-A227-E979824A85D1"
> +
>  #define TLMI_POP_PWD (1 << 0)
>  #define TLMI_PAP_PWD (1 << 1)
>  #define to_tlmi_pwd_setting(kobj)  container_of(kobj, struct tlmi_pwd_setting, kobj)
> @@ -660,6 +672,64 @@ static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *
>  
>  static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
>  
> +/* ---- Debug interface--------------------------------------------------------- */
> +static ssize_t debug_cmd_store(struct kobject *kobj, struct kobj_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	char *set_str = NULL, *new_setting = NULL;
> +	char *auth_str = NULL;
> +	char *p;
> +	int ret;
> +
> +	if (!tlmi_priv.can_debug_cmd)
> +		return -EOPNOTSUPP;
> +
> +	new_setting = kstrdup(buf, GFP_KERNEL);
> +	if (!new_setting)
> +		return -ENOMEM;
> +
> +	/* Strip out CR if one is present */
> +	p = strchrnul(new_setting, '\n');
> +	*p = '\0';
> +
> +	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password[0]) {
> +		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
> +				tlmi_priv.pwd_admin->password,
> +				encoding_options[tlmi_priv.pwd_admin->encoding],
> +				tlmi_priv.pwd_admin->kbdlang);
> +		if (!auth_str) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +	}
> +
> +	if (auth_str)
> +		set_str = kasprintf(GFP_KERNEL, "%s,%s", new_setting, auth_str);
> +	else
> +		set_str = kasprintf(GFP_KERNEL, "%s;", new_setting);
> +	if (!set_str) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	ret = tlmi_simple_call(LENOVO_DEBUG_CMD_GUID, set_str);
> +	if (ret)
> +		goto out;
> +
> +	if (!ret && !tlmi_priv.pending_changes) {
> +		tlmi_priv.pending_changes = true;
> +		/* let userland know it may need to check reboot pending again */
> +		kobject_uevent(&tlmi_priv.class_dev->kobj, KOBJ_CHANGE);
> +	}
> +out:
> +	kfree(auth_str);
> +	kfree(set_str);
> +	kfree(new_setting);
> +	return ret ?: count;
> +}
> +
> +static struct kobj_attribute debug_cmd = __ATTR_WO(debug_cmd);
> +
>  /* ---- Initialisation --------------------------------------------------------- */
>  static void tlmi_release_attr(void)
>  {
> @@ -673,6 +743,8 @@ static void tlmi_release_attr(void)
>  		}
>  	}
>  	sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
> +	if (tlmi_priv.can_debug_cmd && debug_support)
> +		sysfs_remove_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
>  	kset_unregister(tlmi_priv.attribute_kset);
>  
>  	/* Authentication structures */
> @@ -737,6 +809,11 @@ static int tlmi_sysfs_init(void)
>  	if (ret)
>  		goto fail_create_attr;
>  
> +	if (tlmi_priv.can_debug_cmd && debug_support) {
> +		ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
> +		if (ret)
> +			goto fail_create_attr;
> +	}
>  	/* Create authentication entries */
>  	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
>  								&tlmi_priv.class_dev->kobj);
> @@ -793,6 +870,9 @@ static int tlmi_analyze(void)
>  	if (wmi_has_guid(LENOVO_BIOS_PASSWORD_SETTINGS_GUID))
>  		tlmi_priv.can_get_password_settings = true;
>  
> +	if (wmi_has_guid(LENOVO_DEBUG_CMD_GUID))
> +		tlmi_priv.can_debug_cmd = true;
> +
>  	/*
>  	 * Try to find the number of valid settings of this machine
>  	 * and use it to create sysfs attributes.
> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
> index eb598846628a..f8e26823075f 100644
> --- a/drivers/platform/x86/think-lmi.h
> +++ b/drivers/platform/x86/think-lmi.h
> @@ -61,6 +61,7 @@ struct think_lmi {
>  	bool can_set_bios_password;
>  	bool can_get_password_settings;
>  	bool pending_changes;
> +	bool can_debug_cmd;
>  
>  	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
>  	struct device *class_dev;
> 

