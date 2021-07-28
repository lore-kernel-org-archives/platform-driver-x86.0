Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1142EC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 12:31:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECA5560F9D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 12:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235246AbhG1MbW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 08:31:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46942 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234676AbhG1MbV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 08:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627475479;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0YfHQ1c8AlhSTo8Nz6yuEFurOHEQ5PZvC6jO6hUcFJM=;
        b=hK86s1UccMZ/l7JKyGwfeelaJzscaMzpFmQsrXuY565QYyrmluS/OmqxewH96RiXgpNGT2
        AJK2S88zhSW1SmYE6qNdenSxxjZ2NJQbzcOciiRx7DA3sPTY8Bggks1Y4TFUVexYtXikhq
        dJpvRcbLG+8O/MfjXM0klf4DPuFwvX4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-bYQHQ7XiPgSsEz1Z8TR3Eg-1; Wed, 28 Jul 2021 08:31:18 -0400
X-MC-Unique: bYQHQ7XiPgSsEz1Z8TR3Eg-1
Received: by mail-ed1-f69.google.com with SMTP id d6-20020a50f6860000b02903bc068b7717so1172394edn.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 05:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0YfHQ1c8AlhSTo8Nz6yuEFurOHEQ5PZvC6jO6hUcFJM=;
        b=h51N4PNa0YgY99d48SohrNmVTaFW3zvQvfhm+UrNO6ARhw5EJIc321UH/8ISUtXx2b
         FZgIPk5/yf1VsZUx1/DRQ2yA+PbqUpQvPpZ0rJrwKiA78E9s3uhf6wGnm9F652h4PO0e
         UNa0IE6tjNkcNwbkUzrM8CyA4i0kW+asPLC8Wt/+Ah0zMGLATE8Isz71C50BYoRFe6Lm
         ib16GrMj5oTlkqFl6C0R/2I73QYbGzOZlBn749bTs8Ip0TAbb4Wq6QpEWJH6JH2M4ZxF
         iEz/35Ffv/hV2W4YPv0f3x9e1XrWV7bzw+vqhcHH9BI+sUzMPCOeHh9LGCvVJbODtGmz
         bDkw==
X-Gm-Message-State: AOAM5333IR9oG93IjK2voUCTxgq6wCBVhbjcHT29oUvV8ZxBXt19w/I0
        Q+wJl9sINmnJezSiEHBy9QGzgKqiM/ZB54pZ6JBG/feO+YBtINqANQlQmhJN5aKs1Co6nifOm9W
        9ZDwtoLQJ12Jbyo2X+HPINOKAocjsFlVlCoY5nKd5vz1fIzesc/thSzgD74RSoyaNplwPvPV9eF
        1F6yiqKR0LFQ==
X-Received: by 2002:a17:906:7f16:: with SMTP id d22mr5561469ejr.135.1627475477084;
        Wed, 28 Jul 2021 05:31:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV8taebjBVrQfFNIWZ9be9DdCxYdOhsuVB8kCWIIlP35ys8TCT85xHBF701PGsdV3Tf1APPw==
X-Received: by 2002:a17:906:7f16:: with SMTP id d22mr5561454ejr.135.1627475476904;
        Wed, 28 Jul 2021 05:31:16 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id l17sm2595664edt.52.2021.07.28.05.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 05:31:16 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: Kconfig: Make wireless-hotkey depend on
 RFKILL
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20210720025351.1819-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2f223058-3401-5c0a-d216-df32113e11f5@redhat.com>
Date:   Wed, 28 Jul 2021 14:31:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720025351.1819-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/20/21 4:53 AM, Mario Limonciello wrote:
> This driver can be built on a kernel without rfkill, but events
> won't work which causes an unexpected experience.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Mario I can understand where you are coming from here, but Kconfig
dependencies are meant to express true in kernel dependencies.

The wireless-hotkey driver is purely an ACPI based input driver
from the kernel pov and as such it works fine without RFKILL
being enabled.

So adding a RFKILL dependency is the wrong thing to do here IMHO.

Regards,

Hans



> ---
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 7d385c3b2239..22b6e7e3da13 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -419,6 +419,7 @@ config WIRELESS_HOTKEY
>  	tristate "Wireless hotkey button"
>  	depends on ACPI
>  	depends on INPUT
> +	depends on RFKILL
>  	help
>  	 This driver provides supports for the wireless buttons found on some AMD,
>  	 HP, & Xioami laptops.
> 

