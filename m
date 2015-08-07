From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] [v2] surface pro 3: Add support driver for Surface Pro
 3 buttons
Date: Fri, 07 Aug 2015 01:27:58 -0700
Message-ID: <1438936078.2322.29.camel@perches.com>
References: <1438934272-17959-1-git-send-email-yu.c.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay0160.hostedemail.com ([216.40.44.160]:35978 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750889AbbHGI2C (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Aug 2015 04:28:02 -0400
In-Reply-To: <1438934272-17959-1-git-send-email-yu.c.chen@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chen Yu <yu.c.chen@intel.com>
Cc: dvhart@infradead.org, akpm@linux-foundation.org, arnd@arndb.de, mchehab@osg.samsung.com, gregkh@linuxfoundation.org, jslaby@suse.com, rui.zhang@intel.com, rafael.j.wysocki@intel.com, mika.westerberg@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Fri, 2015-08-07 at 15:57 +0800, Chen Yu wrote:
> Since Surface Pro 3 does not follow the specs of "Windows ACPI Design
> Guide for SoC Platform", code in drivers/input/misc/soc_array.c can
> not detect these buttons on it.

The comments below are all just style trivia
and can be ignored entirely.

> diff --git a/drivers/platform/x86/surfacepro3_button.c b/drivers/platform/x86/surfacepro3_button.c
[]
> +#define handle_surface_button_notify(type, code)		\
> +({								\
> +	int ret = 0;						\
> +	if (SURFACE_BUTTON_NOTIFY_PRESS_##type == event)	\
> +		pressed = true;					\
> +	if (pressed ||						\
> +		 (SURFACE_BUTTON_NOTIFY_RELEASE_##type == event)) {	\
> +		key_code = code;				\
> +		ret = 1;					\
> +	} else							\
> +		ret = 0;					\
> +	ret;							\
> +})

This seems a bit complicated.

The else ret = 0 isn't necessary as it's initialized to 0.
bool might be better than int.

> +static void surface_button_notify(struct acpi_device *device, u32 event)
> +{
> +	struct surface_button *button = acpi_driver_data(device);
> +	struct input_dev *input;
> +	int key_code = KEY_RESERVED;
> +	bool pressed = false;
> +
> +	if (!handle_surface_button_notify(POWER, KEY_POWER) &&
> +		!handle_surface_button_notify(HOME, KEY_LEFTMETA) &&
> +		!handle_surface_button_notify(VOLUME_UP, KEY_VOLUMEUP) &&
> +		!handle_surface_button_notify(VOLUME_DOWN, KEY_VOLUMEDOWN))
> +		dev_info_ratelimited(&device->dev,
> +			"Unsupported event [0x%x]\n", event);

Some might prefer alignment to the open parenthesis:

	if (!handle_surface_button_notify(POWER, KEY_POWER) &&
	    !handle_surface_button_notify(HOME, KEY_LEFTMETA) &&
	    !handle_surface_button_notify(VOLUME_UP, KEY_VOLUMEUP) &&
	    !handle_surface_button_notify(VOLUME_DOWN, KEY_VOLUMEDOWN))

I think the older switch/case was easier to understand.
