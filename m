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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52911C48BE6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 14:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2415E601FF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 14:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbhFPOD5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 10:03:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29618 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233325AbhFPOD4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 10:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623852110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EuigkSf3oVyn4uOeOvAmJ67b8TwOsP+BB6Vyhnv1wMY=;
        b=Mrwa83EtN9ndwy6xEEsuBXotscKkyV87OKlIdWtoub1dcj4ikUrkdjm13IdNL1GYr48Ff3
        BYOL1uxqsXcHFKgb+OC9rhvSrtRbebMhorFlhh1A90L8Sp7ySkC2hy0+n8tDlaA45+hFXC
        7/a60tNHWINO7WddH29vV4Nu+WZdgZs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-WFkue5IxNSKSOgvYnTRHgg-1; Wed, 16 Jun 2021 10:01:48 -0400
X-MC-Unique: WFkue5IxNSKSOgvYnTRHgg-1
Received: by mail-ej1-f69.google.com with SMTP id k1-20020a17090666c1b029041c273a883dso1006271ejp.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 07:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EuigkSf3oVyn4uOeOvAmJ67b8TwOsP+BB6Vyhnv1wMY=;
        b=LC1DP6EgZsz/q98glxGhUSJEreSdYZmtcUKT3UDfpXrZSXwCxMjrLmJNj/0j7XToyQ
         H2Kzz5HcCSoSc02Sn8K7lzJLdyaRPCQLuiwVBcT0qbuWjMgm+xzmnhRDK4Uf7Fto4sq+
         deysCKBQN6SfOcaAG8pVhFP53xmRMfjJ4IiiXzrz0iyOhGTIhQ3Rns8zyoAmA0hNQE8x
         Dgj/DuqyvE0fxbRZaIYDBj9P051r2RI0aXmooS1kkXhdj77bWE7gNVCIQdIHRiC8j2AT
         lJD8tq3GBVSJIj5vL+YhV1OHaqa1zJAJeo4AywNcI18mEpj1pnEn8bh+CZH4A7qANRnX
         R5Kw==
X-Gm-Message-State: AOAM532fxHQULRub8p8TVEgSYt6KMW7rEwSRhXQ+R+WHPshlj3KcqQIS
        S5IazY/morSzIWIXu75rxKpzx8sOFQyeCNrPa9BdCnAsZEIe+vG59t2pY5cv6zoQq9ER5D2Qx+o
        MTTZfHJG7GgCttwVmMqzg/vZiVpJ32FeQ9A==
X-Received: by 2002:a05:6402:34c6:: with SMTP id w6mr4452636edc.174.1623852107418;
        Wed, 16 Jun 2021 07:01:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznb4e7pprjbLMhePXyxYl/0qX3QcF+KCI6z8PYYpeVrtTTvPjegzp7saSVNyej2GY84a3/8Q==
X-Received: by 2002:a05:6402:34c6:: with SMTP id w6mr4452623edc.174.1623852107288;
        Wed, 16 Jun 2021 07:01:47 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f15sm1706051ejl.60.2021.06.16.07.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 07:01:46 -0700 (PDT)
Subject: Re: [PATCH -next] platform/x86: think-lmi: Add missing
 MODULE_DEVICE_TABLE
To:     Zou Wei <zou_wei@huawei.com>, markpearson@lenovo.com,
        mgross@linux.intel.com, Maximilian Luz <luzmaximilian@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1623811809-65099-1-git-send-email-zou_wei@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a53b7c08-ef8c-6b88-cb5a-99fca16dd526@redhat.com>
Date:   Wed, 16 Jun 2021 16:01:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1623811809-65099-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/16/21 4:50 AM, Zou Wei wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I've fixed up the vmi typo notices by Maximillian while applying the patch.

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/think-lmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 7771c93..6e1fbc4 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -873,6 +873,7 @@ static const struct wmi_device_id tlmi_id_table[] = {
>  	{ .guid_string = LENOVO_BIOS_SETTING_GUID },
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(vmi, tlmi_id_table);
>  
>  static struct wmi_driver tlmi_driver = {
>  	.driver = {
> 

