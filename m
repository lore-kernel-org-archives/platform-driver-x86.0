Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6129C4361B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 14:08:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93D4023447
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 14:08:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgLGOHq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 09:07:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30451 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726638AbgLGOHp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 09:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607349979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oIQEZStG8ElOQdQ6wrva4lMkvQcBMuWnarU5vOcVQdQ=;
        b=Le9oCxg1lOldRkdj5Cf2WcnTCXQCimk0niJPsM3cdePEBUmX+XTEvwEtit14229GhidAvM
        7mCScHGZg11iw86T4JeJ7XlSviU1uojBpg/DsEV7OKU63HyLA5ZOLjgzy161DjWrdI9kEC
        5BW/TBAq2/HRXTbbLQsLZGAlaltI7/0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-J6CPNDdlO9qrn8TwgGBcQQ-1; Mon, 07 Dec 2020 09:06:17 -0500
X-MC-Unique: J6CPNDdlO9qrn8TwgGBcQQ-1
Received: by mail-ej1-f69.google.com with SMTP id ny19so3069145ejb.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Dec 2020 06:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oIQEZStG8ElOQdQ6wrva4lMkvQcBMuWnarU5vOcVQdQ=;
        b=sZHwZo3jNWJEJ748a5p95Fgy8vLjfHXktRLtTxPkY32DpI8boSUtAG9dO4iN9rLwA4
         9puhsOxP+y+Dxl7ZfRNygfu8twr3X/A2HxFJbSf69PvrpjADTmQz7fQ0QC6N5UltLaZs
         Tmo6Y+VfoS6q+aiEkZKHSsSUCsMAGM2RQ1GtftTN2UWcuCJw1Eoxx64fhaKsuBkDNyk2
         LFxjHb5716MkluJ/eP4e/KPxghQnC/EERJt2yWxIAQEKnVNFsA9FdtNeOI3CciqR9KkB
         4e0z5J5yijzeRlOzVpJ2e9IX5en/PNz6gCmPLPzTiLPTgfLph07RX4+wBN4W3Q1I6zZV
         2e1w==
X-Gm-Message-State: AOAM531l33JFEw0CVI5n4WY4CA1AK4iD9/OTYQ6+u8hhpEBi/gqXJ8C/
        qBBIRAdif6aTdnrajw+o9tcKVf5+ROp2ILuvfc/TaAx44yvqReO1my7ol48yR//zaEUoyxQWc/5
        bSEVS/qat45V00T4ByC3vpDB8+vWXstP/vg==
X-Received: by 2002:a50:d4d9:: with SMTP id e25mr9795399edj.243.1607349976283;
        Mon, 07 Dec 2020 06:06:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxghHQqy/Z3ozF+KzW4FFZXQMPRBxJdF5q4jLTmTzZsCzyRG416H05Zx7Uf+lIDd6n13A8Z5w==
X-Received: by 2002:a50:d4d9:: with SMTP id e25mr9795374edj.243.1607349976078;
        Mon, 07 Dec 2020 06:06:16 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id v24sm13606696edw.23.2020.12.07.06.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 06:06:15 -0800 (PST)
Subject: Re: [PATCH] acer-wireless: send an EV_SYN/SYN_REPORT between state
 changes
To:     Chris Chiu <chiu@endlessos.org>, dvhart@infradead.org,
        andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessos.org, Daniel Drake <drake@endlessos.org>
References: <20201207064322.13992-1-chiu@endlessos.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ce1eaef4-c804-c956-ce24-fa1333100060@redhat.com>
Date:   Mon, 7 Dec 2020 15:06:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207064322.13992-1-chiu@endlessos.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/7/20 7:43 AM, Chris Chiu wrote:
> From: Daniel Drake <drake@endlessos.org>
> 
> Sending the switch state change twice within the same frame is invalid
> evdev protocol and only works if the client handles keys immediately as
> well. Processing events immediately is incorrect, it forces a fake
> order of events that does not exist on the device.
> 
> Recent versions of libinput changed to only process the device state and
> SYN_REPORT time, so now the key event is lost.
> 
> Same fix as 'commit <bff5bf9db1c94> ("platform/x86: asus-wireless: send
> an EV_SYN/SYN_REPORT between state changes")'
> 
> Signed-off-by: Daniel Drake <drake@endlessos.org>
> Signed-off-by: Chris Chiu <chiu@endlessos.org>

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
>  drivers/platform/x86/acer-wireless.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/acer-wireless.c b/drivers/platform/x86/acer-wireless.c
> index e0976180532a..1b5d935d085a 100644
> --- a/drivers/platform/x86/acer-wireless.c
> +++ b/drivers/platform/x86/acer-wireless.c
> @@ -28,6 +28,7 @@ static void acer_wireless_notify(struct acpi_device *adev, u32 event)
>  		return;
>  	}
>  	input_report_key(idev, KEY_RFKILL, 1);
> +	input_sync(idev);
>  	input_report_key(idev, KEY_RFKILL, 0);
>  	input_sync(idev);
>  }
> 

