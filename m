Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3A2C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Dec 2022 15:11:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbiLLPLK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Dec 2022 10:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbiLLPLJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Dec 2022 10:11:09 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A16512D2C
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Dec 2022 07:11:07 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id ja17so2771936wmb.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Dec 2022 07:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ugbkO/yM9HgKH0V9IJHHkJHrC/RrKAOEffXfUGaZoAM=;
        b=Spz2j5iebq0SeHJbzOXxWHeTqZd5Jvo193Vk3xjqx8hN47v0oB3+8NgPiv66tA04as
         T6mbCEdFnAMTi+THHDjCriEtdy4rIT2oNg8DBlbzwjSXnAzg3GQ/imkioKLlpf0LCXhl
         EJ/4y0UMF0revGzVjbwcGE9+4hY+UM3gTqydIfdIIyNkwjvQc2C/9psnFUpZSnn1NVrp
         mhNO7Nogkuk7exv6K68gtcGF6aZS0GMk3QFpPZknrzhXPQOcSc3xxfMcXUmbENOBtOiV
         JpmTEr7S96AUrg3TRu0G3NFwasRxf5Jl8cta+vYt1FDpfEyATHNIIv0VhsUnpDI8fdEO
         98mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugbkO/yM9HgKH0V9IJHHkJHrC/RrKAOEffXfUGaZoAM=;
        b=5vzxF5pwP1A7jW5cJLcBft93bMwQ1K1ZfTFT7ssCR+NmBq6axG3H0tDHcIZgw2K/Ft
         zbctHpS2AYd27hHBTEBROBSOpnXD+6FTmEsVDWmolAZVcFzUW9t8EmXYW49LvddAkmAE
         qL7idtPfyD35uGR+fAvpZ2e1uii/Ld9yE/yBkZINJvbE75CmjeaejS1BCHJNBENQdVWx
         Ezk9UeRQbZv1ZPCM6z6s+FIIpwyq9GF9d3ly2bFCUte9iA9RvfI0FYm1iifiOC+yHw4Y
         OJ7dwZPGaTD0PGFgRxca/5S1Cr9kE8T6QvyVmG3+eEuQu4qyP61N7GapUtdkwXY6fyeP
         372w==
X-Gm-Message-State: ANoB5pmT6RLLq6MGe8gtvK5UWWNLJQUR4bssk7Qn8weOgXFcz6AlZ+nP
        5GA76eV1XbYqV9tFJkIZcFGs6SCvXQyO69EXTsaqaqP5
X-Google-Smtp-Source: AA0mqf4LzXoN9SYAjlHT626NCvO3dY7ytEE0Kzs1rQLdtoAhpzJRsH4vE+gkpxLOF38WaMDPGh83aHjJ1HnVXTxV+ZM=
X-Received: by 2002:a05:600c:54cf:b0:3d1:fd0b:93b2 with SMTP id
 iw15-20020a05600c54cf00b003d1fd0b93b2mr3166508wmb.65.1670857865989; Mon, 12
 Dec 2022 07:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20221202173616.180108-1-jorge.lopez2@hp.com> <b632a7f2-6f6d-9dec-a245-9f9d21268d80@redhat.com>
In-Reply-To: <b632a7f2-6f6d-9dec-a245-9f9d21268d80@redhat.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Mon, 12 Dec 2022 09:10:54 -0600
Message-ID: <CAOOmCE-9gBjgZvYPChdaQM9LRnEWXRREezbfUCcTTO3KDK4JfQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Introduction of HP-BIOSCFG driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Dec 8, 2022 at 9:58 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Jorge,
>
> On 12/2/22 18:36, Jorge Lopez wrote:
> > Version 5 restructures the patches submitted in previous versions.
> > Earlier hp-bioscfg patches were squashed together before creating
> > the new split.
> >
> > Version 5.0 breaks down the changes into 5 patches
> >
> > The driver files were broken down in 5 patches of 3 files each
> > with exception of patch 1/5
> >
> > Jorge Lopez (5):
> >   Introduction of HP-BIOSCFG driver (1)
> >   Introduction of HP-BIOSCFG driver (2)
> >   Introduction of HP-BIOSCFG driver (3)
> >   Introduction of HP-BIOSCFG driver (4)
> >   Introduction of HP-BIOSCFG driver (5)
>
> Thank you for the new version. Unfortunately I
> don't have time atm to review this.
>
> And the next 2 weeks are the merge window,
> followed by 2 weeks of christmas vacation.
>
> So I'm afraid that I likely won't get around to reviewing
> this until the week of January 9th.
>
> Regards,
>
> Hans
>

Completely understandable.  Wishing you and your loved ones a happy
and healthy Merry Christmas.  May the new year bring you lots of
health, happiness, and prosperity.

Regards,

Jorge
