Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5691E4A9
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 14:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713968204; cv=none; b=ikzoJWWgnLn5+/58baAB9eSu4NVR1m03/xaLvsMhrxvagLKKt1DH/Dr/nfg+E9NrrihtzXhmyd1L9XaQCJKJU6NcFJe8fEBQz1xorCdag/BJ3c2JwElKkkENPY17y4rLJ4N/tDyA6c3h6e6nGRELpcPsUbN/LmBdbUyyHFXBkww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713968204; c=relaxed/simple;
	bh=1W1izjy+YXRHOgh0lW8hzhhgblZkSCnvpBAzRmw4PBk=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=n72RMpDpnnE8GKR3chMGOU1PYvlhW1y66ev8EWHi4wwi3u4OgHXzI1tDHc4S2DUpccYNrXiTYb+Hfx0N1Lq/bx2ht5ydf3XUon4zvm+r5R9GlXqpZoVJHaDFculDWp8S/8qe0Dlwd3lS7OxWJkSqAgjhYxbAEHVevPNa+ke5a4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=KwcHQCKA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SdBjEJP3; arc=none smtp.client-ip=64.147.123.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="KwcHQCKA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SdBjEJP3"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id EE758180018A;
	Wed, 24 Apr 2024 10:16:40 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Wed, 24 Apr 2024 10:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713968200; x=1714054600; bh=Y8elZxzLZa
	wIxpLBkjeMfTCjzxjkLvs2ZoKMc5EEQWk=; b=KwcHQCKAGhkDoKHoj+r1ECTwPQ
	lmGabAJsQdegdd20Ya9fsBv16Iy5XYhs52EL6xQpSXHWJT8A4mm0M8yPH27k4Fnk
	Uin3WX3jA3x4JmLDqNYHQFs0ODha6c6G7wEHfqVOuRDCTxdqFbvxA/niQnIlKdiA
	VBX5JQ+HJHSy0FvlVKeD0l1NZ+xtNjrs3gE4hFiebuYpY3OjJPb+ZtgIeYrW+pSc
	UDsJ76cBjk0b0lV1IGW3RsF1lTFpuu+QB2dzbmYJEZcUZP/T4gX8L+iCKVnmSBhh
	okjAeRj1wo1YN5G8FxVEIlZk08Hnl6ROlVcSqEKsLLd+5JUaLEcMKawvQhdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713968200; x=1714054600; bh=Y8elZxzLZawIxpLBkjeMfTCjzxjk
	Lvs2ZoKMc5EEQWk=; b=SdBjEJP3GyN5fEXTOhUusNRXDDXkuOTXylT+q+UAvkFY
	MSFqQR4/i9PEY3OWw3RJd/ji9S2aDUcN9MlQiaL+UdA613GAu6Pqlp55aF4lry8h
	CyLmmyuTCZe1x8KkVyyFCdqnMQBM6GH8Ku95K7bCZLr6fZTRcQUIIXB2Bsqo+ioB
	a1uPe1lpiMj9BYW5yEUOtUtmlzXadoA87gO/vNz1aNL/80DxnyKvYxai7ue4fR9W
	y+rgr4hlOlXRVUiJlRiTfItftCB5xJss/DcX4SF9L743dMNmQQ9QIbC8PTstpmKX
	Nx0ruuhNwPQX3PGv2biBYz/wk9m9RgZewyUCngXATQ==
X-ME-Sender: <xms:SBQpZht11YO0H6NhN_MEh1oBs2mo0i6SKVR7pfHP8WvN7hSLRiQkaw>
    <xme:SBQpZqc68493mxPoebAthAvfF8frldSlaBnzsURRLWqu0xty8rjurkDabKF0eR8s6
    g_7CsjxhJ9kOfUavhk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelhedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfofgr
    rhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssg
    drtggrqeenucggtffrrghtthgvrhhnpeeiueefjeeiveetuddvkeetfeeltdevffevudeh
    ffefjedufedvieejgedugeekhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggr
X-ME-Proxy: <xmx:SBQpZkxblqye_g6c5EbKlbocEl3VhdE5e0P3V0WtZIDPhkg2oVR6wg>
    <xmx:SBQpZoOT_ujpNgTiLyk9AGKG-Lrl9zPgzoVPD67gnCSci8iVSHe60A>
    <xmx:SBQpZh9F9L8Z3-cS2G5g0jVyRc1KufbeQzylPsIBNAU7W1C-f-Dm1Q>
    <xmx:SBQpZoXklUzcq0L0aznm1QATzrkZJokNLfjbEmZuqm38ImAHw5J6vw>
    <xmx:SBQpZqO8TJlXMbO1ga5h-EC06JG8uH94b7UByvgc0H5ZVPHNA4Me7iXj>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E6DDBC60098; Wed, 24 Apr 2024 10:16:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-386-g4cb8e397f9-fm-20240415.001-g4cb8e397
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <5e0e0317-9e27-4a6b-8b7a-3828f4e3f7fb@app.fastmail.com>
In-Reply-To: <20240424122834.19801-17-hdegoede@redhat.com>
References: <20240424122834.19801-1-hdegoede@redhat.com>
 <20240424122834.19801-17-hdegoede@redhat.com>
