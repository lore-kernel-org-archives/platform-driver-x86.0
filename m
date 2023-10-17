Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B0DCDB474
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Oct 2023 08:51:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234766AbjJQIvV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Oct 2023 04:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234680AbjJQIvQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2023 04:51:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E17A593
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Oct 2023 01:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697532633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fR+vpqNMFr3xyDY37l8hKbjL6Vti0s+yHONs0fDemtc=;
        b=DOgst3p0PTLMy1WXlizF6W08nv+UZ5JmGiNf9c31NkdXhPDmz4JWRue3vExZSD4Yo3MvHb
        i2gV6eM7stkYJxSv5WkSSBlRh5pKbqCRHll0y6q+D/wVsoZlQlmbksuk21zBCH0XYOYuHj
        cytivxazJ/HXDwmn6JDzsgsy3GKEFEc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-KugdY6qjN1iDUt4hMNBsGA-1; Tue, 17 Oct 2023 04:50:21 -0400
X-MC-Unique: KugdY6qjN1iDUt4hMNBsGA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-53e169d2e80so4015810a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Oct 2023 01:50:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697532620; x=1698137420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fR+vpqNMFr3xyDY37l8hKbjL6Vti0s+yHONs0fDemtc=;
        b=uYCarhArERVaY0BkgUDhoW30JwN8MK5XWJym3gRBtHcx9OahBwteTBrMN5XEQS2ayb
         QZE66d7HaAbxh5g859IJWsmX+XqJEks19tJebVx2wadDyVKG8Ju+sjr/2Ezh6LZ5mH9V
         KphY7aaZCm16gBazV1yf78YFok1FveF+2EGCiwXvBagM+yY2SskgxcEKH3dQaBipMZBl
         781lNwnAF2g8itD81SEGqnhoRNI037rY/Vxpm+RMLy+9dCm8q3kqopHqCzVblLaeMB0V
         aKD7bJqwjrQy1bn4nVoxzT0exjIxO9BKy+u8CylbV5K/MJG0buEiefvXpV7yUCzBFCnu
         YsaA==
X-Gm-Message-State: AOJu0YwybJMv20ue8XVUR1QYkV+ebnpQOAu2MOolwN3O+dS99rmaqKzC
        YIdzB+3LhYd1lwnX1yDSaHMZaCfoRRx9o7D+uGSmE6rqQR4pUcRAha3KRqKOgFATx8qUe/efFIi
        CyyoXxnhFuadFrLd9xDh+BnmyHwv5jhUVuTtEdCikRQ==
X-Received: by 2002:aa7:c6d7:0:b0:522:4dd0:de72 with SMTP id b23-20020aa7c6d7000000b005224dd0de72mr1071848eds.27.1697532620449;
        Tue, 17 Oct 2023 01:50:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWQWMoBLurhT1REe+0nHnTFiVxDNpebwSrTWyOgEcuY4J15YaywyXL2nYEBr/2gur4tULYdA==
X-Received: by 2002:aa7:c6d7:0:b0:522:4dd0:de72 with SMTP id b23-20020aa7c6d7000000b005224dd0de72mr1071831eds.27.1697532620012;
        Tue, 17 Oct 2023 01:50:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a10-20020a50858a000000b005346925a474sm787265edh.43.2023.10.17.01.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:50:19 -0700 (PDT)
Message-ID: <938c83c4-973d-ac23-bfb6-53c63c153d81@redhat.com>
Date:   Tue, 17 Oct 2023 10:50:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: PROBLEM: asus_nb_wmi sends KEY_BRIGHTNESSDOWN on pressing CAPS
 Lock and PrntScrn on Zenbook S 13 UX5304VA
To:     James John <me@donjajo.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <a2c441fe-457e-44cf-a146-0ecd86b037cf@donjajo.com>
 <132feb67-c147-7ee6-b337-385e11786ec6@redhat.com>
 <146cb960-406b-4456-94ce-ad6ed3f330ad@donjajo.com>
 <d70f7d35-6458-437d-f68f-47291ce74a1e@redhat.com>
 <90a7309e-4a76-4dff-8259-9975dd3ed8b1@donjajo.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <90a7309e-4a76-4dff-8259-9975dd3ed8b1@donjajo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi James,

On 10/1/23 16:16, James John wrote:
> Hello Hans,
> 
> Thank you. I applied the patch and I have the inputs attached here.
> 
> After setting the hwdb filter, all the hot keys are still working except that the LED notification light on Mute Hotkey (F9) is no longer turning up on mute.
> 
> The Screen Capture, Disable Camera, and MyASUS buttons are not mapped yet. I believe the Screen Capture button should map to PrntScrn button, and MyASUS with Disable Camera unmapped, obviously. I also have the codes in the attached log.
> 
> Screen Capture button is KEY_UNKNOWN to evtest.

So I missed the Screen Capture button so far.
I believe that the 0x2a code should be mapped to
KEY_SELECTIVE_SCREENSHOT (to differentiate it from
the printscreen key, this is also used on other laptops
for similar buttons).

I'm going to send out a RFC series of 3 patches,
the 2 patches which I send earlier + a patch to
add a mapping for this. I'll Cc you on this.

Please give this series a try (after removing the hwdb
change).

Regards,

Hans





