Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA619C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Mar 2021 13:00:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4A8961A27
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 Mar 2021 13:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhCYNAD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 Mar 2021 09:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbhCYM7c (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Mar 2021 08:59:32 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98A0C06174A
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Mar 2021 05:59:31 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so4090181pjb.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Mar 2021 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yKNa3blDA85c+XQNnm7O9roomR8DWZePj79BhY5Lm24=;
        b=nX1dh5PbX0OT8r3Ii5x8wvpMjKamJqV0RtMc0MNZH/z5wa3hygJa6JYZQnBz8QANvZ
         8qqQC59xQ0/fSy+Y83+Cv1/8FRF6gHQ1Muclio4ZQe19y36irj6Y6xQ56U7lorb2ovoy
         SKzJWbcSXiJWdgMttCzR8nlxuePkDtvrRvxgJIwEDl2VYsx2ejfB/lhTWvBwiXaGbM6+
         lZtxgOaUIUpup4oaH3NsFpxsWzeCIdQiuH7NCv8vwCXK0tyzqSK0mv7Ats3Dpqym74vs
         lBmsRTWaWi8RAbZvbLugrhdXIyD+q3cpJDo9d+EveQIoS7h1RpPOhzf5fbfTSauwLxpm
         uw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yKNa3blDA85c+XQNnm7O9roomR8DWZePj79BhY5Lm24=;
        b=dZ6RQaN/w7dSJM0VO+d1WLHdTjdKPr43T0fS5cJ8cwXS+QkLkc9ZghLnxAmwQ2aVtY
         a5sbK7bUHtHWcG2A0g+++2AvqF1Se9Jh2gMBX5JrHfzc9ah2tr9m+cDxTse8xYuNZYuT
         rUhw7Bgc/RbBhlbuNMeIySxtjuL0KJmL5yeoMGHzehpscxBbRn9o2argBtQLBeJaZqah
         ZQwTFCh4t3EqKREchnLNYxSDVAa4+GCZhqaWWK2cjnMv55IWRvRdsp9Tv3mkDdpNv1Sz
         D3TUhlay0TAQfAYi13WGlB7BweXB8+XCAw/NBnxS9Jzya4pT401Y6S9ENA2U14UIPg/a
         kIlQ==
X-Gm-Message-State: AOAM531ZxZgeS/Do/GgB01/F6fZanc/Dhj4YFsGL0mZ+R3tzvwygwCJv
        bsIThAFIlfuT3OMJ216U8usFd6yo7nyKKkHYwtY=
X-Google-Smtp-Source: ABdhPJyVDuwQx0MAdp9R5Up3m/GUQE6xNB9v5Ga8FovSeukD1y8QPNzdbVLIe/MQZA6zPT7VZM4uDTqGyDYDWdeiMZs=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr9066730pjx.181.1616677171429;
 Thu, 25 Mar 2021 05:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210325123255.73103-1-hdegoede@redhat.com>
In-Reply-To: <20210325123255.73103-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 25 Mar 2021 14:59:15 +0200
Message-ID: <CAHp75VfPfjyGLQTiQHwcj8HsrWDfoijTRdR02uGRbSkbF66SLA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Remove unused KEYMAP_LEN define
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Mar 25, 2021 at 2:34 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Now that we have 2 separate input_dev-s for the buttons and thw switches,
> this is no longer used, remove it.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel-vbtn.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index 3fdf4cbec9ad..888a764efad1 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -63,9 +63,6 @@ static const struct key_entry intel_vbtn_switchmap[] = {
>         { KE_END }
>  };
>
> -#define KEYMAP_LEN \
> -       (ARRAY_SIZE(intel_vbtn_keymap) + ARRAY_SIZE(intel_vbtn_switchmap) + 1)
> -
>  struct intel_vbtn_priv {
>         struct input_dev *buttons_dev;
>         struct input_dev *switches_dev;
> --
> 2.30.2
>


-- 
With Best Regards,
Andy Shevchenko
