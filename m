Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6117CC433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Nov 2022 21:39:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbiKIVjd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Nov 2022 16:39:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiKIVjc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Nov 2022 16:39:32 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C36129342
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Nov 2022 13:39:31 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id 13so268948ejn.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Nov 2022 13:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ILqYlTVUwnLIj8I8GKzN3PoFG+i9OejmWMerTRAgXU=;
        b=g0XV+rlWM/WCpVD+CaIVWQr9Zcg6LD2rMv4BNENT5ous+f+lHLc8128GTLbl5/VBgt
         6Bi78dVbXtfFWzaYH1S7Xs1rj+s8Uq+2xpMg785eVGxbegDjNpJTQnIfLur0eMtbw5wZ
         6kPjPad/5J8mGGiHhGieeBUUsouuv5BSztXV+HA6FMHg5j7XBv6+6W+bxqNQ4BMFHFeo
         29JUzwSowpFIYa2mAmPW/Ij2pObsFcGACwdIZQHOmZVgk9ZXc8ClM0+oUS9urMUobok+
         +jKUxatvtF16J1nR7sPtXiBPqrY35kMjoVRsqDX8j2vLy5Sgtq1+7vljrGi3RsP7NRfA
         LWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ILqYlTVUwnLIj8I8GKzN3PoFG+i9OejmWMerTRAgXU=;
        b=qgTNojd9fR8A3twUDifm2+qXWNj3ZRbUh+R4Yhh4gIWTu+PZ1rRaXUov1LLMo2ovCI
         RqHiFRUrn1Hzt2bZrS1NGArcI36gP3rpX1SQ2aAn45gTggH2/d8yX0a/geGtZJzLyNcv
         +oSukY1s/vR6DhAWup1sRUlNWefxYitF6YS7bc0AOF+aYt8Ag1dFiuGJnqTtlEJaQg0E
         teSNh3Chwt26RVgjAcjtXoLutFs42WJhon0818Jhg9Zt0gWXccrMg03OKc133uMtEN2z
         aVqmLtT7yX2Yr6bH+TKKMoyNGH1V0jC4oK9ePbK3To4Vs+pCXNPzE8yBRyqNTEyh861v
         IegA==
X-Gm-Message-State: ACrzQf37jYacsBPeVftGsdjpG2tYRaZFKI6lFgXg90lM5hiw9IRyOlqA
        z7m5I1R7nFzsbAiaIZDpQu2gliSWRG3IT3JpTSwYoiW+g88=
X-Google-Smtp-Source: AMsMyM61UrkiCWP8QDeDwqQzoc56Zhw7T7+rCF5FKLmlKn1xGZMjY55SN0entMtnUM6GF6xpdT6PqV2SsfOT4NRXXAo=
X-Received: by 2002:a17:907:271b:b0:7ad:b748:63df with SMTP id
 w27-20020a170907271b00b007adb74863dfmr55492553ejk.639.1668029969690; Wed, 09
 Nov 2022 13:39:29 -0800 (PST)
MIME-Version: 1.0
References: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
In-Reply-To: <bc1202d1-d85d-4173-5979-237bb1ee9254@redhat.com>
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
Date:   Wed, 9 Nov 2022 23:39:03 +0200
Message-ID: <CAKErNvqfH-C7xJU3F7ga68o3AK-_ae-K2ggKcUOp1iqtmdSYdw@mail.gmail.com>
Subject: Re: ideapad-laptop touchpad handling problems, request for help
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     GOESSEL Guillaume <g_goessel@outlook.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        Manyi Li <limanyi@uniontech.com>,
        =?UTF-8?Q?Eray_Or=C3=A7unus?= <erayorcunus@gmail.com>,
        Ike Panhc <ike.pan@canonical.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 9 Nov 2022 at 22:59, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> I'm emailing you all because you have written patches or
> reported bugs related to the ideapad-laptop touchpad
> handling the past.
>
> 1. History
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> I have done a bit of digging into the history of
> the touchpad handling:
>
> What I believe is the troublesome part of the touchpad handling
> started in 2012 with:
>
> 07a4a4fc83dd ("ideapad: add Lenovo IdeaPad Z570 support (part 2)")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D07a4a4fc83dd
>
> Which added the ideapad_sync_touchpad_state() function which depending
> on the result of reading VPCCMD_R_TOUCHPAD send an i8042 command to
> enable/disable the aux port of the ps2 controller *and* which sends
> KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON events to userspace to let userspace
> know the state of the touchpad.

For the reference, this cumbersome solution was needed in the first
place, because Z570 has an LED, and EC toggles the LED on each
touchpad toggle button press, but EC only controls the LED, it doesn't
actually disable the touchpad. Normally, when EC doesn't disable the
touchpad, we can send KEY_TOUCHPAD_TOGGLE and leave the action to the
DE. However, as Z570 has this LED, which will get out of sync with the
touchpad state, we can't use KEY_TOUCHPAD_TOGGLE.

