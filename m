Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793044586;
	b=XXbkHSJQXIRgoSd2ZA9pMIRjB6+Jc/KaJ4a4mvhxc10zX4KJBXSXN9yGTCuj30+mjbDM
	 WgnlqlfSh2qhW9mGH5khAKljPk9OAICWZ4oOOXdzKCgBFEHj+eTMPGpyUWeVAo97MjtF6
	 HiAf3RILM/10xWtR6hOfI86xEbnaDskPl1CiLob/LXgAE1VXF6pQj/NLB0g1zSWO5/5cT
	 3+CJVbNdJQJx1SXDIwM6y+JMIClyHr6JtmAwyVHEw4e81cjQBssVPWTOmGnJYuN+3SA5X
	 pWaywZfnVTuectpN2oyhdCagAR3REO3MzkluEwRDbQcQyBQiC2d2yBiyER621H8uvfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=bw3zcs9OCbVxPKXmVvvf6x20lJj+kiaqirGUqMRcsac=;
	b=XFXi1MJ4iFOezaETHHxFhW2JN1KP1uJSeh0uuBYrTZQfN9Zsx1CI0BUDHkN+9Z5twjOw
	 HyRUR71V+z1blAgUhpc1SZR6iZyvZkwd4+MJVAV7E5Frid3pcLGDFC1WRIcIRWboh8EeL
	 QBYd+D3ysfP/miBo7DiMEpbXpsmtJzXoqphAR7btNil/JuekRa4+1bgIJMVjl0v/0rZXx
	 8I0wTPLRehOpuqlcZARIi6Khlg7cLdIGBWRg09z6ZIKAAw5MGlG23DsDOXBB4RZWkhRHz
	 cRZCeMTk7hg1xoSHpHlyZGiusbFxyz+AZwckv8OGcutfh8xVTlpGAqQcUmHW9r1fzvA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=FjhN2fOf;
	arc=fail smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BF3606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 19:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6BF3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=FjhN2fOf
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-84a248254f4so2229389a34.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 12:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793044584; cv=none;
        d=google.com; s=arc-20260327;
        b=iThDn+Y/vinDRNQa5pzqacoDfZWICUaDjONVR8KJe9XIfVRCUbF5DPCIEDsVUrOF/H
         Vu6PtUmTlK2EJdBRV6d9PpgR7PMEb7maFbIS811Dclv+5SrUZNXeIBCmKTiN09kou/B5
         6OODfQI7jJhhGdRpAKOH5Z6/gEamct8OsSGP83RiJpqXxkRvtR2E4HYugcG+t0Vn1tbM
         DyFbEPSNpLjU8EwTzvsr+6ZYZi7m9TzGqkPsQg2YHJwkNaKOjPsVxx7c6B4PfOEsE2oR
         6hd+VCF/HtN0qKnb32sIPfk2drzgFVOcxqrCOHf0ipAhqHHEPbHKO/XJAxDiVM/8DnjD
         EfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bw3zcs9OCbVxPKXmVvvf6x20lJj+kiaqirGUqMRcsac=;
        fh=UopKQEuIze4DU6axANfANVeIHBs5/2HGctKRiht93UQ=;
        b=gNf/jtgYE43mlf2ipei+kuftvUpg6LsXqaqGnEAKL9aQVZzbyQjkBtmaakFStJwBw+
         /qmoBo8KLF48j2Va5irtD6YIUus4fzhK1bdtlnE22YuPXhvII1Bhx4RHiT/O6bArKGdG
         QYSPbC0qyV7m3nwXSCN5VUa6HWttfwQXXzoUs9onNphKfoswPzdonW7oNgTVh5g1y1KI
         61oRe1mqGniXSpotpDQ9MpzgAwDRSrvwGgE9faKCEMWyZVB5k+iG/mU/k22S2Gn+4bs9
         LIdwD34iGxL8zhvN8fYBDQqH3CHZQNYLVBdHm553aDgKKFkv4zc0p8sAhHb3YDpjp9+M
         YU0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793044584; x=1793649384; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bw3zcs9OCbVxPKXmVvvf6x20lJj+kiaqirGUqMRcsac=;
        b=FjhN2fOfBpI+cGXLqptMyf5A3sfLAycYcl/1O/P8veG5Wrp5iImAZYwHLYg52VIxzo
         XCsoJvap1YePFVeOH7weMMUUjTw6LH8qriINxJYH56dnO/SaM29W7qUFLptNqBEApdJl
         CeZQpPFJfzd+kkhA5pNd8K8scvu42pKl1os6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044584; x=1793649384;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bw3zcs9OCbVxPKXmVvvf6x20lJj+kiaqirGUqMRcsac=;
        b=DZtVsfNVXWcWU+4Ss9E0MKTjEdK4O8qWzcsj7IBs5K9FbnTEL/IBydi9LBql9jQqQD
         A3y7pwnvxCPftBZe9/iZ2ywqlFobfPNswXJGw/l8kSVPnK9ykMOxD2zGaKk07MhoKy7L
         387HreQGQn5Pqc0wumtptftWEz1tRTwLU2/vYhtF8kiclAZeHTQZ27X7e0xoSjqDclUt
         9qy6Z1MLmXWc20j6KfguCEjA3q7C7QowBJjVcit3m//7fl9oIDEbXMJ1ScenTuTYOaOc
         OcyG4QsUp2wGSpWBKe79dAvBlRD5eX3HYqPTlUXAP7o8RW3Cb7drZtYkA2AYoG2uVGlX
         XwaA==
