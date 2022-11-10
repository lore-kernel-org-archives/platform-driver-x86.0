Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF516C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 19:15:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbiKJTPf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 14:15:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiKJTPe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 14:15:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EE6303F0
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 11:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668107677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q82LRWqcmmR9A3Hsv1GjpzNa5/cMETAPjtg7lsDwOos=;
        b=J7AQjUYsG2D90kliEKAFX5z6Fkfnvq/AiqV+HYJ/gXp8UfptcDXq4fi4TJjSdIhaL2MeH9
        O8XPGsG3c5lpBKjktz328yvtA5IaLcVHfjYIxln4eBCcPh4qLFCoLQ4vKJ1PonYTWJoIvy
        5w5GmKuFgqAWPbksfgSt3Dr9kQcPz5k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-MJKVK4UOMpSQvlv2q7lotw-1; Thu, 10 Nov 2022 14:14:34 -0500
X-MC-Unique: MJKVK4UOMpSQvlv2q7lotw-1
Received: by mail-ed1-f72.google.com with SMTP id l18-20020a056402255200b004633509768bso2126992edb.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 11:14:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q82LRWqcmmR9A3Hsv1GjpzNa5/cMETAPjtg7lsDwOos=;
        b=MEK/fGtW4/zeizf5wr3eLU+y6azTZjlQ8k/4FtqKCbdkUIOuPnZ6xwpW9Ok5/Nnyup
         0EfXSKtXmY9tscRCuUkTcIzq4FK9HBInt5L8PzyGPkcBz2uRpoPurXGGQu1CiL2WFKfy
         2ClE+QIAe9C389UXZrDCNwWXVqkCvWMB6Fegte+qJnGxMiy4XE63ngsMYLBS2T63pFfo
         VBe5ByHv6o6sdL5npOJRCErrb6IcQkjywYAXmZzeG0nCXB2mZ65InYgJ81FAvh81vzvj
         1W++VeA8suiw/Yaif3hPoKxY8C9nAzXl5iEjM2HpSi1eDrr1rHUPJXUVmPHJ+L03Z9NT
         LwKw==
X-Gm-Message-State: ACrzQf2G3NslVaehNmfWTBeXC6JhoFhE3lzCjru7WNmn4lZGwnJMnsMh
        ptxpnmmavU8FsaWFdriR7b9aIa5ZQwR/o73Ry6Vc7aD1E7O17MZueRl8h3jsb9w+I2GdHGB4b7D
        5rgTHLuImti1lt7eLv+I+GPGEWbhVxQ3v9A==
X-Received: by 2002:a05:6402:550e:b0:458:ea8c:bfb4 with SMTP id fi14-20020a056402550e00b00458ea8cbfb4mr3215029edb.419.1668107673328;
        Thu, 10 Nov 2022 11:14:33 -0800 (PST)
X-Google-Smtp-Source: AMsMyM59c7F3n2NIjBK7d780yqKS1NL9ncnIRbB2aD88W7rvfzPGS35NRK0NMlyi4uij8pF8oG4/Nw==
X-Received: by 2002:a05:6402:550e:b0:458:ea8c:bfb4 with SMTP id fi14-20020a056402550e00b00458ea8cbfb4mr3215010edb.419.1668107673103;
        Thu, 10 Nov 2022 11:14:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id v17-20020a1709067d9100b0074134543f82sm35595ejo.90.2022.11.10.11.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 11:14:32 -0800 (PST)
Message-ID: <32a49151-b2d9-24c6-2e46-ca4099965ae1@redhat.com>
Date:   Thu, 10 Nov 2022 20:14:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Content-Language: en-US, nl
To:     Maxim Mikityanskiy <maxtram95@gmail.com>,
        =?UTF-8?Q?Eray_Or=c3=a7unus?= <erayorcunus@gmail.com>
Cc:     cleverline1mc@gmail.com, g_goessel@outlook.com,
        ike.pan@canonical.com, jiaxun.yang@flygoat.com,
        limanyi@uniontech.com, mjg59@srcf.ucam.org,
        platform-driver-x86@vger.kernel.org
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
 <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
 <20221110120022.35041-1-erayorcunus@gmail.com>
 <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com>
 <20221110164220.46640-1-erayorcunus@gmail.com>
 <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com>
 <CAKErNvpJddZpbyyARjr6iWn=VPQ+Wy59z=o78ejj-k8eNxSukQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAKErNvpJddZpbyyARjr6iWn=VPQ+Wy59z=o78ejj-k8eNxSukQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/10/22 19:09, Maxim Mikityanskiy wrote:
