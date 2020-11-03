Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A5BC388F7
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 15:20:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC38B20757
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 15:20:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9uUgWbQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgKCPUs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 10:20:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27223 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727246AbgKCPUr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 10:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604416845;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p9UTS+QHSguN+ftHvb/Ccs3aVbkNwsvqCP4JrSQIPrg=;
        b=Q9uUgWbQkJYaviEWI0GNBQn1Vg/+gVT3Tp6ZZJnbkrwm2lvCHz/fClc7pQ2hT+Q01wjcrj
        mYlRFn2qJ2WmPTfoge2nM40nOEBwxUjRXV5KVhVo/KmNA1mY7xswqA88mJHfNyXmpk1dN7
        qSQPCnm21LpY8YYJGldp9Jn+DODWC5s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-FcJ6-cq0PiGA-G1_DsRJAg-1; Tue, 03 Nov 2020 10:20:42 -0500
X-MC-Unique: FcJ6-cq0PiGA-G1_DsRJAg-1
Received: by mail-ed1-f71.google.com with SMTP id x15so4161822edr.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 07:20:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p9UTS+QHSguN+ftHvb/Ccs3aVbkNwsvqCP4JrSQIPrg=;
        b=VrVdgu1U7wM9/qKLcbTKXvIlvWOaMgqWUpNOJctnjOHXL5WE4/bxbXYTur+66VQGnR
         cANACRCverH1iXHkf9tfFGpJg0fx6eHgGX8pBZLTZEXu8G6RhPEvQY64jQCWNsA6BLod
         xKyLLixWjvvtzEWcM4B4IupSLwEZF6fLged30zs5xb7ULfraWWMI8fR1+BG0cpY/lRM2
         ARGpjp49+CK6mDqrHcbv6NkxXQytgF4+yEY8YJld12Td7e9xkDXR52amLd7VO4tnu8u/
         6s/7x3ZEJYZD34PhLsR+DCTTI9OQX69IZojonp+xJyfjELCRRHT3zA5UBOIMewmVpxAu
         Mzxw==
X-Gm-Message-State: AOAM530AvgqysIsDhJ7+tyfKTHLZwaFMBF7XEted/a3fQ0NSBWg96vOD
        S/EwQ67Ru1BJStpZIiXogle90j5qfk2S0inARL5c/mvCQ7Hn1mR1vSnWePMNy3swUxuPRKdkuN3
        sQdwI3hyyvUPMiZlfNXI8WOBthuqFrAcBGA==
X-Received: by 2002:a17:906:9a4a:: with SMTP id aj10mr16907400ejc.389.1604416840295;
        Tue, 03 Nov 2020 07:20:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcDH1cvh7dJoxRY0/KXXVd1CleV6uxEegnyAk05R2O7WBWwCuotD5iI9GKGxghCz4YadXvfA==
X-Received: by 2002:a17:906:9a4a:: with SMTP id aj10mr16907370ejc.389.1604416839968;
        Tue, 03 Nov 2020 07:20:39 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id y12sm12083908ede.82.2020.11.03.07.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 07:20:39 -0800 (PST)
