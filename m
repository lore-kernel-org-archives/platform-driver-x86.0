Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6175D302CD6
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 14:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763648142; cv=none; b=PvcQTGZcafBKt59qZ4VHsfU4VczgtPlAh+KBTfBmkBWfVLJGxnKFBJ74exOZYzXyc1ecxSoYDwIhxw3ev7UUfRUGvT4lCALIkJM4L8Iw5sBgER/8YM6x0Fic79VMg56dpTeKTwkECuWMduIaAaa4t/crQBfhMGEHxoU8Ma8/BQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763648142; c=relaxed/simple;
	bh=urNdyCZGES9rDj9ot6owCD8pdVfj5QPi//ZrMRJQUaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBGihQufZzzuRELs1etSic7TVsdoE59d8DLIIVbSqpDeh4U0fdoSgkQV0OOxOQp5UWSbViD8Cb9rn6BQfqRG56t+pB1DyFu3ZXVWTY+lNdCZ7tVFPboEEH6+vMw4HX2kRNBgz/BsLDDnoGSeHecRJU8T0AXMeD6ZEzGOt5jrWIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6rR0j86; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6rR0j86"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a1c28778so11370745e9.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 06:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763648138; x=1764252938; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EdstboqPRYhjDwOMgRMYhYZ1S+MFFDi0TIYa6oOlKJg=;
        b=J6rR0j864i2Ns2RKc6vRk/uEqhzYtEeO5YlPRa5IgE9o8AEWA0ZrwIDA3GI+C7oNx2
         slX0Gmy4xJWTyql1rpZO4ZkNxSnj8E4J7oDkQvVhoYAfiRXI7voxLZN+PCJ6oti4EpTb
         NgavtkvkSv+lHmHxd5IMhL5d9j0l8/nCXituFKbnr5bOWlzSuvYEnsCTZ6EQaeh4UNN6
         7AY+t8cG+Fa3Me/UFq0j2unUOuRkbLm2UhVgZ/K1eyM60uIGN8mwqLYKzbrDp2PrWW8N
         83xyQsIL+R1xfx620hOnVitRfbm4OQaZn9fCGgrxcaibcIrC2V+ncS3YHMrTVQ8YiuEw
         cA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763648138; x=1764252938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EdstboqPRYhjDwOMgRMYhYZ1S+MFFDi0TIYa6oOlKJg=;
        b=uiJ2rJ9yg222ssYj/PHMYSzMHVPqkiWBqOe0e7vSgII0WZW7N0D4qlhdfmJHSUbyKj
         H5SsXhwkrdKDubV34qCiQ1OZsjtzBV5BZU1qOeUqcotuY5eooSY7TDJa/0Ov+8tmHgXQ
         L2zsOUKMAtlB1NN/RceDDOBoS/fcZlxi7rtEWvSnzixaUoVkGLibRjwZ/MbVa65nzPm3
         PIPz0ko+P4wQxJiesP39nbVyIf3eqIKXl4MstGZU8U9mcKcL0OGfDySjUroNEHY1T5JP
         KMjIozv4w75xYWDpW8uyuGswTsAO0ShDX15WD7qbD1vlcRyni/KM7a5hQk3jbMmNsw4k
         oTyg==
X-Forwarded-Encrypted: i=1; AJvYcCU3E77CW9aD1rKBne5/07u2FUoUnEDO9BkpbK0LaghfIPT266sJkpFD6tY/8jxYiMf3N9mKcxljAea1K8ENW1Wrek1K@vger.kernel.org
X-Gm-Message-State: AOJu0YzHBXsHxpi4+otUFcZm/tQz/0rzhOlYsCTYhvdcmOrzfbXoF2Bu
	Q10+OgREHQNsQ1Oa+z+R/PxEMvlQ8XehUhwc7ErHV4RFubMs3YVCtrETcT5Fmg==
X-Gm-Gg: ASbGncuVtu8PmyVhCOBi0xmefnE8uUau0c77IvJjF6GTuu6NlWi9snFQQ5HCDfEsx9O
	4NDowJRowoIhSZT3DYdN2pmKoUn49hzwgIetmu5HcVCqzaP6VLBKZce26FWvwRs1Ehoq+uqe9Ua
	rzf3oW9NoTfvsQFdSswHY8QG62prlrVPk2poYzoBZWibUZCPRtmz4KDoqPvptYB2g5zX38xjl01
	NFWF6o3wpQOoj/tQZXzMs3blRvQis+qnRAFMBEilXONFZWLtJoxtWmG8XLyO5/OlLBn04NJH8/p
	DoTUC6ByF5raXKo/4dK254iXK1zebSsgPfxTd5NwzUfXHF4yh58dH3Tj39JaYoqJSfIOWOYL1KL
	mLHkMM+GZ3NIYlWADAO6cpIm+xkeu6qWe65f/Wz5ob/ih3hm4wL/wFh2LhbwtOyAEGzArlG/uEQ
	JVr/r58KKDlApZBrjbaH8JbOI=
X-Google-Smtp-Source: AGHT+IHYCLxUUzMfIqKz+6vD/bwGFHltG0yeTPVBP3wciZeAXZG6KpFdnBXT/VaaV2Nu5EPMcWPgng==
X-Received: by 2002:a05:600c:474a:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-477b8a53aedmr32233975e9.14.1763648137303;
        Thu, 20 Nov 2025 06:15:37 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a97213b8sm65019255e9.1.2025.11.20.06.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 06:15:36 -0800 (PST)
Message-ID: <967761fb-3f55-4d51-be0b-23ad03258eff@gmail.com>
Date: Thu, 20 Nov 2025 15:15:36 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/11] HID: asus: fortify keyboard handshake
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251120094617.11672-1-lkml@antheas.dev>
 <20251120094617.11672-5-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251120094617.11672-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/20/25 10:46, Antheas Kapenekakis wrote:
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
> index 6de402d215d0..5149dc7edfc5 100644
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
> @@ -394,14 +394,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
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
I see my suggestion to use __free here didn't materialize in code using
it even after Ilpo kindly wrote how to correctly use it.

I think you can move the readbuf assignment right below buf and
take into account what Ilpo said.

I don't expect new variables will be added here ever again,
but I agree with Ilpo that it's a good idea here to write code
accounting for that possibility.

It is my understanding that who proposes patches is expected to
resolve discussions when changes are proposed or to take into
account requested changes and submit a modified version.
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
> +			FEATURE_KBD_REPORT_SIZE, readbuf);
> +		/*
> +		 * Do not return error if handshake is wrong until this is
> +		 * verified to work for all devices.
> +		 */
> +	}
>  
> +	kfree(readbuf);
>  	return ret;
>  }
>  
