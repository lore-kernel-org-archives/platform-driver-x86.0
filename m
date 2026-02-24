Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897E436D4E0
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771932101; cv=none; b=U3efD6yG+9p8djo3Z6+AOZLupSbOXA0jSVkiJYUdnjulx70IKl8H2eJnbpmXN320kGGjH2nLidGxFOyft0NXzYLnh9wI7S23vZuVfQlXeiGdfFMQ3U2M5pYnMh4dpm5tPxv5+Ldp6S9nf+tRbb603E83/PFswXeHBGoYZ+7uvCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771932101; c=relaxed/simple;
	bh=2zlevkxVxeyoSnWSY+XJXWdJ37kgj9S7PgYa3XPOgnU=;
	h=Message-ID:Date:MIME-Version:To:References:Subject:Cc:From:
	 In-Reply-To:Content-Type; b=sLHQm8QI6Cp9eFNhMaYYbk0li57EVnLWD3Kd2hsDCUQLVmtZ3ASVaX3kTdqlrx2d9WXHeEToYckG+fSuXQ7Z8zw4FrsiiSbkEkeyfnxYRU7Nq3LpUToCxcMUtyfDvCM0PFpxzR1+f++aDKPJNSZqOkNqNGrZ2ug8vkbCi+kSuAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sheffield.ac.uk; spf=pass smtp.mailfrom=sheffield.ac.uk; dkim=pass (2048-bit key) header.d=sheffield.ac.uk header.i=@sheffield.ac.uk header.b=hUmO19lh; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sheffield.ac.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sheffield.ac.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sheffield.ac.uk header.i=@sheffield.ac.uk header.b="hUmO19lh"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43984d7e49bso552728f8f.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 03:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sheffield.ac.uk; s=170424.google; t=1771932096; x=1772536896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :subject:references:to:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ok1b2AX24csEvMnDeq+5oxYj8VOVC5HqDbTedAIm/iQ=;
        b=hUmO19lhTpC9BZEFxG9SJPLpEcwvUoRCyOd/yFDo/oLZUsNshY6CJvHWaeC7Hwzvzg
         Zzs6xLuw5UC6olSEMNURK56atIJ5JUTv0QB4MpqZ1HielkmJvz/Ob4mmKiMq4DnaLe13
         8GDqyR15TP1K0OH2A3wP37iiB2szqOmJlG7ag61XA4mE5tV9T0ds8hI0n88vzoxnWQgS
         Q3DINELdwGr6XCoLeP8ZSA52ZC9G4FBvgUNStJ68Usr29mFu4/x03yjEb29JA3tWTjen
         CXOpKLGK6+Vzn02J3cS5joT18UwG8zo9sEucx8lNpGCi+rNXasFBmvNmxxC2SrQU4aqk
         hfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771932096; x=1772536896;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :subject:references:to:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ok1b2AX24csEvMnDeq+5oxYj8VOVC5HqDbTedAIm/iQ=;
        b=mrSJjeaeXGvRJj2Vsty0x8XLGMi+LkVM/YexzbYvSuWNKoez6rYQaDOI7i+8borohD
         CO1cVaMFjW5Rk6inx3+zKit8+epJ4HbL/ZAqKtecN52Lp/JiqLWYjaXjQ0C9oIjGVrxv
         HTNUIbVxRC2wswtyPibI3MXxJgiDIhLQs95gyOH/fUS5Wk349NywaOqpEnIVeZei/h4g
         i0paTQp3RHaG8MUBBBGf7IedTo2Ezz/6EalmoT30+Ex08wox31Rl5prqmP+gamvm+3a8
         CpqPccFfPDKSZOdPUmiToBJbkA/YMOsinTRrnGuS4kzN+rBArXrPwcRr/JEwSkK5eo0a
         3BbA==
X-Forwarded-Encrypted: i=1; AJvYcCWqDjvbXydtJo07VH6JFFHvFjQudVTnC71TjZM3lMT79X9m1GLAGf3WD7wVyz4dKHdOLEO+oohwmByXz3yZ6SYAgc8y@vger.kernel.org
X-Gm-Message-State: AOJu0YxyxOvvgoM8gb/YfTiwiRlf8VzfyjWK8ej4QVzbWBHZXawmXup3
	4GgChPpaS7PqwxGwi60+2g193gGyZmz+5eBDNj2JuEGcw3xul4a/tqksRSfoERG2YC0Fu/WCM0Z
	7ex656uJL8Xle6BkP2eJpVsG259EljS8lL3mn6d2S+rPV7QLEPg1i0l27yMVS91V5sx9GbfxBd5
	0LItjxhguu0+n6S5GoQc0/SpPv08b18NykasF3qrhLb5Ev3l9dvXmZjmqS5gZsKRpi2cZZr7O6I
	ArncYSf3kvFZA==