Subject: Re: [hp_wmi] Recieving same keycode from two keys
To:     Rhys Perry <rhysperry111@gmail.com>
Cc:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <Q5ZWCQ.DX8TK304ORAI@gmail.com>
 <CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com>
 <HTSPI6-Ba3MfCgVG7q_YbRF6mUqskmyRdtSb_7eE2G7oCi_rSo5UP1ZKRK-qVfzSZ1zm_5sNp5hUorvgRz3VF8RM8b8361CLzbq4X5z59hw=@protonmail.com>
 <CAGTBY+vQ+UMPqFCwKMS0L5=F3eqQ21UtGETgmE+Le=SXcaWS2w@mail.gmail.com>
 <bjucdDbwHvavLvYVkhboo_jhvKC6ccqAslFPuuYO0ZZcgTZZaICda3WMFZhw_zS1o1m7VanyCmaJ4HZMqgyXwsCfqJFDGxb_1A4pdNCe8Bw=@protonmail.com>
 <CAGTBY+tso9BKJwe5F5bBU_RAo0yrwtYf=kGm1UvMpTJurS00MQ@mail.gmail.com>
 <A3oiTx-vaeJfCMZHt3dL_jvvIWiEDWGcOZxpZCVSzWYHr94r7jmHVKP01ApdKc1mZdcKsmwrr0O4e_L5MBSgU_LcsyOpGLx9xbZjX1q900Y=@protonmail.com>
 <CAGTBY+t9fh6P-iCcvKNm4S2==SgGMCrQL5kh00n=_G4WpzFNOw@mail.gmail.com>
 <9bb85a72-cb91-c0af-8289-dd8601f5b71b@redhat.com>
 <CAGTBY+u_=5Po2qTPuunmK+sxE8sJ3Z1jcQXjiTcMb7V2iVwSjA@mail.gmail.com>
 <80d43b00-09d3-9f15-d8d6-a4264cf68dd2@redhat.com>
 <CAGTBY+v6HqbVtFSFKpC25TDHv2S29XbkWL5fDJjRL8o1zn8d6w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <df0edaa1-c53c-7012-1d73-2ac108b1bd6a@redhat.com>
