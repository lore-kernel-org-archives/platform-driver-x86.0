Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059B3C432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 09:35:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D528C61051
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 09:35:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343545AbhIBJgp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 05:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245491AbhIBJgo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 05:36:44 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F344BC061575
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Sep 2021 02:35:46 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id v123so1168805pfb.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Sep 2021 02:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bXBty7UeM0eULJl4pas5Kv3O9A34yuj8uRgPsYAo0Zs=;
        b=IxPQ/VDtb/OnbSdsOGKMe7rQ66rRej9jGNYCpuO1QgDcOk4o561GDjVDEJRvujpKUK
         EfOddRJ2L04ceKKmE2WgVIwHLl39EJoaFpSpyHcD7KiV5whLztZnZTSKsGCJt6gnHjrp
         kfS/7XtDK424ODRt3z6XvIuJ3Edu7Mc/QLIGKEnKSJCQr4CiIk88e4eXvb3ZQAaCzfFT
         GUDsIHCPBKELyB0FwS5DUhUgR+whfC9TPmaxfh00V1IaxOexcQfCuoUW+dQwXPI2oesQ
         FCqGsTljfZMvPO+nMHdWyl/q2fJFMfxnuH8b1tN04NvPfNlxvK64QZ8m9SQahoy4Ikaa
         4dpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bXBty7UeM0eULJl4pas5Kv3O9A34yuj8uRgPsYAo0Zs=;
        b=ujPxQ468iqAKVYIsjQTGes8tm4zMLQi35AvqcGHTflde5uYy0aHh39kM1Diy+j9A+m
         ZbxkgN4QUJmSZh4ELaj8jQS9B82DVYmxMDED1kYRKI1LH9/mT47LBLlHn5WNYcyyXevN
         jmxi3ZfGcZC6G+VNpotQZfa9FJv9F0Qs2hEzA/FCIUScz9nrmrWQuLa1+H2h+/XdF0/Z
         psqCDnxmcP4MUXYsp2u+S3EoTTOxTgwh7Rh809/DWh6W8ka7gfUQZ01tdLmzCchEPKrq
         rkUJHB7JTjnUWrS+kg8RZV3k4y6PukzO+XBk7G5vMVerPX4SyoJoDG3yluaiUdVFFNHb
         GDSQ==
X-Gm-Message-State: AOAM532nuV8eIDxNMAZHYytd9rCGSR28cKy9z2H4dbfZTKfiM5AbHVaC
        k9In2sy3XQzHe3N0isvLF6rnbVWJEtMpLe48Tc4=
X-Google-Smtp-Source: ABdhPJw0YzdI9UdQjl9NeK+RAL4lEROJK7MkJYaZtwNFCtsEax9M63z79HyIT+5Dinte+UrlRGPp/a7JFqmwSWJ8dc4=
X-Received: by 2002:a65:45c3:: with SMTP id m3mr2344101pgr.203.1630575346384;
 Thu, 02 Sep 2021 02:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
 <20210831224906.1072-1-ddadap@nvidia.com> <CAHp75VcvhPL2dNy4HdoEU5FtuWQkG-t0tH5rAJRKpeG0iB9AUg@mail.gmail.com>
 <91aa0937-a887-5233-5516-5137d96ae8d7@nvidia.com>
In-Reply-To: <91aa0937-a887-5233-5516-5137d96ae8d7@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 2 Sep 2021 12:35:09 +0300
Message-ID: <CAHp75Veyft+Ssb3xfasRawksozGHsnXiwoeUzJQ_Jn6u-uZsrQ@mail.gmail.com>
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

On Thu, Sep 2, 2021 at 5:37 AM Daniel Dadap <ddadap@nvidia.com> wrote:
> On 9/1/21 10:57 AM, Andy Shevchenko wrote:
> > On Wed, Sep 1, 2021 at 2:27 AM Daniel Dadap <ddadap@nvidia.com> wrote:

...

> >> +#include <linux/backlight.h>
> >> +#include <linux/module.h>
> >> +#include <linux/wmi.h>
> > types.h ?
> > mod_devicetable.h ?
>
> Evidently, these must already be implicitly picked up by the headers
> which I am explicitly including here. I can see the argument for
> types.h, since it's always possible that future changes to the kernel
> might remove it from the implicit include chain, but I'm not certain why
> you're recommending mod_devicetable.h here. If it's because I use the
> MODULE_DEVICE_TABLE() macro, that seems to be defined in module.h.

No, it's because of the ID table type which leaves there.

Basically you have to find a compromise between what to include and
what to not. At least those I have mentioned are kinda core stuff that
usually should be included explicitly in the modules like this driver.

...

> >> +enum wmaa_get_or_set {
> >> +       WMAA_GET = 0,
> >> +       WMAA_SET = 1,
> >> +       WMAA_GET_MAX = 2
> > Is it part of HW protocol? Otherwise drop assignments.
>
>
> Does ACPI count as HW here? I'd certainly prefer to keep the
> assignments, since the other side of this interface is not in the Linux
> kernel.

Yes, that counts as FW and as you noticed out of the Linux kernel realm.

> >> +};

...

> >> + */
> >> +enum wmaa_source {
> >> +       WMAA_SOURCE_GPU = 1,
> >> +       WMAA_SOURCE_EC = 2,
> >> +       WMAA_SOURCE_AUX = 3
> > Missed comma.
>
>
> Oops. I am definitely a fan of using commas here, but I removed the
> commas that I had in place for the last elements of these enums, and
> members of static initialized structs, because I was trying to more
> broadly apply feedback from earlier to drop the terminal comma in the
> static initialized device table. I realize now that this feedback was
> meant only for the case of the empty struct terminator element in the
> device table.

Not only, the _MAX in the above enum is correct in leaving commas out.

> >> +};

...

> >> +       backlight = devm_backlight_device_register(
> >> +               &w->dev, "wmaa_backlight",

Strange indentation, btw.

> >> +               &w->dev, w, &wmaa_backlight_ops, &props);

-- 
With Best Regards,
Andy Shevchenko
