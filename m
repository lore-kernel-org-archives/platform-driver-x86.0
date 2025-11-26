Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E68C340A57
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 20:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187782; cv=none; b=slDnZOwv5WnvmpVdqXcarMA3l9meAQCC+O7L/ChU2DIfGR82DzdRBQ2h0UX43jX1cBtx6KEwXvDWl1mDHKAI5ikFD59fUX0OCxZlJgTKEWXP8pid/17QxK0+8QJfPppVyOi4w6iw0b8rCtuh+bcfPn4futJSVeOF8AIFrb1pTTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187782; c=relaxed/simple;
	bh=CqBgh0NfMOWFNQ99RGxFMKMqRNLUuKtUjLxVDeHfBl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqpztuw9taDypMGvK1zyzjAtvnp9hpu1NNN95wcdkNODtOkSWqEaGezcZfVD3MxDU8igtMuM3skUKmRMsYLsqeb/rm7vH+EP+6zdH58pe5dhl+TzhmoR7gyDJDptMjhwh3iLoZ3axJaTDGGJIVCWD+FzNT/aRdwWycll83OpKsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GvHRVCYS; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvHRVCYS"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3b29153fso101040f8f.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 12:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764187779; x=1764792579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PFWIQEeWmjjWkOuXAEfNPx8P9RntOrfIpL+mS7UhVYg=;
        b=GvHRVCYS0lAOp1DFWy0ypuSlnJZ1yJCBq2UUpaEkM/j6hPRZ4+eYYEwuTALyS3a2F+
         BFDAN5yCN8uQvFvj2BEr88n8lXIQjQ0509HmSQLoaU5McNW1MxE3nY/bCx7qkOu9jmAt
         WvegClbqtw8vuuUcaIwggvBxayIxhNsXzHnklQiRkfQKYqjZeCW3iaShiBFkBwGf//tC
         qoZyRsGqAUbz53Jy/xZ733l7T6XLGFmfkhl93G0459tpN+QyOXk/TMHfhqb/cSRrQ6wZ
         B5gY2DZy1au9yms3ba3xJgXI7BCuvi/TfjdhYmbji4f3qdgmSK/LEOu3R4qvzk/tICeS
         NtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764187779; x=1764792579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFWIQEeWmjjWkOuXAEfNPx8P9RntOrfIpL+mS7UhVYg=;
        b=i4MbaqHk+ZtSdM62a1LyevC419NJ4p2OpckTX3h57r8INw8gKTBMBC4hoqSXOy0F6c
         CI9qOpYe9pwyENqL17WtV+sAnjA8hTznWzYXJFCQ1v2dqOXp98umpf3nIcDd0nsfeKYE
         r7V+Qf4YD12i/e5T6wIGJbLC+N5uuS477lsW19aLS74sy5HipXJy+YxZH51LA1SbOGsi
         WRp10KFO0IBhPtFGg4hKo2++AfBb6jVUbVv56fADnyuKTxEAsfkOFQgzzaEQRGSLalhg
         1JjTf/QsvEUjB3p3uOcJyAucFbjaGHCq5jJMRAdo35evbMg4+4VELPNYHa4fMvV6ToHE
         oNyA==
X-Forwarded-Encrypted: i=1; AJvYcCX7x1uCr5Ia7KrhUD6VeQWrGAJrkEknmtXrmKvEV46hk1WshXVpbBaIgQttrE+FkyH7bcxxheRt9IGeob/0E1qXhxL3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu4dwUtzaAL42H2s7MGC/DYDXwTvbuOh8I+fJCQAh4xh6+U6Ek
	5YvbC18Dx/5tcVdIDO7BcXeorSHRp9CfWHxnRwbgg0Z5unh0hOvBL7KY
X-Gm-Gg: ASbGncuPOfLEmKOAm2iG8nMaROQnvBxIlappSTJBiv77DY2bmwC5aq6UuUb54nC9SRS
	+EodDmsjeCF7llWXwWNIWkOH/0GHozcFiqPUd6GEqtYWuoA+YV+1HpK3DkoPDs36lkwzqIYwM/2
	QMUs/AsKx1dHeR28vTuHT72Y/Ltrgd3/GwK78iXamP6dkttLxq4LQ63F22N/G64T2Qe5ajgmVgZ
	YuNz6saoGqodY869STVJEayOfZE6PsBOSNn6FuSpzOAzt/4e+RvJn5sVCxrqpeS0MRtWWo4VYZu
	a3ik4ahXUJvc7TOcsUO1X4OOwahlJfbZxZZfn7YceYtMY3rONs1ADaQw/Jl6nxEmAmF0svoXh2M
	4S+1tIad/krB50P1eIhd1pG463akIPgeTeOeTUHzTLV/lwDRvvWcQpZ11QeyHnTOA5lpqCGWEMf
	2lFn7m/YZB5IHm7WNgOWiXjFFETpYDSli41w==
X-Google-Smtp-Source: AGHT+IEFnf9PMg79v6R9fDoXMzQIf74bZGJVD4+Ha5ciCyMz8Oy5atWDpuvQVx3VoT/LsL8PcAh2QA==
X-Received: by 2002:a05:6000:400f:b0:42b:3c3e:5d53 with SMTP id ffacd0b85a97d-42cc1cedbf7mr23399794f8f.16.1764187778532;
        Wed, 26 Nov 2025 12:09:38 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f49a7bsm42155216f8f.19.2025.11.26.12.09.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:09:38 -0800 (PST)
Message-ID: <36c089f2-1d61-496a-845c-2b7adca34249@gmail.com>
Date: Wed, 26 Nov 2025 21:09:37 +0100
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
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
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
