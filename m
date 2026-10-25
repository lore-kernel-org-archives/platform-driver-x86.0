Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792931343;
	b=YMnbyzuAx2e9Hg3kyUEGzT4Lq81N73MYUqh3aHeQbCW6OMWEdkGB3BY4e3Az773xldOp
	 v9hwFmHasqX44yxPrXO/ul4tY2jv1y29UaTnP+JTJo9WW4XXJNGWBpvSB0iMd/v4i1vrj
	 S4xupDc+I0Hdv+6hWErLT9e1/T3Y6gn4D+5UCThG0dQRb2XH0GuvuZ2p21WSAfQagrOjo
	 uU4q9Lehecdnqz2j4Rv5jPingMIxU1ODQKhsi0kBMLFyRR56AM3Sj8zwpxtqhdPiTjNsA
	 06YOkAslOb236VOatnJ2Vu8vbip/5HJIaAl4949wk6yxSp2mR6Xx5XvRdioBIvgDjWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uKugVXcJh0MRzQIL6MmtXefuzIWu7Uf4heR2DCrTxd4=;
	b=OJY8MUs2ggNnrPl00ZP9xxSffW83SU/sDYLzV1ZGUHx8REwblK/vKrvu5hXQjH91Ucne
	 LBddKaz16cFpPeTWpXXaFxP7gtAMLqaKPy9awweiSrQwA5XuZ4RmYOLDBRMWzF8qJFUDx
	 ZcMAwl5fB0Ik7EaPYm0Y8Dp9wWWYMJZ15v0XEhY+GQq0Ch6tvYVLHdn6FJ5iMNexZV0tW
	 96VV5Uv0pY2ldOeNopSQAgRGp3F4PNIfwKOqQP/1qCpdV4rcftR+w+8EUCiHG8VBTyVI+
	 DgJgffnu8M7zbwibnNj28ylwtYZgw277KAgIe/DDtr4dexZuer0cYPBU2zAXU71Ps3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D5mjb4Ip;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DA8606A31B
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 12:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75DA8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D5mjb4Ip
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso8447865e9.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 05:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792931342; x=1793536142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uKugVXcJh0MRzQIL6MmtXefuzIWu7Uf4heR2DCrTxd4=;
        b=D5mjb4IpM8AC8A5Okq6ba66hR2VbrYbMsnkqjZipacvVi46QVJukQYf42Amb59yHX6
         XtrI0hVCVyxHR2uTNGSQNM0kvHvKIoKWteAY26thpKhp9J2iVlhKzPU+gPGDTqw3V1fW
         kFNuhDMTHcj9WXUOinDrA+HFYDU8gKHpurJr3n1ZCK+5pXMggcis7fU1tr4YJHmQCwJW
         gkYT7B9sThfijanRYoRqU8bTMEiEXcNRvTkRy/g3aSSXBqbdSMr5mF8LmmUdIrPKBQoJ
         hhriNSC+PJ8HF55UiVFwrHrAYknB1XZvUh4LjcQWdUoFkJyFj+Mbg/Ra/L/NX5QVp78F
         r4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792931342; x=1793536142;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uKugVXcJh0MRzQIL6MmtXefuzIWu7Uf4heR2DCrTxd4=;
        b=Jy9IZWnMzxeEQcV6tqx5L7UfImm4+JEuY1rhBBnBcfqq3LFB0/fqkO9pRsl7SqS0lx
         1aj5iz8lz6v+qQfwvrAmX3i7bsLMLAMndpXbiXTXe54oyEzOc4SaC3sIF/8bSyMebZTn
         UrzNEkYwyPyWq0YFaU/ONrIaioT9QOfl5tbmzg57zNCofHu5o4XQNMhYwzXfzp7ZpAzo
         YAO38mWW5r9BbP6soQTXUU2At2M7zAkz/TQ+nOYWfy9ftw2IMTIaJ0BJLqu3hRlDF70J
         2TyFlZAfsljlqzM3cUiw/H51rY86osnQI7qslpcN0tk8UX3+qVX1yjvN4Wa6TZV7GH/f
         JNZw==
X-Forwarded-Encrypted: i=1; AKwUvBxrQcD3LC9+HVNYR4kjSvOgZSokL2S+VtX/qR3dj3kvlwGmBNARneQZT76pBTs/efvGPnPDA6NhvDhRP/dBnv09mpg3@vger.kernel.org
X-Gm-Message-State: AFq9FYIBsp0dZ7iaOSQFwftpb9WAifehpAX67mPbXrQ7QgWSywTYuPLH
	T9dBX/vzTXEKeHuJAqEW4hAQHRjsBcSktTdUjFomRgYNyRkH6ttUGtYD
