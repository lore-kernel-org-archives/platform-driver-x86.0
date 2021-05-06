Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABD0C433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 May 2021 16:02:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA1EC61078
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 May 2021 16:02:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235156AbhEFQD0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 May 2021 12:03:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22627 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235382AbhEFQD0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 May 2021 12:03:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620316947;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1skXM8Wc3gEkYzSAijtfyi1iFqQzdL1ugyKqj8/WjrE=;
        b=Adb+gH+aW1ArHz6o9Q0C2EsmYZh22Brpv0Vl19g1RoKiTMFcsDHgYMnJ7Dq/g6Ah8NdVcQ
        coVb+Z87hXObr8GApuaeAuU6w0ayRxGXdn8/iJIzyUZhIhhX1MlcE07f+CRIWzlsQhmram
        oHRhVC7Lzt019DKmEqYd1aTJ/PJ8858=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-rDOaeTGcPeaNMVO9a6RuQQ-1; Thu, 06 May 2021 12:02:25 -0400
X-MC-Unique: rDOaeTGcPeaNMVO9a6RuQQ-1
Received: by mail-ej1-f71.google.com with SMTP id f8-20020a1709068248b02903a8adf1f5c2so813031ejx.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 May 2021 09:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1skXM8Wc3gEkYzSAijtfyi1iFqQzdL1ugyKqj8/WjrE=;
        b=iwr9eRu6F+GexVhiYuArJ8DY9LMIqb/yYgT69tWelMe2iwKCwrUZZJwZ+Am6JpYrzJ
         y4UBMc1p/wkj4Dom9h8j9+5AOgYbxutJltjcZGN38IqmpO61tyNvEBXrP5Zlix8Z7hTA
         CHDXSI7BBjyZhhNGKb9Q8AU0N1J1cs3FXLDdMRNuCYoiQeyq+58djZcWm4AFHCKwAFns
         UQz03md0XJe4VIFMK+LWE5Z9r99jWVZ5ThcWakbtRw17+xehAt5/Y12AsW3lZmTUrIco
         45KnDjO4bDwfzai0rI3x0EVcY21xcRDJMbutAV42QVU84M9XDrNOw7xbv/FwgcwHV57g
         blKg==
X-Gm-Message-State: AOAM533H5zGfDVFsCdI52XGvB07xeOvudoIM7FLApEIJtsadZirxqsCe
        M332ycyky4s+4KOTYpx0vpBxzH+D8fSAeok8JKN/7YICHvG0QKO/FGuzTxHBMhb0iXJDzhwOycD
        E3EJe9LEQbp7qwHlf0lsn9kcf31RCaSJEVw==
X-Received: by 2002:a17:906:8588:: with SMTP id v8mr5290137ejx.550.1620316944313;
        Thu, 06 May 2021 09:02:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCXBBMJY5yVREN3ZQCcRXjN4NHphVXRpJpkDhNxhm+k0Fr00rahTyU7BHYd4yF0SzKQSO6xw==
X-Received: by 2002:a17:906:8588:: with SMTP id v8mr5290104ejx.550.1620316944027;
        Thu, 06 May 2021 09:02:24 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u1sm2033880edv.90.2021.05.06.09.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 May 2021 09:02:23 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: think-lmi: Add WMI interface support on
 Lenovo platforms
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        slacshiminar@lenovo.com
References: <markpearson@lenovo.com>
 <20210425150831.34612-1-markpearson@lenovo.com>
 <f1520c5f-858e-a231-a69f-d0e2848ef5e1@redhat.com>
Message-ID: <95d23351-5d15-0599-42a5-11f1618d5cac@redhat.com>
Date:   Thu, 6 May 2021 18:02:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f1520c5f-858e-a231-a69f-d0e2848ef5e1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/6/21 5:44 PM, Hans de Goede wrote:

<snip>

>> +static void attr_name_release(struct kobject *kobj)
>> +{
>> +	kfree(kobj);
>> +}
> 
> If we switch to embedding the kobjects then we no longer need this
> function, the memory will be free-ed when we free the encapsultating
> structures instead.

I just realized that I got this wrong, we still want the release,
but we want the release to free the tlmi_pwd_setting resp. the
tlmi_attr_setting struct embedding the kobj instead
(requiring 2 release functions and 2 separate ktypes).

