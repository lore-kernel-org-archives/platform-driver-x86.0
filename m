Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B912DC2B9F8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 16:18:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C291611C2
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 May 2021 16:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbhEYQUD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 May 2021 12:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhEYQUA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 May 2021 12:20:00 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27EC1C061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 May 2021 09:18:30 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id v13-20020a17090abb8db029015f9f7d7290so2074443pjr.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 May 2021 09:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y05Q/xqageaMqpuWZjVPY2JeD4gF4QOeU3Cbfek8o9Y=;
        b=cpFoIs2fQ/pUuAILWjIl7rzo1F6E2aQs1taN/8NtUcbBUYfoFaAJP5zV9VdGB1rpRT
         5vQzguRUiFjrzS/P5Ovsz/Bx6c35eCWBsuCafZgrl2TLYkABiKufSG2MG52hZguKMkEL
         MkcQx551xSAo8vt5yPVosejKwd1gZWiq3RJdV4LnmX8HI5zOJFHT7GBtPMkQz7ebKS2B
         c29e0aYrAzWygCSy7wf2GMVzPnQfJfGXOWn4XE8THzPVEv5a36Ips/m0vcFZ+1Emr24u
         x9YoOuRCb2RrAsPBYLjeL46ka5zMK1LrVezn6uxPVAp3BEXXz2L5diWpqXJa2Ox3SvrC
         eLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y05Q/xqageaMqpuWZjVPY2JeD4gF4QOeU3Cbfek8o9Y=;
        b=cfGwVRIX+QgqC9nnXBYP0KWNIljfYDyTTn31tcWxnyoXvryefGchtFl22OlZOB4r+/
         39mxHT8tzeOQXa2Z8B8l3X4AtxK7sTBURY9e0zUBTFXUPDaXc4gz9CWzg79xnShgekbJ
         6PbnXEqQeex8mQXJgtXL9Nbrij+rtizrZ6GJzje6jnZfB04PzHHFYEtEI8XnCpFp2hlO
         2Z0/VlIYcwoPMu5bA9hFA3JyyG5fC3X9pQlal/XfRzzlwRnUHbBCx0d1g3K4TWVMOuMv
         X8aS2knq8aJK1GHld9Y7B9xZSeEoRSiOAzOagodBwroTZKJ/mDHy0IHPDYs+k9Ppbiaf
         I+JA==
X-Gm-Message-State: AOAM531weY7iAhomNVlKim9Dxgw9xuNROd70o3SkE7LIpIA8jXYpw0jN
        ExlGiQdx2/ZB9Xt4vlXIFd34M3gouabXUgxrscg=
X-Google-Smtp-Source: ABdhPJz1zRQ09o9fGsG75M8wO07eAI+kUsH79E9P6X2aukj9uzx/AOjkMzwkjeDZBx/83T/maDmTecf56JyaDs55AIU=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr5632736pja.181.1621959509526;
 Tue, 25 May 2021 09:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <markpearson@lenovo.com> <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com> <CAHp75VfM=Vv2pe=KNYQO_hf_8Ya-m8QH481xnu+OPoZL-p8TSA@mail.gmail.com>
 <f13956b5-511e-1793-c089-6f72628ea7a8@lenovo.com>
In-Reply-To: <f13956b5-511e-1793-c089-6f72628ea7a8@lenovo.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 25 May 2021 19:18:13 +0300
Message-ID: <CAHp75VduaxS7XtcxthFts8rF2stYR3w26527_kJj_+m-XvS-NA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 25, 2021 at 6:14 PM Mark Pearson <markpearson@lenovo.com> wrote:
> On 2021-05-22 7:04 a.m., Andy Shevchenko wrote:
> > On Sun, May 9, 2021 at 5:02 AM Mark Pearson <markpearson@lenovo.com> wrote:

...

> >> +       *string = kstrdup(obj->string.pointer, GFP_KERNEL);
> >> +       kfree(obj);
> >> +       return *string ? 0 : -ENOMEM;
> >
> > This breaks the principle "don't touch the output in error case".
>
> But I'm not changing *string in an error case here - I'm not
> understanding the issue here.
> Happy to rewrite it to make it clearer though if that would help.

*string may be not NULL when you do assign it.
You need to assign it iff you are about to return 0.

...

> >> +       length = strlen(buf);
> >> +       if (buf[length-1] == '\n')
> >> +               length--;
> >
> > This will prevent you from using \n in the password. Why?
> The BIOS doesn't like it - so we strip it out :)

I haven't checked, but if there is no description of this in the
documentation/commit message, should be added.

...

> >> +       memcpy(setting->password, buf, length);
> >
> >> +       setting->password[length] = '\0';
> >
> > Why is the password a *string*? From where that assumption comes from?
> Sorry, I'm not understanding the question here. It's what our BIOS is
> expecting. I'm missing something here

So, BIOS restrictions should be documented if not yet.

...

> >> +       /* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
> >> +       len = strlen(setting->password) + strlen(encoding_options[setting->encoding])
> >> +               + strlen(setting->kbdlang) + 3 /* type */
> >> +               + strlen(new_pwd) + 6 /* punctuation and terminator*/;
> >> +       auth_str = kzalloc(len, GFP_KERNEL);
> >> +       snprintf(auth_str, len, "%s,%s,%s,%s,%s;",
> >> +                setting->pwd_type, setting->password, new_pwd,
> >> +                encoding_options[setting->encoding], setting->kbdlang);
> >
> > NIH of kasprintf()
> Not sure what NIH is -

https://en.wikipedia.org/wiki/Not_invented_here

> but I'm assuming I should be using kasprintf
> instead of snprinf :)
> I wasn't aware of it - thank you.

strlen+kmalloc+sprintf == kasprintf

...

> > The terminator line doesn't need a comma.
> Argh. I always get this wrong as to when it is required and when it isn't.
> I'll fix

If it is supposed to be the last entry (i.o.w. terminator) --> no comma.

-- 
With Best Regards,
Andy Shevchenko
