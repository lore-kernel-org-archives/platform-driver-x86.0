Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD9632A3C5
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 14:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767020211; cv=none; b=i/3OayQJyXLIL7ysFtSz+Gi2ryiQO3Vf6616fXyS9udk4vcLaalOvPBIcbLU+RMiJUGc9sha5BDigvCNtkt3NYmFYmsFeiMdbWxPu/4m8IH1lx8vNbvDMvIl91WFmV6RiceM5KLxME3IOri7OivCC9ka3kFImA5YHS4+1klLxtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767020211; c=relaxed/simple;
	bh=Yy20N8xpV0q3ic4WNBZrn3cmUoSV/XUZ2XWZwrqI33I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWv4Ps6esUmWSWSOlrRsoHGpjETpgYgfL2NS/VZJ5TqAN35oaeIkTeu0jAs3qeOOXmY05YwjHewbObepGftrNwik3UA3RI8AgSOSH0LSFijlrnhZLGZmwKQeFaSzD7vwPihQBNIa6pcstgcM7XAZHmddgWQfom3sXgMftEqW1e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dt6KVzks; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dt6KVzks"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1419590f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 06:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767020207; x=1767625007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/myolSI3ijeysotw4zvyldzrMlSOrHxWATPOL6sKOKE=;
        b=Dt6KVzksawKKimOi/FIZq+gu1PDiL88+VP+NI/gXiHy5d6Sh3ceq2K1XdEq+tQ/XHW
         WYbp9iUQttL4qP78fBGKLX3pTRcG/JJdBCToDLhn0Kp0Ph7WvUiuTRwtQyMsmf3iM47+
         QQGpn5At44RWMKrsbENPyIRwMPLFISg/jMQXsuC/O+ZcZ5v22/07K+XyY8ze/FexIThv
         UTQsHtRNBgajnyLHavVt/+W7vMIFfKjT8o+NY0Oot4fuJj+HEyv/4h9icFn/1ecihEsD
         uZScC0IfXH0oUnXseD+VqsWHbAl9/TuQXMrtFWb3ocel2fHsqFr7G3v+VGd4Wn75lUju
         tIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767020207; x=1767625007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/myolSI3ijeysotw4zvyldzrMlSOrHxWATPOL6sKOKE=;
        b=b0uHcUAvRFYHZDHp+1zsvKMOU5Wpi0XbIUl210iwb/h05gEumPRE4hTk6oZfd+beSF
         THjat6VP1VXMoienmuzC1oQF6B2KxBNt/ZKMEgOobw9/q29msgmzj72SeIIfmaimRVj1
         wx8xhET+DMnyaZKZjM3s6+DYUbwucuPyKSpiOiA2bJZZl88K/qkO/JDHrTd6l2Orae+V
         0MmQvh8Y8vAjw0jSXfbioqbEm0xC8lLlDsjyuZNpvygo8uMzcDP/HM3jH1DwXpKJ8nb+
         swdBaLryRGmPlUHgsTOG0N0vOCxvFVvT8JHNSb4l3QWv/u8ycmPPrb7Mjb373l5CPZVq
         qiew==
X-Forwarded-Encrypted: i=1; AJvYcCWTCgZ0BY9J/drTPb2IeV3TZGlEuzhskEQS4Aq4JuMzOtJU8Mhl7bHiD0Sl4/j7pOhoy9fuJMgoI/QMDFogN97uOcxB@vger.kernel.org
X-Gm-Message-State: AOJu0YwGQULzyC1AAOJUgtCra1lDFOUBttrojaf6jj9QukmrnKTuPD6R
	W+j7UBaSbinn8MOJwRDznTy9bkzRcylTVT2mI/yK2PI6fQqtwKQL+hgZ
X-Gm-Gg: AY/fxX6ZT4GKA8hZ+9V5ojoSjcsek2eDop4c5Xgq7kUDnrgKwd3HDGsab4OTu09QYUt
	oPxlx8tfka0dMKl9fvRlr+V66okqDWtO8VUc0BFqW3RiSjcedVzHdLBaR545ST2Gk78j8/fj+NJ
	s1Sf5IS0WsqmaS3yWn89Vr/U6X5eMYx1SySxAaB4ji0X0lAkwDk3Q27CErwt9UdlyFU3lFqilK6
	9d+R/hKdcD1RHBcH1MTAV7jzd9JizgaNfGGsUtde3DreiOOGYu+zS+LkMk0qdQEJKKqEq+a2QzH
	/J2jn8xthp13ghJtQmt8qCnR6UjmR1ehXEba8HCh00235PXGhK2A6B2JUewtCoa3DsEJdx0qQB3
	gb3M7/mugKsrhrnz0ndTMXsWF+1ftSoSILwpRP2QaLaFbTI3KHDX6mjayOkotzH+od3Is++j2fX
	VcVnZAvU2mgh5XXGgv+TsRlJo=
X-Google-Smtp-Source: AGHT+IGoa4KSa8jcgJfGItYbbAfpOmwSpvpF+KDFq3kotNPtyEX0qhccg31LWemW0rNwxMRRU3wpmw==
X-Received: by 2002:a05:6000:248a:b0:429:c14f:5f7d with SMTP id ffacd0b85a97d-4324e4f69f6mr36874027f8f.29.1767020206740;
        Mon, 29 Dec 2025 06:56:46 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08efsm63172354f8f.29.2025.12.29.06.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 06:56:46 -0800 (PST)
Message-ID: <79bb267b-d24b-40a8-ae82-fa4d813cb234@gmail.com>
Date: Mon, 29 Dec 2025 15:56:45 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for GU605CR
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Denis Benato <denis.benato@linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>,
 Mateusz Schyboll <dragonn@op.pl>
References: <20251225023841.1970513-1-denis.benato@linux.dev>
 <491d2182-930c-46fd-20f6-5d6e7f5ffeb7@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <491d2182-930c-46fd-20f6-5d6e7f5ffeb7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 12/29/25 14:09, Ilpo Järvinen wrote:
> On Thu, 25 Dec 2025, Denis Benato wrote:
>
>> Add TDP data for laptop model GU605CR.
>>
>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> Hi Denis,
>
> I've applied these 4 to the review-ilpo-fixes branch, but next time please 
> please make them a series instead of sending 4 very similar ID addition 
> changes to the same file independently.
>
> A series is easier for me to apply as a whole than 4 patches individually. 
> Also, series won't cause some messy misapplication as easily as individual 
> patches that can be applied in order different from what was used by the 
> submitter to create them (it seems there were no context conflicts with 
> these but I had to check that == extra work for me).
>
Hi,

Thank you, I'll keep this in mind.