> On 01/10/2023 13:45, Hans de Goede wrote:
>> Hi James,
>>
>> On 10/1/23 10:46, James John wrote:
>>> Hello Han,
>>>
>>> Thank you very much for this detailed steps. I was able to reproduce this with "evtest" and everything went okay.
>>>
>>> After editing /lib/udev/hwdb.d/60-keyboarrd.hwdb as you specified, the problem has been fixed, which I believe should revert on reboot?
>> No this will fix it until /lib/udev/hwdb.d/60-keyboarrd.hwdb gets overwritten by your
>> package-manager the next time the systemd packages get updated.
>>
>>> This is the content of /sys/class/dmi/id/modalias
>>>
>>> dmi:bvnAmericanMegatrendsInternational,LLC.:bvrUX5304VA.304:bd05/16/2023:br5.27:svnASUSTeKCOMPUTERINC.:pnZenbookS13UX5304VA_UX5304VA:pvr1.0:rvnASUSTeKCOMPUTERINC.:rnUX5304VA:rvr1.0:cvnASUSTeKCOMPUTERINC.:ct10:cvr1.0:sku:
>> Thanks.
>>
>> Looking at:
>> https://bbs.archlinux.org/viewtopic.php?pid=2123716
>>
>> I see that at least one other model Asus laptop is affected too. So rather then
>> adding a more specific hwdb rule for your model I would like to try and find
>> the root cause of these 0x20 event code events when pressing capslock
>> on your laptop.
>>
>>> Yes, I built my kernel. I wish I could parse this and write a proper quirk.
>> Good, I've written a small kernel patch to get to the bottom of this (attached)
>> can you please build a kernel with this. Then boot into this kernel and
>> then run dmesg -w
>>
>> When you now press capslock you should see log lines show up which contain
>> "raw event code 0x..."
>>
>> Please let me know what these lines show when pressing capslock.
>>
>> Please also let me know what these lines show when pressing other
>> hotkeys which are handled by asus-nb-wmi (you can re-run "sudo evtest"
>> to check which keys that are).
>>
>> I think the issue might be that the asus-wmi code is filtering out
>> the higher bits of the value, which causes some new events to
>> get mapped as just 0x20 instead of some-higher-bits + 0x20.
>>
>> Also I'm wondering if everything else works as it should,
>> e.g. does changing the brightness with the brightness hotkeys
>> still work after setting up the hwdb filtering ?
>>
>> And does the lid-switch (suspend the machine when the lid is closed)
>> work ?
>>
>>
>>> Also, I don't know if this is related; the hotkeys should be enabled by default. Fn key should be for Function keys. But in the current state, it is reversed.
>> This is laptop models specific and not really controlled by Linux,
>> sometimes you can change the default in the BIOS. Or sometimes you
>> can change the default by pressing Fn + Esc.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> On 01/10/2023 09:28, Hans de Goede wrote:
>>>> Hi James,
>>>>
>>>> On 10/1/23 10:11, James John wrote:
>>>>> Hello,
>>>>>
>>>>> First of all, thank you very much for the work you do with maintaining these drivers and supporting systems. It is not an easy one.
>>>>>
>>>>> I have debugged this bug down to the asus_nb_wmi module. When I disable this module, the problem goes away, but then other hotkeys are not recognized. Attached is a debug event from libinput, where I pressed the capslock twice
>>>>>
>>>>> I have tried to dabble around with asus-nb-wmi.c codes to see if I could fix it by luck, by adding UX5304VA to `static const struct dmi_system_id asus_quirks[]` but to no avail. And I have a very little knowledge of what "quirks" are.
>>>>>
>>>>> I have attached some information regarding my hardware and kernel. I will be available to provide any more information that might be needed to resolve this.
>>>>>
>>>>> A related open thread: https://bbs.archlinux.org/viewtopic.php?pid=2123716
>>>> First of all lets confirm that the KEY_BRIGHTNESSDOWN events are really coming from asus_nb_wmi.
>>>>
>>>> Please install evtest and then run "sudo evtest" and then select the "Asus WMI hotkeys" device
>>>> by typing its number followed by enter.
>>>>
>>>> After this reproduce the bug and see if the log shows KEY_BRIGHTNESSDOWN.
>>>>
>>>> Since you said you tried playing around with the quirks, I assume you can build
>>>> your own kernel, please let me know if that is wrong.
>>>>
>>>> If this confirms the KEY_BRIGHTNESSDOWN events are coming from the "Asus WMI hotkeys" device,
>>>> then please edit /lib/udev/hwdb.d/60-keyboard.hwdb
>>>>
>>>> And search for "Asus WMI hotkeys", this should find this section:
>>>>
>>>> evdev:name:Asus WMI hotkeys:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
>>>> evdev:name:Eee PC WMI hotkeys:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
>>>> evdev:name:Asus Laptop extra buttons:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
>>>>    KEYBOARD_KEY_6b=f21                                    # Touchpad Toggle
>>>>    KEYBOARD_KEY_7c=f20                                    # Remap micmute to f20
>>>>
>>>> Change this to:
>>>>
>>>> evdev:name:Asus WMI hotkeys:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
>>>> evdev:name:Eee PC WMI hotkeys:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
>>>> evdev:name:Asus Laptop extra buttons:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
>>>>    KEYBOARD_KEY_6b=f21                                    # Touchpad Toggle
>>>>    KEYBOARD_KEY_7c=f20                                    # Remap micmute to f20
>>>>    KEYBOARD_KEY_20=unknown
>>>>
>>>> And then run "sudo udevadm hwdb --update" followed by "sudo udevadm trigger",
>>>> that should filter out the spurious keypresses.
>>>>
>>>> If that helps, please run:
>>>>
>>>> cat /sys/class/dmi/id/modalias
>>>>
>>>> So that a proper DMI based quirk to only to the filtering on your model
>>>> can be written.
>>>>
>>>> Regards,
>>>>
>>>> Hans
>>>>

