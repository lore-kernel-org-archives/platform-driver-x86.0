Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008DFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 22:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbiCPWQq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 18:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349819AbiCPWQd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 18:16:33 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D8425C5E
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 15:15:12 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id t7so3011735qta.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=5u5ThSyoNYlvD6I9pywQGJd7RMuMxfTSSfR9mSgIRdE=;
        b=ePM5/VqLJ4+jNFxpHTWKBZJELHnew06g6Ip4/521sfpoImb4W9engiPEXXxqhGmOeX
         qtiRsBMuDhSK3NwwFfcrd1Qa2uCmHJUPr/Wbz0ZN76pf5OupQIDRRHT0tjq9w4YCCLm/
         LfqGn4eDpkqiZpQucyh04aJ+hVZReSjBb2/togmQFFrpeLmQsishPaJvYWUHpZY+iQs2
         d/Yg0K2fQTgVI2bBthhVrdbJEaPXQ7/UmKi7Cdx9ygAQOLXJyOjrw1VTEvMOaj1LkKdK
         eHi2IDmHft2M6zLx3gwEf+N7Nrtf2o4iK9KYEdMbgPuvy4GUfgwJxnZ7AKlXbRMjCdOS
         mEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=5u5ThSyoNYlvD6I9pywQGJd7RMuMxfTSSfR9mSgIRdE=;
        b=yjBYBorzL4qw3YsOAF5kX6c+yLxznLW/ua3fqd83+Nm7AWY9bcfnLyW+45Uvxl8uim
         f4AKo8sohfS5PAx2wqAM5/h9Wx4TLzpxz5LzmNMWxnPex2zID//ImUEds+ZXZYZLpNhW
         JJ8JqsYG6bsvJT6FCCCSCK2NBMUrb6rPOlq98Ge2tnNycrIR2Hr04G9oV+ygSPA33wJz
         JIi/Y1E+nCw5RjC0ogwLWugTCr56OXkJV/2DBbvOo5+Iwvw3iLvGiEk59ltAyPbBIwfY
         3qp/c0W92XMUWWGLMYOks6//o/x51VelKO/kPwmgzU7Yx0VFKkftYp8ZGkpD/oU7p1f0
         S2HQ==
X-Gm-Message-State: AOAM531MApAdfOWEWT+eaeLqrh+3Kper5oj2qwmJEvb1laXmNJOTOa/T
        Du+N7RNqB2AduEDrREVYu73kCVg0aXH2AbUu2E+JjYNS2EaTug==
X-Google-Smtp-Source: ABdhPJwcYdMx4kIqt6NcBQK7PvLKVDahh0rn5hbqDNeGr4mlmFd4R7eZ4o7mEI2wiDwiwc17LgLpPsblSChfDlQp0WQ=
X-Received: by 2002:ac8:5b51:0:b0:2e1:e3e9:d98d with SMTP id
 n17-20020ac85b51000000b002e1e3e9d98dmr1571954qtw.55.1647468911551; Wed, 16
 Mar 2022 15:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <20220316203325.2242536-1-ddadap@nvidia.com> <26e0d196-5b2d-6bdc-8cbf-19c5bb9736e4@nvidia.com>
 <CAJOTRr6J7-E_dt+zbh6S=rg62PodsQBXYUFhxJOAqbj4w=ns=w@mail.gmail.com>
In-Reply-To: <CAJOTRr6J7-E_dt+zbh6S=rg62PodsQBXYUFhxJOAqbj4w=ns=w@mail.gmail.com>
From:   Alexandru Dinu <alex.dinu07@gmail.com>
Date:   Thu, 17 Mar 2022 00:14:35 +0200
Message-ID: <CAJOTRr4SfR1oZjEPuNr-BLyvraVE9i6FEMYMf5OE4VQqmQDtEg@mail.gmail.com>
Subject: Re: [PATCH v2] nvidia-wmi-ec-backlight: Add workarounds for confused firmware
To:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> Note: the Tested-by: line above applies to the previous version of this
> patch; an explicit ACK from the tester is required for it to apply to
> the current version.

I compiled and tested v2 on 5.16.14.
Everything works as expected: brightness control & level restore work
both on first boot and on subsequent sleep/resume cycles.

Regards,
Alex
