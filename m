Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F099B3C2BB0
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320594; cv=none; b=AlPQY9ejFrZZRPXaNCU7d8O3Wc/tR3S2kl/c2RH1j31rfj/1kXWTdGpBQe64Yk41xCL2pXOtFn6Wz75Fc428iDcsWEXbpfaeKeducuWPzvk2kOTXNS4OV4Gw4I51Mj5UGtQcEQB9641oUQ8kuf/XMUH1PMSPSS6g+4VRoB0YZG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320594; c=relaxed/simple;
	bh=jUn3Km5tEcwWRPT+p8Z4osC9Hs+/VTDsSUrhoqXOEd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdW95zlEFenEpkfaIxRS8k0tRPUi2QNYGfayMlX7/8j59jw4YwJ3jehiCN4nOI3dvLkRVSFTnooKtRoM8HqDefGwSBeHVeyGvoM9IWyd05xVxiKjBC+h7QwbfGkGApdYFSitw68xSdsX5O0RN3yohY3S/M8UhX+cPxDyWEB1hA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WgmSa8yY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WgmSa8yY"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15b1da6b82so77540566b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 03:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785320591; x=1785925391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6X0anmnWBHgte5uXpHd51yoFKqkB+eCKd0+unp4Egcg=;
        b=WgmSa8yY9mHwuBRCc9IkAdIIJ5aZtBdwuZaKFUschVxbX8N2iXAURfC+CC+yo4Mifn
         tGyAWvVD5IDBSUzVYq4KhT50ZdDpHdBLnDJMtDUSkwW+FlYuSbaPby+bXivEo6HPtnOo
         4uBqtlzvm2lCH9ZHDa6YtJafIq0GYSKU+c/mcSWJo6hwEUUF6H+TmoSPixDSJZvmpBKO
         2dv/edXXqax7HExTfd8BI4uStUVEV5ny6yS8xzc4JLAWX6SXDlrz0ji0RYGtFU7RSIdW
         Pek9p9Z3NH/MI/x2HWhh9Lxo1zDb/eYKGw+AclLZMc9zWmjsql3uDpVXyUh1TPWmlYvB
         n7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320591; x=1785925391;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6X0anmnWBHgte5uXpHd51yoFKqkB+eCKd0+unp4Egcg=;
        b=sebqoBJCu2o0EKhxx8jGQYUw/asBJhs9YxuGiq8mUi2ECRcD2Nr8/NP9I4CfRgFPvD
         X7NLgBINMADvBgijWW630LGINFS1IYW9rLNA9fe1HSqA7B6elgSZuphWaq2ZhYY3UN0w
         w2S+imHLefzxehdzdE5xrgk1n3zC9Q7h7henn1IsIeuh59Z8IjP885o2a2ZnkxIDSC+7
         6T5s9COWubGg1a/HUU/09Z5Ezc7LQNyMNu2dU8RAj+LPlCTnKTzVViAbt8S5QtnAVQUT
         FbqjeY/zAIQ5PND1MEGKjxWcTC4t4E5FcDssRhxyMO/ejjkIePVpe8zDLHU59optnw3S
         Czyg==
X-Forwarded-Encrypted: i=1; AHgh+Rp92q6Y+jOUhySTuGJHoCHwaajZ2sKygwDLul/A46zPO3wksZuBrIdGslVFLMg+8UsnoSeiVqjAEmkXBrV1/81KZYZM@vger.kernel.org
X-Gm-Message-State: AOJu0YzTo2eTdJRvWqaR+epT5JWs7BRnZBp9+0FoSfDf7Qx7WOfvcZNL
	+OK35TAKMYR6WGhTSYbF5zbIRGaFXgH5pLNf4oGgI3z3btgISYMPvWXT4nFYRjFkfHM=
X-Gm-Gg: AR+sD10JqvKi8TEm8WV0dSYW2mg20T/m9wc/AGEsREuLtXSoQG/0BTlctf+kUuv0kCI
	YO8WUAXyvl0TR4J2cvf1njhkXKAIuByQp+wEJ8n6iz7iXiC1LkYadOxJNuwe66SBTgtzcZQ8EQ9
	mp9dLw7wqrTsPX/el1nxnoL1pfmmaz3KDmgnKPhEpf60qQyrXdefkHwiyP8BPFbUYRjlQg4wpno
	wmJ/pqWKkh1vx80gok8KFtXdzvQjSrsB+ResGjxu5V1FOc4Bhnq2AdVuoegV7Y9Kt6hPBPiLAtr
	7A+aXXSaWS7XO+LsQ7ouSPzwGnqFPWAdqaiBK0HuGTbJhmFMLZJ+BOv9Ak2LiRTGr6H/uHfd8Db
	gkHtjFfNeavtTb2w3Iy1X3vM+c2sy//TSvXPLT4qwTFrz47FCZkHIJDT3CiUKOmXXpyzV4U7qch
	Yv+TOuygHcYmNOvv3slrRGZA71hWJPqRKqLLU6Rk7vO3vl/lOn18/bNz2KClnKp7P7lNruuwlf
X-Received: by 2002:a17:907:c08d:b0:c16:8461:e308 with SMTP id a640c23a62f3a-c1f721f0d5dmr349830366b.20.1785320590999;
        Wed, 29 Jul 2026 03:23:10 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.24.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83c6860esm95620466b.1.2026.07.29.03.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:23:10 -0700 (PDT)
Message-ID: <b98b48d4-6e9a-4fca-aec6-60cb618a9056@linaro.org>
Date: Wed, 29 Jul 2026 11:23:09 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform: arm64: qcom-hamoa-ec: reject incomplete
 responses
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>, Linmao Li
 <lilinmao@kylinos.cn>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260728111924.4106898-1-lilinmao@kylinos.cn>
 <d1a6474c-68c1-42f1-8d2d-ad5acdd25fd6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <d1a6474c-68c1-42f1-8d2d-ad5acdd25fd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/07/2026 11:08, Anvesh Jain P wrote:
>> -	if (resp[0] >= resp_len)
>> +	if (resp[0] != resp_len - 1)
>>   		return -EINVAL;
>>   
>>   	return 0;
> Thanks for catching this — nice find.
> 
> This is independently fixed in an in-flight series that reworks
> qcom_ec_read() to use raw i2c_transfer() instead of
> i2c_smbus_read_i2c_block_data(), removing the partial-read case
> entirely, and it already has the same resp[0] != resp_len - 1 check.
> That series just hasn't landed yet, so your report stands on its own —
> happy to add a Reported-by: Linmao Li<lilinmao@kylinos.cn> tag on that
> commit when it's re-posted, if that works for you.

What about -stable ?

Seems like we should take this fix and your series should rebase on top 
of the fix instead of the corollary.

That's the way this should work Fixes > New stuff.

Can you add your Review-by/Tested-by and then rebase yourself ?

---
bod
