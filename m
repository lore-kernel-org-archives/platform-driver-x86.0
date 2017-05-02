From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Tue, 2 May 2017 15:21:44 +0200
Message-ID: <20170502132144.GA6808@ozzy.nask.waw.pl>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <20170501130536.GA25546@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170501130536.GA25546@marvin.atrad.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> Hi Michael
> 
> On Mon, Apr 24, 2017 at 03:33:24PM +0200, Micha?? K??pie?? wrote:
> > fujitsu-laptop registers two ACPI drivers.  Whenever an ACPI device with
> > a matching identifier is found by the ACPI bus, a new instance of the
> > relevant driver is bound to that ACPI device.  However, both ACPI
> > drivers registered by fujitsu-laptop access module-wide global data
> > structures, assuming neither ACPI driver will ever be instantiated more
> > than once.  While there are currently no indications of such issues
> > happening in the wild, it is theoretically possible for multiple
> > FUJ02B1/FUJ02E3 ACPI devices to be present in the firmware, which would
> > cause two instances of the relevant driver to simultaneously access
> > module-wide globals without any locking in place.  Also, modern Fujitsu
> > laptops ship without the FUJ02B1 ACPI device present in firmware,
> > causing memory to be needlessly allocated inside fujitsu_init().
> > 
> > To future-proof the module and lay the groundwork for separating the two
> > aforementioned ACPI drivers into separate modules, move away from
> > module-wide global data structures by using device-specific data
> > instead.
> 
> Apologies for the delay in getting this first set of feedback to you.  It's
> a combination of the extent of the patch set and a very busy week.
> 
> This patch set represents another worthwhile clean up of the fujitsu-laptop
> driver.  While I sincerely doubt any laptop vendor will place more than one
> FUJ02B1 (or FUJ02E3) in a single machine, removing the dependency on global
> variables makes the driver self contained and more consistent.  I have some
> points of clarification which I will post as follow ups to the respective
> patchs.

Jonathan,

Thanks for the review.  My hidden agenda, which, in retrospect,
I probably should have included in the cover letter, follows.

In order to avoid accessing global structures from call_fext_func(), we
need to pass it an ACPI handle to FUJ02E3.  This decreases code
readability in two ways: by increasing the function's parameter count
from an already challenging four to an even worse five and by causing
line breaks to be inserted (due to the 80-column line rule) in places
they were previously not necessary in.

To counter this growing obfuscation, patches 01/10, 02/10 and 05/10 (all
called out in your review) work in tandem to ensure that all uses of
call_fext_func() remain legible _and_ fit in one line.  All three of
these patches are needed to prevent line breaks from being inserted
(granted, that is an arbitrary objective), because call_fext_func()
needs to get the ACPI handle somehow and the latter is stored in a field
of a device-specific structure.  Thus, for all call sites, these patches
shorten:

  - (01/10) name of the called function,
  - (02/10) name of the field holding the ACPI handle,
  - (05/10) name of the variable denoting device-specific data.

In other words, these patches are the only sane approach I could come up
with to ensure that, in the end, _all_ uses of call_fext_func() neatly
fit into a single line, thus ensuring reasonable readability even when
taking the added parameter (ACPI handle) into consideration.

