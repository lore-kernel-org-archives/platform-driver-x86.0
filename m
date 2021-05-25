Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D03C2B9F8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 12:45:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A4946141D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 12:45:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbhEYMrF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 May 2021 08:47:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54294 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232353AbhEYMrE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 May 2021 08:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621946734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cUa7mLS2d4Y6lQApM5KSrPh/dHnxIeN+s1m3VTUsqYo=;
        b=XVfj43UOYuhzbqSbqOD8PVU4+4shJrIhKRKxcosXcsDT2JeP6sexl2GAIsCmsFajrSdhwD
        ioJ18voAtMte7Y4EHwkZ/LH3CMRq7bzeySHkq16TGusPw1bniEgRJ7/5eotLviiAxbtNBu
        lu1YEGEgqU+TpA8XsIOiFigXXRFswWw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-CDhjD6whM9CnxsFSE6MdGA-1; Tue, 25 May 2021 08:45:32 -0400
X-MC-Unique: CDhjD6whM9CnxsFSE6MdGA-1
Received: by mail-ej1-f72.google.com with SMTP id i23-20020a17090685d7b02903d089ab83fcso8729896ejy.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 May 2021 05:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cUa7mLS2d4Y6lQApM5KSrPh/dHnxIeN+s1m3VTUsqYo=;
        b=BadmLU+1NfYk7trUvPZecKXhSybnA8AnXYL3wIz4V8Vfy68j7aTI63zC2Wh/RPCNCk
         yHfUCkWqzZPS8hJ5ggyrFP3WsUFUXTRGhq7dbAGdKPMnvNIlJxdobZTbkDxf8LYTADry
         L2QS3+c+eujGe+KFiMud20cw8K/7WjQCRuQbPgemKV0qVcdeWpB4CYe48draU0lYh0xq
         68BG4jgDlEh0pTiGrveENpV/zRcB+IM+SE9D3XNdmhbqRSdD05VzbL+b8P84RWroIfVz
         khCZ9feOenxji6jZvy1OkBpyAz83B4js/7Bzy7VwW2DXYTh8Nx7FyGl93tJFh0+JzC4R
         kUOA==
X-Gm-Message-State: AOAM533ShSgDy6vznEZIOpRNQdaZazu75BXINXEojMW1pfcYvs9VFoC8
        GQ37MR6aH2YEGBYvkV4no2d/t/y/47wGVxG4VTF5+dE8zDNi3dws0J/Gho746eFgBvs4qNfh0TF
        CK3vEf9ev6Yb3mS7dtjVaEk1TGc0eaBp1RwsKE8XN13qv9qxwT19uOHIhbAhqBXF9x3XzZkm1Um
        AKnzR1Azi7yw==
X-Received: by 2002:a17:907:9612:: with SMTP id gb18mr2808945ejc.408.1621946730826;
        Tue, 25 May 2021 05:45:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7wni6WaJRI34JKLh9lWJP6nQEB4UzjfsuLOLFrMDyTOR2Ru9/VTeS02nMHYAVt0q8Qe3y7w==
X-Received: by 2002:a17:907:9612:: with SMTP id gb18mr2808926ejc.408.1621946730641;
        Tue, 25 May 2021 05:45:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t6sm2043275ejd.123.2021.05.25.05.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 05:45:30 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Ignore VPC event bit 10
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20210523172331.177834-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d8f5d559-a522-0b65-6dd8-e55b12bb60df@redhat.com>
Date:   Tue, 25 May 2021 14:45:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210523172331.177834-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/23/21 7:23 PM, Hans de Goede wrote:
> VPC event bit 10 gets set on a Yoga 300-11IBR when the EC believes that the
> device has changed between laptop/tent/stand/tablet mode.
> 
> The EC relies on getting angle info from 2 accelerometers through a special
> windows service calling a DSM on the DUAL250E ACPI-device. Linux does not
> do this, making the laptop/tent/stand/tablet mode info unreliable.
> 
> Ignore VPC event bit 10 to avoid the warnings triggered by the default case
> in ideapad_acpi_notify().
> 
> Note that the plan for Linux is to have iio-sensor-proxy read the 2
> accelerometers and have it provide info about which mode 360° hinges
> 2-in-1s to the rest of userspace:
> https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/-/issues/216
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've merged this into my review-hans (and soon also for-next) branch
now.

Regards,

Hans


> ---
>  drivers/platform/x86/ideapad-laptop.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 387817290921..784326bd72f0 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1408,6 +1408,18 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>  		case 6:
>  			ideapad_input_report(priv, bit);
>  			break;
> +		case 10:
> +			/*
> +			 * This event gets send on a Yoga 300-11IBR when the EC
> +			 * believes that the device has changed between laptop/
> +			 * tent/stand/tablet mode. The EC relies on getting
> +			 * angle info from 2 accelerometers through a special
> +			 * windows service calling a DSM on the DUAL250E ACPI-
> +			 * device. Linux does not do this, making the laptop/
> +			 * tent/stand/tablet mode info unreliable, so we simply
> +			 * ignore these events.
> +			 */
> +			break;
>  		case 9:
>  			ideapad_sync_rfk_state(priv);
>  			break;
> 

