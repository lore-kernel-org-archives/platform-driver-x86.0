Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DD8C77B61
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Apr 2023 10:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243568AbjD0Kd7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Apr 2023 06:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243570AbjD0Kd6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Apr 2023 06:33:58 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A184EC9
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Apr 2023 03:33:54 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-751319e0dbfso176301785a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Apr 2023 03:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682591633; x=1685183633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STZ5OnhZVwRaR989fE7YAxrCvdFPKxI4Wol1+QwKhrs=;
        b=eb1KbYGyN5mCcwF3QcJ5olBnIbXTkt4JroJkcbBvTmUa6jEpcBM2WS1UWLX8PF5Tgz
         1iz5waOnzIdVIPvkdNF6FEEVzTs03FpRmyrZIiuVPllXkFvJ+S+deEqhHobMQWmRy3xI
         Rq8iTDcKXqRBII3SgTqaBn74Q9ktOMT+kCnCVuw9wQaBJj8YApOxQncRqSlndk3vRgNI
         DtbUUqw49w/U5XTkfUkXVbWEWW5zYKiWpH8OJgwwMD2AleSxeETWH4s+04HK2C+iZHXR
         9ijU622XK4Ihy2bS4tJSlbzAc1/CwjUAwu/+a3iwmJV9lFla0qIg144fG3lGfMBYhTYc
         mNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682591633; x=1685183633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STZ5OnhZVwRaR989fE7YAxrCvdFPKxI4Wol1+QwKhrs=;
        b=bx4Yf4EzC+IEMnnqJiy2Qs6qzKAvSNbhUuxTKKrWxaKpYKMureW03RI+hLd6UEViLj
         xeck4UraNdQeV+p4Wl+ZWVoUiF66xgjVMBI2+PA7dgYWi8x4MYKHdZLJQHjTrrv3e68t
         25wBN7c1jiyWrM6D2jsDSxe2XR+HQTRmD+UXFf0re09FVNaedxD1QAtOBXt/0jlA/N4k
         sYE+ESJSf0ZBIyIFj/0oepT2+YN1XfIT4ZpKIhK2G3MQH6cF5kQurHJnsWp5djgLwPKt
         EA0W7XmduiUKShH+y+cwzv1UYYklxqYIAFzpVE+wgfE+hehiDM8ZBokg7RbGpmaYQmT1
         5J+w==
X-Gm-Message-State: AC+VfDxHcI6BwxEWMrpabLEeTl+0LG7wMGagjY8yR2/WabeINXtbW1w3
        9L7tBGww/Fy86W1CQRPUIF/z2rU7ZrHTUiHxiSPlN0uGxpFI0g==
X-Google-Smtp-Source: ACHHUZ5bLpBXQfhXBxIRHj6HOVbALVKmqgdAs1/SpbxC/PMiiWNqEsD5JqdDt1ChHms5nfXZFircielt+YlzaVpWg4w=
X-Received: by 2002:a05:622a:170a:b0:3ef:2f81:7865 with SMTP id
 h10-20020a05622a170a00b003ef2f817865mr9726500qtk.33.1682591633111; Thu, 27
 Apr 2023 03:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230416154932.6579-1-julian.winkler1@web.de> <6a2a97d9-140c-3e4f-aa12-c98f928f7481@redhat.com>
 <CAHp75VfFptZcJn7c_a2GLnSqJDXBwvUqWmu9Wb19a3VvwXJS5A@mail.gmail.com>
 <a52ab618-97ea-04ea-01e4-ecb673f45f09@web.de> <CAHp75VcGWo8YvHYOD19ECRDcF6D_yZB5oN24=aYgyFn5m8Kz=A@mail.gmail.com>
 <046979a4-eade-00d8-c464-05b1df9633e6@web.de>
In-Reply-To: <046979a4-eade-00d8-c464-05b1df9633e6@web.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Apr 2023 13:33:16 +0300
Message-ID: <CAHp75VcKqFPdEe+CWyESZyzV4BxTxROEvh6-iZmtHMNxsM_Q+w@mail.gmail.com>
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

On Thu, Apr 27, 2023 at 11:06=E2=80=AFAM Julian Winkler <julian.winkler1@we=
b.de> wrote:
> On 25.04.23 21:02, Andy Shevchenko wrote:
> > On Mon, Apr 17, 2023 at 4:02=E2=80=AFPM Julian Winkler <julian.winkler1=
@web.de> wrote:
> >> On 17.04.23 12:16, Andy Shevchenko wrote:
> >>> On Mon, Apr 17, 2023 at 1:11=E2=80=AFPM Hans de Goede <hdegoede@redha=
t.com> wrote:
> >>>> On 4/16/23 17:49, Julian Winkler wrote:
> >>>>> This id was removed in b47018a778c1a18cbc98b4a11936dec4f8c4bb7b, sa=
ying it
> >>>>> is only used on Moorestown, but apparently the same id is also used=
 on
