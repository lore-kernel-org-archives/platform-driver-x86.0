From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Tue, 16 May 2017 08:40:36 +0200
Message-ID: <20170516064036.GA1075@ozzy.nask.waw.pl>
References: <20170504234058.GC21562@marvin.atrad.com.au>
 <20170505161556.GC4793@fury>
 <20170506123107.GA2516@kmp-mobile.hq.kempniu.pl>
 <20170506124516.GA1075@kmp-mobile.hq.kempniu.pl>
 <20170508160102.GE17700@fury>
 <20170509093524.GA19713@ozzy.nask.waw.pl>
 <20170509164734.GB17858@fury>
 <20170511134028.GA1166@ozzy.nask.waw.pl>
 <20170515232725.GH17235@fury>
 <20170516000605.GD14314@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38333 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751027AbdEPGkl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 May 2017 02:40:41 -0400
Received: by mail-wm0-f49.google.com with SMTP id v15so78429791wmv.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 May 2017 23:40:41 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170516000605.GD14314@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> On Mon, May 15, 2017 at 04:27:25PM -0700, Darren Hart wrote:
> > > In light of the above, I still feel the split is worth going through
> > > with.  The question is whether Jonathan feels the same :)
> > 
> > In the interest of keeping this moving... As I'm not sure there is a "right
> > answer" to split or not, and nobody screamed out against splitting, and this is
> > the direction Michal seems to prefer, and he is doing the work, let's proceed
> > with the split of -backlight and -laptop.
> 
> Apologies for not getting back about this earlier.  As mentioned in my
> follow up to Michael's post from a few minutes ago I agree with the above
> sentiment.
> 
> > > Jonathan, assuming the objective of splitting the module in two, allow
> > > me to pick your brain a bit:
> > > 
> > >  1. Would you be okay with leaving "priv" as the variable name for
> > >     device-specific data in both drivers?  If they are to be separated,
> > >     "priv" would soon become unambiguous.  I do not have any strong
> > >     feelings about this, though.
> > > 
> > >  2. Would you be okay with renaming "acpi_handle" to "handle"?  Darren
> > >     seems to like this idea and in light of the above we would not have
> > >     another ACPI handle inside struct fujitsu_bl any more.
> > 
> > Both of these are easily discussed in the next series which will most likely
> > have at least one respin anyway.
> 
> Assuming the split happens I am happy with both of these proposals.  The
> concerns raised earlier were precipitated mostly because I was unaware of
> the medium term goal of splitting the driver (not because it hadn't been
> mentioned, but because I had forgotten about it in the time since it was
> first raised earlier in the year).
> 
> > >  3. You mentioned earlier that you were not really fond of the fext_*()
> > >     helper functions.  Would you like me to drop them and simply use
> > >     call_fext_func() with five arguments everywhere?  Or should I keep
> > >     the helper functions in v2?
> > 
> > I was torn on this as well - I didn't think they added much value. Let's
> > focus on splitting the driver, and we can revisit this later for the
> > -laptop driver if there is interest.
> 
> It seems I misinterpreted Darren's stance on this one and misrepresented him
> in my previous post (sorry Darren).  Since Darren's preferred approach
> is to drop them for the moment let's run with that.  As he said, once the
> split has been made we can obviously revisit this to see if there value in
> using them in the context of the split drivers.

Jonathan, Darren, thank you for all the feedback.  Silence on my behalf
has not been coincidental as I have also been busy lately and had to put
kernel stuff on the back burner.  Sadly, I can also now confirm that I
will no longer have access to the E744 I used to test my patches on as
of next Monday.  I will do my best to prepare v2 of this series before
that.

-- 
Best regards,
Michał Kępień
