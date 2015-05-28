From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/3] Capture cable events created by Alienware GFX
 Amplifier.
Date: Thu, 28 May 2015 11:29:42 -0700
Message-ID: <20150528182942.GA25345@kroah.com>
References: <1432755422-26024-1-git-send-email-mario_limonciello@dell.com>
 <1432755422-26024-4-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:55016 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751963AbbE1S3t (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 May 2015 14:29:49 -0400
Content-Disposition: inline
In-Reply-To: <1432755422-26024-4-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: matthew.garrett@nebula.com, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Wed, May 27, 2015 at 02:37:02PM -0500, Mario Limonciello wrote:
> These events are outputted via the keyboard controller.
> Right now the only actionable event is to restart the system
> if the cable is removed,

What?  No, that's not an acceptable "event" at all.  You don't reboot
for something as "simple" as this.

Please do the correct thing and properly handle the hotplug event, just
like all other platforms do.

> but the others are documented in
> case they will be bubbled up to other parts of the kernel or
> userspace later on.
> 
> Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
> ---
>  drivers/platform/x86/Kconfig         |  1 +
>  drivers/platform/x86/alienware-wmi.c | 45 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f9f205c..8a7bd7c 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -60,6 +60,7 @@ config ALIENWARE_WMI
>  	depends on LEDS_CLASS
>  	depends on NEW_LEDS
>  	depends on ACPI_WMI
> +	depends on SERIO_I8042
>  	---help---
>  	 This is a driver for controlling Alienware BIOS driven
>  	 features.  It exposes an interface for controlling the AlienFX
> diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
> index 5bd8faf..ffccbd9 100644
> --- a/drivers/platform/x86/alienware-wmi.c
> +++ b/drivers/platform/x86/alienware-wmi.c
> @@ -23,6 +23,8 @@
>  #include <linux/dmi.h>
>  #include <linux/acpi.h>
>  #include <linux/leds.h>
> +#include <linux/i8042.h>
> +#include <linux/reboot.h>
>  
>  #define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
>  #define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
> @@ -650,6 +652,44 @@ error_create_amplifier:
>  	return ret;
>  }
>  
> +static bool alienware_i8042_filter(unsigned char data, unsigned char str,
> +			struct serio *port)
> +{
> +	static bool extended;
> +
> +	if (str & I8042_STR_AUXDATA)
> +		return false;
> +
> +	if (unlikely(data == 0xe0)) {
> +		extended = true;
> +		return false;
> +	} else if (unlikely(extended)) {
> +		switch (data) {
> +		/*Connect */
> +		case 0x3F:
> +			pr_debug("Received connect event\n");
> +			break;
> +		/* Disconnect by hotkey */
> +		case 0x40:
> +			pr_debug("Received disconnect hotkey event\n");
> +			break;
> +		/*disconnect by cable undock button */
> +		case 0x41:
> +			pr_debug("Received disconnect button event\n");
> +			break;
> +		/* surprise disconnect */
> +		case 0x42:
> +			pr_crit("Graphics amplifier removed, initiating reboot.\n");
> +			emergency_restart();

Ick, no, do the correct GPU change.  Other platforms can do this, why
can't you?

Especially as you have access to the hardware specs, do the correct
thing.  We have supported pci hotplug for well over a decade, why would
we want to regress to this type of "solution"?

You will note, other operating systems don't do this, why do you think
that Linux should do this?

greg k-h
