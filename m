Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2BB315D4F
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Dec 2025 19:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766345457; cv=none; b=Z6Wk3G+7L8wpDdBauMZoQDbayMpz40eTbTpqICMXPH/1q+0GpRpm85RJClrEvtBZfpSa0U5oA2kNua9WB7G57g7/yNLsWjrDCPToxnDfGKBXcvumEuTSud57gixSq6hMqPsqG1BjBsEL8uuVqEhoKLon8WS3lurHnXM6JLvNtnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766345457; c=relaxed/simple;
	bh=nymvoDYiRG+/a9TlEVZljuFk+8qNO07pZs6iJ+msjKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UrgC9d2vQuXbLZOujiyEFUOEh3WzoGBowE/n6ZsntU4BlhJTJEg6cd6P6DA1WxFqzZ0EbjDdjr1ps7/m+guMGfPTQG7K2VL7zFEza2amDfgwyi25SOjB0GHfc7fevtDm9emODABMVgdizb61GMCLUaT79v32OtpAey5KLvGPqv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGI54Nmo; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGI54Nmo"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fbc305552so2710348f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Dec 2025 11:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766345454; x=1766950254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+cNgIKYsfD3+19gOiM5zXD/eV1gJa4oVMdFD5KhhkHg=;
        b=cGI54NmoJH0AvbuSWLq3QvXvctqfRWuEbFP1Ds89qXykR1JtNtw8sPtZNTx3pKIeCm
         GhZqDHL6RUWYhQwGq5Mv35LOMqJ3nkNZZ0BKn2FnPzrOGc5t4B+eqlVouTJzBt7+klnv
         tXGflWep9SZBqeU6hhXqKbwH9qlEQG0oyhW1TjtYwm2U1mDoDmgq4nLXCzonobjXZ2QD
         dvKGxRXJedWOAdb/gufeKi715+6kq14c0QA8Hy08AAzzXSaegje9xGKo52rwQFxZldY+
         w1kTxNspSbSJXOwvR0t31JK5RzIixrslYKspxx80jfJktd6e7odXWH6qnvPam+n5V6Nu
         KtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766345454; x=1766950254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cNgIKYsfD3+19gOiM5zXD/eV1gJa4oVMdFD5KhhkHg=;
        b=DZtZaerUVh5RJ1RpoCD+rKMCOKIJ2F/KLQE376L0kLmKzb8ktGSFfdDsNZOaoPoWvD
         Gkp3jLh2yC9cg1QzY/Lljyh3cBK7U/MKjdwXLYcxATmgZ9i+047FmGm5v9wGMHeOHxVW
         ztBqD9HgNITa+FUglNlU6Taji8urCqWr7ayTovYjwIApZzUR2in1IGSVc64mxEd0NEEu
         DYtMliowsZDRvz0ZV0LYFcAtAWADxYrTbJcFYMXNJnfDj2pJpeebRffxno9tZt2aGBZ7
         TMWzTgJRpdYa3OqMA/oykZzp1s3racalhLYpLmuiro9+M+OlbzSdeHFXV32b2f4Rj9QC
         b3TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzSrDs4nnD6519iYKSHfukKgrBSij2/VoEaJGJUwibUB3klLkvdn39r+loREwh4jHg5ee27TiOslx7CtN3drNlzncr@vger.kernel.org
X-Gm-Message-State: AOJu0YxBnNUai3kp8GqdW23w/XqOrLZqalavRM8s76kjm7Tni12f56QF
	1eoOWDXoNH5Gw9CmziRdqeiJe7AUUN9WjZqh4IzdBZZSZ+d2W8VNF70U
X-Gm-Gg: AY/fxX6DClCaJbEjH7AP71n8IJesU9dnDJElL86oUrpYHHj6CJ6AmKcG3wfgTWvTCv9
	ZAjs68CYVamCCNVStm3D7OGeWENT4t36GooYybfECRq9fUKEB2eD7NXF4Xuz83Oinav1HG2kgcr
	+smqtqPZEFs9PosRb6Go+zpoJ+vP6fEC4c7AK0FSs6tqfujHjIb8VxtRtbPn1L+Wi0/cSq32EZC
	Xwq0+huLdWgmQXk8bgoVEpxyLat1PJVS4MdMwDDckttsajUUHLM+Oe+XZVpG2R7Mg7AiwIc3IYE
	B9NoGp1PnixC1TAka7bFr6NwM93VQdf+O9+CVTJeQAObzniV6t1KK8v54mwoO5yTyTIkLRLgaks
	aQVlDIZr7wn05Z0TjssmxxkCJvwiyVodB74IXEcg9tzJwA/GNhGkx6VsCF7vwraAWdVRcGJ2+f3
	w+OdOw/bZrHANDMSYXIgkUc2g=
X-Google-Smtp-Source: AGHT+IGy2hUZ5i2v2YhgD8pXmru0ulZzxxincAcAZsPuYbo6PvlVgXnqscwgjBQILkZYZNffitLDGg==
X-Received: by 2002:a5d:5d0e:0:b0:430:f58d:40df with SMTP id ffacd0b85a97d-4324e4c7132mr10409116f8f.10.1766345453686;
        Sun, 21 Dec 2025 11:30:53 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa2bdfsm18112607f8f.32.2025.12.21.11.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 11:30:53 -0800 (PST)
Message-ID: <1c2e0f32-8110-4bf1-9c5a-e4d6dbfecc7e@gmail.com>
Date: Sun, 21 Dec 2025 20:30:52 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Add keymap for display toggle
To: Tim Wassink <timwassink.dev@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20251221181724.19927-1-timwassink.dev@gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251221181724.19927-1-timwassink.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12/21/25 19:17, Tim Wassink wrote:
> On the Asus Zenbook 14 (UX3405MA), the Fn+F7 key combination emits
> WMI code 0x2d, which was previously unmapped.
As in "unapped scancode: 0x2d" in dmesg?
> Map this code to KEY_DISPLAYTOGGLE. This matches the behavior of the
> display toggle/projector mode key found on other Asus laptops, allowing
> userspace to handle multi-monitor switching or screen toggling.
>
> Tested on ASUS Zenbook 14 UX3405MA.
>
> Signed-off-by: Tim Wassink <timwassink.dev@gmail.com>
Thank you for this!

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 6a62bc5b02fd..a38a65f5c550 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -580,6 +580,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0x2a, { KEY_SELECTIVE_SCREENSHOT } },
>  	{ KE_IGNORE, 0x2b, }, /* PrintScreen (also send via PS/2) on newer models */
>  	{ KE_IGNORE, 0x2c, }, /* CapsLock (also send via PS/2) on newer models */
> +	{ KE_KEY, 0x2d, { KEY_DISPLAYTOGGLE } },
>  	{ KE_KEY, 0x30, { KEY_VOLUMEUP } },
>  	{ KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
>  	{ KE_KEY, 0x32, { KEY_MUTE } },
