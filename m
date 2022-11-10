Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4455C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 18:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbiKJSJl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 13:09:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiKJSJk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 13:09:40 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B492B86A
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 10:09:35 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id f7so4301593edc.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 10:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs+SFrf3t3ns9L0OOHEFi10o9pIPALPJpr26vnNWV+c=;
        b=UO1ls/tn8ZLOcD/loDZCGoE5G3sQ6ZF/R7zNLAEaMp2a0e4tQMJZmFtwg5yH1tHtVe
         ezjf/SLVLIFvrytpVjlZsWhHV+ijQO/fZhgmFY1LOVGn9Ix63CZN/Ehb9rT9qmtVCTuX
         2ND/9rl7GwVhDaJ6FUVxkuhCQjKPks87RW+/i+hVoGdTnCEDnQUhyv7HyL4nl6cfTzk8
         NA2Z36MaTVvR3zH8Do8msV8UDRsm4TtHJkgiq2T6/FMUlgmSu5FzgY2GQDRFiosu1cjZ
         46XoL40r85BY68Z2/fZoYhanaXmKIx56h0ddHUOeYeeG+0aWjp8V75Z/Vw4aNfjAzkjj
         JDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cs+SFrf3t3ns9L0OOHEFi10o9pIPALPJpr26vnNWV+c=;
        b=xstc58ZUqggBtmUcm9+b1BHcKie/4vkwfuaomomxutcTXe2X2EXIXDSRHtfv76rKL9
         IM4ZwuKQidQ3PiQ+mVz7QmKulm+4+5jxmFcNWsND1rOqi6pDLHOfNkO2XkY7O4qvuD2f
         xi3ZyfTsdwh02/NAUhVU8Bz+R2DJJr564jEm9ZHiJ1DE3Oe1rE1ZHHsPnwONbKENcX0G
         CZfaWMnSfQjO/Og4/YoPYx0tpl8LkW0YYw/A0Yt6a4Thmr97vG+jAypN04PJ+h/7iecq
         KYOO+TfyaaOAg0TIKVQaQGF7fcYI2xe2ydgnlzIxx8fRb4pErrVL9QoGlgn90JLvY1pv
         QMwg==
X-Gm-Message-State: ACrzQf1SoyC4GMtOA+t0hu9aABtc/EnMRqgyCe8QQvPIhiFJXH8vo3tX
        QzZ2Mu9chiMBtmdxWLRmyfiWdiRmkxDjneohX2s=
X-Google-Smtp-Source: AMsMyM4bcQNIHoqH6kh8wA4G43MCdFi/Pu3ghEomn5KUL9+pFqQU759yo+5AVbF0q2kzfXUgwY+K5C3AzG25glVLeHM=
X-Received: by 2002:a05:6402:24a1:b0:463:f3a:32ce with SMTP id
 q33-20020a05640224a100b004630f3a32cemr2928900eda.366.1668103773909; Thu, 10
 Nov 2022 10:09:33 -0800 (PST)
MIME-Version: 1.0
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
 <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
 <20221110120022.35041-1-erayorcunus@gmail.com> <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com>
 <20221110164220.46640-1-erayorcunus@gmail.com> <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com>
In-Reply-To: <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com>
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
Date:   Thu, 10 Nov 2022 20:09:07 +0200
Message-ID: <CAKErNvpJddZpbyyARjr6iWn=VPQ+Wy59z=o78ejj-k8eNxSukQ@mail.gmail.com>
Subject: Re: ideapad-laptop touchpad handling problems, request for help
To:     =?UTF-8?Q?Eray_Or=C3=A7unus?= <erayorcunus@gmail.com>
Cc:     hdegoede@redhat.com, cleverline1mc@gmail.com,
        g_goessel@outlook.com, ike.pan@canonical.com,
        jiaxun.yang@flygoat.com, limanyi@uniontech.com,
        mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 10 Nov 2022 at 19:54, Maxim Mikityanskiy <maxtram95@gmail.com> wrot=
