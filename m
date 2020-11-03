Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512B4C55178
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 14:17:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18D1822264
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 14:17:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ba6QYGcy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729492AbgKCOQ5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 09:16:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24242 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729563AbgKCOQy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 09:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604413012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wb00LUy8820NGXJvf1djVa/9kLyg32zXAR+1dakBiDY=;
        b=ba6QYGcybX/f/TtQyIKnqAobLfBYd6SKfAz49XyR3PHr65shSQIKv7+iAev/MEAyJyH1E2
        tl6qQeu51L7LDJb0VkvqFjvHRMWKrl/KTRJG1twCY4IgaZgPd+oczIpPCKm2mK2OpKT9Pj
        KN4IcHbnsFPupmd9QnCE8n52OdrfJek=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-36Z7mJHBPK-8w_H84wBFqw-1; Tue, 03 Nov 2020 09:16:47 -0500
X-MC-Unique: 36Z7mJHBPK-8w_H84wBFqw-1
Received: by mail-ej1-f69.google.com with SMTP id p19so5405312ejy.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 06:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Wb00LUy8820NGXJvf1djVa/9kLyg32zXAR+1dakBiDY=;
        b=mZ+Wk0zw0uNQK5zByWjA9Ixh4z8n+2WYU0JE4QUWl9Qs5xddP1JcbMqzUIcn26XDXn
         qbl0v4oN9TqeHNsuI7RsrqRWLiG8fsJUJFyKwr+jAuyqDwf4xpMHKskFu4lSG4uTnc90
         YGqHPBxUO9IwXHH5PSdvJOyMF5utAGI9qs/oxZg4cIZrXqN0uWuGYb0MqC4WuPF456Nq
         Fq6P8gQdtpMRoIXeUS6tAmZrQy4MfAg+ie/falT9prwnsGhSbFDMZDj+7AaOyx9hVAMe
         V05itrSOKtByuTxlgqwtITVt6HQe+rv0Rs/OVX+p/67hAMyKKsAZAmRYCWRvWOKAJr46
         o8uQ==
X-Gm-Message-State: AOAM5316Sg60hyyohguX42wA2f5cnM39dxW8kkpSXIeowxPXoNe60qC1
        QNE+5RezQHelrXiM6a7cGql6Vf6WMWsklQL1FkqRoJwP3Bl9hcHfMDlvTOH1JBi26LjtPxjUA3I
        4M1GhH1VAdZ2bI6mNu3S/wOgtOiu7YwCYkg==
X-Received: by 2002:a05:6402:559:: with SMTP id i25mr7275042edx.128.1604413005682;
        Tue, 03 Nov 2020 06:16:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqfPEO1abwEF21nW7V8opW+C7bzgOt9lx746WvlgMSuAFg7UxLT3r75vQdvIWYwVBt3zlfsg==
X-Received: by 2002:a05:6402:559:: with SMTP id i25mr7275004edx.128.1604413005322;
        Tue, 03 Nov 2020 06:16:45 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id j20sm11948376edt.4.2020.11.03.06.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 06:16:44 -0800 (PST)
Subject: Re: [hp_wmi] Recieving same keycode from two keys
To:     Rhys Perry <rhysperry111@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <Q5ZWCQ.DX8TK304ORAI@gmail.com>
 <CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com>
 <HTSPI6-Ba3MfCgVG7q_YbRF6mUqskmyRdtSb_7eE2G7oCi_rSo5UP1ZKRK-qVfzSZ1zm_5sNp5hUorvgRz3VF8RM8b8361CLzbq4X5z59hw=@protonmail.com>
 <CAGTBY+vQ+UMPqFCwKMS0L5=F3eqQ21UtGETgmE+Le=SXcaWS2w@mail.gmail.com>
 <bjucdDbwHvavLvYVkhboo_jhvKC6ccqAslFPuuYO0ZZcgTZZaICda3WMFZhw_zS1o1m7VanyCmaJ4HZMqgyXwsCfqJFDGxb_1A4pdNCe8Bw=@protonmail.com>
 <CAGTBY+tso9BKJwe5F5bBU_RAo0yrwtYf=kGm1UvMpTJurS00MQ@mail.gmail.com>
 <A3oiTx-vaeJfCMZHt3dL_jvvIWiEDWGcOZxpZCVSzWYHr94r7jmHVKP01ApdKc1mZdcKsmwrr0O4e_L5MBSgU_LcsyOpGLx9xbZjX1q900Y=@protonmail.com>
 <CAGTBY+t9fh6P-iCcvKNm4S2==SgGMCrQL5kh00n=_G4WpzFNOw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9bb85a72-cb91-c0af-8289-dd8601f5b71b@redhat.com>
