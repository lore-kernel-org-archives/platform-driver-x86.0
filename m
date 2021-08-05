Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5547C4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Aug 2021 08:36:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A71FE6104F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Aug 2021 08:36:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhHEIgs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Aug 2021 04:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhHEIgs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Aug 2021 04:36:48 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79935C061765
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Aug 2021 01:36:33 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso7594085pjo.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Aug 2021 01:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=AebhOAEKlKIHpGR+ObeK4bl4zjW2svGp60KvxpHqvX8=;
        b=Y9DFD7aAFGLw/h1N4mSxelS1XtQpqlhpaxprranYQm6z+REDyqhOIjtxOFmRjZW26K
         7UAubqI1YvigdYp67Q755fDm4wGnAtMpCToJrN514MUX5SLwyTyI69x9Fuj8avsO8FUD
         z3Ob3qkW4yr2y/qx9H0Rx+nqi2f2xaCbRABcMbRTe4hGwpSgVvWKRVDEkU8iwQR13TxI
         +68CHr0IzhxzWk8G0exUHh/MY22kQ6y2e+QgruqJDDlr6JPaD/NaruFyQyFVoAIOB24B
         QFr2Ty+/rOJheLRls1DKq9UhxJvhsi3cM3tw6X/Ici+eIw42WFYvaObAwh09cVt9IoKx
         j2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=AebhOAEKlKIHpGR+ObeK4bl4zjW2svGp60KvxpHqvX8=;
        b=oGKm1bsQKL971Hl4bAqTapTaNB6krTdeupyiwjLozdtE9knoN2GdI8Ryl8EYKmYcS4
         59kwmRSyL5xZF/xc7Ju5YJZOBX0VkeH44KgkveZRmj4o8svuM+fDFxavpDp1OlHu/Fzo
         EZiR50i4cNthNL8w8sc/Y66vKv56L7oFQNHbBEA3mDliXU/ZXHjOGI06tStktPid+zMD
         zjBD/POG9CW+Ji8LeXurUubzQFEnAoOH/O9U5BkopPTx2iiZ51ypE7mVVZk9vC6GtpmB
         c/dBhAput5zCh2Ncp3sUzVPQmWkIjMwiSVEEj4XZhFefuIKGS2GP8Bf0+yL7xRkxM2Rj
         F7UQ==
X-Gm-Message-State: AOAM531lVDb17GVfrswbFuDh+0LoWi7rJZDOZZPsxRfTsw38qX44ZNTI
        u9r3dI94PM8AsoyXlC/sHWj5oKxydDDPZ1VrU6h8hMdjgpe5ww==
X-Google-Smtp-Source: ABdhPJwPc8XYR98KLlvU4IRGqdOLjgxdhP6c7QOnmu+OXPA9cjNG+jTcBodPWODROZaFJBHLy5YlaJlCOAzl9fwLLOo=
X-Received: by 2002:aa7:800b:0:b029:330:455f:57a8 with SMTP id
 j11-20020aa7800b0000b0290330455f57a8mr4095817pfi.7.1628152592859; Thu, 05 Aug
 2021 01:36:32 -0700 (PDT)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Aug 2021 11:35:53 +0300
Message-ID: <CAHp75Ve_vzrojizyA4J3+z480LspsK4YeS-K2Am0dYggtDUrvw@mail.gmail.com>
Subject: Mario's email is bounced
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        mario.limonciello@outlook.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Since I have noticed that Mario's [old] mail is bounced (yeah, I know
that it is my script downside by not checking each email) I was
curious about his address in the meaningful files and what we have now
is the below.

Documentation/ABI/testing/dell-smbios-wmi:4:Contact:    "Mario
Limonciello" <mario.limonciello@dell.com>
Documentation/ABI/testing/sysfs-bus-thunderbolt:235:Contact:    Mario
Limonciello <mario.limonciello@dell.com>
Documentation/ABI/testing/sysfs-class-firmware-attributes:5:
 Mario Limonciello <mario.limonciello@dell.com>,
Documentation/ABI/testing/sysfs-class-firmware-attributes:133:
 Mario Limonciello <mario.limonciello@dell.com>,
Documentation/ABI/testing/sysfs-class-firmware-attributes:223:
 Mario Limonciello <mario.limonciello@dell.com>,
Documentation/ABI/testing/sysfs-class-firmware-attributes:252:
 Mario Limonciello <mario.limonciello@dell.com>,
Documentation/ABI/testing/sysfs-platform-dell-smbios:4:Contact: "Mario
Limonciello" <mario.limonciello@dell.com>
Documentation/ABI/testing/sysfs-platform-intel-wmi-thunderbolt:4:Contact:
      "Mario Limonciello" <mario.limonciello@dell.com>
Documentation/ABI/testing/sysfs-power:298:Contact:      Mario
Limonciello <mario.limonciello@dell.com>

I think it needs to be fixed one way or another.

-- 
With Best Regards,
Andy Shevchenko
