From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Tue, 16 May 2017 09:36:05 +0930
Message-ID: <20170516000605.GD14314@marvin.atrad.com.au>
References: <20170502132144.GA6808@ozzy.nask.waw.pl>
 <20170504234058.GC21562@marvin.atrad.com.au>
 <20170505161556.GC4793@fury>
 <20170506123107.GA2516@kmp-mobile.hq.kempniu.pl>
 <20170506124516.GA1075@kmp-mobile.hq.kempniu.pl>
 <20170508160102.GE17700@fury>
 <20170509093524.GA19713@ozzy.nask.waw.pl>
 <20170509164734.GB17858@fury>
 <20170511134028.GA1166@ozzy.nask.waw.pl>
 <20170515232725.GH17235@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:46382 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753149AbdEPALB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 May 2017 20:11:01 -0400
Content-Disposition: inline
In-Reply-To: <20170515232725.GH17235@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, May 15, 2017 at 04:27:25PM -0700, Darren Hart wrote:
> > In light of the above, I still feel the split is worth going through
> > with.  The question is whether Jonathan feels the same :)
> 
> In the interest of keeping this moving... As I'm not sure there is a "right
> answer" to split or not, and nobody screamed out against splitting, and this is
> the direction Michal seems to prefer, and he is doing the work, let's proceed
> with the split of -backlight and -laptop.

Apologies for not getting back about this earlier.  As mentioned in my
follow up to Michael's post from a few minutes ago I agree with the above
sentiment.

> > Jonathan, assuming the objective of splitting the module in two, allow
> > me to pick your brain a bit:
> > 
> >  1. Would you be okay with leaving "priv" as the variable name for
> >     device-specific data in both drivers?  If they are to be separated,
> >     "priv" would soon become unambiguous.  I do not have any strong
> >     feelings about this, though.
> > 
> >  2. Would you be okay with renaming "acpi_handle" to "handle"?  Darren
> >     seems to like this idea and in light of the above we would not have
> >     another ACPI handle inside struct fujitsu_bl any more.
> 
> Both of these are easily discussed in the next series which will most likely
> have at least one respin anyway.

Assuming the split happens I am happy with both of these proposals.  The
concerns raised earlier were precipitated mostly because I was unaware of
the medium term goal of splitting the driver (not because it hadn't been
mentioned, but because I had forgotten about it in the time since it was
first raised earlier in the year).

> >  3. You mentioned earlier that you were not really fond of the fext_*()
> >     helper functions.  Would you like me to drop them and simply use
> >     call_fext_func() with five arguments everywhere?  Or should I keep
> >     the helper functions in v2?
> 
> I was torn on this as well - I didn't think they added much value. Let's
> focus on splitting the driver, and we can revisit this later for the
> -laptop driver if there is interest.

It seems I misinterpreted Darren's stance on this one and misrepresented him
in my previous post (sorry Darren).  Since Darren's preferred approach
is to drop them for the moment let's run with that.  As he said, once the
split has been made we can obviously revisit this to see if there value in
using them in the context of the split drivers.

Regards
  jonathan
