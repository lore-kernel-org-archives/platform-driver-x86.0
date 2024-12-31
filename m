Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8324C2114
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Dec 2024 11:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735643386; cv=none; b=Fv0uykSpVOtUif3H7rLSZKootuUau9CivkCG5ipcF0Oj9xKoUvFD1a/unO4GQdbPfyfl4yAykvU7cd1lCCQJtT2rqRKdrZxq8Hf+s7wWgnJcQMHA/gks/eKLxnGN7F2LZVeMYlDURzCoDNaMEHjRyqJPTpmD5i7Pd7wKRzG6ROQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735643386; c=relaxed/simple;
	bh=CZQrp3ljcPGAGgTKtH6TnT0akhIhaKad5XpyBTsLY9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tOCGaSl7mzwpaUFkhwg55xEGGe7wMWh9GA2EqV/t+oZFMt5FRZd1cYWprgm0RLTww/fWKAUBbFU/MBhPJdrT8PdREy4GySUWXdohoKSxnC+QzXXqHyMSgDusZ/5RkeSXZqqBJmVaI1P4ynUL/9IMTQwKcGLon1jOVVf1l41Mcu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5tqCrWt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5tqCrWt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43624b2d453so103612365e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Dec 2024 03:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735643383; x=1736248183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mh8UYWaZc8WrVxKRwykbsoh7O86a7wx9Ng47k23FtHw=;
        b=s5tqCrWtKraouzU9+pCS0X4ejOyWYzCvtoiYHShK8elgI41wEu895sywAI5xnJS1Ma
         +osiZ16wodiyTf8eR67X2dAJjFWQNWtK9v7EaqeARwjBqXP4sBixd09XlF9UCTY+jKyq
         obL/z3PCD7/3dbjzsDHQx2Pj+KGYgISlZ/5XgSb1cdzNIccDyud4zVyIyJ6/q/9Zfrpu
         y8rtuNoTRYGbZdJWmtf6Bj/WVeJe6yJr5JamZGwW25t/qQNSM76BjobqMkG5rj6P3vf/
         xUt7pIgHwoc0hZTrCYM2eDVq/XTWZTv3NGhG7AiNjsw8Sl3aTl2GhK6q4R0AKAfmexfp
         yD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735643383; x=1736248183;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mh8UYWaZc8WrVxKRwykbsoh7O86a7wx9Ng47k23FtHw=;
        b=aJJPrNmNGCx/VUXGJIltnuQs99Bis+NrWKOV3r7HGj1ZPKZNFcCHhsdVqTiICTAWmY
         YxYpgEnXZp4jw8BUxg/0P7M++AXV8BhVTg8xAK/e0k3XfgtqJQd8TKzLgJMtEvKZDweG
         LaoY0e7LrF1BKXVyF6lb1jV90CwTzdX+GluTHiOvqZ0j/qLM7DIdIpojnqcZvAcq+ceX
         2NAZbyjbeNT8TIu9A3Dl4Ps8zx8Le24fTnybZXrKT+JvXawvEpY9/KeqhQ19d/4rWmFr
         8dvku1ngGuA53htV1SzKeJVvPHgGmQWHHltJGzsUHBlyvoXAWiJF5UWqB3YDDzZCRFmw
         j5rg==
X-Forwarded-Encrypted: i=1; AJvYcCWVNcCipvfZuDjh0vL70JQAMbJIjEjKv3jUXc/70zMAtzTH4Cn2Cw316KHhUXZSNNrjRwvaOkbcXsDsoQ7biIIKs9fG@vger.kernel.org
X-Gm-Message-State: AOJu0YzzhTCePN8VtWcH1R3v7BkAPscJj/kbZ/lT6uEwZa/3eQGr8isq
	pXUoC3VjBevCShPija4Ivpa77QbW6ocy+9boFsmXtXwK2WdCG3crLb9ogDs2hzg=
X-Gm-Gg: ASbGncvvnBOJSeHiEs8y4hOUmQ3FNMwKu3J2beo2iP+fUrlwsHRKtS9i4LExDNmG5lh
	BBT12dr5yat/QZQFMeFdJcenskyt4w7D7vdEaTjh8pGs8uUHCTjaN2WMT1x4y8InrgBdeCXxmb7
	JCikLET9F98Qxx4OKtqMvtMpsKXk6Qn4eFNfbimj9EyQ+bk9ZqHFrIB+Ei/ACKk10WSm0rdLoYX
	iEmGi+0ER6mrQPkqCI3Ca1SB9BbFy4lRb1cO6V+MeOe1oh59LhzK6NoMBtUO9S5bzTuOg==
X-Google-Smtp-Source: AGHT+IFaNhrfsnfvBxSp1tViYSz7o2qMK2dzhldDNDYiuudm1kNGgf7qZsGXiU9LTOK5Js6Pse/c7w==
X-Received: by 2002:a05:6000:1568:b0:385:dc45:ea22 with SMTP id ffacd0b85a97d-38a223f835dmr31212643f8f.39.1735643382887;
        Tue, 31 Dec 2024 03:09:42 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829120sm33379893f8f.6.2024.12.31.03.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 03:09:42 -0800 (PST)
Message-ID: <583ec206-e670-4aa0-9490-4ee6397800e5@linaro.org>
Date: Tue, 31 Dec 2024 11:09:40 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] platform: arm64: add Huawei Matebook E Go (sc8280xp)
 EC driver
To: Pengyu Luo <mitltlatltl@gmail.com>, quic_aiquny@quicinc.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dmitry.baryshkov@linaro.org, gregkh@linuxfoundation.org,
 hdegoede@redhat.com, heikki.krogerus@linux.intel.com,
 ilpo.jarvinen@linux.intel.com, konradybcio@kernel.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, nikita@trvn.ru,
 platform-driver-x86@vger.kernel.org, robh@kernel.org, sre@kernel.org
References: <1dff7a78-1693-45d7-8ee3-357b33848595@quicinc.com>
 <20241231074437.239979-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241231074437.239979-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/12/2024 07:44, Pengyu Luo wrote:
> Please search
> 'device name + acpi table' on the internet, someone dumped it and uploaded
> it, in SSDT, check ECCD. I am not sure if huawei allows users to dump it.
> So I don't provide it here.

There's a repository of ACPI dumps here:

https://github.com/aarch64-laptops/build/tree/master/misc

including the Huawei Matebook E - not sure if that should include the 
"Matebook E Go"

https://github.com/aarch64-laptops/build/tree/master/misc/huawei-matebooke-2019

You could provide it there.

---
bod
