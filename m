Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FAB3A29F
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 May 2024 17:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716658917; cv=none; b=iCW+K/c1vBaHJMOnHAt0W0Z2bhNI0clTTHeWleYq3OLAIo17RaZIRi5VdqdpVHcUft+VV9jQCwwhKEiDIMvs6joZN5y+l3YoKABcm82VzxIy2wiq0GhsKHDonqwz8M7GNe8VxV4IZyENRh7T076hH33/go+JBCFpBjdo2XVfH98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716658917; c=relaxed/simple;
	bh=mCXCdTK4JqtWMdWvUjE2mj6KEBCD/n734XXHVSbPopU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxbIAcA2ZnePe7wc0IMvL9HsR5gaivxWDOZgNWXF8rZFBAHNVyUqywT0FNJXE//FNlBBBLrSHDp+6mfyfSUtJGyliTkyIkWVoAcFFzFPSut7dAIWclRnH4/aRc1lwNcZWyjnMh/Z5VJ3F9hrkcktwKT0ZLoCzrrWxATAL16zlSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGh7daXY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGh7daXY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42108739ed8so20913935e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 May 2024 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716658914; x=1717263714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DzAeW/gylIRl0xQo/Ch3npQg+Ema0K/2Ppl6GS4tzjs=;
        b=jGh7daXYu5iOSQzMc2zSCiwKDyV6m9CnJvS8D7IjJjDwX4qLWEpKpp25W6II48XW/m
         ss9AjWZr3VfcSXCsWXMOV34LKh693p5DendMISJWqt3TCH64ykJ6nh/I68kWgYlXl0Ca
         F8g9xv5E2Wevt91d0Q91vK8NNbHtKO/428bkb/nD8Kz84z784KZkd4UQJePcyONyo19d
         6bz9LgZSJmmy/iMonymHuKiGxiTdk2VcXtcvT9qrF2cOkRNv1e44/HPF6KS1ek2EEntB
         txTavULKJgeH53kyfh0Vo8mNhBzv4Fo6SGr/GurhOrF+x4LCrPAzTiJdPtyp1KWKm4QE
         lpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716658914; x=1717263714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzAeW/gylIRl0xQo/Ch3npQg+Ema0K/2Ppl6GS4tzjs=;
        b=KO/UaRqX6erixccfCHTsKQ11lHnqfvOWpD/lh/l8xUemaWPA1LH4i26Rr3+TNJtEMF
         PAQ0GRAaj/WoMa0cWILaWitsETSt0CJ3iI0OkaEojRqcKgjxYhTMBpm/wgyn0Lnedhky
         i9fLmp31FYatwpU7N+hhnbunZjUR+UsHUXFvm8WLhg5lgcx5XtlUA8KmWeCoDnDeN1rA
         /+345Rbg30tXdFlzlKaD/Ki8oRTdzeJkbOkDwhiLUV7Q565jX8HsZVAA1QpwHjx78M0u
         lVX2Dz7dfuGMxm6gBXnlmESb1wHnZVGx6UH9wn8vYTptXZZy+QPEJkxkcJ81jz3pUwli
         JHxw==
X-Forwarded-Encrypted: i=1; AJvYcCVGle8l1PC9XQKslVq6ob1P0rgAO+0+fyfrhhE/Db8K3V+0jiHhRhV+58RJiZt/xjpUYbbGOcXESDt9+s3GD2xmsoZXpQyFSDUxSV1FL/rYcy4DUA==
X-Gm-Message-State: AOJu0YxZUpQX4FGgwg9zFmrgUGJqGBOk/zXsjBgcpPnEI9ZJZVTv05Sp
	r13kK8Dq4OErsKH2pnzvOgz/aZwogBv7Y4hPgnYbH9jkxKQqrgBo
X-Google-Smtp-Source: AGHT+IFYUKitWojCHNZfdu+6cZlHsnxze8zanfSJilBllTRM4zNc9cl7JTK9EbGhqZIBFYHNe47U8Q==
X-Received: by 2002:a05:600c:68cf:b0:419:a3f:f4f6 with SMTP id 5b1f17b1804b1-42108a3a6c0mr56529465e9.8.1716658914423;
        Sat, 25 May 2024 10:41:54 -0700 (PDT)
Received: from [10.156.116.203] ([213.55.225.157])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100fad7ecsm87374345e9.36.2024.05.25.10.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 May 2024 10:41:53 -0700 (PDT)
Message-ID: <f6d5675c-7215-45a1-a99b-f811ca0c4e27@gmail.com>
Date: Sat, 25 May 2024 19:41:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20240522164807.28936-1-hdegoede@redhat.com>
 <Zk4pC0dkmTEcS_qA@smile.fi.intel.com>
 <4c14d61f-dc0c-4495-a74c-fa0cef4362d5@redhat.com>
 <CAHp75Vex78gE+e8kaUvvNjVUtkv-3GGgcMFZ3tFFqK49WRQDrA@mail.gmail.com>
 <376bd875-e4ab-403d-9265-e6833ccb31d9@redhat.com>
 <CAHp75VdTJbZru5M4d81dU2Wbu4=G26OAgVksFF8H8vRBWHeDfw@mail.gmail.com>
Content-Language: en-US, de-CH, fr-CH
From: Gregor Riepl <onitake@gmail.com>
Autocrypt: addr=onitake@gmail.com; keydata=
 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
 DMcsQA==
In-Reply-To: <CAHp75VdTJbZru5M4d81dU2Wbu4=G26OAgVksFF8H8vRBWHeDfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> And the kind of refactoring of next_arg() you are asking for here
>> is way out of scope,
> 
> Of course, of course, but why introduce Yet Another Parser to begin with?
> 
>> so sorry but I don't plan to change this part
>> of the patch.
> 
> This is not good.
> But I have no power to stop it, while being very sad about this attitude.

Andy, I do agree with you, but what would you suggest we can do about the situation?

Write a generic parser that everyone should use from now on, and then migrate all usage to this parser?

