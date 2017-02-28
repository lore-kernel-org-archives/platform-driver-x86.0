From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Tue, 28 Feb 2017 21:54:47 +1030
Message-ID: <20170228112447.GB31575@marvin.atrad.com.au>
References: <20170113110240.622-1-kernel@kempniu.pl>
 <20170113121758.GA9036@marvin.atrad.com.au>
 <20170113131915.GA745@ozzy.nask.waw.pl>
 <20170203140507.GB11947@ozzy.nask.waw.pl>
 <20170227071909.GA9386@ozzy.nask.waw.pl>
 <20170228061755.GA4228@fedora>
 <20170228080704.GA32366@kroah.com>
 <20170228083328.GA3277@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:56950 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751883AbdB1MKa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Feb 2017 07:10:30 -0500
Content-Disposition: inline
In-Reply-To: <20170228083328.GA3277@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 28, 2017 at 09:33:28AM +0100, Micha?? K??pie?? wrote:
> GregKH wrote:
> > On Mon, Feb 27, 2017 at 10:17:55PM -0800, Darren Hart wrote:
> > > GregKH - Can you please confirm the above? Moving an attribute is different than
> > > the format and contents, which is what I explicitly documented in
> > > Documentation/admin-guide/sysfs-rules.rst (last section).
> > 
> > Moving an attribute to a different device structure is usually a bad
> > idea, if the userspace tool counting on it to be present in a specific
> > place breaks.
> 
> Yes, I am familiar with that premise.  Here is the thing though: I am
> unaware of any userspace tool which uses these attributes.  Though,
> obviously, that does not mean such tools do not exist.

For what it's worth I too am unaware of any utilities which use the
/sys/devices/platform/fujitsu-laptop/ attributes associated with the
backlight - this after using the S7020 since 2005.  I would be surprised if
any existed since they would have to be specifically for the Fujitsu
hardware.  If writing any utility to control the backlight the logical thing
to do would be to use the standard backlight attributes in
/sys/devices/virtual/backlight/fujitsu-laptop/.

> > But, as you can't be consistent here, don't break userspace please, I'd
> > recommend just leaving it alone for now.
> 
> Darren, in the light of the above I will be awaiting your final call on
> this before posting any further patches touching this area.  My number
> one priority was to drop the broken backlight-related attributes,
> because leaving the other attributes where they currently are does not
> prevent achieving a clean split between the two drivers registered by
> fujitsu-laptop, which is the ultimate objective of all these cleanups.

As I explained in my response to GregKH earlier and having investigated this
in more detail, I have no objection to the removal of the non-standard
backlight-related sysfs attributes (brightness_changed, lcd_level and
max_brightness).  They are almost certainly unused and their removal will
allow a significant cleanup of fujitsu-laptop.  Obviously however there are
competing viewpoints which take a bigger picture view so I will defer to
Darren's judgement.

Regards
  jonathan
