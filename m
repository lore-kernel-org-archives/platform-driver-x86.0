From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 04/10] platform/x86: fujitsu-laptop: rework backlight
 power synchronization
Date: Mon, 1 May 2017 23:02:45 +0930
Message-ID: <20170501133245.GD25546@marvin.atrad.com.au>
References: <20170424133334.7064-1-kernel@kempniu.pl>
 <20170424133334.7064-5-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:59058 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1165902AbdEANdU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 May 2017 09:33:20 -0400
Content-Disposition: inline
In-Reply-To: <20170424133334.7064-5-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 24, 2017 at 03:33:28PM +0200, Micha?? K??pie?? wrote:
> fujitsu-laptop registers two ACPI drivers: one for ACPI device FUJ02B1
> enabling backlight control and another for ACPI device FUJ02E3 which
> handles various other stuff (hotkeys, LEDs, etc.)  So far, these two
> drivers have been entangled by calls to fext_backlight() (previously
> known as call_fext_func()) in the backlight part of the module which use
> module-wide data managed by the other part of the module and accesses to
> the backlight device from within acpi_fujitsu_laptop_add().  This
> entaglement can be solved by storing an independently fetched ACPI
> handle to the FUJ02E3 device inside the data structure managed by the
> backlight part of the module.
> 
> Add a field to struct fujitsu_bl for storing a handle to the FUJ02E3
> ACPI device.  Make fext_backlight() calls use that handle instead of the
> one from struct fujitsu_laptop.  Move backlight power synchronization
> from acpi_fujitsu_laptop_add() to fujitsu_backlight_register().
> 
> This makes the bl_device field of struct fujitsu_bl redundant, so remove
> it.
> 
> Signed-off-by: Micha?? K??pie?? <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/fujitsu-laptop.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index ea3210ee83ec..5f6b34a97348 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -131,9 +131,9 @@
>  /* Device controlling the backlight and associated keys */
>  struct fujitsu_bl {
>  	acpi_handle handle;
> +	acpi_handle fext_handle;

This is the extra "handle" field I eluded to in my comment about an earlier
part of this patch series.  The end result is two "handle" fields: one whose
job is obvious (fext_handle) and one whose name in no way reflects what it
might be used for (handle).  One could of course adopt the view that any
unqualified handle is a generic acpi handle, but I like the clarification
which comes with the additional suffix.  Perhaps "acpi_handle" is too
generic and I'm certainly not opposed to the use of something more specific. 
However, IMHO leaving it as "handle" seems like an unnecessary obfuscation
without much gain.

This change reinforces the shift away from ACPI drivers linked to specific
ACPI devices, and towards a focus on the driver's functionality (backlight
and "various other stuff").  With the evolution of the hardware I think this
makes sense.  While the "other stuff" still needs a driver, the backlight
component is not always needed.  The case for separation therefore makes
sense.

As a point of discussion though, since the backlight driver needs access to
both FUJ02B1 and FUJ02E3, should we consider rolling both ACPI drivers into
one?  Aside from conceptual neatness and perhaps a small runtime memory
footprint saving in the event that no backlight control functionality need
be provided by fujitsu-laptop, is there a whole lot to be gained through the
use of two separate drivers?

Regards
  jonathan
