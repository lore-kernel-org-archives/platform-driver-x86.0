Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8843C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 12:38:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiKJMiG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 07:38:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiKJMiG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 07:38:06 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C507A6BDFC
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 04:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668083823;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+RrtwGIWtEaMobv23/wyqQI4vWyrotDgshX6WW6kL5s=;
        b=PmwRDgCmOB4c1hjHCoaV5PD1oCx5Gu97RvN4IClt2VBR9r3xwGQgGB4aNBgcTwzPULl50+
        j6o0ZQvM8/8KXQlpCp5MHJpHXw1wKqB79SXnRr59k19ol5xp9wryqVn1mE/yFkSzRIJ0RR
        Yeg/nvGVf+xDWnXgaw5JswKv8k3x0q4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-349--xW9Jq6lO7q9jq_S8QR4mg-1; Thu, 10 Nov 2022 07:37:02 -0500
X-MC-Unique: -xW9Jq6lO7q9jq_S8QR4mg-1
Received: by mail-ed1-f72.google.com with SMTP id f20-20020a0564021e9400b00461ea0ce17cso1412243edf.16
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 04:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RrtwGIWtEaMobv23/wyqQI4vWyrotDgshX6WW6kL5s=;
        b=XzRmkcWhq8GVIo0M8eqjBX/Jt7dmNxzbSHViLwuvbCcEj14ZzP58q/8SKkSVj9TdEN
         4oIxtStOC53PzgdCPHgCqUrytdhj+Cglky0lyWSt/BH2OsFlW2/Hd8p4Bj47NT29NbsC
         KIAsSu5hldT85M4NfC470JmAsv/HklIVxKGulT/3A1JmwHLWmmqZNW5yKuXR8xc30+pf
         8hgUnwGsAqmLxjoXyVmU/iDELbQgv19dzl7BYq0JcRUK0s4za+Qfkh2pvttYAPSl6sWZ
         Qyy+DvezVwLRLt1gPVinECDDPLxFjVreiqe7IaD6MIdCIMSy0KsYuCdLy2N296gSbfKX
         iycg==
X-Gm-Message-State: ACrzQf1n2YLxkINyUMa+AW51dC4Q5Z+GKRXIyPpyQV+saZZ7Be14aVBe
        ZhM5SThyTvnlEYRMly5txsOa+ufibbKNpi3DijjLevAsk6i1Gv3nZxBcRejC9A8lA8WbfMBbPz+
        LEyBRDEi6KxMk6kF8nntKeOqxDYluppnv/A==
X-Received: by 2002:a50:c31c:0:b0:461:f5ce:63fe with SMTP id a28-20020a50c31c000000b00461f5ce63femr2175782edb.362.1668083821205;
        Thu, 10 Nov 2022 04:37:01 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6OavYfT2mUlL6Zkqyhns5Ya9zKYWE/HWlSqg5D0qTLjf9m3Ptu1KG43AG9RiBXWDDIcd3E1g==
X-Received: by 2002:a50:c31c:0:b0:461:f5ce:63fe with SMTP id a28-20020a50c31c000000b00461f5ce63femr2175766edb.362.1668083820816;
        Thu, 10 Nov 2022 04:37:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090604d200b007822196378asm7347594eja.176.2022.11.10.04.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 04:37:00 -0800 (PST)
Message-ID: <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com>
Date:   Thu, 10 Nov 2022 13:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Content-Language: en-US, nl
To:     =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>,
        maxtram95@gmail.com
Cc:     cleverline1mc@gmail.com, g_goessel@outlook.com,
        ike.pan@canonical.com, jiaxun.yang@flygoat.com,
        limanyi@uniontech.com, mjg59@srcf.ucam.org,
        platform-driver-x86@vger.kernel.org
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
 <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
 <20221110120022.35041-1-erayorcunus@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221110120022.35041-1-erayorcunus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Eray,

On 11/10/22 13:00, Eray Orçunus wrote:
> Hi all,
> 
> I don't know is this correct; but I'll reply to 2 messages, firstly to OP.

It is fine, no worries :)

> On Wed, 9 Nov 2022 at 22:59, Hans de Goede <hdegoede@redhat.com> wrote:
>> 3. Please test
>> ==============
>>
>> If you have ideapads where touchpad_ctrl_via_ec should be 1 because
>> it is needed to toggle the touchpad on/off with the hotkey.
>>
>> Or the exact opposite you have ideapads where it should be disabled
>> because ideapad_sync_touchpad_state() turning off the ps/2 aux port
>> is causing problems.
>>
>> Then please give the attached patch a try. Note this applies on
>> top of Torvald's current master, or on top of 6.0 with :
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a231224a601c
>> added.
> 
> While I agree with your findings(and thanks for your effort, I also tried
> to solve this but later gave up), they doesn't apply to one type of
> IdeaPads (like my 520-15IKB), so I'm sure this patch won't work on me.
> This is because my IdeaPad has this features:
> 
> - i8042.noaux doesn't affect touchpad, and it's connected over i2c
> - There is no touchpad LED, and touchpad hotkey only sends "key pressed"
>   ACPI event, doesn't do anything else
> - VPCCMD_W_TOUCHPAD does nothing (also confirmed on Windows)
> - Sending 1 to VPCCMD_W_TOUCHPAD on boot is not needed
> - VPCCMD_R_TOUCHPAD always returns 1 (this is interesting)

