Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE11C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B231611B0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353745AbhESNoU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:44:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44119 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236548AbhESNoT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621431780;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V/koiwQpFLFHokjA+K7iK/spImtdAStf6crslcUloYI=;
        b=KgQfuJy3VNdCCNLFFxivo04NSPWvJEY4d/wDBtZ31cV31TW/CvJO9+NPyG0rDSaWiGKi9w
        LBYlUUFh3Uw1ZCG8ptt0XH8gqJ68NH0AIulWa+paV88aCuxWWNdkOpZEn+hlGbhLUGLf50
        vAj17TNJse1G8b9jdmvgP+aWI7FnI0Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426--rBsERz9N1qWtQyeS1bHFg-1; Wed, 19 May 2021 09:42:58 -0400
X-MC-Unique: -rBsERz9N1qWtQyeS1bHFg-1
Received: by mail-ed1-f72.google.com with SMTP id q18-20020a0564025192b02903888712212fso7700755edd.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V/koiwQpFLFHokjA+K7iK/spImtdAStf6crslcUloYI=;
        b=dmoHoBfs4ckU7ZyqWJF2cil8OUerNf1VDvadKuWMv5S+eUKZp+L2nzjA8uwC9KtFjx
         jPY1X1EYU/k19x1jBT4msKYO4Icu7KtrSRgkyAjZQvDge1YCsNcxO3EWvisIAj/mSfsG
         Yl1apqKjxm3GkSoa/r6SppR+O5CcEmw325iZgUmLH33gVUUTZc2ODtvf1yVSTBjisvh+
         frLebfafTKV3a9QCOQHIN5SYHfGPghkkajPBgy7TUHQpfU/RMxCFnWuMMqcQ0mv31u9S
         7XYuqLezan8XkRgYdxjGtCVI8oOOoT971Yv3Fb16jZOri0B2BtNgmaWVoklRnm53MNVO
         QB4A==
X-Gm-Message-State: AOAM531U2dbtCT8dS60TrByvVE7HDY+kWG9Tgoq0YB3H29EtHUzunHJS
        Ed+53/ipjRB1IKOHZ5kKwDyI6mjXWunFBtxgn8fR5C7H0qoKrw2izfEasW11SibmUZO6QFnLEE6
        0OOQ85K3GQZdjIs8g+sZ2kR/sNQwgSQzT6CksgPYvig8Cu5MrVlOCP5RoVVwrlCLXfqm2uOTE4V
        amLFwWQbwa0w==
X-Received: by 2002:a17:906:318b:: with SMTP id 11mr11933626ejy.395.1621431777129;
        Wed, 19 May 2021 06:42:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwngxv7ha48B0D3zKb5DLyEfclmLLSjFO1geM/YX/lAlADbmOCO/lLt/CeJGo1/16Yx2OQ+rg==
X-Received: by 2002:a17:906:318b:: with SMTP id 11mr11933594ejy.395.1621431776892;
        Wed, 19 May 2021 06:42:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y6sm2314883eju.56.2021.05.19.06.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:42:56 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] platform/x86: samsung-laptop: use octal numbers
 for rwx file permissions
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210517100746.29663-1-wsa+renesas@sang-engineering.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4d9b5c1c-6bdd-6380-41d3-3690d71a6298@redhat.com>
Date:   Wed, 19 May 2021 15:42:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210517100746.29663-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/17/21 12:07 PM, Wolfram Sang wrote:
> Andy asked me to do it before working further on the code.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

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



