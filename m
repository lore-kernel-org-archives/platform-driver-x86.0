From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] platform/x86: intel-vbtn: reduce unnecessary messages for normal users
Date: Mon, 24 Jul 2017 13:41:06 +0200
Message-ID: <4940915.tsQAtH0l4E@aspire.rjw.lan>
References: <1500609408-30745-1-git-send-email-alex.hung@canonical.com> <20170721231620.GB7888@fury> <CAHp75VfCht3djwme6HzrSNzkQ4vCYEwbB_kBM6fYL8L-KBu5Og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:64237 "EHLO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751895AbdGXLtD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Jul 2017 07:49:03 -0400
In-Reply-To: <CAHp75VfCht3djwme6HzrSNzkQ4vCYEwbB_kBM6fYL8L-KBu5Og@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Alex Hung <alex.hung@canonical.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Monday, July 24, 2017 12:19:25 PM Andy Shevchenko wrote:
> On Sat, Jul 22, 2017 at 2:16 AM, Darren Hart <dvhart@infradead.org> wrote:
> > On Thu, Jul 20, 2017 at 08:56:48PM -0700, Alex Hung wrote:
> >> Unsupported events is only useful for developers and does not meaningful
> >> for users. Using dev_dbg makes more sense and reduces noise in kernel
> >> messages.
> 
> >> -     dev_info(&device->dev, "unknown event index 0x%x\n", event);
> >> +     dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
> >
> > info is the most common log level for these events in the platform
> > driver x86 subsystem per 'git grep -i "unknown event"'.
> >
> > My take on this is that we want these to be reported by users, rather
> > than rely on developers to find them all - especially as the developers
> > only see a fraction of the affected hardware.
> >
> > Are you finding these to be causing a problem / or producing really
> > excessive log messages?
> >
> > Andy, what are your thoughts?
> 
> My opinion is slightly closer to Rafael's one.
> 
> I think this is a debugging context.
> 
> If we really care about reporting them we might go HID way, i.e. using
> dev_printk(KERN_DEBUG ) with module parameter debug.
> 
> As developer I'm against that.
> As a regular user I do not need to recompile a kernel, in case there
> is no dynamic debug support, and it allows me to enable debug
> messages.
> 
> P.S. To see how important message above is, do we have any statistics
> how many bug reports / email we got wrt the issue and how many had
> been addressed?

Well, there is one I'm aware of, but this particular one we aren't going to
address at all, because apparently we handle the event in question anyway
in a different way.

In any case, the only situation in which this information is useful at all is
when some functionality is missing and you want to find out why.

Otherwise you get messages telling you that something *may* *be* missing,
but as a user you have no idea what to do about that, because you don't
even know how to report it and to whom (in case you want to report it).

Thanks,
Rafael
