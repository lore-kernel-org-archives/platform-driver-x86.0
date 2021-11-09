Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF309C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 08:56:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A97D6611C1
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Nov 2021 08:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240632AbhKII7D (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Nov 2021 03:59:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239743AbhKII7C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Nov 2021 03:59:02 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB99C061766
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Nov 2021 00:56:16 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id r8so31560434wra.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Nov 2021 00:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immu-ne.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8hDxc4ORTBbluxxeIIeFMi6TZfMeVfC09o6eJqDhW6Y=;
        b=0KV7+HspyaS3g9zMUH7QkJFoaINFWkKQEXKTAmysFQs4K/Q7hiwfgIRcWRlI3w6Bik
         JaWassP3CHaxn5gcid1HAzTxWzMRo0QZ4+O392zq13ZkI6+GJLlMKmY421Qp98XUBUBy
         75a6Fi0jjlsrSgjvx1dt4H1S+OKBWnnzd4RbYrqVJxKLjXOwpmpa2bWzupDjAnBhXZOX
         tG16LdsSuHC9KfnXTLhbD97YPW0yFzxBsHUGbykaRryttMp6JPnYyt/6xLzEQIe2k8YN
         rC9bg+SGFCRj3xUZR6SEFlNYaQViv68c/HUPQtLcIo0JZQ/xQE9UBWsz6jPKoNIBehbm
         //jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8hDxc4ORTBbluxxeIIeFMi6TZfMeVfC09o6eJqDhW6Y=;
        b=3z01ii2pBsJ3Onhkr9oayDO399AiXWmsiTbQhiYr/hPLlRIvLukOOxJr66fESBReYg
         4hElhqW8s6uCHIYqJFiHfrAqCAdT4ouFElo7S5ycGTOC7XztJfaHBWJsVnqjuCiL7Ohv
         J+HiAFIxKSonZbi4vcfqLNvv2owA0oyt2H6+cTKkitWdgRY38Cp016nJ9Ak0rUjaqgHG
         TN5W8acs9i9qBzg7fbVoRgVXbptBLVySd2TvQLvlCNBhdQkGX3ZI/nudbiG4GYKB2TjM
         jgHXEBXw7uW1VuJSnTjzodW0ybaWj7NNo5Pdz4Oat/SDfGn63xt5MNrb98mMXGCGJPrb
         5QVA==
X-Gm-Message-State: AOAM533Cx1R0onj/U52EH0eA91hXwJNcjuA8O57bymSpVQFOKJrMfSfU
        uT8SHQopSAZ97RV3Q6/W/gIijd2+5mICjqTEM+h8C1Se7HXWblPE
X-Google-Smtp-Source: ABdhPJxjQyapcmQOZoeGUdSh2ePTETHsHN9v6j2of8gpdEiuV82Z+REWYGnGHSZ8XIcfUkLElR/+U/Hs0YR3DIMNzAQ=
X-Received: by 2002:adf:eece:: with SMTP id a14mr7232192wrp.333.1636448175103;
 Tue, 09 Nov 2021 00:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20211109000130.42361-1-hans-gert.dahmen@immu.ne>
 <YYoSPjF3M05dR0PX@kroah.com> <42cea157-55a2-bd12-335b-6348f0ff6525@immu.ne>
In-Reply-To: <42cea157-55a2-bd12-335b-6348f0ff6525@immu.ne>
From:   Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>
Date:   Tue, 9 Nov 2021 09:56:03 +0100
Message-ID: <CAHifhD70EEqmwJtZ1dc8=Nd0bknmN9FeYk+z5+ZRJ0gOUMooag@mail.gmail.com>
Subject: Re: [PATCH] firmware: export x86_64 platform flash bios region via sysfs
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        Philipp Deppenwiese <philipp.deppenwiese@immu.ne>,
        Mauro Lima <mauro.lima@eclypsium.com>,
        Richard Hughes <hughsient@gmail.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I am really sorry I forgot the link for [1] in my last mail.

[1] https://lkml.org/lkml/2021/6/23/433
