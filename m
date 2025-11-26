Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C054C313536
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 20:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764188848; cv=none; b=BuBLPyBNEMOQUEkoWO8RlYwsQM6V8fX5RXoaoDvCU0UVRgcg2ju038fY5//PEJmpT9JTNz2qEsEis04BdlcMiUnsYY+5Re2J3JSomPftjWv9yfn6Ui8vwHdAu40fjXrtqvlotlYzOh6G3nGb2Ewt0z0A8QkIFjrkehVZsoWF788=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764188848; c=relaxed/simple;
	bh=HKIM2XDlOtvCtdXcaqehs0suX2nO2L/FZMa8sZTYwVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2cjHgGfBSQ3ZgtS3DnDRl8Z5NF6YGupMXd/8MN1Ps4O0xqGlvYWt1PepROCMwr7yC5QM9LlDCzR76BJ6L9GRGZFJaLWgbwp7dXdJ93S52aRjF/FEBSTW5xnDZmZEMa/WdUuGDxHZJJNHrbm4Y4UuLUQGF12XrypGDfuC/XxDkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feJ7B9X0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feJ7B9X0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b31507ed8so190755f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 12:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764188845; x=1764793645; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZ8dEFu4Kwk+BNf08Ffe5YWG7kcopfid5SLE5GDJ9VI=;
        b=feJ7B9X0fUWnYAEjKy0+CLdsG2hP5AUItwIUPe2OMecOeEvgmrxIE+MUYTwsxmu98l
         zoqau4urfa+QP7H13/A2L6ZLIFbieOPGyIw8VEdDdMHwE+bbzwPhfiDzUmjiDvc9qlMr
         lS1i0IkGa7JWFh+d+n2BktH+4bNqIu0PEzDiRIUSBHbo0nMCUYjxeXD0RtEhf8zwj4p5
         YcDYNBDUojxo6pp2Q8TuYzzDqGqjc/SqlaGmGdN5vVwAf9NcLOLsrPV624RZKwyzasZF
         zzJf5E+YGs6A4rgcA8QjIBP0+vi9FrKnJ3KRRodXYyZ8qKa3mc8Wkk6XYLl+nZ8D007c
         MrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764188845; x=1764793645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZ8dEFu4Kwk+BNf08Ffe5YWG7kcopfid5SLE5GDJ9VI=;
        b=XaBRvxbx+4g8f6iVVAmB/lOSdD5frGJcO+i5K1kPBmA0ZqRf+TK26Zr1E2LwXTZ+w2
         Jh0HvveiP+I2otVl80LZ7BueYKG/NrnvaX7jj7ADGmabxc03DAxoMOLwtffqyLFFiMBD
         vg11HQ7kzjJyT8qdNLTSDro//LM5ZIgrnstkmaxuWpKNDxwCkjImassEduBJqXavHOBH
         h2v9CAfig6f9FJlwS2A1//4jgORG+UhTdFJIC7/4nJixUiOLYzLYG4W5qxiCbe9uriji
         UR1bf3f8Wyr0q7bnBL5Sv+TjQF17CW8F0p20ahrL3uqTgsVHCliuZFHaIMd1oPJOZbDY
         2Eig==
X-Forwarded-Encrypted: i=1; AJvYcCXgIeQqRpNG0tF+mg2P/CyzTfE5fto0i1cupMtd+A0egxqMAOwE2ofOigE8q3gjooQsCGAf/zE4FGuIY/ER+xH5LRvQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzvPmd0gP4IM7so2Ym9Mjr37PPKeuxqLsiNXIyn0J4GGnGn3OfF
	8+wmLpAYI6YYKz62/X9Ozw1q0gizhRoZLqg2ypcfhzEfCYPAXAJd3H16
X-Gm-Gg: ASbGncuWrSNWyMhXG33UhPfqRnlgZ9K+D2+bYSmnsLX+CqySxJCInpJu0BtCN3ivOhL
	4fZbcdNjYK201YGQuOjOKr7Bi98c5YhHiPUy1841V+mhPCPEMZ2WRSNj6Y9SM59uZZ8HKmjHKAC
	LhjZdRIBJx8CbDNuGODuDSej8jNYWjXAGDS/FZnQmxogDbFS6LOIrPtz9i5IOw7Eq0CAMUN+/hl
	w+0nwRuaXR2JKea39/JFKTTSF4MXw3C03GPMufugoDjsj0vOjDpvnrnOUdiPQTP8d8dBn7XX5OJ
	YKFTVZ1A+hnp4eWdOELOk72cNY4ZsEqHlhlXlAT/Ggo4OVRhtLdKDbppbNRLc5S9vMDpvlTXz6i
	YMp9cGEs0Z25AukJQKQKnYfakeblQ1ReXjTUFNuup7saKVVAEDjbqyXYlaGSqpk9kuEoU6fh3BK
	wBoKkDXEnG5hhs2tBHbPOMZN+mIRyJaGPy6g==
X-Google-Smtp-Source: AGHT+IFTYDrylDG61uHyZO6/gRHuthjRBFqmgEiPn9uOZLoUbhfE7iVNC9MC3qLEfOeTbADm3HWnrA==
X-Received: by 2002:a05:6000:2c0c:b0:42b:2c61:86f1 with SMTP id ffacd0b85a97d-42e0f34a082mr8842552f8f.35.1764188844984;
        Wed, 26 Nov 2025 12:27:24 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cc231dc6esm33031198f8f.7.2025.11.26.12.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:27:24 -0800 (PST)
Message-ID: <400c681d-a841-4bfd-a7a3-b8d4c6683124@gmail.com>
Date: Wed, 26 Nov 2025 21:27:24 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/11] HID: asus: initialize additional endpoints only
 for legacy devices
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <20251122110032.4274-3-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251122110032.4274-3-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/22/25 12:00, Antheas Kapenekakis wrote:
> Currently, ID1/ID2 initializations are performed for all NKEY devices.
> However, ID1 initializations are only required for RGB control and are
> only supported for RGB capable devices. ID2 initializations are only
> required for initializing the Anime display endpoint which is only
> supported on devices with an Anime display. Both of these
> initializations are out of scope for this driver (this is a brightness
> control and keyboard shortcut driver) and they should not be performed
> for devices that do not support them in any case.
>
> At the same time, there are older NKEY devices that have only been
> tested with these initializations in the kernel and it is not possible
> to recheck them. There is a possibility that especially with the ID1
> initialization, certain laptop models might have their shortcuts stop
> working (currently unproven).
>
> For an abundance of caution, only initialize ID1/ID2 for those older
> NKEY devices by introducing a quirk for them and replacing the NKEY
> quirk in the block that performs the inits with that.
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index a82286a427b8..9004814fb0d3 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>  #define QUIRK_ROG_ALLY_XPAD		BIT(13)
> +#define QUIRK_ROG_NKEY_LEGACY		BIT(14)
>  
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -652,7 +653,7 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
>  		return -ENODEV;
>  
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
>  		ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
>  		if (ret < 0)
>  			return ret;
> @@ -1376,10 +1377,10 @@ static const struct hid_device_id asus_devices[] = {
>  	  QUIRK_USE_KBD_BACKLIGHT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
