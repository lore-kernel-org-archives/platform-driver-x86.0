Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F9318E025
	for <platform-driver-x86@vger.kernel.org>; Sat, 23 May 2026 04:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779511191; cv=none; b=k1Hweua3JpXlER9/ac3mcFILcPNYO1Fh3vRGrMAa1QrRUhIE2r6+oIVj1j+N/B+CHMK3De2sxnNdUN1YMyLpRLCifx8eLBhOJGbcklF5T5nCWEzURtOSHGT3pZXhccXpyPgQ/UAHzZGWNAJJz61KmZqXuqYQrfF9jssoKgHmjKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779511191; c=relaxed/simple;
	bh=LAqub+zqgUTBdiAeI6a082gUtDFU9MF6zAUHwBZROV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ygluko9635Y/wKVfhpVZF8f5/KKxgvA3pcWoGZl1eDFDBIiu4skde/23Q5N5NzZXpi24vOHEmQhvz8yRjcOSpXX22eDIqGOk0csLfxd4eUMEBddcoZno7k3Iz+Ue//lUy/DGAhPxzeYGRBlnhQ2F6tO89i/FecNWTkmjahw6dW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OpZ3BUL6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OpZ3BUL6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bdeed4f717so39968305ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 21:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779511189; x=1780115989; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FwhMgt9w/7jpm9p1Zo7BQUbr2ut67rBJcrVYT+zhN4Y=;
        b=OpZ3BUL6D9iaI1kyyQGcWcrEX19GA73gmEwukM576gPqCVi+pUnjxXqQnUae+928qZ
         OHtdt7RWhGGxH/1Vd3jQuZTB+ES+o37W0NI8EpUpXxhn5eRAWVzAyCmCOAUhD9I7x7Av
         08JOxzowGzuXmU6p+wZolUgpQBOdZKM27NwVrCqhnsVdvSJfHDTnXAiJt/pFuV3XPeNG
         ehw1GecjwrA4hl2ZSn9a6jCkM8UJ0aU+tAzkWNLQ5OyHl4Oe1HrT6XCRT7IFdntLocJ7
         BHFhTKeyV2sPI+ZXtlGWCXWLQfI9vVsyYyrxDoafaTss8tXqzbx4vgYxREaw4MjM46g8
         h/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779511189; x=1780115989;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwhMgt9w/7jpm9p1Zo7BQUbr2ut67rBJcrVYT+zhN4Y=;
        b=l1LU5+krQseN9zMcZsWMWS6oKpEt89wtackb6r50fsdyyFJN/pnZffFURkQ/mfuOi2
         1c2+ePUQNIMv7f5vOvQZRHiqGtTB91RZJ4iTrxpWlsJYA7ZOGFcU43ybj76FcyCq/rga
         NE1OV0Q+srXFkMQ80yADA/UnZIp0MV0/xHjfbkPgUytj0KIzWtMClRI88fnEicRtuywL
         L4kVKuXnzetRDT0b+7YBMZ1TPgbV904eBbfryR3M2MPKlLXkzR7RxqEJhPdgs5PDylgA
         8XwSDBddnELfSc8b0wS6d5Spjk3mVRtSWN0R8DWbkpSdNp79KyfcnIaJAUEHt+NY8k3B
         C8RQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hQlrUfmt2D81FR2lcnWMBMSRuO4UH8dg5Q3OBJAR8qIIiJOPXYrNqhE0z0Gmg+JJLuOAYCN3Xhlp9dYEt4PMJ94on@vger.kernel.org
X-Gm-Message-State: AOJu0YzJkra+it5E4by/H+nSvV8ooBp9l4mkHcnD9ph1PCbFYZqi5JVl
	tVRgBmPq582Crnfuj2tsoC26uVWf8K+ryjIGCuZAeqeH5S8wVitb4/F0
