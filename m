Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77B635E926
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 03:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783654892; cv=none; b=eZbysqs/rAQz3t4xnGsfV3vnwwfUwQlxjheBIciZCI2nVeMoUy5e9C9xMybAIVJNuiiSqOE//YhJOEJHL3LYguFqpb9ltAWNrjh+BymxuRHuhScRNgnMVXfav5Jia+4b+4vgjtkhM3tV/M6iczNY1VELEAvuIRKslVc886U0GmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783654892; c=relaxed/simple;
	bh=EOQm+BtL9bOArCL6CyGZBCxGGL0wEijkKEZh4CO61kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pvr8ADSbpU71G07MS+CTNOGxZDPBRGGQn6r/78sWb8xqfTAkSA7tRQ25nE6moL0FyGw1qjLZJCkICvWFwTp71auHW3RmR7UKdCdc49vH42wbtC6qJfkN32XFNJtigm6QmOs1Owhq8eWhGqzLkNusC+yxHR5vd7iEuVjwoy4QiKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvU84y+H; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvU84y+H"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8484f229529so314145b3a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 20:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783654889; x=1784259689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufAmwX9w86dBQWzUCT9wjAY61IKDWbukKM9VbHOOlNA=;
        b=nvU84y+H813y6tE+Xrsdr6/6Zv4VL8nJl2cYhj2wJlsFSohEM9KJoms8aVYuZxAL39
         u6v1MfYcHHpaz+cgRTdaEIaXldx1WsQm/3AdoLud4LUDYAxLOchjE+RMlsTYmd4jpBO4
         xH23t3aQCJzx0XC7gJsM2CFRLxt+L3Z688Ki4BTNos3ggOTzrMoMTyYjNGOgdfr0bc3t
         TTU6ALJLFxWCfZBA5k+8AZM0sG2FiSEfKKtFRs0A6Wv0hM/uaH31i0u23RpYg69a1N8Z
         pr6d+/ucZFTQUxjvYCRPX2qfPYNiXB4QDz+plbAvMB2vaDcwl4KkxWq8ICh6teGYWa59
         7Ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783654889; x=1784259689;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ufAmwX9w86dBQWzUCT9wjAY61IKDWbukKM9VbHOOlNA=;
        b=cQWRe1j1XPftshR1wJwuiTJShHcULwN3u7J73+nZDFCRWQqJqE3TTAdktIhHltbiwa
         ftILVwXYRgX3/s408PGdGT3QnkJRLCSt8c7bxkVMFTfJDKrqbj5DXWws38Dpm3syj39z
         FsgwGvjmBoKYrFpXBAGIzxFX4kgC+XUVq39mMZTV8AAlSMRhSWxuHswZFhYN1QOJIpSB
         DPBgY/ZSDhIUlC7uloWgSwdWaakzDNiRBdBQBBfEd6ytasMQ2yLjcmME/kEdD5nUFPs7
         yh1EujWyOAbTVis5G1/8drnS/i4e6InvenfyoUtvC6spLteUOS8NE1SAmSmanDKWzgAK
         rqgQ==
X-Forwarded-Encrypted: i=1; AHgh+Row6/CPiV4nciIoVVJh1uEY+35SjdKLlfICj74owNd1P9LmetEbVeEJBISqd5PuD1cLmTpWTPUrulDbFnNIFoBsAX7n@vger.kernel.org
X-Gm-Message-State: AOJu0YxElcdZk0FdQWjqo9vhfm5VO2HdHwREpEHWyOsoesNGZ0eczEqq
	sL5wOZTRZUHRVbGZYcbuSbe+AcXEuqwrAjGXQZKvvCQ/5jdrW9/oE5Kv
X-Gm-Gg: AfdE7clEUeA0fmkGVSVCR9Qid3fuL1XldyrFrSH8+jqIlSCmcOmvudlLc7LbOiHIl6U
	eDgPLcah6YVYn0ILJlSz+cAsw+84lVc9QTaoU36HGLcz+Qf8I3SX4Z//dauX0IBHkA+tD1Xusvv
	FJ8yxwiZHvbMxIIBE4AhEqRmRzgoRdmLm7wL/LzQoLquNKYKVpl8aAJdyluGnuPgxWn5ZO5mePs
	f+YItwq4nH9JaoJ2BcqeiXNBqVt/TKJXooQyf/rA5QJJ3zRQ+XyfZ08GgZXY35EP+DK/D5Lc8wj
	GpHfBlrizHPn3YfkpzXmC5pEAZeu4/5uli76p6s5S9U6B3m5uAymCjGjr+bEE7fScWta0SzRJk9
	H4HVqVDmjUkuvsBWUvaOd/J/hcn6Zm3UHJq98bTkTVwXJzzNyejWqvuNRSFkUx44=
X-Received: by 2002:a05:6a00:14d5:b0:847:8f68:e8d7 with SMTP id d2e1a72fcca58-84842eb8303mr9230487b3a.8.1783654888600;
        Thu, 09 Jul 2026 20:41:28 -0700 (PDT)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6ddc974sm9701862b3a.60.2026.07.09.20.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 20:41:28 -0700 (PDT)
Message-ID: <1cc103de-6646-4203-b7ec-c55094c01f1e@gmail.com>
Date: Fri, 10 Jul 2026 11:41:24 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] platform/x86: bitland-mifs-wmi: Merge the function
 of redmi-wmi into the bitland driver
To: Nika Krasnova <nika@nikableh.moe>
Cc: Armin Wolf <W_Armin@gmx.de>, Gladyshev Ilya <foxido@foxido.dev>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260709122337.17417-1-qby140326@gmail.com>
 <20260709122337.17417-3-qby140326@gmail.com>
 <20260709160749.3178278-1-nika@nikableh.moe>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20260709160749.3178278-1-nika@nikableh.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 12:07 AM, Nika Krasnova wrote:
> WMI_EVENT_FN_4 is missing from this ignore block (the old keymap had
> it). FN_4 events on Bitland will now fall through to the "Unknown WMI
> hotkey" path instead of being ignored. Looks like an accidental drop in
> the reformat.

My device never report the FN_* events

But them exist in the C# userspace driver. (Might for other bitland devices)

> This remap runs on every machine, not just Redmi. If the firmware emits
> a CPU fan-speed event of 0 (e.g. the fan spinning down), it gets misread
> as KEY_REFRESH_RATE_TOGGLE. Could it be gated on DMI rather than on
> value == 0?

My device never report the fan speed events.

In the current driver, the hwmon status is implemented in a pull model 
(laptop_hwmon_read) by wmi calls

So I think the unnecessary events could be removed.

--

Mingyou Chen

