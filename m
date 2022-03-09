Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EF6C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Mar 2022 17:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236561AbiCIRUN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Mar 2022 12:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236444AbiCIRUB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Mar 2022 12:20:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 357C4CF3A3
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Mar 2022 09:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646846331;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GAWXQT3+SwSu0KWipMzLVBxSzWWkxNmB9Hors9hSoPE=;
        b=bn/NXiOfjLWj+Vou0OsHtWFFTdnmAev/zprGxylNM05DpKrS8QMNjiCReM0tbRi3myjAPX
        DlAbOw7u/CV3bgagDk4nt6v4LyEij+si5OxTDNq/XRkjOvLPxqBLHdQxB3Bj6yEhtFMB8I
        YvivL4zOQ5C5C8iBEWoyqkVXikwe1zE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-a6Xlp39kMoyk-dUlTUiG6Q-1; Wed, 09 Mar 2022 12:18:50 -0500
X-MC-Unique: a6Xlp39kMoyk-dUlTUiG6Q-1
Received: by mail-ej1-f69.google.com with SMTP id le4-20020a170907170400b006dab546bc40so1643537ejc.15
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Mar 2022 09:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GAWXQT3+SwSu0KWipMzLVBxSzWWkxNmB9Hors9hSoPE=;
        b=di8Cg19/TFCtdT+nLIHvZwI4WXqES13EZt1ZEFeRy8Jnzdl9Ve5A5dV7enVTRbm8Zz
         3Lr0y1bAbiDjIDQ8XIWOMohEjue7V7jXS1CLUPhBKEHbyBJqkDsCFh0HZKVyUm/0+RfR
         +wItWh0+Lsybo2oRfzXM3x/iuv6tqdQL2iU1qEvRAB1rhlzNrzjYOGGBi8Ww/WcFRn10
         3pmAJPn913k34BkqLwfRXpTNs2Wu4MwVMVoky27eL21fCQ5Ry+60SHEpv/KGi8IcY8kA
         eL4uu4GU5jD03H7XVeX5KXbsHlP3ksNJ26Hhv6SAKupsEk3P0OgC1eCRsw6hP0zO97mP
         qx+w==
X-Gm-Message-State: AOAM532txJZNYfJOdKNR3z1ZEJi0lvaUrljtS+OXSShRzzDXiQxS5wm8
        8d8YXXV0054SwkZmv2yo8jedITZkW+yMA+k1AZVzASLp+8T91ur6DsISKug+RCeCmovxqB3G9j1
        CNZ0bpJBfTnRmP4kyCRPPcs4OetimzBVShw==
X-Received: by 2002:a17:906:7056:b0:6d6:dd99:f2a4 with SMTP id r22-20020a170906705600b006d6dd99f2a4mr715911ejj.43.1646846328765;
        Wed, 09 Mar 2022 09:18:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi8c2jYa3zdg0quYt5/j1jgXmEytYjtzAnK/xMNAlTFzNniw1PAlOk+JsUOniGct1OgQ4oKg==
X-Received: by 2002:a17:906:7056:b0:6d6:dd99:f2a4 with SMTP id r22-20020a170906705600b006d6dd99f2a4mr715894ejj.43.1646846328554;
        Wed, 09 Mar 2022 09:18:48 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id m25-20020a170906161900b006d43be5b95fsm985939ejd.118.2022.03.09.09.18.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 09:18:48 -0800 (PST)
Message-ID: <e3d62a2f-793b-8b4f-bdab-faf638aee825@redhat.com>
Date:   Wed, 9 Mar 2022 18:18:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] platform/x86: thinkpad_acpi: Fix compiler warning
 about uninitialized err variable
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20220309170532.343384-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220309170532.343384-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/9/22 18:05, Hans de Goede wrote:
> err is always set because if we get here then dytc_profile_available
> is always one of DYTC_FUNCMODE_MMC or DYTC_FUNCMODE_PSC, but the
> compiler cannot now that, so initialize err to 0 to avoid a
> compiler warning about err being uninitialized.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added these 2 patches to my review-hans (soon to be for-next) branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index cb8f52be8253..7016c7fc3440 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10344,7 +10344,7 @@ static int dytc_profile_set(struct platform_profile_handler *pprof,
>  static void dytc_profile_refresh(void)
>  {
>  	enum platform_profile_option profile;
> -	int output, err;
> +	int output, err = 0;
>  	int perfmode;
>  
>  	mutex_lock(&dytc_mutex);

