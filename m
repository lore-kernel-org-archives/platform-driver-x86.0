From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Fri, 5 May 2017 09:15:56 -0700
Message-ID: <20170505161556.GC4793@fury>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <20170501130536.GA25546@marvin.atrad.com.au>
 <20170502132144.GA6808@ozzy.nask.waw.pl>
 <20170504234058.GC21562@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170504234058.GC21562@marvin.atrad.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Rafael Wysocki <rjw@rjwysocki.net>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, May 05, 2017 at 09:10:58AM +0930, Jonathan Woithe wrote:
> Hi Michael
> 
> On Tue, May 02, 2017 at 03:21:44PM +0200, Micha?? K??pie?? wrote:
> > In order to avoid accessing global structures from call_fext_func(), we
> > need to pass it an ACPI handle to FUJ02E3.  This decreases code
> > readability in two ways: by increasing the function's parameter count
> > from an already challenging four to an even worse five and by causing
> > line breaks to be inserted (due to the 80-column line rule) in places
> > they were previously not necessary in.
> > 
> > To counter this growing obfuscation, patches 01/10, 02/10 and 05/10 (all
> > called out in your review) work in tandem to ensure that all uses of
> > call_fext_func() remain legible _and_ fit in one line.  All three of
> > these patches are needed to prevent line breaks from being inserted
> > (granted, that is an arbitrary objective), because call_fext_func()
> > needs to get the ACPI handle somehow and the latter is stored in a field
> > of a device-specific structure. ...
> 
> Thanks for the explanation of your rationale behind patchs 1, 2 and 5.  In
> short, they are (at the lowest level) cosmetic aimed at the adherence to the
> 80-column guideline, but for the reasons you outlined this is not
> necessarily a bad thing.
> 
> > And thus we come back to the question of "to split or not to split".
> > The three options we have are:
> > 
> >   - one module, two drivers: current, suboptimal, state of affairs,
> > 
> >   - two modules, one driver in each: the original cleanup approach I
> >     have been targeting in all of my patch series for fujitsu-laptop,
> > 
> >   - one module, one driver handling both ACPI devices: the new approach
> >     you suggested in your review.
> > 
> > I have not considered the last option until now as I deemed it
> > unacceptable in light of the kernel's philosophy in this regard.
> > However, such an approach might not be bad in and of itself, because:
> > 
> >   - FUJ02B1 is not fully standalone as it needs FUJ02E3 on some models,
> 
> This to me is a fairly strong indication that migrating to the "one module
> one driver" approach is worthwhile considering.  If we do split we will end
> up with two modules interacting with FUJ02E3, at least on some hardware. 
> Conceptually it makes more sense to me that all interaction with FUJ02E3 is
> instigated from one module/driver as it will make it easier to ensure that
> minipulations of FUJ02E3 for one task don't have unintended side effects for
> others.
> 
> >   - FUJ02E3 is present in all models we know of, while FUJ02B1 seems to
> >     be phased out in newer models,
> 
> Agreed.  Furthermore, if FUJ02E3 is phased out it is reasonable to expect
> that any platform driver required by the resulting hardware would be so
> different to fujitsu-laptop that a new driver would be needed anyway.

*cough* thinkpad_acpi *cough*

> 
> >   - userspace is unlikely to care which input device each hotkey event
> >     comes from,
> 
> Agreed.
> 
> >   - the memory footprint of both drivers is negligible, considering that
> >     both are only loaded on machines with hundreds of MB of RAM.
> 
> Agreed.
> 
> > So we could perhaps make fujitsu-laptop register _one_ ACPI driver,
> > which binds to the FUJ02E3 device and only deals with backlight when the
> > FUJ02B1 device is present and the vendor interface is either
> > automatically selected by the kernel or explicitly requested by the
> > user.  We would then have a single device-specific structure ("priv"
> > would not be ambiguous any more) holding two ACPI handles ("fjex_handle"
> > and "fext_handle"?) and all the other fields from both struct fujitsu_bl
> > and struct fujitsu_laptop.
> 
> Yes, these are the kinds of benefits I was thinking about.
> 
> > Please note that I have not played with this idea in code yet and perhaps
> > handling the added complexity will make the driver more, not less,
> > convoluted.
> 
> I understand.  Since FUJ02B1 is only relevant to the backlight I can't see
> how the above approach would result in a signficant increase in complexity,
> but like you I haven't had a close look at the implications.
> 
> > Darren, does the above sound more like a viable plan or rather a pipe
> > dream?  Answering Jonathan's question, there is no added benefit from
> > splitting fujitsu-laptop into two separate modules, it is only about
> > following the "one module, one driver" philosophy.  Any answer to this
> > question puts the variable naming discussion on a specific track, so
> > perhaps this is the first dilemma that we should sort out.
> 
> I agree.  We should resolve the question of the split/no-split option first
> since the answer does influence many of the other pending questions. 
> 
> Darren: I would therefore be interested in your take on the three options
> (as summarised by Michael) so we can determine a way forward.

+Rafael for his insight from an ACPI driver model perspective.

Unfortunately, this is a fairly subjective area of driver design. We have
competing goals:

a) Driver coupling
   Module load order dependencies and such is to be avoided whenever possible.
   Drivers should be as independent as possible from one another.

b) Single function
   Can't think of a better name for this right now. But this is Michal's point
   about one driver per device. As we add more devices, we risk growing the
   driver until it carries a lot of legacy baggage and is more and more
   difficult to maintain. thinkpad_acpi is the prime example of this.

In an ideal world, Single Function drivers are preferred, but if we end up have
to perform unnatural acts to keep the drivers separated, the advantages can be
lost. So it all hinges on how much Driver Coupling would exist in the separate
driver approach.

We'll accept either with supporting evidence for why it's the better choice. My
preference, under ideal conditions, would be for separate drivers, separate
modules, one per device.

-- 
Darren Hart
VMware Open Source Technology Center
