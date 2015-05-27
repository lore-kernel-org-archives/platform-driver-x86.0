From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH 3/3] Capture cable events created by Alienware GFX Amplifier.
Date: Wed, 27 May 2015 18:46:05 -0500
Message-ID: <5566573D.4000300@dell.com>
References: <1432755422-26024-1-git-send-email-mario_limonciello@dell.com> <1432755422-26024-4-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausxipps301.us.dell.com ([143.166.148.223]:37142 "EHLO
	ausxipps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751770AbbE0XqG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 May 2015 19:46:06 -0400
In-Reply-To: <1432755422-26024-4-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "matthew.garrett@nebula.com" <matthew.garrett@nebula.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>



On 05/27/2015 02:37 PM, Limonciello, Mario wrote:
> These events are outputted via the keyboard controller.
> Right now the only actionable event is to restart the system
> if the cable is removed,  but the others are documented in
> case they will be bubbled up to other parts of the kernel or
> userspace later on.
>
> Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
> ---
>   drivers/platform/x86/Kconfig         |  1 +
>   drivers/platform/x86/alienware-wmi.c | 45 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 46 insertions(+)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f9f205c..8a7bd7c 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -60,6 +60,7 @@ config ALIENWARE_WMI
>   	depends on LEDS_CLASS
>   	depends on NEW_LEDS
>   	depends on ACPI_WMI
> +	depends on SERIO_I8042
>   	---help---
>   	 This is a driver for controlling Alienware BIOS driven
>   	 features.  It exposes an interface for controlling the AlienFX
> diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
> index 5bd8faf..ffccbd9 100644
> --- a/drivers/platform/x86/alienware-wmi.c
> +++ b/drivers/platform/x86/alienware-wmi.c
> @@ -23,6 +23,8 @@
>   #include <linux/dmi.h>
>   #include <linux/acpi.h>
>   #include <linux/leds.h>
> +#include <linux/i8042.h>
> +#include <linux/reboot.h>
>   
>   #define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
>   #define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
> @@ -650,6 +652,44 @@ error_create_amplifier:
>   	return ret;
>   }
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

I had some discussion with someone in #systemd.  Just to clarify why the 
reboot is needed I wanted to mention it here.
X does continue to run and the kernel doesn't panic, but the GPU drivers 
gets stuck in a hung state.
Restarting X or plugging the cable back in doesn't actually fix it.
Since you just pulled your U/I from under yourself you don't really have 
a way to message what happened, or to fix this other than restarting the 
system.

I also later discovered that this should probably be:

     orderly_reboot();

I'll resubmit with that change after any other discussion around 
iterating with this.

> +			break;
> +		}
> +		extended = false;
> +	}
> +
> +	return false;
> +}
> +
> +
>   static int __init alienware_wmi_init(void)
>   {
>   	int ret;
> @@ -689,6 +729,9 @@ static int __init alienware_wmi_init(void)
>   		ret = create_amplifier(platform_device);
>   		if (ret)
>   			goto fail_prep_amplifier;
> +		ret = i8042_install_filter(alienware_i8042_filter);
> +		if (ret)
> +			goto fail_prep_i8042;
>   	}
>   
>   	ret = alienware_zone_init(platform_device);
> @@ -699,6 +742,7 @@ static int __init alienware_wmi_init(void)
>   
>   fail_prep_zones:
>   	alienware_zone_exit(platform_device);
> +fail_prep_i8042:
>   fail_prep_amplifier:
>   fail_prep_hdmi:
>   	platform_device_del(platform_device);
> @@ -715,6 +759,7 @@ module_init(alienware_wmi_init);
>   static void __exit alienware_wmi_exit(void)
>   {
>   	if (platform_device) {
> +		i8042_remove_filter(alienware_i8042_filter);
>   		alienware_zone_exit(platform_device);
>   		remove_hdmi(platform_device);
>   		platform_device_unregister(platform_device);
