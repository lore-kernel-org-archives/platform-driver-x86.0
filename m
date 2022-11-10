Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A62C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 12:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbiKJMAe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 07:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiKJMAa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 07:00:30 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DF51F2E4
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 04:00:28 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id v27so2748634eda.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 04:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95VU5v8OfsYwjzcO1z1Xo5ZTXUdDOqV5tDSF1jctQbU=;
        b=kvHVtCh0JwM1tKywW3NjqYJf21lMm47odDg+hK83PUhmUPu2Ro0uj0Pj3Dn5X8i7bP
         65V9Q6asXSxM+y8/WuRUA+lBxql65tnGZOIgjchQm57VV/N5bi4BijoHnRq/Jl7D0Es4
         PZl4xHsO+FcXSBVZ41pKnC38Lh+NaBM3/tvldTNxKw8xU8JUOZHWJTEA34wJNfcm7x7E
         QpZl+YC31dY2hDN6pDpI+2KB9WuuqNtoy4cW3wG9SPkJjBtLTN0/rY8Qqp2CeohmvYAL
         4a9JZ8Csj3KnfJSO1iToQej+ovoTzNZohsyDF2SuZAJSrfZp/N8vFTwKB5VIelRDlOlb
         hYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95VU5v8OfsYwjzcO1z1Xo5ZTXUdDOqV5tDSF1jctQbU=;
        b=7cYzPiEqruQ3Zfa8jyShSB7CAWy3XCFBDmJqG2IKpEf+yTJ+mG1IIaBxywAPp6is2P
         Zm2r2tOVHpvMA0CCsR+II7xI4Hz5nqRr6drB7xefkt553bPM8lrJavJMBTTLJmijOUnu
         xpeBbIpxk6WehPZ+5ElpyM4+rg6kxKqtFBS8gGLgd5Yl6Z47ct1rqkManYK2uZUMphC2
         mh/tVcW+ljgu0HIX3w8+revuKTjN9GDdier2+mWI2yyYmtPU9DXgVQnhsX1SlnmX8n+6
         PjkfuTEMIZ6U9QlTR1v9gYNz9Hg1QJYMxIKfPc5DHtsTMwpYPFQt+F1L+ljD7wVyhDOm
         NAjQ==
X-Gm-Message-State: ANoB5pnqFNWmuP0zHLw8PudMy0y4lCZXs5OBZ9Ud8LxoRPf8FJUD9uyl
        W32Wy+i3YG3Y34hr5Q/YH8w=
X-Google-Smtp-Source: AA0mqf7uhvJRduLEqA4hu6OgxHPJu6b7I63WnpoyfJIag70ywS6dZjyzb+aDN4pBucVfSqJxIbI/Wg==
X-Received: by 2002:aa7:db4e:0:b0:463:2979:5e49 with SMTP id n14-20020aa7db4e000000b0046329795e49mr18794482edt.266.1668081627099;
        Thu, 10 Nov 2022 04:00:27 -0800 (PST)
Received: from eray-Lenovo-Z50-70.. ([188.132.247.187])
        by smtp.googlemail.com with ESMTPSA id g16-20020a50ec10000000b00461621cae1fsm8392622edr.16.2022.11.10.04.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 04:00:26 -0800 (PST)
From:   =?UTF-8?q?Eray=20Or=C3=A7unus?= <erayorcunus@gmail.com>
To:     maxtram95@gmail.com
Cc:     cleverline1mc@gmail.com, erayorcunus@gmail.com,
        g_goessel@outlook.com, hdegoede@redhat.com, ike.pan@canonical.com,
        jiaxun.yang@flygoat.com, limanyi@uniontech.com,
        mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org
Subject: Re: ideapad-laptop touchpad handling problems, request for help
Date:   Thu, 10 Nov 2022 15:00:22 +0300
Message-Id: <20221110120022.35041-1-erayorcunus@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com> <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

I don't know is this correct; but I'll reply to 2 messages, firstly to OP.

On Wed, 9 Nov 2022 at 22:59, Hans de Goede <hdegoede@redhat.com> wrote:
> 3. Please test
> ==============
> 
> If you have ideapads where touchpad_ctrl_via_ec should be 1 because
> it is needed to toggle the touchpad on/off with the hotkey.
> 
> Or the exact opposite you have ideapads where it should be disabled
> because ideapad_sync_touchpad_state() turning off the ps/2 aux port
> is causing problems.
> 
> Then please give the attached patch a try. Note this applies on
> top of Torvald's current master, or on top of 6.0 with :
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a231224a601c
> added.

While I agree with your findings(and thanks for your effort, I also tried
to solve this but later gave up), they doesn't apply to one type of
IdeaPads (like my 520-15IKB), so I'm sure this patch won't work on me.
This is because my IdeaPad has this features:

