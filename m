Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070ACC43334
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 11:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiGILtu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Jul 2022 07:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiGILtu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Jul 2022 07:49:50 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBFB18B16
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 04:49:47 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id f73so1670503yba.10
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 Jul 2022 04:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b4JgXK2qzyqueEjBo4pl9JDtirmOYWYxuVTNifmliN4=;
        b=M2bVyx/Mbh/Q+ZxJZQZ4CLc6Dy1Al11rJ4HJTGt/NWCKb0zXP9MurM0QPLvTTR6D9H
         COtJ6CwHGRJHR7gfjIwAc/JmbbzGyc3j1f3shLheGg1mZT7DTguTTdQxdleC95QygotK
         u0SpJ2wgJXmpDGjvz5Wn/Wmtiu5/N2LUk61ksUhOBoWyVX7g7xIltVHNjLXClWHXKdiV
         ACCwvpr1LKw6LF9JejMyl54RqiRbNbd4LB4dKKsyWyDOX0i2H9o828an63MtIFcY4ow7
         2maA0Dlo5unBi5+jrqZgRAiI3iWWA3fNYGyUA1AsxTQFIunw0IReXOzjTtD9twNkNyL3
         Bprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b4JgXK2qzyqueEjBo4pl9JDtirmOYWYxuVTNifmliN4=;
        b=EZid6Mo4rOyE7YRi6GzaM0VLKapBpq5L/f4bgoGZ2kQtucRA3Jq1nnnYHu9jtJhsx3
         s9DHiPfVyAjWrBjbPnGVUjoLJZ1qjB+igt1lme56hbAXk7VaxebCYaRlkiq7DJH5B8zJ
         HygYbsaRj73z381gCpYEqp+zzXnGdXUiKZK1tlb6W1nUjiD+j/v9dTii0nXBcQ7SwRma
         M88wjR6vRURzlLNhaooaQkxo3LcHyLLBu7pY0YOV4FIkHFRuNRtF4Rvfcrd7F1/28M/D
         kCeLXB0VET1KC35b5Yu1ptotKniavO7AAsV+XoYPq7AYTtkU7rYF63m7iPyygPYKpmrv
         yYHw==
X-Gm-Message-State: AJIora9ZqNp52UFY/wXOtMOuwNETUoUHoqBJ7CHtHD7xZt+nHSgjpCqB
        S1A3mnYL1ZqO/5jrkEMz0SLD1Rh+w8EzHe865LI=
X-Google-Smtp-Source: AGRyM1sMlqZPMaIxnfPI3Y2A05Lct3CQvzaiOxp0bIyzS/RIwxU1TIuKmOfhQbTR2YbD8IUE/ZnZzVoP6tuPVW2L+L0=
X-Received: by 2002:a25:cbcf:0:b0:66e:8893:a02c with SMTP id
 b198-20020a25cbcf000000b0066e8893a02cmr8554595ybg.460.1657367387054; Sat, 09
 Jul 2022 04:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <ddd7bf26-f790-1e7a-dd19-9db2e5336cff@gmx.de> <ae136d14-d632-5e58-fb21-28c5e79f92ff@redhat.com>
In-Reply-To: <ae136d14-d632-5e58-fb21-28c5e79f92ff@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 9 Jul 2022 13:49:10 +0200
Message-ID: <CAHp75Vd4J2VfBKCbQewNmjrPHk7-adjYkyxPh4tZbR67oUvW1Q@mail.gmail.com>
Subject: Re: WMI driver duplicate UUID
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Armin Wolf <W_Armin@gmx.de>,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Mark Gross <markgross@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Jul 9, 2022 at 1:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 7/9/22 03:33, Armin Wolf wrote:

> > while trying to write my own WMI driver, i noticed that the WMI bus driver complained
> > about duplicated WMI UUIDs. After doing some research, i think i found the reason for
> > these messages:
> >
> > Apparently, the ACPI WMI specification by Microsoft treats the _UID of the WMI PnP-device
> > like a namespace, which means that duplicate UUIDs are llegal if they do not share the same
> > namespace (= PnP-device).
> >
> > In my case, only one wmi-bmof device is used, the rest is filtered out despite laying in
> > a different namespace since they have the same UUID.
> >
> > Could it be theoretically possible to fix this issue with the WMI bus?
>
> Yes this has been a known issue for quite a while now, there
> is a bugzilla for this here:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=201885
>
> As pointed out there, patches fixing this have been posted
> a few years ago already, but they did not get merged.
>
> The patches are here:
>
> https://lkml.org/lkml/2017/12/8/912
> https://lkml.org/lkml/2017/12/8/914
>
> There is one review comment which needs to be addressed:
>
> https://lkml.org/lkml/2017/12/9/165
>
> If you can pick these patches up, address the review
> comment, test them and then submit a version 2 upstream
> I would be happy to merge this into the platform-drivers-x86
> tree.

https://lore.kernel.org/all/1512786861-1014-1-git-send-email-mario.limonciello@dell.com/

This way it's easier to handle with `b4`

  b4 am -s https://lore.kernel.org/all/1512786861-1014-1-git-send-email-mario.limonciello@dell.com/

-- 
With Best Regards,
Andy Shevchenko
