Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A27C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 14:07:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCE8760F9C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 14:07:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237001AbhKPOKm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 09:10:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37907 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237032AbhKPOKk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 09:10:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637071663;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o1ND2Qw5ShhI5qAPefo2flcD3s1WNCjoQ9JxBqs0M1c=;
        b=Tkan1I8J+yn+JiE9WXDIBoj6rW7Cb3LT5+P9OxfnEJGzZib1OtjTL4tosMWu8wK6dHAbxW
        r+HmVvVL1I/roIl5ttTG3pgInjLk3QgOeEJcf6kw/ePkJjPdnl62rhC5gYjD9plBHQNC7S
        SbGsvRlzJP0LvJy+yNhGp+ZxcGkmGk0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-4ezf1y6DM0iyxn5T3OGrUQ-1; Tue, 16 Nov 2021 09:07:42 -0500
X-MC-Unique: 4ezf1y6DM0iyxn5T3OGrUQ-1
Received: by mail-ed1-f70.google.com with SMTP id v9-20020a50d849000000b003dcb31eabaaso17345250edj.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Nov 2021 06:07:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o1ND2Qw5ShhI5qAPefo2flcD3s1WNCjoQ9JxBqs0M1c=;
        b=PHH5VzyR28tWGtq5F2pQAVmi+7pdQrxIZZAa76S7pcyLOI62uyIABRn69irFt1ON8O
         4T+Ahy38tjQXEpqYz7m2yZ0yuvGiM57V8IMGfA66rg/2nrCyiqC1apxqrkwNpfKrRLUJ
         5GzHMjXKn+LnOKsn5x1T+ZNKphd7Y5++SyC4RX0jvg70+yuCdQtVigZJV7zF1L5jOJag
         u8me8V69hegPKDJkx4FGBxtfcr/weBTfcEljOM11y2RBuZ7timt1WxVxfSzfkQZXVEfb
         uO+JiF8brL+0ARG2OySauOywaOp72PzsyFuSjlTAahFcSyrQf1Zncj51Dy9BuYGlojIm
         XEFA==
X-Gm-Message-State: AOAM532/05KFlyROwbbIyX2Ownnotl54497VXMekMCO1Kqo5bg89jmWg
        6PKGUZVB+hwWFeFS/oBLzQGxQ2vKec8zl++WWSJP6fMlgEyr94XTkLw3SYUdYIiF5NAZ+JyA7il
        ZT/U+PmcSHiM1UTsagB1F1Wxumt1cGgorPg==
X-Received: by 2002:a50:da42:: with SMTP id a2mr10121155edk.361.1637071661072;
        Tue, 16 Nov 2021 06:07:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyz5QIiQkYagXbzbQw2G/aA8o+wQ+7r48kDrUrfP2W/0iqrjEr3o13mtRYJ2HjkbPgwHaOKrA==
X-Received: by 2002:a50:da42:: with SMTP id a2mr10121030edk.361.1637071660108;
        Tue, 16 Nov 2021 06:07:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h10sm9436491edk.41.2021.11.16.06.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 06:07:39 -0800 (PST)
Message-ID: <0ab21b8d-0b15-e963-fb36-d3026765f757@redhat.com>
Date:   Tue, 16 Nov 2021 15:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] platform/x86: think-lmi: Opcode support
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20211108232533.211693-1-markpearson@lenovo.com>
 <20211108232533.211693-2-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211108232533.211693-2-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 11/9/21 00:25, Mark Pearson wrote:
> Implement Opcode support.
> This is available on ThinkCenter and ThinkStations platforms and
> gives improved password setting capabilities
> 
> Add options to configure System, HDD & NVMe passwords.
> HDD & NVMe passwords need a user level (user/master) along with
> drive index.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

The change you are making to tlmi_probe() is already in my
review-hans branch and the line numbers also do not seem to
match in various places, please rebase this for v2.

I also have some remarks inline.