- i8042.noaux doesn't affect touchpad, and it's connected over i2c
- There is no touchpad LED, and touchpad hotkey only sends "key pressed"
  ACPI event, doesn't do anything else
- VPCCMD_W_TOUCHPAD does nothing (also confirmed on Windows)
- Sending 1 to VPCCMD_W_TOUCHPAD on boot is not needed
- VPCCMD_R_TOUCHPAD always returns 1 (this is interesting)

So I agree on Maxim's solutions, and I have an idea on how to implement
it, I will explain it below.

On 10 Nov 2022 at 00:39, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
> Normally, when EC doesn't disable the
> touchpad, we can send KEY_TOUCHPAD_TOGGLE and leave the action to the
> DE. However, as Z570 has this LED, which will get out of sync with the
> touchpad state, we can't use KEY_TOUCHPAD_TOGGLE.
> 
> That leads to the following idea: if newer Lenovos have issues with
> VPCCMD_R_TOUCHPAD and they don't have the touchpad LED, we can just
> use KEY_TOUCHPAD_TOGGLE for them. However, if it turns out that some
> Lenovo model does actually disable the touchpad in hardware, this also
> needs to be taken into account.

Completely agreed.

> However, this idea doesn't answer the question of how to detect such
> laptops. I wonder how the Windows driver does it.

I reverse engineered Lenovo Utility/Hotkeys programs of ~5 IdeaPads,
and I can say they send VPCCMD_W_TOUCHPAD unconditionally, without any
check if it's working or not. This includes 720s and 520-15IKB, which
don't have working VPCCMD_W_TOUCHPAD. This is because it's the
working-in-background touchpad helper program catches the hotkey ACPI
event (I think) and handles the situation. This can be confirmed by
killing Lenovo programs on these IdeaPads won't affect the touchpad
toggle hotkey.

> I need to check it, but it's entirely possible that the touchpad state
> is preserved after reboot. In that case, reading VPCCMD_R_TOUCHPAD as
> 0 on boot would be normal. I think it's also possible that the user can
> disable the touchpad before Linux starts. This approach looks problematic.

I agree on we can't rely VPCCMD_R_TOUCHPAD to be 0 on boot, because
it always returns 1 for me, yet I don't have working VPCCMD_W_TOUCHPAD.

> 1. Just send KEY_TOUCHPAD_ON/OFF if EC disables the touchpad (any
> known models?).

If you mean the cases when the laptop toggles touchpad itself when
touchpad hotkey is pressed. Good news is(I hope): I don't think there are
such IdeaPads, yet this still needs confirmation.

If you mean the cases where VPCCMD_W_TOUCHPAD works, I agree with you,
yet we don't know how to find/detect these IdeaPads :/

But if we can assume the IdeaPads produced before 2015 all have PS/2
touchpads (at least the ~10 DSDTs I checked all had one), and/or have
VPCCMD_W_TOUCHPAD, why don't we send both VPCCMD_W_TOUCHPAD and i8042
command when "touchpad" attr set on these IdeaPads? 
~10 pre-2015 IdeaPad DSDTs I checked all either had MSS[0-9] or PS2K
devices representing the touchpad, and I believe they were all using
PS/2 interface. Here are these IdeaPads:

S10-3 (PS2M)
S12 (PS2M)
Y530 (PS2M)
B550 (PS2M)
U510 (MSS*)
G500 (MSS*)
G570 (MSS*)
As an exception; Yoga 910(2016) has both TPD0 and PS2M, so we should
check if PS2M is present/connected I think.

So my suggestion is, if we're sure touchpad is connected over PS/2,
(it's up to you how to detect it, it can be either checking AUX on i8042
or checking MSS[0-9] and PS2K on ACPI) we can expose "touchpad" attr.

Otherwise... I say we can stop using VPCCMD_W_TOUCHPAD. I think we
have no reliable way to check if it works. Maybe we can use i2c APIs
instead to toggle touchpad instead, but I don't know if this can work/
possible at all.
Oh, or maybe we can use a whilelist for that? For the IdeaPads that have
i2c touchpads and also controllable by EC.

> 2. Disable the touchpad in the driver if the laptop has the LED and EC
> doesn't disable the touchpad (Z570).

I think all IdeaPads with touchpad LED use PS/2 for touchpad (because
they're old), so I repeat my recommendation above.

> 3. Just send KEY_TOUCHPAD_TOGGLE if the laptop doesn't have the LED
> and EC doesn't disable the touchpad (any known models?).

I agree. I think mainly 2015+ IdeaPads fall under this category, so my
suggestion is to not expose/use VPCCMD_W_TOUCHPAD on any IdeaPads with i2c
touchpad, and send KEY_TOUCHPAD_TOGGLE instead.

Best,
Eray
