From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Tue, 28 Feb 2017 14:24:40 +0100
Message-ID: <20170228132440.GB3277@ozzy.nask.waw.pl>
References: <20170113110240.622-1-kernel@kempniu.pl>
 <20170113121758.GA9036@marvin.atrad.com.au>
 <20170113131915.GA745@ozzy.nask.waw.pl>
 <20170203140507.GB11947@ozzy.nask.waw.pl>
 <20170227071909.GA9386@ozzy.nask.waw.pl>
 <20170228061755.GA4228@fedora>
 <20170228080704.GA32366@kroah.com>
 <20170228083328.GA3277@ozzy.nask.waw.pl>
 <20170228112447.GB31575@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34498 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752502AbdB1Nb7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Feb 2017 08:31:59 -0500
Received: by mail-lf0-f66.google.com with SMTP id a198so1016825lfb.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2017 05:31:58 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170228112447.GB31575@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> On Tue, Feb 28, 2017 at 09:33:28AM +0100, Micha?? K??pie?? wrote:
> > GregKH wrote:
> > > On Mon, Feb 27, 2017 at 10:17:55PM -0800, Darren Hart wrote:
> > > > GregKH - Can you please confirm the above? Moving an attribute is different than
> > > > the format and contents, which is what I explicitly documented in
> > > > Documentation/admin-guide/sysfs-rules.rst (last section).
> > > 
> > > Moving an attribute to a different device structure is usually a bad
> > > idea, if the userspace tool counting on it to be present in a specific
> > > place breaks.
> > 
> > Yes, I am familiar with that premise.  Here is the thing though: I am
> > unaware of any userspace tool which uses these attributes.  Though,
> > obviously, that does not mean such tools do not exist.
> 
> For what it's worth I too am unaware of any utilities which use the
> /sys/devices/platform/fujitsu-laptop/ attributes associated with the
> backlight - this after using the S7020 since 2005.  I would be surprised if
> any existed since they would have to be specifically for the Fujitsu
> hardware.  If writing any utility to control the backlight the logical thing
> to do would be to use the standard backlight attributes in
> /sys/devices/virtual/backlight/fujitsu-laptop/.
> 
> > > But, as you can't be consistent here, don't break userspace please, I'd
> > > recommend just leaving it alone for now.
> > 
> > Darren, in the light of the above I will be awaiting your final call on
> > this before posting any further patches touching this area.  My number
> > one priority was to drop the broken backlight-related attributes,
> > because leaving the other attributes where they currently are does not
> > prevent achieving a clean split between the two drivers registered by
> > fujitsu-laptop, which is the ultimate objective of all these cleanups.
> 
> As I explained in my response to GregKH earlier and having investigated this
> in more detail, I have no objection to the removal of the non-standard
> backlight-related sysfs attributes (brightness_changed, lcd_level and
> max_brightness).  They are almost certainly unused and their removal will
> allow a significant cleanup of fujitsu-laptop.  Obviously however there are
> competing viewpoints which take a bigger picture view so I will defer to
> Darren's judgement.

Okay, so it looks like I did the best I could to explain my intentions
and some confusion crept in anyway, sorry about that.  Let me try again,
I will be as concise as I can.

Current custom attributes attached to the platform device are:

    /sys/bus/platform/devices/fujitsu-laptop
    `- brightness_changed [*]
    `- dock
    `- lcd_level [*]
    `- lid
    `- max_brightness [*]
    `- radios

AFAICT, all four of us agree that attributes marked with an asterisk [*]
should be removed from the platform device because they are exposed by
the backlight device anyway and do not work correctly under certain
circumstances.

However, Darren's question to Greg did not apply to these attributes.
It was about the other three attributes: dock, lid and radios.

In other words, my proposal was to change this:

    /sys/bus/platform/devices/fujitsu-laptop
    `- dock
    `- lid
    `- radios

into this:

    /sys/bus/acpi/devices/FUJ02E3:00
    `- dock
    `- lid
    `- radios

That would enable us to completely rip the platform driver and platform
device out of fujitsu-laptop, cutting the driver down by ca. 40 lines.

Greg objected to that, arguing that there might be userspace
applications using these attributes under their current path.  I do not
know of such an application.  My question to Darren was thus: do we move
dock, lid and radios and rip the platform driver and platform device out
of fujitsu-laptop or should these attributes rather stay where they are?

Sorry that laying this all out this takes so much space, but this is
exactly why these cleanups are happening.

-- 
Best regards,
Michał Kępień
