From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 0/3] fujitsu-laptop: call_fext_func() cleanup
Date: Wed, 5 Apr 2017 21:46:19 +0200
Message-ID: <20170405194619.GA892@kmp-mobile.hq.kempniu.pl>
References: <20170405065023.3267-1-kernel@kempniu.pl>
 <20170405152902.GB27833@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36074 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754768AbdDETqX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Apr 2017 15:46:23 -0400
Received: by mail-lf0-f49.google.com with SMTP id x137so15528026lff.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Apr 2017 12:46:22 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170405152902.GB27833@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> On Wed, Apr 05, 2017 at 08:50:20AM +0200, Michał Kępień wrote:
> > This series contains a few cleanups for the call_fext_func() function.
> > Just as a reminder, please note that v1 of this series is currently
> > applied in testing.
> > 
> > Changes from v1:
> > 
> >   - Update debug message logged by call_fext_func() to reflect code flow
> >     changes introduced by patch 2/3.
> 
> My apologies Michał, I misunderstood - I was thinking you had a second change to
> the 11 patch series, so I asked for a v2.
> 
> This series is already in for-next, and we only rebase that for bugs that would
> be bad to leave in the history - like things that break bisecting.
> 
> For this change, would you please send just 1 new patch on top of for-next?
> 
> Again, I'm sorry that, my fault.

No worries.  I will send the debug message update as a separate patch on
top of for-next tomorrow.

-- 
Best regards,
Michał Kępień
