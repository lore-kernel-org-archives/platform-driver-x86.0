Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0313327FD6D
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 04:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773461351; cv=none; b=g68D7ZCwi1OiwkJZ7aq5CgT+KJuUVGWHNlfoRP/Qp+JFT+fuNVm1LNsLmCyrmKbpAI3xcksWnFbx9x9ruBFiOEMDF6M5jd69YoBCieN6k0oyUGzYQzrZ7G4Kbc91pm8HCxW7+nwWsgWtWlextEThBD6yXZg59kFbg/PgjNBQPjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773461351; c=relaxed/simple;
	bh=PJN4+9Mca0Th0PJtmzAQpFS+PGYcX6JdGcwqPdpN9ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYQQvoIenn0U5lOKTwHVY/whr3KvLT2eswbOkANmYOuDLYPuK95T1WNcI1qYj6rZZaVjIaQd8qACyZtQy0bILs2avQZErw0LQ5AHWadM7UZhydd+KnhIdtOXkNuPR749UtKfOfYogSAgu2Wbt5Nuox0c7ZMtTtUcFG3s26lX8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIFypa/m; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIFypa/m"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so22370445e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 21:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773461348; x=1774066148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJN4+9Mca0Th0PJtmzAQpFS+PGYcX6JdGcwqPdpN9ew=;
        b=EIFypa/mJu7qpKhQJN693xvhM0oQS7HOlBR48/cViFU2Q5PDhkGOUy+uJ/TyqIGFQJ
         iasDs8h3NJ1o0iCDWvemmqfVDRgDVSmuKQkVSHK65GLYbdVTGV6kzt7zbe8WthC6DORZ
         InnshsedSCIelSwTICuICDS22Zwhr+khW+4RxC4DhB+hPgnh4h6WW0+QFh+sAxHsJFw9
         bWSayoETx0FJmPzvAgPPmzE/J2p6rzOqaGpzKA4mCdWAT4+nUJ9bkZraYYX8lguvbAqn
         mplUiU3UuvQPfxmZyoaLB4ftbDc4n7/B+TZpECuvDjzQxnCkvGVlGl9Ylf6F/ezQfP2I
         /4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773461348; x=1774066148;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJN4+9Mca0Th0PJtmzAQpFS+PGYcX6JdGcwqPdpN9ew=;
        b=tJk+l6qIDNZtjHZKsQJfpJ1ERI7uQmPSH6c/HMub7Ph+fnZ4DLdgYm3yzKnVyeEOgQ
         bAn6tSEivTGWWQ9rH+4wbcFrji2nMYaFOfaa6jJqi89QzOXgMpdm3ghoT0mANjZF0vGU
         /yaPkCiqQhvAG9pomdztISmdDR9L6Y3Bo2zcpz9ep28OecbEYxPyMZw5ZEdYaxx3q4G1
         +5k+7DKJmTBl5mEGPwz0J73StNsw9JTqGDmxPHtbc1poNZCZgtXJvvXmQj3mPREg68uv
         +YzXmXx+1kbml6CxQyexhW/pBK2STi+piQZJqMSDlKS53h/BMAjQl84qZHNSCsbEQUwK
         0E7w==
X-Forwarded-Encrypted: i=1; AJvYcCVYlOiXXBVJ+PYtN7jL+mD3bFN5cngHvBb/sjsfBnF6P/jrhdcPx113XQovIfZaOoNFw/TZy32+NzFHxAxFIlz4TDkX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz80HCMwji2ZwmubaCHzqsEurAaDQ3dHxO2Z16vv3Iks2wulJAd
	PT5h8cEv4y0F2zko/Ge1hYWtl077j2afY1bGh7nG5y+NwHnFrBWtEZwz4IcWjZNnaiU=
X-Gm-Gg: ATEYQzzEP5TEMcPKoUoXUZxYsQALNUR+cAIMU5k87Ass4rWX6JSErsYqN5O/8ynoGkh
	d/FZlWVYEYwztNhijHk3P6qabrhWXQxlVIdugZ598wHZmkQ6prnzI1CTW0rF+D9L0fBRAfw4wLQ
	POLENNW6ZJBJO8DeVeY9NF8yO5+7pJEvnEkSYiZOSyt3PFozHsUJJqfDR+NGO0zTFti485FTTBt
	XIMYyqFEgmRQgPp8h1DJE5y9p/84/eChW6QxmX2BuGPtQIP1fIN2JQeHTW2A3ixb0W6jqvb1c34
	1xjb/+oeSju/yvoNtbw67WYnilqDy0LkN9kt/j7vVQkZ8hmqTvdjDtF8JwPZATIvtcK7z2I7ujb
	vyESp4+pku8xhiPw+wHgZaaiiXIh4qKhyHq5uak0qV1CggRC14FBN/l7Ok9TPmRG/PLpaRNKpgV
	MlrEDe3Qtd0OQANVxIcApjpgxRbBn2zY7h/Vg=
X-Received: by 2002:a05:600d:6451:10b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-48556705319mr65207605e9.25.1773461348314;
        Fri, 13 Mar 2026 21:09:08 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.226.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19ac34sm23085560f8f.3.2026.03.13.21.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 21:09:07 -0700 (PDT)
Message-ID: <ca7d675d-139d-4fbd-b57e-5b233a0e2922@linaro.org>
Date: Sat, 14 Mar 2026 04:09:06 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add driver for EC found on Qualcomm reference
 devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <132116be-2964-4b98-be2b-1baae5bfb58e@linaro.org>
 <19e8837b-d711-4d0e-ba9c-e9b2c8330969@oss.qualcomm.com>
 <aabf9bfa-aa90-411c-b9f6-706f963a5ab0@linaro.org>
 <azoaku7s3lxgcccc2rrp2bljbvqeitax2bl47k7eemy6uhcr2g@kveqod2tstgk>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <azoaku7s3lxgcccc2rrp2bljbvqeitax2bl47k7eemy6uhcr2g@kveqod2tstgk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/03/2026 17:17, Dmitry Baryshkov wrote:
>> Fan Count == 0 || Thermistor == 0 => error and probe() fail.
> WHy? EC is still there. QUite useless though.

You want to register when zero fans are found, zero thermistors... ?

That's a bit fruity.

---
bod
