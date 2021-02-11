Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804B2C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Feb 2021 16:29:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4620464E92
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Feb 2021 16:29:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhBKQ2n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Feb 2021 11:28:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46906 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231912AbhBKQ03 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Feb 2021 11:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613060702;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vebezmOkv8hZ8zX7JolpKS2EQqSZ4415FxCXyRy+wiM=;
        b=bB/KQ0pNA4SJBtywFouftO+FJLVUW8ecdyTs3dX30enb/AvJmaKSBKOliAqtq3gI6cY3H7
        doFhXh6ZYXk253CgRn4ihkGWzQ4r67FjdR8580DFW8Vgx0Wc5N0sWjfKNJHaj8ZjSuMcWM
        v15lbhvr/z+BzC//75cXLCf3gGaIAdk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-AK7f44ZmPjKVcPzOA07WbA-1; Thu, 11 Feb 2021 11:25:00 -0500
X-MC-Unique: AK7f44ZmPjKVcPzOA07WbA-1
Received: by mail-ej1-f69.google.com with SMTP id eb5so5053921ejc.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Feb 2021 08:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vebezmOkv8hZ8zX7JolpKS2EQqSZ4415FxCXyRy+wiM=;
        b=KwW/xWC89SNdE0CiOJ8SqrvyiWTlswMc7YkenvFIxnnFBq+qP9z9E4K8wU5RWCXsWg
         UjjF3OMRNkusXWDrKf8ygCx7WH00emLrw1hTcpA4OWegSEADayj3E15vI0Bx7xqvcGDq
         Lm/7BiSi7BfDckZSLNvTAKOII5zPXLwYVhPagxtmdyAiJh86Nw6jD294wdmCd5g8Pvkf
         evhqr89m0I9TCVEBlwphELcU+616yEK0QpzTMJKvgLfc85zyOqbjiA+bXrVkuN20YBx4
         l2K/rzBxFTW8JQC7UyWsy0+OuqOpPuW8D7pU/9mamg8uQI0oDURUbMZt+2SeDUiGoprb
         xZHw==
X-Gm-Message-State: AOAM533rqm1sAPaknc3MuxV/aPw+JYnm/IAYmNx/mJee/Dv0NiCUSyg+
        /YOqATi6DDKtqc1vFeco6jpDRrQ99LlsgHUo232n+hQ14x69Pdff7OAqk/mayn/08Q8AZeD0ysh
        gfBQDILkymKF7U4+l9fA3fMwqzUA8Oro1hQ==
X-Received: by 2002:a17:907:7347:: with SMTP id dq7mr9433403ejc.385.1613060698700;
        Thu, 11 Feb 2021 08:24:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHJ3RZ256+iCLM+P8vYMFjuAm/I6qwusSSTUKQUfjoDaEX4X4VyWRWIBbbv9VgN2B/Nkqvnw==
X-Received: by 2002:a17:907:7347:: with SMTP id dq7mr9433385ejc.385.1613060698464;
        Thu, 11 Feb 2021 08:24:58 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ze12sm4883200ejb.18.2021.02.11.08.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 08:24:57 -0800 (PST)
Subject: Re: [External] Re: [PATCH] platform/x86: thinkpad_acpi: handle HKEY
 0x4012, 0x4013 events
To:     Alexander Kobel <a-kobel@a-kobel.de>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <mpearson@lenovo.com>
References: <53abdd94-8df4-cc1c-84e9-221face6b07c@a-kobel.de>
 <9d133a27-751a-a436-d255-3dd4a7d411d8@redhat.com>
 <TY2PR03MB3645D33506D85E1EECD6DABA8C8F9@TY2PR03MB3645.apcprd03.prod.outlook.com>
 <0e85bd26-bf2f-734c-1334-15ad591ec811@redhat.com>
 <499bd1fb-159b-53b0-173e-90167a2d23fa@a-kobel.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7f40435e-4287-fc67-55d1-52ee41efcbf0@redhat.com>
