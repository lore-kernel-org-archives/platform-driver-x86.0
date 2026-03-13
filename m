Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704E46F2F2
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773404258; cv=none; b=lPDzNwKe1CpQe/ql/iBOQ73KMcMaZosAy8E2KOl0hL0pEU9Z/hRhig5TvxmU/SwbZbVCo8Uoeupn628haI4LnIYC8OM1Nf7QH2XQH08rj8QGEtov+YB7lJnFRKJfOhVbCJ3+tUwDWckwtidksf3KU39gWeFhVADyeoAhMu7bZoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773404258; c=relaxed/simple;
	bh=dH/LRUSNBatrGwHvEX3Iy06egEiIiZiFcoxmr7F53lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IU9FdC1dZC90skuQnU3CUX9RdqsUnwIP0jSRHrm3OKsuhcBzteTiPZqYb71jxki1rVGjQ1eUgTUYzgNlz3NQAqL5fKit5kv0ssQRZ3c9QsEpve5M5OaqMniD84s2bwLptjvBWUPi5iO1REIcO11JXMsJcP5M2NI7FsdD4NdrpLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2zuPGlI; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2zuPGlI"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b941bb3e23cso363605966b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 05:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773404256; x=1774009056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3s5B4wCXYFxF46H+9RZgBJPAFEqIaUF6//FgPVVAHcY=;
        b=S2zuPGlIvMArgiJbiTh839YX2dUIZitVPKFFfae4E4KrnUwsEU5zfTDpwC7/yPuxne
         46IoNzj5dgBt//MxZK9J5PVdo97x0hOe90mChE0M1AXFizXkWrPyzt0tQWFUnWdFNnJW
         2twpsABjZgr2XSOC2ytpD4qsYfhhiZnqXehNVc4QteLvDl2UiC71FbcHrpCGGIiYQbIe
         YUNjD+leYjMZYO709jzCqiIxC7jDcuIlLG3XaMvCjRAD07ikJ7lHwOJJ6lkzmoiWkG9t
         s4pE9n+q0NQztZiDV14T5oMHac52F2clHH/12FfXusd/ECoD63K2IuInIVl4/SZuXqEF
         OZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773404256; x=1774009056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3s5B4wCXYFxF46H+9RZgBJPAFEqIaUF6//FgPVVAHcY=;
        b=MMIOsuBnWPEQjuSt/rNlSNLdu8dCaxaeIK3UAOfDLG0qcLGo/BgSsgunznmQiGJQEX
         cMkmEWTqLpl07TB6CvLkmkVTxOC3HVJXEMP+Qlg5CHVZFnsfKua44IKUhNOW3fNBj1zd
         DL8H/Jy/LuIF625GFtGifOO6jc2RKzHgC9eyMjO6kaV3K4FP6/96sgrXv7rj//wQ4gDh
         MIFnGSIdxkrTGX0CJPDbXCYdN1qLwZo7qe/Y4vATi/PEFXGJmOIzY3QZVqBSholjhiY9
         k1f5O1T5Tm13Hk/eCQ7t1kt58wXSNX5OZU+clGap0juV5/a9Sv1SMHcWHBM4CbZAFASO
         ED9g==
X-Forwarded-Encrypted: i=1; AJvYcCViXDLXBWkTrFQ5qc4sDu3FOAq0c/b7tVqemWhTDUiv0AIdGtYoylQhplDBLT7o5oCnB/IvGKsLa23rAK5BNt+eTPbU@vger.kernel.org
X-Gm-Message-State: AOJu0YxiNv7grCe48VIiNdrZwd4zQpAVG3tXNH+mAp4lQgusaSu73spl
	CEm1eCuT2iT2qJ/EEJAF1g42UgTl7Z/v8+WNn6C0yCueExv02OX1HDzFOmQR1g5Pbhg=
X-Gm-Gg: ATEYQzxCD2/v/euIcrG9cSmZYRx1TB8N3N3EASdEfBNfFccEFDYvp+8bIXbB9maxDA+
	GSImjmjH19FCiIlbNIioWsrRm6fOYWJv7Vnw3V4tbKg0WJoAMar10H8lISU+wtTSlE7evzhN5O7
	WYHh2ZOMkfLeMjpZ088zk9Fb3Eljo5CJ5fUjtEZlG8aGi7xP7Hj+c4XWSl2cuAAsnNv3sMlGOZZ
	SjqDaQnmIF3Garj0ALOoUcwk051lXyIKRpazc2vvO1wamsy2w2wGV2aHvHrci3TkWj3gTRFakrY
	jKpnpX2fMr1T1uuEWc2lZZ9NucGMfZIPRbAM1kvaF6um5TLWtgaoEZSHHFuCrX7FO3ahnXaLSXG
	DKcEPZ0a5uZenq8G5bU7JW5nicOAEixAM5bb+LAK7i1AixVpIN5VNIteEbU7IVvL7fVZlwzDJPD
	yVyW16XhjVUvWk9yo5XRxRSExnS7XhOPy1tII=
X-Received: by 2002:a17:907:174a:b0:b96:7e03:166c with SMTP id a640c23a62f3a-b97651b4282mr160852266b.53.1773404255612;
        Fri, 13 Mar 2026 05:17:35 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.176.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97756e59c4sm23182566b.35.2026.03.13.05.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:17:35 -0700 (PDT)
Message-ID: <9241da21-6b02-434d-a746-6bccc25a335d@linaro.org>
Date: Fri, 13 Mar 2026 12:17:38 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/03/2026 10:29, Anvesh Jain P wrote:
> + * Read Response:
> + * ----------------------------------------------------------------------
> + * | Offset	| Name		| Description				|
> + * ----------------------------------------------------------------------
> + * | 0x00	| Byte count	| Number of bytes in response		|
> + * |		|		| (exluding byte count)			|

Great to see this documented in the code.

Please run checkpatch and take heed of what it says.

0002-platform-arm64-Add-driver-for-EC-found-on-Qualcomm-r.patch has no 
obvious style problems and is ready for submission.
0002-platform-arm64-Add-driver-for-EC-found-on-Qualcomm-r.patch:184: 
exluding ==> excluding, exuding
0002-platform-arm64-Add-driver-for-EC-found-on-Qualcomm-r.patch:224: 
exluding ==> excluding, exuding
total: 0 errors, 0 warnings, 0 checks, 28 lines checked

---
bod
