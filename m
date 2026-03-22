Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D4333F5B8
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 19:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774206433; cv=none; b=HodZXK1V5sXIEwMJCcIeE2AOrPFD9PLJasspucjKpzLPqF7ALl3yd1gSHDDIvPuCEhFcpLLz30G3f3KbYeTAvHMN/gYXyPSIUpauE7HH8d9zw1/g78mXfVh4JWIDy5pOU0QXQnJEy+81DGUWJ6SpRyLx/1YelvwYcaUCdiCiZ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774206433; c=relaxed/simple;
	bh=WvvZe9qm8mGCLtutCHfaMJlMuhYYTtX1/durDzI0xMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGa4+IxbaCJLcPXSFzGWfk8z38pvId+L3JesiQ2HMIwp41YHPnbotpEeXMh0cCINJi4bM+tGSWqAwUPmX1YG0V3rdISIFNr0DVuMu8OkkrziDrtxMWHcWg2zRWFRZnrJutjF9g1ss8Yiq/HeLODLglWd1QKpDVsHI2Nl3gfk7Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+Wo8dlr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+Wo8dlr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483ad568d68so5249415e9.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 12:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774206430; x=1774811230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l9VajmJV6aLXZEOG/Vjknx6JpdR1ofqr6XV09TbCTzw=;
        b=l+Wo8dlrwKFUAhe6QGTPpF7bdMi1mv8+83AJLKlbk9rjYD1YKf01kKYqzj9gxM3uLN
         SfOB6EhaQuLhR84ljkrldgw2EByHc9KSvGCbTiXsC0S9tTtWprqbf7nwGFIuxt91Bg2j
         aPnw6bNpxWqcSzusBj+PyPiEKpcFJBjwR4yj0ddw43u/Giy7rjnBiB8nVyLk53gOdp5p
         LDAJF3EDrkcLC+F80vChFukAn2vQaShUahfkar1kaOUKF3LZ+/mm/FfgLHQQFSvZApkS
         5S6Trl9RILqGaeZaLzgzjODkVIn/FM1MBAwGyjxyh7wDWY0DmVwqsqjZkdCUXe48WHuo
         F4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774206430; x=1774811230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9VajmJV6aLXZEOG/Vjknx6JpdR1ofqr6XV09TbCTzw=;
        b=kSWMpa6s5fnscS4ieBK2uaWHDARhiqk2RAr/aOdirHI0wpQhtmXVDy1LNjGAf67M9M
         1x7OLHZS+nUsa5ns2LOuVvs2Ui5rFnnJKYRR1w60JUgU3fRUioZNytEYO7X8Xiz/rSEP
         zqKcTeWC4XV4GRIASF0AAplpoGYyFmXGMVCTlNis6AciLwltJeklp/30vj1bVdjRSS+c
         v4ntbhiv2FOvUSsPAD2qEwONZ13mQsh6MSjqilmCKn0ki3YshPAY9NSTbEpvgLGI4+1j
         pKnGjv29tLY6vBD/S9lv1M8PqApX+BWHLkPfmUBG6g/HFEkCgVH60RlaX7vCskhsdVTi
         IMUA==
X-Gm-Message-State: AOJu0Yzh13m7wGytKRYDopj1myERzd+K9pk4NiSgFfZnmv0wtBoKeEC5
	O9mulhj9vT83X6rJaPF649hOF7xd7Q8qe2pu8fqpysDaCQ7dYUJmztNxXFz02t+RWybilQ==
X-Gm-Gg: ATEYQzzmhVxFltoOPz3Vp9ALb0De/Keq7WWBi1ipS9HFWDbpO+QTVCy1l/6f4ggGEJ5
	07X7dXDy3CkeVPy7Yg3WYywCFgJ3c3D88AXI3Qc9j8z83IDuaGjhveV1hw9drNZxKTwf01aT8vL
	GM2GVhHxola/Eja72Zxty//M3c5ZXbqhc5aIKBSjk1CjJaAoYBko2THwDMZ7aVsuVGoIqAo5Acu
	U1hfacfUVMOVGvPPMaxFgMd03LNSnjnHncaOaVHlMLi1KbnHD4tcwBXwfi/2L/3nVy70Gv6rZKK
	zRJnm7zqPklGyRUB9bl0CFHgHRRx+TEpI4U1iN0Vt5e5qEMZhWpk8lufd1tn/neyMhNOUrEA6iU
	BvBCVvKYotajcHkmmhy7xaa8fGxDaN0O0Js0e3gz79LDfWaqxZiWg5/v6AzQn+1qLCie6COf6Gy
	0b6hoeE+LWoW81TlHu4gtS3wjTv9g9jnXQQsdbZ3fYV+zLqIv1EAaxPfaYjVQwS89WH03nAWs=
X-Received: by 2002:a05:600c:a43:b0:486:fdc0:4504 with SMTP id 5b1f17b1804b1-486fee0b930mr77673235e9.4.1774206429878;
        Sun, 22 Mar 2026 12:07:09 -0700 (PDT)
Received: from localhost.localdomain ([46.155.1.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe868cb1sm63340595e9.5.2026.03.22.12.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 12:07:08 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH v2 0/5] platform/x86: hp-wmi: Victus S fan control fixes
Date: Sun, 22 Mar 2026 22:06:19 +0300
Message-ID: <20260322190624.35162-1-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes several bugs in the Victus S fan control code.

Changes in v2:
- Patch 4: Drop the if (gpu_delta < 0) guard and pr_warn. A negative
  delta is valid firmware behavior on boards where CPU_RPM > GPU_RPM.
  Store gpu_delta as 'int' in struct hp_wmi_hwmon_priv so that the
  existing signed arithmetic and clamp_val() in hp_wmi_fan_speed_set()
  handle the negative case correctly without saturating at U8_MAX.

Emre Cecanpunar (5):
  platform/x86: hp-wmi: fix ignored return values in fan settings
  platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
  platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
  platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
  platform/x86: hp-wmi: add locking for concurrent hwmon access

 drivers/platform/x86/hp/hp-wmi.c | 55 +++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 18 deletions(-)

-- 
2.53.0

