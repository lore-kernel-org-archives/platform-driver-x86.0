Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEA6C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 17:54:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiKJRy4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 12:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbiKJRyo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 12:54:44 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C713449B79
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 09:54:41 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id z18so4212073edb.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 09:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/uEshTZI/BZKzBxoZ9eFxVooxve9BARxWs+C4nC35U=;
        b=JwYAGjFekx8Rwm3MqJmvAXjRXvGIRQJ+NqJAuwnu/Fq4Blk7DuqalGDCJAAdfDmK8y
         lavTkOfjRbGm11DGUgOpTVcdqamyW1FjRwZiYUzmAn7AjuMGP0zCNsBFRmu9TKy9IKjZ
         FTR7HXuj9JzQWWKTOBxQW1q67OobLbq5D97q7jBx/L9NFw2HhKX2vspDyf3FKBxLr+X/
         201A3w3kO8X6Rt/rOdqICqi8HnNRXdXz51FMCKkvsheL5bfiAvvDABi8uvZmm+08So5+
         amh7aYnAZX7AbHOGmU0FpU+ewySyNJrlOJ4+DFSNcSALUsXMkkfo+Fl3/RnaIVYTobu1
         40gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/uEshTZI/BZKzBxoZ9eFxVooxve9BARxWs+C4nC35U=;
        b=y2DRvN5YgQ4/7TAJof9Jx5IZXF9FUXBGjdWcv2liWGc9wPIc/vlB4iKLM3iqX4JVUb
         71iNC+Adt7mj8NNAYPwkjfhy+K2s8TQ9/LeGu7qtEoiK9SVOavQhWCJCxXMyZncDwEUe
         bPnLfBwcmLTJOGFKaCvAE21BBMl2o9I522D/ijEBtqIPQPZ3LbBYsxkVH3X7Dt7Xjhdp
         vdpj+hgXx1kkz6EOcukgjOVSgGns/Ow401dNYGhIc+lCnBtF25CDhKjJxUFjhC4UDtuU
         kqg7KaSazB7rO7SybOaXSZbfeaxvqHGPTGFNmf0mJjJJoN2jwYKL1OIXBJmo8y3wnQQC
         zaFw==
X-Gm-Message-State: ACrzQf1LwNZ8Q8RtyP9kplybgXwckiAu8QGAseID9PlRUlefTC1uIJGS
        1frrMAdW4nTw0RrZqvAUuJHmi9yMWiy0KeMoR54=
X-Google-Smtp-Source: AMsMyM5xditTc5s5YOmhVZyLrid9VUnzmSKwagruVikk3ci8zxMWpF2bS+STES74cQ7i/sP2xJyStjeNz7V3TnxjgHk=
X-Received: by 2002:a50:d489:0:b0:462:351d:4bfc with SMTP id
 s9-20020a50d489000000b00462351d4bfcmr2884797edi.352.1668102879366; Thu, 10
 Nov 2022 09:54:39 -0800 (PST)
MIME-Version: 1.0
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
 <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
 <20221110120022.35041-1-erayorcunus@gmail.com> <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com>
 <20221110164220.46640-1-erayorcunus@gmail.com>
In-Reply-To: <20221110164220.46640-1-erayorcunus@gmail.com>
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
Date:   Thu, 10 Nov 2022 19:54:12 +0200
Message-ID: <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com>
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

On Thu, 10 Nov 2022 at 18:42, Eray Or=C3=A7unus <erayorcunus@gmail.com> wro=
te:
>
> Hi Hans,
>
> On 10 Nov 2022 at 15:37, Hans de Goede <hdegoede@redhat.com> wrote:
> > On 11/10/22 13:00, Eray Or=C3=A7unus wrote:
> > > While I agree with your findings(and thanks for your effort, I also t=
ried
> > > to solve this but later gave up), they doesn't apply to one type of
> > > IdeaPads (like my 520-15IKB), so I'm sure this patch won't work on me=
.
> > > This is because my IdeaPad has this features:
> > >
> > > - i8042.noaux doesn't affect touchpad, and it's connected over i2c
> > > - There is no touchpad LED, and touchpad hotkey only sends "key press=
ed"
> > >   ACPI event, doesn't do anything else
> > > - VPCCMD_W_TOUCHPAD does nothing (also confirmed on Windows)
> > > - Sending 1 to VPCCMD_W_TOUCHPAD on boot is not needed
> > > - VPCCMD_R_TOUCHPAD always returns 1 (this is interesting)
> >
> > So if i8042.noaux does not do anything, then why do you want to add
> > "SYNA2B33" to the list of ACPI HIDs for which we set:
> >
> > features.touchpad_ctrl_via_ec=3D0;
> >
> > ?
> >
> > IOW what bad effects / behavior are you seeing with touchpad_ctrl_via_e=
c=3D1?
> >
> > Or are you seeing bad behavior on some other modes? If yes, then what
> > is the bad behavior you are seeing on other models ?
>
> It was just because I didn't want to have a not working "touchpad"
> attribute :) I used/still using several GNOME extensions and they show
> me "Touchpad" toggle just because I have "touchpad" attribute exposed
> there, which is doing nothing, and misleading.
>
> But I would understand if you don't want to touch it at that stage, and
> you would rather prefer not working "touchpad" attributes to not
> exposed "touchpad" attributes that would have been perfectly working.
>
> > I'm guessing that this part:
> >
> >                 unsigned char param;
> >                 /*
> >                  * Some IdeaPads don't really turn off touchpad - they =
only
> >                  * switch the LED state. We (de)activate KBC AUX port t=
o turn
> >                  * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> >                  * KEY_TOUCHPAD_ON to not to get out of sync with LED
> >                  */
> >                 i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8=
042_CMD_AUX_DISABLE);
> >
> > May cause issues on some models. It definitely feels fishy and
> > I would like to disable this except on models where:
> >
> > 1. There is a LED controlled by some touchpad on/off hotkey; and
> > 2. The EC fails to disable the touchpad itself
> >
> > Which would currently mean only enable this bit on Maxim's Z570
> > using a DMI based allow list.

