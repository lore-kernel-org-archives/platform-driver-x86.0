Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860A5C88CB4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Jun 2023 10:28:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238776AbjFMK2v (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Jun 2023 06:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239938AbjFMK2r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2023 06:28:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFFB3E69
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686652080;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VjOh3j42VnEHvBh9X73UN1iWeAfBCJGoPl2D5dCUXYo=;
        b=c4D9sYW72b1zLsbdmtcQiLkKfQbOfI4W5wf6lV+iveh0YuYP5IqQa+oxtmoIpJy6QB89Tn
        +VeK9hmKAPFK7V21/wKl3a27YCgYFXQwvnMiID4nHa65lCXsFz9ehXyoEyTTlN8eOqaIfV
        1VPAiboP8wgp8nTRQqk4b6pzReZQ++Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-clkMyEvjPmucvfDSQU1i4Q-1; Tue, 13 Jun 2023 06:27:58 -0400
X-MC-Unique: clkMyEvjPmucvfDSQU1i4Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-977cc772639so475541266b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 03:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652077; x=1689244077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjOh3j42VnEHvBh9X73UN1iWeAfBCJGoPl2D5dCUXYo=;
        b=azDQgJPw4CSR43UsJuGJRtu8JjtukkYqzjRu3EifkG1Lv4Jt2IOFAJpVLjGW4sQ33t
         NfgMPUDeAV2ZIHvBjok4uEHtQDCLQxIF5mRp18Oe7+lE51PhB8qdWgZ5sG4081ETHG5d
         C286qNTrcgYGOpYBu4kpTzV+oUXLyYQoWr+f5e6LR+YTVU1tayp6irZPdEqOALnB7Iac
         7WR6n09Jo8CfeTS02UFsLcBpHrSMDTrJVQiXtibxPnFb4gyOH6n8rhnvW7fHKkihbd2I
         eg+BEizc1qd9P7VxvBOIfwpGEmnGxGGjP3ZIBWjVNeBo4ZIQIMf+8jOSR+f1NbKF2XGL
         GlEg==
X-Gm-Message-State: AC+VfDwZ5yhQSqjlcszY4SfGvl6Zb2I6zAfJFs+93O2/MGyfEp2e48Z9
        kE69cI2u5BshWBtCKIuMot8c+n5tKD97h4SpQT37RLkytxw8RkFY2y2jx7zGOHhCiCV4/kUd643
        WSZYgBMT2LN1zuVKpi37kbrIBteMiHK+o9g==
X-Received: by 2002:a17:907:a48:b0:96f:e2c4:a063 with SMTP id be8-20020a1709070a4800b0096fe2c4a063mr11910782ejc.33.1686652077664;
        Tue, 13 Jun 2023 03:27:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4mVxo/w4Lp23PWKiz0By6Qg6RhSIQ7iSW/2m5DAqiJ2IGHvP8ROkjIDiGfiT7GVH0bqID9Ow==
X-Received: by 2002:a17:907:a48:b0:96f:e2c4:a063 with SMTP id be8-20020a1709070a4800b0096fe2c4a063mr11910771ejc.33.1686652077342;
        Tue, 13 Jun 2023 03:27:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kg6-20020a17090776e600b009661484e84esm6424110ejc.191.2023.06.13.03.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 03:27:56 -0700 (PDT)
Message-ID: <5db606f4-c9ec-43a8-1c0d-16e1673668a7@redhat.com>
Date:   Tue, 13 Jun 2023 12:27:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/1] platform/x86: asus-wmi: add support for ASUS
 screenpad
Content-Language: en-US, nl
To:     Luke Jones <luke@ljones.dev>
Cc:     platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        linux-kernel@vger.kernel.org, acpi4asus-user@lists.sourceforge.net,
        corentin.chary@gmail.com, markgross@kernel.org, jdelvare@suse.com,
        linux@roeck-us.net
References: <20230505043013.2622603-1-luke@ljones.dev>
 <06314c8dc4adeb69cd7801f9621c831f75a37c89.camel@ljones.dev>
 <ffdd2d13-975e-1c74-0d2b-132ba461a3ee@redhat.com> <5946924.lOV4Wx5bFT@fedora>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5946924.lOV4Wx5bFT@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/7/23 00:45, Luke Jones wrote:

<snip>

>> I must admit I've lost track a bit of the state of v2 during this
>> discussion.  Can I pick up v2 as is, or were there (other) remarks
>> which need addressing and should I expect a v3 ?
> 
> There will be a V3. I don't anticipate any issues at all with this, and some 
> folks have been using this patch with Gnome and KDE since V2 was submitted.

Ok.


>> ####### Switch to (off-topic) GPU mux discussion ########
> **snip**
>>>> I think the best thing to do here is to just use EFI on machines like
>>>> this. That or put grub in text mode so that it makes BIOS calls to
>>>> display text. Using GRUB_TERMINAL_OUTPUT=gfxterm combined with
>>>> classic BIOS booting will make grub try to directly drive the gfx
>>>> card itself and I'm not surprised that it gets that wrong in this
>>>> case.
>>>> Note I think that just using EFI is prefered over switching grub to
>>>> GRUB_TERMINAL_OUTPUT=console. I would expect
>>>> GRUB_TERMINAL_OUTPUT=console to also work but I'm not sure. I don't
>>>> think that the classic BIOS boot stuff is still tested by laptop
>>>> vendors and esp. not tested with non standard BIOS settings ...
>>>
>>> The grub gfx mode is GRUB_TERMINAL_OUTPUT="console", fedora default in
>>> all cases here. Grub itself shows fine when the MUX mode is in dgpu
>>> mode (aka, internal display connected to dgpu).
>>
>> Ah ok, so I misunderstood and the problem only happens *after* grub?
>>
>> Have I understood that correctly?
>>
>> And this is on Fedora with the nvidia binary driver ?
>>
>> The problem then likely is that the nvidia binary driver is not in
>> the initrd (which is by design since it may need to be rebuild on
>> a driver update while the kernel is kept at the same version,
>> so the initrd won't be rebuild).
> 
> That was indeed the issue. It also creates new problems for when a user wants 
> to use iGPU only via the plain (and frankly not adequate or good) method of 
> simply removing the dGPU from the device tree.
> 
> Currently I maintain the supergfxd tool which is a lot more advanced than the 
> other gpu switchers around, and I expose both the above method, and also PCI 
> hotplug, and the ASUS WMI method (which I now think is used by other vendors 
> also). Hotplug and Asus method can force the device off, and it can't be 
> brought back by a PCI rescan - but to do so safely the Nvidia drivers must be 
> unused and unloaded. I guess I'll need to tweak the boot process of supergfxd 
> and block things until this is done.
> 
> Maybe we can move this to a new topic, because there looks to be a few things 
> to discuss in relation to hybrid laptops, and specifically Nvidia with MUX, 
> and Advanced Optimus.

Yes if you want to discuss this further please start a new mailinglist
thread for this and also please put the dri-devel list on the Cc:

dri-devel@lists.freedesktop.org

Regards,

Hans


