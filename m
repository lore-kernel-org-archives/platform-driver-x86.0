Return-Path: <SRS0=eM/Q=EE=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635C3C4363A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 00:32:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0BE7206DC
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Oct 2020 00:32:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uwxwj3iY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733300AbgJ1W2r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733263AbgJ1W1X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Oct 2020 18:27:23 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887CBC0613D1
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2020 15:27:23 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j30so828912lfp.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2020 15:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Dg6TspjrICJkOugoHrRVElTVqmURk390ews+cACTSJ8=;
        b=Uwxwj3iY3xmbx32gOYncPduLx0jmzJw60EJAWxSSTMMdJfc7U6orys9IQA9FigU6xX
         rPl+/FBdqiiF0wPtih7ilQou2Z7HM1Lwjspl8clUa+qQe3ZyVOhjrFIN824V9ylxUweh
         CjQ5rc/5B4k1bycKwy1Q0u0Fu2fiS33/JUfCH/nYb2MUeuvWS4P/qPVH66tuHAxIjBvt
         tLesrOrMY0O1NcQ/l96Z+FuRkzNKwk//pWlulW/TqUQz/P7AoBbB6GGXoAfGukuXXRa4
         tXqeDYmNygKz8poMFweCSU/Kt7E8+KLQaDMCOPs4O3/vMRpgJskuILJ85QK8smczcQ6B
         uQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Dg6TspjrICJkOugoHrRVElTVqmURk390ews+cACTSJ8=;
        b=fadcnlgrAqP0J98gggMuqjV1z9hNM+EVT88SqKlBH3oJh53moK1rNbpoOCTv3d55xu
         W1OMmpjRU1zC0vVtSOUYkeTpWskz0IX8N3u2H7FuBnALbOAsIHEe+kc7dV6eUxE0/SYq
         MLh4XxdBv4K+64kxwFG6ok4QSp4mdV2o0ASLVgAPPN5WHNq3lYJ2myWLs6Hgtx1ae0VJ
         4bLQRaKyPE/fCYIdTCHGplJmF0WsIjh48ZUSlZj8BpyB66of3A/g7VaS2t3WLZE0QALG
         jav9P9oeImzPns1yJmYmy4Qf81yi0H5p2j11AbfBWMMpz3pFBYBkkm4VrwHzsLsLGh5M
         BifA==
X-Gm-Message-State: AOAM532CDHj/GBv7ZOc2KgR1dljbqAbn/u5O2DI/GPRjqoRt0OvgPum8
        aWcXl70t2apL0mUdhL3CVys79HFbOIZKXHAoRa9Jw75Okg3KmA==
X-Google-Smtp-Source: ABdhPJyFslxoXrfB3fvZNaGw4SpC6v9HMRGJ4GFgkLDfF8kIH0ow84Apw5ZtF459JqJ4n+DNGDF4ynB5LMpbNaL2hDY=
X-Received: by 2002:a05:6402:17b7:: with SMTP id j23mr7853694edy.288.1603891354623;
 Wed, 28 Oct 2020 06:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
In-Reply-To: <CAHp75Ve8ncybbLB7hCb0Qxh=JjJr8e1tVrXXiJhwFt9=2b3AYg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 28 Oct 2020 14:22:22 +0100
Message-ID: <CACRpkdZoimQwdE6h4RWHGOtdm_0Gc-XDbSRyq=fu6AF9QMO+BA@mail.gmail.com>
Subject: Re: Request for pre-review of pending MID removal patch series
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Oct 23, 2020 at 7:07 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> There is a pending patch series [1] to remove a lot of legacy code
> related to old Intel MID platforms. (Note, not all of them, since we
> have an ACPI based Intel Edison edition which continue working nicely
> after this)
>
> Most of the code is shuffling arch/x86 and the series is quite
> dependent on the contents of that folder (for the sake of
> bisectability). Since that the only way it would be integrated is
> through the tip tree I would like to have your preliminary review on
> other contents =E2=80=94 #3 and #4 are PDx86 and GPIO subsystems. In this=
 case
> I won't resend this many times.
>
> I have a preliminary offline agreement with Len Brown on SFI removal
> (#2 in the list).
>
> [1]: https://gitlab.com/andy-shev/next/-/commits/topic/mid-removal/

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