X-Gm-Gg: AYBFou3D2eYiCYFiC65HoaqTVa3BIpK/3Cvr0ELhEtmxGgDOvveSp3Pw0mF3iPGJclR
	0QqJJMDAPh/aRGfTAT2M2ixoX8xafvGhewerVCgouDBCf1T9oGIXMouSwTamDkx3tNkk2Ap9aMK
	zmMsRVt622gSaa184sdJU5gUBYRct8p8PG/badrW21Bq9QNAJ+tMOhKfcEKZFDLJIQLNdSOdQl3
	r+W/Arwj8gzZqbcfMniASFISbeS4x/S0dLCiAabXGlJ2VBvZDf06a28mvIooF+y9LiiWAqH5LIX
	tlH+tJjm6RvIJs0ivcmg3XDsK3uGdNcopW2hmlnpvu0k/DMs83mhthQBfDU2fvNwZEXDp5NX4yg
	Ka29/ouG8SnsEwkbKZ0SxiGDIv1w+slvUA+3lSfV43U8I6xjdE1coP3BAxWm8yd+jx8pVPQeJfo
	B0TJrSW0SKWbf2xMGOlSPWSeYHLoPc3SwpmANs+lYCjVbRsMOFYxypXLhyQXeol22vfpsEmPKHh
	6/RJGMadW/zS3+3uHLwIQheJwcQZdZiRbPy1bEuPp54f0GBMSRnZ6kLdm9E
X-Received: by 2002:a05:600c:8012:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4a35acbd1femr66248445e9.14.1792931341688;
        Sun, 25 Oct 2026 05:29:01 -0700 (PDT)
Received: from [10.80.0.99] ([151.95.52.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm120163895e9.14.2026.10.25.05.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 05:29:01 -0700 (PDT)
Message-ID: <6e029169-62e5-48da-91cc-8f653b2acbcc@gmail.com>
Date: Sun, 25 Oct 2026 13:29:00 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: Clamp keyboard backlight level
 from hotkeys
To: alex@bogusta.com, Denis Benato <denis.benato@linux.dev>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Antheas Kapenekakis <lkml@antheas.dev>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261016015117.32174-1-alex@bogusta.com>
 <f71595e8-8553-4e18-89a8-cca93cd65f56@linux.dev>
 <Lw2-T3d0vVWwlA_msvm_zjVUms821VDv_EKarQwaugY0E6UtkHDIuZ1a4UQgNeto_RnoB2xxxk43SWSepIWBSKdvKD36G1ss4G-TkuyZv4w=@bogusta.com>
Content-Language: en-US
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <Lw2-T3d0vVWwlA_msvm_zjVUms821VDv_EKarQwaugY0E6UtkHDIuZ1a4UQgNeto_RnoB2xxxk43SWSepIWBSKdvKD36G1ss4G-TkuyZv4w=@bogusta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/25/26 06:46, alex@bogusta.com wrote:
> Hi Denis, 
> thanks for the review!
>
> On Monday, October 19th, 2026 at 5:52 PM, Denis Benato <denis.benato@linux.dev> wrote:
>
>> Is the change of type really necessary? I think clamp_value does everything required already.
> Hi Denis, thanks for the reply,
>
> clamp_val() without the type change wouldn't fix the problem, as
> at level 0, led_value - 1 is an unsigned type and wraps around. clamp_val() then clamps this to 3, setting the leds to max
> brightness
>
>> Honestly I don't like the change of type... I would prefer something that prevents the
>> bad thing from happening without changing the type.
> My reasoning for int was consistency, as asus_hid_event() and
> do_kbd_led_set() already do this arithmetic as int, and the comment
> on enum led_brightness in leds.h describes it as obsolete.
>
> That said, if you prefer keeping the enum, one could avoid the
> wraparound instead with the call
>
> 	kbd_led_set_by_kbd(asus, led_value ? led_value - 1 : 0);
>
> and keep the clamp in kbd_led_set_by_kbd() for the upper bound.

I see where this is going: either math done on an enum or an int converted to an enum.

I personally like neither, but any of the two will do to get the issue solved, so... If you happen
to make another version please add a comment somewhere to outline it so nobody gets the idea of
making the code looks better at the expense of functionality. Either with that comment or not:

Reviewed-by: Denis Benato <denis.benato@linux.dev>

> Thanks,
> Alex

Best regards,
Denis Benato
