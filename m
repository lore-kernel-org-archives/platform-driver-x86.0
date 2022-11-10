Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B67FC4167B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 16:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbiKJQm2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 11:42:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbiKJQm2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 11:42:28 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B56A42F49
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 08:42:25 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id kt23so6429384ejc.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 08:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utqw5haG7wqGhF5lk/9o/lJWm9QPpVcKGHSOJkwctUs=;
        b=LYjbD9xLZZ5IZS3XSwrTUrSmYpoveZGZhcW0REcBHpbNaWADrWPLLXVeSmNQXLIaQ2
         beu3c/6ON2pSRZ7ELktd22sJranIfSH2SLBWWUVdIOd3j9I25+VslYScwEe1oXuYfdlF
         1pXqjNyR2bugmMTWWAIMi1UwH/f/DrivQxVqXQGZpHhfkvN9EVS3wiAdoqp+jb9rLZd7
         9u4nxLY0pCA4l10iV9AalGSbYfJ8ZWjAwaB0Rj2b5ra99Brf5geGJJFIakPk+oFZnni6
         tlM3v3Ev/RcV7wSV/bgzzUXKUyN5Wm+PmKaKv+FcyXJ16pG1+vxYPyLWIkVxM0LU1gvL
         tNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utqw5haG7wqGhF5lk/9o/lJWm9QPpVcKGHSOJkwctUs=;
        b=sLdCm3qkQISq3CjHXpj+iCdCt5mVp7Gi2Z//9bP5VcLnz6pmGfKpJ0Emy1HUq8FlvO
         FVKP/M8HjUgUUky636WJhBUm2p+Pry/NqCoXgQmR9DfxDcL/EaSNTJMSJmdq6uMg0MjH
         POcjomenHeQgdlSPBcdRgQ5dxQ6pJ3+FZm16E39AplrCCMGHE11ByGSKvlkMj5tFL/Bu
         IM0arr8YCjj8/e7HjXIMeJN2WzrlOdZuCOWo7+TbdM3cuLKzfcOanhvnu/3lGrwEOx3b
         dmqdy4hCcIHJINt2V9ezzzd+RLfdcGVaXX+ePwVeAC0TWuxG/ot8tUDXigJbVz4wYqZI
         yZoQ==
X-Gm-Message-State: ACrzQf2tJk1KFF4DjQCBYdkwNWJqF0qEqaktLEGz9x80mISdos0DSKDt
        QlrOw4QKH1cvCLfbJtu4GPn0+kJWKBvqCQ==
X-Google-Smtp-Source: AMsMyM4GPk3DaB2gO7kEhkmclC4wF5T9pp4HYunBBe+vPj5qFxj7Iz9PgOddP8Ygho68nXAGHYwu1w==
X-Received: by 2002:a17:906:b009:b0:78c:fda3:c025 with SMTP id v9-20020a170906b00900b0078cfda3c025mr3157146ejy.461.1668098543927;
        Thu, 10 Nov 2022 08:42:23 -0800 (PST)
Received: from eray-Lenovo-Z50-70.. ([188.132.247.187])
        by smtp.googlemail.com with ESMTPSA id ca26-20020a170906a3da00b0078b03d57fa7sm7306927ejb.34.2022.11.10.08.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 08:42:23 -0800 (PST)
From:   =?UTF-8?q?Eray=20Or=C3=A7unus?= <erayorcunus@gmail.com>
To:     hdegoede@redhat.com
Cc:     cleverline1mc@gmail.com, erayorcunus@gmail.com,
        g_goessel@outlook.com, ike.pan@canonical.com,
        jiaxun.yang@flygoat.com, limanyi@uniontech.com,
        maxtram95@gmail.com, mjg59@srcf.ucam.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Date:   Thu, 10 Nov 2022 19:42:20 +0300
Message-Id: <20221110164220.46640-1-erayorcunus@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com>
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com> <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com> <20221110120022.35041-1-erayorcunus@gmail.com> <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 10 Nov 2022 at 15:37, Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/10/22 13:00, Eray Orçunus wrote:
> > While I agree with your findings(and thanks for your effort, I also tried
> > to solve this but later gave up), they doesn't apply to one type of
> > IdeaPads (like my 520-15IKB), so I'm sure this patch won't work on me.
> > This is because my IdeaPad has this features:
> > 
> > - i8042.noaux doesn't affect touchpad, and it's connected over i2c
> > - There is no touchpad LED, and touchpad hotkey only sends "key pressed"
> >   ACPI event, doesn't do anything else
> > - VPCCMD_W_TOUCHPAD does nothing (also confirmed on Windows)
> > - Sending 1 to VPCCMD_W_TOUCHPAD on boot is not needed
> > - VPCCMD_R_TOUCHPAD always returns 1 (this is interesting)
> 
> So if i8042.noaux does not do anything, then why do you want to add
> "SYNA2B33" to the list of ACPI HIDs for which we set:
> 
> features.touchpad_ctrl_via_ec=0;
> 
> ?
> 
> IOW what bad effects / behavior are you seeing with touchpad_ctrl_via_ec=1?
> 
> Or are you seeing bad behavior on some other modes? If yes, then what
> is the bad behavior you are seeing on other models ?