That leads to the following idea: if newer Lenovos have issues with
VPCCMD_R_TOUCHPAD and they don't have the touchpad LED, we can just
use KEY_TOUCHPAD_TOGGLE for them. However, if it turns out that some
Lenovo model does actually disable the touchpad in hardware, this also
needs to be taken into account.

However, this idea doesn't answer the question of how to detect such
laptops. I wonder how the Windows driver does it.

By the way, newer Lenovos also have other incompatibilities, for
example, fan modes are no longer relevant on some models, and I don't
know how to detect those either.

>
> The first commit to optionally disable ideapad_sync_touchpad_state()
> was actually written by me in 2014, for a "Lenovo Yoga 2 11":
>
> f79a901331a8 ("ideapad-laptop: Disable touchpad interface on Yoga models"=
)
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Df79a901331a8
>
> The problem on the "Lenovo Yoga 2 11" was a spurious KEY_TOUCHPAD_OFF
> event on resume, other then that there were no bad side effects.
>
> This patch got reverted soon afterwards in commit 3b264d279e72 because
> it stopped the touchpad enable/disable button from working on
> a "Lenovo Yoga 2 13".
>
> Then in 2021 a patch was added to again disable ideapad_sync_touchpad_sta=
te()
> on some models, this time based on the ACPI HID (ELAN0634) of the touchpa=
d:
>
> d69cd7eea93e ("platform/x86: ideapad-laptop: Disable touchpad_switch for =
ELAN0634")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dd69cd7eea93e
>
> And the last couple of weeks the following 2 patches were added to disabl=
e
> ideapad_sync_touchpad_state() on more models based on DMI ids for the fir=
st
> patch (already merged) + adding a new ACPI HID for the second patch:
>
> a231224a601c ("platform/x86: ideapad-laptop: Disable touchpad_switch")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Da231224a601c
>
> https://patchwork.kernel.org/project/platform-driver-x86/patch/2022102912=
0311.11152-8-erayorcunus@gmail.com/
>
> As mentioned in the commit msg of d69cd7eea93e ("platform/x86:
> ideapad-laptop: Disable touchpad_switch for ELAN0634") part of
> the problem is VPCCMD_R_TOUCHPAD returning 0 leading to the aux
> ps/2 port getting turned off.
>
> This can be a problem even on devices where the touchpad shows up as
> an i2c/smbus device because often on those devices the touchpad is
> connected over both ps/2 + i2c and at least for synaptics devices
> the touchpad needs to be contacted over i2c within a couple of
> 100s of ms of doing a ps/2 reset for it to switch to i2c mode.
>
>
> 2. Possible solutions
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> 1. Do something with BIOS date to only enable touchpad_ctrl_via_ec on
> older models. Problem is that BIOS updates happen and those can be
> of much later date then the production year of the model
>
> 2. Move to an allow list for setting touchpad_ctrl_via_ec to true, given
> how soon after my initial patch to disable touchpad_ctrl_via_ec I got
> a bug report about this, which even was due to a deny-list DMI entry
> not being narrow enough this seems like a bad idea. OTOH missing
> the ability to turn the touchpad on/off is less of a big deal
> then a non working touchpad. So if we fail to find a better
> solution this might be the best thing to do.
>
> 3. Since the problems are caused when VPCCMD_R_TOUCHPAD reads as 0 at
> boot, causing ideapad_sync_touchpad_state() to turn off the ps/2 aux port
> and since the touchpad is normally on at boot, we can check for
> VPCCMD_R_TOUCHPAD reading as 0 at boot and if that happens assume that
> means touchpad-ctrl via the EC is not available. I have attached
> a patch implementing this approach.

I need to check it, but it's entirely possible that the touchpad state
is preserved after reboot. In that case, reading VPCCMD_R_TOUCHPAD as
0 on boot would be normal. I think it's also possible that the user can
disable the touchpad before Linux starts. This approach looks problematic.

>
>
> 3. Please test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> If you have ideapads where touchpad_ctrl_via_ec should be 1 because
> it is needed to toggle the touchpad on/off with the hotkey.

I still own my Z570, but it's located in another city. I can do some
testing on it, though. I can also provide the DSDT dump along with the
BIOS version.

Also adding Kry=C5=A1tof to this thread, who is a Lenovo Yoga 720-15ikb use=
r.

It would be perfect if someone could reverse engineer what the Windows
driver does in order to distinguish the old and the new interfaces.
With a proper detection mechanism, we could:

1. Just send KEY_TOUCHPAD_ON/OFF if EC disables the touchpad (any
known models?).

2. Disable the touchpad in the driver if the laptop has the LED and EC
doesn't disable the touchpad (Z570).

3. Just send KEY_TOUCHPAD_TOGGLE if the laptop doesn't have the LED
and EC doesn't disable the touchpad (any known models?).

>
> Or the exact opposite you have ideapads where it should be disabled
> because ideapad_sync_touchpad_state() turning off the ps/2 aux port
> is causing problems.
>
> Then please give the attached patch a try. Note this applies on
> top of Torvald's current master, or on top of 6.0 with :
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Da231224a601c
> added.
>
> Regards,
>
> Hans
>
