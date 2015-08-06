From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] surface pro 3: Add support driver for Surface Pro 3
 buttons
Date: Wed, 05 Aug 2015 22:30:22 -0700
Message-ID: <1438839022.2679.49.camel@perches.com>
References: <1438838165-3791-1-git-send-email-yu.c.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438838165-3791-1-git-send-email-yu.c.chen@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen Yu <yu.c.chen@intel.com>
Cc: dvhart@infradead.org, akpm@linux-foundation.org, arnd@arndb.de, mchehab@osg.samsung.com, gregkh@linuxfoundation.org, jslaby@suse.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, rui.zhang@intel.com, rafael.j.wysocki@intel.com, mika.westerberg@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2015-08-06 at 13:16 +0800, Chen Yu wrote:
> Since Surface Pro 3 does not follow the specs of "Windows ACPI Design
> Guide for SoC Platform", code in drivers/input/misc/soc_array.c can
> not detect these buttons on it.

style trivia:

> diff --git a/drivers/platform/x86/surfacepro3_button.c b/drivers/platform/x86/surfacepro3_button.c
[]
> +static void surface_button_notify(struct acpi_device *device, u32 event)
> +{
[]
> +	switch (event) {
> +	case SURFACE_BUTTON_NOTIFY_PRESS_POWER:
> +		pressed = true;
> +		/*go through*/

/* fall through */ is more common

> +	case SURFACE_BUTTON_NOTIFY_PRESS_HOME:
> +		pressed = true;
> +	case SURFACE_BUTTON_NOTIFY_RELEASE_HOME:
> +		key_code = KEY_LEFTMETA;
> +		break;

It may be better to add a comment about the style or
maybe add a macro like

#define HANDLE_SURFACE_BUTTON_NOTIFY(type, code)	\
	case SURFACE_BUTTON_NOTIFY_PRESS_##type:	\
		pressed = true;	/* and fall-through */	\
	case SURFACE_BUTTON_NOTIFY_RELEASE_##type:	\
		key_code = code;			\
		break;

> +	case SURFACE_BUTTON_NOTIFY_PRESS_VOLUME_UP:
> +		pressed = true;
> +	case SURFACE_BUTTON_NOTIFY_RELEASE_VOLUME_UP:
> +		key_code = KEY_VOLUMEUP;
> +		break;

> +	case SURFACE_BUTTON_NOTIFY_PRESS_VOLUME_DOWN:
> +		pressed = true;
> +	case SURFACE_BUTTON_NOTIFY_RELEASE_VOLUME_DOWN:
> +		key_code = KEY_VOLUMEDOWN;
> +		break;
> +	default:
> +		dev_info(&device->dev,
> +				  "Unsupported event [0x%x]\n", event);

It might be useful to ratelimit this
