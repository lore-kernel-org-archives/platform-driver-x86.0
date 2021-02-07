Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF71DC433E6
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Feb 2021 17:11:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB50364DE8
	for <platform-driver-x86@archiver.kernel.org>; Sun,  7 Feb 2021 17:11:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhBGRLu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 7 Feb 2021 12:11:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50238 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229935AbhBGRLj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 7 Feb 2021 12:11:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612717810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7AKXPSddimIqqX5bObH7N0NI2/GWrzHYrHBlSWdx4xU=;
        b=AfgIkZdNVv8OsfItY+kId4Ln60axstlorCbMqkG7NObTXZscrfoW4KxD1pg07V/+IzNBso
        dtAqCdrGkBPn420l8AqHkmTOjhHylwyxWNStRmcl5pasX9oaVOot2e99jqp3W4axeOWQjg
        5BwuzVTU9beVMpshdczUqWJncT3N0us=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141--jOldkvOOfeomw-xfdRuzw-1; Sun, 07 Feb 2021 12:10:09 -0500
X-MC-Unique: -jOldkvOOfeomw-xfdRuzw-1
Received: by mail-ed1-f69.google.com with SMTP id t9so11816245edd.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 07 Feb 2021 09:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7AKXPSddimIqqX5bObH7N0NI2/GWrzHYrHBlSWdx4xU=;
        b=ZIlXRtgYZIWSS8QJwI4x+yTCX+ds40BqQEHZq8z8mjnKRWfg258LPbrEkgTVnws45B
         1XoRLQxjJoEbC/r7pgTD1Ti/D64nNdoCxn7ehTZs9OLezrn3ls/L81MAUA7PVeYEc4TZ
         o4ftDTK72fzlWN3C7sb2Hx/StpRbg+tstR8TqVy5WlHrad0Q1DVxP3hpnk182VAXTgzr
         GdsVwK2bbRfOwgnCnfk4ftPpz1419TJUxTuyiaqGpX4M3b/mzDvLB6NrQIrQqGcCuOkD
         toUrfRtvYcRGr9fbMxHTnbplIqOhbLGQlhHDweatjl8MylBVzySVW3XBTiVxF+LPUXQr
         FReg==
X-Gm-Message-State: AOAM530pcVneoCBLgrMzTTV4c920853Qj69oyxdH8ML8vgrh2NWMq52d
        a/bmjmsX9YWSWTv9DUUlFwUlTLmjjz731fA4AHEzMK0b9e/ZKulikSP1ReeswfEnBvwXvayVhsO
        9Z09N3BsLryI13nZ9ePjvXIFAAIeXSaskTA==
X-Received: by 2002:a50:cbc7:: with SMTP id l7mr7459880edi.134.1612717807772;
        Sun, 07 Feb 2021 09:10:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwz6N4UMJvr16YEMw1l2JK2WFHXnWo+zFXThvA1DrWrj20X1kzw8qKf0IF5c5H/VnK/TbjQ6w==
X-Received: by 2002:a50:cbc7:: with SMTP id l7mr7459865edi.134.1612717807589;
        Sun, 07 Feb 2021 09:10:07 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h25sm7053829ejy.7.2021.02.07.09.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Feb 2021 09:10:07 -0800 (PST)
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: handle HKEY 0x4012, 0x4013
 events
To:     Alexander Kobel <a-kobel@a-kobel.de>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <mpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>
References: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
Date:   Sun, 7 Feb 2021 18:10:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/7/21 5:34 PM, Alexander Kobel wrote:
> Those events occur when a keyboard cover is attached to a ThinkPad
> Tablet device.  Typically, they are used to switch from normal to tablet
> mode in userspace; e.g., to offer touch keyboard choices when focus goes
> to a text box and no keyboard is attached, or to enable autorotation of
> the display according to the builtin orientation sensor.

Thank you for your patch.

> No attempt is taken to emit an EV_SW event for SW_TABLET_MODE; this is
> left to userspace.

I don't understand this part, in order for userspace to respond to these
events the thinkpad_acpi driver needs to emit events for this; and emitting
SW_TABLET_MODE seems like it is the right thing to do.

Why are you not doing this ?

Note that it is important to only advertise SW_TABLET_MODE functionality
on devices where it actually works. Which might be challenging I guess...

But we have contacts inside Lenovo now, so perhaps they can help.

Mark, Nitin, is there a way for the thinkpad_acpi code to figure out
if 0x4012 / 0x4013 events will be send by a device?

Also is there a way to get the current state of the
keyboard-cover being attached at boot or not ?

Regards,

Hans



> So this patch is mainly to avoid warnings about
> unknown and unhandled events, which are now reported as:
> 
> * Event 0x4012: attached keyboard cover
> * Event 0x4013: detached keyboard cover
> 
> Tested as working on a ThinkPad X1 Tablet Gen 2, 20JCS00C00, and as
> non-interfering with a ThinkPad X1 Carbon 7th, 20QESABM02 (normal
> clamshell, so it does not have a keyboard cover).
> 
> Signed-off-by: Alexander Kobel <a-kobel@a-kobel.de>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c404706379d9..fd5322b5bbbd 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -174,6 +174,8 @@ enum tpacpi_hkey_event_t {
>                                                      or port replicator */
>         TP_HKEY_EV_HOTPLUG_UNDOCK       = 0x4011, /* undocked from hotplug
>                                                      dock or port replicator */
> +       TP_HKEY_EV_KBD_COVER_ATTACH     = 0x4012, /* attached keyboard cover */
> +       TP_HKEY_EV_KBD_COVER_DETACH     = 0x4013, /* detached keyboard cover */
> 
>         /* User-interface events */
>         TP_HKEY_EV_LID_CLOSE            = 0x5001, /* laptop lid closed */
> @@ -3989,6 +3991,12 @@ static bool hotkey_notify_dockevent(const u32 hkey,
>         case TP_HKEY_EV_HOTPLUG_UNDOCK: /* undocked from port replicator */
>                 pr_info("undocked from hotplug port replicator\n");
>                 return true;
> +       case TP_HKEY_EV_KBD_COVER_ATTACH:
> +               pr_info("attached keyboard cover\n");
> +               return true;
> +       case TP_HKEY_EV_KBD_COVER_DETACH:
> +               pr_info("detached keyboard cover\n");
> +               return true;
> 
>         default:
>                 return false;
> --
> 2.30.0
> 