These kfree-s in the release functions will then replace the kfree-s
done from tlmi_release_attr().

This will ensure that the kobject stays around if userspace has
a file-handle pointing to it when the driver is unbound (this
will delay the calling of release till userspace closes the handle).

Regards,

Hans


>> +
>> +static struct kobj_type attr_name_ktype = {
>> +	.release	= attr_name_release,
> 
> And then we can just leave .release NULL here (IOW drop this line).
> 
>> +	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
>> +};
>> +
>> +/* ---- Initialisation --------------------------------------------------------- */
>> +static void tlmi_release_attr(void)
>> +{
>> +	int i;
>> +
>> +	/* Attribute structures */
>> +	for (i = 0; i < tlmi_priv.settings_count; i++) {
>> +		if (tlmi_priv.setting[i]) {
>> +			kfree(tlmi_priv.setting[i]->possible_values);
>> +
>> +			if (tlmi_priv.setting[i]->attr_name_kobj)
>> +				sysfs_remove_group(tlmi_priv.setting[i]->attr_name_kobj,
>> +						&tlmi_attr_group);
>> +			kfree(tlmi_priv.setting[i]);
>> +		}
>> +	}
>> +	if (tlmi_priv.attribute_kset) {
>> +		struct kobject *pos, *next;
>> +
>> +		list_for_each_entry_safe(pos, next, &tlmi_priv.attribute_kset->list, entry)
>> +			kobject_put(pos);
>> +		kset_unregister(tlmi_priv.attribute_kset);
>> +	}
>> +
>> +	/* Authentication structures */
>> +	if (tlmi_priv.pwd_admin->attr_name_kobj)
>> +		sysfs_remove_group(tlmi_priv.pwd_admin->attr_name_kobj, &auth_attr_group);
>> +	kfree(tlmi_priv.pwd_admin);
>> +	if (tlmi_priv.pwd_power->attr_name_kobj)
>> +		sysfs_remove_group(tlmi_priv.pwd_power->attr_name_kobj, &auth_attr_group);
>> +	kfree(tlmi_priv.pwd_power);
>> +	if (tlmi_priv.authentication_kset) {
>> +		struct kobject *pos, *next;
>> +
>> +		list_for_each_entry_safe(pos, next, &tlmi_priv.authentication_kset->list, entry)
>> +			kobject_put(pos);
>> +		kset_unregister(tlmi_priv.authentication_kset);
>> +	}
>> +}
>> +
>> +static int tlmi_sysfs_init(void)
>> +{
>> +	int i, ret;
>> +
>> +	ret = class_register(&firmware_attributes_class);
>> +	if (ret)
>> +		return ret;
>> +
>> +	tlmi_priv.class_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
>> +			NULL, "%s", "thinklmi-sysfs");
>> +	if (IS_ERR(tlmi_priv.class_dev)) {
>> +		ret = PTR_ERR(tlmi_priv.class_dev);
>> +		goto fail_class_created;
>> +	}
>> +
>> +	tlmi_priv.attribute_kset = kset_create_and_add("attributes", NULL,
>> +			&tlmi_priv.class_dev->kobj);
>> +	if (!tlmi_priv.attribute_kset) {
>> +		ret = -ENOMEM;
>> +		goto fail_device_created;
>> +	}
>> +
>> +	for (i = 0; i < tlmi_priv.settings_count; ++i) {
>> +		/*Check if index is a valid setting - skip if it isn't */
>> +		if (!tlmi_priv.setting[i])
>> +			continue;
>> +
>> +		/* build attribute */
>> +		tlmi_priv.setting[i]->attr_name_kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
>> +		if (!tlmi_priv.setting[i]->attr_name_kobj) {
>> +			ret = -ENOMEM;
>> +			goto fail_create_attr;
>> +		}
>> +		tlmi_priv.setting[i]->attr_name_kobj->kset = tlmi_priv.attribute_kset;
>> +
>> +		ret = kobject_init_and_add(tlmi_priv.setting[i]->attr_name_kobj, &attr_name_ktype,
>> +				NULL, "%s", tlmi_priv.setting[i]->display_name);
>> +		if (ret)
>> +			goto fail_create_attr;
>> +
>> +		ret = sysfs_create_group(tlmi_priv.setting[i]->attr_name_kobj, &tlmi_attr_group);
>> +		if (ret)
>> +			goto fail_create_attr;
>> +	}
>> +
>> +	/* Create authentication entries */
>> +	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
>> +								&tlmi_priv.class_dev->kobj);
>> +	if (!tlmi_priv.authentication_kset) {
>> +		ret = -ENOMEM;
>> +		goto fail_create_attr;
>> +	}
>> +	tlmi_priv.pwd_admin->attr_name_kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
>> +	if (!tlmi_priv.pwd_admin->attr_name_kobj) {
>> +		ret = -ENOMEM;
>> +		goto fail_create_attr;
>> +	}
>> +	tlmi_priv.pwd_admin->attr_name_kobj->kset = tlmi_priv.authentication_kset;
>> +	ret = kobject_init_and_add(tlmi_priv.pwd_admin->attr_name_kobj, &attr_name_ktype,
>> +			NULL, "%s", "Admin");
>> +	if (ret)
>> +		goto fail_create_attr;
>> +
>> +	ret = sysfs_create_group(tlmi_priv.pwd_admin->attr_name_kobj, &auth_attr_group);
>> +	if (ret)
>> +		goto fail_create_attr;
>> +
>> +	tlmi_priv.pwd_power->attr_name_kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
>> +	if (!tlmi_priv.pwd_power->attr_name_kobj) {
>> +		ret = -ENOMEM;
>> +		goto fail_create_attr;
>> +	}
>> +	tlmi_priv.pwd_power->attr_name_kobj->kset = tlmi_priv.authentication_kset;
>> +	ret = kobject_init_and_add(tlmi_priv.pwd_power->attr_name_kobj, &attr_name_ktype,
>> +			NULL, "%s", "System");
>> +	if (ret)
>> +		goto fail_create_attr;
>> +
>> +	ret = sysfs_create_group(tlmi_priv.pwd_power->attr_name_kobj, &auth_attr_group);
>> +	if (ret)
>> +		goto fail_create_attr;
>> +
>> +	return ret;
>> +
>> +fail_create_attr:
>> +	tlmi_release_attr();
>> +fail_device_created:
>> +	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
>> +fail_class_created:
>> +	class_unregister(&firmware_attributes_class);
>> +	return ret;
>> +}
>> +
>> +static void tlmi_sysfs_exit(void)
>> +{
>> +	tlmi_release_attr();
>> +	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
>> +	class_unregister(&firmware_attributes_class);
>> +}
>> +
>> +/* ---- Base Driver -------------------------------------------------------- */
>> +static int tlmi_analyze(void)
>> +{
>> +	struct tlmi_pwdcfg pwdcfg;
>> +	acpi_status status;
>> +	int i = 0;
>> +	int ret;
>> +
>> +	if (wmi_has_guid(LENOVO_SET_BIOS_SETTINGS_GUID) &&
>> +	    wmi_has_guid(LENOVO_SAVE_BIOS_SETTINGS_GUID))
>> +		tlmi_priv.can_set_bios_settings = true;
>> +
>> +	if (wmi_has_guid(LENOVO_GET_BIOS_SELECTIONS_GUID))
>> +		tlmi_priv.can_get_bios_selections = true;
>> +
>> +	if (wmi_has_guid(LENOVO_SET_BIOS_PASSWORD_GUID))
>> +		tlmi_priv.can_set_bios_password = true;
>> +
>> +	if (wmi_has_guid(LENOVO_BIOS_PASSWORD_SETTINGS_GUID))
>> +		tlmi_priv.can_get_password_settings = true;
>> +
>> +	/*
>> +	 * Try to find the number of valid settings of this machine
>> +	 * and use it to create sysfs attributes
>> +	 */
>> +	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
>> +		char *item = NULL;
>> +		int spleng = 0;
>> +		int num = 0;
>> +		char *p;
>> +		struct tlmi_attr_setting *setting;
>> +
>> +		tlmi_priv.setting[i] = NULL;
>> +		status = tlmi_setting(i, &item, LENOVO_BIOS_SETTING_GUID);
>> +		if (ACPI_FAILURE(status))
>> +			break;
>> +		if (!item)
>> +			break;
>> +		if (!*item)
>> +			continue;
>> +
>> +		/* It is not allowed to have '/' for file name. Convert it into '\'. */
>> +		spleng = strlen(item);
>> +		for (num = 0; num < spleng; num++) {
>> +			if (item[num] == '/')
>> +				item[num] = '\\';
>> +		}
>> +
>> +		/* Remove the value part */
>> +		p = strchr(item, ',');
>> +		if (p)
>> +			*p = '\0';
>> +
>> +		/* Create a setting entry */
>> +		setting = kzalloc(sizeof(struct tlmi_attr_setting), GFP_KERNEL);
>> +		if (!setting) {
>> +			ret = -ENOMEM;
>> +			goto fail_clear_attr;
>> +		}
>> +		strscpy(setting->display_name, item, TLMI_SETTINGS_MAXLEN);
>> +
>> +		/* If BIOS selections supported, load those */
>> +		if (tlmi_priv.can_get_bios_selections) {
>> +			ret = tlmi_get_bios_selections(setting->display_name,
>> +					&setting->possible_values);
>> +			if (ret || !setting->possible_values)
>> +				pr_info("Error retrieving possible values for %d : %s\n",
>> +						i, setting->display_name);
>> +		}
>> +		tlmi_priv.setting[i] = setting;
>> +		tlmi_priv.settings_count++;
>> +		kfree(item);
>> +	}
>> +
>> +	/* Create password setting structure */
>> +	ret = tlmi_get_pwd_settings(&pwdcfg);
>> +	if (ret)
>> +		goto fail_clear_attr;
>> +
>> +	tlmi_priv.pwd_admin = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
>> +	if (!tlmi_priv.pwd_admin) {
>> +		ret = -ENOMEM;
>> +		goto fail_clear_attr;
>> +	}
>> +	sprintf(tlmi_priv.pwd_admin->display_name, "admin");
>> +	sprintf(tlmi_priv.pwd_admin->kbdlang, "us");
>> +	sprintf(tlmi_priv.pwd_admin->encoding, "ascii");
>> +	tlmi_priv.pwd_admin->minlen = pwdcfg.min_length;
>> +	tlmi_priv.pwd_admin->maxlen = pwdcfg.max_length;
>> +	if (pwdcfg.password_state & TLMI_PAP_PWD)
>> +		tlmi_priv.pwd_admin->valid = true;
>> +
>> +	tlmi_priv.pwd_power = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
>> +	if (!tlmi_priv.pwd_power) {
>> +		ret = -ENOMEM;
>> +		goto fail_clear_attr;
>> +	}
>> +	sprintf(tlmi_priv.pwd_power->display_name, "power-on");
>> +	sprintf(tlmi_priv.pwd_power->kbdlang, "us");
>> +	sprintf(tlmi_priv.pwd_power->encoding, "ascii");
>> +	tlmi_priv.pwd_power->minlen = pwdcfg.min_length;
>> +	tlmi_priv.pwd_power->maxlen = pwdcfg.max_length;
>> +
>> +	if (pwdcfg.password_state & TLMI_POP_PWD)
>> +		tlmi_priv.pwd_power->valid = true;
>> +
>> +	return 0;
>> +
>> +fail_clear_attr:
>> +	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i)
>> +		kfree(tlmi_priv.setting[i]);
>> +	return ret;
>> +}
>> +
>> +static int tlmi_remove(struct wmi_device *wdev)
>> +{
>> +	tlmi_sysfs_exit();
>> +	return 0;
>> +}
>> +
>> +static int tlmi_probe(struct wmi_device *wdev, const void *context)
>> +{
>> +	tlmi_analyze();
>> +	return tlmi_sysfs_init();
>> +}
>> +
>> +static const struct wmi_device_id tlmi_id_table[] = {
>> +	{ .guid_string = LENOVO_BIOS_SETTING_GUID },
>> +	{ }
>> +};
>> +
>> +static struct wmi_driver tlmi_driver = {
>> +	.driver = {
>> +		.name = "think-lmi",
>> +	},
>> +	.id_table = tlmi_id_table,
>> +	.probe = tlmi_probe,
>> +	.remove = tlmi_remove,
>> +};
>> +
>> +static int __init tlmi_init(void)
>> +{
>> +	return wmi_driver_register(&tlmi_driver);
>> +}
>> +
>> +static void __exit tlmi_exit(void)
>> +{
>> +	wmi_driver_unregister(&tlmi_driver);
>> +}
> 
> You can replace the declaration of these functions + the
> module_init and module_exit calls below with a single
> 
> module_wmi_driver(tlmi_driver);
> 
> "call".
> 
> 
>> +
>> +MODULE_AUTHOR("Sugumaran L <slacshiminar@lenovo.com>");
>> +MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
>> +MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>");
>> +MODULE_DESCRIPTION("ThinkLMI Driver");
>> +MODULE_LICENSE("GPL");
>> +
>> +module_init(tlmi_init);
>> +module_exit(tlmi_exit);
>> diff --git a/include/linux/think-lmi.h b/include/linux/think-lmi.h
>> new file mode 100644
>> index 000000000..9133c0567
>> --- /dev/null
>> +++ b/include/linux/think-lmi.h
>> @@ -0,0 +1,72 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#ifndef _THINK_LMI_H_
>> +#define _THINK_LMI_H_
>> +
>> +#define TLMI_SETTINGS_COUNT  256
>> +#define TLMI_SETTINGS_MAXLEN 512
>> +#define TLMI_PWD_MAXLEN       64
>> +#define TLMI_PWDTYPE_MAXLEN   64
>> +#define TLMI_ENC_MAXLEN       64
>> +#define TLMI_LANG_MAXLEN       4
>> +/*
>> + * Longest string should be in the set command: allow size of BIOS
>> + * option and choice
>> + */
>> +#define TLMI_GETSET_MAXLEN (TLMI_SETTINGS_MAXLEN + TLMI_SETTINGS_MAXLEN)
>> +
>> +#define THINKLMI_GET_SETTINGS _IOR('T', 1, int *)
>> +#define THINKLMI_GET_SETTINGS_STRING _IOWR('T', 2, char *)
>> +#define THINKLMI_SET_SETTING _IOW('T', 3, char *)
>> +#define THINKLMI_SHOW_SETTING _IOWR('T', 4, char *)
>> +#define THINKLMI_AUTHENTICATE _IOW('T', 5, char *)
>> +#define THINKLMI_CHANGE_PASSWORD _IOW('T', 6, char *)
> 
> These defines seem to be a left-over from when the think-lmi driver
> was providing an ioctl interface, please drop these.
> 
>> +
>> +/* password configuration details */
>> +struct tlmi_pwdcfg {
>> +	uint32_t password_mode;
>> +	uint32_t password_state;
>> +	uint32_t min_length;
>> +	uint32_t max_length;
>> +	uint32_t supported_encodings;
>> +	uint32_t supported_keyboard;
>> +};
>> +
>> +/* password setting details */
>> +struct tlmi_pwd_setting {
>> +	struct kobject *attr_name_kobj;
>> +	bool valid;
>> +	char display_name[TLMI_PWDTYPE_MAXLEN];
>> +	char password[TLMI_PWD_MAXLEN];
>> +	int minlen;
>> +	int maxlen;
>> +	char encoding[TLMI_ENC_MAXLEN];
>> +	char kbdlang[TLMI_LANG_MAXLEN];
>> +};
>> +
>> +/* Attribute setting details */
>> +struct tlmi_attr_setting {
>> +	struct kobject *attr_name_kobj;
>> +	char display_name[TLMI_SETTINGS_MAXLEN];
>> +	char *possible_values;
>> +};
>> +
>> +struct think_lmi {
>> +	struct wmi_device *wmi_device;
>> +
>> +	int settings_count;
>> +	bool can_set_bios_settings;
>> +	bool can_get_bios_selections;
>> +	bool can_set_bios_password;
>> +	bool can_get_password_settings;
>> +
>> +	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
>> +	struct device *class_dev;
>> +	struct kset *attribute_kset;
>> +	struct kset *authentication_kset;
>> +	struct tlmi_pwd_setting *pwd_admin;
>> +	struct tlmi_pwd_setting *pwd_power;
>> +};
>> +
>> +#endif /* !_THINK_LMI_H_ */
>> +
>>
> 
> Regards,
> 
> Hans
> 

