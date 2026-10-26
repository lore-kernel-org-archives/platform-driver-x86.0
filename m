Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013018;
	b=XYp4iFbH2LUTXE/TtVFJ2+q3n9ZiH950iQcMO9fOgNdHPhrAfnzeVMYM0YThIjbEPy9+
	 Yj1jLpPmxpWPuQDMG38AdeE5wzfuBT1zOl6pnvFnqEAiTzASld1ohMGOUBWViSolPVKBP
	 3IvLGgMm2t9O94kFbS5qaymLMVbFm4Iv3ZJPi1nMVpoovXo9lUiVuXtWTKeZ9ueXjxk0d
	 N7c+ei5UsXuQj1Gh3f6ftUSM4Dt5K8iiM2kFkp/lUiDBkZCn8FTZ2KkP45ZfrCShTaFIG
	 ZjBNN8fMdaKvEP6WeyXnHGuxgZl93HaZwkLF+IZJkqRW22xu2pFZgbGzulT9a+66gUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WfWK7ETWVc6JPLXBBH1usp1GYHzRwLQXcJjehdWx/dU=;
	b=kdX7VcmZZaf/HEkNTdafk4mhhV1Aj6ed+pvPvAr1yq8OClHWb9J7NnDswcSIz4nRXOv4
	 wwfKMSd5KX2kqTpJ8Qarp7lY9CnOjfQVn50rsiab1gtps0C73gOjCNQC6f6vXTXF35Ke3
	 hjYo3jz4inzrZQw2xZhrsHZ+9nMaVy6ostOQhA15H6O3wqyKJ6F0sb8phhgk/xknE9qYI
	 B3XxXLYoSkVNaiEf7iN19mDYrOdztOykeS5Gn40MgrpoTFunKxPbRBHigCXGSdeCFpSnO
	 nunNYxLGFhnPHa7IqUr7xLU0DYnTxejxMDDSWOfep69U67Q8eixSkRE/PUrHJvyMrfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FF1MZ3tb;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917CE606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 11:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 917CE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FF1MZ3tb
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so21488965e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 04:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013016; x=1793617816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WfWK7ETWVc6JPLXBBH1usp1GYHzRwLQXcJjehdWx/dU=;
        b=FF1MZ3tbfMa+I3Hp68i+GoqS5xJQCOAdAEyU3AgVRrX2Vlf8WAQZW2Grn+avxiLLI3
         zdyFYKtS2WtCeGEOowSYBKYvnBZoK6tP4vh63lFMovCllUsG44h+mEz1IP6VvoGlkDXq
         YQuSCMIIKLJxsmdEVQiN8lNZVo4pv6I/vH4DE8Lz5sTIW+YC6TN0F79yue+AirnmCI1g
         hsyKgsxNOhuJSYTB2XYn2ufURC63XVMPEW+7g3mTqpw+6CTLsASK4oTH37/2KjxQhBi8
         ZPP9bS++j2T8OH77fGX80QI8Se2YofnpLSQvTal0KDEw2Pc7jKpHmlg/EtqEoG8Ga1WQ
         /V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013016; x=1793617816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WfWK7ETWVc6JPLXBBH1usp1GYHzRwLQXcJjehdWx/dU=;
        b=VMh/Vtkg9J89kjqaz3G/nvipOiZ3GvReK9BvsARYOpcV8TZK12oW/RfP1JXhhfBfUB
         1VU9NSuPcqwkmKQRBu2LbPTB1cGhl+q9cWRoS2IfAbaNHTd4pS4hyBljZtNLWhs3IVJx
         TD6MC38tYyFOkEGeEt6vWHCIuL+W/LaIs9E1Q/Cjy6P10YVyA3iC49Eyi7jT9cwy/dJ5
         ojEEhhOa7mWHJqvcE5BIdX7+aNeeKgHDSAjoZ8rae4ewAcO8SioghpyCe9hwKS/3bMq9
         zymBYyF5zyCn8I5u2W4/oJEt6EOAoyzKqAz8TeEdcM0Ay2XhyEXRf+YSv8NW7zPz9f0H
         /l9g==
