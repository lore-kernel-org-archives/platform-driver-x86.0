From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Tue, 16 May 2017 09:26:14 +0930
Message-ID: <20170515235614.GC14314@marvin.atrad.com.au>
References: <20170501130536.GA25546@marvin.atrad.com.au>
 <20170502132144.GA6808@ozzy.nask.waw.pl>
 <20170504234058.GC21562@marvin.atrad.com.au>
 <20170505161556.GC4793@fury>
 <20170506123107.GA2516@kmp-mobile.hq.kempniu.pl>
 <20170506124516.GA1075@kmp-mobile.hq.kempniu.pl>
 <20170508160102.GE17700@fury>
 <20170509093524.GA19713@ozzy.nask.waw.pl>
 <20170509164734.GB17858@fury>
 <20170511134028.GA1166@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:46366 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753083AbdEPAB1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 May 2017 20:01:27 -0400
Content-Disposition: inline
In-Reply-To: <20170511134028.GA1166@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michael

Apologies for the delayed response - things have been a bit crazy lately. 
Darren's mail just now has reminded me that you were awaiting feedback.

On Thu, May 11, 2017 at 03:40:28PM +0200, Micha?? K??pie?? wrote:
> > You could accomplish this by making call_fext_func() not static and calling it
> > from fujitsu-backlight. Or, you could further restrict it by exporting a
> > fujitsu_backlight_power() function which wraps call_fext_func() providing a
> > specific interface for fujitsu-backlight. This makes the ownership very explicit
> > and ensures the usage doesn't grow without explicit changes to fujitsu-laptop.
> 
> I like the latter option more.  Exporting call_fext_func() as it is
> would mean enabling other modules to reimplement fujitsu-laptop's
> features and we do not want that.

Agreed - we don't need duplicate implementations.

> > That is probably the most practical solution IFF we still feel it is worth
> > splitting the driver into two separate modules. We need to develop a more robust
> > and objective decision making process on module granularity (when to split, when
> > to keep together). Will continue to give this more thought.
> 
> In light of the above, I still feel the split is worth going through
> with.  The question is whether Jonathan feels the same :)

I'm pretty much sitting on the fence regarding the split.  Darren has
provided a compelling argument for proceeding with the split so I guess we
can pursue that and see where it leads.  It still feels odd to me that two
different drivers will end up touching the same hardware control, but at the
end of the day the fact that this is necessary says more about the hardware
design than anything else.  There isn't really a clean solution which ticks
every box so we just need to pick one and run with it.

> Jonathan, assuming the objective of splitting the module in two, allow
> me to pick your brain a bit:
> 
>  1. Would you be okay with leaving "priv" as the variable name for
>     device-specific data in both drivers?  If they are to be separated,
>     "priv" would soon become unambiguous.  I do not have any strong
>     feelings about this, though.

With separate drivers I don't have a problem with the generic "priv" since
the ambiguity drops away due to the driver encapsulation.

>  2. Would you be okay with renaming "acpi_handle" to "handle"?  Darren
>     seems to like this idea and in light of the above we would not have
>     another ACPI handle inside struct fujitsu_bl any more.

My primary concern was the presence of two ACPI handles.  If there are two
such handles, calling one of them by a very generic term tends to make the
code confusing IMHO.  However, since the split avoids the need for either
driver to carry two ACPI handles this becomes a moot point and the plain
"handle" can be justified.  This is of course contingent on the split
happening.

>  3. You mentioned earlier that you were not really fond of the fext_*()
>     helper functions.  Would you like me to drop them and simply use
>     call_fext_func() with five arguments everywhere?  Or should I keep
>     the helper functions in v2?

The extended explanation of the rationale for these functions (provided a
few days later) makes their presence clearer.  In some ways though it still
feels like this is being done solely due to the (somewhat arbitrary)
checkpatch 80 column thing, rather than being driven by a bona fide code
structuring issue.  Having said that, the number of parameters to
call_fext_func() has grown to 5 as you said, and that is arguably an issue
in its own right.

On balance (taking your detailed explanation into consideration), since
Darren hasn't voiced any concern about these functions and they do permit a
clean up of the call sites I am happy for you to retain them in v2.

Regards
  jonathan
