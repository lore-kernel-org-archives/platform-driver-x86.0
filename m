From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 7/7] platform/x86: fujitsu-laptop: Clean up constants
Date: Sun, 11 Feb 2018 22:35:34 +0100
Message-ID: <20180211213534.GD1124@kmp-mobile.hq.kempniu.pl>
References: <20180211210727.12130-1-kernel@kempniu.pl>
 <20180211210727.12130-8-kernel@kempniu.pl>
 <628c2c03-c855-ed2a-b175-5238c561548e@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35441 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753769AbeBKVfh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Feb 2018 16:35:37 -0500
Received: by mail-lf0-f66.google.com with SMTP id a204so17947452lfa.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Feb 2018 13:35:37 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <628c2c03-c855-ed2a-b175-5238c561548e@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> Hi,
> 
> It looks like this driver needs to #include <linux/bitops.h>
> for use of BIT() macros.
> 
> See Documentation/process/submit-checklist.rst:
> 1) If you use a facility then #include the file that defines/declares
>    that facility.  Don't depend on other header files pulling in ones
>    that you use.
> 
> Some $ARCH may work without it while another one may not.

Noted, thanks!

-- 
Best regards,
Michał Kępień
