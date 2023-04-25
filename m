Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46328C6FD18
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Apr 2023 19:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbjDYTDG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Apr 2023 15:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235061AbjDYTDC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2023 15:03:02 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE68D18B8A
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 12:02:55 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-5ef524eaca1so26948416d6.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 12:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682449375; x=1685041375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwxw4kYjRu94woJ/oAzgVlJil50JAGt1pGKKPkXJZDU=;
        b=AghHuty5oWctp9Fgr83YOfdz1BvOQbpIwjkTYYfgttlq6ySniKDD7HZzYbct/MelF7
         KCyOoSyYVYnqHzZ3WuIV19whLv5mp8h72xdlOLolauG8pB5J29Fpql8sBXyGu37RV3PZ
         IxiuPQsSOvQe0A+vrtQFswUVYES6tB+2F3JoXUkdBgXkwDQeN4TGLbCGckpnQGCpOr/F
         gX4/TxKx0lKf1BCUsSKv0FUPW4os9592riA32cNLFo8ftroFUXB5xXV02ThawlC7mXKo
         U6f3SP4vipjuwJEXsAy+pJxnztxeU8zVD84qF2MKvkt1kMmTo1IOGARjiHB8PTWMrYt4
         BVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682449375; x=1685041375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwxw4kYjRu94woJ/oAzgVlJil50JAGt1pGKKPkXJZDU=;
        b=JmTZYL996wt66nUFXRq2fZbSSs5JyhaW/Tw6d2AT2/FodJQuC1fj2RhXfGdxTq7Qun
         FRYp3BvKJsPLiqvtyxWHEKTzq/p7AgVE5+TtSYmNdEGpXrKwjm+R/C01nuLlkm6mdGcw
         Bjc7M4TovQ1W8rSlvPlLYUmFrCuWlI8HHwYSiEf3nAc1bSmgzNlFVAIsCxazzVfZ3/rs
         DrJp6r95FrnB/BRKP915Jn/OZwXGlHbgAGIQbBBxs04QCLoFWDBOFhyY43n8iswn2jwi
         8KC1PD0S+0mAsXKiBe5U7+gTZngZoFbR32kJDREJEyy60VcK8Ljy5QYaS8EWvcs/z1z6
         p2rQ==
X-Gm-Message-State: AAQBX9cCerw9SONlank+ySWcFloMRulijv/M1WK/792+ZkjrcCvzGx3a
        n5JOZYUdNEnaB0D5IfAg/dmNnFLO4tyE3MVOwYwsV+V0go35vfJh
X-Google-Smtp-Source: AKy350agAw9KyWU53yLYXfd1J4J+BiyXjDZE9msU+dz5hedKInCwkG8xE3v1vsN8FZM46cC9DccdQWxPCdIWv8BDLrE=
X-Received: by 2002:a05:6214:29ec:b0:60e:52e:33df with SMTP id
 jv12-20020a05621429ec00b0060e052e33dfmr18305992qvb.36.1682449374739; Tue, 25
 Apr 2023 12:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230416154932.6579-1-julian.winkler1@web.de> <6a2a97d9-140c-3e4f-aa12-c98f928f7481@redhat.com>
 <CAHp75VfFptZcJn7c_a2GLnSqJDXBwvUqWmu9Wb19a3VvwXJS5A@mail.gmail.com> <a52ab618-97ea-04ea-01e4-ecb673f45f09@web.de>
In-Reply-To: <a52ab618-97ea-04ea-01e4-ecb673f45f09@web.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 25 Apr 2023 22:02:18 +0300
Message-ID: <CAHp75VcGWo8YvHYOD19ECRDcF6D_yZB5oN24=aYgyFn5m8Kz=A@mail.gmail.com>
Subject: Re: [PATCH] intel_scu_pcidrv: add back PCI id for Medfield
To:     Julian Winkler <julian.winkler1@web.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Apr 17, 2023 at 4:02=E2=80=AFPM Julian Winkler <julian.winkler1@web=
.de> wrote:
> On 17.04.23 12:16, Andy Shevchenko wrote:
> > On Mon, Apr 17, 2023 at 1:11=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:
> >> On 4/16/23 17:49, Julian Winkler wrote:
> >>> This id was removed in b47018a778c1a18cbc98b4a11936dec4f8c4bb7b, sayi=
ng it
> >>> is only used on Moorestown, but apparently the same id is also used o=
n
> >>> Medfield.
> >>>
> >>> Tested on the Medfield based Motorola RAZR i smartphone.
> >
> > Wow! This is surprising.
> > Can you tell more about your test environment? What is the Linux
> > kernel version in use and what is the userspace (AOSP, Buildroot,
> > Yocto, custom)? If custom, more details would be nice to hear.
>
> The test enviroment is postmarketOS. You can find more details on the
> Wiki page
> https://wiki.postmarketos.org/wiki/Motorola_RAZR_i_(XT890)_(motorola-smi)
>
> >>> Signed-off-by: Julian Winkler <julian.winkler1@web.de>
> >>
> >> Hmm, so this is a former SFI platform, from your:
> >> https://lore.kernel.org/all/20230223060107.23029-1-julian.winkler1@web=
.de/
> >>
> >> patch I guess the plan is to use some custom bootloader
> >> and then use x86 with devicetree support to replace SFI ?
> >
> > That would also be nice to hear in detail. With other Intel MID
> > platforms the decision was made to pursue ACPI (and U-Boot, as an
> > example) supports that for Intel Merrifield platform.
>
> I boot a 5.10 kernel, which still has SFI support, and from there I can
> boot latest mainline kernel with petitboot, kexec and devicetree.

Aha, but would it be possible to boot a U-Boot instead?

> >> Do you already have this working ?
> >>
> >> Sorry for all the questions for what is just a simple PCI-id
> >> addition. I guess I'm worried this is just the tip of
> >> the iceberg for getting medfield support back into
> >> the kernel and I'm a bit worried about how much maintenance
> >> work this will cause.
> >>
> >> E.g. also see commit e1da811218d2dc ("drm/gma500: Remove Medfield supp=
ort")
> >> which I guess you will want to see reverted too ?
> >>
> >> That is an example of a lot more code to bring back
> >> then just a single PCI-id addition.
> >>
> >> Don't get me wrong I'm all for supporting older hw
> >> if there are users who are interested in actively
> >> maintaining support for it. I just want to get a feel
> >> of the amount of work this is going to involve.
> >>
> >> Andy, Mika, any remarks ?
> >
> > I'm not against a patch if it helps existing users, but we need to
> > understand first if it will be really helpful for upstream (taking
> > into account 32-bit Intel MID support removal).
>
> My downstream kernel tree can be seen here:
> https://gitlab.com/julianwi/linux-intel-medfield.

Okay, I see that it doesn't have many patches, but it still has some
code that won't be acceptable upstream. What I would suggest is to
actually provide the ACPI tables rather than going Device Tree way.
Also note, that GPIO driver has to be integrated into gpio-pxa.c which
is the historical parent IP of the Medfield case (it was a mistake to
have a separate driver to begin with).

U-Boot would be ideal to have flashed there instead of so called
bootstub (which is 4k or 8k blob to load kernel and initrd and pass
the execution to it).

> Indeed, I needed to
> bring back some removed code to get the display working, but even
> without display driver, old smartphones can be used as a server or
> Raspberry Pi replacement.

True.

P.S. I'm on a long leave, but I can help you with the stuff to be
upstreamed and tested, we still have a device available to test in our
lab. Just see above.

--=20
With Best Regards,
Andy Shevchenko
