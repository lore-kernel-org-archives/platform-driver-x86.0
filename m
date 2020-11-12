Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BB1C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Nov 2020 15:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF6F1221E9
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Nov 2020 15:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ickrfuLS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbgKLPzO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Nov 2020 10:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27205 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728184AbgKLPzO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Nov 2020 10:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605196512;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ckiV1DVHMhrTV0yNs1uMBmzXIDK1aa2YXRxhutVErOc=;
        b=ickrfuLS8unzIO6joLLHjljtBTWiAOHDfS9nF4a4LX+TRcP7kqYiLCehg4GVNNBCyugMMW
        1jFYO0wv1M1T3m9lD0W5+bli36OcVT6vGn4b9wIIjsTEE+I45MdGOkqjPg3sO99/4PVNe9
        DnBsiIvV89v1d1IR/eyXU8N9v5jSg0Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-es18Q47VPEGMRN4NSOMzEw-1; Thu, 12 Nov 2020 10:55:10 -0500
X-MC-Unique: es18Q47VPEGMRN4NSOMzEw-1
Received: by mail-ed1-f69.google.com with SMTP id b68so2490715edf.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2020 07:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ckiV1DVHMhrTV0yNs1uMBmzXIDK1aa2YXRxhutVErOc=;
        b=tOWDEBttTqGN647miilaZvNV2ESkkENUjVS5K5vB/OfxyxkB5dC5Z2B3e/y8PrWn6v
         8SN12Eg3FoAc77UY3x7WQNa/875AFrssOJ/4kJhmQsxKVY83erGzTNZR0A1ij2IbPCXa
         rFZTOpctDIUa4rsSUpkP68K7XbakOAO3xQmAUtkMob81tXnybUivAqjBROi7p2uvGoNC
         MlocG0Jx/9z+aHqByql4qwBFtuEsJjycbYEV1h51dnijSP65+7OBxIAnDnqueQKiQvxf
         wm1Bdvy+VKTA7orXnKEPR+OaEOUI8wqTo7koYqL6Q2SLqc8hFWp/zAl18soSk66XEqL5
         CsiQ==
X-Gm-Message-State: AOAM533ypmjSyPALqD8asSsM2mHGQM+MXF9UnvVCGSb6nmYZbuXPZ50b
        yiF0L/p7mB92Lo7HEV04JqMmc8KkX48CRRyMiYBpDGHRnktAzE9S4+hrUwKIk1foByV0Qv2/8b4
        Ls4SIBIaGVCHhz++eaPXMn51MY1RwIwDo4M2nm9jbYooysbm5sH4dsBAB2/Qzvtt10w2wwAxJ0Z
        XPSCHinHE0UQ==
X-Received: by 2002:a05:6402:1c8e:: with SMTP id cy14mr407917edb.39.1605196509019;
        Thu, 12 Nov 2020 07:55:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEqCHDYkFwLp6VRG0s5EgrmbldluDnIIyGJ8+blt35xKg5SssVMhnwjScV3IAHA8NN5zRhfw==
X-Received: by 2002:a05:6402:1c8e:: with SMTP id cy14mr407892edb.39.1605196508796;
        Thu, 12 Nov 2020 07:55:08 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id s3sm2305295ejv.97.2020.11.12.07.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 07:55:08 -0800 (PST)
Subject: Re: [PATCH] platform/x86: dell-privacy: Add support for new privacy
 driver
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        "Yuan, Perry" <Perry.Yuan@dell.com>
Cc:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "pali@kernel.org" <pali@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20201103125542.8572-1-Perry_Yuan@Dell.com>
 <20201104014915.45tbmnrqvccbrd2k@srcf.ucam.org>
 <SJ0PR19MB4528E93631DA5FD8BE1D6E8D84E80@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <20201111072456.tkwdzuq2wa7zvbod@srcf.ucam.org>
 <DM6PR19MB2636956DB58B0E4ECAD43549FAE80@DM6PR19MB2636.namprd19.prod.outlook.com>
 <e8e06aca-c3f1-d833-c766-01f05dfa0f37@metux.net>
 <DM6PR19MB2636D792A7CCEE8937579EA6FAE70@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <544bc53f-c260-9e46-15a9-2ec2ea41343c@redhat.com>
Date:   Thu, 12 Nov 2020 16:55:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB2636D792A7CCEE8937579EA6FAE70@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/12/20 4:31 PM, Limonciello, Mario wrote:
>>> Pressing the mute key activates a time delayed circuit to physically cut
>>> off the mute.  The LED is in the same circuit, so it reflects the true
>>> state of the HW mute.  The reason for the EC "ack" is so that software
>>> can first invoke a SW mute before the HW circuit is cut off.  Without SW
>>> cutting this off first does not affect the time delayed muting or status
>>> of the LED but there is a possibility of a "popping" noise leading to a
>>> poor user experience.
>>
>> how long is that timeout ?
> 
> The exact duration is controlled by component selection in the circuit.
> Linux is typically able to respond faster than Windows in this case.
> 
>>
>>> Exposing as an LED device allows the codec drivers notification path to
>>> EC ACK to work.
>>
>> Which driver exactly ? Who's gonna access this LED ?
> 
> The flow is like this:
> 
> 1) User presses key.  HW does stuff with this key (timeout is started)
> 2) Event is emitted from FW
> 3) Event received by dell-privacy
> 4) KEY_MICMUTE emitted from dell-privacy
> 5) Userland picks up key and modifies kcontrol for SW mute
> 6) Codec kernel driver catches and calls ledtrig_audio_set, like this:
> 
> ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led ? LED_ON : LED_OFF);
> 
> 7) If "LED" is set to on dell-privacy notifies ec, and timeout is cancelled,
> HW mic mute activated.
> 
> Again, if anything in this flow doesn't happen HW mic mute is still activated,
> just will take longer (for duration of timeout) and have popping noise.

Thank you, can we put this in a comment in the driver please ?

I guess this also means that the led_class device is just there to
catch the ledtrig_audio_set() call so that dell-firmware can tell the
EC that the sw-mute is done and that it can move ahead with the hw-mute.

While the real, physical LED is fully under hardware control, right ?

That should probably also be in the same comment in the driver
(feel free to re-use part of my wording for that if that helps).

Regards,

Hans



> 
>>
>>
>> --mtx
>>
>> --
>> ---
>> Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
>> werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
>> GPG/PGP-Schlüssel zu.
>> ---
>> Enrico Weigelt, metux IT consult
>> Free software and Linux embedded engineering
>> info@metux.net -- +49-151-27565287