X-Gm-Gg: Acq92OEfQ+GSaP7hhhB/DOrnBKqoRZY437Nv8CO6ppdK2h/AhwsGwpkBlswbEhrSMVI
	mBgoTBYKwiPRY3Ux0aRiUkNtXa5c4tJJkTQhALmq9hm/V4pOO90jEVIl+CR11RzAxuVwPC1SJcC
	AgqF7wXs+C66HAHnK9tvpxpMkU1A6Bei0RoujZvqQRlMmHABLpFq6VllZ+bbivnaJSUL+AbRREm
	cNQFR5ZmJhyjCb7P3jjXGhjZwUaRgLYIoT14qfEx8is431zyM8WhqPpnLfNmho8qQWybkTQSacB
	wcphBCFjjSu6Psc+GCcgkPAm4kapQDUbi0/Vqo3fJkyDSB4wMjYewKMs6Z3aTLqU+OAdEoeJWVP
	Jx77Ac8HNjwejGIPppzJO1fP3Cx8DJzCiKPYrNWYTNsJK39c6d8YewefaShkhKjD9LRg0hkoxtR
	1sAekWpAw3fdYVrQ4EWMAafbXqFlQD3MZ9Vq8TN26s0abm9gb+CGV0TiWvvMePwc3oL+sPaM476
	P4mHmfZeDpss+BB5jTss5Ob0yAa6ZI=
X-Received: by 2002:a17:903:2f4c:b0:2bd:61e8:1ee with SMTP id d9443c01a7336-2beb05d9fa4mr75680705ad.21.1779511189054;
        Fri, 22 May 2026 21:39:49 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:36f2:f474:be1d:cad7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56b51aesm43252095ad.19.2026.05.22.21.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 21:39:48 -0700 (PDT)
Date: Sat, 23 May 2026 10:09:40 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Radhey Kalra <radheykalra901@gmail.com>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v6 3/4] platform/x86: hp-wmi: Skip zero GPU RPM rows for
 fan speed delta
Message-ID: <ahEu6tIN0yj94W57@archlinux>
References: <20260521133351.1512718-1-radheykalra901@gmail.com>
 <20260521133351.1512718-4-radheykalra901@gmail.com>
 <ag8QsXGZziywo0SX@archlinux>
 <e977eab9-a578-9946-866d-f96e9da9cf7a@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e977eab9-a578-9946-866d-f96e9da9cf7a@linux.intel.com>

On Fri, May 22, 2026 at 04:56:02PM +0300, Ilpo Järvinen wrote:
>On Thu, 21 May 2026, Krishna Chomal wrote:
>
>> On Thu, May 21, 2026 at 07:03:50PM +0530, Radhey Kalra wrote:
>> > Some Victus fan tables start with a CPU RPM value while the GPU RPM
>> > field is zero. On board 8A3D the first row is cpu=23, gpu=0, noise=25,
>> > followed by cpu=24, gpu=22, noise=26.
>> >
>> > Derive gpu_delta from the first row that contains a non-zero GPU RPM
>> > instead of unconditionally using row 0.
>>
>> I agree, this is essential for fan-control to work sensibly. But I just
>> want to give Ilpo Jarvinen a quick heads-up because this would likely
>> cause conflict with foobisdweik's patch [1], as they would (probably)
>> remove gpu_delta in v2 [2]
>>
>> [1]:
>> https://lore.kernel.org/platform-driver-x86/20260513193916.84673-3-dweikmferris@gmail.com
>> [2]: https://lore.kernel.org/platform-driver-x86/ag2DCOGyCt7MBUL6@archlinux
>
>Okay, so we can work on the other parts and postpone the gpu_delta part to
>that other series. It would be nice if Radhey could test with that GPU fan
>patch once the next version of it is posted.
>
>
>FYI, sashiko seems to find a few potential corner case issues unrelated to
>this series:
>
>https://sashiko.dev/#/patchset/20260521133351.1512718-1-radheykalra901%40gmail.com
>
>(Mainly to make Krishna aware of them but I certainly wouldn't mind if
>somebody else has time to tackle them). But please don't take every
>sashiko's (AI) claim as the perfect truth, it just isn't always right.

Thanks! I wasn't aware of sashiko, but I'll definitely have a deeper
look at it when I have some time.

>
>
>-- 
> i.
>
