Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0E5C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 09:26:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1C926112D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 09:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244847AbhKIJ2v (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Nov 2021 04:28:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26836 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244806AbhKIJ2v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Nov 2021 04:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636449965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J+QQlB4mEIMgWLA4xpaMYxJTm2+I9eYnL0fykYkPn+g=;
        b=Om9wjGyaUlSCwoKzZZcXWNyUhm4fiTbuIMY8KmasxsPT4tmdjcpNLS5qFO0XMH/TednYmF
        BeyVq1oWkHQEhxSdyxIQzrx8Zrb8Qnjx9Riv69IuljG0QZhTNcLUH8tevUv+h8j8WxMwYO
        VNJSUYCBW9Cc9LqIoXs1Y5KOmOzQUdo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-lRN2lmygMAeCiluKmbzrpA-1; Tue, 09 Nov 2021 04:26:04 -0500
X-MC-Unique: lRN2lmygMAeCiluKmbzrpA-1
Received: by mail-ed1-f69.google.com with SMTP id g3-20020a056402424300b003e2981e1edbso17485262edb.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Nov 2021 01:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J+QQlB4mEIMgWLA4xpaMYxJTm2+I9eYnL0fykYkPn+g=;
        b=sIAPDx+krhEy/AvuVCljefN8mrFi47L2C4ZArvoV3LRaUACJ+HIzhq9qYAVNYcDula
         e5SBpA7NIIvc8jrEmp1oQYiRSvFEAoGcsmYhmkQ0YQO7ChWh4DYMQzkhlXLwopBUhHj+
         E/7MwIy/WUdaAN/VCRW1TVgmjIuXxU62Xby9ACLBWYNTdRGo3ZIkXl1CGKvkd/GKle5j
         Oxl7OOj4l4cWPFVfpojLLeLVMkIyl1RUmBPn1BzInSkwjsI0ztX8LzOP3F171QBizu9s
         ITX5M86Mh3ZtY9X4oJKGI6abGkDw15pGtiFw2Eu749D+EPET7hvP2bxzM4hAzZIS7Oc6
         JZKw==
X-Gm-Message-State: AOAM530xh7JVL/2/luIkxspmPBDPXYPuNFEvSH9GR41GUPC3S+ZeaEdS
        EUJQjGKW/tM+tNwOAxxiOK7noZraxR7FfxmwhuAPvUfMQKwHQed3fWFyI3xjE2IxX7vbF9ovufD
        hna99MeDZ4SDOsxOMU0jnBRRl2IBlK1BMsg==
X-Received: by 2002:a17:906:ad89:: with SMTP id la9mr7661044ejb.178.1636449963113;
        Tue, 09 Nov 2021 01:26:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwV3lAQ7ceBM6/iSGdjPmt1FkQx02L/6F0D/9fEsTcklwFBo2OyIgK6AYtahgFKcvIDs3UCHA==
X-Received: by 2002:a17:906:ad89:: with SMTP id la9mr7661014ejb.178.1636449962899;
        Tue, 09 Nov 2021 01:26:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hr11sm3700167ejc.108.2021.11.09.01.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 01:26:02 -0800 (PST)
Message-ID: <ecface31-f21e-23f4-6400-7555465fc3cd@redhat.com>
Date:   Tue, 9 Nov 2021 10:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: think-lmi: Abort probe on analyze failure
Content-Language: en-US
To:     Alex Williamson <alex.williamson@redhat.com>,
        markpearson@lenovo.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <163639463588.1330483.15850167112490200219.stgit@omen>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <163639463588.1330483.15850167112490200219.stgit@omen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/8/21 19:03, Alex Williamson wrote:
> A Lenovo ThinkStation S20 (4157CTO BIOS 60KT41AUS) fails to boot on
> recent kernels including the think-lmi driver, due to the fact that
> errors returned by the tlmi_analyze() function are ignored by
> tlmi_probe(), where  tlmi_sysfs_init() is called unconditionally.
> This results in making use of an array of already freed, non-null
> pointers and other uninitialized globals, causing all sorts of nasty
> kobject and memory faults.
> 
> Make use of the analyze function return value, free a couple leaked
> allocations, and remove the settings_count field, which is incremented
> but never consumed.
> 
> Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll send this to Linus in my first fixes pull-req for 5.16
(once 516-rc1 is out)

Regards,

Hans



> ---
>  drivers/platform/x86/think-lmi.c |   13 ++++++++++---
>  drivers/platform/x86/think-lmi.h |    1 -
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 9472aae72df2..c4d9c45350f7 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -888,8 +888,10 @@ static int tlmi_analyze(void)
>  			break;
>  		if (!item)
>  			break;
> -		if (!*item)
> +		if (!*item) {
> +			kfree(item);
>  			continue;
> +		}
>  
>  		/* It is not allowed to have '/' for file name. Convert it into '\'. */
>  		strreplace(item, '/', '\\');
> @@ -902,6 +904,7 @@ static int tlmi_analyze(void)
>  		setting = kzalloc(sizeof(*setting), GFP_KERNEL);
>  		if (!setting) {
>  			ret = -ENOMEM;
> +			kfree(item);
>  			goto fail_clear_attr;
>  		}
>  		setting->index = i;
> @@ -916,7 +919,6 @@ static int tlmi_analyze(void)
>  		}
>  		kobject_init(&setting->kobj, &tlmi_attr_setting_ktype);
>  		tlmi_priv.setting[i] = setting;
> -		tlmi_priv.settings_count++;
>  		kfree(item);
>  	}
>  
> @@ -983,7 +985,12 @@ static void tlmi_remove(struct wmi_device *wdev)
>  
>  static int tlmi_probe(struct wmi_device *wdev, const void *context)
>  {
> -	tlmi_analyze();
> +	int ret;
> +
> +	ret = tlmi_analyze();
> +	if (ret)
> +		return ret;
> +
>  	return tlmi_sysfs_init();
>  }
>  
> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
> index f8e26823075f..2ce5086a5af2 100644
> --- a/drivers/platform/x86/think-lmi.h
> +++ b/drivers/platform/x86/think-lmi.h
> @@ -55,7 +55,6 @@ struct tlmi_attr_setting {
>  struct think_lmi {
>  	struct wmi_device *wmi_device;
>  
> -	int settings_count;
>  	bool can_set_bios_settings;
>  	bool can_get_bios_selections;
>  	bool can_set_bios_password;
> 
> 