> >>>>> Medfield.
> >>>>>
> >>>>> Tested on the Medfield based Motorola RAZR i smartphone.
> >>>
> >>> Wow! This is surprising.
> >>> Can you tell more about your test environment? What is the Linux
> >>> kernel version in use and what is the userspace (AOSP, Buildroot,
> >>> Yocto, custom)? If custom, more details would be nice to hear.
> >>
> >> The test enviroment is postmarketOS. You can find more details on the
> >> Wiki page
> >> https://wiki.postmarketos.org/wiki/Motorola_RAZR_i_(XT890)_(motorola-s=
mi)
> >>
> >>>>> Signed-off-by: Julian Winkler <julian.winkler1@web.de>
> >>>>
> >>>> Hmm, so this is a former SFI platform, from your:
> >>>> https://lore.kernel.org/all/20230223060107.23029-1-julian.winkler1@w=
eb.de/
> >>>>
> >>>> patch I guess the plan is to use some custom bootloader
> >>>> and then use x86 with devicetree support to replace SFI ?
> >>>
> >>> That would also be nice to hear in detail. With other Intel MID
> >>> platforms the decision was made to pursue ACPI (and U-Boot, as an
> >>> example) supports that for Intel Merrifield platform.
> >>
> >> I boot a 5.10 kernel, which still has SFI support, and from there I ca=
n
> >> boot latest mainline kernel with petitboot, kexec and devicetree.
> >
> > Aha, but would it be possible to boot a U-Boot instead?
>
> Having U-Boot support would be nice. But since I don't have a good way
> to debug the boot procedure on my device and the 5.10 mainline kernel
> just booted out of the box with working USB and eMMC drivers, it was a
> much easier way to go.

It's possible to boot U-Boot instead of the v5.10 kernel though. And
then it can provide an ACPI table.

> >>>> Do you already have this working ?
> >>>>
> >>>> Sorry for all the questions for what is just a simple PCI-id
> >>>> addition. I guess I'm worried this is just the tip of
> >>>> the iceberg for getting medfield support back into
> >>>> the kernel and I'm a bit worried about how much maintenance
> >>>> work this will cause.
> >>>>
> >>>> E.g. also see commit e1da811218d2dc ("drm/gma500: Remove Medfield su=
pport")
> >>>> which I guess you will want to see reverted too ?
> >>>>
> >>>> That is an example of a lot more code to bring back
> >>>> then just a single PCI-id addition.
> >>>>
> >>>> Don't get me wrong I'm all for supporting older hw
> >>>> if there are users who are interested in actively
> >>>> maintaining support for it. I just want to get a feel
> >>>> of the amount of work this is going to involve.
> >>>>
> >>>> Andy, Mika, any remarks ?
> >>>
> >>> I'm not against a patch if it helps existing users, but we need to
> >>> understand first if it will be really helpful for upstream (taking
> >>> into account 32-bit Intel MID support removal).
> >>
> >> My downstream kernel tree can be seen here:
> >> https://gitlab.com/julianwi/linux-intel-medfield.
> >
> > Okay, I see that it doesn't have many patches, but it still has some
> > code that won't be acceptable upstream. What I would suggest is to
> > actually provide the ACPI tables rather than going Device Tree way.
>
> The primary reason I chose to use devicetree was that the required
> drivers already have devicetree bindings (maxtouch, max17042 and
> wl1271).

Which is not a problem for ACPI. Most of that can be supported without
modifying kernel code.

> Also, I'm not really familiar with ACPI tables and don't know
> if they are flexible enough for my purposes.

More than that. There are some corner cases since DT and ACPI have
different paradigms, but ACPI is superior here. As I pointed out the
U-Boot already has support for Intel Merrifield, but won't be a big
deal to support Medfield since the critical parts are already there
(SCU, PMU, ...).

> > Also note, that GPIO driver has to be integrated into gpio-pxa.c which
> > is the historical parent IP of the Medfield case (it was a mistake to
> > have a separate driver to begin with).
> I have seen your the comment in 944dcbe84b8ab7efdfcc592b6905a797324da51c
>
> > U-Boot would be ideal to have flashed there instead of so called
> > bootstub (which is 4k or 8k blob to load kernel and initrd and pass
> > the execution to it).
>
> The bootstub is probably part of the "bos" partition, which also
> includes the implementation of androids fastboot protocol, which I need
> to reflash my device. Therefore I would rather not risk breaking it.

I think the fastboot is a separate stuff, the bootstub is a really
slim shim between firmware and the kernel.

> >> Indeed, I needed to
> >> bring back some removed code to get the display working, but even
> >> without display driver, old smartphones can be used as a server or
> >> Raspberry Pi replacement.
> >
> > True.
> >
> > P.S. I'm on a long leave, but I can help you with the stuff to be
> > upstreamed and tested, we still have a device available to test in our
> > lab. Just see above.


--=20
With Best Regards,
Andy Shevchenko
