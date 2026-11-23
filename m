Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=150.101.241.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393142;
	b=uotgknG5crMxfqBharj2svh0jxkE7S0CECf7OvrnwNOhqmHqh44PR4LUwSx964w/3z64
	 9A6mo6JhUVFjsEQrtG1YesV0KKYOVPs71c/4GEohIQ8r19efmi6yVZkX9JlfwCrz142eL
	 iVo/RQvN85gikYgxMQ0AEHMj1qJ5/btuFTkXlifjKW2yP2eE6wViUXRxLiSKjOpff0XFW
	 ZVDuQGJhw8qseayMPXrNPKkrXIWU1ldCkqPwauTyOmXIQyvhppxzHKRy/Qz9Rd4KtLAWt
	 NgVChL1//xVlThfOxIXcXYNtH5sFePQVt85TXZKZbNtnmzVR+YNoQVYcZzHvSmSgKjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393142;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-MIMEDefang-action:X-Scanned-By;
	bh=Hlsfe9wT7MTVNMTOIhOML2Y9+D05NV5Bu137g1/Gj/w=;
	b=Yyj1BK17AmtJm6lguEHd22Qf7ZbdOpENJpLMlvXhniu4N9c576gLlqmCHE7rf+JGr7Yz
	 HrMhdr1e+pzg5OFHY1Ysg8oCPJlXCFXqAdZKMYkbsJEOSAadhKqWZ4rSn6Mwa/Vd9w/J8
	 Fm28IyIqPmXuKzNH3IMeJf0bMM791Jv4i9bV47DjMA2WN3fEwwmnZ10yIaNosbDer3Kvz
	 s3NrymZj8ckKFAP9EwsNEk3Gu2TjvpIugD49gbtEW1TZaUxebLYybeAByNImHsBVK4pXZ
	 KbsUKxV3A10C16E8eWpmRd6WZUbpctoeCGj+y6CYD4nH7ndmiP8LRMC4haMsns7SE5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=just42.net;
	spf=pass smtp.mailfrom=just42.net;
	arc=none smtp.remote-ip=150.101.241.2