X-Forwarded-Encrypted: i=1; AKwUvBxxC2v03cIikvKadBHmMOd4L8iVIsvSd8/vW4YPxZjw0tLzLVustEni2YbYyWFszEMUlegoZ3ZYWAUMzU2IAnQniKvq@vger.kernel.org
X-Gm-Message-State: AFq9FYKIBYRhIBqeJx3gb6KZjpuao7aRieabp0aJVV8cFXz4qfchKoJA
	R/pYMqeYD9t8DT6ynQuIxadCVPZ8PAXiXqDZOeNSdsa+drsre/gkaLv6eHC55JT7j30Q7QvlLMA
	uGpY8hs5P7cT0RH4D7bt6abJQBClKFSZLHO7HqClU1g==
X-Gm-Gg: AYBFou0PZbijWhdJ6h3/9L9S+X8q24b9hRU8HwG6nvF1jKcnZF7vvC8n3/UvbqsO6hy
	iapo6xfFUhmqBjgq8Ztq3+vd/4aLqMfP90LtRxi1Wty1ci6lx/rTSwk47/XZNc35P0jPHtYWU1c
	7o8g5YwjqZlUoi4J3k2QKJckgNT9wQXVsKe8b77Rsuiv8KPTinwoP/WRuakR9ltQUVK8ZhJ88tA
	4iG0Z0g+bW77KJ84h1Qs8lShYlGZgW46YXiJK9X2Orzpx/Q3PHB6gCRjQXQOafkwMtzLotH0fxk
	uFDyCCu3PeL/HC7dGDKSD6FEqC8I+7VWTpZBiObhYjg4eo8lOm9VrmibJVjj0FTpA5ssWtYd/sJ
	53VAAv9yiSoNbLDpniY+DHVLvsDkTxLp3bgXdTY+//jC6zXIGXr4NtC+bZ39jiCjcqEkn519ECg
	vz5Rv2aoW3KwSZgS9rEfKc/w5817k=
X-Received: by 2002:a05:6830:2b22:b0:81b:ac9a:5681 with SMTP id
 46e09a7af769-850ff682860mr6894572a34.29.1793044584271; Mon, 26 Oct 2026
 12:56:24 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026102101.224568-1-qby140326@gmail.com> <073e6aaa-12dd-4fc1-b7dd-4d27cb4e27b6@kernel.org>
In-Reply-To: <073e6aaa-12dd-4fc1-b7dd-4d27cb4e27b6@kernel.org>
From: Chris Taraszka <chris@miget.com>
Date: Mon, 26 Oct 2026 20:56:13 +0100
X-Gm-Features: AclHuK8ub8G2xNuOS2jgi3E8TzEpZ4ExekjfnHkszraiohKuf5vnnUyhTeV8DHc
Message-ID: <CAAcRvKNvBKwVcPQ6vv-+OGZdL2Gxd-ocNyvZO_q-g083QNfR5w@mail.gmail.com>
Subject: Re: [PATCH v14 RESEND 0/6] Merge redmi-wmi into bitland-mifs-wmi
To: Hans de Goede <hansg@kernel.org>
Cc: Mingyou Chen <qby140326@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
	platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
	Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, 
	Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>, 
	powerfullz <wleizc7319@gmail.com>, =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>, 
	=?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe <i@rsplwe.com>, 
	Bozhen Peng <bozhenpeng93@gmail.com>, Anton Karasev <uselessfire@gmail.com>, 
	Jame Jao <jaojame6@gmail.com>, Serhiy Shliapuhin <shlyapugin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026, Hans de Goede wrote:
> 1) This assumes the event indicates a platform-profile-change has happened, if
> it is a request for a platform-profile-change then platform_profile_cycle();
> should be used instead.

Hi,

Some data for this and for Mingyou's KBD_BRIGHTNESS question, from the
Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A), traced with a kprobe
on bitland_mifs_wmi_notify() with v13 on v7.3 (v14 has the same event
handling):

- Fn+Space (keyboard backlight) sends no WMI event at all, neither 0x05
  nor anything else, and does not change the backlight under Linux. So
  this model cannot tell whether the firmware handles KBD_BRIGHTNESS.

- Fn+K sends event 0x28 with value_low 0x01 on every press (01 28 01 00),
  not 0x16. The firmware does not change the mode by itself: the
  SystemPerMode value (EC 0x68) stays the same across the presses. If
  0x28 is the performance mode key on this model, it is a request rather
  than a notification, so platform_profile_cycle() would fit. 0x28 is
  currently logged as "Unknown WMI event".

- On Windows on the same machine, with Xiaomi PC Manager not running
  (it fails to start on this install), neither Fn+K nor Fn+Space does
  anything either. So Fn+K looks like a request that Xiaomi's software
  normally acts on, not a mode change made by the firmware.

- Mic mute sends 0x21 with value_low 1 and 0 and is reported as
  KEY_MICMUTE, as expected.

Thanks,
Chris