So if i8042.noaux does not do anything, then why do you want to add
"SYNA2B33" to the list of ACPI HIDs for which we set:

features.touchpad_ctrl_via_ec=0;

?

IOW what bad effects / behavior are you seeing with touchpad_ctrl_via_ec=1?

Or are you seeing bad behavior on some other modes? If yes, then what
is the bad behavior you are seeing on other models ?

> So I agree on Maxim's solutions, and I have an idea on how to implement
> it, I will explain it below.
> 
> On 10 Nov 2022 at 00:39, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
>> Normally, when EC doesn't disable the
>> touchpad, we can send KEY_TOUCHPAD_TOGGLE and leave the action to the
>> DE. However, as Z570 has this LED, which will get out of sync with the
>> touchpad state, we can't use KEY_TOUCHPAD_TOGGLE.
>>
>> That leads to the following idea: if newer Lenovos have issues with
>> VPCCMD_R_TOUCHPAD and they don't have the touchpad LED, we can just
>> use KEY_TOUCHPAD_TOGGLE for them. However, if it turns out that some
>> Lenovo model does actually disable the touchpad in hardware, this also
>> needs to be taken into account.
> 
> Completely agreed.
> 
>> However, this idea doesn't answer the question of how to detect such
>> laptops. I wonder how the Windows driver does it.
> 
> I reverse engineered Lenovo Utility/Hotkeys programs of ~5 IdeaPads,
> and I can say they send VPCCMD_W_TOUCHPAD unconditionally, without any
> check if it's working or not. This includes 720s and 520-15IKB, which
> don't have working VPCCMD_W_TOUCHPAD. This is because it's the
> working-in-background touchpad helper program catches the hotkey ACPI
> event (I think) and handles the situation. This can be confirmed by
> killing Lenovo programs on these IdeaPads won't affect the touchpad
> toggle hotkey.

Ok, VPCCMD_W_TOUCHPAD with a value of 1 not being harmful
matches with current the ideapad-laptop code which actually does
this when features.touchpad_ctrl_via_ec == 0:

       if (!priv->features.touchpad_ctrl_via_ec)
                write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, 1);

I think that before trying to come up with a solution here,
we first need to identify what part of the code enabled by
touchpad_ctrl_via_ec == 1 is actually causing issues for people.

Unfortunately non of the commit messages of the commits adding
touchpad_ctrl_via_ec=0 quirks actually properly describe the
unwanted behavior users are seeing with touchpad_ctrl_via_ec=1

I'm guessing that this part:

                unsigned char param;
                /*
                 * Some IdeaPads don't really turn off touchpad - they only
                 * switch the LED state. We (de)activate KBC AUX port to turn
                 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
                 * KEY_TOUCHPAD_ON to not to get out of sync with LED
                 */
                i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);

May cause issues on some models. It definitely feels fishy and
I would like to disable this except on models where:

1. There is a LED controlled by some touchpad on/off hotkey; and
2. The EC fails to disable the touchpad itself

Which would currently mean only enable this bit on Maxim's Z570
using a DMI based allow list.

###

I know from experience that this part:

                ideapad_input_report(priv, value ? 67 : 66);

Also is a bit troublesome on some models causing spurious touchpad
on/off OSD notifications after suspend/resume.

I'm not sure what to do there. If the touchpad gets disabled
in hw by the EC itself then sending KEY_TOUCHPAD_TOGGLE seems
wrong, especially since then the userspace touchpad state and
the EC touchpad state can get out of sync...

>> I need to check it, but it's entirely possible that the touchpad state
>> is preserved after reboot. In that case, reading VPCCMD_R_TOUCHPAD as
>> 0 on boot would be normal. I think it's also possible that the user can
>> disable the touchpad before Linux starts. This approach looks problematic.
> 
> I agree on we can't rely VPCCMD_R_TOUCHPAD to be 0 on boot, because
> it always returns 1 for me, yet I don't have working VPCCMD_W_TOUCHPAD.

Ok, so that idea is a no go then, thanks for testing.

> 
>> 1. Just send KEY_TOUCHPAD_ON/OFF if EC disables the touchpad (any
>> known models?).
> 
> If you mean the cases when the laptop toggles touchpad itself when
> touchpad hotkey is pressed. Good news is(I hope): I don't think there are
> such IdeaPads, yet this still needs confirmation.

At least on Maxim's Z570 the laptop does toggle the value
returned by VPCCMD_R_TOUCHPAD and the LED it self, while at the
same time not actually disabling the touchpad.

