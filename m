Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C985AC64ED6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 04:45:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjCAEpv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Feb 2023 23:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjCAEpu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Feb 2023 23:45:50 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3BA619A
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2023 20:45:46 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id q11-20020a056830440b00b00693c1a62101so6936338otv.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2023 20:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677645946;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=83kKX/u4n0pnkYXryC/2uUcPTR191o/NrhYEOzBHyVM=;
        b=G4CgMc4tmIzjFHQagh14hrFdoJo9/GnJz4bsoHhqlZrky3jENcQo8had96KI/9Bnx7
         C3Z1/FsUJEGmgApTcfuUGEbo73SuZTavzHquJtMYhE8alltlqlHgL7BPViYtr3lYhNT0
         XJuHeoxHg4qr/kymm+1tXqly3s20xjIikR2OnnqNFS2OHyySsMJGIhTL1P21LtflqrEI
         V1mm+u5GkKBJPc8nzZxM+ns4MFSZK2xSly7M6d9EG+3y90fryMfIeuS/ldeGLb85crLa
         g7lKNRkusDxdLdlVpy5MsTjHWcUQUhI1IGhvtgO4bUgmAntlPW90KLj1P99rX+X2qCNV
         qe4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677645946;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83kKX/u4n0pnkYXryC/2uUcPTR191o/NrhYEOzBHyVM=;
        b=Bsw7qnv4HjRMHYSzsxxWJWbfPsGjOYRxmc8DRgoab0QjPhh8UITRxZxsksdCVbOI7I
         3DU9fWcNvkbUk4mvAZ8/2fd/g2GpAFKEG0Jg0MLd5nRYTvGaanSloG04W70xOj5K+wR3
         YyqBEUxxZuSh7fndXCL5WIwEUYpfPcmEJxjzz6hcnX9I1aREGVATPUqfmu4uAJlw8Gal
         Kn/1apYXXAy/vCGPyhk5YxolliBHB0yWwPhzGP5ztwAGOk+ISgOlrHvEj+HdX6cJgoSQ
         nY+peqKkC3RGNyl6zg2/JzODwb4EiUJfi3qHihx598H7n2eJTxF8MbhSj86Wo8bzdGRk
         lxWg==
X-Gm-Message-State: AO0yUKWcdOr/CsoTIcRmFePOtiGQuqhEBe5+Mj9DBGdjGisn5I8eRWZ2
        vTSJfSxOdRwvqTv3NXejeZdeRBhoxZE7fqr7fuKjysXKru8=
X-Google-Smtp-Source: AK7set85x0jpPvUHLKH7D2hs8N/1cFWC3azgpp1fuZumHuqliHBrjGEHS5533RUQWNlKdMeJWZ+PNpd+T7PMwwXIVco=
X-Received: by 2002:a9d:5c82:0:b0:68d:8bb1:bfbb with SMTP id
 a2-20020a9d5c82000000b0068d8bb1bfbbmr1781013oti.2.1677645945737; Tue, 28 Feb
 2023 20:45:45 -0800 (PST)
MIME-Version: 1.0
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Tue, 28 Feb 2023 20:45:35 -0800
Message-ID: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
Subject: ideapad_laptop tablet mode toggle detection
To:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello, I'm interested in detecting tablet mode switching for my Lenovo
Yoga laptop properly in the kernel. Ultimately I'd like to provide the
SW_TABLET_MODE input event.

I have found that there are ACPI events fired when the tablet mode is
toggled (both directions send the same event). Here are the logs:

kernel: ACPI BIOS Error (bug): Could not resolve symbol
[\_SB.PC00.LPCB.EC0._Q44.WM00], AE_NOT_FOUND (20221020/psargs-330)
kernel: ACPI Error: Aborting method \_SB.PC00.LPCB.EC0._Q44 due to
previous error (AE_NOT_FOUND) (20221020/psparse-529)
root[10258]: ACPI group/action undefined: 06129D99-6083- / 000000d0

When I looked at the code I found TP_HKEY_EV_TABLET_CHANGED in the
thinkpad_acpi.c driver which seems to have exactly the behavior I'm
looking for but with a different ACPI event number. Would it be
possible to do something like this in the ideapad_laptop driver?
