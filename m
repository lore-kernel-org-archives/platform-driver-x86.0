Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9312DC4363C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 07:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2045D20870
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 07:06:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de header.b="n+yaaTII"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgJGHGB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 03:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgJGHGB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 03:06:01 -0400
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A72C061755;
        Wed,  7 Oct 2020 00:06:01 -0700 (PDT)
Received: from zn.tnic (p200300ec2f09100038f1dcf76f93be60.dip0.t-ipconnect.de [IPv6:2003:ec:2f09:1000:38f1:dcf7:6f93:be60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id EEED61EC0179;
        Wed,  7 Oct 2020 09:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1602054360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=yZDyNP77hsct54DZTaJkrgnVKJowqZv7UpNytj1Chz4=;
        b=n+yaaTIIbkKkW4ySNQ4w+amA1sb64Az4/abVzFpthv4pgVsaY5ACP0gkAzcBO5hXHDmbKo
        janq8MXfijs/MYwqBLoCy5qecWYuib9sXB/j4ffbF3fz9WmFWMLyZleFO0sCjzG7S8kb35
        8gKgR2j8BXWEgfHXO6IOf8/7mTQipj0=
Date:   Wed, 7 Oct 2020 09:05:56 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Mike Travis <mike.travis@hpe.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
        Steve Wahl <steve.wahl@hpe.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel test robot <lkp@intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Jian Cai <caij2003@gmail.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 06/13] x86/platform/uv: Add and Decode Arch Type in
 UVsystab
Message-ID: <20201007070556.GD5607@zn.tnic>
References: <20201005203929.148656-1-mike.travis@hpe.com>
 <20201005203929.148656-7-mike.travis@hpe.com>
 <20201005212135.GL21151@zn.tnic>
 <d2c7d3d8-3863-f15f-7ec6-ae41cf8b2657@hpe.com>
 <20201006151959.GF27700@zn.tnic>
 <ee51449f-22b1-1074-19c1-b1b5a51fed64@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ee51449f-22b1-1074-19c1-b1b5a51fed64@hpe.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Oct 06, 2020 at 06:21:14PM -0700, Mike Travis wrote:
> When the UV BIOS starts the kernel it passes the UVsystab info struct to the
> kernel

Oh wow, *now* I get it. There is no "patch" being passed - your initial
commit message simply states that this is a patch to add and process...

Yeah, as already mentioned, saying that this is a patch in the same
patch's commit message is tautological and, as we just saw, really
confusing. So pls refrain from doing that. I'll use this explanation in
the commit message as it is more clear.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