> If you mean the cases where VPCCMD_W_TOUCHPAD works, I agree with you,
> yet we don't know how to find/detect these IdeaPads :/
> 
> But if we can assume the IdeaPads produced before 2015 all have PS/2
> touchpads (at least the ~10 DSDTs I checked all had one), and/or have
> VPCCMD_W_TOUCHPAD, why don't we send both VPCCMD_W_TOUCHPAD and i8042
> command when "touchpad" attr set on these IdeaPads? 
> ~10 pre-2015 IdeaPad DSDTs I checked all either had MSS[0-9] or PS2K
> devices representing the touchpad, and I believe they were all using
> PS/2 interface. Here are these IdeaPads:
> 
> S10-3 (PS2M)
> S12 (PS2M)
> Y530 (PS2M)
> B550 (PS2M)
> U510 (MSS*)
> G500 (MSS*)
> G570 (MSS*)
> As an exception; Yoga 910(2016) has both TPD0 and PS2M, so we should
> check if PS2M is present/connected I think.
> 
> So my suggestion is, if we're sure touchpad is connected over PS/2,
> (it's up to you how to detect it, it can be either checking AUX on i8042
> or checking MSS[0-9] and PS2K on ACPI) we can expose "touchpad" attr.
> 
> Otherwise... I say we can stop using VPCCMD_W_TOUCHPAD. I think we
> have no reliable way to check if it works. Maybe we can use i2c APIs
> instead to toggle touchpad instead, but I don't know if this can work/
> possible at all.
> Oh, or maybe we can use a whilelist for that? For the IdeaPads that have
> i2c touchpads and also controllable by EC.
> 
>> 2. Disable the touchpad in the driver if the laptop has the LED and EC
>> doesn't disable the touchpad (Z570).
> 
> I think all IdeaPads with touchpad LED use PS/2 for touchpad (because
> they're old), so I repeat my recommendation above.
> 
>> 3. Just send KEY_TOUCHPAD_TOGGLE if the laptop doesn't have the LED
>> and EC doesn't disable the touchpad (any known models?).
> 
> I agree. I think mainly 2015+ IdeaPads fall under this category, so my
> suggestion is to not expose/use VPCCMD_W_TOUCHPAD on any IdeaPads with i2c
> touchpad, and send KEY_TOUCHPAD_TOGGLE instead.

The problem is this all relies on being able to detect i2c vs ps/2
touchpads which is not as simple as it sounds. Specifically many
new touchpad are connected to both busses at the same time, offering
a ps/2 mode by default for compatibility with older software / os-es
and being able to switch to a modern i2c/smbus mode for better performance.

I've asked Benjamin Tissoires, the kernel expert on this about this
and his answer was that it is almost impossible to determine if
a touchpad is going to be using ps/2 or i2c without first waiting
for the whole driver stack to have initialized and then see which
driver(s) are attached and I guess even then the touchpad might
show up as both ps/2 + i2c with only one of them actually generating
events:

https://lore.kernel.org/linux-input/ae50236e-1ce8-b526-9c17-7bc0463ebb86@redhat.com/T/#u

So based on Benjamin's answer I'm afraid that trying to differentiate
between i2c vs ps2 is not really doable.

###

An alternative proposal for a fix for this
==========================================

0: identify the currently troublesome behavior
---------------------------------------------------

As mentioned above I believe there are 2 potentially
troublesome things done one newer laptops when
touchpad_ctrl_via_ec == 1:

1. i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE)
2. Sending of wrong/spurious KEY_TOUCHPAD_OFF / KEY_TOUCHPAD_ON events.

1: Fixing undesirable i8042_command(... I8042_CMD_AUX_DISABLE) calls
--------------------------------------------------------------------

My suggestion is to move to an allow-list for this and for now
populate that list with only the DMI strings for Maxim's Z570 and see
from there.

2: Fixing wrong/spurious KEY_TOUCHPAD_OFF / KEY_TOUCHPAD_ON events
------------------------------------------------------------------

There are 2 subcases here:

2.1: Fix sending of KEY_TOUCHPAD_OFF/_ON events at probe/resume
---------------------------------------------------------------

We can simply fix this by giving ideapad_sync_touchpad_state()
a parameter to let it know if events should be send at all and
set that parameter to false when called on probe/resume

2.2: Sending wrong KEY_TOUCHPAD_OFF/_ON events at toggle time
-------------------------------------------------------------

On models where the EC does not control the touchpad at all,
currently we still do ideapad_sync_touchpad_state() and then
send either KEY_TOUCHPAD_OFF or _ON based on the value read
from VPCCMD_R_TOUCHPAD.

But on these models VPCCMD_R_TOUCHPAD always returns 0 or 1,
so we always send KEY_TOUCHPAD_OFF or always send KEY_TOUCHPAD_ON,
instead of toggling the state / asking userspace to toggle
its sw touchpad on/off state.

I believe we can detect this case by checking that
the value read from VPCCMD_R_TOUCHPAD has not changed
despite us receiving a notify with bit 5 being set in
the value read from VPCCMD_R_VPC1.

My suggestion to fix this case is to detect when the value
read from VPCCMD_R_TOUCHPAD does not change and in that
case send KEY_TOUCHPAD_TOGGLE to userspace.

Regards,

Hans


p.s.

If any of you wants to discuss this in realtime you can
find me as hansg on irc in #fedora-laptops on libera.chat
or in #dri-devel on OFTC.

