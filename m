Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA20DC8301A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Nov 2020 22:17:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A444221FD
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Nov 2020 22:17:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="faQeoCbk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731582AbgK1Vtr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:49:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52508 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732979AbgK1SQh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 28 Nov 2020 13:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606587310;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/j7MFMaGF4mtrf6I+pz9+nToAACglxD5pvkrmBvD6to=;
        b=faQeoCbkwef73kPQvSnZMLYN/coXsVxA7nVCXcYRxpriHwWkP7VbEL5lCYFqCO7QnI2sWz
        Zu5mObM0WQMjzl6IzDV9+23ITyveY6C0RajhHV+khvV5tG21HnTCjkePsOnVObRGf0gfcK
        6vObJlm6TkS7a1yhRL8NPJPM9+n1nsc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-gQCPi9saNF-Ub6W0E_CTOA-1; Sat, 28 Nov 2020 06:13:45 -0500
X-MC-Unique: gQCPi9saNF-Ub6W0E_CTOA-1
Received: by mail-ej1-f72.google.com with SMTP id dc13so3134917ejb.9
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2020 03:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/j7MFMaGF4mtrf6I+pz9+nToAACglxD5pvkrmBvD6to=;
        b=If9ijZ1IrshDOdY1BwkLQCC5O3zLAX1T3wvuW6r9VG9cJit3373wrokvnmxY6VgFeO
         et1epWP67VB1mWWa7zz/rS3Hej51hHNXb2wxYmWWtLXb4q7ZG2V3GPnPPv25+QdDqmpz
         dF1/0DW7+Oy0LlCUTCagXTHziZtwVU6OiS/AgxN8rOvz8iQTrvqhDE9rwJ0iG1cAb+NB
         mXA85Hj99iaETEdXTEl4lWSGCcLT3H+t/Xfa3OT6KtIrPu3xUOCfRFOHW9kTaeDWobj5
         QO6Bq0vk+36K6pjst7NSnR/CUXc4lv75Szc4yPnhYM8bjYhAzXzQ1VK0bPYNL5PZTa6g
         UdqA==
X-Gm-Message-State: AOAM531pa9Y29OEvrYv7vNqsHrzdvb3DBRexr8+nxy/oyf4dYwsQZnGz
        aQAvcRlsGtipCPR8yuAiH8yKPUKeGnprflC9+kIlSO0/JcN4Nb3P+9CcGT12ZOfMHJXDD28iSQw
        zcPpXdyU8xyytR3ulvcYaTWhK5qYGdOrTwzwSo45/yjFU4yxkycywOu7xwwjdJZc+4BxeSJwE15
        ZBMOGGGzU4Mw==
X-Received: by 2002:a17:906:d8a8:: with SMTP id qc8mr4446327ejb.149.1606562023574;
        Sat, 28 Nov 2020 03:13:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWr/GB6QJ2ylnNxqBwPGiqFmnrciZglUqUhb+ELRNqz7RsOv7VCXysK8gmalO0EWwFSbFYHQ==
X-Received: by 2002:a17:906:d8a8:: with SMTP id qc8mr4446318ejb.149.1606562023389;
        Sat, 28 Nov 2020 03:13:43 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id n22sm6315427edr.11.2020.11.28.03.13.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2020 03:13:42 -0800 (PST)
Subject: Re: [PATCH] platform/x86: hp-wmi: Add support for home in HP OMEN
 laptops
To:     Dana Goyette <danagoyette@gmail.com>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <174c79fb794.120dada4b39603.5369737602791060462@sidsun.com>
 <cad5f2ab-e319-b6fd-360d-5beb62d6899f@redhat.com>
 <b8c32747-2704-8a2d-dc32-b6154128d295@gmail.com>
 <9ca5bc3c-807c-3dbc-41a9-741a3407c66c@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2853bc2b-be49-9ff7-3f9e-6caca8162b26@redhat.com>
Date:   Sat, 28 Nov 2020 12:13:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9ca5bc3c-807c-3dbc-41a9-741a3407c66c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/28/20 3:55 AM, Dana Goyette wrote:
> 
> 
>> On 11/27/20 6:19 PM, Dana Goyette wrote:
>>
>> FYI, the HP Omen 15 2020 has a different keyboard, where Home is a proper separate key.  The India model has yet another layout, with a full numeric keypad that also includes Home.  So unless we want to get into DMI matching, it's safest to map the key to something distinct.
>>
>> Layout on the US model:
>>
>> [Omen]   [Calc] [PrtScr]
>> [Insert] [Home] [PgUp]
>> [Pause]  [End]  [PgDn]
>>
>> Layout on the India model:
>> [Omen]    [Calc] [Insert] [PrtScr]
>> [NumLock] [/]    [*]      [-]
>> [7/Home]  [8]    [9/PgUp] [+]
>>
>> (Where's Delete?  Above Backspace.)
> 
> Upon looking at the driver's source, the 2020 model won't be encountering that path, so "home" may be okay after all.  When I press that key, the event is different (it's not HPWMI_BEZEL_BUTTON).
> 
> hp_wmi: Unknown event_id - 29 - 0x21a5

Hmm, but the event_data is the same as before, so maybe event-id 29 is simply
the new HPWMI_BEZEL_BUTTON... I wonder if other keys generate this event-id too,
and if they also use the same event_data values is before.

Or IOW I wonder if we can / want to re-use the hp_wmi_keymap (and the existing
input_dev) for the new event-id 29, or if we want a new input_dev and sparse-keymap
for the new event-id.

My initial feeling is to re-use the existing input_dev and keymap at which point
the event-id being different does not help us. We should probably just assign
KEY_CONFIG to it.  Users who want it to send home can then remap that,
either through hwdb, so that it gets re-mapped to KEY_HOME at the kernel level,
or at some higher level.

Note in my original reply I said to use KEY_CONTROL_PANEL, but that has the
disadvantage that its keycode is above 247 which is not supported under X11.
Looking at this again I wonder why we have KEY_CONTROL_PANEL at all, since
the comments on KEY_CONFIG pretty much over opening the control-panel:

#define KEY_CONFIG              171     /* AL Consumer Control Configuration */

Alternatives which are also under 247 are:

KEY_COMPUTER
KEY_HOMEPAGE
KEY_DASHBOARD
KEY_MEDIA

I see that despite me reviewing this, the patch never landed, so we are free to
do what we want here with having to worry about breaking existing setups.

Regards,

Hans

