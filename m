Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88533C433E6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 20:32:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A64622583
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Jan 2021 20:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732305AbhAYU3k (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Jan 2021 15:29:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21325 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732291AbhAYU3Z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Jan 2021 15:29:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611606475;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3PbpUQC/tS1KWbkQ2XAD7DP4iD+lyhyrZegP2bt4d2E=;
        b=JRRU+/qX8Rfow5Y8AaSwLaYqFKptHMPnrtE7MHQqIc1h3aOPZ+K81zIAJEATYYoz7z1jEr
        8byY7Pr1Nh5aEcErxKBLmFwNG8o0O6XGPAeQHDWlTCPHlES0TdJPSkoBzqvFVri6AcD4mp
        38fAQE7wgfd7bTfVI80SkIdEZ1GEbHE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-MpnOqlvENNWxHWQDuqPkkA-1; Mon, 25 Jan 2021 15:27:53 -0500
X-MC-Unique: MpnOqlvENNWxHWQDuqPkkA-1
Received: by mail-ed1-f72.google.com with SMTP id j11so7392948edy.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Jan 2021 12:27:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3PbpUQC/tS1KWbkQ2XAD7DP4iD+lyhyrZegP2bt4d2E=;
        b=oR9f72VRw5UEtafBz1zYaaSU9efRAhPNcQ+mWHUZLWsh5ZQ16ul8vWKQe30x4gT/Jj
         pXI2U/I6NgwFTbkuUn5lVuu7uYQSzrMvoDANs+H9Ej/PD4Ra4DYDBC4wUFObo5XMz6f9
         CcJ1BVrqJFEMbtbReYeZeoC5iXGZyv6ZF+pOi4hs4AWBiYrj+MPmCQP23NdzpBc/Bu32
         kmRODtj7cwHIR7AFPg3j7VJ8Hd1AVGvehm4vYJ6J9CBML/SCj1v9STKJL4uTRkIbh1H/
         6em5DCyAlMkvc9i9EUvVJopSmgT0WarAmQHT6evr7ihoAtQMwtaeBkJH52qFWrMHN9Bu
         Wcpg==
X-Gm-Message-State: AOAM531tS+CwIWyxciFnOYGZeStakyymwgyXMvJKWYdj39TqiK9ZBX3z
        oC3as5l6vvtxV8fMMtRS3M3ZlT9OTTfg5LV9fSfD43DA6lAacsqFilnr/RgYlDMO9tluMPbUPsa
        G/lcBK88pXMTqL/L9cKTQIxoNZRwg9HeG2Q==
X-Received: by 2002:a05:6402:54d:: with SMTP id i13mr1987239edx.12.1611606472341;
        Mon, 25 Jan 2021 12:27:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNtxfQvski3cCT9swCyjqzd7gBBbyuK6hprYE+juNpnRCFsjG0co8DVE9gQoHEoKpRlb9IMA==
X-Received: by 2002:a05:6402:54d:: with SMTP id i13mr1987230edx.12.1611606472188;
        Mon, 25 Jan 2021 12:27:52 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id k16sm8795489ejd.78.2021.01.25.12.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 12:27:51 -0800 (PST)
Subject: Re: [PATCH 1/4] platform/x86: intel-vbtn: Rework wakeup handling in
 notify_handler()
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Elia Devito <eliadevito@gmail.com>
References: <20210115161850.117614-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0e8551e0-db6b-b9af-a3d6-84d0a83906cd@redhat.com>
Date:   Mon, 25 Jan 2021 21:27:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115161850.117614-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/15/21 5:18 PM, Hans de Goede wrote:
> Rework the wakeup path inside notify_handler() to special case the
> buttons (KE_KEY) case instead of the switches case.
> 
> In case of a button wake event we want to skip reporting this,
> mirroring how the drivers/acpi/button.c code skips the reporting
> in the wakeup case (suspended flag set) too.
> 
> The reason to skip reporting in this case is that some Linux
> desktop-environments will immediately resuspend if we report an
> evdev event for the power-button press on wakeup.
> 
> Before this commit the skipping of the button-press was done
> in a round-about way: In case of a wakeup the regular
> sparse_keymap_report_event() would always be skipped by
> an early return, and then to avoid not reporting switch changes
> on wakeup there was a special KE_SW path with a duplicate
> sparse_keymap_report_event() call.
> 
> This commit refactors the wakeup handling to explicitly skip the
> reporting for button wake events, while using the regular
> reporting path for non button (switches) wakeup events.
> 
> No intentional functional impact.
> 
> Cc: Elia Devito <eliadevito@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've applied this series to my review-hans branch now, so this will
show up in for-next soon.

Regards,

Hans

> ---
>  drivers/platform/x86/intel-vbtn.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index 30a9062d2b4b..e1bb37a03ba3 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -131,22 +131,17 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  
>  	if (priv->wakeup_mode) {
>  		ke = sparse_keymap_entry_from_scancode(priv->input_dev, event);
> -		if (ke) {
> -			pm_wakeup_hard_event(&device->dev);
> -
> -			/*
> -			 * Switch events like tablet mode will wake the device
> -			 * and report the new switch position to the input
> -			 * subsystem.
> -			 */
> -			if (ke->type == KE_SW)
> -				sparse_keymap_report_event(priv->input_dev,
> -							   event,
> -							   val,
> -							   0);
> +		if (!ke)
> +			goto out_unknown;
> +
> +		pm_wakeup_hard_event(&device->dev);
> +
> +		/*
> +		 * Skip reporting an evdev event for button wake events,
> +		 * mirroring how the drivers/acpi/button.c code skips this too.
> +		 */
> +		if (ke->type == KE_KEY)
>  			return;
> -		}
> -		goto out_unknown;
>  	}
>  
>  	/*
> 

