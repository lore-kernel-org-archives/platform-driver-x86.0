Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B2CC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Nov 2021 11:33:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37F7F61B3A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Nov 2021 11:33:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbhKRLgR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Nov 2021 06:36:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22876 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343926AbhKRLfy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Nov 2021 06:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637235173;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EO6ZFl9QGnTSaGEo1upLQQCeY06q5b3MnRjzgVGJByE=;
        b=aPhNH2bS/MqszRqxjh66Sv573SyzuoqS655oN8ePl7MlQ9cnPFTFw1p7ddv0hiTwSOPJ+s
        +lec1vtFP02Q+V0Lf8DOjNyeNttQ4G37VIrtMP9b96NjYaJPJ5awnKqpjB4+TWRlMzMj0r
        0QJE24SVxB7+htJTn6DCb9YJC5eDNLg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-24-39cAY4XHMWKO6d32ANorPg-1; Thu, 18 Nov 2021 06:32:52 -0500
X-MC-Unique: 39cAY4XHMWKO6d32ANorPg-1
Received: by mail-ed1-f72.google.com with SMTP id w4-20020aa7cb44000000b003e7c0f7cfffso5029636edt.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Nov 2021 03:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EO6ZFl9QGnTSaGEo1upLQQCeY06q5b3MnRjzgVGJByE=;
        b=xPrF4ApB1sLaGh02gUodnUFdGNVw/CypwZMempUVSSzfwIszw++rINnixaxD3l6QHd
         6jqseqKTn4YyaBx+1gcsbdR3vU3R57z9dkbJus/XhDdh1t2qmrmpPn04x3GovBRcUWif
         p4Dg8MxFqHXt6wfpChp01RRFD1RiGtnubbVwFKVOTNiK/ZqpJwfsvj2wp67pB7fa1xCB
         sKN4IDM6mKdVe3cwwGKHD2B+WjwpqNKkKbyPOnPz0SzztmFDw16P0TlLMrdlBYS1T5Vb
         GV7FSxAdQRsypC3Iqton+8w1uKFyUeZC23FnARY1hl7k9dvy1SjtkywVIK06nfSOxXdW
         9V5Q==
X-Gm-Message-State: AOAM532xwsTiWnJs7w6g3w2psdjPQ5SRqiGZk2PNoC1yW4vsECHpqb7g
        gADo5rR3WQp3qvtpaKHytK7Sl0/sG0LyUs/90c4u7HJogMi51h6z970EC52vVewGHDBP3rj9GIZ
        ASJRZZecURr9c75ZW1EwgVGL2ySyFDYRKCw==
X-Received: by 2002:a17:907:1c15:: with SMTP id nc21mr32403859ejc.260.1637235171082;
        Thu, 18 Nov 2021 03:32:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD+p+B8B02gUmm3EmJxJZh31UfqNWZnOZxCVhuJLFJV1V7hkXNWK5HwwNIIPmsTMyBTPCfBA==
X-Received: by 2002:a17:907:1c15:: with SMTP id nc21mr32403783ejc.260.1637235170623;
        Thu, 18 Nov 2021 03:32:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id dy4sm1441170edb.92.2021.11.18.03.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 03:32:50 -0800 (PST)
Message-ID: <d3df51cb-271b-c2b4-0692-2999d0740ad4@redhat.com>
Date:   Thu, 18 Nov 2021 12:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/2] platform/x86: think-lmi: Opcode support
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20211117184453.2476-1-markpearson@lenovo.com>
 <20211117184453.2476-2-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211117184453.2476-2-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,

On 11/17/21 19:44, Mark Pearson wrote:
> Implement Opcode support.
> This is available on ThinkCenter and ThinkStations platforms and
> gives improved password setting capabilities
> 
> Add options to configure System, HDD & NVMe passwords.
> HDD & NVMe passwords need a user level (user/master) along with
> drive index.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
> Changes in v2:
>  - Rebased to latest
>  - Fixed kobject_init implementation for system-mgmt and drive roles
>  - Added is_visible support for level and index attributes

Thank you.

