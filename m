From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/1] alix2: supplement driver to include GPIO button
 support
Date: Wed, 25 Jan 2012 14:57:42 -0800
Message-ID: <20120125145742.338086b8.akpm@linux-foundation.org>
References: <1327348589-9601-1-git-send-email-philipp@redfish-solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:56657 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750865Ab2AYW5o (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Jan 2012 17:57:44 -0500
In-Reply-To: <1327348589-9601-1-git-send-email-philipp@redfish-solutions.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Philip Prindeville <philipp@redfish-solutions.com>
Cc: platform-driver-x86@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Richard Purdie <rpurdie@rpsys.net>, Andres Salomon <dilinger@queued.net>, Ed Wildgoose <kernel@wildgooses.com>, David Woodhouse <dwmw2@infradead.org>

On Mon, 23 Jan 2012 12:56:29 -0700
Philip Prindeville <philipp@redfish-solutions.com> wrote:

> From: "Philip A. Prindeville" <philipp@redfish-solutions.com>
> 
> GPIO 24 is used in reference designs as a soft-reset button, and
> the alix2 is no exception. Add it as a gpio-button.
> 
> Use symbolic values to describe BIOS addresses.
> 
> Record the model number.
> 
> Redux: address Andres' review comments; make the model number exported;
> add support for DMI detection of the board and manufacturer; change
> detection return type to bool; add comment explaining that the model 
> number is used by downstream drivers to detect if we have RFKILL GPIO
> line to mini-PCIe slots (alix 6 only).
> 
>
> ...
>
>  arch/x86/platform/geode/alix.c |   80 +++++++++++++++++++++++++++++++++++++--
>  1 files changed, 75 insertions(+), 5 deletions(-)
> 
> --- a/arch/x86/platform/geode/alix.c
> +++ b/arch/x86/platform/geode/alix.c
>
> ...
>
> @@ -24,14 +25,55 @@
>  #include <linux/leds.h>
>  #include <linux/platform_device.h>
>  #include <linux/gpio.h>
> +#include <linux/input.h>
> +#include <linux/gpio_keys.h>
> +#include <linux/dmi.h>
>  
>  #include <asm/geode.h>
>  
> +#define BIOS_SIGNATURE_TINYBIOS		0xf0000
> +#define BIOS_SIGNATURE_COREBOOT		0x500
> +#define BIOS_REGION_SIZE		0x10000
> +
> +/*
> + * the 6F2 has an RFKILL GPIO line to the mini-PCIe slots that isn't
> + * present on other Alix boards. Wifi drivers can use this symbol to
> + * detect if it's available.
> + */
> +int alix_model;
> +EXPORT_SYMBOL(alix_model);

This is odd.  There are no references to this from outside this file
and it's hard to see how a wireless driver could use this - any such
driver would have to load this module on *all* machines (even non-x86)
simply to resolve this symbol.

>
> ...
>