e:
>
> On Thu, 10 Nov 2022 at 18:42, Eray Or=C3=A7unus <erayorcunus@gmail.com> w=
rote:
> >
> > Hi Hans,
> >
> > On 10 Nov 2022 at 15:37, Hans de Goede <hdegoede@redhat.com> wrote:
> > > On 11/10/22 13:00, Eray Or=C3=A7unus wrote:
> > > > While I agree with your findings(and thanks for your effort, I also=
 tried
> > > > to solve this but later gave up), they doesn't apply to one type of
> > > > IdeaPads (like my 520-15IKB), so I'm sure this patch won't work on =
me.
> > > > This is because my IdeaPad has this features:
> > > >
> > > > - i8042.noaux doesn't affect touchpad, and it's connected over i2c
> > > > - There is no touchpad LED, and touchpad hotkey only sends "key pre=
ssed"
> > > >   ACPI event, doesn't do anything else
> > > > - VPCCMD_W_TOUCHPAD does nothing (also confirmed on Windows)
> > > > - Sending 1 to VPCCMD_W_TOUCHPAD on boot is not needed
> > > > - VPCCMD_R_TOUCHPAD always returns 1 (this is interesting)
> > >
> > > So if i8042.noaux does not do anything, then why do you want to add
> > > "SYNA2B33" to the list of ACPI HIDs for which we set:
> > >
> > > features.touchpad_ctrl_via_ec=3D0;
> > >
> > > ?
> > >
> > > IOW what bad effects / behavior are you seeing with touchpad_ctrl_via=
_ec=3D1?
> > >
> > > Or are you seeing bad behavior on some other modes? If yes, then what
> > > is the bad behavior you are seeing on other models ?
> >
> > It was just because I didn't want to have a not working "touchpad"
> > attribute :) I used/still using several GNOME extensions and they show
> > me "Touchpad" toggle just because I have "touchpad" attribute exposed
> > there, which is doing nothing, and misleading.
> >
> > But I would understand if you don't want to touch it at that stage, and
> > you would rather prefer not working "touchpad" attributes to not
> > exposed "touchpad" attributes that would have been perfectly working.
> >
> > > I'm guessing that this part:
> > >
> > >                 unsigned char param;
> > >                 /*
> > >                  * Some IdeaPads don't really turn off touchpad - the=
y only
> > >                  * switch the LED state. We (de)activate KBC AUX port=
 to turn
> > >                  * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> > >                  * KEY_TOUCHPAD_ON to not to get out of sync with LED
> > >                  */
> > >                 i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : =
I8042_CMD_AUX_DISABLE);
> > >
> > > May cause issues on some models. It definitely feels fishy and
> > > I would like to disable this except on models where:
> > >
> > > 1. There is a LED controlled by some touchpad on/off hotkey; and
> > > 2. The EC fails to disable the touchpad itself
> > >
> > > Which would currently mean only enable this bit on Maxim's Z570
> > > using a DMI based allow list.
>
> A small note on the DMI allow-list: I don't think Z570 is the only
> laptop where EC fails to disable the touchpad. While I would like this
> hack to affect as few laptops as possible, I would expect that other
> similar models produced in the same time period suffer from the same
> issue, and I don't think we have the full list of them.

And another idea: i8042_command(I8042_CMD_AUX_DISABLE) can be replaced
with installing a i8042_platform_filter that will filter out all
I8042_STR_AUXDATA when the touchpad should be disabled. It's
definitely less fishy, we don't touch the KBC, but simply filter out
events in software.