I have pasted some examples at the end of this message of what a few
call_fext_func() call sites look like after adding the ACPI handle
parameter and fixing the code to make checkpatch happy, both with ("new
style") and without ("old style") the above three patches applied.  As
you can see, compound conditional expressions benefit the most from the
changes I suggested.

Separating fext_backlight() from the other functions of call_fext_func()
also has the added benefit of only exposing that specific function from
fujitsu-laptop to fujitsu-backlight (where fujitsu-backlight is the
backlight part of the current module), shall the module be split into
two.

And thus we come back to the question of "to split or not to split".
The three options we have are:

  - one module, two drivers: current, suboptimal, state of affairs,

  - two modules, one driver in each: the original cleanup approach I
    have been targeting in all of my patch series for fujitsu-laptop,

  - one module, one driver handling both ACPI devices: the new approach
    you suggested in your review.

I have not considered the last option until now as I deemed it
unacceptable in light of the kernel's philosophy in this regard.
However, such an approach might not be bad in and of itself, because:

  - FUJ02B1 is not fully standalone as it needs FUJ02E3 on some models,

  - FUJ02E3 is present in all models we know of, while FUJ02B1 seems to
    be phased out in newer models,

  - userspace is unlikely to care which input device each hotkey event
    comes from,

  - the memory footprint of both drivers is negligible, considering that
    both are only loaded on machines with hundreds of MB of RAM.

So we could perhaps make fujitsu-laptop register _one_ ACPI driver,
which binds to the FUJ02E3 device and only deals with backlight when the
FUJ02B1 device is present and the vendor interface is either
automatically selected by the kernel or explicitly requested by the
user.  We would then have a single device-specific structure ("priv"
would not be ambiguous any more) holding two ACPI handles ("fjex_handle"
and "fext_handle"?) and all the other fields from both struct fujitsu_bl
and struct fujitsu_laptop.  Please note that I have not played with this
idea in code yet and perhaps handling the added complexity will make the
driver more, not less, convoluted.

Darren, does the above sound more like a viable plan or rather a pipe
dream?  Answering Jonathan's question, there is no added benefit from
splitting fujitsu-laptop into two separate modules, it is only about
following the "one module, one driver" philosophy.  Any answer to this
question puts the variable naming discussion on a specific track, so
perhaps this is the first dilemma that we should sort out.

------------------------------------------------------------------------
old style:
	if ((call_fext_func(fujitsu_laptop->acpi_handle, FUNC_LEDS,
			    0x0, 0x0, 0x0) & BIT(14)) &&
	    (call_fext_func(fujitsu_laptop->acpi_handle, FUNC_LEDS,
	    		    0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
new style:
	if ((fext_leds(priv->handle, 0x0, 0x0, 0x0) & BIT(14)) &&
	    (fext_leds(priv->handle, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
------------------------------------------------------------------------
old style:
	if ((fujitsu_laptop->flags_supported & BIT(26)) &&
	    (call_fext_func(fujitsu_laptop->acpi_handle, FUNC_FLAGS,
	    	            0x1, 0x0, 0x0) & BIT(26)))
new style:
	if ((priv->flags_supported & BIT(26)) &&
	    (fext_flags(priv->handle, 0x1, 0x0, 0x0) & BIT(26)))
------------------------------------------------------------------------
old style:
	if (fujitsu_laptop->fext_handle) {
		if (b->props.power == FB_BLANK_POWERDOWN)
			call_fext_func(fujitsu_bl->fext_handle, FUNC_BACKLIGHT,
				       0x1, 0x4, 0x3);
		else
			call_fext_func(fujitsu_bl->fext_handle, FUNC_BACKLIGHT,
				       0x1, 0x4, 0x0);
	}
new style:
	if (priv->fext_handle) {
		if (b->props.power == FB_BLANK_POWERDOWN)
			fext_backlight(priv->fext_handle, 0x1, 0x4, 0x3);
		else
			fext_backlight(priv->fext_handle, 0x1, 0x4, 0x0);
	}
------------------------------------------------------------------------
old style:
	if (brightness >= LED_FULL)
		return call_fext_func(handle, FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
				      FUNC_LED_ON);
	else
		return call_fext_func(handle, FUNC_LEDS, 0x1, KEYBOARD_LAMPS,
				      FUNC_LED_OFF);
new style:
	if (brightness >= LED_FULL)
		return fext_leds(handle, 0x1, KEYBOARD_LAMPS, FUNC_LED_ON);
	else
		return fext_leds(handle, 0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
------------------------------------------------------------------------
old style:
	if (call_fext_func(handle, FUNC_LEDS, 0x2, KEYBOARD_LAMPS,
			   0x0) == FUNC_LED_ON)
		brightness = LED_FULL;
new style:
	if (fext_leds(handle, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
		brightness = LED_FULL;
------------------------------------------------------------------------
old style:
	if ((call_fext_func(fujitsu_laptop->acpi_handle, FUNC_LEDS,
			    0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
	    (call_fext_func(fujitsu_laptop->acpi_handle, FUNC_LEDS,
	    		    0x0, 0x0, 0x0) == 0x0)) {
new style:
	if ((fext_leds(priv->handle, 0x0, 0x0, 0x0) & KEYBOARD_LAMPS) &&
	    (fext_buttons(priv->handle, 0x0, 0x0, 0x0) == 0x0)) {
------------------------------------------------------------------------
old style:
	while (call_fext_func(fujitsu_laptop->acpi_handle, FUNC_BUTTONS,
			      0x1, 0x0, 0x0) != 0 &&
	       i++ < MAX_HOTKEY_RINGBUFFER_SIZE)
new style:
	while (fext_buttons(priv->handle, 0x1, 0x0, 0x0) != 0 &&
	       i++ < MAX_HOTKEY_RINGBUFFER_SIZE)
------------------------------------------------------------------------

-- 
Best regards,
Michał Kępień