A small note on the DMI allow-list: I don't think Z570 is the only
laptop where EC fails to disable the touchpad. While I would like this
hack to affect as few laptops as possible, I would expect that other
similar models produced in the same time period suffer from the same
issue, and I don't think we have the full list of them.

> Agreed, but do you mean "and" or "or"? I mean we can also include the
> models that toggle touchpad value while not really toggling the touchpad
> (just as you described below) and don't have a touchpad LED (but I don't
> know if such model exists really), this way they won't go out of sync
> regardless of is there a touchpad LED or not.
>
> > At least on Maxim's Z570 the laptop does toggle the value
> > returned by VPCCMD_R_TOUCHPAD and the LED it self, while at the
> > same time not actually disabling the touchpad.
> > The problem is this all relies on being able to detect i2c vs ps/2
> > touchpads which is not as simple as it sounds. Specifically many
> > new touchpad are connected to both busses at the same time, offering
> > a ps/2 mode by default for compatibility with older software / os-es
> > and being able to switch to a modern i2c/smbus mode for better performa=
nce.
> >
> > I've asked Benjamin Tissoires, the kernel expert on this about this
> > and his answer was that it is almost impossible to determine if
> > a touchpad is going to be using ps/2 or i2c without first waiting
> > for the whole driver stack to have initialized and then see which
> > driver(s) are attached and I guess even then the touchpad might
> > show up as both ps/2 + i2c with only one of them actually generating
> > events:
> >
> > https://lore.kernel.org/linux-input/ae50236e-1ce8-b526-9c17-7bc0463ebb8=
6@redhat.com/T/#u
> >
> > So based on Benjamin's answer I'm afraid that trying to differentiate
> > between i2c vs ps2 is not really doable.
>
> Thanks for the explanation and the link, but as Benjamin said, I believe
> we can use ACPI table for detecting PS/2 devices. I believe the DSDTs
> with PS2M(and probably MSS[0-9] too) devices probably have PS/2 touchpad,
> and have working EC and i8042 commands. Yet this still needs
> confirmation/testing, and I think should be resorted if your suggestion
> below won't work - your suggestion looks better and easier.
>
> > 1: Fixing undesirable i8042_command(... I8042_CMD_AUX_DISABLE) calls
> > --------------------------------------------------------------------
> >
> > My suggestion is to move to an allow-list for this and for now
> > populate that list with only the DMI strings for Maxim's Z570 and see
> > from there.
>
> Agreed.
>
> >
> > 2: Fixing wrong/spurious KEY_TOUCHPAD_OFF / KEY_TOUCHPAD_ON events
> > ------------------------------------------------------------------
> >
> > There are 2 subcases here:
> >
> > 2.1: Fix sending of KEY_TOUCHPAD_OFF/_ON events at probe/resume
> > ---------------------------------------------------------------
> >
> > We can simply fix this by giving ideapad_sync_touchpad_state()
> > a parameter to let it know if events should be send at all and
> > set that parameter to false when called on probe/resume
>
> Agreed.
>
> > 2.2: Sending wrong KEY_TOUCHPAD_OFF/_ON events at toggle time
> > -------------------------------------------------------------
> >
> > On models where the EC does not control the touchpad at all,
> > currently we still do ideapad_sync_touchpad_state() and then
> > send either KEY_TOUCHPAD_OFF or _ON based on the value read
> > from VPCCMD_R_TOUCHPAD.
> >
> > But on these models VPCCMD_R_TOUCHPAD always returns 0 or 1,
> > so we always send KEY_TOUCHPAD_OFF or always send KEY_TOUCHPAD_ON,
> > instead of toggling the state / asking userspace to toggle
> > its sw touchpad on/off state.
> >
> > I believe we can detect this case by checking that
> > the value read from VPCCMD_R_TOUCHPAD has not changed
> > despite us receiving a notify with bit 5 being set in
> > the value read from VPCCMD_R_VPC1.
> >
> > My suggestion to fix this case is to detect when the value
> > read from VPCCMD_R_TOUCHPAD does not change and in that
> > case send KEY_TOUCHPAD_TOGGLE to userspace.
>
> While this is an awesome idea, what about doing this at boot?
> Like we will send 0 first, then check if it reads 0, then send 1,
> and confirm if it reads 1. This would be the ultimate solution, and
> would also fix my "cosmetic" concerns :)
>
> Best,
> Eray
