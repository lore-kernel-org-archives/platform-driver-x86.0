Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1C0C64EC4
	for <platform-driver-x86@archiver.kernel.org>; Sun, 19 Feb 2023 13:21:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjBSNVN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 19 Feb 2023 08:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjBSNVM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Feb 2023 08:21:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FFA810AA3
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Feb 2023 05:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676812822;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FAo0frUnBQ/KMCoBAppynTFO2n1HebKGKrAPqbNxh50=;
        b=IdeWM75GOQcT3K4c7lLVTdao9OjyM339FMVOTZ0Emof6MaD36ZBMKbMDa3ELNS6WNu6Psg
        CQxI+uiocoPOiCP0VlU1O9/U5iS8AF6oRrpHNmbRwTR40BMKRSrLSHiRYSmpupnP+P2Jra
        wdKTAXDqi+n3Mikwk5O5hHeazIDXmuc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-Qr5_jQsiMQmZWN0lhdSs8A-1; Sun, 19 Feb 2023 08:20:20 -0500
X-MC-Unique: Qr5_jQsiMQmZWN0lhdSs8A-1
Received: by mail-ed1-f69.google.com with SMTP id v10-20020a056402174a00b004acbe232c03so743247edx.9
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Feb 2023 05:20:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAo0frUnBQ/KMCoBAppynTFO2n1HebKGKrAPqbNxh50=;
        b=DjycEixemp77Kyb/I+6Mczjb9gA2BVfzsLevgUBBQqT0EPgnwW1U3Py3k6sGm6yTq6
         0tlCJb7ieO8oHUVOpGiOkn6GGp/Cq7Vlxxcj6//qriAu80T2KWFeC2DHLt4c7b2mjlcG
         dcOa2HNRXWPkeY6fpQhImMZlgWEHc4nfW9PkwaKdRiBF0iHE+GbzIfX8LzVBRTa9sUkE
         9rf6QFqDN4014ZDUHLhThCIac+pCH+f2mjWcM/mslrdDKoy9CA1hrULzi0rST3sm/rDr
         sua61v+AyeOjXo1m4UGEzAcFoEh2PtaiIUeoMoTsy3WHxEAx83qpKgBQ0F3yjcqqkTXb
         rz5A==
X-Gm-Message-State: AO0yUKXZXPiTucuzdZ32HTxqXXWxzskE9OuI5LNP7Zo6vJ/LnOMVpMuG
        b04UiXOWm+os3GfakGLU4U4yE/YQJcfTyQnmfcx1fX6tjxepudf5VWEdUcz3oZtuHNIiiMeaqHw
        L0V11JTRjHLlEQhvSeVw9i3PF2L8FboWx4A==
X-Received: by 2002:a05:6402:5205:b0:4ac:d9e8:784d with SMTP id s5-20020a056402520500b004acd9e8784dmr3731344edd.19.1676812819474;
        Sun, 19 Feb 2023 05:20:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9oZIcj1/eU7+Ve/IS+MqifpbDMK37HuM881SWJqFniGcm8R0Ryx+ngRwMmtOD+rjV3hFjEWQ==
X-Received: by 2002:a05:6402:5205:b0:4ac:d9e8:784d with SMTP id s5-20020a056402520500b004acd9e8784dmr3731331edd.19.1676812819234;
        Sun, 19 Feb 2023 05:20:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v20-20020a50d594000000b004ad7962d5bbsm3846729edi.42.2023.02.19.05.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Feb 2023 05:20:18 -0800 (PST)
Message-ID: <bd2ae598-3f13-f465-4bde-6ab364b79db3@redhat.com>
Date:   Sun, 19 Feb 2023 14:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: API for setting colors of RGB backlit keyboard zones (was [PATCH
 V3] platform/x86: hp-wmi: Support omen backlight control wmi-acpi methods)
To:     Pavel Machek <pavel@ucw.cz>,
        Rishit Bansal <rishitbansal0@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
References: <20230131235027.36304-1-rishitbansal0@gmail.com>
 <9b761996-d522-b0f8-6472-10e40e09e036@redhat.com>
 <65a11a89-e780-6d60-a40e-cd3245780762@gmail.com>
 <b83ad6ba-7d55-f309-5d7b-4a5ff77ff5a3@redhat.com>
 <02c96cfe-ab10-513f-fc36-f474dd227656@gmail.com>
 <544484b9-c0ac-2fd0-1f41-8fa94cb94d4b@redhat.com>
 <Y+I7xNqkq/X6Lag+@duo.ucw.cz>
 <3c48e204-780c-f78c-8219-267e297dc1e3@gmail.com>
 <ec5bc4a6-dc9f-90dd-0cf6-5fab47bb5fa6@redhat.com>
 <b11185d3-fbf3-a461-39bc-67bee4739e40@gmail.com>
 <Y/C7A9eCjpdbzYbz@duo.ucw.cz>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y/C7A9eCjpdbzYbz@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/18/23 12:48, Pavel Machek wrote:
> Hi!
> 
> 
>>> I do agree with you that we need to avoid kbd_backlight in the name to avoid causing existing upower code to have weird interactions with this (it supports / assumes there is only 1 kbd_backlight LED class device).
>>>
>>> So lets go with just these 4:
>>>
>>> /sys/class/leds/hp_omen::kbd_zoned_backlight-1/
>>> /sys/class/leds/hp_omen::kbd_zoned_backlight-2/
>>> /sys/class/leds/hp_omen::kbd_zoned_backlight-3/
>>> /sys/class/leds/hp_omen::kbd_zoned_backlight-4/
>>>
>>> Using the _zoned_ between kbd and baclight to avoid confusing the existing upower code. Then once this has landed we can look into extending upower support for this.
>>>
>>> Note the requested documentation patch should probably also explain that the _zoned_ was done deliberately to make current upower code ignore the devices.
>>>
> 
>>
>> This makes sense, I agree that the global LED file will cause more confusion
>> and hacks in the code. I'll start working on the  _zoned_ naming scheme with
>> 4 files + documentation changes and make a patch for this soon!
>>
> 
> /sys/class/leds/:rgb:kbd_zoned_backlight-4/ is better than what was
> suggested above.

Ah yes using rgb for the color part of the name makes sense.

> But we already use _1 suffix to deduplicate the, so
> I'm not sure this is best naming.



I guess we could try to actually name the zones, something like
(no idea if this are indeed the 4 zones):

:rgb:kbd_zoned_backlight-main
:rgb:kbd_zoned_backlight-wasd
:rgb:kbd_zoned_backlight-cursor
:rgb:kbd_zoned_backlight-numpad

Rishit any comments on this or improvements to it.

> There are keyboards with per-key backlight. How do you suggest to
> solve those?

I really think those fall into a separate category, currently AFAIK
all support for those use /dev/hidraw directly from userspace.

And any kernel API would need to likely be ioctl based, allowing
setting all the LEDs in a single syscall otherwise setting the
LEDs becomes to expensive / introduces to much latency when
doing software driven animations. So I think the best thing to
do there is to declare these out-of-scope for the classic
sysfs based LED class API.

Regards,

Hans



