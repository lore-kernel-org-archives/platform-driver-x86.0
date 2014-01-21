From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] toshiba_acpi: Add hotkeys support for Toshiba Satellite
 U940
Date: Tue, 21 Jan 2014 08:38:26 -0500
Message-ID: <1390311506.5320.8.camel@x230>
References: <1385161342-8262-1-git-send-email-joseignacio.naranjo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:47839 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751789AbaAUNib (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Jan 2014 08:38:31 -0500
In-Reply-To: <1385161342-8262-1-git-send-email-joseignacio.naranjo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jose Ignacio Naranjo <joseignacio.naranjo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Sat, 2013-11-23 at 00:02 +0100, Jose Ignacio Naranjo wrote:

First, I'm really sorry that it's taken me so long to get around to
reviewing this.

> +static struct key_entry keymap_satellite_u940[] = {
> +	{ KE_KEY, 0x13c, { KEY_BRIGHTNESSDOWN } },
> +	{ KE_KEY, 0x13d, { KEY_BRIGHTNESSUP } },
> +	{ KE_KEY, 0x13e, { KEY_SWITCHVIDEOMODE } },
> +	{ KE_KEY, 0x13f, { KEY_TOUCHPAD_TOGGLE } },
> +	{ KE_KEY, 0x157, { KEY_MUTE} },
> +	{ KE_KEY, 0x158, { KEY_WLAN } },
> +	{ KE_KEY, 0x12c, { KEY_KBDILLUMTOGGLE } },
> +	{ KE_KEY, 0x102, { KEY_ZOOMOUT } },
> +	{ KE_KEY, 0x103, { KEY_ZOOMIN } },
> +	{ KE_KEY, 0x139, { KEY_ZOOMRESET } },
> +	{ KE_END, 0 }

Yeah, that's pretty distinct from the original map. Boo.

> +
> +static int dmi_matched(const struct dmi_system_id *dmi)
> +{
> +	keymap = dmi->driver_data;
> +	return 1;
>+}

But I'm not a fan of doing this with DMI - if Toshiba are doing this for
some newer machines then it's possible that the map's changed for all of
them. Things that spring to mind:

1) The map may be different on all systems that support Windows 8?
2) There's some ACPI call that distinguishes between them?

Can you send me the output of acpidump for this system?

Thanks,
-- 
Matthew Garrett <matthew.garrett@nebula.com>
