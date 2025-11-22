Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EFE20FA81
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Nov 2025 13:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817231; cv=none; b=np5J7ygJadatb4b3LsYicqA6dwGBMLXIBx9Frpgnp+L08TOGJRM96CrUcmHO5hmjTTL7CSTUr8i41Cyk4+2dCYCowIaPer9rW6UQxX3Bih8Fgt0Tg3A6aYo0zfneXeZ2xgQXFA12PYoo/uP4A9zSPpOMuXIGcJaaUk92JWWezig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817231; c=relaxed/simple;
	bh=MNBsNMgLrloJ6LyIC0PbJqz99LS+Jt/IiFeOlL3J//Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6OZ2UPFJr9lIWkhIf1/k39Tj32D7StNFm13LSlNBfK4+k1gJu+swYL8pOGLwTqcKNt3Z8boOFAQwow+WCcDifFbSncClcqqk/hpWc05jYPsLcr9K5K2xJ2LTzWzsseUOjtjNtV36T7LMP4VA5X5Xoqm3EIs4RzMcxFU72KIu80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXlaQDL0; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXlaQDL0"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ed82e82f0fso27930271cf.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Nov 2025 05:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763817229; x=1764422029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1sAQv700T2FQp3ZXr6IkLjFuZjrhNgxwLliA5KgRjA=;
        b=eXlaQDL0A2CB+MefAM1vqCTDHNi8Ril+61+9lzXMMBNopwXIzUBTDT0vzjEzFBU5R3
         v+pkFGxOwalzWi7hRWISnltBfikJYPB7Tz3RCB8ZVY5lAADWia4VIdtNSmQ83TtQ4W14
         52qj79+1UYNJjnkzs8/UmPuVRrsPLoRD7k+mExKcowpotj6jVpdkPi+1/D2mqNobiDk3
         l8KjWhmJpGgKXh6Ds1X1z4ONdYgZbsJwLZ1+EC/qudFPZqHV/0xDQIh2CiYzH69yR6st
         kRG8y7qhaYbGkBWtA3IJLZoCpIKRPHq/MqALYMit4vPHgYjfApqWsX/krAKbzcfrGXIp
         qGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763817229; x=1764422029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1sAQv700T2FQp3ZXr6IkLjFuZjrhNgxwLliA5KgRjA=;
        b=r5JpH31R9jk7U+m3QyKd/77NF1gOCUdffXtSjDltcy0iejNBGpcjzHJkyYKAzYIhZD
         aKdwW1p0dtrsuAr5+VtHLrPlfhcdDfHVX2KPSyunQWXv1yU2Z229RH/fYlgO+2ieJ15O
         PpvIGhrPj5i2NCIOkQMF4Pl/4Oe/iC3udRJd/E8i+aiZ2uOchfkurvCr+FVff9h4qGRG
         6C4aJVh8zJydwURx7b/eAx0jU5NQvW10FIjZNudwTltmaDFs+eB4tKulsjjyo+q+a+JY
         uDJZoLDhCCCVK5Bc2jIAY80dT0ag2liYV0an8QYqfUe2lh4hsdF6eFEseWJH08gP3gZo
         ZhCg==
X-Forwarded-Encrypted: i=1; AJvYcCUhuk9oPsveSPEvBScic34XO5vwSaER2cW7WbWTOLmW3y8hpeXk4TQOkrmIZreGWOy8qfUFeR5u23tLJYDhz418T7J9@vger.kernel.org
X-Gm-Message-State: AOJu0YzO+fNQf0HlK6CE7APPmuFAtivCvlB4Q/Xgsx67K1OCp52b/8j3
	9YVVPHvYQSsmTtHvFigpV+wrPIKJvQs04GqF+JTdbwvmqBgaO06vJJPI
X-Gm-Gg: ASbGnctQ1+O7NjfPgtpyA167v3YqoqM2enaWSO0u5DFP7V77EugqitDKtMEQdqJ1+sT
	FXL4ZgATRFbyLpK0H92RQQRARZ0L70JK4LpzlmWG/QmloXDtv3v6GYEXyirD+Us1KzEzIiOENFR
	94ki/EGyqDYNq4eJxctULCT5+mdEkisVAvxSkZNmhV7Oeejbx0/GQ3SMIKJiE740KZFB8Gk2GQn
	AfNnPttm+peCbbZJZBo84A3O+2ntTYuGb1rz69TmmdQm2jF/KekbfoKzj968u/ba+f5O1J2ZvK1
	9mOWhOD3oqnTFvRcc50v4wpxMLlywrUT8j3q4N4N+Dbk8n+WecKjTiQ9mJR5lWIOQ1zlReXxYwQ
	HwtCCR+04XntMsHXvPt6Atj+WvvSlj5lotlCb/T6NS6uwu6bTkEdJSqTPE90bVBGqK8wbaYejPP
	+RCFQeHuISzthoIQslhvQ78tI=
X-Google-Smtp-Source: AGHT+IETNi+CDYZDD+zkirhO2cROEDGFvSNpXVwYihq1II2dPnp2S3KN+6mF1nhOqnfkJPckzcyWWA==
X-Received: by 2002:a05:622a:554:b0:4ed:3e3e:a287 with SMTP id d75a77b69052e-4ee5885a977mr62619791cf.24.1763817228686;
        Sat, 22 Nov 2025 05:13:48 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e5b7451sm58662846d6.56.2025.11.22.05.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 05:13:48 -0800 (PST)
Message-ID: <e3e84e44-da61-48ba-a3f2-da33b99559da@gmail.com>
Date: Sat, 22 Nov 2025 14:13:45 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 04/11] HID: asus: fortify keyboard handshake
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <20251122110032.4274-5-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251122110032.4274-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/22/25 12:00, Antheas Kapenekakis wrote:
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
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> ---
>  drivers/hid/hid-asus.c | 30 +++++++++++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index c1a36a8beb35..2a412e10f916 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -49,7 +49,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define FEATURE_REPORT_ID 0x0d
>  #define INPUT_REPORT_ID 0x5d
>  #define FEATURE_KBD_REPORT_ID 0x5a
> -#define FEATURE_KBD_REPORT_SIZE 16
> +#define FEATURE_KBD_REPORT_SIZE 64
>  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
>  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
>  
> @@ -395,13 +395,37 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
>  
>  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
>  {
> +	/*
> +	 * The handshake is first sent as a set_report, then retrieved
> +	 * from a get_report. They should be equal.
> +	 */
>  	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
>  		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
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
> +	u8 *readbuf __free(kfree) = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> +	if (!readbuf)
> +		return -ENOMEM;
> +
> +	ret = hid_hw_raw_request(hdev, report_id, readbuf,
> +				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> +				 HID_REQ_GET_REPORT);
> +	if (ret < 0) {
> +		hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> +	} else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> +		hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
> +			 FEATURE_KBD_REPORT_SIZE, readbuf);
> +		/*
> +		 * Do not return error if handshake is wrong until this is
> +		 * verified to work for all devices.
> +		 */
> +	}
>  
>  	return ret;
>  }
