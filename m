Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9B6C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 14:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58C2F64E5A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 Feb 2021 14:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhBOOaI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 Feb 2021 09:30:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49154 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229627AbhBOOaF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 09:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613399316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/6ExkZJh7aS4LgSRXEwsvG8E7a1TrPw1bCHDFElsQUA=;
        b=Y0ZvwQUQUJ2iKgZSUByw8mgt3YlEEo3SrIM9qd5Yc6WGLutvNSpvK8k9z7VMf/Y9is6A1a
        qQU0/Mhr9A1qrk8j5s6cbaoQSkND9eFi6r9dtVWgw/Bs0Ig08bsq3kJKzOYyEI9ZsK3RJw
        oxYY4pdXSHAR82ZXNJdsdGMKzYkksak=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-5mWPkb8BPtCSqyDntFUhjw-1; Mon, 15 Feb 2021 09:28:33 -0500
X-MC-Unique: 5mWPkb8BPtCSqyDntFUhjw-1
Received: by mail-ej1-f72.google.com with SMTP id p15so4405399ejq.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 06:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/6ExkZJh7aS4LgSRXEwsvG8E7a1TrPw1bCHDFElsQUA=;
        b=oej7eCw45jRkWXaJekAvVKX+f/YqaoqBh8WMjsLOhs4+RegAbrzm9+DkAuMWBht4Bn
         kuW3TmjI835465CPaoJurWHCh0hygrNexso2krnsGXdXHeB8kWFXT2iCAjrsCn2TlXIN
         siJtgMMU8XPpfoacNQfUE9JTtFgen3xwFIsJMG2jQal3xlcsIbRzcXc3jG/D4dnKrPv9
         +S6rtv92xlbmpTycLBxIrBgl4JmvQ0pJFRQE5+YVDNL/rB/Q2m2m5uLX3r2NEaLRrnjI
         wuZHwUMfxtqdolZgF57tVrxMsLZpCxLc+7yVQgZf/u0IhCnLz7Aqg1BKxORhfSef08ok
         DeXg==
X-Gm-Message-State: AOAM533JnjIO6oAMAf3QP/YZrT+sil2xE7irkZW9RtQYTQtscXvPLRpw
        UqkXSpL5katKPcBx96INWSpiCwDRiq/ILEXprYm8bmlzFo/6FHAcKl3aFWrNz99QkLEjMN+6z0d
        jedf3JL1B8naLgXjyYCYDWGB7EXsSSKFNEg==
X-Received: by 2002:aa7:c94a:: with SMTP id h10mr16501267edt.41.1613399312359;
        Mon, 15 Feb 2021 06:28:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBY9NcWPR0QeGNI4r5BtB/2r6CydGfmwmf1eGXOpI6i8hqFOUQSml53rVPpORhyLxlxQW0tQ==
X-Received: by 2002:aa7:c94a:: with SMTP id h10mr16501256edt.41.1613399312219;
        Mon, 15 Feb 2021 06:28:32 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r11sm10193729edt.58.2021.02.15.06.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 06:28:31 -0800 (PST)
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Handle keyboard cover
 attach/detach events
To:     Alexander Kobel <a-kobel@a-kobel.de>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
References: <83a0e45f-590d-0c7d-0afd-00a5a6322bd0@a-kobel.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2cc9451c-5f54-b986-49d5-dce192c82bf7@redhat.com>
Date:   Mon, 15 Feb 2021 15:28:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <83a0e45f-590d-0c7d-0afd-00a5a6322bd0@a-kobel.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/13/21 4:13 PM, Alexander Kobel wrote:
> Those events occur when a keyboard cover is attached to a ThinkPad
> X1 Tablet series device.  Typically, they are used to switch from normal
> to tablet mode in userspace; e.g., to offer touch keyboard choices when
> focus goes to a text box and no keyboard is attached, or to enable
> autorotation of the display according to the builtin orientation sensor.
> 
> intel-vtbn already recognizes those events.  To avoid sending duplicate
> events to userspace, they are simply ignored.  Thus, this patch only
> avoids warnings about unknown and unhandled HKEYs 0x4012 and 0x4013.
> 
> For more information about the background and potential improvements for
> different types of attachment options, such as the Pico cartridge dock
> module, see
> https://lore.kernel.org/platform-driver-x86/38cb8265-1e30-d547-9e12-b4ae290be737@a-kobel.de/
> 
> Signed-off-by: Alexander Kobel <a-kobel@a-kobel.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Note I will merge this into my review-hans branch and eventually pdx86/for-next
once 5.12-rc1 is released.

Regards,

Hans



> ---
>  drivers/platform/x86/thinkpad_acpi.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c404706379d9..e16d4b804c92 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -174,6 +174,12 @@ enum tpacpi_hkey_event_t {
>  						     or port replicator */
>  	TP_HKEY_EV_HOTPLUG_UNDOCK	= 0x4011, /* undocked from hotplug
>  						     dock or port replicator */
> +	/*
> +	 * Thinkpad X1 Tablet series devices emit 0x4012 and 0x4013
> +	 * when keyboard cover is attached, detached or folded onto the back
> +	 */
> +	TP_HKEY_EV_KBD_COVER_ATTACH	= 0x4012, /* keyboard cover attached */
> +	TP_HKEY_EV_KBD_COVER_DETACH	= 0x4013, /* keyboard cover detached or folded back */
>  
>  	/* User-interface events */
>  	TP_HKEY_EV_LID_CLOSE		= 0x5001, /* laptop lid closed */
> @@ -3990,6 +3996,23 @@ static bool hotkey_notify_dockevent(const u32 hkey,
>  		pr_info("undocked from hotplug port replicator\n");
>  		return true;
>  
> +	/*
> +	 * Deliberately ignore attaching and detaching the keybord cover to avoid
> +	 * duplicates from intel-vbtn, which already emits SW_TABLET_MODE events
> +	 * to userspace.
> +	 *
> +	 * Please refer to the following thread for more information and a preliminary
> +	 * implementation using the GTOP ("Get Tablet OPtions") interface that could be
> +	 * extended to other attachment options of the ThinkPad X1 Tablet series, such as
> +	 * the Pico cartridge dock module:
> +	 * https://lore.kernel.org/platform-driver-x86/38cb8265-1e30-d547-9e12-b4ae290be737@a-kobel.de/
> +	 */
> +	case TP_HKEY_EV_KBD_COVER_ATTACH:
> +	case TP_HKEY_EV_KBD_COVER_DETACH:
> +		*send_acpi_ev = false;
> +		*ignore_acpi_ev = true;
> +		return true;
> +
>  	default:
>  		return false;
>  	}
> 