> ---
> 
> change since v2: added Andy's tag
> 
>  drivers/platform/x86/samsung-laptop.c | 35 +++++++++++----------------
>  1 file changed, 14 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
> index d5cec6e35bb8..763d97cbbe53 100644
> --- a/drivers/platform/x86/samsung-laptop.c
> +++ b/drivers/platform/x86/samsung-laptop.c
> @@ -388,7 +388,7 @@ MODULE_PARM_DESC(force,
>  		"Disable the DMI check and forces the driver to be loaded");
>  
>  static bool debug;
> -module_param(debug, bool, S_IRUGO | S_IWUSR);
> +module_param(debug, bool, 0644);
>  MODULE_PARM_DESC(debug, "Debug enabled or not");
>  
>  static int sabi_command(struct samsung_laptop *samsung, u16 command,
> @@ -705,7 +705,7 @@ static ssize_t set_performance_level(struct device *dev,
>  	return count;
>  }
>  
> -static DEVICE_ATTR(performance_level, S_IWUSR | S_IRUGO,
> +static DEVICE_ATTR(performance_level, 0644,
>  		   get_performance_level, set_performance_level);
>  
>  static int read_battery_life_extender(struct samsung_laptop *samsung)
> @@ -774,7 +774,7 @@ static ssize_t set_battery_life_extender(struct device *dev,
>  	return count;
>  }
>  
> -static DEVICE_ATTR(battery_life_extender, S_IWUSR | S_IRUGO,
> +static DEVICE_ATTR(battery_life_extender, 0644,
>  		   get_battery_life_extender, set_battery_life_extender);
>  
>  static int read_usb_charge(struct samsung_laptop *samsung)
> @@ -843,7 +843,7 @@ static ssize_t set_usb_charge(struct device *dev,
>  	return count;
>  }
>  
> -static DEVICE_ATTR(usb_charge, S_IWUSR | S_IRUGO,
> +static DEVICE_ATTR(usb_charge, 0644,
>  		   get_usb_charge, set_usb_charge);
>  
>  static int read_lid_handling(struct samsung_laptop *samsung)
> @@ -908,7 +908,7 @@ static ssize_t set_lid_handling(struct device *dev,
>  	return count;
>  }
>  
> -static DEVICE_ATTR(lid_handling, S_IWUSR | S_IRUGO,
> +static DEVICE_ATTR(lid_handling, 0644,
>  		   get_lid_handling, set_lid_handling);
>  
>  static struct attribute *platform_attributes[] = {
> @@ -1291,24 +1291,17 @@ static void samsung_debugfs_init(struct samsung_laptop *samsung)
>  	samsung->debug.sdiag_wrapper.data = samsung->sdiag;
>  	samsung->debug.sdiag_wrapper.size = strlen(samsung->sdiag);
>  
> -	debugfs_create_u16("command", S_IRUGO | S_IWUSR, root,
> -			   &samsung->debug.command);
> -	debugfs_create_u32("d0", S_IRUGO | S_IWUSR, root,
> -			   &samsung->debug.data.d0);
> -	debugfs_create_u32("d1", S_IRUGO | S_IWUSR, root,
> -			   &samsung->debug.data.d1);
> -	debugfs_create_u16("d2", S_IRUGO | S_IWUSR, root,
> -			   &samsung->debug.data.d2);
> -	debugfs_create_u8("d3", S_IRUGO | S_IWUSR, root,
> -			  &samsung->debug.data.d3);
> -	debugfs_create_blob("data", S_IRUGO | S_IWUSR, root,
> -			    &samsung->debug.data_wrapper);
> -	debugfs_create_blob("f0000_segment", S_IRUSR | S_IWUSR, root,
> +	debugfs_create_u16("command", 0644, root, &samsung->debug.command);
> +	debugfs_create_u32("d0", 0644, root, &samsung->debug.data.d0);
> +	debugfs_create_u32("d1", 0644, root, &samsung->debug.data.d1);
> +	debugfs_create_u16("d2", 0644, root, &samsung->debug.data.d2);
> +	debugfs_create_u8("d3", 0644, root, &samsung->debug.data.d3);
> +	debugfs_create_blob("data", 0644, root, &samsung->debug.data_wrapper);
> +	debugfs_create_blob("f0000_segment", 0600, root,
>  			    &samsung->debug.f0000_wrapper);
> -	debugfs_create_file("call", S_IFREG | S_IRUGO, root, samsung,
> +	debugfs_create_file("call", S_IFREG | 0444, root, samsung,
>  			    &samsung_laptop_call_fops);
> -	debugfs_create_blob("sdiag", S_IRUGO | S_IWUSR, root,
> -			    &samsung->debug.sdiag_wrapper);
> +	debugfs_create_blob("sdiag", 0644, root, &samsung->debug.sdiag_wrapper);
>  }
>  
>  static void samsung_sabi_exit(struct samsung_laptop *samsung)
> 

