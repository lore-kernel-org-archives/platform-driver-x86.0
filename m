Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFB5C47089
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 14:54:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBE59611AE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 14:54:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbhE0Oz5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 May 2021 10:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhE0Oz5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 May 2021 10:55:57 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C469BC061574
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 May 2021 07:54:22 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id q16so97793pls.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 May 2021 07:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BCHPZ6ghRs75zxI3cRSoQNM7vQ4POzwlFYGclyulJH0=;
        b=jKgdYsB1wf0rxHn4m4Hhy1q6mqm5B8H2byrHuZINzknDe3V39p3cM6nHdo8VxD62ek
         AasaHObqy4VHhgAh161tRvhQXZSuLNmFPeEqd1EmmzzN6qCbw5wrlaGHucob4UM9evxf
         yQDGF/rRo4sOQQsd/Xxn7cUIDej1fZnJgZ+0G7fMApolVahvRXuHzakNbfV8WwklIo0W
         vi9DzpRVXkADsna+YlsRghAVQcesk5ge7j/SlKxgj3ycjug+vFg1ArhiWVvG4z8PE0Xx
         89sqmt8afYgBnffYh4uuj36ee9lrbsOfBIRR8lN13l1v/KhPbhXHvtw40RCjVv9vTwBE
         T3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BCHPZ6ghRs75zxI3cRSoQNM7vQ4POzwlFYGclyulJH0=;
        b=G1zUNQY5SyGXTC8c3Nak3YT8v+qoOhypYD7Jzs1dNcKkU2wRTECBm898Yjh6BpkD3L
         lvzhpks1PRQnsR5WFuh6TeInAs8U35Zi5cWslHdsiHNxwZCPXZhhQT/L1aDlriunzNiY
         xf2y/Ubv5RW9xyr5xfGKu6uLEMm3WeOyk21arw/PlypBO4ndbDQ8jpqbgXEJEwK+oSP/
         D5ym67EslbFxCxRO1JuvWVz3r7PT3L+AvrS7fU0cBDWJ2bGOlq9Ul40pQ2BwPsDuGcAO
         a9A3R0Q6hewub7CnMdONEkoxXnbhkVkA07RhxS4JsXMPIxiGkHj/gl64VgjljASgUZXG
         Dvzw==
X-Gm-Message-State: AOAM530boRIZxM942co6Qn9hP3V6UCVpbOlxksCpZHwDjEfsEnl3FdsR
        zAQXbIE6UpIxHLStN+CCwGKItWJO7wnM4jyRIcY=
X-Google-Smtp-Source: ABdhPJwj7EtkWEn7ae+jjCPKmtQGz54i+3570YP4vUkY19997Sf3O4LW0En5IAKubO57RExNDMx9AfHINU+PZJBVO1g=
X-Received: by 2002:a17:90a:af8b:: with SMTP id w11mr4196969pjq.228.1622127262194;
 Thu, 27 May 2021 07:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <markpearson@lenovo.com> <20210526201447.3686-1-markpearson@lenovo.com>
 <20210526201447.3686-3-markpearson@lenovo.com> <CAHp75Vd8wowab89tCZSJNfzAYAGCW8khD0JnmYTyT=czLT+R3A@mail.gmail.com>
 <721d908d-2cbf-9ae1-9792-385544b0783a@redhat.com>
In-Reply-To: <721d908d-2cbf-9ae1-9792-385544b0783a@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 May 2021 17:54:05 +0300
Message-ID: <CAHp75Venb-qBUU-dz-u35sXrNL-XnYd3yU+0cbr-b05Hxjh+xQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] platform/x86: think-lmi: Add WMI interface support
 on Lenovo platforms
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Pearson <markpearson@lenovo.com>,
        Prasanth KSR <prasanth.ksr@dell.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Dell.Client.Kernel@dell.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, May 27, 2021 at 5:36 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 5/27/21 4:16 PM, Andy Shevchenko wrote:
> > On Wed, May 26, 2021 at 11:15 PM Mark Pearson <markpearson@lenovo.com> wrote:

...

> >> +       char *set_str = NULL, *new_setting = NULL;
> >> +       char *auth_str = NULL;
> >
> > The rule of thumb is to avoid forward assignments on stack allocated
> > variables. It may decrease readability, hide real issues, and simply
> > be unneeded churn, like here. Please revisit all of them in entire
> > series.
>
> I asked for all this to be set to NULL in my review of v2,
> since there are various "goto out"s in the function and out:
> calls kfree() on all 3, in v2 there was a path which would
> end up calling kfree() on an uninitialized char *. IMHO just
> initializing all of them up front is best here because that
> guarantees that they are either still NULL, or point to
> memory returned by kmalloc.

I see your point, fine with me!

...

> >> +               /* Remove the value part */
> >> +               strreplace(item, ',', '\0');
> >
> > This is kinda non-standard pattern.
> >
> > I would see rather something like
> >
> > char *p;
> >
> > p = strchrnul(item, ',');
> > *p = '\0';
> >
> > Yes, it's longer, but better to understand what's going on here.
>
> Erm, you actually suggested using strreplace() here in your previous review ...

There is strreplace() in use somewhere still which is what I suggested.
It might be that I missed the fact that in some places the change
happens to the ''\0' rather than another non-NUL character.

So, strreplace() is basically for changing '$a' to '$b' where neither
of them is NUL.

Otherwise we have
 - strsep()
 - strchrnul()
 - strtrim()

depending on the case.

Sorry if I was not completely clear about something.

...

> >> +       if (WARN_ON(pwdcfg.max_length >= TLMI_PWD_BUFSIZE))
> >> +               pwdcfg.max_length = TLMI_PWD_BUFSIZE - 1;
> >
> > Not sure if WARN_ON() is really what has to be called here. But I
> > haven't checked the context deeply.
>
> There are 2 max_lengths, one hardcoded in the driver so we don't
> need to dynamically manage memory for the password storage and one
> which is actually queried from the BIOS, the BIOS max-length should
> always be less then the hardcoded one in the driver (and currently
> this is true for all known models).
>
> I suggested adding the WARN_ON so that if future BIOS-es ever bump
> max_length we will get a bug-report about this and then we can
> bump the driver's TLMI_PWD_BUFSIZE value.

I see your point, thanks for elaboration.

-- 
With Best Regards,
Andy Shevchenko
