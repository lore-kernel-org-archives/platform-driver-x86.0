Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C54C3DA66
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Aug 2023 23:00:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237224AbjHWXA2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Aug 2023 19:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238584AbjHWXAR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Aug 2023 19:00:17 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F709E50
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Aug 2023 16:00:16 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bf7a6509deso26066435ad.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Aug 2023 16:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692831616; x=1693436416;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qLCjiWqrer6h5u4yI8Dn0Or6ThhoDKnShaXJx7/pdGE=;
        b=UBZbuy8xVhmnRBWeBVoKov76R5VoBWk1szD0y0BxtODZXChyrNnbdhbPfNss7yGvHB
         Ai2jOJw24v7GYVS7EosaI04ttXJ9Ux/xC2X3bX7aw+iLMkuLnwDSHpfTEBw7IJNGgB21
         R6OM6JD3BgcW8+ChbJj3YPLORRqMAFTZuhQbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692831616; x=1693436416;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLCjiWqrer6h5u4yI8Dn0Or6ThhoDKnShaXJx7/pdGE=;
        b=IrSc8FXhnsMrFZd91wF2NHL044ocLRUBVrlw4sAZlLHM4xBLnY5IRpe8xArBgEqWYU
         otpINXNOZr5NP55Qtz87ozfvTBDIzyFmK4CF6wLuuRmmD1mqAroHQe+zXYX5Cs20K7yO
         sjjkJsWPOmBVYo5KbOzgxfhGZZsW7nVLuDV/LrC1kGWBLoTX/3wMvpUS+l43IDzV8Vi8
         F7PbbB+34SzQ3t4gCkH0QaQoeoKqwmVlqpDkofeeDucxGWaBndZODqnlN6/N/GfJQETs
         /Ev/lZYIZkqftF1xSrcFyEw+I47c+VrwYk2UH5A0XSzwP9hu1erSGYC2+nLK6V+oyOnU
         W9ew==
X-Gm-Message-State: AOJu0Yw8UwFkzE3s9LkZZDtGGrVS4FhuTlveEbNu53MQ94bzZEUhAko9
        XXqfg8JXT9cv+xO/STrIj1UprA==
X-Google-Smtp-Source: AGHT+IFcZLZc30xTImLvbb8bl+52iDkfKxeYad4KzUtWrIA+9bEUNamHUEuGPdJDEkAbRzoSqG3zWQ==
X-Received: by 2002:a17:902:70cc:b0:1bc:9c70:b955 with SMTP id l12-20020a17090270cc00b001bc9c70b955mr11401623plt.28.1692831615671;
        Wed, 23 Aug 2023 16:00:15 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o4-20020a170902bcc400b001b88da737c6sm11439844pls.54.2023.08.23.16.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 16:00:14 -0700 (PDT)
Date:   Wed, 23 Aug 2023 16:00:13 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Steve Wahl <steve.wahl@hpe.com>,
        Mike Travis <mike.travis@hpe.com>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] x86/platform/uv: refactor deprecated strcpy and strncpy
Message-ID: <202308231554.4873EE731@keescook>
References: <20230822-strncpy-arch-x86-platform-uv-uv_nmi-v1-1-931f2943de0d@google.com>
 <CAHp75VeieNZ3+-2oq2yx36mJ0ERBkuF=f_uhAh8o0sFnHY6Wsg@mail.gmail.com>
 <CAFhGd8q1UeaUC-Wm9+Jr=7KZLk-VUn+EsOPP0uc1sFk+cv_yoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFhGd8q1UeaUC-Wm9+Jr=7KZLk-VUn+EsOPP0uc1sFk+cv_yoQ@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Aug 23, 2023 at 03:49:34PM -0700, Justin Stitt wrote:
> On Wed, Aug 23, 2023 at 4:07 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Wed, Aug 23, 2023 at 1:32 AM Justin Stitt <justinstitt@google.com> wrote:
> > >
> > > Both `strncpy` and `strcpy` are deprecated for use on NUL-terminated
> > > destination strings [1].
> > >
> > > A suitable replacement is `strscpy` [2] due to the fact that it
> > > guarantees NUL-termination on its destination buffer argument which is
> > > _not_ the case for `strncpy` or `strcpy`!
> > >
> > > In this case, we can drop both the forced NUL-termination and the `... -1` from:
> > > |       strncpy(arg, val, ACTION_LEN - 1);
> > > as `strscpy` implicitly has this behavior.
> >
> > ...
> >
> > >         char arg[ACTION_LEN], *p;
> > >
> > >         /* (remove possible '\n') */
> > > -       strncpy(arg, val, ACTION_LEN - 1);
> > > -       arg[ACTION_LEN - 1] = '\0';
> > > +       strscpy(arg, val, ACTION_LEN);
> > >         p = strchr(arg, '\n');
> > >         if (p)
> > >                 *p = '\0';
> >
> > https://lore.kernel.org/all/202212091545310085328@zte.com.cn/
> >
> > ...
> >
> > > +               strscpy(uv_nmi_action, arg, strlen(uv_nmi_action));
> >
> > strlen() on the destination?!
> >
> > ...
> >
> > > -                       strncpy(uv_nmi_action, "dump", strlen(uv_nmi_action));
> > > +                       strscpy(uv_nmi_action, "dump", strlen(uv_nmi_action));
> >
> > Again, this is weird.
> 
> This is a common pattern with `strxcpy` and `sizeof` if you `$ rg
> "strncpy\(.*sizeof"`. Do you recommend I switch the strlen(dest) to
> strlen(src)? I only kept as-is because that's what was there
> originally and I assumed some greater purpose of it.

It's best to avoid any assumptions. If it can't be answered through code
inspection, the next best thing would be to ask for clarification. In
looking I see uv_nmi_action is a string:

arch/x86/platform/uv/uv_nmi.c:193:typedef char action_t[ACTION_LEN];

arch/x86/platform/uv/uv_nmi.c:          strcpy(uv_nmi_action, arg);
arch/x86/platform/uv/uv_nmi.c:module_param_named(action, uv_nmi_action, action, 0644);
arch/x86/platform/uv/uv_nmi.c:  return (strncmp(uv_nmi_action, action, strlen(action)) == 0);
arch/x86/platform/uv/uv_nmi.c:                  strncpy(uv_nmi_action, "dump", strlen(uv_nmi_action));

using strlen() here seems "accidentally safe", as it's overwriting
"kdump":

        if (uv_nmi_action_is("kdump")) {
                uv_nmi_kdump(cpu, master, regs);

                /* Unexpected return, revert action to "dump" */
                if (master)
                        strncpy(uv_nmi_action, "dump", strlen(uv_nmi_action));

anyway, a simple "sizeof" should be used AFAICT.

-- 
Kees Cook
