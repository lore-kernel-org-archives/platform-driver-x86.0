Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA84C48BE5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 16:17:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 624DF61289
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Jun 2021 16:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhFUQTp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Jun 2021 12:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbhFUQT3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Jun 2021 12:19:29 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44924C061574
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Jun 2021 09:17:14 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id t19-20020a17090ae513b029016f66a73701so5577719pjy.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Jun 2021 09:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C0LOzV26aRFDzZUQP83eH7kAKeXhNQdJY+GCIePDTAw=;
        b=RhU+KrMa+52QqrITRoK8EtKYzB1g6M+KSU/jg8fU96lMLKl1uDcdjH5E25FcvGchQ3
         2XyURn5sCOG+XHwNqsrwn4UzVnEH6R4843WZGBPo2923x9dzcRXOeVioFfgdCZ3qd0kB
         KJHJiJJXxUwYSaP9HlCJSbKW5hwoLjkoGvbD4ZvZGZMGTQHRC0H84wrxfclMxHImq5NR
         I9InCP81TqWV27oKCbHVBupORCOVfp47pKXxJoD60jKq4NRZLWrHHYUs3ycW0TZ7ol1k
         PJm5MNwWH6ixrRx+0XxGd/f3hcQHvUb0Yk2vch0oS3YWdaeov1QsNWxt7sucgGGBFmAY
         4hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C0LOzV26aRFDzZUQP83eH7kAKeXhNQdJY+GCIePDTAw=;
        b=H2vJXWSJ2gbXfU3EGPJTnASw6O1EGMqZe6eu/YFXOgiPHP+fgZaEybvQxPWmY5FWZD
         J6Z66W4jYvtJaMSKw+bCRY3DvuMmSveuoIx+n1Z+2BHTcZrd+5eajb6+Z1qXgaDcOuoF
         FDgEkk9ZpelRBND89VDf+mjbh4mFFlG/xZl8dLVfizGrVG/qhO3Fyg2+RiLi8CRLOJJL
         oiBkkLcLK699QtHbmetdL2Lp7tJ2gUwOIh9PhSTvzEHWIQFpKwU42akv6MDmLG14E9/f
         RwIVWROOzGchWvrKOc+O6CfbsVZeZKClgPUslHrA/kqBBRvvwfxq6lSQ0XVr3pkHk3Ot
         tSdg==
X-Gm-Message-State: AOAM532dP+sK6iKtgu1s37nCUYeCe8Q9Kpx9OpU9ZGOchmGaYvCWCUpy
        h3WZJOuAt6M+zNQ8MWc9UVD/0uxIpuRSI+Z3rVM=
X-Google-Smtp-Source: ABdhPJyrP6Je+Pc6vbNWeYzWeUjlTiWXhCr0n0WZE0srXZ4hzFXCk2F2lU7IClJh876Bm9oYqxXGpFK9uyP5u1u1eIM=
X-Received: by 2002:a17:90a:bc89:: with SMTP id x9mr28247699pjr.228.1624292233777;
 Mon, 21 Jun 2021 09:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210621132354.57127-1-hdegoede@redhat.com> <CAHp75Veh-t0KO4To8gbZej1bifJbrc3ppxnLzun0BcbsOBqZnA@mail.gmail.com>
 <ca520d5f-0288-30ef-0191-96f890a2ba4c@redhat.com>
In-Reply-To: <ca520d5f-0288-30ef-0191-96f890a2ba4c@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Jun 2021 19:16:37 +0300
Message-ID: <CAHp75Vcu+3-7dQwJDTLfQVwvSsOB9uOby7rq4w4cxLKMn1q+oA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: think-lmi: Return EINVAL when kbdlang gets
 set to a 0 length string
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jun 21, 2021 at 5:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 6/21/21 3:58 PM, Andy Shevchenko wrote:
> > On Mon, Jun 21, 2021 at 4:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Commit 0ddcf3a6b442 ("platform/x86: think-lmi: Avoid potential read before
> >> start of the buffer") moved the lengt == 0 up to before stripping the '\n'
> >
> > length
>
> Ack, will fix.
>
> >> which typically gets added when users echo a value to a sysfs-attribute
> >> from the shell.
> >>
> >> This avoids a potential buffer-underrun, but it also causes a behavioral
> >> change, prior to this change "echo > kbdlang", iow writing just a single
> >> '\n' would result in an EINVAL error, but after the change this gets
> >> accepted setting kbdlang to an empty string.
> >
> > And why is it a problem?
>
> Because there are only a couple of valid string like "de", "fr", "es"
> and "us". We don't know the exact set of valid strings for a certain
> BIOS, but we do not for sure that an empty string is not valid.

Since we call strlen() on the buf it means we are expecting
NUL-terminated string no matter what.
In this case the

  p = skip_spaces(buf);
  length = strchrnul(buf, '\n') - p;
  if (!length || length >= ...)
    return ...

seems the best, no?

-- 
With Best Regards,
Andy Shevchenko
