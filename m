Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793046016;
	b=JUrPKP4xxo6/0N5+zxHlokdLMZRypGm9lirmLAJgpbViCxUQD16Rg2AOH7L2nZ+u+/fL
	 JmjboALT+LvJdGQXW0rQLVWjvXWnkRx/1SrtAwadrAyWtoKSqKNuFd/nAfrFvjG9+xjgh
	 Wb6/UDgaWWzioJhIeu0R7LI/c3WkFvobqChjyu/vy87OQRqQSKqE04xkmRLA1gAvoqTUn
	 gavT2Lo2ChxouUFn9O2Q3w792iCkG4OhFAki3p8E/JOx4x61WSxRnoSN0WtGDUBon092L
	 1U7Gf4OtNB0OgcwW9A2zVik5Gb7QOBQVWIwvUMFod1kCtxK544YAPBzKct0aYf6b7PQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yI8NIYe0+Bol/gJ1EMhySkKlLvDK0pmA/Aq2O12eoFs=;
	b=BVxK1IksFgYq/F7lxWTPSyUmYbwgtwA+WOT7tT2NkGxQl+kd3itrjKc2bETwG/yQK7Vz
	 whhm5bBO6qKdwvfL7Z4xTxDRMRElErMRqYorVS+ecRqoyTWXz+kaT06iF4Qv680cKwNHN
	 wzDLxQvGWTfPDufkc2U83POlIf5wNaDt1rFhW1IbFAx3w53oo0OPx+hx3B9j5tRfFvueB
	 jvje2sXRuik279qdMOGuJO17Ks8gaipistVRtCsFqkt/8pSa24LxvyOCSO/u/0Gb8lyAg
	 jAiiel2ztrdPS4QeTF9VaxMh/Mg5Ho01+hHY76i9rPc61WKIpQ9+3UtrCIcvktJYdNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=Wqv7FHdS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F84606A31D
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 20:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F84606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=Wqv7FHdS
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70b875f6f13so1991170eaf.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 13:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793046015; cv=none;
        d=google.com; s=arc-20260327;
        b=F2BARNJu2/JScQuMaDTkhbo4UvK4lAxL0bQEG4WDPMnySpnPxHbVB1ZMFJI/DsEWx4
         0rCpM0vAdjwc6BpqNHSvTU9gEprpq3baZ1B4w9MZmMH1i0C8cOpxh7ZjezQPdYXPRYUN
         GNpfWRf9DINawGB5B/OqwJIYwv4S4DABTBVHwOQ3H0kBwi5SXSF/bDNyRG+Peq7GVv4x
         CLeSDBbHUovp3enc8KqBy9SdibRptiT8i2OAfzAcUsYNpNu6Hk6jnuNNlXnYz77pR3Gx
         uFOzB796DdoJfeIAGyqgTwBvkVTMgA/cEdIi46XQ5hjSHAhhw+/DzO2d+/41MNRBaAwm
         oR4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yI8NIYe0+Bol/gJ1EMhySkKlLvDK0pmA/Aq2O12eoFs=;
        fh=3bK/ITSpUyo9rmm4p/6FT5y8mk6B8hWX6MxezT3AafI=;
        b=c5qaU5m2FhnnHNAWGaNKmeIYhjoXm2+kQGiwlgK71IcbJgDkiWmyb7Wam8R2bOCz/r
         ooaa9SBAilN7c6iZ9AjaDmzD0wtGu/y4XkrLSkL8lueL07eY+2QZPOPH+SwNPKKjoJgj
         ZKWK6MKSRv7bI+pb4V+2ISbjfLcrTdXyaXU81fviolPtg2XMIhw/NLn6xBvziV7wtDX9
         zd0qqYiVbqOBNEumo5r0rmrF6nzQLhBib9UK13JiTwV6h8akhEqrXiHeMT+JzZQYBdf/
         Fxrp8x791pURp3QqNAeNOak5ggeMZ+CO4HyeoKwCUnqYXUQsMArZglRXDTrR8Gsyb0DH
         uuZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793046015; x=1793650815; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yI8NIYe0+Bol/gJ1EMhySkKlLvDK0pmA/Aq2O12eoFs=;
        b=Wqv7FHdSbmnkEZWZKou0EVbamRgUMbEnMjQsHQ+t0skYJ8x3TOVbvI+C6pyF3OeIvE
         /HaWcIaTTF2pHq+sO31WaVjYwZSrWvJVHHfnKQl7jvDrClGRz0DiixoGp5BKNmGUMEVd
         d2i+0GXhnyeJwUSHUEqgxUr8YKDn25xVaOZ7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046015; x=1793650815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yI8NIYe0+Bol/gJ1EMhySkKlLvDK0pmA/Aq2O12eoFs=;
        b=KbrFyZZx7sdSabeyw3LU8Er0XCDePFCcFU8oIcfF/NbJtMScvljRorW49Lvm6m0fNc
         I7fPyxgYkUBo/CvqxBaAr+geiy0L9x6FlyBwvwKOSojwkzg2b6MbvnCwLBadqLk8v7jW
         D2Fu9wIvwTFbGWBGKuhNLYDVhq1aKKxBkqg2LkSf9YW1Qat03NbAoXGC4kqHJ5jzDsVu
         /7sCsBsJNpIPA8gyBaAvmg/1KzXVCZanwqAmD87w7DbaQnBs6C1Gq8o9q0ONRONMy6jn
         MDi7IGPXlYs6yUCyDeYV5tPqDZQXfibgJmdOjwHYjASF5DFpA/jEoU+GaeED1PvQbMLu
         Jc+A==
