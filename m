Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D66CA1008
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Sep 2023 21:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238674AbjIEVlD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Sep 2023 17:41:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbjIEVlB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 17:41:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADB4E78
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 14:40:26 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99c93638322so61553566b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 14:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693950024; x=1694554824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftHNFQGZNkAXLxgpiw6/3lCLKom4x3ijuZmKXi24tTU=;
        b=xipF4/TE+J7hoNY88VFIBZHjxzlUk7eQOTjI/EEI7jEIV1Kb5BEQpTtxpf6JuEuIC7
         /vJvVP6veP7vrDTBtsEpufvv0bCs6/aqhNVwK3BICC5tAHVeNuLNGvmIjb0DPeNA5Wcu
         dXDgheFltVamZmZG2vaPmKbcLES3ixWBlzMkuYSP2xmGoGRUlS2HchzVaPcmqUKfFfAk
         0u9YFMW+jSiXj9lBc0pOd3zfqA6w6TmZvC2BiOylLARKR1aAr+Qd3yaXuHoJh+JmkuPx
         4Nab36xbVEFXHUJ1vpJcZ55K/WiT04rG02HrMoPMM0tbBzIY5b538/xUsku8D69Nmi8k
         DZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693950024; x=1694554824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftHNFQGZNkAXLxgpiw6/3lCLKom4x3ijuZmKXi24tTU=;
        b=kmwXkY5nEPHTW9Tk+2A5Qa9KunnJkkgq42zZHSS5XDIXfkWxU2zTmVqrS5O2uiUYnP
         bGTmmrtQ10FyQ5OFLxx7o60Ci5F8ChF4031k9ip2Lt1uyqwYkSRHnEV18Wq3bn0ETxD+
         QtFOk17yw2wEhSOFeGlyMIFJvdTcaAJHCuRLdWZVqsTaok1t1pDr7GrMj8QwzX1WOwL/
         a3lb89D+Jd9PMXD0DrHq1ASYprNaYN2CQNLzEIDKW3Zmse7vO4ZFkqRN+5RjPCjZiPqS
         cQbkCGJE9fWDUR+uv1S1A1htzpcp36ZN1vZdg0CKBtH9h0vSFTlzCvARb1ckKaPk1T1H
         RWJA==
X-Gm-Message-State: AOJu0YzZvjQGgyVjpP6N0j3Vv4Ornj82gG6pDtrw+UzJ74BJ9Qp5jdmw
        /qZ/7pmNc/20P52PFqM5+fad5ngn54qqtGJw/ZEsDw==
X-Google-Smtp-Source: AGHT+IEMEhXVZsRVEMtjU89/Dvw/FRWlEJmOTvL/QdzNNU2bgrWU7M/nv4RmlZrpgAFmszFzkzajJuGmbex0Rqn6dGM=
X-Received: by 2002:a17:907:60cd:b0:9a4:11a3:c32b with SMTP id
 hv13-20020a17090760cd00b009a411a3c32bmr902957ejc.29.1693950023734; Tue, 05
 Sep 2023 14:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230824-strncpy-arch-x86-platform-uv-uv_nmi-v2-1-e16d9a3ec570@google.com>
 <685e4951-e283-835c-5cce-ddd802fadf62@redhat.com>
