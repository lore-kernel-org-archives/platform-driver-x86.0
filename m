From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Tue, 28 Feb 2017 19:19:32 -0800
Message-ID: <20170301031932.GA7282@fedora>
References: <20170113121758.GA9036@marvin.atrad.com.au>
 <20170113131915.GA745@ozzy.nask.waw.pl>
 <20170203140507.GB11947@ozzy.nask.waw.pl>
 <20170227071909.GA9386@ozzy.nask.waw.pl>
 <20170228061755.GA4228@fedora>
 <20170228080704.GA32366@kroah.com>
 <20170228083328.GA3277@ozzy.nask.waw.pl>
 <20170228112447.GB31575@marvin.atrad.com.au>
 <20170228132440.GB3277@ozzy.nask.waw.pl>
 <20170228140152.GA7073@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170228140152.GA7073@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 28, 2017 at 03:01:52PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Feb 28, 2017 at 02:24:40PM +0100, Michał Kępień wrote:
> > > On Tue, Feb 28, 2017 at 09:33:28AM +0100, Micha?? K??pie?? wrote:
> > > > GregKH wrote:
> > > > > On Mon, Feb 27, 2017 at 10:17:55PM -0800, Darren Hart wrote:
> > > > > > GregKH - Can you please confirm the above? Moving an attribute is different than
> > > > > > the format and contents, which is what I explicitly documented in
> > > > > > Documentation/admin-guide/sysfs-rules.rst (last section).
> > > > > 
> > > > > Moving an attribute to a different device structure is usually a bad
> > > > > idea, if the userspace tool counting on it to be present in a specific
> > > > > place breaks.
> > > > 
> > > > Yes, I am familiar with that premise.  Here is the thing though: I am
> > > > unaware of any userspace tool which uses these attributes.  Though,
> > > > obviously, that does not mean such tools do not exist.
> > > 
> > > For what it's worth I too am unaware of any utilities which use the
> > > /sys/devices/platform/fujitsu-laptop/ attributes associated with the
> > > backlight - this after using the S7020 since 2005.  I would be surprised if
> > > any existed since they would have to be specifically for the Fujitsu
> > > hardware.  If writing any utility to control the backlight the logical thing
> > > to do would be to use the standard backlight attributes in
> > > /sys/devices/virtual/backlight/fujitsu-laptop/.
> > > 
> > > > > But, as you can't be consistent here, don't break userspace please, I'd
> > > > > recommend just leaving it alone for now.
> > > > 
> > > > Darren, in the light of the above I will be awaiting your final call on
> > > > this before posting any further patches touching this area.  My number
> > > > one priority was to drop the broken backlight-related attributes,
> > > > because leaving the other attributes where they currently are does not
> > > > prevent achieving a clean split between the two drivers registered by
> > > > fujitsu-laptop, which is the ultimate objective of all these cleanups.
> > > 
> > > As I explained in my response to GregKH earlier and having investigated this
> > > in more detail, I have no objection to the removal of the non-standard
> > > backlight-related sysfs attributes (brightness_changed, lcd_level and
> > > max_brightness).  They are almost certainly unused and their removal will
> > > allow a significant cleanup of fujitsu-laptop.  Obviously however there are
> > > competing viewpoints which take a bigger picture view so I will defer to
> > > Darren's judgement.
> > 
> > Okay, so it looks like I did the best I could to explain my intentions
> > and some confusion crept in anyway, sorry about that.  Let me try again,
> > I will be as concise as I can.
> > 
> > Current custom attributes attached to the platform device are:
> > 
> >     /sys/bus/platform/devices/fujitsu-laptop
> >     `- brightness_changed [*]
> >     `- dock
> >     `- lcd_level [*]
> >     `- lid
> >     `- max_brightness [*]
> >     `- radios
> > 
> > AFAICT, all four of us agree that attributes marked with an asterisk [*]
> > should be removed from the platform device because they are exposed by
> > the backlight device anyway and do not work correctly under certain
> > circumstances.

Yes, please kill these.

> > 
> > However, Darren's question to Greg did not apply to these attributes.
> > It was about the other three attributes: dock, lid and radios.
> > 
> > In other words, my proposal was to change this:
> > 
> >     /sys/bus/platform/devices/fujitsu-laptop
> >     `- dock
> >     `- lid
> >     `- radios
> > 
> > into this:
> > 
> >     /sys/bus/acpi/devices/FUJ02E3:00
> >     `- dock
> >     `- lid
> >     `- radios
> > 
> > That would enable us to completely rip the platform driver and platform
> > device out of fujitsu-laptop, cutting the driver down by ca. 40 lines.
> > 
> > Greg objected to that, arguing that there might be userspace
> > applications using these attributes under their current path.  I do not
> > know of such an application.  My question to Darren was thus: do we move
> > dock, lid and radios and rip the platform driver and platform device out
> > of fujitsu-laptop or should these attributes rather stay where they are?
> 
> I would say just to leave them as-is, there's no harm in those 40 lines,
> and you really don't want to break someone's existing setup for no good
> reason.

In a clean room I'd definitely opt for the move to eliminate the extra
infrastructure of the platform driver - and binding to a HID is a superior
enumeration mechanism.

However, changing this interface doesn't fix any bugs and it breaks a user space
interface. Greg made it clear this commitment is stronger than I had positioned
it for sysfs attributes. Please leave the platform driver code for dock, lid,
and radios in place.

Thank you everyone for the time to clarify.

-- 
Darren Hart
Intel Open Source Technology Center
