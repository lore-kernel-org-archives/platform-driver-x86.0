Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C19C678D4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 20:19:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbjCAUTK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 15:19:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjCAUTH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 15:19:07 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23BD076AE
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 12:18:39 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id by13so2802507vsb.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 12:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677701861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RzxIZUG83dsLVgIRtwwfi6jK3kgrwNT0M/wlyt0QrI=;
        b=D3CPvSTMffs9GDbu5zruk7wQxsrEGzDm2q3Q2uEy7eWP9W0RtGVT+Jj5bHxMcozlnr
         NgtvBKHpuxKlEAHJWD8tzUewIfH4BG75jr3PDUnnSh1lakW0dT4Y8jnppMF8wEtSddyP
         nawtUCNvmRZW1hBuQh7OWtfTPGKO1EMB6rW2LRvro6TF6b6QIvT7AmZ6dgyM3+p+SVyQ
         8yd6SrT4eqL/twoxItQnaKPLdGTAuhik0NqULtuuywKi+U+lUwh8ouEbKCEC9kY3nHIr
         unOQfq2xpgwL2PdQLkaDYA4OmrfUEsrEtue0wPAWI7+dWzbnBx5mmusA5/ivzOGJMGp8
         z/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677701861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RzxIZUG83dsLVgIRtwwfi6jK3kgrwNT0M/wlyt0QrI=;
        b=yNDPFvD24yOvoyTcOHoP5Y4o6otR0MaOn024GwTwqpfK3OgFcIXCsAdpndK5J7N6SB
         59ntgulebhN824DjOOacvS2wzkfyXZPIuKSQpjEvZh4+6k6/EL+laq43CJJ4NnzooYgJ
         EugWIaWZjfXV/XhwqysidqQZada3wsKhGbv89FnkownL6dI7dyHhcCMWj7HlwMDqnVku
         1uTTKyGOe/vvMUcmj0/9mULJC1/7ZCcXcIgRJ7iN7wgQuhgCHGYcAHgwfF3v3uqe+FxM
         RfbPiOS1XgrXtt3JpU79XZJTkbmj3ZBsFlfwDbwhgtGNfdrhidYJZj5TSO3jX5WL+DRf
         4hFw==
X-Gm-Message-State: AO0yUKVNI1oR1Pbo44oaTKjWg+TZs+MJ1NXbIZft2QsrqwArVudzO12G
        Zcni/RR75wt/dJTObxbfLmP4Em3FvGW8+K/fwOw=
X-Google-Smtp-Source: AK7set9rN02mvk8KzwbXEOZ3/MbJ4JJU8m2wCTyEla8ZbQUUQO7ATrb0b7EMf+iJnMZObpSDUCqOYK0mvnF4J1ttdT0=
X-Received: by 2002:a67:f814:0:b0:411:ffe1:9c6 with SMTP id
 l20-20020a67f814000000b00411ffe109c6mr5294600vso.0.1677701861532; Wed, 01 Mar
 2023 12:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20230214132522.32631-1-teackot@gmail.com> <222e94e6-2ddb-a612-31b1-4537141ef478@redhat.com>
In-Reply-To: <222e94e6-2ddb-a612-31b1-4537141ef478@redhat.com>
From:   Nikita Kravets <teackot@gmail.com>
Date:   Wed, 1 Mar 2023 23:17:30 +0300
Message-ID: <CAPXvF04_sPUtwB1Rk+XKPMigoxTfoo0RzbHvn9cozTq5vnMa_g@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Add new msi-ec driver
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

We already have changes addressing Barnab=C3=A1s' remarks merged
into the original repo, including the pr_fmt macro, so I only
need to apply them to the kernel.

> I ran checkpatch on the patch and it found several issues

Thanks, I'll address them. Some of them are already fixed
in the original repo.

> Also it seems that atm the module must always be loaded
> manually ?

> I think this should get a dmi_system_id tables with known
> MSI DMI_SYS_VENDOR() matches in there + a
> MODULE_DEVICE_TABLE() pointing to the dmi_system_id table
> to have the driver auto-load on MSI systems.

It loads automatically for me. Though would be better
to only auto-load it on MSI systems.

Regards,

Nikita
