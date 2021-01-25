Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E840C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 20:35:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4381E2256F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 20:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732279AbhAYUfX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Jan 2021 15:35:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46349 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732261AbhAYUfJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 15:35:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611606821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JznY5OJ5dqew3i/iMfqfUq7mjInbHdvSlHONH/dYmvs=;
        b=awyaSF8hqCkOovuz2lcM6FdGyXT07OSLpyIOXCbUv8Q3RuziwK5BHo/iSt1M6ZRQpFgLI7
        1CMKQmMeu+TAHfe37HOSyjdMLpSrjGl6fyGow6UrN8+2Eu4WFvDOVXmBLuetSBgVFZWP/k
        G+RK9qdR1jAz69k80rDJn5ePm4v7FR8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-uVqxxLrcP1ynq9KD5Mnx9w-1; Mon, 25 Jan 2021 15:33:35 -0500
X-MC-Unique: uVqxxLrcP1ynq9KD5Mnx9w-1
Received: by mail-ej1-f69.google.com with SMTP id q11so4250944ejd.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 12:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JznY5OJ5dqew3i/iMfqfUq7mjInbHdvSlHONH/dYmvs=;
        b=HUDjMwgupyuK+iuSfErKR1f61oWxW3xZVkYwGk3yIiyq4zJUbNz80n/EdihMlfL4me
         nK7kr4JsLhFkE+jPg8JOWZuFhubIGIweNvtcl0X1DPvwMO1SxHarMy097Kw+70zxkrdD
         YebGmsYD5yB4mM6W8rbszpbnybHX4uw5YB8GXDffKjYp2YByfMhfpM9vmrkCsWtAhHNx
         X09ZIvcVZFAWLVaJGyn+VwueJnGV1j7I491uwwl1rRib/GaaqVUR81GR4WnkdNT8NNPd
         U9QPZQt+/aFnCYlJKLzwvkc+YA8ielMKhAx/1N8T8WK89/sH8knFhlaALb3LVdh895w2
         5vcw==
X-Gm-Message-State: AOAM530f00ikfUUr2Qn+UvqaEY+gvqtslron01EGFpB4vDO8P89mRXHL
        xjxbb5q1gHRiQcEBlwLT7sdK66sZqcjOpssJl7W2FHEx89XG9ClTleZfYrqzR12oazWvvph10Ug
        ic+p6gvvEyfFGP09ovZxhfV1VbSyQwtxc4A==
X-Received: by 2002:a17:906:aec1:: with SMTP id me1mr1526263ejb.114.1611606813908;
        Mon, 25 Jan 2021 12:33:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuwgvaFNIVNByQfEpn0DnPPbshqbFZYLfixb77nnGvTuoGGR8Ek+M8wooZLl/DvdVj9jNxbg==
X-Received: by 2002:a17:906:aec1:: with SMTP id me1mr1526258ejb.114.1611606813703;
        Mon, 25 Jan 2021 12:33:33 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id n27sm8948434eje.29.2021.01.25.12.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 12:33:33 -0800 (PST)
Subject: Re: [PATCH] [v2] platform/x86: thinkpad_acpi: set keyboard language
To:     Nitin Joshi <nitjoshi@gmail.com>
Cc:     bberg@redhat.com, peter.hutterer@redhat.com, maruichit@lenovo.com,
        mpearson@lenovo.com, platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>
References: <20210125025916.180831-1-nitjoshi@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a7b5f53d-f02f-718c-6a93-1e06cc29ef2e@redhat.com>
Date:   Mon, 25 Jan 2021 21:33:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125025916.180831-1-nitjoshi@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/25/21 3:59 AM, Nitin Joshi wrote:
> From: Nitin Joshi <njoshi1@lenovo.com>
> 
> This patch is to create sysfs entry for setting keyboard language
> using ASL method. Some thinkpads models like T580 , T590 , T15 Gen 1
> etc. has "=", "(',")" numeric keys, which are not displaying correctly,
> when keyboard language is other than "english".
> This patch fixes this issue by setting keyboard language to ECFW.
> 
> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
> ---
> Changes in v2:
>  - used sysfs_streq() API instead of strcmp
>  - used ARRAY_SIZE() API instead of strlen
>  - addressed typo

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Nitn, I did not notice one small issue while testing this on a X1C8
I will send out a follow-up patch addressing that. If you can
test the follow-up patch on one of the affected models
(T580 , T590 , T15 Gen 1, etc.) that would be great.

