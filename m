Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38534C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 20:10:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23B7D61058
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 20:10:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhKAUNa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Nov 2021 16:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230505AbhKAUN0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Nov 2021 16:13:26 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E700C061714
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Nov 2021 13:10:52 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 131so35937387ybc.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Nov 2021 13:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ZUgxn0lmh9dNAC/c7eLSOzWzcjlgZ0KBJZDm+rIaPh4=;
        b=YmJGbHyYO8FjlHaWXdqQX2ep6ZWcZgf80vvHkiIaNcD22F5NdLLVVDCNr1fvMk2xub
         LhleTXjFhoen4O5pB9quoVWb+3A/RrmauG0733odq0WJxJxUx651forzxOnYt9WfOBY5
         Prn8FSgNUaW06qQWbL5P3YsGm+sMoq0JKuHt6nwiNyI09b/YXdmT4nMQrJjJhFREsO5Z
         lNRWifj4T/RmiFBiQOdc3oTZhwulo838MtWCikPFfA4HraMLGEzqVqixJN6kmja9W5M7
         1dKSMPjR2V1atiumdOzqsz51Ygj/M0QFrdCUfQX8xfdSPS94pAdYlJlrrxDV/t1aFlrL
         LutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ZUgxn0lmh9dNAC/c7eLSOzWzcjlgZ0KBJZDm+rIaPh4=;
        b=DL/NtmmBvkAuz+am8mtIgBJS6ydn3Qz9FtMjMsIaDy3Y33BxUJhky3Z+Vbj69pCNUG
         6WUPOikif3+mJIzIwo43/V7mtmiO/vWE6amoXqv7T7Ou7syYeuEO8K2q1peOMMfXjT0U
         SFYrJfM7pZnHIax7gyap3Ky5FT7D45mJbbVziExYgJVgoFvfnjbP4bonnPSr1xSMfyj4
         K7U3hZ8HSG27KUYuns/CVd/DDPEMJ2ZbzsScgbzGITT8uBBGiKBnfBKc0zfFqxpQ53x0
         inPrMl1n/jw1SfLU8vru8uhYjfYQf49a6xaSLOv02vw44WcShz/+HrxuvcimJ8drMfxn
         S59A==
X-Gm-Message-State: AOAM532/jCkTTdV3MXnKvHOydv10EJm4ytLPXabOTcbZC/1TFNzWWaun
        jPPIeHSDnOnYku6ru52tF3BYG78n+hi2Ntr34HUFeA==
X-Google-Smtp-Source: ABdhPJxmRcGVfjTG7RNJkd3yvtG0SUwIlVzcS87rMZlBppb9lOFjIYHC9m9jEXeCc6OPjQoMsiCvGeAPeCuJrpPHoDQ=
X-Received: by 2002:a25:2d1:: with SMTP id 200mr17630104ybc.528.1635797451467;
 Mon, 01 Nov 2021 13:10:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a81:1f09:0:0:0:0:0 with HTTP; Mon, 1 Nov 2021 13:10:50 -0700 (PDT)
In-Reply-To: <b2de42c1-e973-0f4a-635f-8e8bbaebbfa5@intel.com>
References: <20211027195511.207552-1-martin.fernandez@eclypsium.com>
 <8a8e0743-e54d-ec96-da4e-1d101b550274@intel.com> <CAKgze5Z3fT9F0S-mogfP6is9sL3=0imtCbfy6ZYrd3zgaBUqRg@mail.gmail.com>
 <YXq50yzJQqrJk13v@zn.tnic> <CAD2FfiFS++2-Sn5nCft8Eb-R41MM6abCjXyDn8bOVY-_miCpRA@mail.gmail.com>
 <YXrRN+pDr4Uv5p0t@zn.tnic> <CAKgze5av=duAc+inw6XnroT1WxHoP6pA2=Bb2tjK45yO6aDfOg@mail.gmail.com>
 <b2de42c1-e973-0f4a-635f-8e8bbaebbfa5@intel.com>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Mon, 1 Nov 2021 17:10:50 -0300
Message-ID: <CAKgze5bRTeqZ0zmbykk24TAPzj6mQ3=xMQXn5k37rNm4bFVKMw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] [RFC] x86: Export information about hardware
 memory encryption to sysfs
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Borislav Petkov <bp@alien8.de>,
        Richard Hughes <hughsient@gmail.com>,
        linux-efi@vger.kernel.org,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, ardb@kernel.org,
        dvhart@infradead.org, andy@infradead.org,
        Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org,
        Daniel Gutson <daniel.gutson@eclypsium.com>,
        alison.schofield@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 10/29/21, Dave Hansen <dave.hansen@intel.com> wrote:
> I don't think this interface makes any sense at all for something off of
> which to base firmware updates.  It's just too noisy.
>
> That said, I *do* think we are going to need something similar to what
> you propose here because folks are going to want to target memory
> allocations to NUMA nodes that have encryption capabilities.

And how do think we should approach this? Putting apart the TME part,
ie, this patch as it is (but showing the file for every node), what do
think it's the next step?
