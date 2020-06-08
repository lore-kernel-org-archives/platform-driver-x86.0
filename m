From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH 1/3] platform/x86: dell-wmi: add new backlight events
Date: Mon, 8 Jun 2020 22:36:18 +0200
Message-ID: <20200608203618.dhpu6gsvigzdnecv@pali>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <7dbe4e9e5ed64e4704b1c4ae13ac84df644ccc13.1591584631.git.y.linux@paritcher.com>
 <20200608083503.l5g5iq52ezxkobvv@pali>
 <3e0d394545954ed79b8f883e1ac93338@AUSX13MPC105.AMER.DELL.COM>
 <e91bb21e-98fa-f469-cc24-abc9ae200e4d@paritcher.com>
 <14b9e7d3a3e842e991e4e5e271b447e7@AUSX13MPC105.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <14b9e7d3a3e842e991e4e5e271b447e7@AUSX13MPC105.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: y.linux@paritcher.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org
List-Id: platform-driver-x86.vger.kernel.org

On Monday 08 June 2020 20:14:15 Mario.Limonciello@dell.com wrote:
> > >>> index c25a4286d766..0b4f72f923cd 100644
> > >>> --- a/drivers/platform/x86/dell-wmi.c
> > >>> +++ b/drivers/platform/x86/dell-wmi.c
> > >>> @@ -252,6 +252,10 @@ static const struct key_entry
> > >> dell_wmi_keymap_type_0010[] = {
> > >>>  	/* Fn-lock switched to multimedia keys */
> > >>>  	{ KE_IGNORE, 0x1, { KEY_RESERVED } },
> > >>>
> > >>> +	/* Backlight brightness level */
> > >>> +	{ KE_KEY,    0x57, { KEY_BRIGHTNESSDOWN } },
> > >>> +	{ KE_KEY,    0x58, { KEY_BRIGHTNESSUP } },
> > >>> +
> > >
> > > For these particular events are they emitted by another interface as well
> > in this
> > > platform?
> > >
> > > If so they should be KE_IGNORE so you don't end up with double
> > notifications to
> > > userspace.
> > Thank you both for the review,
> > This is my first patch so if i am doing something wrong please let me know.
> > 
> > Both before and after this change they are only emitted once (verified via
> > showkeys)
> > this is because `dell_wmi_process_key()` calls
> > `acpi_video_handles_brightness_key_presses()`
> > for brightness events, and `acpi_video_handles_brightness_key_presses()`
> > makes sure no duplicate acpi-video events are sent.
> 
> That's good to hear that it also filters it, but my opinion is that dell-wmi.c
> should also filter it.  So just change KE_KEY to KE_IGNORE like the other events.

IIRC for other existing KEY_BRIGHTNESS* lines, KE_KEY/KE_IGNORE decision
is there just because kernel can be configured if ACPI layer would
handle them or not. And based on acpi_video_handles_brightness_key_presses()
function we know if ACPI layer processed these keys or not.

So in my opinion we should handle these new KEY_BRIGHTNESS* events in
the same way. So dell-wmi should process these events, but only in case
when ACPI layer did not processed them.
