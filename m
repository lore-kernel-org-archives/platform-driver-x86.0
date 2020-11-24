Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE89C2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 12:10:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7FA52076B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 12:10:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RtNRvz8C"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733072AbgKXMKO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 07:10:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54292 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729173AbgKXMKO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 07:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606219812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wUnv+IHMDftcQjA0JBjF2MFD6nD9bm1oMfaBL/SXijg=;
        b=RtNRvz8Cl1VDqfnj3SEzWVZLg7KGEx9FNl6O1LmMaTNOV3Mk8BIYovV2Cz/NRtYLVHf2E1
        8Ynnik99ik4d4u1/JdzcVfulD/BLHnGIKtWBGTFNV84THh+HD2WKbg9oM4AgcbvmFu2lyo
        ePODCmebAWJzlyqaLv5P96lk8wnJyAE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-RY7sOOM9NKioBxXYe2VPrg-1; Tue, 24 Nov 2020 07:10:11 -0500
X-MC-Unique: RY7sOOM9NKioBxXYe2VPrg-1
Received: by mail-ej1-f69.google.com with SMTP id gx12so6727317ejb.18
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 04:10:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wUnv+IHMDftcQjA0JBjF2MFD6nD9bm1oMfaBL/SXijg=;
        b=Q3aAAsbgp9M0WWeNZfNIl0zMMradPzwsdNfC7oXM+sm5VI4v3x/aXltR+VJxRPw4yw
         FITtBIhOXDYbjAsNREySYUH90WjHQ4cAVnsDMmlSx8jorcV49qNwBJ+ADEQatEPgYnbW
         GujLKoyXZ+dkM3BzGsX/6Je8s5aUSyiyJb+8O7Hsrml7yZLQWuw+yl4hTkmZzfcnJ3gK
         cQEfPLGi+xAWdHYU09XuZrab72MuObBKDUiQi6/sI82HJBXrrOMy1WkKv7tw9j520wMF
         LMp5QtRtMhgMPb4rkapg7NRabvyI3MSCDJIeawEvj6PQVZLB08MGeJGkz8A11ENe4uN3
         vwlg==
X-Gm-Message-State: AOAM531Z7rXO0raV7dzOfZYn5ttxRXSqTgRZsa1H/52SMBZPvFepUCHU
        ZQzB5BZf1F3j++Mha6YaXkC72lEBkMsaSDG204puH6LVl8tK3027za1WxZDVGejYD4Bq1nCVhWA
        BG6z8z1xy+KFcIc9eDg0MGHTmnybdbd/Shw==
X-Received: by 2002:a05:6402:1a31:: with SMTP id be17mr3404492edb.377.1606219809299;
        Tue, 24 Nov 2020 04:10:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyE7c3L5xWKutv3UZyQAC4urY5anoXWIxZDDJPTstxAzpfazN3NYht7FbOiT552ww6h44SJvg==
X-Received: by 2002:a05:6402:1a31:: with SMTP id be17mr3404476edb.377.1606219809151;
        Tue, 24 Nov 2020 04:10:09 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id n15sm6906438eje.112.2020.11.24.04.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 04:10:08 -0800 (PST)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Send tablet mode switch at
 wakeup time
To:     Benjamin Berg <benjamin@sipsolutions.net>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Benjamin Berg <bberg@redhat.com>
References: <20201123132157.866303-1-benjamin@sipsolutions.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c8deaf95-6b49-d8d7-6f09-1845ad70f40d@redhat.com>
Date:   Tue, 24 Nov 2020 13:10:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123132157.866303-1-benjamin@sipsolutions.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/23/20 2:21 PM, Benjamin Berg wrote:
> From: Benjamin Berg <bberg@redhat.com>
> 
> The lid state may change while the machine is suspended. As such, we may
> need to re-check the state at wake-up time (at least when waking up from
> hibernation).
> Add the appropriate call to the resume handler in order to sync the
> SW_TABLET_MODE switch state with the hardware state.
> 
> Fixes: dda3ec0aa631 ("platform/x86: thinkpad_acpi: Implement tablet mode using GMMS method")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210269
> Signed-off-by: Benjamin Berg <bberg@redhat.com>

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
>  drivers/platform/x86/thinkpad_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e3810675090a..9104e0ee37cd 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4228,6 +4228,7 @@ static void hotkey_resume(void)
>  		pr_err("error while attempting to reset the event firmware interface\n");
>  
>  	tpacpi_send_radiosw_update();
> +	tpacpi_input_send_tabletsw();
>  	hotkey_tablet_mode_notify_change();
>  	hotkey_wakeup_reason_notify_change();
>  	hotkey_wakeup_hotunplug_complete_notify_change();
> 

