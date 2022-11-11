Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A937C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Nov 2022 11:44:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbiKKLox (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Nov 2022 06:44:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbiKKLov (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Nov 2022 06:44:51 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F959FFF
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Nov 2022 03:44:50 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id m22so11940780eji.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Nov 2022 03:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCzL8R7eMt3eT0nZRmz3+AiGp/Dc7OuNzTHgi/O2WMw=;
        b=EvqBVVEi/+VaXf508oIB3DNMieGAzs2j7ewfCMtHX/UGH+FYkRs6W7XgifMOfZo+qf
         WshGCA7CZ1a7WJ6msapA8yzoPwd/QyiAFGCN2Ug9Ut8fui0PvoWzZdgvQTKAdLqk7Ziw
         t1M1zvW5GkgFUvFpTQaPNCia2OUiwZjKtiseYZ+OrWeU4R+N/0DXuJumW9UqZinmZVXG
         N41ddM/it2FStw5gf/Zh3UhHj7hva3ISPfuPDdwSQaXJIsH15BemvEr8OAS+kEauCu+Q
         g5IIM3Lm249wMFEuGFvzJ6+thyd0iEysYr6K5l4bgE3B64CrJu4dmoXd+HPXRW4C73G3
         YsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCzL8R7eMt3eT0nZRmz3+AiGp/Dc7OuNzTHgi/O2WMw=;
        b=2FCHwQC+gCwBRE6TINa4NYTVJzqXAN2ACMVBuY34fwS9aPO8Z+fBV/Ghuq/iv/Pe9U
         s2fXnRoFO27ZnQLVuWL7lZ9ABiWHy35LqR8JVgqsrMw5SScOs5f++5Arh7eGbdLFcXeG
         4bQ1C13nj3PEuECV0J/8g1KDUbT9OsFzr0E2zFclRlF2+yWFhOXlPlcEYQbU8t53NOkd
         pWpH4iby4KWtg/ENCAZGaT5b4ppL/NHN45adrvQ1DKrQsd8mZn44mdtOmE6Kt7pG7f0P
         0uUgkP7vNQ9y/ztCLBpZ+3hwvbkdRC0MrSB+5L5CX3egaPE3CzViItHcLaGgvZMPpHc4
         8ABA==
X-Gm-Message-State: ANoB5plzUE6Qon+I2LIG01XLZjcs/kC3kvX8slHa8KgA9cSTi2XlhT43
        0MNmkwC+K3SZkS2YOXB198aNLpP78zqp8GSbdVs=
X-Google-Smtp-Source: AA0mqf40w3bcA3H38wxEQVLJoP1iOnSmhNK6oF9jsnPcfZIO80PASGJEUefOgC5ijhtP28ZOBalzYbUERMmJVJOo6XU=
X-Received: by 2002:a17:906:1e90:b0:7ae:5473:3c76 with SMTP id
 e16-20020a1709061e9000b007ae54733c76mr1479489ejj.752.1668167088288; Fri, 11
 Nov 2022 03:44:48 -0800 (PST)
MIME-Version: 1.0
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
 <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
 <20221110120022.35041-1-erayorcunus@gmail.com> <4bcf4e6b-ae2f-0e22-a291-7faa6731e6c7@redhat.com>
 <20221110164220.46640-1-erayorcunus@gmail.com> <CAKErNvo+fh6sXUOPj9sCucuzUOKybOUgBo5riCfLpCF_8t9_uA@mail.gmail.com>
 <20221110184709.52768-1-erayorcunus@gmail.com> <d86d9c20-6f5c-0de9-2c09-7667080dd65c@redhat.com>
In-Reply-To: <d86d9c20-6f5c-0de9-2c09-7667080dd65c@redhat.com>
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
Date:   Fri, 11 Nov 2022 13:44:21 +0200
Message-ID: <CAKErNvquRV9M6CU2RTO7nj1X=vwnByomk7Xndg2eGLN4DBh4uw@mail.gmail.com>
Subject: Re: ideapad-laptop touchpad handling problems, request for help
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Eray_Or=C3=A7unus?= <erayorcunus@gmail.com>,
        cleverline1mc@gmail.com, g_goessel@outlook.com,
        ike.pan@canonical.com, jiaxun.yang@flygoat.com,
        limanyi@uniontech.com, mjg59@srcf.ucam.org,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 10 Nov 2022 at 21:18, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Eray,
>
> On 11/10/22 19:47, Eray Or=C3=A7unus wrote:
> > Hi,
> >
> > On 10 Nov 2022 at 21:09, Maxim Mikityanskiy <maxtram95@gmail.com>  wrot=
e:
> >> A small note on the DMI allow-list: I don't think Z570 is the only
> >> laptop where EC fails to disable the touchpad. While I would like this
> >> hack to affect as few laptops as possible, I would expect that other
> >> similar models produced in the same time period suffer from the same
> >> issue, and I don't think we have the full list of them.
> >
> > I just checked Z570 ACPI table, and this is what it does when it receiv=
es
> > VPCCMD_R_TOUCHPAD:
> >
> >       VDAT =3D TPEN /* \_SB_.PCI0.LPCB.EC0_.TPEN */
> >       If ((TPEN =3D=3D One))
> >       {
> >           GL04 |=3D 0x02
> >       }
> >       Else
> >       {
> >           GL04 &=3D 0xFD
> >       }
> >
> > VDAT is the data returned to user.
> > So we can say that TPEN is the logical state of touchpad key, and GL04
> > is state of touchpad LED or series of LEDs.
> >
> > VPCCMD_W_TOUCHPAD is nulled, it doesn't work.
> >
> > I also checked which DSDTs I have (13 DSDTs from 2008 to this year)
> > contain TPEN, and turned out it was only S12, from 2009. It also had
> > nulled VPCCMD_W_TOUCHPAD, and returns TPEN on VPCCMD_R_TOUCHPAD, except
> > it doesn't have an LED or GL04.
> >
> > So, it's possible that we can only check if TPEN exists on ACPI table,
> > instead of having a white-list.
>
> Hmm, lets keep that idea in case it turns out the allow-list based
> approach turns out to cause issue/grow out of control. I would rather
> not rely on ACPI variables having a specific name for something like
> this, but you might be on to something.

Maybe also add a module parameter to force the i8042 workaround? This
change is likely to break the touchpad toggle for some devices similar
to Z570 (maybe Z580? Y580? idk), so people would at least have an
option to force enable it using the module parameter, before the
relevant entry gets added to the DMI table, the patch gets merged, and
the kernel gets updated.

Another note on the comments in patch 4:

        /*
         * Some IdeaPads don't really turn off touchpad - they only
         * switch the LED state. We (de)activate KBC AUX port to turn
         * the touchpad on and off.
         */
               /*
                * On older models the EC controls the touchpad and toggles =
it
                * on/off itself, in this case we report KEY_TOUCHPAD_ON/_OF=
F.
                * If the EC did not toggle, report KEY_TOUCHPAD_TOGGLE.
                */

These two comments would sound confusing to me if I read them without
having context on Ideapads. I mean this part where "EC controls the
touchpad and toggles it itself", but at the same time these laptops
"don't really turn off the touchpad". Could you rephrase it somehow,
so that it would be clear that there are models where the EC cares
about the touchpad because it toggles *either* the touchpad or at
least its LED?

> I have checked my own collection of acpidumps and the only DSDT
> which I have which has a TPEN variable is for an Ideapad D330.
>
> Funny enough that is a 2-in-1 with a detachable USB keyboard.
> I would not be surprised if the ideapad driver does not load
> on those devices at all since there are no embedded-controller
> handled hotkeys, as the keyboard is fully USB/HID and not
> connected to the EC at all.
>
> I'll send you the acpidump in a private email.
>
> Regards,
>
> Hans
>
>
>
>