X-Forwarded-Encrypted: i=1; AKwUvBx7TnLaOyBVj5j6nhklU8u5AOMtfNPe3Py48BLGL0jYUGkLb9I1Lk2RIQDMJ8VsH8yatKJwPD/K1rODplUARFzHh1Q6@vger.kernel.org
X-Gm-Message-State: AFq9FYKc2XIGLJ06D8OTpGoQScs6eHBRikRwSKqJvm59Z4sL4fAH+sTH
	cYV0E86rVsZW8h/0DHkeVAW6C3YInhZlkst/M2PrkL7nhPbKYX14uFYPif08H2RUKIonB2NrcFa
	AANxbDPra6eh978D7A0RgjZ9+J0StfojQUNsP5vL70Q==
X-Gm-Gg: AYBFou1Yp3YgkRM1fGI38YrlLRetvzYEKs+UsaDUzAgcKJb2m9XiOPvLwaolYlUUFJU
	7o1IP17c/cAjM8+z0TEtVGEDwZEC8J/jLVuaODzO4vrcTqW2B3Hyc2HkohGrY0Vw1IOCyMac0UN
	Q+R26AVrPPemr4hKTRfhSfuLCyo04MSRR2rBue3nTwBxjOyx6zrc/tdJxVzRL2/ikt4BFdsWnvJ
	YYiv96NgCmOSMrTWWN7NH7d89J2ETieRVo/H6aqDeLhgruY8ID7DVwvej/8E6x75TbaAsCFZslR
	/uos8QM8Xybfd7Aj8G8nJtVMDBK4qhcTNaX3cPL6JZZPPak/nfdYIZzmQt4LsqtN9qgg40Hem9z
	GN+/G7ybp5BaP+pbwtidzMQgRf8nTLAW1Lnz9qSKRdAKBNYjfya9kHFq/ljYiUGbL5vkgK3vFXB
	zD86Ae+UYq5vVeYImEK5PIBmXLMg==
X-Received: by 2002:a05:6820:80f:b0:70d:1692:14fa with SMTP id
 006d021491bc7-70d169217b8mr2719253eaf.13.1793046014871; Mon, 26 Oct 2026
 13:20:14 -0700 (PDT)
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
 <CAAcRvKNvBKwVcPQ6vv-+OGZdL2Gxd-ocNyvZO_q-g083QNfR5w@mail.gmail.com> <f2dd98be-0551-4857-93c7-59ffad1d3e88@kernel.org>
In-Reply-To: <f2dd98be-0551-4857-93c7-59ffad1d3e88@kernel.org>
From: Chris Taraszka <chris@miget.com>
Date: Mon, 26 Oct 2026 21:20:03 +0100
X-Gm-Features: AclHuK_C4jDOc7B5wvmudpU7dTFOTFpoeFnKoV-Igr14sdRWVz-SPTC7zmvQT8M
Message-ID: <CAAcRvKNYkXr+eor3JAYwO17vckeVAmYT+Dp+-wMobMmL40ukBg@mail.gmail.com>
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
> Hmm, I wonder if this maybe sends some scan-code on the PS/2 atkbd
> interface? Windows must get an event somehow ...

Hi Hans,

It does, but only the plain Space scancode: Fn+Space gives scan 0x39 /
KEY_SPACE on the atkbd device, the same as Space alone, and Fn on its
own sends nothing. So there is nothing that tells it apart from Space.

> Ack, this sounds like a case for calling platform_profile_cycle() if
> platform-profile support is present.

I can send a patch for that on top of Mingyou's series and my TM2424
patches.

> Hmm, if the value-low toggles I wonder if the firmware also mutes
> the mic itself ?  This may need some special handling.

It does not. I played a 1 kHz tone through the speakers and recorded it
with the internal microphone while pressing mic mute, with the PipeWire
source forced unmuted: the level stayed the same with the key's LED on.

The LED is driven by the firmware and follows its own toggle state,
which is what value_low reports. It does not follow the OS mute: muting
the source from userspace leaves the LED off. So the two can get out of
sync, but nothing in the audio path needs special handling.

Thanks,
Chris
