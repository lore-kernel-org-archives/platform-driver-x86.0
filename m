Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2165EC433E9
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Feb 2021 16:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E07B264F55
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Feb 2021 16:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236066AbhBBQTK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Feb 2021 11:19:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24062 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233904AbhBBOPq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Feb 2021 09:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612275258;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yKrS5uQRhtab8WItDsHInXUN/7EkbDwKjpoO0IVO3FI=;
        b=bFvhQD4POGpkhmDJsQTtF4L2Dy6vg1U1t5XCNyGlCL6ArelZDDgTmYZfeHJhTmqOG4ysJ/
        uRPhQwTm5PKG7qrgFtYKw1TUJNvvgQs0+RyPYLcC0/fY2u0CFPArYQNBlist+pdki90bdk
        NhpMYbqAyf742hqWTHUFAueVdOLYyFI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-KBU2Qo-XPImQGM5DW091Kg-1; Tue, 02 Feb 2021 09:14:15 -0500
X-MC-Unique: KBU2Qo-XPImQGM5DW091Kg-1
Received: by mail-ej1-f70.google.com with SMTP id dc21so10024029ejb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Feb 2021 06:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yKrS5uQRhtab8WItDsHInXUN/7EkbDwKjpoO0IVO3FI=;
        b=Jt2NfUEWHeWBrzIUjI/yI7X36nbH7tPB5e0KWe0OQpEX4PXey0k0Vcxo40tv4Nwceh
         P3Gla8ybGjHJqqa6b9JCdvWC+JkETDrRytfjZzoz6bzAMhhxhQFmCcds+58qmdr0lhYU
         sfHZDf9hmxQlL//dA6pJJMw/xdBhEdBWmaefe6D5gnJKMYLAle/eD3nnuFllYeyjYNHk
         GQ/gGzMPHTsPoqrTt+lBPE8Az5cG/JBUC/L1X3crBSsY2V8HLyU0iaAEKpPcq312zPqn
         c2QUl6fxlSTgAL5KtoQUsPIm+8URtNli6+H7t3T+XR12YAlG0olHbMyXv2xtSHpLIBnz
         RQEg==
X-Gm-Message-State: AOAM532RvDEjOgjyiDVKmk6am3PlnelC27wZlt5MrCJGX4D9LZ91/SLq
        uFzUakYk5sA9w6RxhhkXi0kHbgHZJCYWT7OgylbIg6+lP4CMKkuITl5dR8SDSLzRb+jPu0empuC
        RO+JYoAczQbn94lmZE3GoEyJB9isbTKjbDw==
X-Received: by 2002:a17:906:70d4:: with SMTP id g20mr23022217ejk.361.1612275253911;
        Tue, 02 Feb 2021 06:14:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUj4/h6QsEtudc8xoqWaDgnjmgj3PlGvH0NKfRBe6B6o4MN8TZ9fw2/BipAkJgd8NV1w6LDQ==
X-Received: by 2002:a17:906:70d4:: with SMTP id g20mr23022189ejk.361.1612275253592;
        Tue, 02 Feb 2021 06:14:13 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id o4sm10137005edw.78.2021.02.02.06.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 06:14:13 -0800 (PST)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: fixed warning and
 incorporated review comments
To:     Nitin Joshi <nitjoshi@gmail.com>
Cc:     andy.shevchenko@gmail.com, mpearson@lenovo.com,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        kernel test robot <lkp@intel.com>
References: <20210202003210.91773-1-njoshi1@lenovo.com>
Message-ID: <cdfbe712-81d5-e384-ac0d-de86aeeaf439@redhat.com>
Date:   Tue, 2 Feb 2021 15:14:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210202003210.91773-1-njoshi1@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,Hi,

On 2/2/21 1:32 AM, Nitin Joshi wrote:
> The previous commit adding new sysfs for keyboard language has warning and
> few code correction has to be done as per new review comments.
> 
> Below changes has been addressed in this version:
>  - corrected warning. Many thanks to kernel test robot <lkp@intel.com> for
>    reporting and determining this warning.
>  - used sysfs_emit_at() API instead of strcat.
>  - sorted keyboard language array.
>  - removed unwanted space and corrected sentences.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Erm, this patch is the result of some extra reviewing after I merged
the original patch, but the changes themselves have not been reviewed,
so these are wrong.

So I've dropped the 2 Reviewed-by tags.

In the future please only add Reviewed-by tags if you are:

1. Posting a new (revised) version of an existing patch
2. Where people have responded to a previous version with their Reviewed-by.
3. The changes in the new revision are small. Large changes invalidate
   previous reviews.

Thanks & Regards,

Hans


> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     | 15 ++++----
>  drivers/platform/x86/thinkpad_acpi.c          | 34 +++++++------------
>  2 files changed, 20 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index b1188f05a99a..3b225ae47f1a 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -1476,18 +1476,19 @@ sysfs: keyboard_lang
>  This feature is used to set keyboard language to ECFW using ASL interface.
>  Fewer thinkpads models like T580 , T590 , T15 Gen 1 etc.. has "=", "(',
>  ")" numeric keys, which are not displaying correctly, when keyboard language
> -is other than "english". This is because of default keyboard language in ECFW
> -is set as "english". Hence using this sysfs, user can set correct keyboard
> -language to ECFW and then these key's will work correctly .
> +is other than "english". This is because the default keyboard language in ECFW
> +is set as "english". Hence using this sysfs, user can set the correct keyboard
> +language to ECFW and then these key's will work correctly.
>  
>  Example of command to set keyboard language is mentioned below::
>  
>          echo jp > /sys/devices/platform/thinkpad_acpi/keyboard_lang
>  
> -Text corresponding to keyboard layout to be set in sysfs are : jp (Japan), be(Belgian),
> -cz(Czech), en(English), da(Danish), de(German), es(Spain) , et(Estonian),
> -fr(French) , fr-ch (French(Switzerland)), pl(Polish), sl(Slovenian), hu
> -(Hungarian), nl(Dutch), tr(Turkey), it(Italy), sv(Sweden), pt(portugese)
> +Text corresponding to keyboard layout to be set in sysfs are: be(Belgian),
> +cz(Czech), da(Danish), de(German), en(English), es(Spain), et(Estonian),
> +fr(French), fr-ch(French(Switzerland)), hu(Hungarian), it(Italy), jp (Japan),
> +nl(Dutch), nn(Norway), pl(Polish), pt(portugese), sl(Slovenian), sv(Sweden),
> +tr(Turkey)
>  
>  
>  Adaptive keyboard
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 3cfc4a872c2d..a7f1b4ee5457 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9991,16 +9991,12 @@ struct keyboard_lang_data {
>  	int lang_code;
>  };
>  
> -/*
> - * When adding new entries to keyboard_lang_data, please check that
> - * the select_lang[] buffer in keyboard_lang_show() is still large enough.
> - */
> -struct keyboard_lang_data keyboard_lang_data[] = {
> -	{"en", 0},
> +static const struct keyboard_lang_data keyboard_lang_data[] = {
>  	{"be", 0x080c},
>  	{"cz", 0x0405},
>  	{"da", 0x0406},
>  	{"de", 0x0c07},
> +	{"en", 0x0000},
>  	{"es", 0x2c0a},
>  	{"et", 0x0425},
>  	{"fr", 0x040c},
> @@ -10056,9 +10052,7 @@ static ssize_t keyboard_lang_show(struct device *dev,
>  				struct device_attribute *attr,
>  				char *buf)
>  {
> -	int output, err, i;
> -	char select_lang[80] = "";
> -	char lang[8] = "";
> +	int output, err, i, len = 0;
>  
>  	err = get_keyboard_lang(&output);
>  	if (err)
> @@ -10066,19 +10060,18 @@ static ssize_t keyboard_lang_show(struct device *dev,
>  
>  	for (i = 0; i < ARRAY_SIZE(keyboard_lang_data); i++) {
>  		if (i)
> -			strcat(select_lang, " ");
> +			len += sysfs_emit_at(buf, len, "%s", " ");
>  
>  		if (output == keyboard_lang_data[i].lang_code) {
> -			strcat(lang, "[");
> -			strcat(lang, keyboard_lang_data[i].lang_str);
> -			strcat(lang, "]");
> -			strcat(select_lang, lang);
> +			len += sysfs_emit_at(buf, len, "%s%s%s", "[",
> +					keyboard_lang_data[i].lang_str, "]");

This can be simplified to:

			len += sysfs_emit_at(buf, len, "[%s]", keyboard_lang_data[i].lang_str);

I've applied the patch with this fixed up.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




>  		} else {
> -			strcat(select_lang, keyboard_lang_data[i].lang_str);
> +			len += sysfs_emit_at(buf, len, "%s", keyboard_lang_data[i].lang_str);
>  		}
>  	}
> +	len += sysfs_emit_at(buf, len, "\n");
>  
> -	return sysfs_emit(buf, "%s\n", select_lang);
> +	return len;
>  }
>  
>  static ssize_t keyboard_lang_store(struct device *dev,
> @@ -10105,7 +10098,7 @@ static ssize_t keyboard_lang_store(struct device *dev,
>  		if (err)
>  			return err;
>  	} else {
> -		pr_err("Unknown Keyboard language. Ignoring\n");
> +		dev_err(&tpacpi_pdev->dev, "Unknown Keyboard language. Ignoring\n");
>  		return -EINVAL;
>  	}
>  
> @@ -10116,7 +10109,6 @@ static ssize_t keyboard_lang_store(struct device *dev,
>  
>  	return count;
>  }
> -
>  static DEVICE_ATTR_RW(keyboard_lang);
>  
>  static struct attribute *kbdlang_attributes[] = {
> @@ -10135,7 +10127,7 @@ static int tpacpi_kbdlang_init(struct ibm_init_struct *iibm)
>  	err = get_keyboard_lang(&output);
>  	/*
>  	 * If support isn't available (ENODEV) then don't return an error
> -	 * just don't create the sysfs group
> +	 * just don't create the sysfs group.
>  	 */
>  	if (err == -ENODEV)
>  		return 0;
> @@ -10144,9 +10136,7 @@ static int tpacpi_kbdlang_init(struct ibm_init_struct *iibm)
>  		return err;
>  
>  	/* Platform supports this feature - create the sysfs file */
> -	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &kbdlang_attr_group);
> -
> -	return err;
> +	return sysfs_create_group(&tpacpi_pdev->dev.kobj, &kbdlang_attr_group);
>  }
>  
>  static void kbdlang_exit(void)
> 

