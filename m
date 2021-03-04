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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E128C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 11:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 330C464F2C
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 11:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239355AbhCDLEb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 06:04:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31379 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239495AbhCDLES (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 06:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614855773;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TeTuaov9fAJxrBVHDiNBKXTfzaU3lQUjgJbMXtZKcgw=;
        b=PwOURl4dV8yMM948Pr0zqL2VKPiDkfyGSwCXrVCHoSM6/Ol9TwTnKzJeh5nmnkCTnU1WMw
        Y5JwyRrrbYIGjdhoPAJOiceYhw9Ds41FiU2/EOSfLN5GAEVY9RbkkM8g1i+N5luqg7UWji
        YhcYY5QEubhLjb/JlURewmgDPeQbVZw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-OZtpD7PiOySWDH_fAiolZg-1; Thu, 04 Mar 2021 06:02:51 -0500
X-MC-Unique: OZtpD7PiOySWDH_fAiolZg-1
Received: by mail-ed1-f69.google.com with SMTP id l23so13961968edt.23
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 03:02:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TeTuaov9fAJxrBVHDiNBKXTfzaU3lQUjgJbMXtZKcgw=;
        b=Ysf4rsMgmyNq/+OvzlIxxYmt6lvXV+ifOWTEDjfX5vk/daeCT+xwL1DUnP70dKbNGh
         +EIMzS1JuNXwThoQYnhOFzuMFuLFQkCfVQ+t4owPaBzOAXB/lXV9vxW0QyY4GscTKh8R
         8f5ONfDiA4djqhlnHdV0FyCPYLyv9f0TMybhd2vWA5XU9mAlfF75KWV/UnaqjGksDVGD
         q+3cAbRoYUVB1N6eFAjVVs+zgO6JHJtgu1BBTMPRCSnofC6VYodMpTMM1KZLqysfGVNq
         m6KZ0sy4K/JtH2DJO8OihNmDkMHfI1E3r/MraiQE/9mAv18igazasQ3r8AEwvbStKlio
         zxJQ==
X-Gm-Message-State: AOAM532n/MiIRV0vnQI8s+STe0KOF1/f05Mx5Z+mZjFtQEg9757SSGQR
        9UiOq1eoC+eguHQBs1WUb4bXpO1PKjCB0CQX+lMSaC3nRRu/8xmRp9qIkFwe0niVUe81BhWWlcn
        iVWZhJSA07dO4WMFUXUELaTdlo7fthiBIhw==
X-Received: by 2002:a17:907:2642:: with SMTP id ar2mr3595505ejc.145.1614855769890;
        Thu, 04 Mar 2021 03:02:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx412VKu7r0Q0+XMhgu1IPDSDWwRE18DyyeKqB19jTs+2bA18vNSdr0dp+Y71NNaXg881fU6Q==
X-Received: by 2002:a17:907:2642:: with SMTP id ar2mr3595484ejc.145.1614855769665;
        Thu, 04 Mar 2021 03:02:49 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y12sm17277776ejb.104.2021.03.04.03.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 03:02:48 -0800 (PST)
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Handle keyboard cover
 attach/detach events
To:     Alexander Kobel <a-kobel@a-kobel.de>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
References: <83a0e45f-590d-0c7d-0afd-00a5a6322bd0@a-kobel.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b707cf36-3d90-90cb-0847-0a50282bfeb3@redhat.com>
Date:   Thu, 4 Mar 2021 12:02:48 +0100
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