Date:   Tue, 3 Nov 2020 16:20:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAGTBY+v6HqbVtFSFKpC25TDHv2S29XbkWL5fDJjRL8o1zn8d6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/3/20 3:51 PM, Rhys Perry wrote:
> On Tue, 3 Nov 2020 at 14:43, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> Note I restored the Cc list again, please use Reply-to-all.
>>
> 
> Yeah, sorry about that again. I have a hotkey set for reply and am
> using it out of habit.
> 
>> On 11/3/20 3:25 PM, Rhys Perry wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 11/3/20 2:35 PM, Rhys Perry wrote:
>>>>>>>>>> (please use reply-all so that the mailing list gets the emails as well)
>>>>>>
>>>>>
>>>>> Oh, my mistake. I didn't actually know the difference between the two.
>>>>> Sorry for any confusion this might cause in the future.
>>>>>
>>>>>>
>>>>>>>> [...]
>>>>>>>>>> Can you see any messages generated by the hp-wmi driver when these key presses occur?
>>>>>>>>>
>>>>>>>>> Not that I know of, unless there is some sort of debug mode that can be enabled
>>>>>>>>>
>>>>>>>>>>>> Now, this is not that interesting at first, I obviously just need to
>>>>>>>>>>>> map a keycode. The confusing part is that for both the brightness up
>>>>>>>>>>>> AND the brightness down key I get the same code (e02b). I am not to
>>>>>>>>>>>> sure how to debug this behavior but I would appreciate if someone
>>>>>>>>>>>> helped investigate this issue.
>>>>>>>>>>>> I am not sure if this is relevant, but my RFKILL key does not work
>>>>>>>>>>>> either (but does not show anything in journal).
>>>>>>>>>>
>>>>>>>>>> Could you please run `evtest` and see if you have a "HP WMI hotkeys" input device?
>>>>>>>>>> If so, please select it, and then press the function keys and see if any events appear.
>>>>>>>>>
>>>>>>>>> After running`evtest` there is a device called "HP WMI hotkeys" (on
>>>>>>>>> /dev/input/event16). However, after selecting it and pressing the
>>>>>>>>> brightness keys no events appear.
>>>>>>>>>
>>>>>>>>>> Furthermore, you could install `acpid`, start it (something along the lines of
>>>>>>>>>> `sudo systemctl start acpid`), then run `acpi_listen` and see if you get anything
>>>>>>>>>> when you press the keys.
>>>>>>>>>
>>>>>>>>> After starting the service and running`acpi_listen`, no events appear
>>>>>>>>> when pressing the brightness keys
>>>>>>>>>
>>>>>>>>>>>> Here is a link to acpidump:
>>>>>>>>>>>> https://www.dropbox.com/s/ulyltq0gz35s79l/acpidump?dl=0
>>>>>>>>>>>> ::: Rhys Perry :::
>>>>>>>>> [...]
>>>>>>>>
>>>>>>>> Could you test other function keys like volume up/down, etc.?
>>>>>>>>
>>>>>>> After running some tests with evtest I have found out:
>>>>>>> - Brightness keys: "AT Translated Set 2 keyboard" (although same keycode)
>>>>>>> - Volume keys: "AT Translated Set 2 keyboard"
>>>>>>> - Media keys: "AT Translated Set 2 keyboard"
>>>>>>> - RFKILL key: (none, although there is a device called "HP Wireless hotkeys")
>>>>>>
>>>>>> Please install the `evemu` program suite, and run `evemu-record /dev/input/event...`
>>>>>> for the AT keyboard, HP WMI hotkeys, and HP Wireless hotkeys; in each run press the
>>>>>> brightness up/down, volume up/down keys in any fixed order you like, and then send
>>>>>> the output of each run (including the part that is initially printed before
>>>>>> receiving any events). Could you also run `acpi_listen` at the same time and
>>>>>> see if any key presses are registered there? If yes, what was the output?
>>>>>>
>>>>>
>>>>> Ok, here you go:
>>>>> "AT Translated Set 2 Keyboard": https://0x0.st/idpK.txt
>>>>> "HP Wireless hotkeys": https://0x0.st/idpP.txt
>>>>> "HP WMI hotkeys": https://0x0.st/idpN.txt
>>>>> `acpi_listen`: https://0x0.st/idpb.txt
>>>>
>>>> Can you also run evemu-record for the "Video Bus"
>>>> input device and check if you get events there for the
>>>> brightness up/down key presses?  On modern laptops events
>>>> for the brightness keys are typically delivered there.
>>>>
>>>
>>> I ran evemu-record for my "Video Bus" devices (of which I had two) and
>>> there was nothing on those either. I quickly ran over every single
>>> input device and I can confirm that "AT Translated Set 2 Keyboard" is
>>> the only one that responds to brightness keys.
>>
>> Hmm, ok, weird.
>>
>> Usually at least something is generating events for this. Often
>> we have the problem that we get the brightness keys reported
>> by multiple input devices, this is a new problem.
>>
>> Can you try adding:
>>
>> wmi.debug_event=1
>>
>> To your kernel commandline and then after rebooting do:
>>
>> cat /proc/cmdline
>>
>> To check that it really is there and then do:
>>
>> dmesg -w
>>
>> To monitor kernel messages and then press the brightness
>> up/down hotkeys and see if you get any new messages ?
>>
> 
> Nope, exactly the same as before:
> ```
> [   42.501517] atkbd serio0: Unknown key pressed (translated set 2,
> code 0xab on isa0060/serio0).
> [   42.501524] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
> [   42.512377] atkbd serio0: Unknown key released (translated set 2,
> code 0xab on isa0060/serio0).
> [   42.512383] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
> [   43.160730] atkbd serio0: Unknown key pressed (translated set 2,
> code 0xab on isa0060/serio0).
> [   43.160738] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
> [   43.171970] atkbd serio0: Unknown key released (translated set 2,
> code 0xab on isa0060/serio0).
> [   43.171978] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
> ```

Ok bummer, so it looks like only get the one event and need to catch
that (we can use i8042_install_filter() from some driver for that) and
then when we catch it probably make some ACPI call to figure out what
is going on. I took a quick peek at the acpidump you provided, but it is
huge.  One thing which did stand out is that ssdt14.dsl (after disassembling)
has:

            Method (GHKS, 0, NotSerialized)
            {
                Debug = "GetHotkeyState-----"


            Method (SHKS, 1, Serialized)
            {
                Debug = "SetHotkeyState-----"

Which may or may not be related ... But I'm afraid I do not have
the time to investigate that avenue further.

One last thing to try (I guess) is adding the following to your kernel
commandline and see if that changes things:

acpi_backlight=video

Possible other values to try are "vendor" "native" and "none"

Regards,

Hans

p.s.

I think you mentioned this before, but what was the exact model of your laptop again? 

