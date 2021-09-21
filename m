Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669CAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 12:51:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42FF561186
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 12:51:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbhIUMwZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Sep 2021 08:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60765 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230052AbhIUMwZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Sep 2021 08:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632228656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gkOBjqAV0ouhbcNISGSBmXY/07/63Cpl8i+uD2W0SL4=;
        b=KprcYIydZSbd3V3cV5bL7Qd9r16LDXYUxUwrM0JWhNcFdpT7IuPl83EVo61i9/ABjhEdS7
        6SNrsrGCp7DQedBykrEmNZJkm4CZefGIbr2hYd8I9zSUoGEdZzin7VkpUHmCaMDlm016Tm
        N+Uqh2rBMWAWg9nI1m4h/Pl7Ge4m98A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-LiQ4Q41ZNLei6xmvG-L71Q-1; Tue, 21 Sep 2021 08:50:55 -0400
X-MC-Unique: LiQ4Q41ZNLei6xmvG-L71Q-1
Received: by mail-ed1-f69.google.com with SMTP id b7-20020a50e787000000b003d59cb1a923so18019243edn.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Sep 2021 05:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gkOBjqAV0ouhbcNISGSBmXY/07/63Cpl8i+uD2W0SL4=;
        b=QMbha1gvI3NPTRFzru9TEblNjcy45sYMbiIs1UPMeS5WgUXz0MYMorVPgxO2A/sm6f
         eMwzTHwlyPf/zpTJqEmC6/1OK/pLYoOjtsw1rHUERieFYUR2aRpmrsoxqRiIssIl+JRW
         Vgm2m136QaU9nGQIsaDxLXoq7ePvfdVqbk8VFe8xY+XAj8TxgWbQwVMK+TR8F04SbwWj
         twyen+gyUCxIn/6ajYg/XhF3/gQwPQOBNV66J9jHzxqCVpOvl/kpDyvBDWZZCUtNGRwk
         djTmY+e35qMnzLc4qdB7n1Ci+s16AIBz8BeIxYcruN2PKpujMdACtd7fSKM7jvaTcDMm
         XtMw==
X-Gm-Message-State: AOAM530PcTETDyBPOfgVnP5eLAutAwt42UV/DXs6adyPv+k/HEcxVaJ9
        972L1Ng8pKkMOLzqhRJNtOFReg/4WUZb3JYfgMdJLNwbwrkqN2WZIyg1P3fUWHvaX0Eqe6zFO7U
        fp+qQnz6d2uOqYtM0uEBEExHVm/oRdTNvoWzmsf0hUMxL5aprDTzEVE9bk57nuIJVLDs4BVjUD/
        Y4limAqbwmzw==
X-Received: by 2002:a17:906:5045:: with SMTP id e5mr35814764ejk.239.1632228653588;
        Tue, 21 Sep 2021 05:50:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRrwf090vg7jBTUydLH0bX50Of6iJwYw5EC5TT6k8b62dvJQIpkfN/g1eWxoMOaoQvl3CGcg==
X-Received: by 2002:a17:906:5045:: with SMTP id e5mr35814737ejk.239.1632228653388;
        Tue, 21 Sep 2021 05:50:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b38sm8423919edf.46.2021.09.21.05.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 05:50:53 -0700 (PDT)
Subject: Re: [PATCH 1/2] platform: lg-laptop: drop unneeded MODULE_ALIAS
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Matan Ziv-Av <matan@svgalib.org>,
        Mark Gross <mgross@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20210916170054.136790-1-krzysztof.kozlowski@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <852fde2e-c2c3-0ad5-6156-05ab1b6ef74c@redhat.com>
Date:   Tue, 21 Sep 2021 14:50:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916170054.136790-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/16/21 7:00 PM, Krzysztof Kozlowski wrote:
> The MODULE_DEVICE_TABLE already creates proper alias for ACPI driver.
> Having another MODULE_ALIAS causes the alias to be duplicated.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

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


> ---
>  drivers/platform/x86/lg-laptop.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
> index 3e520d5bca07..4f3ece819f4c 100644
> --- a/drivers/platform/x86/lg-laptop.c
> +++ b/drivers/platform/x86/lg-laptop.c
> @@ -60,7 +60,6 @@ MODULE_ALIAS("wmi:" WMI_EVENT_GUID2);
>  MODULE_ALIAS("wmi:" WMI_EVENT_GUID3);
>  MODULE_ALIAS("wmi:" WMI_METHOD_WMAB);
>  MODULE_ALIAS("wmi:" WMI_METHOD_WMBB);
> -MODULE_ALIAS("acpi*:LGEX0815:*");
>  
>  static struct platform_device *pf_device;
>  static struct input_dev *wmi_input_dev;
> 

