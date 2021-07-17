Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A157C636C9
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 13:59:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 506106115A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 13:59:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbhGQOCP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Jul 2021 10:02:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35832 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232893AbhGQOCP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Jul 2021 10:02:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626530357;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/GNLiyOg23ZxAwNPLXtElxUr2x6Vn31rbUyJCdwXjHE=;
        b=eLtf+C7JMnHBt8/XeyYLYWhV2PhYtgsykKT0O+s8N76pKJJIk7kbJA7IqGManX+Avue2dY
        NOmXEKhQ6yE6NRSTinKYYbpU7wJp94d5YjEhaGQgiWFsPXy8MkVvHco60Ta9kJOFBkbte6
        851HmnTthlwBSl1MC/3LkSlnDkb5GBQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-9rubic7HM1KD67faRKIQQw-1; Sat, 17 Jul 2021 09:59:15 -0400
X-MC-Unique: 9rubic7HM1KD67faRKIQQw-1
Received: by mail-ed1-f72.google.com with SMTP id r23-20020aa7d5970000b02903ae404e7fb4so4387419edq.12
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jul 2021 06:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/GNLiyOg23ZxAwNPLXtElxUr2x6Vn31rbUyJCdwXjHE=;
        b=V0ArySYpFoyu0zKPqSDatATyRmeCmuesv1H3y3RQDqyjjP66e3lwaATI1UZIqTec/e
         CAGDJwbE3GGFFHfWGxiHfhyi2mWJpgoI9LMXI9Mo9Nmk9O65Jmu7qJ8wRPbt4fmH+cHq
         Zcu3yo7vp6DK7xSPkHzVZXVll9h+R1wOiDxouzb0EdJbYtA6QgGRl2sjZyRkCiLlw9Vw
         JLSzRnxiDFHsKKY5QTWNRBpVilkH+LZ1HIoI/SCgdY1ibXz6xlPBoZQUXky3rRJQqmJ4
         M1Yl419gR0bY1JU0QUiUkmDUOdpVn7P0wjFzwBXn4qNArrwCuZO1HIFfD70tE8Fhvjde
         h1IA==
X-Gm-Message-State: AOAM533wAt2mBtQCivj6oCQny+j/cV5C2AuqJNpaknqWcNLrnMAk2BHb
        NUgTUvShLTr4bxfEPjtCI0GJN/VsicVZ9+mjaaggJ7van9SBYs1cbbmHbXklcz1QoN/CGxKnvdt
        BAhHJZc4mGk8nIOhYr8huj24a8EcCtIBYS5ihD8+n6I4J9Z3aVktXFarqSzwDYC6luFuOsBiA4F
        YWvpR2V1yOBA==
X-Received: by 2002:a50:ee15:: with SMTP id g21mr21847883eds.334.1626530354350;
        Sat, 17 Jul 2021 06:59:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuTZc35EnAH5Tu9Mr0eMBN5kiubZjghJwW67T1XGJymbjKPY/bAj7+UAbmDpJzB4sedTcUUA==
X-Received: by 2002:a50:ee15:: with SMTP id g21mr21847864eds.334.1626530354099;
        Sat, 17 Jul 2021 06:59:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k21sm3901239ejj.55.2021.07.17.06.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 06:59:13 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: think-lmi: add debug_cmd
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20210715230850.389961-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4e59c26c-d58b-dfd5-ed21-f9cd83fc43b6@redhat.com>
Date:   Sat, 17 Jul 2021 15:59:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715230850.389961-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 7/16/21 1:08 AM, Mark Pearson wrote:
> Many Lenovo BIOS's support the ability to send a debug command which
> is useful for debugging and testing unreleased or early features.
> Adding support for this feature.
> 
> Also moved the pending_reboot node under attributes dir where it should
> correctly live. Got that wrong in my last commit and realised as I was
> updating the documentation for debug_cmd
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

Thank you for the patch, I'm not entirely sure if we want this in its
current form though, isn't this new debug_cmd file not something which
would be better under debugfs ?  Or maybe have it only show up if
a module parameter is passed to enable it ?

Note that both have implications wrt secureboot. debugfs is only
writeable when secureboot is disabled; and ATM module options are
not protected by secureboot, but at least in Fedora we would actually
like to change that in the future.

Anyways, lets discuss this a bit further and then merge something
for this later.

The pending_reboot move is good to have. You really should have
submitted this as a separate patch. Hint as soon as you write
"Also ...", or e.g. "This commit does the following 3 things:
1... 2... 3..." or some such in the commit message that is a hint
that you should split the patch.

I've split out the pending_reboot changes (and also updated the
remove path which you left unchanged) now. While looking into
the remove path, I also found a couple of other probe-failure
related issues so I'll be sending out a patch-set with a
few small fixes (including the pending_reboot move) soon.

Regards,

Hans





> ---
>  .../testing/sysfs-class-firmware-attributes   | 11 +++
>  drivers/platform/x86/think-lmi.c              | 77 ++++++++++++++++++-
>  drivers/platform/x86/think-lmi.h              |  1 +
>  3 files changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 3348bf80a37c..db0aa2939efc 100644
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
> index 64dcec53a7a0..d58d4b155139 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -116,6 +116,14 @@
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
> @@ -660,6 +668,63 @@ static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *
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
> +static struct kobj_attribute debug_cmd = __ATTR_WO(debug_cmd);
> +
>  /* ---- Initialisation --------------------------------------------------------- */
>  static void tlmi_release_attr(void)
>  {
> @@ -681,6 +746,8 @@ static void tlmi_release_attr(void)
>  	kobject_put(&tlmi_priv.pwd_power->kobj);
>  	kset_unregister(tlmi_priv.authentication_kset);
>  	sysfs_remove_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
> +	if (tlmi_priv.can_debug_cmd)
> +		sysfs_remove_file(&tlmi_priv.class_dev->kobj, &debug_cmd.attr);
>  }
>  
>  static int tlmi_sysfs_init(void)
> @@ -761,10 +828,15 @@ static int tlmi_sysfs_init(void)
>  		goto fail_create_attr;
>  
>  	/* Create global sysfs files */
> -	ret = sysfs_create_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
> +	ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &pending_reboot.attr);
>  	if (ret)
>  		goto fail_create_attr;
>  
> +	if (tlmi_priv.can_debug_cmd) {
> +		ret = sysfs_create_file(&tlmi_priv.attribute_kset->kobj, &debug_cmd.attr);
> +		if (ret)
> +			goto fail_create_attr;
> +	}
>  	return ret;
>  
>  fail_create_attr:
> @@ -796,6 +868,9 @@ static int tlmi_analyze(void)
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