Received: from server.atrad.com.au (server.atrad.com.au [150.101.241.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C15606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 00:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6C15606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=just42.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=just42.net
Received: from marvin.atrad.com.au (marvin.atrad.com.au [192.168.0.2])
	by server.atrad.com.au (8.18.1/8.18.1) with ESMTPS id 6AN0I9El013949
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 23 Nov 2026 10:48:11 +1030
Date: Mon, 23 Nov 2026 10:48:09 +1030
From: Jonathan Woithe <jwoithe@just42.net>
To: Florian Schmidt <kewl0@arcor.de>
Cc: Hans de Goede <hansg@kernel.org>,
        Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Report Windows Ink button
 on LIFEBOOK U9311X
Message-ID: <awOGQQCmV09y11gB@marvin.atrad.com.au>
References: <20261120120655.40295-1-kewl0@arcor.de>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120120655.40295-1-kewl0@arcor.de>
X-MIMEDefang-action: accept
X-Scanned-By: MIMEDefang 2.86 on 192.168.0.1

On Fri, Nov 20, 2026 at 01:06:55PM +0100, Florian Schmidt wrote:
> The LIFEBOOK U9311X has a hardware button for Microsoft Windows Ink.
> Pressing it does not queue an entry in the FUNC_BUTTONS ring buffer.
> Instead, bit 20 of the FUNC_FLAGS status (op 0x4) is set while the
> button is held down and cleared on release, and an ACPI notify is
> raised on both edges. The FUNC_FLAGS event value (op 0x1) reports
> bit 20 on both edges, so it cannot be used to tell press from release.
> 
> FUNC_FLAGS op 0x0 returns 0x66120120 on this machine, so bit 20 is
> advertised as supported. Bit 30 follows the Fn lock state and is not
> touched by this change.
> 
> Track the level of bit 20 and report press and release as KEY_PROG1
> so the button can be bound in userspace.
> 
> Tested on a LIFEBOOK U9311X (BIOS 2.42) with this change backported
> to v7.0: libinput shows KEY_PROG1 pressed/released for each button
> press, independent of the Fn lock state.
> 
> The analysis of the dynamic debug output, the code change and this
> changelog were produced with the help of an AI coding assistant
> (Claude Code by Anthropic) on my request to make this button usable
> under Linux. I reviewed the change and tested it on the hardware.
> 
> Signed-off-by: Florian Schmidt <kewl0@arcor.de>

I don't have suitable hardware to test this myself.  However, the proposed
changes look reasonable and they are reported to work.

Acked-by: Jonathan Woithe <jwoithe@just42.net>


> ---
>  drivers/platform/x86/fujitsu-laptop.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 8e909cb..0bcb92e 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -81,6 +81,7 @@
>  #define FLAG_TOUCHPAD_TOGGLE		BIT(26)
>  #define FLAG_MICMUTE			BIT(29)
>  #define FLAG_SOFTKEYS			(FLAG_RFKILL | FLAG_TOUCHPAD_TOGGLE | FLAG_MICMUTE)
> +#define FLAG_INK_BUTTON			BIT(20)
>  
>  /* FUNC interface - LED control */
>  #define FUNC_LED_OFF			BIT(0)
> @@ -140,6 +141,7 @@ struct fujitsu_laptop {
>  	spinlock_t fifo_lock;
>  	int flags_supported;
>  	int flags_state;
> +	bool ink_button_pressed;
>  	bool charge_control_supported;
>  };
>  
> @@ -585,6 +587,7 @@ static const struct key_entry keymap_default[] = {
>  	{ KE_KEY, FLAG_RFKILL,          { KEY_RFKILL } },
>  	{ KE_KEY, FLAG_TOUCHPAD_TOGGLE, { KEY_TOUCHPAD_TOGGLE } },
>  	{ KE_KEY, FLAG_MICMUTE,         { KEY_MICMUTE } },
> +	{ KE_KEY, FLAG_INK_BUTTON,      { KEY_PROG1 } },
>  	{ KE_END, 0 }
>  };
>  
> @@ -957,6 +960,7 @@ static void acpi_fujitsu_laptop_notify(acpi_handle handle, u32 event, void *data
>  	unsigned long flags;
>  	int scancode, i = 0;
>  	unsigned int irb;
> +	bool pressed;
>  
>  	if (event != ACPI_FUJITSU_NOTIFY_CODE) {
>  		acpi_handle_info(handle, "Unsupported event [0x%x]\n", event);
> @@ -990,6 +994,20 @@ static void acpi_fujitsu_laptop_notify(acpi_handle handle, u32 event, void *data
>  		for_each_set_bit(i, &flags, BITS_PER_LONG)
>  			sparse_keymap_report_event(priv->input, BIT(i), 1, true);
>  	}
> +
> +	/*
> +	 * On some models (e.g. LIFEBOOK U9311X) the Windows Ink button is
> +	 * only reported as a level in the status flags: the bit is set while
> +	 * the button is held down. Report press and release on each change.
> +	 */
> +	if (priv->flags_supported & FLAG_INK_BUTTON) {
> +		pressed = priv->flags_state & FLAG_INK_BUTTON;
> +		if (pressed != priv->ink_button_pressed) {
> +			sparse_keymap_report_event(priv->input, FLAG_INK_BUTTON,
> +						   pressed, false);
> +			priv->ink_button_pressed = pressed;
> +		}
> +	}
>  }
>  
>  static int acpi_fujitsu_laptop_probe(struct platform_device *pdev)
> @@ -1037,6 +1055,7 @@ static int acpi_fujitsu_laptop_probe(struct platform_device *pdev)
>  	if (priv->flags_supported)
>  		priv->flags_state = call_fext_func(fext, FUNC_FLAGS, 0x4, 0x0,
>  						   0x0);
> +	priv->ink_button_pressed = priv->flags_state & FLAG_INK_BUTTON;
>  
>  	/* Suspect this is a keymap of the application panel, print it */
>  	acpi_handle_info(device->handle, "BTNI: [0x%x]\n",
> -- 
> 2.53.0

-- 
