Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2242C34DB72
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 06:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244438; cv=none; b=tvbe4bVtEuFA4S/3s404jSjYQvQ68xe+2mgPDmNLQrjPvxQY9sdl5cdXkx9L8f7pKuCvcYua09HRHJEPzMSkikl4isoX1W35mML8TGDFd4Ae4y2swJ7lEG7rPaUq1qbh/SSiiSbYae4ThyohHMYJ0hw2E48kw3Ip5ULGekuc/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244438; c=relaxed/simple;
	bh=3MN6mJw7rnS3zO50ztLcXj8mGLoxtAzQ6H3bT8/qQvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6xx+G6G/EcOrwC9FvsNW9qby3tUDw9QZvRAzv/7Oq3HJ80lTWI3f1rxmKSgMQwhoFrd119E+H/wrBlX+QbDQPf2qEGOUDFiVjZydqn+XDZ7l8uXdQrAvjFusdWDfRz2pXH+ijnUgG+U23qmfZ2XZltP6NJwiKsvubbxULROobg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+vYFkJ4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+vYFkJ4"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so541512f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 23:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244435; x=1788849235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nS+2pInjOlXM2iS9Ri0UnSYcq50eo6ocFMYoCRo65n4=;
        b=S+vYFkJ4ViU6+axc6o1UkhIDPPx45QX1OZWm2YobQ2pqnmt/8PCDOWp6fUnQB1lFt8
         NDRYDw1JXvyxcFHt6KU6KMBeU6J9Uqai2tcaIqBah0M1uvI7fhvhoZafZZBxEDyL0y6+
         79VoNswJEIbbIVIGtpfXD35P+1BvAeCIe9D0NzJ/gBZsPqi1J5zrazceeWryrvU4BH/M
         91NdHwkVm3lQD+xZc2mQOcLHuXwaoaI0c2PxYFhed832ZZxnZYEijG0WwU35WpvBvawD
         mVM39Th6a3XPYhIEecZcR0RUfo2ACPwG9UUu8I12oaAPZ4zXTWJnv/kg2kdtg4Rr+eTt
         z/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244435; x=1788849235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nS+2pInjOlXM2iS9Ri0UnSYcq50eo6ocFMYoCRo65n4=;
        b=NQ4IA940XyOowaxBBDppfCp2tMWxNi/YaLJERV/GpO/CXN+4Ng7rY19duMhOneEQMP
         hI4TdGjLufbtjhQQD30JY9OM2fSjTPW/3RkgDouYdpVw0PrTeEbizXG+8tXRtTm6+tNw
         MiKRyW8/q2qoOhGSJ5JAJ6etqGwxjDATa2uIHV425N53Y6hlH7/w16QDO2pOaPlV2zn8
         9n5ExhMLkUUSKARDuyE+VFqCJCOcb+jRcp0159pu5osDKNzdiY0gS2GAWLi6yF7FYJI/
         DT6R9FMknWCiUxWDlAWuK6RvQ5hn7VL+82cSeWF/WuWqkgUpZ673q7mdm9q62InYqMdC
         aSoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqzyoe0c3loziTk4uNfpiLDj6C4ho034rK39kJSeH7J7q6pqIIUfqR79XiizJjN2OFj+Jek7WeAczU1d4Qu9uMqipAu@vger.kernel.org
X-Gm-Message-State: AFuF++k/sR1rr0lx9rJM/Q1BRZaxI/HTE4BuSaRqMLBgdhh18QwFZQem
	viAaIst1qDbZNZR1StlBCJKU9837sSRdMtrTSXHYA60HZ87H1rVuk2w=
X-Gm-Gg: AR+sD10wKY+yiVgwhunPKb3nTZ87+VJkvdKC8RkvFLvSFZuozSwxDHlBXJhrzpYMVRA
	ZZF4YKnzFBbQnbLizkayCGIYhS1abnW65cHq2Ov3u3dY3AxpJaRl82dRBkXYmZQgZbhYAgFPhtt
	rukTDQHAYO0bjPmPCo1Y2ykPeUWmpbAZXf8FL7HqbXNdlPjt5d/sqQggZCY9HeEX3V6+S8ePdVT
	hKZpI0Qj2amufIPDKlgn99p0soBQe34GHbOaMwIaaNtJho6s7SEno2l/coMMTA8/NxiX5UjfY2x
	UHg61odU0WyfSgilCoWI2zHFYptwiePd3WOjfq8YHBxxaw7IawpE2hP6gYKdFUBlt02qs6Yc4sI
	alS78sI18Ywn9QRLKOr6/vUcKWxxTWWKOU9n0o0KMDm9tWT55xDFzEbFy0yCQc1SEvpgopDHPMb
	uafRC+7NMgPTB6zdihIykyJgPiy2Ed/B2yMCb2TC/kr5VnFu/cYvOCHumC3ypJ/r4KPEG9hGEXl
	RYq1xJ8hqFVaBR2bC/B1fM0q6NofimqV9BfA3g9y6FQ5g==