> On Thu, 10 Nov 2022 at 19:54, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
>>
>> On Thu, 10 Nov 2022 at 18:42, Eray Orçunus <erayorcunus@gmail.com> wrote:
>>>
>>> Hi Hans,
>>>
>>> On 10 Nov 2022 at 15:37, Hans de Goede <hdegoede@redhat.com> wrote:
>>>> On 11/10/22 13:00, Eray Orçunus wrote:
>>>>> While I agree with your findings(and thanks for your effort, I also tried
>>>>> to solve this but later gave up), they doesn't apply to one type of
>>>>> IdeaPads (like my 520-15IKB), so I'm sure this patch won't work on me.
>>>>> This is because my IdeaPad has this features:
>>>>>
>>>>> - i8042.noaux doesn't affect touchpad, and it's connected over i2c
>>>>> - There is no touchpad LED, and touchpad hotkey only sends "key pressed"
>>>>>   ACPI event, doesn't do anything else
>>>>> - VPCCMD_W_TOUCHPAD does nothing (also confirmed on Windows)
>>>>> - Sending 1 to VPCCMD_W_TOUCHPAD on boot is not needed
>>>>> - VPCCMD_R_TOUCHPAD always returns 1 (this is interesting)
>>>>
>>>> So if i8042.noaux does not do anything, then why do you want to add
>>>> "SYNA2B33" to the list of ACPI HIDs for which we set:
>>>>
>>>> features.touchpad_ctrl_via_ec=0;
>>>>
>>>> ?
>>>>
>>>> IOW what bad effects / behavior are you seeing with touchpad_ctrl_via_ec=1?
>>>>
>>>> Or are you seeing bad behavior on some other modes? If yes, then what
>>>> is the bad behavior you are seeing on other models ?
>>>
>>> It was just because I didn't want to have a not working "touchpad"
>>> attribute :) I used/still using several GNOME extensions and they show
>>> me "Touchpad" toggle just because I have "touchpad" attribute exposed
>>> there, which is doing nothing, and misleading.
>>>
>>> But I would understand if you don't want to touch it at that stage, and
>>> you would rather prefer not working "touchpad" attributes to not
>>> exposed "touchpad" attributes that would have been perfectly working.
>>>
>>>> I'm guessing that this part:
>>>>
>>>>                 unsigned char param;
>>>>                 /*
>>>>                  * Some IdeaPads don't really turn off touchpad - they only
>>>>                  * switch the LED state. We (de)activate KBC AUX port to turn
>>>>                  * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>>>>                  * KEY_TOUCHPAD_ON to not to get out of sync with LED
>>>>                  */
>>>>                 i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>>>>
>>>> May cause issues on some models. It definitely feels fishy and
>>>> I would like to disable this except on models where:
>>>>
>>>> 1. There is a LED controlled by some touchpad on/off hotkey; and
>>>> 2. The EC fails to disable the touchpad itself
>>>>
>>>> Which would currently mean only enable this bit on Maxim's Z570
>>>> using a DMI based allow list.
>>
>> A small note on the DMI allow-list: I don't think Z570 is the only
>> laptop where EC fails to disable the touchpad. While I would like this
>> hack to affect as few laptops as possible, I would expect that other
>> similar models produced in the same time period suffer from the same
>> issue, and I don't think we have the full list of them.
> 
> And another idea: i8042_command(I8042_CMD_AUX_DISABLE) can be replaced
> with installing a i8042_platform_filter that will filter out all
> I8042_STR_AUXDATA when the touchpad should be disabled. It's
> definitely less fishy, we don't touch the KBC, but simply filter out
> events in software.

That can still cause issues for dual-mode (i2c + ps2) touchpads which
initially get probed in ps2 mode and then switched over to i2c mode later.

Often this switching over needs to be redone at resume time too,
so for this to work we really need the ps2 aux port to fully work.

I do agree using a platform filter would be somewhat cleaner, but
what we have now has been in use for a long time now without issues,
so I'm in favor of an if it aint broken don't fix approach here.

That is on devices where we need to actually do something to disable
ps2 aux traffic, lets keep the current approach. While try to just not
mess with the i8042 controller *at all* on other devices.

Regards,

Hans


