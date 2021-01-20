Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D067C43331
	for <platform-driver-x86@archiver.kernel.org>; Wed, 20 Jan 2021 12:46:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B685233F6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 20 Jan 2021 12:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389214AbhATMih (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 20 Jan 2021 07:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731094AbhATL1B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Jan 2021 06:27:01 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A7AC061793
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Jan 2021 03:26:42 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id u21so25690974lja.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Jan 2021 03:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rA6bdLKAlmIoLWUk8dCMAvfvN7Iy5mLs9O7w+8do8z8=;
        b=hUIiRPlnMeeaTktx9TiA8UFdRaSKm6zh4+y0j9kDeNHP8TdZPrstvxTNIJydx3b3rk
         laCm9uscm9uZlNF+jgD9LxV234ABWDAqEJwDD3sYViomVYIACHg5ywtJBI2OOLJvja5V
         5ZQj1utqaWnS+NOXIbmT0DGsJ7HgKMLkiZlTG9xVwLg6a8dUgChg6WGgTR/sGcPf3cwf
         Clv4SaBcGsAmSQ9zVOKQY0v5ZMbPeMnTvpzmVAXJAwuEJwGmL+kmqqK7n0ySEuuvvmK6
         k7W1CfEpdhfGc8BNtERIX75nlK0Yu/vY54bSxpx7JrQntZIiDyMbNBbsve/ZKNsRxDeh
         Sx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rA6bdLKAlmIoLWUk8dCMAvfvN7Iy5mLs9O7w+8do8z8=;
        b=GFpD6kqtiyj4J3iTadGK5qyLqhv/5cAKzyt/Q41QbH3dKTYfFhBkpvd6pzwuL8ViJU
         dnrz/HL8/sr5Qg3mpeveTmdWbupPMb4mf9fd7xza0yXjnuy7GHGmlN2oqXYNAubt8Rt7
         GpD/7GMmTX+KJkvR97V2PBfUDdSZ5ijji/mfRccC60o6/d/2xju7ez/tu5WqVkATtK6x
         /S6596QUCFWMTVDHjwHOfgKOX/MhKbnKCzwjUnK51g43VPV/40WyalCJ/u8YH6DWDbgi
         5avDl3QtUI4xmRDZE4E6+sbngtJoTZ3BZGIJtQGvqTojKyhB3eEslqkwQQCjSUtsYyEE
         dcyA==
X-Gm-Message-State: AOAM531ua0/ROrdua5Whl3RpeRU8ZyKM2lxecs2kzyjyPszkamk22H06
        EtLgPYwxmVTGQuZfWA7gvU1e9Q==
X-Google-Smtp-Source: ABdhPJxhSDtqieNXSqt+r98ESGwXZDp29cFZUijUj0JQjcXu+YxvmLdbP1QZ+D1O4a2eK82VnJ/DbA==
X-Received: by 2002:a2e:b1d2:: with SMTP id e18mr4163694lja.101.1611142001496;
        Wed, 20 Jan 2021 03:26:41 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id 189sm172195lfj.192.2021.01.20.03.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 03:26:40 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
        id 4462C101448; Wed, 20 Jan 2021 14:26:43 +0300 (+03)
Date:   Wed, 20 Jan 2021 14:26:43 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Borislav Petkov <bp@alien8.de>, Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, X86 ML <x86@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        linux-efi <linux-efi@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH] x86: efi: avoid BUILD_BUG_ON() for non-constant p4d_index
Message-ID: <20210120112643.ozlsru67yuur323i@box>
References: <20210107223424.4135538-1-arnd@kernel.org>
 <YAHoB4ODvxSqNhsq@rani.riverdale.lan>
 <YAH6r3lak/F2wndp@rani.riverdale.lan>
 <CAMj1kXGZFZciN1_KruCr=g6GANNpRrCLR48b3q13+QfK481C7Q@mail.gmail.com>
 <20210118202409.GG30090@zn.tnic>
 <YAYAvBARSRSg8z8G@rani.riverdale.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YAYAvBARSRSg8z8G@rani.riverdale.lan>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jan 18, 2021 at 04:42:20PM -0500, Arvind Sankar wrote:
> AFAICT, MODULES_END is only relevant as being something that happens to
> be in the top 512GiB, and -1ul would be clearer.

I think you are right. But -1UL is not very self-descriptive. :/

-- 
 Kirill A. Shutemov