Date:   Tue, 3 Nov 2020 15:16:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAGTBY+t9fh6P-iCcvKNm4S2==SgGMCrQL5kh00n=_G4WpzFNOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/3/20 2:35 PM, Rhys Perry wrote:
>>
>> (please use reply-all so that the mailing list gets the emails as well)
>>
> 
> Oh, my mistake. I didn't actually know the difference between the two.
> Sorry for any confusion this might cause in the future.
> 
>>
>>>> [...]
>>>>>> Can you see any messages generated by the hp-wmi driver when these key presses occur?
>>>>>
>>>>> Not that I know of, unless there is some sort of debug mode that can be enabled
>>>>>
>>>>>>>> Now, this is not that interesting at first, I obviously just need to
>>>>>>>> map a keycode. The confusing part is that for both the brightness up
>>>>>>>> AND the brightness down key I get the same code (e02b). I am not to
>>>>>>>> sure how to debug this behavior but I would appreciate if someone
>>>>>>>> helped investigate this issue.
>>>>>>>> I am not sure if this is relevant, but my RFKILL key does not work
>>>>>>>> either (but does not show anything in journal).
>>>>>>
>>>>>> Could you please run `evtest` and see if you have a "HP WMI hotkeys" input device?
>>>>>> If so, please select it, and then press the function keys and see if any events appear.
>>>>>
>>>>> After running`evtest` there is a device called "HP WMI hotkeys" (on
>>>>> /dev/input/event16). However, after selecting it and pressing the
>>>>> brightness keys no events appear.
>>>>>
>>>>>> Furthermore, you could install `acpid`, start it (something along the lines of
>>>>>> `sudo systemctl start acpid`), then run `acpi_listen` and see if you get anything
>>>>>> when you press the keys.
>>>>>
>>>>> After starting the service and running`acpi_listen`, no events appear
>>>>> when pressing the brightness keys
>>>>>
>>>>>>>> Here is a link to acpidump:
>>>>>>>> https://www.dropbox.com/s/ulyltq0gz35s79l/acpidump?dl=0
>>>>>>>> ::: Rhys Perry :::
>>>>> [...]
>>>>
>>>> Could you test other function keys like volume up/down, etc.?
>>>>
>>> After running some tests with evtest I have found out:
>>> - Brightness keys: "AT Translated Set 2 keyboard" (although same keycode)
>>> - Volume keys: "AT Translated Set 2 keyboard"
>>> - Media keys: "AT Translated Set 2 keyboard"
>>> - RFKILL key: (none, although there is a device called "HP Wireless hotkeys")
>>
>> Please install the `evemu` program suite, and run `evemu-record /dev/input/event...`
>> for the AT keyboard, HP WMI hotkeys, and HP Wireless hotkeys; in each run press the
>> brightness up/down, volume up/down keys in any fixed order you like, and then send
>> the output of each run (including the part that is initially printed before
>> receiving any events). Could you also run `acpi_listen` at the same time and
>> see if any key presses are registered there? If yes, what was the output?
>>
> 
> Ok, here you go:
> "AT Translated Set 2 Keyboard": https://0x0.st/idpK.txt
> "HP Wireless hotkeys": https://0x0.st/idpP.txt
> "HP WMI hotkeys": https://0x0.st/idpN.txt
> `acpi_listen`: https://0x0.st/idpb.txt

Can you also run evemu-record for the "Video Bus"
input device and check if you get events there for the
brightness up/down key presses?  On modern laptops events
for the brightness keys are typically delivered there.

Also are you perhaps using the nvidia binary driver for
your GPU ?

Regards,

Hans

