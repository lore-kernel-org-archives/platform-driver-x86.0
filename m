Return-Path: <SRS0=KVMw=EB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A866C4363A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Oct 2020 16:54:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 248232224A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Oct 2020 16:54:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FghhvEU1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1786649AbgJZQy5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 26 Oct 2020 12:54:57 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:36789 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1786648AbgJZQy5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Oct 2020 12:54:57 -0400
Received: by mail-pj1-f68.google.com with SMTP id d22so2034532pjz.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2020 09:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qSeLDtHBsdoZhENg+AHxbghVmFv6wgHPX7p9S7FGXIQ=;
        b=FghhvEU1j7RXdnKgDSbxaVui+VTy+4mt0HBlMGd+JjqM7bpzSg/QKg8COqjOOkPepi
         /PfDj7nk1kXlgxzRnTRrhR0WuXjMWrJu+6ia9kfiYE/PYNZUi9ZcWXCKql/o+UJs9HDn
         KIIiit92gKUffWi/R/gO19o6TtvY4oC4zcG6ovpgltT4CgdpK688BeSrweClSAqYpbUp
         fqOvpqDqo5AdwQyjAwc21Tz77mhoEF23etQT0TyYkSSaPxnBnYHKWeQYa29AxCrxeuie
         Qie/4TrwuAtFRF8tigsHxpHAry3Ggjq4NwCdGGT2238lkFTVCP2xokMxeIkLvnNf0Obx
         c9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qSeLDtHBsdoZhENg+AHxbghVmFv6wgHPX7p9S7FGXIQ=;
        b=edaE9SQZfuTSzrqClAAPBawoJwP9zys730lQDhTVNfRQlZ/wuBsI9jMUqigtbPgOHK
         uELiy4d1X5TZrCZzs+hcbZ+OGd0xDaflnQXbMaR+Im0j3U+MJcrFst/QOnwgJK0C2OP6
         lyvRPrcH9K+oBV5DDDsZp3vHSXkhuKm1yuiQjpOPKTot8mBpe02nMLsHm4qHtZrfvN52
         t/kZl0FJB4OFcZspa5aGRWeUlAOshkoW1f+Jc3/wAovRET+5bhdA0CWuqKIkyXztytgR
         NaRyzCpT/CGd8TkDuvdWpn881unT/5KsrsOAimWYMDoGI8q7/lwoj2ZxC7QQTwLbxSnX
         NeOw==
X-Gm-Message-State: AOAM5324zdnG+zEiZH6KILGlXQhuYCPtpJXv7TapVyl8yCh8Cf5STf7V
        ZHT9HxwfnYfp5/azkk0FoofnS7QzdT5WHk5a3JQ=
X-Google-Smtp-Source: ABdhPJy9EV70s55/8jxVCLpzhmwF1R+xcMTn2eHvk3Wsg7J9wcZ72jV7D8qg+74kasd7jERkW64y+EF9SsbiNZ36PbY=
X-Received: by 2002:a17:902:6bc8:b029:d6:d9d:f28c with SMTP id
 m8-20020a1709026bc8b02900d60d9df28cmr9456321plt.17.1603731296966; Mon, 26 Oct
 2020 09:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201019185628.264473-1-hdegoede@redhat.com> <CAHp75Vcrghf330j_6P5iSxcxJYa_LvDvN3OGBBJWFpUXBPMRJQ@mail.gmail.com>
 <1cb8c938-df6d-2c99-1160-27b389b1f198@redhat.com>
In-Reply-To: <1cb8c938-df6d-2c99-1160-27b389b1f198@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 18:55:46 +0200
Message-ID: <CAHp75VeH5h7fQ6amth=Wc9WpunXZOVArxr38nc9Y1ESqBuaqzg@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: acer-wmi: Drop no-op set_quirks call
 from find_quirks
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>, Lee Chun-Yi <jlee@suse.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Oct 26, 2020 at 5:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/26/20 4:15 PM, Andy Shevchenko wrote:
> > On Mon, Oct 19, 2020 at 9:56 PM Hans de Goede <hdegoede@redhat.com> wrote:

> > In any case, LGTM, you may use my tag
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Thank you, I assume that applies to the entire series ?

Yes.

-- 
With Best Regards,
Andy Shevchenko
