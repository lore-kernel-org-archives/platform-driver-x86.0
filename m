From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-laptop: support Synaptics/Alps touchpad led
Date: Thu, 18 Aug 2011 20:36:27 +0100
Message-ID: <20110818193626.GA12449@srcf.ucam.org>
References: <1313658248-6964-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:41266 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751295Ab1HRTga (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Aug 2011 15:36:30 -0400
Content-Disposition: inline
In-Reply-To: <1313658248-6964-1-git-send-email-acelan.kao@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Thu, Aug 18, 2011 at 05:04:08PM +0800, AceLan Kao wrote:

> +static void dell_touchpadled_on()
> +{
> +	while (inb(0x64) & 0x02)
> +		msleep(20);
> +	outb(0x97, 0x64);
> +
> +	while (inb(0x64) & 0x02)
> +		msleep(20);
> +	outb(1, 0x60);
> +
> +	touchpad_led_status = 1;
> +}

No. You're hitting the keyboard controller without any coordination with 
the i8042 driver. What happens if the user hits a key while you're in 
the middle of this?

> + * Called for each KEY_F22 key press event.
> + */
> +static void dell_touchpadled_update(struct work_struct *work)
> +{
> +	touchpad_led_status = 1 - touchpad_led_status;
> +
> +	if (touchpad_led_status == 1)
> +		dell_touchpadled_on();
> +	else
> +		dell_touchpadled_off();
> +}

No, this should be handled in userspace. Expose the LED via the LED 
class and have gnome-settings-daemon (or equivalent) coordinate the 
policy - otherwise you'll end up with situations where userspace and the 
LED state are out of sync.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