In-Reply-To: <685e4951-e283-835c-5cce-ddd802fadf62@redhat.com>
From:   Justin Stitt <justinstitt@google.com>
Date:   Tue, 5 Sep 2023 14:40:11 -0700
Message-ID: <CAFhGd8rzrUDwKyP7Bp-u4WZ1pS1Qbkapci+J+PCLFmD9Pv4Oyg@mail.gmail.com>
Subject: Re: [PATCH v2] x86/platform/uv: refactor deprecated strcpy and strncpy
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Steve Wahl <steve.wahl@hpe.com>, Mike Travis <mike.travis@hpe.com>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Yang Yang <yang.yang29@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Sep 5, 2023 at 3:52=E2=80=AFAM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi Justin,
>
> On 8/24/23 20:52, Justin Stitt wrote:
> > Both `strncpy` and `strcpy` are deprecated for use on NUL-terminated
> > destination strings [1].
> >
> > A suitable replacement is `strscpy` [2] due to the fact that it
> > guarantees NUL-termination on its destination buffer argument which is
> > _not_ the case for `strncpy` or `strcpy`!
> >
> > In this case, we can drop both the forced NUL-termination and the `... =
-1` from:
> > |       strncpy(arg, val, ACTION_LEN - 1);
> > as `strscpy` implicitly has this behavior.
> >
> > Also include slight refactor to code removing possible new-line chars a=
s
> > per Yang Yang's work at [3]. This reduces code size and complexity by
> > using more robust and better understood interfaces.
> >
> > Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on=
-nul-terminated-strings[1]
> > Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en=
.html [2]
> > Link: https://lore.kernel.org/all/202212091545310085328@zte.com.cn/ [3]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Co-developed-by: Yang Yang <yang.yang29@zte.com.cn>
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> > Changes in v2:
> > - use `sizeof` on destination string instead of `strlen` (thanks Andy, =
Kees and Dimitri)
> > - refactor code to remove potential new-line chars (thanks Yang Yang an=
d Andy)
> > - Link to v1: https://lore.kernel.org/r/20230822-strncpy-arch-x86-platf=
orm-uv-uv_nmi-v1-1-931f2943de0d@google.com
> > ---
> > Note: build-tested only
> >
> > Another thing, Yang Yang's patch [3] had some review from Andy regardin=
g
> > the use of `-1` and `+1` in and around the strnchrnul invocation. I
> > believe Yang Yang's original implementation is correct but let's also
> > just use sizeof(arg) instead of ACTION_LEN.
> >
> > Here's a godbolt link detailing some findings around the new-line
> > refactor in response to Andy's feedback: https://godbolt.org/z/K8drG3oq=
5
> > ---
> >  arch/x86/platform/uv/uv_nmi.c | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/x86/platform/uv/uv_nmi.c b/arch/x86/platform/uv/uv_nm=
i.c
> > index a60af0230e27..913347b2b9ab 100644
> > --- a/arch/x86/platform/uv/uv_nmi.c
> > +++ b/arch/x86/platform/uv/uv_nmi.c
> > @@ -202,21 +202,17 @@ static int param_set_action(const char *val, cons=
t struct kernel_param *kp)
> >  {
> >       int i;
> >       int n =3D ARRAY_SIZE(valid_acts);
> > -     char arg[ACTION_LEN], *p;
> > +     char arg[ACTION_LEN];
> >
> >       /* (remove possible '\n') */
> > -     strncpy(arg, val, ACTION_LEN - 1);
> > -     arg[ACTION_LEN - 1] =3D '\0';
> > -     p =3D strchr(arg, '\n');
> > -     if (p)
> > -             *p =3D '\0';
> > +     strscpy(arg, val, strnchrnul(val, sizeof(arg) - 1, '\n') - val + =
1);
>
> I have 25 years of C-programming experience and even I
> cannot read this.
>
> It seems to me that you are trying to use the length
> argument to not copy the '\n' here.
>
> While at the same time using strnchr(..., sizeof(arg) ...)
> instead of normal strchr() to make sure you don't pass\
> a value bigger then sizeof(arg) as length to strscpy().
>
> Please do not do this it is needlessly complicated and
> makes the code almost impossible to read / reason about.
>
> What the original code was doing, first copying at
> most ACTION_LEN - 1 bytes into arg and then ensuring
> 0 termination, followed by stripping '\n' from the
> writable copy we have just made is much cleaner.
>
> IMHO this patch should simple replace the strncpy()
> + 0 termination with a strscpy() and not make
> any other changes, leading to:
>
>         /* (remove possible '\n') */
>         strscpy(arg, val, sizeof(arg));
>         p =3D strchr(arg, '\n');
>         if (p)
>                 *p =3D '\0';
>
> See how this is much much more readable /
> much easier to wrap ones mind around ?

Right, I agree. This was basically the v1 of my patch. I will send a
v3 with feedback implemented.

>
> And then as a *separate* followup patch
> you could simplify this further by using strchrnul():
>
>         /* (remove possible '\n') */
>         strscpy(arg, val, sizeof(arg));
>         p =3D strchrnul(arg, '\n');
>         *p =3D '\0';
>
> But again that belongs in a separate patch
> since it is not:
>
> "refactor deprecated strcpy and strncpy"
>
> Regards,
>
> Hans
>
>
>
>
>
>
> >
> >       for (i =3D 0; i < n; i++)
> >               if (!strcmp(arg, valid_acts[i].action))
> >                       break;
> >
> >       if (i < n) {
> > -             strcpy(uv_nmi_action, arg);
> > +             strscpy(uv_nmi_action, arg, sizeof(uv_nmi_action));
> >               pr_info("UV: New NMI action:%s\n", uv_nmi_action);
> >               return 0;
> >       }
> > @@ -959,7 +955,7 @@ static int uv_handle_nmi(unsigned int reason, struc=
t pt_regs *regs)
> >
> >               /* Unexpected return, revert action to "dump" */
> >               if (master)
> > -                     strncpy(uv_nmi_action, "dump", strlen(uv_nmi_acti=
on));
> > +                     strscpy(uv_nmi_action, "dump", sizeof(uv_nmi_acti=
on));
> >       }
> >
> >       /* Pause as all CPU's enter the NMI handler */
> >
> > ---
> > base-commit: 706a741595047797872e669b3101429ab8d378ef
> > change-id: 20230822-strncpy-arch-x86-platform-uv-uv_nmi-474e5295c2c1
> >
> > Best regards,
> > --
> > Justin Stitt <justinstitt@google.com>
> >
>
