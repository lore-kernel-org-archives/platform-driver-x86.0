Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78498C48BE5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 11:20:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5591F610A3
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 11:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbhFPLW7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 07:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhFPLW7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 07:22:59 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D00FC061574;
        Wed, 16 Jun 2021 04:20:52 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id nd37so3331075ejc.3;
        Wed, 16 Jun 2021 04:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v2H3t1ZLUf6l3uU+JY8lO7wmpQXUkTIz60TPBvkH+VM=;
        b=ZNea7fiTfcu2/QurpI6aB+4BRBEKqdB/2B6/FLoJOJAHwyky4yMjglB5c2OQ2y44t6
         iTgWE7EX64Cd1a3xNUdjYOuvqYQvU8BSu7kf392pke52C9SHLr1lroQNwXJvUU79bh7J
         KlotfgsEm0+6Nix29NXQFlUghrlizZpV9kwEPItZy35ThfuRmRqI6UgRyRJBSSKWuJ8P
         N1pfIhd6LuE9dEuWG9iIuoaUHyXzY5ccgVzQVm9goKm4SXn1Vb2Lyl3f3vNRk2PQ2OG6
         fhD/bujK0/J0gId1nCU+JqbKZ8C3/bMKsJ7UoC6s/u+WkGKRtYWHKFZAcpyy8twjR/dF
         WLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v2H3t1ZLUf6l3uU+JY8lO7wmpQXUkTIz60TPBvkH+VM=;
        b=BsI441GCHgy0ZPqglFfYYP4RPF7OYQutPj0FJhu2WTFMomx1UBGAJ7nEkYXL61lC0q
         79+nN4SrlguIITeCxpHprvPWYWgdRvOWNTjaN15PQBj9SfrYz8JhuZwy4s2J4Qxa5chP
         OJ3D/MVLk0fCEZ7DpMD0nJtWs7flFOCdUZuWDUmezvMh/XQOlzRKuWTlIe655zcR8yH8
         G7ZwcO/0e9GGfIsESFISyauXv4rgUuEyXSChe+2u7PRg9nBR/yLEFROAkihlzfPonEKw
         WbKiabWxQJPrdMVrx/etuNShdtTaUqkMTEI6aRQP4L9eo5eMlI87GdypJ8Ay70cavseL
         gobA==
X-Gm-Message-State: AOAM531UKireqQYML2hiDRm7ZN/8ZHRjXzNjG/KIZZB5vLcTDQ7ON34W
        qwtQYGaKtY8zQHlmVIoYoBDRlBaZroY=
X-Google-Smtp-Source: ABdhPJyUXYwAJAQo6+RXwFExUiBaJtU3EjZF74bYffyklBFzvCsvQ+JmLIXnvAG1C/RhC/qzhVuKIQ==
X-Received: by 2002:a17:907:628d:: with SMTP id nd13mr4634035ejc.299.1623842450601;
        Wed, 16 Jun 2021 04:20:50 -0700 (PDT)
Received: from [192.168.2.202] (p5487b3a7.dip0.t-ipconnect.de. [84.135.179.167])
        by smtp.gmail.com with ESMTPSA id x15sm1548068edd.6.2021.06.16.04.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 04:20:50 -0700 (PDT)
Subject: Re: [PATCH -next] platform/x86: think-lmi: Add missing
 MODULE_DEVICE_TABLE
To:     Zou Wei <zou_wei@huawei.com>, markpearson@lenovo.com,
        hdegoede@redhat.com, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1623811809-65099-1-git-send-email-zou_wei@huawei.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <be89ca5c-3484-6d02-440f-8dc89297e48b@gmail.com>
Date:   Wed, 16 Jun 2021 13:20:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1623811809-65099-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 6/16/21 4:50 AM, Zou Wei wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>   drivers/platform/x86/think-lmi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 7771c93..6e1fbc4 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -873,6 +873,7 @@ static const struct wmi_device_id tlmi_id_table[] = {
>   	{ .guid_string = LENOVO_BIOS_SETTING_GUID },
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(vmi, tlmi_id_table);

I assume this should be "wmi", i.e.

     MODULE_DEVICE_TABLE(wmi, tlmi_id_table);

instead of "vmi"?

Regards,
Max

>   
>   static struct wmi_driver tlmi_driver = {
>   	.driver = {
> 
