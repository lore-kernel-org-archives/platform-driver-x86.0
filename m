Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920DC318EE4
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Feb 2026 18:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770229703; cv=none; b=CyUV+ZUISowMQQbwabzqT6jd4Yr87tY3WeMJ8pTRPRDLAjUnr4MnofyAx6pvHL5vDjIA7vlBMOgoGRQQWUY6d+HjqE8Iw0RnbOhQjSQujCvKprgnTqGXrN3xvEYhKi75Du2ZdyP+5DxJNAhQtSSmU8nig2/wO4TQOZNAbwchVOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770229703; c=relaxed/simple;
	bh=1HsMu+8Fm+qVxsFAh9b5+jgcRsyFab0uFLZAECN1x4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iGEACB75CsgZ3CSc8zfCmA0NL2Ux3+cRyPVt/H4el+64yALraWs8aw3JwB24D6YcJMBI7zuJ9CsEATFfGmqhBHsqx65Knj3MSmYk+/C60KI8jJ1LX4RAUovlPd6blEhhJFSR55RRdD3kHhikLkB3gER76bHJM0M3jAlFyR+tK5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs6pkACe; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs6pkACe"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8230c839409so111873b3a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Feb 2026 10:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770229703; x=1770834503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hz3BEokmg55/hHz91dlBVemctUY55XgvM8V1USUQ5ws=;
        b=bs6pkACehfUedVzT+DLho/yJmkSBM2NFT0YWSkdP+h5dshczU4hekK+bzITwv0RiZq
         2eL8UxMApkrtYKaaBM9Z96WLmM/v9ZVVbCcIh17/pbXtyo/thrsJyS73tCydFCwL9GHI
         mJQpWN/ZX6iMNQn8qCvH03Dxwy9ZvPs6K7pLILdMM+K1PWTZGOo4cG87dBywzhcZi2Ke
         CTM0Sdp2xU/ydydAszlHGFmT3UfpUUm8NmfwjladKu7ZTjNwKHP4Bea1ozQfBewWBEhT
         uDeHlxymgO68c1BHeeQqG/57FuJPsNqEk/A1LMDg+2ol/tJI9RZzJOa9WqJbfEtOrHEN
         Hrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229703; x=1770834503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hz3BEokmg55/hHz91dlBVemctUY55XgvM8V1USUQ5ws=;
        b=Tek2IRu3Ko4N3C89F0Nh9RWQgT3HsMxJroa1Ru+y85AZKRnpzhNJ/bm4gmUmBc7PjE
         gunfGzUTC4v/H9CqpTumHGYw7kNtlzIUglEw8cws4H2snxWXd9LFub6cbBurbctSWyKL
         gUP62GTZgnz90y8bciFP/ihC/6r8Ku2XnnCER5t4t/HY+ZuMtCTne3pHThYXoG0qrzDd
         2b6MEztfraW4WN9eMFxwwcC5+vBP7UaOlgwjKewmV+AXgeSFK5oRelf+MiG0iPjE4s3j
         9meKeRGTSio4PtfdVcKoeglQbmVwjvpljRJCxYk3Iy9mnDdkUqj35NB/s/qQyZ5Xgbc6
         xlyw==
X-Forwarded-Encrypted: i=1; AJvYcCVt220oilhslqtCBlaIizAXn6CW1wPhUn+czlOBUgd0xWwZfKse23CgwemY6IBHd03qpwK7jiOAqxCi6mEf9Q7HwwkH@vger.kernel.org
X-Gm-Message-State: AOJu0YxvHMiDbR6o1mifhjpIlX4Pnsx0FtR9D3kzT1agE7YLllQ2jCYY
	x1MXAAPds0vPxB4PT3QTa5RIGqhW26PXSXQFsm0VFwdBq3Ln7ir5YQk=
X-Gm-Gg: AZuq6aIf/nRsh51i5n43gvpc2oWVaIcjMVuZKnXi+A1OwR8IK8u8iDPrhpclgmkNJzh
	8eF1O5wxZ2vAdHNJw+LCIC+lyv/DTQSouhSvgynUwEyezSIdPugbU4fsBMy8zAR8F0nT2jHSBxL
	VE4EhnpcePcDOLvFYM3XIOk/JgjtVyaBPZSycLEhS5w+UXaLFUUuwYVfuZQYiZm5wTJYaPscrH/
	KcOgRHjdoNeZLhBOZnm+HKcVUGSTM25I3EhVvblsHo0Gl4eZVpKBXW91fn60T9ugoE72NS+ym7V
	S/cHyagxyPDew/whSGVa7KrT6rSNTu4WWazA9ziwO8f1846cBGQOg9KGI1zCNqEA1CImn27NoVB
	ts0ulWW9l2QKsrtQvkxwnookKYSJ26h2yFATWEOZeszR3+Fnd/pfIBTJofN/rfm/+jzOtJPKauD
	jVdZg47Cgq5DXIAg==
X-Received: by 2002:a05:6a20:3d82:b0:35d:3523:c90d with SMTP id adf61e73a8af0-39371b7d745mr4058830637.0.1770229702860;
        Wed, 04 Feb 2026 10:28:22 -0800 (PST)
Received: from at.. ([171.61.166.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1c0764sm3302188b3a.21.2026.02.04.10.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:28:22 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: atharvatiwarilinuxdev@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] apple-gmux: preserve brightness using EFI
Date: Wed,  4 Feb 2026 18:28:15 +0000
Message-ID: <20260204182816.1179-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aYNjob2b9MTusPvO@wunner.de>
References: <aYNjob2b9MTusPvO@wunner.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Older Intel Macs with a gmux can be booted in CSM mode (bypassing EFI).
> I'm wondering what happens on those with the above change?
> Do they only get the warning or do they crash?
> The warning is probably uncalled for on CSM-booted Macs.

I guess CSM-booted Macs would just trigger a warning when EFI isn’t enabled,
as efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE) will return 0.

> On my MacBookPro9,1 (which does have a gmux), the backlight-level variable
> has 6 bytes which currently contain (hexdump): 07 00 00 80 35 00
> I guess this is actually a struct of a 32-bit and a 16-bit value
> or alternatively three 16-bit values.  Yet you're only writing a
> single 16-bit value to the variable.  How many bytes does the variable
> have on your iMac and what are their contents?  I'm worried that
> your change may not be compatible with all Macs which have this variable.

This function actually writes 6 bytes, which is u32 efi_attr (first 32-bits)
and u16 efi_data (last 16-bits), but im confused about the fact, that the
hexdumps show that ur attr are different. the attr should be 07 00 00 00 but its
07 00 00 80, i think we should retrieve the attr in the probe function and use that for
writing. to fix this problem

> Finally, there are Macs which don't have a gmux but which do have a
> backlight.  They usually control brightness through i915 I think.
> It would be nice to save brightness to the EFI variable on those as well.

There should be something for Amdgpus aswell for mac pro, but i cant test i915 nor amdgpu,
as i dont have these devices. so i think we should currently drop this idea.
