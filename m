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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55161C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Apr 2021 16:03:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DE34613BD
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Apr 2021 16:03:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346166AbhDFQD4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Apr 2021 12:03:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39265 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346163AbhDFQDx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Apr 2021 12:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617725025;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EoqtToOiZ2s5/0xKOoL+G6cfqHUVgxnaLS/CRnQ6hlw=;
        b=GkDBKFBthiPkKrvQUKQyUnoJMtYs2pINKcUGWMbH+RG0SpML6+wF9WAOrYWjS4iE6sF9Xv
        cDY3hY559TcwVbsaU16flikCUwOPhuUbsd4rcbcZ4X/xQ9BjDLV/ISQEAGZXi88JN4zSWv
        paRY5pL9FbJx9fbaLZE4487UDVRi/Ok=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-x2238l0HMBOjCsU6iPr1nA-1; Tue, 06 Apr 2021 12:03:43 -0400
X-MC-Unique: x2238l0HMBOjCsU6iPr1nA-1
Received: by mail-ed1-f70.google.com with SMTP id m21so1007210edp.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Apr 2021 09:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EoqtToOiZ2s5/0xKOoL+G6cfqHUVgxnaLS/CRnQ6hlw=;
        b=DbkKOXrFcQpBJ2DGzrf+s30ihM6PZDfKWug/sF+DPH7kOOh7PLuTpyDBVihc612qaO
         1dQfi4zdBEIMQMO9hFCBqI7OocKA0e3j/bp2B/XO2sk3yP1sGCIMwWVX+8AgjIj7nDTf
         uerADq2E4wKI4LTePkRcZjiBo/jDUNHLlHuQ95CPkfozBOAf28NETG96zUpmOQzt0PS7
         A2Qw2clkrtD2OjVaJdUkNvjokIbt/WFZgHslURlJSnTtNcK/AdlUZhJNxEMZyQeU6ODY
         SyS8kLEeT1h4UjhYGJaOYGVXT/b3p+W3re9JW1HFz6eiJJwXp4alXklMWXePvfVXwadY
         zJdQ==
X-Gm-Message-State: AOAM532yygIbw2iA6peYRpIrd5aE+JyeUi3/F4z8zIuuPieQGjMBU0Eh
        LxR1NIgBTyzDglYlp6OqimXWXYNq3flfmHvIXdHdYuW0kd/Et17xXTkk/XJieeEBEJxjJsHFgoZ
        RUgfRobKivvbAl5cCYhQEMn13id6jv4pPOiAdjNm5tLcq25HaR/NlA3x/xq5R7QId+lEjR+PUbd
        yOBv8dkWpCuw==
X-Received: by 2002:a50:f40a:: with SMTP id r10mr8042750edm.200.1617725021920;
        Tue, 06 Apr 2021 09:03:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVyZgdS2J90tnvwF5ywaIpNXd0Kmt4Eyw7bl/jkwhq3ajJPScP41frNDq6V9nxn9CRi+TILg==
X-Received: by 2002:a50:f40a:: with SMTP id r10mr8042722edm.200.1617725021680;
        Tue, 06 Apr 2021 09:03:41 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k26sm6051139ejc.23.2021.04.06.09.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Apr 2021 09:03:41 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel-hid: Fix spurious wakeups caused by
 tablet-mode events during suspend
To:     Elia Devito <eliadevito@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210404143831.25173-1-hdegoede@redhat.com>
 <b5666155ad821c700934397e27e6c5e461503014.camel@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b8b7ebdd-0318-bc57-1862-36af171617b0@redhat.com>
Date:   Tue, 6 Apr 2021 18:03:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b5666155ad821c700934397e27e6c5e461503014.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/4/21 5:50 PM, Elia Devito wrote:
> Hi Hans,
>> Some devices send (duplicate) tablet-mode events when moved around even
>> though the mode has not changed; and they do this even when suspended.
>>
>> Change the tablet-mode event handling when priv->wakeup_mode is set to
>> update the switch state in case it changed and then return immediately
>> (without calling pm_wakeup_hard_event()) to avoid spurious wakeups.
>>
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=212537
>> Fixes: 537b0dd4729e ("platform/x86: intel-hid: Add support for
>> SW_TABLET_MODE")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/intel-hid.c | 16 +++++++++-------
>>  1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel-hid.c
>> b/drivers/platform/x86/intel-hid.c
>> index 57cc92891a57..078648a9201b 100644
>> --- a/drivers/platform/x86/intel-hid.c
>> +++ b/drivers/platform/x86/intel-hid.c
>> @@ -483,11 +483,16 @@ static void notify_handler(acpi_handle handle,
>> u32 event, void *context)
>>                         goto wakeup;
>>  
>>                 /*
>> -                * Switch events will wake the device and report the
>> new switch
>> -                * position to the input subsystem.
>> +                * Some devices send (duplicate) tablet-mode events
>> when moved
>> +                * around even though the mode has not changed; and
>> they do this
>> +                * even when suspended.
>> +                * Update the switch state in case it changed and then
>> return
>> +                * without waking up to avoid spurious wakeups.
>>                  */
>> -               if (priv->switches && (event == 0xcc || event == 0xcd))
>> -                       goto wakeup;
>> +               if (event == 0xcc || event == 0xcd) {
>> +                       report_tablet_mode_event(priv->switches,
>> event);
>> +                       return;
>> +               }
>>  
>>                 /* Wake up on 5-button array events only. */
>>                 if (event == 0xc0 || !priv->array)
>> @@ -501,9 +506,6 @@ static void notify_handler(acpi_handle handle, u32
>> event, void *context)
>>  wakeup:
>>                 pm_wakeup_hard_event(&device->dev);
>>  
>> -               if (report_tablet_mode_event(priv->switches, event))
>> -                       return;
>> -
>>                 return;
>>         }
>>
> 
> No regression noted on HP Spectre x360 15-df0xxx.
> 
> Reviewed-by: Elia Devito <eliadevito@gmail.com>

Thank you for the testing and the review. I'll push this out to the for-next and fixes branches.

Regards,

Hans

