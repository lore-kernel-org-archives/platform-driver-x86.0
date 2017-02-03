From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/4][RFC v2] fujitsu-laptop: fujitsu-laptop: clean ups
 from Alan Jenkins
Date: Fri, 3 Feb 2017 14:43:26 +0100
Message-ID: <20170203134326.GA11947@ozzy.nask.waw.pl>
References: <20170131130741.GA6218@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33468 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752730AbdBCNng (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Feb 2017 08:43:36 -0500
Received: by mail-lf0-f67.google.com with SMTP id x1so1560401lff.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Feb 2017 05:43:35 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170131130741.GA6218@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

> This series of patches for the fujitsu-laptop driver was originally
> submitted by Alan Jenkins in September 2009.  For various reasons which are
> entirely my fault they were never acted upon.  To remedy this they have been
> ported to the linux-platform-drivers-x86 git tree and compile-tested. 
> Consequently this submission is a work in progress and is posted for
> comments and feedback.
> 
> The patches are against git://git.infradead.org/linux-platform-drivers-x86.git

Jonathan,

I can now see why you were so reluctant to review this series :)

It is basically unreviewable in the state you posted it in: multiple
changes are packed into a single patch, commit messages are inaccurate
at best and omissive at worst.

In order to salvage Alan's efforts, I will rebase these patches on
dvhart/testing, split them up, write a proper commit message for each of
them and then repost with Alan as the author.  This might take a while
though - to give you a rough idea, so far I split patch 1/4 into eight
separate patches (mostly churn, but still).

-- 
Best regards,
Michał Kępień
