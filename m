From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] platform/x86: intel-vbtn: reduce unnecessary messages for normal users
Date: Fri, 28 Jul 2017 03:01:48 +0200
Message-ID: <2328303.2NTLDDWmlQ@aspire.rjw.lan>
References: <1500609408-30745-1-git-send-email-alex.hung@canonical.com> <4940915.tsQAtH0l4E@aspire.rjw.lan> <20170725011334.GA12527@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:50899 "EHLO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751562AbdG1BJv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Jul 2017 21:09:51 -0400
In-Reply-To: <20170725011334.GA12527@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Alex Hung <alex.hung@canonical.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Patrik Kullman <patrik.kullman@gmail.com>, Mario.Limonciello@dell.com

On Monday, July 24, 2017 06:14:36 PM Darren Hart wrote:
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

Well, I'm not sure if adding every reported event to keymaps as KE_IGNORE
is a good idea, because that would require somebody to figure out what the
event is about every time and that's work which quite frankly is not very
useful (the key is still ignored if it is "unknown").

This kind of is blacklisting which is always painful from the maintenance
standpoint.

> This driver also has KE_IGNORE entries in the intel_vbtn_keymap.
> 
> Are we talking about unknown keys - or are we talking about something
> else?

Unknown keys.

> If unknown keys, the additional messages will be minimal, and missing
> keys are most likely to be reported if the message is obvious. Given the
> sparse access to hardware by the developers, I prefer to have the
> message.

Having it does not guarantee that it will be reported and even so, it is
not particularly clear where to send those reports and who is going to act on
them.

> If there is more to what is going on here - can someone provide an
> example of where this is causing a problem? Or where the event causing
> the message is not something we will add code to catch / ignore?

The particular one that tirggered this is related to the switching between
the "laptop" and "tablet" modes on Dell 9365 which according to Mario is
handled already through the ISH driver.

We could potentially propagate this event to user space, but we have no
idea how user space decides to handle it and we are not sure if this is going
to be used consistently for this purpose on all platforms.

Anyway, my opinion is that dev_dbg() messages are sufficient for such things
as they allow people to selectively turn the messages on and see what happens
if something seems to be missing, but otherwise they don't generate log noise.
