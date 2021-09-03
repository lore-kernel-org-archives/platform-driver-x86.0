Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E4DC4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Sep 2021 08:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6288760F91
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Sep 2021 08:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348130AbhICILw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Sep 2021 04:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348119AbhICILv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Sep 2021 04:11:51 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7CB2C061575
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Sep 2021 01:10:51 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id f129so4834835pgc.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Sep 2021 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EipCW9EwNI7zYZGwRFa52QiGdv6tBl+bvyBy9S5p7fk=;
        b=cnAV1z/p/NUjq23kWwhVLTcIgPJr0kt8roOav56i6U8Zor11T4hGrLpNQUTxPK+LDk
         EVqRag8GzWZImp3dOSvENVuCy5Hu0XA06PwnH7x9UF9TLApz41DHYGoQ8nBRu0UcwMOl
         Q4cEE3SW5+L6CjDeqpK3bZWLMXadyX8elY49GCwC90RlCpy5cWQs9zCpirBxSIK4pNOU
         ohMGyqTmHQntGahbP/T5s3ZeBE7t8s82h6CVzt85JdGSyaLqf78lXDOhWgZ3VExu9EO6
         TnxSYu2UJx1cs22cOO5aCg1tmsNkjrH1nmZK/8M8McuBlQI+AGL8pp1LkbDAPzfV5xYe
         yCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EipCW9EwNI7zYZGwRFa52QiGdv6tBl+bvyBy9S5p7fk=;
        b=t9ts1m1PyfO91bDU+vOtFl3wvdkkW7URPjRTSGwW6rSTMqRLCv34aUtjaylMfwigI4
         djzW+hOpIc8/+kHeix78sXN7kyDmkUJ5pMHx7B7UOCgVRNcMMbujTV8e6aWbTSCKMPDl
         6PoExe/YgOJ2bgj+qfaUckEtXoOQNxqBYLu48SgNyMJ9R6omD/rAbxC2bH/iI3JumZ+8
         DpVXi901kwEhEZeIFYmU9SjBXoH7trXyJN0v4nlm1PEBRBnAr9VzD9mV50I1vgtHUzKV
         zRoZ1ZrJ9njms3gwouZGBOUtfJfoSvD3eouaS7n7EEUxzs5tLC5pTMG4cCY6EKlQCVGk
         tBlA==
X-Gm-Message-State: AOAM5301axbRZLPcEk6i0N7mPiOI8merFr/87NZSyUM7VCCU9Iin6AM8
        7J5VbKNrQMtJVAnbE8V5aMREaptQjXq+xj59FfA=
X-Google-Smtp-Source: ABdhPJw339UuNwL+SoA7TytR6FU10c7FMVBLTCkXKAi2J2rx/tZPYN/baopRwYhonEAvf845KG7+kkYdZE6GhmVfON8=
X-Received: by 2002:a65:5a81:: with SMTP id c1mr2556262pgt.74.1630656651153;
 Fri, 03 Sep 2021 01:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
 <20210831224906.1072-1-ddadap@nvidia.com> <CAHp75VcvhPL2dNy4HdoEU5FtuWQkG-t0tH5rAJRKpeG0iB9AUg@mail.gmail.com>
 <91aa0937-a887-5233-5516-5137d96ae8d7@nvidia.com> <CAHp75Veyft+Ssb3xfasRawksozGHsnXiwoeUzJQ_Jn6u-uZsrQ@mail.gmail.com>
 <f6dc5d3a-f46c-4cbe-4845-5467a7c0c67b@nvidia.com>
In-Reply-To: <f6dc5d3a-f46c-4cbe-4845-5467a7c0c67b@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 3 Sep 2021 11:10:14 +0300
Message-ID: <CAHp75Vc4jFWtwDtu9Qzg0ccSY62FW=HX_9WODgW63txA2dZT-A@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        mario.limonciello@outlook.com,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Darren Hart <dvhart@infradead.org>, thomas@t-8ch.de,
        Aaron Plattner <aplattner@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Sep 2, 2021 at 11:15 PM Daniel Dadap <ddadap@nvidia.com> wrote:
> On 9/2/21 4:35 AM, Andy Shevchenko wrote:
> > On Thu, Sep 2, 2021 at 5:37 AM Daniel Dadap<ddadap@nvidia.com>  wrote:
> >> On 9/1/21 10:57 AM, Andy Shevchenko wrote:
> >>> On Wed, Sep 1, 2021 at 2:27 AM Daniel Dadap<ddadap@nvidia.com>  wrote:

...

> Okay, thanks. I suppose I should have <linux/acpi.h> as well:

Yes.

...

> >>> Missed comma.
> >> Oops. I am definitely a fan of using commas here, but I removed the
> >> commas that I had in place for the last elements of these enums, and
> >> members of static initialized structs, because I was trying to more
> >> broadly apply feedback from earlier to drop the terminal comma in the
> >> static initialized device table. I realize now that this feedback was
> >> meant only for the case of the empty struct terminator element in the
> >> device table.
> > Not only, the _MAX in the above enum is correct in leaving commas out.
>
> No, I think it does need a comma, unless I'm misunderstanding why you're
> saying it doesn't. WMAA_GET_MAX here isn't saying "this is the final
> element of the enum which is also a count of the 'real' enum values";
> it's saying "retrieve the maximum valid brightness level from the
> firmware". I renamed the enumerant to WMAA_GET_MAX_LEVEL to avoid
> aliasing with the common "_MAX" convention for the final value defined
> in an enum.

In that case, you are right.

-- 
With Best Regards,
Andy Shevchenko
