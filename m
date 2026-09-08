Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20763378833
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 05:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845216; cv=none; b=AgmqNL59KpqxloVIPrsVFO59bsbUrVs8DNP2fhhXTSSKPeCRMktEPqpv92lZxCeNjFMU4dgLQT3FA9lr//ekm7B4j7kG5ZQRam/fLUZIQk6LQfe8JH2I/Amolfv3E694580rJANmLDFbXVN9Q2oQnORvdlIE9cbFFWxD0APnOuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845216; c=relaxed/simple;
	bh=ZIRVEqjxXGVRKDzZh1TGbLw59T9G6VckCt7458JkZCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUoYp3TlCguD6LDk3NpbrQabgz2MrnUqSQfiPE/xX2q0D4HYj5Nk4l4Ts1vurIbhj6qKAzsfQg8Sn1ftwppDTIrISI9C+J4FiBz3VVBz1IoSjWwIR8d1o81cvk4u4vV6uz5FNfyuAQpJQ5RGHg11aFIbD8AjTrRZ3yEB7qXzrmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkMuKH5D; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkMuKH5D"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d91ded8174so32318325ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2026 22:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845214; x=1789450014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1W+fM/Wuxfg9AV61/48GxXECYU1wlppMPQetunuyOIs=;
        b=UkMuKH5DLx1QhBCXQL0ADKpiw6NCr49GIdGMliXZKWyFc30tkMZ/Y9z1qanozXWTOR
         YNlfYX6iZPh5J9Jx6UL6nGotIMa/c11eUgg0oibIIR2XZSXVPgLWWFsZUINvByi7VQBY
         W5tsAMUGJ0SohkHxTmvyDlF6DrtNAmRo+EZMCh4LfDHfYJqNA+JGeTOeSKaVcDMquCbd
         QyvmLgP0zqLrTb3pay0yYn0jMT8uJLn9uzZ9tj0dT2YF7VbHeaNbY+QzjmbERiEUMIVZ
         ohIQrbrXRIDeRDlQx/6BK/zyrkFcbf+xzzJFFGXLOUJLi8ye5eIhAMgnoHxX+wZMAa6U
         ONjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845214; x=1789450014;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1W+fM/Wuxfg9AV61/48GxXECYU1wlppMPQetunuyOIs=;
        b=Qhn5E+u2xvhWL5TrNOo99M3D4TKg0tPyXuMIMnx+hYER8PCOPtZOIsaoYvfxGZYmSZ
         E9zlugdGgTmj8Tp/xH6DG5JaZB/nGIpV0X/sGfjnl/C0wCsB+h38CU59zOU93MDyDt/N
         ZS45jybO/TK77IwOSY3wigAwQpsPHbMWGW+Z/h1pKun8pLOy7NWPggLQIX/qWcupOaSx
         3qpjD+Mf+OfWuaDMgB2K4/4zlxA70OmmtT2WfBPh9mnSLnoMlx4T+kCRj5MxGdbNKUU2
         sUNHWpPMReIboOOl04Eyh53yyL5b3oDgKawcd4UqTeQcUAm2BE3of06Vwn5O/aKxGRaw
         Ascw==
X-Forwarded-Encrypted: i=1; AKwUvByNpd7WtyCm3Act6n2RqwrBcoEt7U054wimxEW5B/lTJr5tHSxazCa94q3BWIWu0WEUPxZZ3g/G1BsZFtKmJuQcoGcL@vger.kernel.org
X-Gm-Message-State: AFuF++n+gFuj8Z4LowvfC3WapEhZsxRToz0YWOrL4DFT9UBhNNuBtNAv
	CMKY5cXWT9+d0dPLBlMyLLyyFrA9OC4YgIhc17xg0BREFzNYtHd0F5Xf
X-Gm-Gg: AYBFou3sFNQ9vR/RY/Cf/5FhO7QC3fYZsY/4ACtYXzl1UKnN5WtYIyl9GbADld8+p3G
	uIkbOTzyAVI9oUGmJnV5CwvmZLUixWUVz/l2wO04azVAgdHxV+DvkK58LHc0Z6J/+Q43FR2GtRA
	97AdeigROZx4HN0EzJIGF1oRF+CN+DkAXBsuUf7DwKCkc65DmEymmP4ue7Oy2w5GhcAcAa+rmav
	gnwcIIESvsjM3414+aWU+83WyxAeeFqyTrqxduV+ePOFL6N5TKmG65RQ6dEAOWklrxWtRYtPpEC
	J5Ae9AExPBJ+N0eTJDvXFaisNuTMOgW/gFNfN+LnTq/tJOCRo9+ZAmGfFr8hdm2Gaz0ELDRLPQK
	75zg7E6PbAHfgPiSYS0bZt8vyFcDL4kqBT8f6zE8n2aHKqFxIolBol/A5D8ewbrVE1tQR1kLDEJ
	Pbks94NCgvEfeARi8o9YRsxILtSvpfZgyHueGbBoXModZtbtdFaadUWCOc8zlYidOIYcBui2n1q
	gSPjSYing443h+rxc08am9R+zlJSSID9qxxqw==
X-Received: by 2002:a17:90a:d004:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39b26273267mr41950559a91.13.1788845214308;
        Mon, 07 Sep 2026 22:26:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b58187a9fsm4339012a91.3.2026.09.07.22.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 22:26:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1b2d3cca-09a6-42f7-93b3-ac1a2934d301@roeck-us.net>
Date: Mon, 7 Sep 2026 22:26:52 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] platform: arm64: qcom-hamoa-ec: test sensor and
 variant handling
To: Birk Skyum <birk.skyum@pm.me>, sashiko-bot@kernel.org
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Daniel J Blueman <daniel@quora.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908015650.84401-1-birk.skyum@pm.me>
 <20260908015650.84401-3-birk.skyum@pm.me>
 <20260908020711.ED17B1F00A3A@smtp.kernel.org>
 <20260908021844.42118-1-birk.skyum@pm.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260908021844.42118-1-birk.skyum@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/7/26 19:18, Birk Skyum wrote:
> Thanks for checking this.
> 
> The test client is bound to the I2C core's dummy driver by
> i2c_new_dummy_device(). Unregistering it unbinds that driver and releases
> the managed hwmon child before the adapter is deleted. I reran the arm64
> KUnit image on the stated 7.3-rc2 base; all seven cases completed and the
> guest rebooted normally, including cleanup after the sensor-probe test.
> 
> The dummy-driver binding is also documented here:
> https://docs.kernel.org/driver-api/i2c.html#c.i2c_new_dummy_device
> 
> For the hwmon placement, I kept the small read-only sensor path in the
> existing EC driver, as huawei-gaokun-ec does. Guenter and linux-hwmon are
> already copied. Would an auxiliary driver under drivers/hwmon be preferred
> here? I'm happy to split it if that is the preferred direction.


Your call, really, but it is all or nothing as mentioned
in the other patch. Platform drivers are not documented in
Documentation/hwmon/.

Guenter

