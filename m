Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CDF21B9C1
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741930; cv=none; b=iuYwoy8pqJHfaYDYHe0FkGX7DRXEYtvsahmzxxlyTxQKGfR7y5WowCdJAI4abegUxzQNCHvKMMgTfRCbtDSzN9HOcfobzN+/nvQlqTrmgluR3Gz9EK/Pdi7UdufvJJuoKKXqMaF796+93BeXvD2BX6Dt8pSRBoeCrD+pUvehZYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741930; c=relaxed/simple;
	bh=nepHmhe2my1/TS0/miMgoTId2J0/ckMsAUxgocThFS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K3lsh+OC7xzp5/fJxzcAgcAM2+9wDrGh+xKBqJI8+22wrp4nDWqZdz8dw5NwngH6A8U4miydETL9isryq39YUr9VaU6EkgsN1O8z8I9irizGWgGTRXApxkdY96N0VeFozWdcq6khPLP+DBcs6jYhHfN5LP1aHUDO+24xspN3OPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ON+bbF07; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ON+bbF07"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b86157e18so11531115e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Sep 2025 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756741927; x=1757346727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zvgVg4wMFIPRhYvz1pnYCKruwi4dt6JJzYxl+/aO7gk=;
        b=ON+bbF07pWk/p6YrAnZNPoBxJszxyGIh2IEYXkEfABbBTdDXcDL/vRyQFQuxkBkIGk
         viOJNhVaHQPH+mSFCsD7R3Je1X/O/Va18+IEMHxxCIvFxNBYvWkP0/CFRWnlobBS1+VV
         shV/4Vp/WCcuVxUktMGMd5Pbs55mACESbl76qVycLC5ZRuVXa8fBmVSNWxq/YfUX/OMS
         AIAJ8Fzob+NvKH+jI+TP8DEvJLpzBvfS7GgsOrnvbqcIrIGk+9OLwHxJjmYfkWAyGmDC
         83vHHcOiWKYBBcfWx/HfPPJjxZyDyrePqOpTAl65w7bR1Wj/HgK4XxpMEPvpWpt3x48P
         11Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756741927; x=1757346727;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvgVg4wMFIPRhYvz1pnYCKruwi4dt6JJzYxl+/aO7gk=;
        b=kRVM3bj3QAc1apt5SWs+dUnS0tSP4Dsaz3+F13adZmKkWwPuaVil51NU7bkI72MCMO
         E2a07Lb8Pmy5q1NI4uVlAV4Xoe6sw6FfssfyGwa+fB3wR0fhQZAKpwzDea5CIcqq5ENp
         1ReYOFU6MZW9klQ1IXIC+GuKBA47ixGz6xzflB7yz3FxL8Hd7Ts1k3aUnHZqgKr16GWg
         nm6V1LLHJl/qvKOZYODIZjuL76y0mZo9qUlMLDUAJHdYII/bXc6dBPhSB5LYTj49rLLb
         YJBwNDHeiOLs9D88ASfA37yhJfljhEhat2yAj2SwnltRralCilpERV00lMc2THzjBIvV
         Yr4g==
X-Forwarded-Encrypted: i=1; AJvYcCU0PbHxcQsGXy9CL3wLAKHtALaTaqVyDECOQG5eDI746P0FG7tRtPMMoBH2FFmbCSSWU1pqEN2BxkxR8MTPWKBjuGVm@vger.kernel.org
X-Gm-Message-State: AOJu0YxxHHvplFK3ZI7zj4um4Chh6sH5xuZe01Edtj26/h+jn0UIATST
	JtrEJUOm0FYsPM0hw2woTGOnc3TmZ1BV3QyAjZj9INll0YQrfjCbQIp87Gy7lEoAfkI=
X-Gm-Gg: ASbGnctg9FSuwAfeGvpg7IJbos7DANTiLFFRK9J58NFmgUN/CpSox0qH5e+4vVi84MF
	qoXoEB0JZBB3BEE9XJY1iuVjPchfjYx62x00O243EYPIxvDQPHgCwOWU/JS8sqlFOWKGJQUi2K3
	l5LSnpf6RZPd1SWEJ1k7uzO4AzLgJ0H8dIjpf4xN/Kfwiu20unp/zo0dV3hLAT1thQ5K3YUMkTZ
	/lrf+mhUA+R9sgeccGiGv6ROVLePOtPj+IvfusCA2cHpdSX11QRzrU8fflsltQmiqJ8l6MO08Uv
	4kvMcRRIRbTyzhPN0s3S+vxJRZ2nJUrex23Ylfh86lRdItP44bXCkmyWxWPOp2zpmeS52q2Ttxe
	/A0Z72UCVJvfZliB10yKMdu4/mmeneglFUza+YY06AQBo/vBm5BK4FtMTw+4mFve85oxorc+XWv
	wRiSD2n2pDbQz8jbXTFH4=
X-Google-Smtp-Source: AGHT+IHcKqULDsn+c4qoRR0F28BE0OPsYdJT4mw5UiGUiMMns+V2I9JG1CinXmS84aORcGRwIQn16w==
X-Received: by 2002:a05:600c:4fd6:b0:458:bd31:2c27 with SMTP id 5b1f17b1804b1-45b85588134mr65644725e9.23.1756741927286;
        Mon, 01 Sep 2025 08:52:07 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d60cf93cb2sm6373216f8f.12.2025.09.01.08.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 08:52:06 -0700 (PDT)
Message-ID: <33e20d27-eb63-4a9c-b459-77021fb384db@linaro.org>
Date: Mon, 1 Sep 2025 16:52:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform: arm64: thinkpad-t14s-ec: new driver
To: Sebastian Reichel <sre@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
 <20250831-thinkpad-t14s-ec-v1-2-6e06a07afe0f@collabora.com>
 <899b2e79-572d-44f3-8dff-0d301f254b1a@linaro.org>
 <wyv3ounark6jccvhj4vp5qxgmn4bleq6hsqinr4s6r32kld4xp@lhbmetuhydns>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <wyv3ounark6jccvhj4vp5qxgmn4bleq6hsqinr4s6r32kld4xp@lhbmetuhydns>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2025 16:20, Sebastian Reichel wrote:
> You can find it here:
> 
> drivers/platform/x86/lenovo/thinkpad_acpi.c

That'd do ;)

---
bod