Note this patch will show up in my review-hans branch once I've
pushed my local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  24 +++
>  drivers/platform/x86/thinkpad_acpi.c          | 182 ++++++++++++++++++
>  2 files changed, 206 insertions(+)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 5fe1ade88c17..b1188f05a99a 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -51,6 +51,7 @@ detailed description):
>  	- UWB enable and disable
>  	- LCD Shadow (PrivacyGuard) enable and disable
>  	- Lap mode sensor
> +	- Setting keyboard language
>  
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1466,6 +1467,29 @@ Sysfs notes
>  	rfkill controller switch "tpacpi_uwb_sw": refer to
>  	Documentation/driver-api/rfkill.rst for details.
>  
> +
> +Setting keyboard language
> +-------------------
> +
> +sysfs: keyboard_lang
> +
> +This feature is used to set keyboard language to ECFW using ASL interface.
> +Fewer thinkpads models like T580 , T590 , T15 Gen 1 etc.. has "=", "(',
> +")" numeric keys, which are not displaying correctly, when keyboard language
> +is other than "english". This is because of default keyboard language in ECFW
> +is set as "english". Hence using this sysfs, user can set correct keyboard
> +language to ECFW and then these key's will work correctly .
> +
> +Example of command to set keyboard language is mentioned below::
> +
> +        echo jp > /sys/devices/platform/thinkpad_acpi/keyboard_lang
> +
> +Text corresponding to keyboard layout to be set in sysfs are : jp (Japan), be(Belgian),
> +cz(Czech), en(English), da(Danish), de(German), es(Spain) , et(Estonian),
> +fr(French) , fr-ch (French(Switzerland)), pl(Polish), sl(Slovenian), hu
> +(Hungarian), nl(Dutch), tr(Turkey), it(Italy), sv(Sweden), pt(portugese)
> +
> +
>  Adaptive keyboard
>  -----------------
>  
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e03df2881dc6..3cfc4a872c2d 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9982,6 +9982,183 @@ static struct ibm_struct proxsensor_driver_data = {
>  	.exit = proxsensor_exit,
>  };
>  
> +/*************************************************************************
> + * Keyboard language interface
> + */
> +
> +struct keyboard_lang_data {
> +	const char *lang_str;
> +	int lang_code;
> +};
> +
> +/*
> + * When adding new entries to keyboard_lang_data, please check that
> + * the select_lang[] buffer in keyboard_lang_show() is still large enough.
> + */
> +struct keyboard_lang_data keyboard_lang_data[] = {
> +	{"en", 0},
> +	{"be", 0x080c},
> +	{"cz", 0x0405},
> +	{"da", 0x0406},
> +	{"de", 0x0c07},
> +	{"es", 0x2c0a},
> +	{"et", 0x0425},
> +	{"fr", 0x040c},
> +	{"fr-ch", 0x100c},
> +	{"hu", 0x040e},
> +	{"it", 0x0410},
> +	{"jp", 0x0411},
> +	{"nl", 0x0413},
> +	{"nn", 0x0414},
> +	{"pl", 0x0415},
> +	{"pt", 0x0816},
> +	{"sl", 0x041b},
> +	{"sv", 0x081d},
> +	{"tr", 0x041f},
> +};
> +
> +static int set_keyboard_lang_command(int command)
> +{
> +	acpi_handle sskl_handle;
> +	int output;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "SSKL", &sskl_handle))) {
> +		/* Platform doesn't support SSKL */
> +		return -ENODEV;
> +	}
> +
> +	if (!acpi_evalf(sskl_handle, &output, NULL, "dd", command))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int get_keyboard_lang(int *output)
> +{
> +	acpi_handle gskl_handle;
> +	int kbd_lang;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GSKL", &gskl_handle))) {
> +		/* Platform doesn't support GSKL */
> +		return -ENODEV;
> +	}
> +
> +	if (!acpi_evalf(gskl_handle, &kbd_lang, NULL, "dd", 0x02000000))
> +		return -EIO;
> +
> +	*output = kbd_lang;
> +
> +	return 0;
> +}
> +
> +/* sysfs keyboard language entry */
> +static ssize_t keyboard_lang_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	int output, err, i;
> +	char select_lang[80] = "";
> +	char lang[8] = "";
> +
> +	err = get_keyboard_lang(&output);
> +	if (err)
> +		return err;
> +
> +	for (i = 0; i < ARRAY_SIZE(keyboard_lang_data); i++) {
> +		if (i)
> +			strcat(select_lang, " ");
> +
> +		if (output == keyboard_lang_data[i].lang_code) {
> +			strcat(lang, "[");
> +			strcat(lang, keyboard_lang_data[i].lang_str);
> +			strcat(lang, "]");
> +			strcat(select_lang, lang);
> +		} else {
> +			strcat(select_lang, keyboard_lang_data[i].lang_str);
> +		}
> +	}
> +
> +	return sysfs_emit(buf, "%s\n", select_lang);
> +}
> +
> +static ssize_t keyboard_lang_store(struct device *dev,
> +				struct device_attribute *attr,
> +				const char *buf, size_t count)
> +{
> +	int err, i;
> +	bool lang_found = false;
> +	int lang_code = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(keyboard_lang_data); i++) {
> +		if (sysfs_streq(buf, keyboard_lang_data[i].lang_str)) {
> +			lang_code = keyboard_lang_data[i].lang_code;
> +			lang_found = true;
> +			break;
> +		}
> +	}
> +
> +	if (lang_found) {
> +		lang_code = lang_code | 1 << 24;
> +
> +		/* Set language code */
> +		err = set_keyboard_lang_command(lang_code);
> +		if (err)
> +			return err;
> +	} else {
> +		pr_err("Unknown Keyboard language. Ignoring\n");
> +		return -EINVAL;
> +	}
> +
> +	tpacpi_disclose_usertask(attr->attr.name,
> +			"keyboard language is set to  %s\n", buf);
> +
> +	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "keyboard_lang");
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(keyboard_lang);
> +
> +static struct attribute *kbdlang_attributes[] = {
> +	&dev_attr_keyboard_lang.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group kbdlang_attr_group = {
> +	.attrs = kbdlang_attributes,
> +};
> +
> +static int tpacpi_kbdlang_init(struct ibm_init_struct *iibm)
> +{
> +	int err, output;
> +
> +	err = get_keyboard_lang(&output);
> +	/*
> +	 * If support isn't available (ENODEV) then don't return an error
> +	 * just don't create the sysfs group
> +	 */
> +	if (err == -ENODEV)
> +		return 0;
> +
> +	if (err)
> +		return err;
> +
> +	/* Platform supports this feature - create the sysfs file */
> +	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &kbdlang_attr_group);
> +
> +	return err;
> +}
> +
> +static void kbdlang_exit(void)
> +{
> +	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &kbdlang_attr_group);
> +}
> +
> +static struct ibm_struct kbdlang_driver_data = {
> +	.name = "kbdlang",
> +	.exit = kbdlang_exit,
> +};
> +
>  /****************************************************************************
>   ****************************************************************************
>   *
> @@ -10474,6 +10651,11 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>  		.init = tpacpi_proxsensor_init,
>  		.data = &proxsensor_driver_data,
>  	},
> +	{
> +		.init = tpacpi_kbdlang_init,
> +		.data = &kbdlang_driver_data,
> +	},
> +
>  };
>  
>  static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
> 