Date:   Thu, 11 Feb 2021 17:24:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <499bd1fb-159b-53b0-173e-90167a2d23fa@a-kobel.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Alexander,

On 2/10/21 6:51 PM, Alexander Kobel wrote:
> Hi Hans, Nitin,
> 
> thanks a lot for your help.
> 
> On 2/8/21 10:04 AM, Hans de Goede wrote:
>> <snip>
>> Alexander, so it looks like we need to do the following to support this properly:
> 
> Spot on. Thanks for the detailed guide; I wouldn't have been able to get there in due time without your advise.
> I will send the revised patch in a separate mail, but want to highlight few points.
> 
>> 1. At a new TP_HOTKEY_TABLET_USES_GTOP to the hotkey_tablet enum
>> 2. At probe time in hotkey_init_tablet_mode add a new if / case with I guess
>>    the highest prio (so try before GMMS) which does:
>>    1. Call GTOP with parameter 0x0000, check return equals 0x0103 (or newer?)
>>       Nitin, how should the version check look like here, check that the
>>       upper byte == 0x01 and the lower byte >= 0x03 ?
> 
> Exactly.
> 
>>    2. Call GTOP with parameter 0x0100, check return value equals 4
> 
> I also included the simpler "any type" interface which does not report folding to the back. I confirmed that it works on my X1 with limited functionality, but don't have a "any type" device to test available. (In fact, I don't know whether such a device even exists.) IIUC it can also easily cover type 2 "Helix" and type 3 "Thinkpad 10" with the functionality available on those types. Since I cannot test, I didn't enable that in my patch; but it should be a matter of checking for return values 2 and 3 and adding an appropriate case in hotkey_get_tablet_mode.
> By the way, Nitin kindly confirmed that I can translate the GTOP reference sheet to source code comments, and provided the mapping between type 2, 3, 4 and series "Helix", "Thinkpad 10" and "X1 Tablet".
> 
>>    3. Call GTOP with parameter 0x0200, set in_tablet_mode based on bit 0
>>       and bit 16. I think we should report SW_TABLET_MODE=1 when the thin-kbd
>>       is attached, but folded to the back
> 
> Right.
> 
>> 3. Make hotkey_get_tablet_mode support the new TP_HOTKEY_TABLET_USES_GTOP case and
>>    make it call GTOP with parameter 0x0200 and check bit 0 + bit 16
>> 4. On the events which you identified call tpacpi_input_send_tabletsw()
> 
> Works like a charm.
> I realized that the device also emits 0x60c0 (TP_HKEY_EV_TABLET_CHANGED) when the keyboard cover is attached or detached, yet *not* when it's folded. I don't quite get why I nevertheless receive only one notification to userspace according to acpi_listen, despite the fact that the 0x60c0 handler also calls tpacpi_input_send_tabletsw and hotkey_tablet_mode_notify_change. Is there a deduplication behind the scenes?

Yes the input subsystem layer will not send events when nothing has changed.

> I also realized that intel_vbtn reports the change, too. Would it be in order to modify intel_vbtn in a next step and blacklist this device to avoid duplicates?

Hmm, that is a bit of a problem I would prefer to avoid having to deny-list things in intel_vbtn.

So do the 2 behave exactly the same? Also wrt when the kbd is folded behind the kbd. IOW
are the 2 SW_TABLET_MODE reports fully in sync in all possible states:

1. Just the tablet
2. Tablet + keyboard attached, keyboard in use
3. Tablet + keyboard attached, keyboard folded away behind tablet 

?

> On the other hand, userspace should expect duplicate messages to some degree and use a hysteresis approach anyway. Every now and then, the contact of the magnetic plug is not established perfectly on the first attempt. So perhaps not really an issue.

The only userspace consumer of this which I know is mutter (part of gnome-shell) and it
will just take the value from the last event. So if the 2 are always in sync then
the event send by the second input-dev will essentially be a no-op since the value will
be the same as the other event.

We do need to resolve the question of how to handle this before I can merge the patch,
atm I think that just having it reported twice is fine (as long as both reports are in
sync).

Regards,

Hans


