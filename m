Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD807C47089
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 14:19:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F756613B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 May 2021 14:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236408AbhE0OUz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 May 2021 10:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236350AbhE0OUt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 May 2021 10:20:49 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F395C061574
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 May 2021 07:19:15 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso494073pjb.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 May 2021 07:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I0CKAImaqWvt6i/VLWLbzKolBRGrO5enKwWdnuItjTY=;
        b=EoMxhBE5H+5RM6WZZbMrRauzrNUbkVfDb0p17/RLsT8fxzkpxuXcR6j2u+htPcS9q5
         lboN3FdA7Xf7YSze4HxG68/79hIg9MLNU65RAkciJBOxdEsjifUP6ltSpHDMUK8QCM0+
         xi/TTDpO5QHL4L7C64SloeD/TeZGOkJLfGM60mjhcRcIgM11Z/b8w+Ju/v6f3rJPZehh
         XtOerbkK9kvOER9zfJKNNK4In1AlXxpYENSV0wPN/bEbOd8X+1KHsHY+G/woDFqT/ViQ
         BYSDt2pvwdQ+8yuOjfiRo9w959aKIj5v25nE1887jYXoyZRtjIEn6Utj41xuMmAvPU7n
         tb9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I0CKAImaqWvt6i/VLWLbzKolBRGrO5enKwWdnuItjTY=;
        b=QDVI6mXI9fPV0RU/WQ40MbfWJxQwljXYa6zclqmw4SirJ1djqOQej9zPLdxE6z0haE
         h99TDgrAHlXC3CagGvDL7fbNx5xM6gbCBI6oovqRDLOvo1SG8Kt+R0n+OUHbZU0i+CbI
         g6OaWw+I89S9cXd7oRtgWHZddpb+H8xe1WdHEIFMWYkI5VtuJEskI3qbIKjlYSFWjDmc
         LLo5CNdZ4wV1AqbANzaEh4afD3ifmHIKaVVPiJ0QwnsgPf1gsEIxV1fBS053oK8ynOJi
         OHClNskbJj9nP/F96Fsx/5bpzULIz52TT8fwMqpXPyj+6uBUz4EoFAU5S86bPyp4uDEs
         hODw==
X-Gm-Message-State: AOAM530vjI3kh4XfuZFql5IGMAT5mD9vRFbBsQiK8+FEXEK+jyVyNTqd
        MCkuOOLCTYjk6VGCDzEietGdBTuBnC3XS62Wx/k=
X-Google-Smtp-Source: ABdhPJzduOGaBlzjnUGwP4B6PHuUeBYo6LAjx+GhIr7uRwxqkATupceLnTqQwOuLqP0MNm+/OBUWZxyxlaj3NK47edc=
X-Received: by 2002:a17:902:a3cb:b029:f0:6ebe:3530 with SMTP id
 q11-20020a170902a3cbb02900f06ebe3530mr3453112plb.21.1622125154988; Thu, 27
 May 2021 07:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <markpearson@lenovo.com> <20210526201447.3686-1-markpearson@lenovo.com>
 <20210526201447.3686-3-markpearson@lenovo.com> <d7de87e0-8ce9-9da6-e2f4-71340e09890f@redhat.com>
In-Reply-To: <d7de87e0-8ce9-9da6-e2f4-71340e09890f@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 May 2021 17:18:58 +0300
Message-ID: <CAHp75VdNCzqfEt=bh3nhMHJwci-nojUU6BmRzpB8hRO_dySCVA@mail.gmail.com>
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

On Thu, May 27, 2021 at 12:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Mark, Andy,
>
> So as mentioned in my reply to patch 1/3, overall this looks pretty good.
> There are a few very small issues remaining, but they are so small that
> I've decided to fix them up and merge this into my review-hans branch
> with the issues fixed up.
>
> I plan to let this sit in review-hans a bit longer then usual to
> give you (Mark) a chance to check out the changes and ack them
> and to give Andy the time to check if his review remarks were
> addressed to his liking.

I looked into it again and commented on some stuff, but nothing
serious noted, so I think the next version would be ready to go.

> I've put remarks inline / below about the 2 things which
> I've fixed up in this patch.
>
> Andy, thank you for your review of this. Your suggestions have
> improved this driver, esp. the use of kasprintf has made some
> of the functions a lot better.

You are welcome!

-- 
With Best Regards,
Andy Shevchenko
