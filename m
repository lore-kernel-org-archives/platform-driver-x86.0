Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387B6C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 10:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbiKGKuy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 05:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbiKGKux (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 05:50:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4923CF9
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 02:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667818203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B8xCaDjq+dyP2Kfrhc9Kj718Mofe9WPQnaMWa6lVbPk=;
        b=bqngmtVMMvRjUzxV6Z8CuhrNhMHrHW2oUUitM8xx0fuqMq3JXEOhhb2i+yUGI8DzHLmg5n
        C5YZ6fpcBtqnCH5bizZTNJ9cY7DU9NKUxOX0+qRqY/cq+vPZHBXWxPDEIZyc0xuMn5FQyL
        h3xnXwvFAohXCq4m5Zzi1tCJEyofcg0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-qREziOUoPIq0yeI2CnTapg-1; Mon, 07 Nov 2022 05:50:02 -0500
X-MC-Unique: qREziOUoPIq0yeI2CnTapg-1
Received: by mail-ed1-f70.google.com with SMTP id l18-20020a056402255200b004633509768bso7963887edb.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 02:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8xCaDjq+dyP2Kfrhc9Kj718Mofe9WPQnaMWa6lVbPk=;
        b=BQEP5SYlleTywiDkOC7kt5d2grMfp15HYZ1Lr1Q4+B4FovmaQ+3rRN2Upl3ynqvGbM
         5eAwLI2Cpyvap4cB8Ym8i7jEujhc7ipo/J2EPPzvhGh6IcrF/qJqHL4JAwkUb4IDJaFL
         V39EB+dblVjKlKPbFSSze6/eM9h6h2cPfAOUyb7tF5V9t5IaaJXmgH2u1nZZgSLMpEKV
         bLnWKLW3Vwrd6e5gxwiuhaWmkeqtfOJcEKk9HC4en9PvLyruTsJIfnEzIbjSvH6ae0re
         027G9T9sMlX0LMfhRXoUGlhY0vSccDHG/XglRxJRYlI1+im6OWkjk3tQvdpckVCE07NW
         SXww==
X-Gm-Message-State: ACrzQf1Jk4hvrUqiPuJjE6wKk+sdWnV28uC7tVKORCKNW6qyt0h+ELVC
        FqJWC4QxJYVTVMslnsEjIRVfZUV6ua5n3sZLkKK1eZHEVsbHnWg0HDX4qEqkz0KJzflfOnBj4ZH
        CeRiRfl+lZAVg2yoH+mXoDI6Fm9fh+Gv+jA==
X-Received: by 2002:a17:907:6d12:b0:7ae:3b9b:4554 with SMTP id sa18-20020a1709076d1200b007ae3b9b4554mr14650153ejc.307.1667818201090;
        Mon, 07 Nov 2022 02:50:01 -0800 (PST)
X-Google-Smtp-Source: AMsMyM78WGHQOvUieOQpSHURTNyNPuY81hBiDH1LV7kd+Av1VjZAyI9TLNT2XS7dlczJAu3c/+QR+g==
X-Received: by 2002:a17:907:6d12:b0:7ae:3b9b:4554 with SMTP id sa18-20020a1709076d1200b007ae3b9b4554mr14650145ejc.307.1667818200918;
        Mon, 07 Nov 2022 02:50:00 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ca21-20020aa7cd75000000b004580862ffdbsm4015075edb.59.2022.11.07.02.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:50:00 -0800 (PST)
Message-ID: <ece4214d-cec5-940d-eb9d-837ca9f413cd@redhat.com>
Date:   Mon, 7 Nov 2022 11:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86/intel: hid: add some ACPI device IDs
Content-Language: en-US
To:     Ivan Hu <ivan.hu@canonical.com>, alex.hung@amd.com
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221102020548.5225-1-ivan.hu@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221102020548.5225-1-ivan.hu@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/2/22 03:05, Ivan Hu wrote:
> Add INTC1076 (JasonLake), INTC1077 (MeteorLake) and INTC1078 (RaptorLake)
> devices IDs.
> 
> Signed-off-by: Ivan Hu <ivan.hu@canonical.com>

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
>  drivers/platform/x86/intel/hid.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 79cff1fc675c..b6313ecd190c 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -27,6 +27,9 @@ static const struct acpi_device_id intel_hid_ids[] = {
>  	{"INTC1051", 0},
>  	{"INTC1054", 0},
>  	{"INTC1070", 0},
> +	{"INTC1076", 0},
> +	{"INTC1077", 0},
> +	{"INTC1078", 0},
>  	{"", 0},
>  };
>  MODULE_DEVICE_TABLE(acpi, intel_hid_ids);

