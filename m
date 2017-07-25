From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: intel-vbtn: reduce unnecessary messages
 for normal users
Date: Tue, 25 Jul 2017 08:30:28 -0700
Message-ID: <20170725153028.GA19214@fury>
References: <1500609408-30745-1-git-send-email-alex.hung@canonical.com>
 <20170721231620.GB7888@fury>
 <CAHp75VfCht3djwme6HzrSNzkQ4vCYEwbB_kBM6fYL8L-KBu5Og@mail.gmail.com>
 <4940915.tsQAtH0l4E@aspire.rjw.lan>
 <20170725011334.GA12527@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:33765 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752244AbdGYPad (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2017 11:30:33 -0400
Content-Disposition: inline
In-Reply-To: <20170725011334.GA12527@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Alex Hung <alex.hung@canonical.com>, Andy Shevchenko <andy@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

+Steven Rostedt

Steve is looking into current issues with printk and expressed an interest in
this example.

On Mon, Jul 24, 2017 at 06:14:36PM -0700, Darren Hart wrote:
> On Mon, Jul 24, 2017 at 01:41:06PM +0200, Rafael Wysocki wrote:
> > On Monday, July 24, 2017 12:19:25 PM Andy Shevchenko wrote:
> > > On Sat, Jul 22, 2017 at 2:16 AM, Darren Hart <dvhart@infradead.org> wrote:
> > > > On Thu, Jul 20, 2017 at 08:56:48PM -0700, Alex Hung wrote:
> > > >> Unsupported events is only useful for developers and does not meaningful
> > > >> for users. Using dev_dbg makes more sense and reduces noise in kernel
> > > >> messages.
> > > 
> > > >> -     dev_info(&device->dev, "unknown event index 0x%x\n", event);
> > > >> +     dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
> > > >
> > > > info is the most common log level for these events in the platform
> > > > driver x86 subsystem per 'git grep -i "unknown event"'.
> > > >
> > > > My take on this is that we want these to be reported by users, rather
> > > > than rely on developers to find them all - especially as the developers
> > > > only see a fraction of the affected hardware.
> > > >
> > > > Are you finding these to be causing a problem / or producing really
> > > > excessive log messages?
> > > >
> > > > Andy, what are your thoughts?
> > > 
> > > My opinion is slightly closer to Rafael's one.
> > > 
> > > I think this is a debugging context.
> > > 
> > > If we really care about reporting them we might go HID way, i.e. using
> > > dev_printk(KERN_DEBUG ) with module parameter debug.
> > > 
> > > As developer I'm against that.
> > > As a regular user I do not need to recompile a kernel, in case there
> > > is no dynamic debug support, and it allows me to enable debug
> > > messages.
> > > 
> > > P.S. To see how important message above is, do we have any statistics
> > > how many bug reports / email we got wrt the issue and how many had
> > > been addressed?
> > 
> > Well, there is one I'm aware of, but this particular one we aren't going to
> > address at all, because apparently we handle the event in question anyway
> > in a different way.
> > 
> > In any case, the only situation in which this information is useful at all is
> > when some functionality is missing and you want to find out why.
> > 
> > Otherwise you get messages telling you that something *may* *be* missing,
> > but as a user you have no idea what to do about that, because you don't
> > even know how to report it and to whom (in case you want to report it).
> 
> My thinking was along the lines of the keymaps where we explicitly add
> KE_IGNORE when it is a key we don't care about. In that case, it is
> useful to have the messages because if that occurs we want to know so we
> can update the driver.
> 
> This driver also has KE_IGNORE entries in the intel_vbtn_keymap.
> 
> Are we talking about unknown keys - or are we talking about something
> else?
> 
> If unknown keys, the additional messages will be minimal, and missing
> keys are most likely to be reported if the message is obvious. Given the
> sparse access to hardware by the developers, I prefer to have the
> message.
> 
> If there is more to what is going on here - can someone provide an
> example of where this is causing a problem? Or where the event causing
> the message is not something we will add code to catch / ignore?
> 
> -- 
> Darren Hart
> VMware Open Source Technology Center

-- 
Darren Hart
VMware Open Source Technology Center