X-Received: by 2002:a05:600c:a55:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49b91c4cc2cmr543640105e9.13.1788244435072;
        Mon, 31 Aug 2026 23:33:55 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce171c3sm47078975e9.8.2026.08.31.23.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:33:54 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Jakob Berg Jespersen <dev@berg.pm>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Tooraj Taraz <tooraj.taraz@yahoo.com>,
	"Joseph V. Lavigne" <jlavig88@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: [PATCH v3] platform/x86: int3472: support the POWER1 GPIO type
Date: Tue,  1 Sep 2026 08:33:53 +0200
Message-ID: <20260901063353.67252-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260829-sp7plus-int3472-v3-1-454b50485ce2@berg.pm>
References: <20260829-sp7plus-int3472-v3-1-454b50485ce2@berg.pm>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since this thread is where the INT3472 _DSM GPIO type codes are being
discussed, relaying a piece of vendor-side documentation that surfaced in
the linux-surface work: the type-name table inside Intel's own Windows
driver. Extracted by the tester known as fildunsky on GitHub (relayed here
with their permission and at their request - full context and discussion in
https://github.com/linux-surface/linux-surface/pull/2252):

From iactrllogic64.sys, "Intel(R) Control Logic", 04/04/2024, shipped in the
Surface Pro 8 driver package (analysable without a Windows install):

  0x00  Reset          0x07  Power0         0x0E  AF
  0x01  Enable         0x08  Power1         0x0F  IO
  0x02  Strobe         0x09  Standby        0x10  Avdd
  0x03  Torch          0x0A  WriteProtect   0x11  Core
  0x04  Flash          0x0B  PowerEn        0x12  (Handshake)
  0x05  LedRear        0x0C  Mclk
  0x06  LedFront       0x0D  PrivateLED

Extraction data, for anyone who wants to reproduce or challenge it: name
pointer array in .data at VA 0x140021060 (file offset 0x1F260), stride 8,
indexed by the _DSM type code; strings in .rdata at VA 0x14001E4C0;
SetGpioOutput at VA 0x1400027C0 rejects type >= 0x13 and indexes per-type
state as base + 0x50 + type*32, consistent with that layout.

What this does and does not say:

- It confirms 0x07/0x08 are simply "Power0"/"Power1" on the vendor side -
  generic numbered rails with no supply semantics - which if anything
  supports mapping them by what the consuming sensor driver requests, as
  this patch does with "dvdd".

- It says the vendor calls 0x10 "Avdd" and 0x11 "Core", while mainline since
  v7.0 names 0x10 INT3472_GPIO_TYPE_DOVDD and registers "dovdd". Worth
  knowing, with two caveats: it is a single artifact and the electrical
  claim is unproven (the Windows control logic raises every described line
  in sequence regardless of name, so a working camera under Windows proves
  nothing about which rail is which); and con_id in int3472 follows what
  in-tree sensor drivers request rather than vendor naming anyway (0x0b is
  "PowerEn" in this table and is registered as "avdd"). Empirically, on the
  Surface Pro 8 the consumer of the 0x10 rail is the ST VD55G0, which
  requests "vddio" - lining up with neither name and resolved there by a
  per-HID mapping.

- For the enable-delay discussions, the same binary's power-on sequence
  (discrete::DiscreteControl::SensorOn):

    Enable -> 2ms -> Power0 -> 5ms -> Power1 -> 5ms -> PowerEn -> 2ms ->
    Avdd -> 2ms -> Reset held -> 2ms -> Mclk (or the ACPI clock when there
    is no Mclk GPIO) -> Reset released -> 2ms -> Enable asserted -> Handshake

fildunsky still has the binary and is happy to re-check it against specific
questions; anything for them is best routed through the PR thread above.

D. Manresa <dmanresa@gmail.com>
