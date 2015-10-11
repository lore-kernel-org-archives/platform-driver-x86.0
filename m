From: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: thinkpad_acpi: Lenovo ThinkPad Yoga 12 side
	lock button (0x6020)
Date: Sun, 11 Oct 2015 10:04:44 -0700
Message-ID: <20151011170444.GA11425@malice.jf.intel.com>
References: <20151010215237.GB2958@malice.jf.intel.com>
	<20151011121254.GB32241@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151011121254.GB32241-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Oct 11, 2015 at 09:12:54AM -0300, Henrique de Moraes Holschuh wrote:
> On Sat, 10 Oct 2015, Darren Hart wrote:
> > The Lenovo ThinkPad Yogo 12 has a button on the side by the power and volume
> > keys with a padlock icon on it, I presume intended to be used as Screenlock.
> > 
> > It emits 0x6020 which means it falls into the hotkey_notify_6xxx() block. It
> > seems this should be handled similarly to the 0x1xxx events instead (as a
> > hotkey).
> > 
> > Is this a keymap change candidate? If so, How do I map 0x6020 to a scancode?
> 
> We'd have to extend thinkpad-acpi to have sparse keymaps.  It is not a good
> idea to intrude on the 0x1xxx range, as Lenovo can, and did, extend it at
> least once already (adaptive keyboard).
> 
> We could, as a first step, map 0x6020 to a static keycode, as the padlock
> symbol is pretty specific.

Do we have any examples of such keys currently? I poured over the driver for a
while, but didn't find one. I still need to understand which bits of the driver
are relevant to the current hardware and which are legacy support.

> 
> Extending thinkpad-acpi for sparse keymaps needs two steps:
> 
> 1. Design the keymap, it will need a "vendor range", and a "driver range".
> We should reserve 0x0000 to 0xffff as vendor range, and something higher for
> driver and future use.

Can you explain? What distinguishes the vendor range and the driver range - or
even what is the semantic difference? What makes a key a vendor key and what
makes it a driver key?

> 
> I think we could reserve bits 28-31 of the keymap "address" to select
> "bank", and have 00 = vendor, 01 = driver, and the others as reserved.
> 
> Also, thinkpad-acpi may need to issue events that are not EV_KBD.  Do we
> have a map that can do that sort of mapping?  Should we leave those out, as
> special cases?
> 

Are you referring to the thermal, dock, battery, etc. events?

> 2. Implement the keymap, and decide what we do when someone maps an event
> that is currently special-cased in thinkpad-acpi, or not something that
> should be mapped to an external event in the first place.
> 
> Reject the attempt?  Override driver behavior?  Keep driver behavior _and_
> issue the event?
> 

When you say "when someone maps an event", I presume you are referring to a
userspace initiated mapping to modify behavior at runtime, not someone sending a
patch to the driver?

I don't know what the mechanisms are like there, but yes, given the experience
you've cited with this driver, and the little bit I've observed over the last
year with things like the hw audio mixer, we want to avoid any unintentional
userpace commitments.

> E.g. allowing 0x6020 is a no-brainer: we should.  But what about 0x6030
> (thermal table changed), or the battery alarms?  I'd say they should never
> become keypresses: if anyone is doing that, they're abusing the input layer
> for sure, and this _always_ comes back to bite us later.
> 
> I've had some bad experiences with this.  People creating feedback loops
> into the driver, etc.  Some of this braindamage, introduced in userspace a
> decade ago, is still limiting or discouraging feature implementation today.

Right, those warnings are loud and clear in the driver comments (which is a good
thing) :-)

-- 
Darren Hart
Intel Open Source Technology Center

------------------------------------------------------------------------------
