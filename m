Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CA5C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Feb 2022 12:27:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358636AbiBDM1o (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Feb 2022 07:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236034AbiBDM1o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Feb 2022 07:27:44 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E394AC06173D
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Feb 2022 04:27:43 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id y6so3452537ybc.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Feb 2022 04:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=E3CkuQfRDLa6yHQhfPXnQaFzdcsQFUeKCKzEBzUj/zQ=;
        b=TLYrEShYRf1FgVk7hHjObf4x7nd8odacHjXXRpq7yKoaHl2d4cJ8VON/yE+OgjlACN
         Deh2m4l0lPgbHURrAba9Ro14SwwCHOG+0Nv/hlUJcn2mcThUbfxE1IEO+W36tUg3MKW8
         n9FacUSOrGV/A/mXTq2Us80gIm1AwkidrArvgQCcxcpwcOfU251m8g9w7lWjvl5mpD4u
         SfanAQlOPlFgouyo1XEy0iTabqHr8/mV6qhVD2e86dRrwMGK8LqcKRLW9ShW+qjxuzZP
         Qoqi5BjNrLiMA0YsO4/3q0qFyxsOyT2LoygR0q9mALUNNnZ+Tl4jGIva6c7WrbMUHXYo
         vjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=E3CkuQfRDLa6yHQhfPXnQaFzdcsQFUeKCKzEBzUj/zQ=;
        b=MB6ici7GKbxkjOZJrCLiPZg8s+NLl1QX85M88Dxq20XYAIQrejiaGyJ0rT23de8NzT
         1oZLyDYDy2bYv1m4K5ohdx4Vmxb/0dh04lN8ZM6g2ax+JUg07AEDmqWsL7kZWjqZ5kD1
         YmrDZAU3IECe9hWz1AImEhTsdbmvY9KxQcaBZDE/hDpg8wXihW5CDsjaWevUUVaXplr2
         ZNx4A1AV0PAVSzmXEAlT8hMaj4oTPQsMZOLzeOVvEG1n96pSNpoXn3s8E/8kC2F7jmNO
         mscAK+E6/vr9qMtIFn3XG9mu8bbyx6LbO0i0yPEGsbrUtjkTw5+5bHq79cwhUgebcheu
         DmFQ==
X-Gm-Message-State: AOAM531ke2fUP9Gsi3gcFRm2MPR6uK00agYDSKdwCQWJMwI6+4j3JcD/
        Y4REwaVl9faix1p9pW6bv2nu3zKqtf7/j85jD5K1zg==
X-Google-Smtp-Source: ABdhPJy0uUYEV/PGiz45GMg1qGGeLJ0gKE2zXBEUciykyjrQIx6iwM/SZFE1OhdU1ZXjgjR2rQwIB4Km1IhUiy5ChGA=
X-Received: by 2002:a81:6605:: with SMTP id a5mr2526438ywc.510.1643977662982;
 Fri, 04 Feb 2022 04:27:42 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a81:1756:0:0:0:0:0 with HTTP; Fri, 4 Feb 2022 04:27:42 -0800 (PST)
In-Reply-To: <Yfyx8s9n+CZ6TPgg@kernel.org>
References: <20220203164328.203629-1-martin.fernandez@eclypsium.com>
 <20220203164328.203629-7-martin.fernandez@eclypsium.com> <Yfyx8s9n+CZ6TPgg@kernel.org>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Fri, 4 Feb 2022 09:27:42 -0300
Message-ID: <CAKgze5YZF09F3FTwD6kODd2RrWATutcmM5J7-wcLTK32C6aptg@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] drivers/node: Show in sysfs node's crypto capabilities
To:     Mike Rapoport <rppt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com, keescook@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/4/22, Mike Rapoport <rppt@kernel.org> wrote:
> On Thu, Feb 03, 2022 at 01:43:28PM -0300, Martin Fernandez wrote:
>> +Description:
>> +		This value is 1 if all system memory in this node is
>> +		marked with EFI_MEMORY_CPU_CRYPTO, indicating that the
>
> It didn't jump at me at previous postings, but other architectures won't
> necessary have EFI_MEMORY_CPU_CRYPTO marking crypto-capable memory.
>
> How about
>
>   This value is 1 if all system memory in this node is capable of being
>   protected with the CPU's memory cryptographic capabilities. It is 0
>   otherwise.
>   On EFI architectures with value corresponds to EFI_MEMORY_CPU_CRYPTO.
>
>

Yes, sounds good to me.

Is there other architecture with something similar to this? Or are you
thinking on the possibility of such architecture?