It was just because I didn't want to have a not working "touchpad"
attribute :) I used/still using several GNOME extensions and they show
me "Touchpad" toggle just because I have "touchpad" attribute exposed
there, which is doing nothing, and misleading.

But I would understand if you don't want to touch it at that stage, and
you would rather prefer not working "touchpad" attributes to not
exposed "touchpad" attributes that would have been perfectly working.

> I'm guessing that this part:
> 
>                 unsigned char param;
>                 /*
>                  * Some IdeaPads don't really turn off touchpad - they only
>                  * switch the LED state. We (de)activate KBC AUX port to turn
>                  * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>                  * KEY_TOUCHPAD_ON to not to get out of sync with LED
>                  */
>                 i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
> 
> May cause issues on some models. It definitely feels fishy and
> I would like to disable this except on models where:
> 
> 1. There is a LED controlled by some touchpad on/off hotkey; and
> 2. The EC fails to disable the touchpad itself
> 
> Which would currently mean only enable this bit on Maxim's Z570
> using a DMI based allow list.

Agreed, but do you mean "and" or "or"? I mean we can also include the
models that toggle touchpad value while not really toggling the touchpad
(just as you described below) and don't have a touchpad LED (but I don't
know if such model exists really), this way they won't go out of sync
regardless of is there a touchpad LED or not.

> At least on Maxim's Z570 the laptop does toggle the value
> returned by VPCCMD_R_TOUCHPAD and the LED it self, while at the
> same time not actually disabling the touchpad.
> The problem is this all relies on being able to detect i2c vs ps/2
> touchpads which is not as simple as it sounds. Specifically many
> new touchpad are connected to both busses at the same time, offering
> a ps/2 mode by default for compatibility with older software / os-es
> and being able to switch to a modern i2c/smbus mode for better performance.
> 
> I've asked Benjamin Tissoires, the kernel expert on this about this
> and his answer was that it is almost impossible to determine if
> a touchpad is going to be using ps/2 or i2c without first waiting
> for the whole driver stack to have initialized and then see which
> driver(s) are attached and I guess even then the touchpad might
> show up as both ps/2 + i2c with only one of them actually generating
> events:
> 
> https://lore.kernel.org/linux-input/ae50236e-1ce8-b526-9c17-7bc0463ebb86@redhat.com/T/#u
> 
> So based on Benjamin's answer I'm afraid that trying to differentiate
> between i2c vs ps2 is not really doable.

Thanks for the explanation and the link, but as Benjamin said, I believe
we can use ACPI table for detecting PS/2 devices. I believe the DSDTs
with PS2M(and probably MSS[0-9] too) devices probably have PS/2 touchpad,
and have working EC and i8042 commands. Yet this still needs
confirmation/testing, and I think should be resorted if your suggestion
below won't work - your suggestion looks better and easier.

> 1: Fixing undesirable i8042_command(... I8042_CMD_AUX_DISABLE) calls
> --------------------------------------------------------------------
> 
> My suggestion is to move to an allow-list for this and for now
> populate that list with only the DMI strings for Maxim's Z570 and see
> from there.

Agreed.

> 
> 2: Fixing wrong/spurious KEY_TOUCHPAD_OFF / KEY_TOUCHPAD_ON events
> ------------------------------------------------------------------
> 
> There are 2 subcases here:
> 
> 2.1: Fix sending of KEY_TOUCHPAD_OFF/_ON events at probe/resume
> ---------------------------------------------------------------
> 
> We can simply fix this by giving ideapad_sync_touchpad_state()
> a parameter to let it know if events should be send at all and
> set that parameter to false when called on probe/resume

Agreed.

> 2.2: Sending wrong KEY_TOUCHPAD_OFF/_ON events at toggle time
> -------------------------------------------------------------
> 
> On models where the EC does not control the touchpad at all,
> currently we still do ideapad_sync_touchpad_state() and then
> send either KEY_TOUCHPAD_OFF or _ON based on the value read
> from VPCCMD_R_TOUCHPAD.
> 
> But on these models VPCCMD_R_TOUCHPAD always returns 0 or 1,
> so we always send KEY_TOUCHPAD_OFF or always send KEY_TOUCHPAD_ON,
> instead of toggling the state / asking userspace to toggle
> its sw touchpad on/off state.
> 
> I believe we can detect this case by checking that
> the value read from VPCCMD_R_TOUCHPAD has not changed
> despite us receiving a notify with bit 5 being set in
> the value read from VPCCMD_R_VPC1.
> 
> My suggestion to fix this case is to detect when the value
> read from VPCCMD_R_TOUCHPAD does not change and in that
> case send KEY_TOUCHPAD_TOGGLE to userspace.

While this is an awesome idea, what about doing this at boot?
Like we will send 0 first, then check if it reads 0, then send 1,
and confirm if it reads 1. This would be the ultimate solution, and
would also fix my "cosmetic" concerns :)

Best,
Eray