I noticed one small issue, where tlmi_priv.pwd_admin would get
free-ed twice on a goto fail_free_pwd_admin.

I've squashed in the following fix to fix this:

--- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -1152,7 +1152,7 @@ static int tlmi_analyze(void)
 	tlmi_priv.pwd_power = tlmi_create_auth("pop", "power-on");
 	if (!tlmi_priv.pwd_power) {
 		ret = -ENOMEM;
-		goto fail_free_pwd_admin;
+		goto fail_clear_attr;
 	}
 	if (tlmi_priv.pwdcfg.core.password_state & TLMI_POP_PWD)
 		tlmi_priv.pwd_power->valid = true;
@@ -1204,8 +1204,6 @@ static int tlmi_analyze(void)
 	}
 	return 0;
 
-fail_free_pwd_admin:
-	kfree(tlmi_priv.pwd_admin);
 fail_clear_attr:
 	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
 		if (tlmi_priv.setting[i]) {

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

p.s.

I've also noticed 2 small possible cleanups, I will send out
a patch-series for that soon. Can you please give these cleanups
a test-spin (on top of my latest review-hans branch) ?




> 
>  drivers/platform/x86/think-lmi.c | 316 +++++++++++++++++++++++++++----
>  drivers/platform/x86/think-lmi.h |  28 ++-
>  2 files changed, 310 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index c4d9c45350f7..6819bcac7d2e 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -128,8 +128,23 @@ MODULE_PARM_DESC(debug_support, "Enable debug command support");
>   */
>  #define LENOVO_DEBUG_CMD_GUID "7FF47003-3B6C-4E5E-A227-E979824A85D1"
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
> @@ -145,6 +160,10 @@ static const char * const encoding_options[] = {
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
> @@ -233,6 +252,7 @@ static int tlmi_get_pwd_settings(struct tlmi_pwdcfg *pwdcfg)
>  	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>  	const union acpi_object *obj;
>  	acpi_status status;
> +	int copy_size;
>  
>  	if (!tlmi_priv.can_get_password_settings)
>  		return -EOPNOTSUPP;
> @@ -253,14 +273,21 @@ static int tlmi_get_pwd_settings(struct tlmi_pwdcfg *pwdcfg)
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
> @@ -270,6 +297,20 @@ static int tlmi_save_bios_settings(const char *password)
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
> @@ -370,16 +411,54 @@ static ssize_t new_password_store(struct kobject *kobj,
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
> @@ -475,6 +554,75 @@ static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
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
> +static umode_t auth_attr_is_visible(struct kobject *kobj,
> +					     struct attribute *attr, int n)
> +{
> +	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
> +
> +	/*We only want to display level and index settings on HDD/NVMe */
> +	if ((attr == (struct attribute *)&auth_index) ||
> +			(attr == (struct attribute *)&auth_level)) {
> +		if ((setting == tlmi_priv.pwd_hdd) || (setting == tlmi_priv.pwd_nvme))
> +			return attr->mode;
> +		return 0;
> +	}
> +	return attr->mode;
> +}
> +
>  static struct attribute *auth_attrs[] = {
>  	&auth_is_pass_set.attr,
>  	&auth_min_pass_length.attr,
> @@ -485,10 +633,13 @@ static struct attribute *auth_attrs[] = {
>  	&auth_mechanism.attr,
>  	&auth_encoding.attr,
>  	&auth_kbdlang.attr,
> +	&auth_index.attr,
> +	&auth_level.attr,
>  	NULL
>  };
>  
>  static const struct attribute_group auth_attr_group = {
> +	.is_visible = auth_attr_is_visible,
>  	.attrs = auth_attrs,
>  };
>  
> @@ -752,6 +903,16 @@ static void tlmi_release_attr(void)
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
> @@ -831,7 +992,7 @@ static int tlmi_sysfs_init(void)
>  		goto fail_create_attr;
>  
>  	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
> -	ret = kobject_add(&tlmi_priv.pwd_power->kobj, NULL, "%s", "System");
> +	ret = kobject_add(&tlmi_priv.pwd_power->kobj, NULL, "%s", "Power-on");
>  	if (ret)
>  		goto fail_create_attr;
>  
> @@ -839,6 +1000,35 @@ static int tlmi_sysfs_init(void)
>  	if (ret)
>  		goto fail_create_attr;
>  
> +	if (tlmi_priv.opcode_support) {
> +		tlmi_priv.pwd_system->kobj.kset = tlmi_priv.authentication_kset;
> +		ret = kobject_add(&tlmi_priv.pwd_system->kobj, NULL, "%s", "System");
> +		if (ret)
> +			goto fail_create_attr;
> +
> +		ret = sysfs_create_group(&tlmi_priv.pwd_system->kobj, &auth_attr_group);
> +		if (ret)
> +			goto fail_create_attr;
> +
> +		tlmi_priv.pwd_hdd->kobj.kset = tlmi_priv.authentication_kset;
> +		ret = kobject_add(&tlmi_priv.pwd_hdd->kobj, NULL, "%s", "HDD");
> +		if (ret)
> +			goto fail_create_attr;
> +
> +		ret = sysfs_create_group(&tlmi_priv.pwd_hdd->kobj, &auth_attr_group);
> +		if (ret)
> +			goto fail_create_attr;
> +
> +		tlmi_priv.pwd_nvme->kobj.kset = tlmi_priv.authentication_kset;
> +		ret = kobject_add(&tlmi_priv.pwd_nvme->kobj, NULL, "%s", "NVMe");
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
> @@ -851,9 +1041,27 @@ static int tlmi_sysfs_init(void)
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
> @@ -873,6 +1081,9 @@ static int tlmi_analyze(void)
>  	if (wmi_has_guid(LENOVO_DEBUG_CMD_GUID))
>  		tlmi_priv.can_debug_cmd = true;
>  
> +	if (wmi_has_guid(LENOVO_OPCODE_IF_GUID))
> +		tlmi_priv.opcode_support = true;
> +
>  	/*
>  	 * Try to find the number of valid settings of this machine
>  	 * and use it to create sysfs attributes.
> @@ -923,45 +1134,79 @@ static int tlmi_analyze(void)
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
>  	kobject_init(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_setting_ktype);
>  
> -	tlmi_priv.pwd_power = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
> +	tlmi_priv.pwd_power = tlmi_create_auth("pop", "power-on");
>  	if (!tlmi_priv.pwd_power) {
>  		ret = -ENOMEM;
>  		goto fail_free_pwd_admin;
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
>  	kobject_init(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype);
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
> +		kobject_init(&tlmi_priv.pwd_system->kobj, &tlmi_pwd_setting_ktype);
> +
> +		tlmi_priv.pwd_hdd = tlmi_create_auth("hdd", "hdd");
> +		if (!tlmi_priv.pwd_hdd) {
> +			ret = -ENOMEM;
> +			goto fail_clear_attr;
> +		}
> +		kobject_init(&tlmi_priv.pwd_hdd->kobj, &tlmi_pwd_setting_ktype);
> +
> +		tlmi_priv.pwd_nvme = tlmi_create_auth("nvm", "nvme");
> +		if (!tlmi_priv.pwd_nvme) {
> +			ret = -ENOMEM;
> +			goto fail_clear_attr;
> +		}
> +		kobject_init(&tlmi_priv.pwd_nvme->kobj, &tlmi_pwd_setting_ktype);
> +
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
>  fail_free_pwd_admin:
> @@ -973,6 +1218,11 @@ static int tlmi_analyze(void)
>  			kfree(tlmi_priv.setting[i]);
>  		}
>  	}
> +	kfree(tlmi_priv.pwd_admin);
> +	kfree(tlmi_priv.pwd_power);
> +	kfree(tlmi_priv.pwd_system);
> +	kfree(tlmi_priv.pwd_hdd);
> +	kfree(tlmi_priv.pwd_nvme);
>  	return ret;
>  }
>  
> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
> index 2ce5086a5af2..e46c7f383353 100644
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
> @@ -61,13 +81,19 @@ struct think_lmi {
>  	bool can_get_password_settings;
>  	bool pending_changes;
>  	bool can_debug_cmd;
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

