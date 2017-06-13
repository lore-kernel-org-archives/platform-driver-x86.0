From: Christoph Hellwig <hch@infradead.org>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 00:05:35 -0700
Message-ID: <20170613070535.GA13252@infradead.org>
References: <20170509231639.GB11404@fury>
 <201706101236.40663@pali>
 <20170612170249.GA27850@fury>
 <201706130017.29023@pali>
 <20170613012435.GB27850@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170613012435.GB27850@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Darren,

first - can you please properly trim your replies and don't write
more than 7 characters per line?

On Mon, Jun 12, 2017 at 06:24:35PM -0700, Darren Hart wrote:
> This is a big topic for sure. Speed and scale of platform enabling is something
> I would like to see us support better. The barrier to entry to kernel
> changes is high, especially for trivial things, like adding IDs, GUIDs, etc.
> which would ideally, IMHO, be in the hands of the OEMs.

It's not.  It's a trivial patch, and you cover all Linux users.  Very
much unlike say the windows world where you are stuck with installing
a vendor specific set of drivers forever.

> Ideally, we would provide a generic way for users/OEMs/vendors to successfully
> support and maintain their own platforms, ideally with as little kernel changes
> as possible. If we can get closer to that than we are today with this WMI work,
> I think that is worth the effort.

Hell no!  The last thing we need on Linux is systems that once support
us added don't just work out of the box because you're missing your
vendor blob.

> > And filter layer which will accept only WMI calls which are safe for 
> > currently loaded/used kernel modules seems like a sane idea to ensure 
> > functionality of kernel plus allow userspace to do other things.
> 
> My biggest concern with this approach is maintenance. Because we would be doing
> something unforeseen by the specification, the various vendor implemented WMI
> APIs are not likely to be amenable to filtering. I can see these filters
> getting extremely complicated. They are "high touch", by which I mean each
> generation of platform may require subtle tweaks, which will be difficult to
> verify they don't break past generations.

Agreed.  As mentioned before I think the only sensible approach is
white listing GUIDs that have a valid userspace use case.  And use
the dynamic IDs approach to add them for debugging and reverse
engineering.

> There are certainly pros and cons. While this approach results in duplication of
> effort, it also allows vendors to "own their own destiny" and innovate and
> support their platforms independently. It also minimizes the amount of dead code
> accumulating for platforms that just don't exist for very long.

Bullshit alert..
