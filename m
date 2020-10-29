Return-Path: <SRS0=eM/Q=EE=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16613C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 09:46:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B188F2076E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 09:46:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LK9phlxH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgJ2Jqr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Oct 2020 05:46:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26902 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726830AbgJ2Jqp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Oct 2020 05:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603964803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v4juQfAx3LxBzTcqekjK+MOSoDZx1NTXS/wKZYQGOXo=;
        b=LK9phlxHhIvI3B603Us6mzSVBuplg1RWGtGfKwCvMEtUptCOkedY1hkoGm5yrQRU1KVEP2
        nK3Hv+AtDfly1She7KLOmtJ1b+TM6XAk5blBfq2BbXaK4YPF0XsGRY/jxZ2W+ee1BFOAeN
        i0n15t7KH2zucFCYYYDdZMcl//V3q/k=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-ircjxTa3Nd-bPGHYyEnuuA-1; Thu, 29 Oct 2020 05:46:42 -0400
X-MC-Unique: ircjxTa3Nd-bPGHYyEnuuA-1
Received: by mail-ej1-f72.google.com with SMTP id z25so963444ejd.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2020 02:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v4juQfAx3LxBzTcqekjK+MOSoDZx1NTXS/wKZYQGOXo=;
        b=Y4Rl4YNVJBe8pSQ7TMISbXXeL4gvULiT8sebuKgkAtCx67D4o7WMpw83XxLH2pBgHm
         NX2Q/Owb9IQEjE28kyktV5Xa+8ANb2C4NcL4dBHsiKjc0G9kbOC4+6VsQ63NABzje8g/
         9oWuLCWLEBGqccHKL4Cp0yfQxkC1DOkb83P+wisEXou2B2yhaFwvSInMaXXVpjaTTamz
         BPWl6UanvgrcbivgDhDXGP1cNBWo4yYhYu+bjvnI0cukQ7OSWbnDRFFoukvVr6H+qDwU
         tTb8V/4u/NM28OlxWf2ygM1XLP4Gn6CyemmWrQU38c/jeAmKnFzHlyomaS+j/hFaJGy+
         a+OA==
X-Gm-Message-State: AOAM532RlQF+eQp/HZBu0UE2fcRDm5F08shPRzCaLlG72ebl6HvUPHBy
        wyA+we+gATNsprnd8+eKG+jft4q1ciXCIqGd70OBYGkImIzFNwHYJoDgQSA4gRNSlx2lHEOldlp
        gSGwMbEXN2ppSLKSTJ8HYaA+h8OUwDqvaXw==
X-Received: by 2002:a05:6402:1691:: with SMTP id a17mr2984358edv.264.1603964800378;
        Thu, 29 Oct 2020 02:46:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKE7w0otUI+gbsHiZO1jXP8ILglLHS0/NREeyAFavkgmdFK4zjz2UD5PtGB/B2pPdy0w21NQ==
X-Received: by 2002:a05:6402:1691:: with SMTP id a17mr2984338edv.264.1603964800185;
        Thu, 29 Oct 2020 02:46:40 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id p20sm1140405ejd.78.2020.10.29.02.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 02:46:39 -0700 (PDT)
Subject: Re: [External] Re: [PATCH] Documentation: Add documentation for new
 platform_profile sysfs attribute
To:     Mark Pearson <markpearson@lenovo.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     dvhart@infradead.org, mgross@linux.intel.com,
        mario.limonciello@dell.com, eliadevito@gmail.com, bberg@redhat.com,
        linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <markpearson@lenovo.com>
 <20201027164219.868839-1-markpearson@lenovo.com>
 <5ca1ae238b23a611b8a490c244fd93cdcc36ef79.camel@hadess.net>
 <d5f0bcba-5366-87da-d199-a85d59ba6c1c@redhat.com>
 <b3e61ee4-3fca-ce06-2216-977586baae4e@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ebeec472-3310-c560-e8bf-2b33c480333b@redhat.com>
Date:   Thu, 29 Oct 2020 10:46:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <b3e61ee4-3fca-ce06-2216-977586baae4e@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/29/20 1:55 AM, Mark Pearson wrote:
> Thanks Hans and Bastien,
> 
> On 28/10/2020 13:23, Hans de Goede wrote:

<big snip>

>>> Is there another file which explains whether those sysfs value will
>>> contain a trailing linefeed?
>>
>> sysfs APIs are typically created so that they can be used from the shell,
>> so on read a newline will be added. On write a newline at the end
>> typically is allowed, but ignored. There are even special helper functions
>> to deal with properly ignoring the newline on write.
>>
>> Regards,
>>
>> Hans
>>
>>
> OK - does that need to actually be specified here? Or is that just something I keep in mind for the implementation?

IMHO it does not belong in the sysfs API docs for the platform_profile
stuff. But I guess it would be good to document it somewhere in some
generic syfs API rules/expectations document (with a note that their
might be exceptions).

Ideally we would already have such a file somewhere, but I don't know
if we do (I did not look). So if you feel like it (and such a file does
not exist yet) then I guess a patch adding such a doc file would be good.

Regards,

Hans

