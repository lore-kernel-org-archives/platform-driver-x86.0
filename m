From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Tue, 19 Sep 2017 06:42:24 +0200
Message-ID: <20170919044224.GA10213@kmp-mobile.hq.kempniu.pl>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170919040648.GA8426@kmp-mobile.hq.kempniu.pl>
 <20170919042150.GD10399@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:45317 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750876AbdISEm2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2017 00:42:28 -0400
Received: by mail-lf0-f47.google.com with SMTP id d17so2483384lfe.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2017 21:42:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170919042150.GD10399@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

> > I need to refresh my memory a bit and think about next steps.  I still
> > have one more cleanup series queued that is worth posting and I also
> > need to fix radio LED detection.  My spare time is still very limited,
> > but I will do my best to post something soon.
> 
> In the meantime, I think we ought to consider pushing the proposed patch in
> order to restore functionality for the S6120 - as it stands the code oopses,
> which isn't great.  Is there any reason not to do so?

It might only be worth considering to check whether device is NULL
inside call_fext_func() in order to prevent any further issues like this
in the future.  However, for now bl_update_status() is the only place in
fujitsu-laptop using the fext module-wide variable, so the patch is okay
as it is, too.

-- 
Best regards,
Michał Kępień
