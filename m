Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359613C6614
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 16:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419184; cv=none; b=XsP7QoDnbyTfhCll1MVAinwb8RY+PmWwJndp5JWmvGgtcdQ42ex90KOKhyqjEZbarg9UTQoJyxUm4ov4AS0WcxZHQnP1OGm5V5Je2C2kTQIcqV2e7Inpai45aovMX26KAYRsAp8hca0qJaZqZ+7eE5NlVtsuOOfZHtq9MbIh66s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419184; c=relaxed/simple;
	bh=xphBfWYWIwfcxjD6m69trtzT0zhuPOftlxEkUe47TK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K3rbFWO87kvxMSe9DiIoYsK0cnvpVs2oDcImZGlOZdEHOnI9qsb57QbO45L5JSHsVXS8R6Si2Ey67dd+ab2ajbbtCbJouVhU6V+liYdBZ9UMw5wjMN/SqYrXNdPa8auTnnpnTJehfy95570EKVkY5w/E+2Y7MB/d8+ujRzbTbuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l+sIqAwY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l+sIqAwY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48541edecf9so25050135e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 09:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773419179; x=1774023979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uh9FXu+Vcbr/JOV4pFTxbLbMmrJ246ksOjHkBZuDF4I=;
        b=l+sIqAwYzNKW7M01pWfaORPVXbHdp5P0dHEjGBKftBpC4Y79qVZz6lSPolsdEFE2nf
         KczdM+8nJa64eU0LpyGzGzpDCTi9jGhYtc5LXcdvUxDrhwm5C41mrzDWM9RkXHCfIUWn
         D9RML1VU1jAhEjF4J42qLufOEUbhX7vFOmjghgn3a5esANWFredRmNevNyiFneeUz+QX
         LywqyDuJKO3t3QRPogxr9n6PDHmRY7hUaR++mo1cqlmUfTZGfKLE0GnOT+wKi3PLs88r
         2/XdhfC1Ij/3jWKWnai8QkiCRCMBawPu1G90feFNVuhjeI9qN1ZnoXoUELgaS2KGLVIM
         jFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773419179; x=1774023979;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uh9FXu+Vcbr/JOV4pFTxbLbMmrJ246ksOjHkBZuDF4I=;
        b=afL2WRTE3PO5Nqto23iCFuQQutFMiHx3yZZcMrPyPGLwMDyIUmX38NdJXcxMxaoH3z
         5KCzUvKCFH5FpLyOQnHNMClZxJYzSXMyTATrKibDLog8tXVY16zb0jM+42aSM3Yw2Kcf
         cMQR+FpNcYRaGvXR0hHYeb4ZKCmTZ7LL/mw/AuEHYq+UwXqfvWFRmuuzMvkl22mR/ZLw
         1lSHmaovr5kvFAUmrMsd0t5ijM8tV+BmloAoBR9kpljnYqzEIEOPabhis30FY3DL7Ppa
         UgjBHiUycF+U2jGtjXo7SWgLorWVKSrVIPjA1GAYvc6vkkYL0nhb1MCUPc0LDMCdXB+z
         kIHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAiO7KqC1BJG9zeIEqEYgZf2PUuR/pl6V2qru2w2aGiP2NJOpTPwAyqsiDjRGdAmK3yZlhsGNpe8SL/bH1OCpp0kH3@vger.kernel.org
X-Gm-Message-State: AOJu0YwBSffqeHCjy5XPgB3vmLyrTPO/CHiZO+scWxBVUNpBXvY3Vw7W
	tJnvqWPFaw6psMTmhvKKfV0Fjw/RNYCPBNMlpeU0up7potgBnZlO5m79kCHN+b4scS4=
X-Gm-Gg: ATEYQzwDT507hM1MKqnpDea8EM/lFVLCo2ihRiHra1kvKe+jMwkktN6r7lk7SGSYows
	hejNIAomTy4igxjtom8SvNyjNce1Ac2TLKr5jE3QLtOoFid57ZZyeUEO5YbqlIicodAUowgf+rt
	SxEsE5X+GLKFQy48EYMmFC/IpgWvDFRerMl+k17SHcjtoDmHQvxByYonINdwVhvYUB/pYczT1Qi
	Vmua2aVlUV4Bm0VglWEoGlJPuSCIBNPB2FNk7w3jB8is+13BVx40c83CGVZnwJsbiMomQ241jHQ
	ov47+mSwHkArNF6+7V7yvEAAB4gf2E6nbylU/uPIejETkTymANJUpQvShvVT4DaCdoOoSdqtPsn
	H5aP+bqnkNqrsUHRhFpHeiA3pC2ZUzbI4cgsLX1H97CA/2HT5MufAcvcoqrQhzjPZELt/kN6AD9
	4RG3tpvUmHRhSmmsR/ebiwEgVzp4BwkYZrM3px
X-Received: by 2002:a05:600c:628c:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-485566c6a59mr61329255e9.7.1773419179118;
        Fri, 13 Mar 2026 09:26:19 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.176.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm588826275e9.2.2026.03.13.09.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 09:26:18 -0700 (PDT)
Message-ID: <aabf9bfa-aa90-411c-b9f6-706f963a5ab0@linaro.org>
Date: Fri, 13 Mar 2026 16:26:16 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add driver for EC found on Qualcomm reference
 devices
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
 <132116be-2964-4b98-be2b-1baae5bfb58e@linaro.org>
 <19e8837b-d711-4d0e-ba9c-e9b2c8330969@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <19e8837b-d711-4d0e-ba9c-e9b2c8330969@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/03/2026 13:15, Anvesh Jain P wrote:
>> [   27.311768] qcom-hamoa-ec 6-0076: Fan count: 0 Fan Type: 0 Thermistor
>> Mask: 0
>>
>> ?
> Hey Bryan,
> Thanks for trying out the patches. CRDs typically ship with
> very old firmware, and updating them to the latest version
> should allow the thermal information to be populated correctly.

Sure but looking at this we still load happily even with all of these 
values set @ zero.

Fan Count == 0 || Thermistor == 0 => error and probe() fail.

---
bod
