Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636603093C1
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 23:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763509418; cv=none; b=sXHnsiAy8OErz6fwugMPio/OLXgqMpcTVAkgBszxhcXM/xI03vWJi0gR2qkYCJWk5sNUCmT8VnI1LTJQzrkw4zj0MDbnnLXOdQjydSkYzFa1XYd6XssR8JiIJmgjLGBApTWL38M3+SfhBn30Tib7dEXB4wMpg1R59ZfREc3r8Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763509418; c=relaxed/simple;
	bh=KRxJp4oqZnN0m8G2sNvQV0JA2QLdsy09RKAgqURSOaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxtvgpJHSds+n3CJtzOJ4yTbXZvni973HhsmyhfeOG53a9VMWEKbABT5oT/w3X4fpEgQBolHTJLNfnwgt/ZJkX2Usbdg7Thn0HMEwCEXPw9kICdqz3eSXC6GWmNTu1kiwitDI1Ue12sHNx7Q/iN1AfhWLB5P9pcDhhqIQCoeAlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKIaa0in; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKIaa0in"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso568725e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 15:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763509415; x=1764114215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MkiUduVyh4bpWwTTiLv09ZNzrBmsb5PcGluQvqo0dQg=;
        b=SKIaa0in3gi7gMigQl2S/ibt/kkYXZAec8oTmogA470qLU3229PpX7D25jtIKtmeFT
         xukexGYm70UHrEzuRO5CHLSsu7dtr06XOonL0pi4pbrUKE5PCNVRcI2KNh+40ZOqiA8U
         88ot0aQlw9R2lZdD4BCVW0i7E9fm9mw8XB5sy1HapHjKUNi47pFVb9GF2ob8U0hWg1bx
         JfEb/mm6fKXs8+7weoErPvS9dchpIf/rt/cUsMQUrB87S0MC/MfOHH+mkC/MqD6FQMAA
         GF3EvCCxPbwYVXPu99mErFkNZ0k7mPX/pYLcH1+sCMiQVmvEdqkeyUnm44aWa7g5r8sf
         zKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763509415; x=1764114215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkiUduVyh4bpWwTTiLv09ZNzrBmsb5PcGluQvqo0dQg=;
        b=QPuSA6nm2ommSxy/z1rInZrR48J9OmowWi4K6HtZuSoFvIRhjGEixflGTddcUAnMt+
         tui7u7DV/HLFuLLA6ByPNiBEZKF/NrnmELayEZxDdojn64iDNr315tn51xi8nFx8piMx
         agjsFCDfNG915M17CCJ2S24tLA7qhPCqT5qIk2Q3wvfwuYrPKhQEQSHhXMRKSbDywUhz
         kHx4RYe7IgqWphSxr4KU5Jc3Dd3Fl5pO+gipu3HlPz54Xygp05/Nf88ICC4i7Paqr6zB
         fTB4jvvJBarP5im7e93B4RQebBBtN14wF+7CHxWDTHJSGx6y/BvANNxxoPjocWCNTt9V
         Hflw==
X-Forwarded-Encrypted: i=1; AJvYcCXAtpvMMWmhK6mdHbHs3f16vKVtEwai1Txsr2Ooy2DpCLQZ81LF1Klr2dgfFWglXTSjOjsROuy49BDA6HvYuUQFfE60@vger.kernel.org
X-Gm-Message-State: AOJu0YwzcMWhJMeV7nD2dDWt6J0+bms9KUQMlkfsRd7OB10Ei0Hm17Ay
	06vklEgjDmTKxFhj1oRKQmDjWfAG8s0lqYv3/3vRiO/vmh8+6zu5MwhM