Date: Wed, 24 Apr 2024 10:17:04 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Cc: "Vishnu Sankar" <vishnuocv@gmail.com>,
 "Nitin Joshi1" <njoshi1@lenovo.com>, ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v2 16/24] platform/x86: thinkpad_acpi: Change hotkey_reserved_mask
 initialization
Content-Type: text/plain

Hi Hans,

On Wed, Apr 24, 2024, at 8:28 AM, Hans de Goede wrote:
> Change the hotkey_reserved_mask initialization to hardcode the list
> of reserved keys. There are only a few reserved keys and the code to
> iterate over the keymap will be removed when moving to sparse-keymaps.
>
> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
> b/drivers/platform/x86/thinkpad_acpi.c
> index 952bac635a18..cf5c741d1343 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3545,6 +3545,19 @@ static int __init hotkey_init(struct 
> ibm_init_struct *iibm)
>  	dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>  		   "using keymap number %lu\n", keymap_id);
> 
> +	/* Keys which should be reserved on both IBM and Lenovo models */
> +	hotkey_reserved_mask = TP_ACPI_HKEY_KBD_LIGHT_MASK |
> +			       TP_ACPI_HKEY_VOLUP_MASK |
> +			       TP_ACPI_HKEY_VOLDWN_MASK |
> +			       TP_ACPI_HKEY_MUTE_MASK;
> +	/*
> +	 * Reserve brightness up/down unconditionally on IBM models, on Lenovo
> +	 * models these are disabled based on acpi_video_get_backlight_type().
> +	 */
> +	if (keymap_id == TPACPI_KEYMAP_IBM_GENERIC)
> +		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
> +					TP_ACPI_HKEY_BRGHTDWN_MASK;
> +
>  	hotkey_keycode_map = kmemdup(&tpacpi_keymaps[keymap_id],
>  			TPACPI_HOTKEY_MAP_SIZE,	GFP_KERNEL);
>  	if (!hotkey_keycode_map) {
> @@ -3560,9 +3573,6 @@ static int __init hotkey_init(struct 
> ibm_init_struct *iibm)
>  		if (hotkey_keycode_map[i] != KEY_RESERVED) {
>  			input_set_capability(tpacpi_inputdev, EV_KEY,
>  						hotkey_keycode_map[i]);
> -		} else {
> -			if (i < sizeof(hotkey_reserved_mask)*8)
> -				hotkey_reserved_mask |= 1 << i;

Just to check my understanding here - does this change mean that the keys marked as KEY_RESERVED in the lenovo map won't make it into the mask?

e.g the ones in this block:
                KEY_RESERVED,        /* Mute held, 0x103 */
                KEY_BRIGHTNESS_MIN,  /* Backlight off */
                KEY_RESERVED,        /* Clipping tool */
                KEY_RESERVED,        /* Cloud */
                KEY_RESERVED,
                KEY_VOICECOMMAND,    /* Voice */
                KEY_RESERVED,
                KEY_RESERVED,        /* Gestures */
                KEY_RESERVED,
                KEY_RESERVED,
                KEY_RESERVED,
                KEY_CONFIG,          /* Settings */
                KEY_RESERVED,        /* New tab */
                KEY_REFRESH,         /* Reload */
                KEY_BACK,            /* Back */
                KEY_RESERVED,        /* Microphone down */
                KEY_RESERVED,        /* Microphone up */
                KEY_RESERVED,        /* Microphone cancellation */
                KEY_RESERVED,        /* Camera mode */
                KEY_RESERVED,        /* Rotate display, 0x116 */

I'm not sure what the effect will be and I don't have the 2014 X1 Carbon (I assume it's the G1) available to test with unfortunately.

Just wanted to be sure we weren't breaking something on older platforms.

>  		}
>  	}
> 
> @@ -3587,9 +3597,8 @@ static int __init hotkey_init(struct 
> ibm_init_struct *iibm)
>  		/* Disable brightness up/down on Lenovo thinkpads when
>  		 * ACPI is handling them, otherwise it is plain impossible
>  		 * for userspace to do something even remotely sane */
> -		hotkey_reserved_mask |=
> -			(1 << TP_ACPI_HOTKEYSCAN_FNHOME)
> -			| (1 << TP_ACPI_HOTKEYSCAN_FNEND);
> +		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
> +					TP_ACPI_HKEY_BRGHTDWN_MASK;
>  		hotkey_unmap(TP_ACPI_HOTKEYSCAN_FNHOME);
>  		hotkey_unmap(TP_ACPI_HOTKEYSCAN_FNEND);
>  	}
> -- 
> 2.44.0
