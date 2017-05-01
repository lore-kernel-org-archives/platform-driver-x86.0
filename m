From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Mon, 1 May 2017 09:05:43 -0700
Message-ID: <20170501160543.GA29387@fury>
References: <20170217184756.15181-1-rrs@debian.org>
 <1487759058.9334.7.camel@debian.org>
 <CAHp75VcGYLSsnDgb_dzD0NVCK+aR6w7jZWfR+4nN-BfnAcdRWA@mail.gmail.com>
 <1493448775.9725.5.camel@debian.org>
 <CAHp75Vds7Vc3aJWpOO8uqo-y+PzUO+PNrhsjnHxGRs4WXt935A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:41888 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753683AbdEAQFp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 May 2017 12:05:45 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75Vds7Vc3aJWpOO8uqo-y+PzUO+PNrhsjnHxGRs4WXt935A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Ritesh Raj Sarraf <rrs@debian.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Apr 30, 2017 at 03:54:43PM +0300, Andy Shevchenko wrote:
> On Sat, Apr 29, 2017 at 9:52 AM, Ritesh Raj Sarraf <rrs@debian.org> wrote:
> > Hello,
> >
> > On Fri, 2017-04-28 at 22:17 +0300, Andy Shevchenko wrote:
> >> On Wed, Feb 22, 2017 at 12:24 PM, Ritesh Raj Sarraf <rrs@debian.org> wrote:
> >>
> >> > Any further comment on this patch ? Will this be accepted ?
> >> > Please give a N/ACK.
> >>
> >> Sorry for a long delay,

Eeek, likewise. This one fell off my stack. We've improved our patch management
process since this was originally submitted, so hopefully this is more and more
rare.

> >> but I can't go with this without clear
> >> understanding that there is indeed no other ways available.
> >> From what I read in the above link
> >
> > i am assuming you are referring to the launchpad bug report here.
> 
> Correct.
> 
> >> the main issue that driver doesn't
> >> send SW_TABLET_MODE event through input device.
> >
> > Well. Yes. That is one part. If SW_TABLET_MODE is done in the driver, much
> > better. My patch was simply in line with some of the other drivers (hp-wmi and
> > thinkpad_acpi) to get it working for Lenovo Yoga series.
> 
> sysfs ABI for drivers that provide input interface is quite strong for
> my opinion. It means I'm not totally objecting, but I would accept it
> if and only if there is nothing else could be done.

Agreed, we've recently wanted to remove certain sysfs attributes from another
driver as they were obsolete and better implemented in other ways, but once they
are there, are hands are tied.

That said, we will support getting these systems functional. From what I see in
the patch you are implementing a polling sysfs interface. Have you verified that
there is no event we can capture and send the SW_TABLET_MODE along to the input
system?

Finally, I just want to point out that while it may seem capricious for us to
resist accepting a new sysfs attribute that exists in other drivers, please note
that the thinkpad driver (for example) is ancient and implements multiple
mechanisms for several things and should not be considered as a reference for
new code. hp_wmi is another story.

Andy, we may also need to consult on a set of common laptop attributes that we
will accept in general. This would ease review and also lead to some more
uniformity in the sysfs attributes of the most common features (like tablet
mode, touchpad, etc.). That said, the value are likely to be platform specific
and it could prove difficult to map all that variety to a common set of values.

-- 
Darren Hart
VMware Open Source Technology Center
