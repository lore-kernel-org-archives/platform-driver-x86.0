Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F98FC2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 11:15:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27E072073C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 11:15:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TcjPDVn6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732325AbgKXLOd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 06:14:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31993 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726623AbgKXLOc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 06:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606216471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yd6u61JeVXpJKhzUZOhVWbt3AKbWzm0GKsXnNCLjTq4=;
        b=TcjPDVn6/J2BF2L/1Npy24sXpril9kENFAxqsHQ6TQbCqcdsdqkmiMX9f3zAofemkIrt5m
        xbQOUxiHEmi1bCQsZ72572iMaaUmAEK9b6ACLGs0LOrkilQink0IKLtLGB0r+4/3QbO718
        Xl1kBD4WSXmfYIIZIYArtNktdBnprVU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-vIQ6B8nfOsahxVPYfo9y_A-1; Tue, 24 Nov 2020 06:14:28 -0500
X-MC-Unique: vIQ6B8nfOsahxVPYfo9y_A-1
Received: by mail-ed1-f71.google.com with SMTP id l12so7745284edw.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 03:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yd6u61JeVXpJKhzUZOhVWbt3AKbWzm0GKsXnNCLjTq4=;
        b=bNGYyxZ8rSpF9ScUP5twpxBRQBzXCGG1tZrSnxRs9z6MzCSHaT9l4WQohTwidhlkVu
         K9w+VlvYI3/RVeH+4M0pUMMUhIC/vQeNKsHb36pnHuHXw02DJBAydjoLdzqmdk3OuenD
         7WWOjOfxpoIEj2DpTiB5UZQBekRIVeeZ+nYv3jUlRpb5klscXHVaOISIod6qJitXCxzA
         uMYvchCoQN1QyCFpmfJ6gZgWk6szh2Otxqt4UtRMXMtamYi6fLcdLgoisnRwJa6bti72
         uypMDTmDCJTqmKUuyz7HZW8CeI1ebawTSLjEY2IUgqQ0VPAiwEnz0+17GTxL4N/xIwTd
         CmlQ==
X-Gm-Message-State: AOAM532pUUEGz5LZOgwCCuBW/j6owKsEMQj3MQS7ZLv9TBQbOqWi7yxU
        iMRXPLNaRYqTevV5LHoOZZFWGjb2WzzZl+50P2PVDHFZZZoJesfs3bVIAokNV3p9PQUiIC5J6SF
        SLo9mYayOGhCUUZ6RXDawbaDP8W7FaZyYng==
X-Received: by 2002:a17:906:bcd4:: with SMTP id lw20mr3521762ejb.527.1606216467287;
        Tue, 24 Nov 2020 03:14:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPivklBN4gUC+11PHYgUIfXk6A8lB3JdY7ILCGUcneZxv3prt6cbUZx96fNL64Odei3+v+Gw==
X-Received: by 2002:a17:906:bcd4:: with SMTP id lw20mr3521749ejb.527.1606216467115;
        Tue, 24 Nov 2020 03:14:27 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id w9sm5386334edv.46.2020.11.24.03.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 03:14:26 -0800 (PST)
Subject: Re: HP Zbook studio G5 Brightness and mic mute keys give same
 scancode
To:     Friso Smit <thestroyer@cock.li>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>
References: <d2753cb4ca4d0d819d5a76b0a076e281@cock.li>
 <CAHp75VfTXieJws5gB70L5grsc0f_SFo+sNv1ySmt37aOUa6TmA@mail.gmail.com>
 <97c507c1-21a9-2b77-5d07-09cfcd93ca39@redhat.com>
 <1dbe090f-03c4-f003-6c38-c139c38313e2@cock.li>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <52f754d9-f4c4-9a5b-82b4-6d6878a94eec@redhat.com>
Date:   Tue, 24 Nov 2020 12:14:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1dbe090f-03c4-f003-6c38-c139c38313e2@cock.li>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/12/20 7:25 PM, Friso Smit wrote:
> Hi,
> 
> I'm not sure if you have read the previous mails in this thread, but the
> problem is solved, at least for me, with a bios update.

At that is good to know.

> I don't know how
> it works exactly, but all keys produce different scan codes now. Are there
> still some models where this is a problem?

Yes this is till a problem on at least the hp-pavilion-cx-0598na, see
the mail thread starting here:

https://lore.kernel.org/platform-driver-x86/CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com/

I've just asked the reported of that problem to check if there is a BIOS
update for his system.

Regards,

Hans




> On 11/9/20 2:44 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 11/5/20 5:47 PM, Andy Shevchenko wrote:
>>> +Cc: subsystem maintainers
>>>
>>> On Sun, May 17, 2020 at 2:24 PM <thestroyer@cock.li> wrote:
>>>> Hi,
>>>> On my HP Zbook studio G5 a few keys on my keyboard give the same
>>>> scancodes. Most notably, the brightness and mute function keys all give
>>>> the scan code sequence 0xe0 0x20 0xe0 0xa0 as reported by showkey
>>>> --scancodes. It only produces a scancode when pressed, not when
>>>> released. I found another very similar issue in this mailing list found
>>>> in https://www.spinics.net/lists/platform-driver-x86/msg16791.html. The
>>>> issue in that mail was solved by a bios update. I'm running the latest
>>>> bios, but I still have the issue.
>>>> I tried the kernels: Manjaro 5.7rc4-1, Manjaro 5.6.11-1 and Manjaro
>>>> 5.4.39-1
>>>> I also tried a few other distributions, but they all have the same
>>>> issue.
>>>> I'm happy to provide more information about this issue if needed.
>> So this already came in another thread for another HP laptop model,
>> this seems to be a common issue on some (newer?) HP laptop models.
>>
>> It seems that we need to make some special WMI calls for this, either
>> to figure out which key is actually pressed when receiving the
>> PS/2 scancode which is shared between multiple keys. Or to get the
>> device to send different scancodes.
>>
>> This will require someone with some knowledge of ACPI/WMI as well
>> as of writing kernel code to get physical access to an affected HP
>> laptop to figure out what is going on and write some code to deal with
>> this special setup.
>>
>> Regards,
>>
>> Hans
>>