X-Forwarded-Encrypted: i=1; AKwUvBzBcICV4syxv/trcG0TFeOOL0yP25uYgpu/koMvIS64BZeDhd2mDZQLjoGqqBLnQuzuI12frxsDDX1pGbDNKsCO4gnc@vger.kernel.org
X-Gm-Message-State: AFq9FYKInfK0PkgIEkcpcht5+gy/eRVkCneFOR89H54/6sVv907Kx319
	w/xGLlOrmBnAk4f6vRmtL4ZEIESAhI5U1OQvh56ps4cJ0H8W5eJjNVXE
X-Gm-Gg: AYBFou36bpJD1I/KoG6qmy51y683reU3mGPrnT4DHMWpm0K/t+EqC1laryKVxvWpUpz
	a8mtMbOPMLlXFVUshUTtqvQAivrGfQE6fM4SIzDKKWf8B6EK7VaY2wjOXFFVhV8g0/asBqR+KYf
	aiifRZxvgoVcdR4LAw6EfoR8QAPJsmvsE5JTvcO/HufuKCeAOFkjxSRkM382jdKTc3+fJyNFDtW
	POK0qLtOZPODqpKKP/krGCCljySKF22kKY5aDVwumTlzlR2+EgV7In9rw0X3cPUsh6r9vt5vXvD
	iatp0KGLSXIiJ0PpP0ChfxekEa/7rvTryaiYJ23aygK3uG6WSL/oOODaseQkZmuVxXVfUUYyxRB
	rEUynOrRoiuNq9sgWxcZ4CoMkfsGvSHSLEBqsTCEQ5FGOZlsuQK1HGTIQrxcWucZK/w8ZzHvbBV
	qAEhU8K0OZg4XUHf3pY9+Ju5M463b35vjKpsr/xYv5e7TaX5Ri1xDpi/qJES3lwiMi+AvTg4c0v
	tgqO+Z5lGUFuV/anal9nVZ8O+55dWEML/YEbSsa6m8e/OatYr98XrmnsiwET57qlEJUxwbH/jsN
	qZZaEJPuMmfPfg==
X-Received: by 2002:a05:600c:b86:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a35acc1129mr115388295e9.33.1793013015679;
        Mon, 26 Oct 2026 04:10:15 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm499383945e9.1.2026.10.26.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:15 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Hao Yao <hao.yao@intel.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: int3472: Use actual clock frequency for DSM method
Date: Mon, 26 Oct 2026 11:10:10 +0000
Message-ID: <20261026111012.33347-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025162614.95385-1-lsa.uz@pm.me>
References: <20251208035122.2147678-1-hao.yao@intel.com> <20261025155048.42957-1-fernandorimoli11@gmail.com> <20261025162614.95385-1-lsa.uz@pm.me>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey, Hao,

On 25/10/2026 16:26, Sergey Lebedev wrote:
> Fernando, a run with 0 in place of 3 would tell, and your own DSDT
> whether it still matches the dump.

It takes 0. The DSDT on this machine (BIOS 23.102.143, 11/25/2025) still
matches the dump: the clock _DSM on ICL0, ICL1 and ICL2 calls ICLK.CLKC
with Arg3[1] and then ICLK.CLKF with Arg3[2], and CLKF does

	CLKx = (CLKx & ~1) | Arg1

with nothing masking Arg1, so 3 also sets the enable bit again on the
way down, as you say.

I changed the int3472 discrete module to pass 0 when the SSDB asks for
24 MHz and 1 otherwise, so the two 19.2 MHz cameras get what they get
today, and swapped it in at runtime (the _DSM runs on every clock
prepare). With the previous driver at 600 MHz, the infrared sensor goes
from 57.60 fps to 72.00 fps, which is 57.60 times five fourths, and back
to 57.60 with the unmodified module loaded again. So 0 gives 24 MHz
here, and 1 and 3 both give 19.2 MHz.

So the value depends on the generation: 3 where CLKF takes two bits, as
on the Surface Pro 11, and 0 on Alder Lake, where coreboot's Tiger Lake
and Alder Lake camera_clock_ctl.asl document bit 0 as "0: 24MHz, 1:
19.2MHz". v3 would need to pick it per platform. I can test it on the
Surface Pro 9, and I will run your driver at 396 MHz with it then.

Fernando
