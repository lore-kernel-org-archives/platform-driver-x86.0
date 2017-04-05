From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 00/11] fujitsu-laptop: backlight cleanup
Date: Wed, 5 Apr 2017 21:55:34 +0200
Message-ID: <20170405195534.GB892@kmp-mobile.hq.kempniu.pl>
References: <20170405064910.3162-1-kernel@kempniu.pl>
 <20170405153600.GC27833@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:36672 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755254AbdDETzj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Apr 2017 15:55:39 -0400
Received: by mail-lf0-f44.google.com with SMTP id x137so15644947lff.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Apr 2017 12:55:38 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170405153600.GC27833@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> On Wed, Apr 05, 2017 at 08:48:59AM +0200, Michał Kępień wrote:
> > This series introduces further changes to the way LCD backlight is
> > handled by fujitsu-laptop.  These changes include fixing a bug in code
> > responsible for generating brightness-related input events, cleaning up
> > handling of module parameters, reducing code duplication, removing
> > superfluous debug messages and other fixes.
> > 
> > This series was tested on a Lifebook S7020 and a Lifebook E744.
> > 
> > This series is based on the testing branch as it requires earlier patch
> > series I submitted in order to apply cleanly.
> > 
> > Changes from v1:
> > 
> >   - Update debug message logged by set_lcd_level() to reflect code flow
> >     changes introduced by patch 04/11.
> 
> Queued to testing, thanks! 

Jonathan, I would still love to hear your opinion on this series.  Take
your time, though, I do not see any reason to rush things.  I will only
send the next series once you ack this one.

-- 
Best regards,
Michał Kępień
