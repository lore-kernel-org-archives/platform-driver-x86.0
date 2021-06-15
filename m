Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13286C48BDF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 20:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E83D8611C0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Jun 2021 20:39:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhFOUlM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Jun 2021 16:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbhFOUlL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Jun 2021 16:41:11 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAFAAC061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jun 2021 13:39:05 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id n20so106857edv.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jun 2021 13:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SK3pv/DsyBjru99IsRchBfBFab/ZqC7QGsDuiwooP5I=;
        b=Trh/LoE052BfRSc1ZPqBTXJfWnWxxhEx0mytCOKXto0QW1pCfkBLk3ApKcL7FaVjSl
         YoLSq/+Exm3WcMqz0sMsGHX5uTiWThjT81H/JLqYmc3RnQ1+mO/pmb0/BFmus+HiFFV4
         8RBf7cJA3AMnBm79dJg5y8mvLOEvgHGam4+1QwAQyI63inE64LLImOTj2Mh9ZOuqnlVY
         firBP6/SK4mSpht8sd+YOxWNXi+wIuauPAGS8Who45gldE0BD+1kemofJuTYTN5tccdJ
         c/+gcoWIBe/UG26VUHcF3e4OMxHwbw/tlwJhFQ43F1LNfFin0AD5MhjP9KXgr8EMZWGY
         J9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SK3pv/DsyBjru99IsRchBfBFab/ZqC7QGsDuiwooP5I=;
        b=C9piSqmhN2Hb7w9YfTwC1ixtYVUukU0aKiGqU3UinQZZXwujeGtmF/cjFW8hEh4Nfi
         eiJF6S9jKCFFUs+xA0M89V+v10XACn9i/qi4XaEibIdxSiu4CAMAkT7wRRorW4upZOpQ
         L+ogsqSK3V7alPfnXZ0FZxv1KLnoz98mqNphGaJyOAgKf/T9tmlqn4X/KJRwa3bE/Cko
         G+u6ErKcby0pLATqnL26NymGoNhhEsjOOfDkhOFmbgvowsVk9H8nCzp4PASFCtCXEpdD
         5bQ65VmaimOoNbCrgiyP7/P3IXAGYELnhKZAuDqECNraW5S8InvzBhKjGOxglKnP4M/u
         56IA==
X-Gm-Message-State: AOAM5324sG/0++egLOGKSXL1AXqlinNW5HxpWIICDYlksSk00HuhMOU+
        Xg73NORKcE5B9oO7X70rL3iSalU6DruuUYzSlI/bT5Cn
X-Google-Smtp-Source: ABdhPJzBRuXm5fbCvlZYxYo9PfPyTjwxMOz4r7PqWdvbPQNgSy1bNmb8ewHzDVjfjc5UZv4Agqm+SlylzSZxt1ATjeg=
X-Received: by 2002:a50:934d:: with SMTP id n13mr18241eda.17.1623789544435;
 Tue, 15 Jun 2021 13:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdgg_onUUGVkmAsXdBeYRDVVeT67q+zvYR1tKgh7kstwhpMhw@mail.gmail.com>
 <CAMdgg_pNr7MZjA+v1kUfY69qYZCRMn-C-_MeHDwQNY3jHV7Fkg@mail.gmail.com>
In-Reply-To: <CAMdgg_pNr7MZjA+v1kUfY69qYZCRMn-C-_MeHDwQNY3jHV7Fkg@mail.gmail.com>
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
Date:   Tue, 15 Jun 2021 23:38:38 +0300
Message-ID: <CAKErNvru-LPt9z_-p8XOFbdoPD2X0a8zQLy_TLC1=mc4W+iP+Q@mail.gmail.com>
Subject: Re: IdeaPad platform driver compatibility issues
To:     =?UTF-8?B?S3J5xaF0b2YgxIxlcm7DvQ==?= <cleverline1mc@gmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "ike.pan@canonical.com" <ike.pan@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jun 15, 2021 at 11:40 AM Kry=C5=A1tof =C4=8Cern=C3=BD <cleverline1m=
c@gmail.com> wrote:
>
> Hello,
>
> I have a Lenovo Yoga 720-15ikb device and I have found following
> issues with the IdeaPad ACPI driver:
> - "fan_mode" does not work according to documentation, always returns
> 133 and can't be set to any other value from the documentation.
> According to Maxim it worked on his old laptop, but Lenovo probably
> changed it since.
> - "camera_power" is always zero and can't be set to anything else.

Are you sure your device supports this functionality? I.e. do you have
fan mode control and camera power control under Windows, probably with
some driver or application by Lenovo?

>
> Maxim asked me to provide a DSDT dump, so I did it:
> link removed
> I am willing to provide any additional information.

I looked at your DSDT, specifically at this part:

Method (VPCW, 2, Serialized)
{
    If ((Arg0 =3D=3D One))
    {
        VCMD =3D Arg1
        If ((Arg1 =3D=3D 0x11))
        {
            VDAT =3D 0x0B
            VCMD =3D Zero
            Return (Zero)
        }

        If ((Arg1 =3D=3D 0x13))
        {
            If ((OSYS < 0x07D6))
            {
                Local0 =3D VDAT /* \_SB_.PCI0.LPCB.EC0_.VDAT */
                Local0 +=3D 0x02
                ^^^^GFX0.AINT (One, DerefOf (PLV1 [Local0]))
                Return (Zero)
            }
        }
    }
    Else
    {
        VDAT =3D Arg1
    }

    Return (Zero)
}

This is a method that the ideapad-laptop driver uses to control
various things like backlight, wifi, touchpad, camera, fan.

In my DSDT the VPCW method calls the XCMD method, which has more than
20 if statements for different commands. All code that handles
commands is there, for example, setting fan mode modifies the SNBT
field in the operation region of the embedded controller (EC).

Your DSDT is different. As you see, your VPCW only handles two
commands: 0x11 (read max backlight) and 0x13 (write current
backlight). However, another difference is that in your DSDT VCMD and
VDAT are defined in the operation region of the EC, so the EC itself
probably handles all the commands on your device. Which means it's
harder to reverse engineer what's going on on your device, because we
can't look at the code, so I can't really tell why the command doesn't
work for you.

I also found two interesting methods called FANG and FANW, which I
don't have in my DSDT. However, I'm not sure at all whether they are
related to the fan or not. They look like FANG is a getter, and FANW
is a setter, but the meaning of the first argument of both methods
isn't clear to me. The driver doesn't use these methods.

So, I'm sorry, but I can't really help here.

Furthermore, it would be nice if the driver could somehow detect which
features are supported by the firmware, but I can't suggest such a
mechanism either.


> Best regards,
> Kry=C5=A1tof =C4=8Cern=C3=BD
>
>
> Sorry for the resend, I am trying to send again, because I got a reply
> from MDS that my email contains a SPAM/virus.
