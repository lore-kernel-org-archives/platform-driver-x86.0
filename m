Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E363DC6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Mar 2023 21:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjCVVEM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Mar 2023 17:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjCVVEL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 17:04:11 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C5A5BB7
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 14:04:10 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id bf30so8148360oib.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679519049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdF1J1ry8bTet4JHnC0vAzWcmTMq2GrHWIQRsOvU7Rs=;
        b=iB8bDvcumd08T/spgrmr9ZRtmVeNxarEm6YWKscrHPmLaG8OEw7/1fuYKOzMrb2RuG
         QN6cMfURVJW3R/Qza0ts5vQHM516j74EsdKKVQqRNNFSrP38ozsS2nBJUKo0st2OAOO1
         KrklIThAyBcU7uoutpCu5FP8xwfvb0ITpzEk5OJ107CImszY0gta5AshLfrtT+S6X4hn
         LFZAoJoOijnFasJmE9CmfSUMr/aQblphWLxxoTHamjQP8dLjWkWLXhmYhyltK1Yu81QU
         goqDcPcLOAW+s85y1ilxotngI7/inWyGPPgRoa4Qbh8Q8ksKGwcapNovDPFygKtMY4Q/
         mEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679519049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdF1J1ry8bTet4JHnC0vAzWcmTMq2GrHWIQRsOvU7Rs=;
        b=DmwmxDER+5qaHFb5vH4K46gEBT8ze8YuM5ZB8UDnRUC+o9kiqvPlA0U+Ykv2SrQUhc
         Eih5tvLadts8aXsOfhBCOtzq9iMtwWX1/MW/4ZR+4xFLTiDDmZI6D2Y+8RmuH03ffo3M
         QH2iX+kVnA3SFrzMYeQZtiXEBJULPkZbjrZV0k4N61dxX5oh8mqU3Whx9NI4mfg8xyjO
         jSQGMxv3jQfgcDXgSYLpAHd9ZZ/FFHmDGbd5Be5k4rWTDRATm6j1WzZSB58c1YXaHxNn
         rRi+d6D9PYDKHmZLy35bipAmkdWJ4eJmvai8qGX3+Z6LKiActBpFKq7ptuZOtbW4sKzD
         +Diw==
X-Gm-Message-State: AO0yUKXxT6mvz9Jp9u/CpqQMqNyZVL7j37PiLRvNxXUR4UIS+IH950SB
        hQlM2mOh3GkBBfSgQD1nDkJU6BrjhyluZbSCeT0=
X-Google-Smtp-Source: AK7set83WHmSemW8aFngdg+46Wq+1qBTuybbh9hvuMq71GMHCq/pFShlfMew+5b8+nIq6HhJjhF1HeZ6LHj4UzT6ot0=
X-Received: by 2002:a05:6808:308a:b0:384:1c31:d132 with SMTP id
 bl10-20020a056808308a00b003841c31d132mr1474917oib.6.1679519049539; Wed, 22
 Mar 2023 14:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221004214332.35934-1-soyer@irl.hu> <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com> <85e87867-5001-da05-dd7c-020977c75288@irl.hu>
 <CAG4kvq8=nHL49_U6=fc0eNPptzX-deXvg=XnmgKC1cAMHP3iMQ@mail.gmail.com> <ba4e7835-9c13-89dc-cd3f-80ca90024639@irl.hu>
In-Reply-To: <ba4e7835-9c13-89dc-cd3f-80ca90024639@irl.hu>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Wed, 22 Mar 2023 14:03:58 -0700
Message-ID: <CAG4kvq_RokL99_X1fwTKM2w6otF1rjBzvp6PTUGn=q0ZmopXuA@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
To:     Gergo Koteles <soyer@irl.hu>
Cc:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Mar 22, 2023 at 1:39=E2=80=AFPM Gergo Koteles <soyer@irl.hu> wrote:
>
> According to Hans, it's unrealistic that Lenovo will change this
> triggering behavior, so it can remain.

In that case I will leave you as the module and commit author but add
your signed-off, unless you'd still prefer not to be the module
author. You wrote most of this code, I only did a few code review
changes :)
