Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC5F33290B
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771258724; cv=none; b=Y6sXNDi61FtH5sYTItFnoAL7ZloSK9AvYp7Dtaea5yBgQm7VI2ReazcxHYaMB588k3fMEPBPun1ASQT83JeFliYD7UcyP6KoDcMObUv+83jXOZZyJCMsnRD9YyzbCMtd5Aa+mKs6V7oaavFFR+vFLpI9BjEEPNZBRKU8XKcAEDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771258724; c=relaxed/simple;
	bh=kEffM/BM7lnDkFFKYJoHsGOMHHFxomN8GjRQ9HOK0jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xr9bYnsbpbiFZykR8yyZUHs8ZTuS2JD16xgFPiuTG/k/Z5banc4ULOLkOkz/yO2XoBsxh666na/17N9m45pN3f56YPuv9IZ6KYeMDzIWBomskpbUPZTMeLD72dN0KPQrIJLLjc+ntDCTbmeJim7oaUEQtRaMlpC8T8rRHFuuDS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sheffield.ac.uk; spf=pass smtp.mailfrom=sheffield.ac.uk; dkim=pass (2048-bit key) header.d=sheffield.ac.uk header.i=@sheffield.ac.uk header.b=dL62nMyE; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sheffield.ac.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sheffield.ac.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sheffield.ac.uk header.i=@sheffield.ac.uk header.b="dL62nMyE"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so413865266b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Feb 2026 08:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sheffield.ac.uk; s=170424.google; t=1771258720; x=1771863520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kEffM/BM7lnDkFFKYJoHsGOMHHFxomN8GjRQ9HOK0jI=;
        b=dL62nMyENljfSv2XZyzjJVmUZmrQQsy31zQlRIEx6BqiAyeHU5pN5fzj8EzQ2EbiiY
         VFgvvR9Gcb7elAgC+NwLDiRIjM+YfS2y1stLjtIxq1JV9jYFfCXx6IwzjB6gZtJvV6iL
         dK8OCs89BU5CeZpbomngl6vlhuRNeslT9idTWEcFXKB3ivxrifY47oj6IkpNO/lEU2mZ
         tv87DYDqiywIjBdmUFF4mMOMiPXgqT06GwZ2KGhr25Y0cIWWyS7jCa7CF1yKHKERMFhP
         pEGxklj38oR3aV4UV6Jw9X6aTfANY1ip6sMv0QeEBOL1s6YWlGcZ1+/AYJXeCNHD4ySr
         5obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258720; x=1771863520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEffM/BM7lnDkFFKYJoHsGOMHHFxomN8GjRQ9HOK0jI=;
        b=t1l5lgPF3q9NIvnHloPYutdGRtop09IbKS7nrTwWHUCsEfvcqUTJIqdS0IpgrjXTm7
         /dLZR7eLbhfjAqhgSncuJ00lg02+KwM5MqpFUaOXwZ/biHOPeH+kQrPMRN3nSnI2VFV2
         pjOA9rNsaDB4vrLXqjXRDNorsG6OElvTbKhNquzbNBgdlfzW7Ie9IZlYAg66T7BTmsJ8
         a73a+WOAPOt2oKDJeXWb6QvNCaHnh0n9coZOE8teBJ0RJTwNjDsuFrGv8m+YC6CCWC5M
         lvFfo4F4w+8ex62A2Kpx3/Nd3PS2YRiUrnnlUVzTVMZNIKUiClipDJ6y9Cks0R4UHZw2
         LzvA==
X-Forwarded-Encrypted: i=1; AJvYcCVKjS0oALP6/C8lI4XRZLed8Z52mLprhC2T9RXmCxLbDKF0haH9fftF25z60O/Qb5eUIToyguMLfzuKmOxRsg3gz4kK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84uVNNJ7n8Lllpo1Z5i/5hYuwCOcXx0cU6iZyXhSNY7jm5bCd
	wFQbNp6pcip6bRLwHRdNcPcAyi14R7FccF6uUwScXBpwrSKgnux6Xr8Z21JAghNboXsvOlT6Kae
	6bS+KeJBmDG3vOvS7MAhki6RoER2hTG77wASpaUyDKDBqNeARtogVdELgrXtUaro4qO0AGrlzES
	6pt9waJ9vMRY5uk+PSN3BOx/LeV1BGXhTYe+kZwLm1PljQiZHGvJwSLLzR45gM9bxEbIsxfRV2y
	RYANrqg9mu6DA==
X-Gm-Gg: AZuq6aLlwsiG1D5UtvQLFnZy6SGpS1l8AUFF/Mzc7Mdanmsh28fe2nMe0lxIK/CekPd
	WTa0qIBzbuXg4JjklWo2GZU6lmkpKMkig0SFlYFyUsPIMmRVXUQontS4gadTwzVxasKIioCYhgH
	B7uBMLSGDFdOriJjMUQzABIwzOfufDzFwW+scDuuKSsbohQzShZqnwmOS448f3RYhrAoR9EsN/Y
	jm96QFGTpnfrRMDqLRdT9vq1LekarPXYiu2OqUKFcoFhPh7MQwZFC1BmflgF06F1byA4ed06bi/
	CZAU1uz8079ffaSYDNFyiApvFakZbA5IFjsWjnqInCTaOuvj+t00Px1VJCTCp2GZb9uUHfmy4Mt
	lQ71KLL6XjNXDt+kDA+PEcyIghdJEInBlJM8UACDixwTLAPpj+xNKH1T5P54Xq/fUzpAlE+OOgU
	ZW/4gVC0IHrD1wXiZoPRdaxkXU3f/c189NY5rV3sMFS4vHIQ==
X-Received: by 2002:a17:907:9692:b0:b88:646b:ae32 with SMTP id a640c23a62f3a-b8fb424c27amr577260366b.22.1771258719580;
        Mon, 16 Feb 2026 08:18:39 -0800 (PST)
Received: from [143.167.4.104] (hubble.shef.ac.uk. [143.167.4.104])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627f98sm268124966b.34.2026.02.16.08.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 08:18:38 -0800 (PST)
Message-ID: <4ddfa94c-5cb5-4c7a-a0b4-9b9ff5e4cc85@sheffield.ac.uk>
Date: Mon, 16 Feb 2026 16:18:38 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1127612: linux-image-6.12.69+deb13-amd64: hp_bioscfg
 mm/page_alloc.c:4802 warning
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>,
 1127612@bugs.debian.org
Cc: Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>
References: <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <aZMt6sSlpKK_JAdT@monoceros>
Content-Language: en-GB
From: Paul Kerry <p.kerry@sheffield.ac.uk>
In-Reply-To: <aZMt6sSlpKK_JAdT@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi Uwe

Thanks for the reply and information.

You are correct: when I boot the HP Z2 Tower G9 into the older 6.12.63+deb13-amd64 kernel, the hp_bioscfg module is not loaded which I had not noticed, and running a "modprobe hp_bioscfg" on that older 6.12.63+deb13-amd64 kernel does indeed generate the same dmesg warnings as 6.12.69+deb13-amd64 does, which auto-loads the hp_bioscfg module.

I've not had any noticeable problems caused by this issue since 6.12.69+deb13-amd64 came out.

Best regards
Paul


