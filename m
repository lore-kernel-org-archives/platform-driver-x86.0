From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 14:07:41 +0200
Message-ID: <20170613120741.GG5248@pali>
References: <20170509231639.GB11404@fury>
 <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
 <20170613070535.GA13252@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:35644 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752249AbdFMMHp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2017 08:07:45 -0400
Content-Disposition: inline
In-Reply-To: <20170613070535.GA13252@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Tuesday 13 June 2017 00:05:35 Christoph Hellwig wrote:
> On Mon, Jun 12, 2017 at 06:24:35PM -0700, Darren Hart wrote:
> > This is a big topic for sure. Speed and scale of platform enabling is something
> > I would like to see us support better. The barrier to entry to kernel
> > changes is high, especially for trivial things, like adding IDs, GUIDs, etc.
> > which would ideally, IMHO, be in the hands of the OEMs.
> 
> It's not.  It's a trivial patch, and you cover all Linux users.  Very
> much unlike say the windows world where you are stuck with installing
> a vendor specific set of drivers forever.

Yes, adding new GUID is same hard as adding new PCI ID or USB ID. It is
really trivial patch.

> > Ideally, we would provide a generic way for users/OEMs/vendors to successfully
> > support and maintain their own platforms, ideally with as little kernel changes
> > as possible. If we can get closer to that than we are today with this WMI work,
> > I think that is worth the effort.
> 
> Hell no!  The last thing we need on Linux is systems that once support
> us added don't just work out of the box because you're missing your
> vendor blob.

Seeing vendor blob compiled for one particular userspace and
distribution which would be needed for having working notebook support
on Linux is way to the hell.

Here I agree with Christoph.

> > > And filter layer which will accept only WMI calls which are safe for 
> > > currently loaded/used kernel modules seems like a sane idea to ensure 
> > > functionality of kernel plus allow userspace to do other things.
> > 
> > My biggest concern with this approach is maintenance. Because we would be doing
> > something unforeseen by the specification, the various vendor implemented WMI
> > APIs are not likely to be amenable to filtering. I can see these filters
> > getting extremely complicated. They are "high touch", by which I mean each
> > generation of platform may require subtle tweaks, which will be difficult to
> > verify they don't break past generations.
> 
> Agreed.  As mentioned before I think the only sensible approach is
> white listing GUIDs that have a valid userspace use case.  And use
> the dynamic IDs approach to add them for debugging and reverse
> engineering.

In some cases filter function can be simple in some cases hard. I can
image that usage of while listing, plus in some cases also filtering
(when it would be relatively easy to implement).

-- 
Pali Rohár
pali.rohar@gmail.com
