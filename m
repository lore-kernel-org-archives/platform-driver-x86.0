Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803A9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Feb 2022 01:12:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbiBWBMm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Feb 2022 20:12:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbiBWBMl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Feb 2022 20:12:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385762A9
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 17:12:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E7B38B81CBB
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 01:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CE1C340F0
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 01:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645578732;
        bh=6fexqyACM5F/s8azFAHrNIHVzsjCP1dUHzmIo8Wi2Q0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mY/OGm8GV9S/I1ilomGufeTyTUvPpftZUTOJXQ+MSkDi6x9vBvq5ef5lmwWwgwtqI
         oi1QucHC4kl5JMNgWvJEWKmm+3rsL6TmBTP9QSOoJ+hpR/tAClbfTSgB7LiiOEbgkU
         AiDgDpQD9nj4HNZMsh7WskCIbgU6g0W6CSsSagZPAyUxU4i6ZjwkBqreM2KcFyMxCp
         E7kYMhTvkCY1jKnmot5jpGqH7lSlFK3e+zwujDJmUEAJ6/SBgMEXWlevUfIlioOFCh
         p6oAGs82dstB/8ZTnOOHD3sbQ3yzXivPX3hjNX6JBpjx1lbawdwaAUzjgiwa8vax8N
         lFG3m+VpblH8A==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2d07ae0b1c0so194472257b3.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 17:12:12 -0800 (PST)
X-Gm-Message-State: AOAM531aoeZN7+cIyjHbstNDGo77nUHTi2fI3QOgYbX1XouPEQQRvmUs
        mzwGY9+tfJC4tGxbwgjOsQVUxCzNmaiEPWI7axI=
X-Google-Smtp-Source: ABdhPJyqmJ9XpuOd+M+xHWw3/Aa/qHlNpVJpWGfzF/Uwa9VALy7ZEQQ+ypHsNoUm0Jw7n0CLFENrcF5WZ9fsMWd5xKk=
X-Received: by 2002:a81:9895:0:b0:2d7:7e75:9ba8 with SMTP id
 p143-20020a819895000000b002d77e759ba8mr8476577ywg.130.1645578731698; Tue, 22
 Feb 2022 17:12:11 -0800 (PST)
MIME-Version: 1.0
References: <20220222050501.18789-1-nchatrad@amd.com>
In-Reply-To: <20220222050501.18789-1-nchatrad@amd.com>
From:   Song Liu <song@kernel.org>
Date:   Tue, 22 Feb 2022 17:12:00 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5yUXMY5DqhsDJP8i9RW5BPD9We3GQWyNDR_m90vnqfYg@mail.gmail.com>
Message-ID: <CAPhsuW5yUXMY5DqhsDJP8i9RW5BPD9We3GQWyNDR_m90vnqfYg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] platforms/x86: Add AMD system management interface
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Carlos Bilbao <carlos.bilbao@amd.com>, siva.sathappan@amd.com,
        nathan.fontenot@amd.com, Suma Hegde <suma.hegde@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Feb 21, 2022 at 9:05 PM Naveen Krishna Chatradhi
<nchatrad@amd.com> wrote:
>
> From: Suma Hegde <suma.hegde@amd.com>
>
> Recent Fam19h EPYC server line of processors from AMD support system
> management functionality via HSMP (Host System Management Port) interface.
>
> The Host System Management Port (HSMP) is an interface to provide
> OS-level software with access to system management functions via a
> set of mailbox registers.
>
> More details on the interface can be found in chapter
> "7 Host System Management Port (HSMP)" of the following PPR
> https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
>
> This patch adds new amd_hsmp module under the drivers/platforms/x86/
> which creates miscdevice with an IOCTL interface to the user space.
> /dev/hsmp is for running the hsmp mailbox commands.
>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
> Acked-by: Song Liu <song@kernel.org>
> Reviewed-by: Nathan Fontenot <nathan.fontenot@amd.com>

What would be the next step for this set? We are hoping to back port it
to our kernel to unblock some tests. Ideally, we would like to do the
back port after it is applied to pdx86 tree.

Thanks,
Song