X-Gm-Gg: ATEYQzwTjg+ILMiOTgP3uqYKdRKcBBIqFTAKLU2B+bZnbEt+VsVD9z4HAfXNG1zhI2n
	PkQhqWYw+rij9sjtZLliTlbBdm2NHFkB5dTwfIx+yZG3okCuK0tdkzg3jquWLe4Kj/nGLvDQRE6
	1blaey0nkAXPcTB3bxHERsKvxm8JKsw+prcFqI7hI0YE1g792VDdq00vOgBX1wqxm1GUoKyi7zD
	1dmlSDyW5VY50yv+gq4kgLHLUxYFeeDtCgvXVH41tCzZuzEigmcnLSIX0/TTHAtMkAZpz+Y/gmK
	h2wycMvA40Ou35K0s2gI9MHYeUY3vjZhzgYXSid5rxIQWN5lnm8/ZQNRrm5tgyYYAs+2dbSCoq5
	xLR69q/cMPOKbwLjTe2sbstHH9mZPUIa16n/HTPtIph38ORAi/8W3eSzozENN7O7jkVwQ2QfZGi
	an2tWVfWMp544D0luqiuCYEHHcAcr+c4MbB+DUKlPY5JCFQSIKkK8D
X-Received: by 2002:a05:6000:288c:b0:437:75c1:578d with SMTP id ffacd0b85a97d-4396f14cd46mr22493810f8f.11.1771932095764;
        Tue, 24 Feb 2026 03:21:35 -0800 (PST)
Received: from [143.167.4.104] (hubble.ddns.shef.ac.uk. [143.167.4.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00c18sm25544120f8f.14.2026.02.24.03.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 03:21:35 -0800 (PST)
Message-ID: <b2535142-aaff-4eb0-87bd-34c9f8f16f07@sheffield.ac.uk>
Date: Tue, 24 Feb 2026 11:21:34 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>,
 1127612@bugs.debian.org
References: <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <aZMt6sSlpKK_JAdT@monoceros>
 <4ddfa94c-5cb5-4c7a-a0b4-9b9ff5e4cc85@sheffield.ac.uk>
 <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <4faeb5e7-e56e-429e-88fa-a1fefa4d1034@amd.com> <aZnNu_AphE78MIoY@monoceros>
 <d152f056-8583-49c9-a943-494325031d8f@amd.com>
 <d152f056-8583-49c9-a943-494325031d8f@amd.com>
 <7599e019-5c25-4bce-8308-05d53699a2f5@sheffield.ac.uk>
 <7599e019-5c25-4bce-8308-05d53699a2f5@sheffield.ac.uk>
 <3167b808-1fc9-4b73-9bd3-b76b149d2b65@sheffield.ac.uk>
 <f4f2c1a2-25a7-4399-8b13-d627f7a20ac7@amd.com>
 <0b744c9d-9874-4755-9b25-d00f2465a751@amd.com>
 <0b744c9d-9874-4755-9b25-d00f2465a751@amd.com>
Subject: Re: Bug#1127612: linux-image-6.12.69+deb13-amd64: hp_bioscfg
 mm/page_alloc.c:4802 warning
Content-Language: en-GB
Cc: Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org
From: Paul Kerry <p.kerry@sheffield.ac.uk>
In-Reply-To: <0b744c9d-9874-4755-9b25-d00f2465a751@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Mon, 23 Feb 2026 10:39:31 -0600 Mario Limonciello <mario.limonciello@amd.com> wrote:
> 
> I've posted the patch separately for you to be able to test with.
> 
> https://lore.kernel.org/platform-driver-x86/20260223163245.3294630-1-mario.limonciello@amd.com/T/#u
> 

Thanks Mario

I've tested that patch applied manually (your patch looks to be diff'd against a different source as a line to be removed contains "kzalloc..." rather than "kcalloc...") on a build of vanilla 6.12.73 this morning and that works perfectly with no more dmesg warnings, and hp_bioscfg successfully loads.

Many thanks for the fix.

Best regards
Paul