> ---
>  drivers/platform/x86/think-lmi.c | 303 +++++++++++++++++++++++++++----
>  drivers/platform/x86/think-lmi.h |  28 ++-
>  2 files changed, 296 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 3671b5d20613..04810c5ced93 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -116,8 +116,23 @@
>   */
>  #define LENOVO_GET_BIOS_SELECTIONS_GUID	"7364651A-132F-4FE7-ADAA-40C6C7EE2E3B"
>  
> +/*
> + * Name:
> + *  Lenovo_OpcodeIF
> + * Description:
> + *  Opcode interface which provides the ability to set multiple
> + *  parameters and then trigger an action with a final command.
> + *  This is particularly useful for simplifying setting passwords.
> + *  With this support comes the ability to set System, HDD and NVMe
> + *  passwords.
> + *  This is currently available on ThinkCenter and ThinkStations platforms
> + */
> +#define LENOVO_OPCODE_IF_GUID "DFDDEF2C-57D4-48ce-B196-0FB787D90836"
> +
>  #define TLMI_POP_PWD (1 << 0)
>  #define TLMI_PAP_PWD (1 << 1)
> +#define TLMI_HDD_PWD (1 << 2)
> +#define TLMI_SYS_PWD (1 << 3)
>  #define to_tlmi_pwd_setting(kobj)  container_of(kobj, struct tlmi_pwd_setting, kobj)
>  #define to_tlmi_attr_setting(kobj)  container_of(kobj, struct tlmi_attr_setting, kobj)
>  
> @@ -133,6 +148,10 @@ static const char * const encoding_options[] = {
>  	[TLMI_ENCODING_ASCII] = "ascii",
>  	[TLMI_ENCODING_SCANCODE] = "scancode",
>  };
> +static const char * const level_options[] = {
> +	[TLMI_LEVEL_USER] = "user",
> +	[TLMI_LEVEL_MASTER] = "master",
> +};
>  static struct think_lmi tlmi_priv;
>  static struct class *fw_attr_class;
>  
> @@ -221,6 +240,7 @@ static int tlmi_get_pwd_settings(struct tlmi_pwdcfg *pwdcfg)
>  	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>  	const union acpi_object *obj;
>  	acpi_status status;
> +	int copy_size;
>  
>  	if (!tlmi_priv.can_get_password_settings)
>  		return -EOPNOTSUPP;
> @@ -241,14 +261,21 @@ static int tlmi_get_pwd_settings(struct tlmi_pwdcfg *pwdcfg)
>  	 * The size of thinkpad_wmi_pcfg on ThinkStation is larger than ThinkPad.
>  	 * To make the driver compatible on different brands, we permit it to get
>  	 * the data in below case.
> +	 * Settings must have at minimum the core fields available
>  	 */
> -	if (obj->buffer.length < sizeof(struct tlmi_pwdcfg)) {
> +	if (obj->buffer.length < sizeof(struct tlmi_pwdcfg_core)) {
>  		pr_warn("Unknown pwdcfg buffer length %d\n", obj->buffer.length);
>  		kfree(obj);
>  		return -EIO;
>  	}
> -	memcpy(pwdcfg, obj->buffer.pointer, sizeof(struct tlmi_pwdcfg));
> +
> +	copy_size = obj->buffer.length < sizeof(struct tlmi_pwdcfg) ?
> +		obj->buffer.length : sizeof(struct tlmi_pwdcfg);
> +	memcpy(pwdcfg, obj->buffer.pointer, copy_size);
>  	kfree(obj);
> +
> +	if (WARN_ON(pwdcfg->core.max_length >= TLMI_PWD_BUFSIZE))
> +		pwdcfg->core.max_length = TLMI_PWD_BUFSIZE - 1;
>  	return 0;
>  }
>  
> @@ -258,6 +285,20 @@ static int tlmi_save_bios_settings(const char *password)
>  				password);
>  }
>  
> +static int tlmi_opcode_setting(char *setting, const char *value)
> +{
> +	char *opcode_str;
> +	int ret;
> +
> +	opcode_str = kasprintf(GFP_KERNEL, "%s:%s;", setting, value);
> +	if (!opcode_str)
> +		return -ENOMEM;
> +
> +	ret = tlmi_simple_call(LENOVO_OPCODE_IF_GUID, opcode_str);
> +	kfree(opcode_str);
> +	return ret;
> +}
> +
>  static int tlmi_setting(int item, char **value, const char *guid_string)
>  {
>  	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> @@ -358,16 +399,54 @@ static ssize_t new_password_store(struct kobject *kobj,
>  		goto out;
>  	}
>  
> -	/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
> -	auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s,%s,%s;",
> -		 setting->pwd_type, setting->password, new_pwd,
> -		 encoding_options[setting->encoding], setting->kbdlang);
> -	if (!auth_str) {
> -		ret = -ENOMEM;
> -		goto out;
> +	/* If opcode support is present use that interface */
> +	if (tlmi_priv.opcode_support) {
> +		char pwd_type[8];
> +
> +		/* Special handling required for HDD and NVMe passwords */
> +		if (setting == tlmi_priv.pwd_hdd) {
> +			if (setting->level == TLMI_LEVEL_USER)
> +				sprintf(pwd_type, "uhdp%d", setting->index);
> +			else
> +				sprintf(pwd_type, "mhdp%d", setting->index);
> +		} else if (setting == tlmi_priv.pwd_nvme) {
> +			if (setting->level == TLMI_LEVEL_USER)
> +				sprintf(pwd_type, "unvp%d", setting->index);
> +			else
> +				sprintf(pwd_type, "mnvp%d", setting->index);
> +		} else {
> +			sprintf(pwd_type, "%s", setting->pwd_type);
> +		}
> +
> +		ret = tlmi_opcode_setting("WmiOpcodePasswordType", pwd_type);
> +		if (ret)
> +			goto out;
> +
> +		if (tlmi_priv.pwd_admin->valid) {
> +			ret = tlmi_opcode_setting("WmiOpcodePasswordAdmin",
> +					tlmi_priv.pwd_admin->password);
> +			if (ret)
> +				goto out;
> +		}
> +		ret = tlmi_opcode_setting("WmiOpcodePasswordCurrent01", setting->password);
> +		if (ret)
> +			goto out;
> +		ret = tlmi_opcode_setting("WmiOpcodePasswordNew01", new_pwd);
> +		if (ret)
> +			goto out;
> +		ret = tlmi_simple_call(LENOVO_OPCODE_IF_GUID, "WmiOpcodePasswordSetUpdate;");
> +	} else {
> +		/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
> +		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s,%s,%s;",
> +				setting->pwd_type, setting->password, new_pwd,
> +				encoding_options[setting->encoding], setting->kbdlang);
> +		if (!auth_str) {
> +			ret = -ENOMEM;
> +			goto out;
> +		}
> +		ret = tlmi_simple_call(LENOVO_SET_BIOS_PASSWORD_GUID, auth_str);
> +		kfree(auth_str);
>  	}
> -	ret = tlmi_simple_call(LENOVO_SET_BIOS_PASSWORD_GUID, auth_str);
> -	kfree(auth_str);
>  out:
>  	kfree(new_pwd);
>  	return ret ?: count;
> @@ -463,6 +542,60 @@ static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
>  }
>  static struct kobj_attribute auth_role = __ATTR_RO(role);
>  
> +static ssize_t index_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +
> +	return sysfs_emit(buf, "%d\n", setting->index);
> +}
> +
> +static ssize_t index_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +	int err, val;
> +
> +	err = kstrtoint(buf, 10, &val);
> +	if (err < 0)
> +		return err;
> +
> +	if (val > TLMI_INDEX_MAX)
> +		return -EINVAL;
> +
> +	setting->index = val;
> +	return count;
> +}
> +
> +static struct kobj_attribute auth_index = __ATTR_RW(index);
> +
> +static ssize_t level_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +
> +	return sysfs_emit(buf, "%s\n", level_options[setting->level]);
> +}
> +
> +static ssize_t level_store(struct kobject *kobj,
> +				  struct kobj_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +	int i;
> +
> +	/* Scan for a matching profile */
> +	i = sysfs_match_string(level_options, buf);
> +	if (i < 0)
> +		return -EINVAL;
> +
> +	setting->level = i;
> +	return count;
> +}
> +
> +static struct kobj_attribute auth_level = __ATTR_RW(level);
> +
>  static struct attribute *auth_attrs[] = {
>  	&auth_is_pass_set.attr,
>  	&auth_min_pass_length.attr,
> @@ -473,6 +606,8 @@ static struct attribute *auth_attrs[] = {
>  	&auth_mechanism.attr,
>  	&auth_encoding.attr,
>  	&auth_kbdlang.attr,
> +	&auth_index.attr,
> +	&auth_level.attr,

This will add the index and level attr to all auth dirs,
but they should only be added to the NVMe and HDD dirs,
right ?

Please add an is_visible callback (see recent thinkpad_acpi changes)
and hide these for the other auth dirs.

>  	NULL
>  };
>  
> @@ -666,6 +801,16 @@ static void tlmi_release_attr(void)
>  	kobject_put(&tlmi_priv.pwd_admin->kobj);
>  	sysfs_remove_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
>  	kobject_put(&tlmi_priv.pwd_power->kobj);
> +
> +	if (tlmi_priv.opcode_support) {
> +		sysfs_remove_group(&tlmi_priv.pwd_system->kobj, &auth_attr_group);
> +		kobject_put(&tlmi_priv.pwd_system->kobj);
> +		sysfs_remove_group(&tlmi_priv.pwd_hdd->kobj, &auth_attr_group);
> +		kobject_put(&tlmi_priv.pwd_hdd->kobj);
> +		sysfs_remove_group(&tlmi_priv.pwd_nvme->kobj, &auth_attr_group);
> +		kobject_put(&tlmi_priv.pwd_nvme->kobj);
> +	}
> +
>  	kset_unregister(tlmi_priv.authentication_kset);
>  }
>  
> @@ -738,7 +883,7 @@ static int tlmi_sysfs_init(void)
>  
>  	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
>  	ret = kobject_init_and_add(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype,
> -			NULL, "%s", "System");
> +			NULL, "%s", "Power-on");
>  	if (ret)
>  		goto fail_create_attr;
>  
> @@ -746,6 +891,38 @@ static int tlmi_sysfs_init(void)
>  	if (ret)
>  		goto fail_create_attr;
>  
> +	if (tlmi_priv.opcode_support) {
> +		tlmi_priv.pwd_system->kobj.kset = tlmi_priv.authentication_kset;
> +		ret = kobject_init_and_add(&tlmi_priv.pwd_system->kobj, &tlmi_pwd_setting_ktype,
> +				NULL, "%s", "System");
> +		if (ret)
> +			goto fail_create_attr;
> +
> +		ret = sysfs_create_group(&tlmi_priv.pwd_system->kobj, &auth_attr_group);
> +		if (ret)
> +			goto fail_create_attr;
> +
> +		tlmi_priv.pwd_hdd->kobj.kset = tlmi_priv.authentication_kset;
> +		ret = kobject_init_and_add(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype,
> +				NULL, "%s", "HDD");
> +		if (ret)
> +			goto fail_create_attr;
> +
> +		ret = sysfs_create_group(&tlmi_priv.pwd_hdd->kobj, &auth_attr_group);
> +		if (ret)
> +			goto fail_create_attr;
> +
> +		tlmi_priv.pwd_nvme->kobj.kset = tlmi_priv.authentication_kset;
> +		ret = kobject_init_and_add(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_setting_ktype,
> +				NULL, "%s", "NVMe");
> +		if (ret)
> +			goto fail_create_attr;
> +
> +		ret = sysfs_create_group(&tlmi_priv.pwd_nvme->kobj, &auth_attr_group);
> +		if (ret)
> +			goto fail_create_attr;
> +	}
> +
>  	return ret;
>  
>  fail_create_attr:
> @@ -758,9 +935,27 @@ static int tlmi_sysfs_init(void)
>  }
>  
>  /* ---- Base Driver -------------------------------------------------------- */
> +static struct tlmi_pwd_setting *tlmi_create_auth(const char *pwd_type,
> +			    const char *pwd_role)
> +{
> +	struct tlmi_pwd_setting *new_pwd;
> +
> +	new_pwd = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
> +	if (!new_pwd)
> +		return NULL;
> +
> +	strscpy(new_pwd->kbdlang, "us", TLMI_LANG_MAXLEN);
> +	new_pwd->encoding = TLMI_ENCODING_ASCII;
> +	new_pwd->pwd_type = pwd_type;
> +	new_pwd->role = pwd_role;
> +	new_pwd->minlen = tlmi_priv.pwdcfg.core.min_length;
> +	new_pwd->maxlen = tlmi_priv.pwdcfg.core.max_length;
> +	new_pwd->index = 0;
> +	return new_pwd;
> +}
> +
>  static int tlmi_analyze(void)
>  {
> -	struct tlmi_pwdcfg pwdcfg;
>  	acpi_status status;
>  	int i, ret;
>  
> @@ -777,6 +972,9 @@ static int tlmi_analyze(void)
>  	if (wmi_has_guid(LENOVO_BIOS_PASSWORD_SETTINGS_GUID))
>  		tlmi_priv.can_get_password_settings = true;
>  
> +	if (wmi_has_guid(LENOVO_OPCODE_IF_GUID))
> +		tlmi_priv.opcode_support = true;
> +
>  	/*
>  	 * Try to find the number of valid settings of this machine
>  	 * and use it to create sysfs attributes.
> @@ -824,46 +1022,79 @@ static int tlmi_analyze(void)
>  	}
>  
>  	/* Create password setting structure */
> -	ret = tlmi_get_pwd_settings(&pwdcfg);
> +	ret = tlmi_get_pwd_settings(&tlmi_priv.pwdcfg);
>  	if (ret)
>  		goto fail_clear_attr;
>  
> -	tlmi_priv.pwd_admin = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
> +	tlmi_priv.pwd_admin = tlmi_create_auth("pap", "bios-admin");
>  	if (!tlmi_priv.pwd_admin) {
>  		ret = -ENOMEM;
>  		goto fail_clear_attr;
>  	}
> -	strscpy(tlmi_priv.pwd_admin->kbdlang, "us", TLMI_LANG_MAXLEN);
> -	tlmi_priv.pwd_admin->encoding = TLMI_ENCODING_ASCII;
> -	tlmi_priv.pwd_admin->pwd_type = "pap";
> -	tlmi_priv.pwd_admin->role = "bios-admin";
> -	tlmi_priv.pwd_admin->minlen = pwdcfg.min_length;
> -	if (WARN_ON(pwdcfg.max_length >= TLMI_PWD_BUFSIZE))
> -		pwdcfg.max_length = TLMI_PWD_BUFSIZE - 1;
> -	tlmi_priv.pwd_admin->maxlen = pwdcfg.max_length;
> -	if (pwdcfg.password_state & TLMI_PAP_PWD)
> +	if (tlmi_priv.pwdcfg.core.password_state & TLMI_PAP_PWD)
>  		tlmi_priv.pwd_admin->valid = true;
>  
> -	tlmi_priv.pwd_power = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
> +	tlmi_priv.pwd_power = tlmi_create_auth("pop", "power-on");
>  	if (!tlmi_priv.pwd_power) {
>  		ret = -ENOMEM;
>  		goto fail_clear_attr;
>  	}
> -	strscpy(tlmi_priv.pwd_power->kbdlang, "us", TLMI_LANG_MAXLEN);
> -	tlmi_priv.pwd_power->encoding = TLMI_ENCODING_ASCII;
> -	tlmi_priv.pwd_power->pwd_type = "pop";
> -	tlmi_priv.pwd_power->role = "power-on";
> -	tlmi_priv.pwd_power->minlen = pwdcfg.min_length;
> -	tlmi_priv.pwd_power->maxlen = pwdcfg.max_length;
> -
> -	if (pwdcfg.password_state & TLMI_POP_PWD)
> +	if (tlmi_priv.pwdcfg.core.password_state & TLMI_POP_PWD)
>  		tlmi_priv.pwd_power->valid = true;
>  
> +	if (tlmi_priv.opcode_support) {
> +		tlmi_priv.pwd_system = tlmi_create_auth("sys", "system");
> +		if (!tlmi_priv.pwd_system) {
> +			ret = -ENOMEM;
> +			goto fail_clear_attr;
> +		}
> +		if (tlmi_priv.pwdcfg.core.password_state & TLMI_SYS_PWD)
> +			tlmi_priv.pwd_system->valid = true;
> +
> +		tlmi_priv.pwd_hdd = tlmi_create_auth("hdd", "hdd");
> +		if (!tlmi_priv.pwd_hdd) {
> +			ret = -ENOMEM;
> +			goto fail_clear_attr;
> +		}
> +		tlmi_priv.pwd_nvme = tlmi_create_auth("nvm", "nvme");
> +		if (!tlmi_priv.pwd_nvme) {
> +			ret = -ENOMEM;
> +			goto fail_clear_attr;
> +		}
> +		if (tlmi_priv.pwdcfg.core.password_state & TLMI_HDD_PWD) {
> +			/* Check if PWD is configured and set index to first drive found */
> +			if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
> +					tlmi_priv.pwdcfg.ext.hdd_master_password) {
> +				tlmi_priv.pwd_hdd->valid = true;
> +				if (tlmi_priv.pwdcfg.ext.hdd_master_password)
> +					tlmi_priv.pwd_hdd->index =
> +						ffs(tlmi_priv.pwdcfg.ext.hdd_master_password) - 1;
> +				else
> +					tlmi_priv.pwd_hdd->index =
> +						ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
> +			}
> +			if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
> +					tlmi_priv.pwdcfg.ext.nvme_master_password) {
> +				tlmi_priv.pwd_nvme->valid = true;
> +				if (tlmi_priv.pwdcfg.ext.nvme_master_password)
> +					tlmi_priv.pwd_nvme->index =
> +						ffs(tlmi_priv.pwdcfg.ext.nvme_master_password) - 1;
> +				else
> +					tlmi_priv.pwd_nvme->index =
> +						ffs(tlmi_priv.pwdcfg.ext.nvme_user_password) - 1;
> +			}
> +		}
> +	}
>  	return 0;
>  
>  fail_clear_attr:
>  	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i)
>  		kfree(tlmi_priv.setting[i]);
> +	kfree(tlmi_priv.pwd_admin);
> +	kfree(tlmi_priv.pwd_power);
> +	kfree(tlmi_priv.pwd_system);
> +	kfree(tlmi_priv.pwd_hdd);
> +	kfree(tlmi_priv.pwd_nvme);
>  	return ret;
>  }
>  
> @@ -876,7 +1107,11 @@ static void tlmi_remove(struct wmi_device *wdev)
>  
>  static int tlmi_probe(struct wmi_device *wdev, const void *context)
>  {
> -	tlmi_analyze();
> +	int ret;
> +
> +	ret = tlmi_analyze();
> +	if (ret)
> +		return ret;
>  	return tlmi_sysfs_init();
>  }
>  
> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
> index 6fa8da7af6c7..23da32b92836 100644
> --- a/drivers/platform/x86/think-lmi.h
> +++ b/drivers/platform/x86/think-lmi.h
> @@ -9,6 +9,7 @@
>  #define TLMI_SETTINGS_MAXLEN 512
>  #define TLMI_PWD_BUFSIZE     129
>  #define TLMI_LANG_MAXLEN       4
> +#define TLMI_INDEX_MAX        32
>  
>  /* Possible error values */
>  struct tlmi_err_codes {
> @@ -21,8 +22,13 @@ enum encoding_option {
>  	TLMI_ENCODING_SCANCODE,
>  };
>  
> +enum level_option {
> +	TLMI_LEVEL_USER,
> +	TLMI_LEVEL_MASTER,
> +};
> +
>  /* password configuration details */
> -struct tlmi_pwdcfg {
> +struct tlmi_pwdcfg_core {
>  	uint32_t password_mode;
>  	uint32_t password_state;
>  	uint32_t min_length;
> @@ -31,6 +37,18 @@ struct tlmi_pwdcfg {
>  	uint32_t supported_keyboard;
>  };
>  
> +struct tlmi_pwdcfg_ext {
> +	uint32_t hdd_user_password;
> +	uint32_t hdd_master_password;
> +	uint32_t nvme_user_password;
> +	uint32_t nvme_master_password;
> +};
> +
> +struct tlmi_pwdcfg {
> +	struct tlmi_pwdcfg_core core;
> +	struct tlmi_pwdcfg_ext ext;
> +};
> +
>  /* password setting details */
>  struct tlmi_pwd_setting {
>  	struct kobject kobj;
> @@ -42,6 +60,8 @@ struct tlmi_pwd_setting {
>  	int maxlen;
>  	enum encoding_option encoding;
>  	char kbdlang[TLMI_LANG_MAXLEN];
> +	int index; /*Used for HDD and NVME auth */
> +	enum level_option level;
>  };
>  
>  /* Attribute setting details */
> @@ -60,13 +80,19 @@ struct think_lmi {
>  	bool can_get_bios_selections;
>  	bool can_set_bios_password;
>  	bool can_get_password_settings;
> +	bool opcode_support;
>  
>  	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
>  	struct device *class_dev;
>  	struct kset *attribute_kset;
>  	struct kset *authentication_kset;
> +
> +	struct tlmi_pwdcfg pwdcfg;
>  	struct tlmi_pwd_setting *pwd_admin;
>  	struct tlmi_pwd_setting *pwd_power;
> +	struct tlmi_pwd_setting *pwd_system;
> +	struct tlmi_pwd_setting *pwd_hdd;
> +	struct tlmi_pwd_setting *pwd_nvme;
>  };
>  
>  #endif /* !_THINK_LMI_H_ */
> 

Except for the one remark and the need to renase this 
looks good overall, thank you.

Regards,

Hans