>
> > Agreed, but do you mean "and" or "or"? I mean we can also include the
> > models that toggle touchpad value while not really toggling the touchpa=
d
> > (just as you described below) and don't have a touchpad LED (but I don'=
t
> > know if such model exists really), this way they won't go out of sync
> > regardless of is there a touchpad LED or not.
> >
> > > At least on Maxim's Z570 the laptop does toggle the value
> > > returned by VPCCMD_R_TOUCHPAD and the LED it self, while at the
> > > same time not actually disabling the touchpad.
> > > The problem is this all relies on being able to detect i2c vs ps/2
> > > touchpads which is not as simple as it sounds. Specifically many
> > > new touchpad are connected to both busses at the same time, offering
> > > a ps/2 mode by default for compatibility with older software / os-es
> > > and being able to switch to a modern i2c/smbus mode for better perfor=
mance.
> > >
> > > I've asked Benjamin Tissoires, the kernel expert on this about this
> > > and his answer was that it is almost impossible to determine if
> > > a touchpad is going to be using ps/2 or i2c without first waiting
> > > for the whole driver stack to have initialized and then see which
> > > driver(s) are attached and I guess even then the touchpad might
> > > show up as both ps/2 + i2c with only one of them actually generating
> > > events:
> > >
> > > https://lore.kernel.org/linux-input/ae50236e-1ce8-b526-9c17-7bc0463eb=
b86@redhat.com/T/#u
> > >
> > > So based on Benjamin's answer I'm afraid that trying to differentiate
> > > between i2c vs ps2 is not really doable.
> >
> > Thanks for the explanation and the link, but as Benjamin said, I believ=
e
> > we can use ACPI table for detecting PS/2 devices. I believe the DSDTs
> > with PS2M(and probably MSS[0-9] too) devices probably have PS/2 touchpa=
d,
> > and have working EC and i8042 commands. Yet this still needs
> > confirmation/testing, and I think should be resorted if your suggestion
> > below won't work - your suggestion looks better and easier.
> >
> > > 1: Fixing undesirable i8042_command(... I8042_CMD_AUX_DISABLE) calls
> > > --------------------------------------------------------------------
> > >
> > > My suggestion is to move to an allow-list for this and for now
> > > populate that list with only the DMI strings for Maxim's Z570 and see
> > > from there.
> >
> > Agreed.
> >
> > >
> > > 2: Fixing wrong/spurious KEY_TOUCHPAD_OFF / KEY_TOUCHPAD_ON events
> > > ------------------------------------------------------------------
> > >
> > > There are 2 subcases here:
> > >
> > > 2.1: Fix sending of KEY_TOUCHPAD_OFF/_ON events at probe/resume
> > > ---------------------------------------------------------------
> > >
> > > We can simply fix this by giving ideapad_sync_touchpad_state()
> > > a parameter to let it know if events should be send at all and
> > > set that parameter to false when called on probe/resume
> >
> > Agreed.
> >
> > > 2.2: Sending wrong KEY_TOUCHPAD_OFF/_ON events at toggle time
> > > -------------------------------------------------------------
> > >
> > > On models where the EC does not control the touchpad at all,
> > > currently we still do ideapad_sync_touchpad_state() and then
> > > send either KEY_TOUCHPAD_OFF or _ON based on the value read
> > > from VPCCMD_R_TOUCHPAD.
> > >
> > > But on these models VPCCMD_R_TOUCHPAD always returns 0 or 1,
> > > so we always send KEY_TOUCHPAD_OFF or always send KEY_TOUCHPAD_ON,
> > > instead of toggling the state / asking userspace to toggle
> > > its sw touchpad on/off state.
> > >
> > > I believe we can detect this case by checking that
> > > the value read from VPCCMD_R_TOUCHPAD has not changed
> > > despite us receiving a notify with bit 5 being set in
> > > the value read from VPCCMD_R_VPC1.
> > >
> > > My suggestion to fix this case is to detect when the value
> > > read from VPCCMD_R_TOUCHPAD does not change and in that
> > > case send KEY_TOUCHPAD_TOGGLE to userspace.
> >
> > While this is an awesome idea, what about doing this at boot?
> > Like we will send 0 first, then check if it reads 0, then send 1,
> > and confirm if it reads 1. This would be the ultimate solution, and
> > would also fix my "cosmetic" concerns :)
> >
> > Best,
> > Eray
