Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9201C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 19:16:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B59A861184
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 19:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243054AbhKITT0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Nov 2021 14:19:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241978AbhKITTZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Nov 2021 14:19:25 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B77C061764
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Nov 2021 11:16:39 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id v7so279691ybq.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Nov 2021 11:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=a/u6NXUuwHhj9WpJ9EL/G54EBzVJ9ME1GKeLzBwPgQ0=;
        b=UVRqVf8bR6ZlJcsnO8PETruhGreG+mUjwpaUDyQ20yTzuOxSbNQU871EPagvQXW8qh
         bP0D0EBYmqVetUAj6TkCkne0+74wMeoju36oqw8iWYEriaH+L4yXIvQ0iBZi+QafikY0
         GuShaOZCV21zBxgZhN2ce0jUUhu8th8dicXI6xSdwdRR0ttufgdXye7fdA7TjPZ1JLqM
         ed4dAbCK1AauunRTSuug9/zRCiNsORa1nHkBNeWjFSsv0rMgrHHeWHyqh5WlwtKrcHBh
         6nOIQxGAoRBZmk7feixE3IskuBQzhBZLs1crqUfL48tTSc8qAnoYe6Mp9+o6sDyrvPmh
         4i6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=a/u6NXUuwHhj9WpJ9EL/G54EBzVJ9ME1GKeLzBwPgQ0=;
        b=22v4IbVhyA/CN56KFmalU/QSt2FTs6b2ruTaCRVV+W71xaMa0+SQHykHOXuBY9dfN9
         8otCxrDsvFH3YO4m6wsXY6OYm0TYrgBFTOU3gH7tX4Fo7lDepUnhvKO99lx6m4HedYOs
         BlvWo5phKn5EGFWLOptv3CIww80+2tj3w/qea8shKiDnnqAAtFlGk/Ah08+cvDgB9PfN
         1Ndcvuz66vllfuRusS7JQO7GQ0cYWwEWnKGfmx4sgBw5TGhagfIUGjRDMWPiLVp48G18
         4CMKX6FSft0MPnk3PGqBJdUqw2GZ2sc6yQ4PLORbmvka3NBNbIa+ygbKwPx/Oga+5plI
         Eu6Q==
X-Gm-Message-State: AOAM531iNm8bGVKuzy1KJFG+mJ4pykompH3E8eI8EOpzEjLDOYYvyevy
        36ebKBAuQHfyzgtGGIUwj7zsobn6Uz3M3WecyFbgLg==
X-Google-Smtp-Source: ABdhPJyv3ajPM3JBZfmb8IWCj44goNWw/1Hf/w69zJANyPI3pbOWcmFphxVccLMcRUlU7Kr1zOUoHwklnHktc0USrRo=
X-Received: by 2002:a25:1c02:: with SMTP id c2mr11481122ybc.218.1636485398866;
 Tue, 09 Nov 2021 11:16:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a81:1f09:0:0:0:0:0 with HTTP; Tue, 9 Nov 2021 11:16:38 -0800 (PST)
In-Reply-To: <81b80a5c-8730-00d0-f353-cccc848b1129@intel.com>
References: <20211105212724.2640-1-martin.fernandez@eclypsium.com>
 <20211105212724.2640-4-martin.fernandez@eclypsium.com> <37cdad39-7616-df3d-3c8d-84d26a59b62a@intel.com>
 <CAKgze5ZnLo7eXeRQ0kp-TABtegH-2n_W2LA69Nm5mhqT9s5+Dw@mail.gmail.com> <81b80a5c-8730-00d0-f353-cccc848b1129@intel.com>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Tue, 9 Nov 2021 16:16:38 -0300
Message-ID: <CAKgze5ZWu-EO+mRbHKddOoW-+3r4PLUJEfAWaGsyVmnJtvdxnw@mail.gmail.com>
Subject: Re: [PATCH 3/5] Extend e820_table to hold information about memory encryption
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alison.schofield@intel.com, alex@eclypsium.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 11/8/21, Dave Hansen <dave.hansen@intel.com> wrote:
> But, you make a good point about the alternate approach.  I don't have a
> preference either way.

I was going to do this, and remembered why I discarded this option.

There is already a function to map EFI memmap entries to the
e820_table called do_add_efi_memmap, but it is only called when you
add the kernel param "add_efi_memmap", or when the system has some
soft reserved entries in the EFI memmap. Do you know why there is such
kernel param? Why would you not want to have also the EFI memmap?
since e820 already has the mechanisms to deal with overlaps.

I first thought that it was a size issue, maybe the e820_table
couldn't hold both memmaps at the same time. But reading the comment
where the e820_table is defined makes think that's not an issue. Am I
missing something?