X-Gm-Gg: ASbGncsp9RvlFBRdA43cjL2cE03vcHcEZA6jENwvZSEadPalviMxgAaIX5jMdjLQqqU
	iXAx0D1bm8dET9g2lOV4PBiWl0DJ2TNwn6/4udRh7kR4MKGN7TItrvW3tLshGYn/62ISzWCwrjg
	eLGiyiHaCYoPbGtkcwJy/EP/zukc1LyMnk1YAjxSu9tb1ciaaUC/Q6GtVEPwgB7wpNod6+hMnaC
	6q1Z+RqoeAQvT/sut1QiM6TO7FUm8fgcjl4LM2DoYsLU6fSJ5CH8yWgF4EQY+Uy0Pz1iAJjbEE8
	fed1HGrU36mb7AX591EYHX/b9lK+sOfrdW59yy9q4odwJjDPll4m6XGUNcCgRcgaYI/cG3NwiGo
	ooijGBgjyoRqJps427rlNY6EV/cO5wkVrwL6QPIqnQFkONSiQ9ZmkPnktUeY0j9arfQBtvGU5vs
	N6+JoHrfWQ2RhSpbuEApjRnR4=
X-Google-Smtp-Source: AGHT+IEpttPN9NW87xtKijYXHInJAC9nSR6e8xX5mZwxo9mPWV0P3OC0k/e9lHBFsVs5ZBpI/5JEAg==
X-Received: by 2002:a05:600c:1c0f:b0:477:9cdb:e337 with SMTP id 5b1f17b1804b1-4779cdbe7e1mr127734255e9.7.1763509414479;
        Tue, 18 Nov 2025 15:43:34 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e84a4fsm34548801f8f.11.2025.11.18.15.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 15:43:33 -0800 (PST)
Message-ID: <75fe4c0f-3303-4f3d-adc5-45487df3c80a@gmail.com>
Date: Wed, 19 Nov 2025 00:43:33 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/10] HID: asus: fortify keyboard handshake
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-4-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251101104712.8011-4-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/1/25 11:47, Antheas Kapenekakis wrote:
> Handshaking with an Asus device involves sending it a feature report
> with the string "ASUS Tech.Inc." and then reading it back to verify the
> handshake was successful, under the feature ID the interaction will
> take place.
>
> Currently, the driver only does the first part. Add the readback to
> verify the handshake was successful. As this could cause breakages,
> allow the verification to fail with a dmesg error until we verify
> all devices work with it (they seem to).
>
> Since the response is more than 16 bytes, increase the buffer size
> to 64 as well to avoid overflow errors.
>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 4676b7f20caf..03f0d86936fc 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define FEATURE_REPORT_ID 0x0d
>  #define INPUT_REPORT_ID 0x5d
>  #define FEATURE_KBD_REPORT_ID 0x5a
> -#define FEATURE_KBD_REPORT_SIZE 16
> +#define FEATURE_KBD_REPORT_SIZE 64
>  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>  
> @@ -393,14 +393,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>  
>  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>  {
> +	/*
> +	 * The handshake is first sent as a set_report, then retrieved
> +	 * from a get_report. They should be equal.
> +	 */
>  	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
>  		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> +	u8 *readbuf;

__free(kfree) = NULL here? Would simplify the code.

>  	int ret;
>  
>  	ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
> -	if (ret < 0)
> -		hid_err(hdev, "Asus failed to send init command: %d\n", ret);
> +	if (ret < 0) {
> +		hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
> +		return ret;
> +	}
> +
> +	readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> +	if (!readbuf)
> +		return -ENOMEM;
> +
> +	ret = hid_hw_raw_request(hdev, report_id, readbuf,
> +				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> +				 HID_REQ_GET_REPORT);
See comments on patch 1 (also reported below): not sure if others
report_id are going to answer, my guess is that we will have to try
if you choose to go that route.
> +	if (ret < 0) {
> +		hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> +	} else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> +		hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
> +			FEATURE_KBD_REPORT_SIZE, readbuf);
> +		/*
> +		 * Do not return error if handshake is wrong until this is
> +		 * verified to work for all devices.
> +		 */
In review of patch 1 I requested this function to be called with more report_id
than just 0x5a so this will have to be checked against those values too.

In alternative you can fork based on the report_id, but having confirmation that
this is valid with those ids too would be of great help. Perhaps I can help you
with this asking to asus-linux users.
> +	}
>  
> +	kfree(readbuf);
>  	return ret;
>  }
>  
