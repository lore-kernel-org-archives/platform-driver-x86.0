Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F6C248F73
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940563; cv=none; b=eWbucHJ5tMXJL9zUTSBRWOuZJDmrhcdigjFFoOfjYKgfhAfgukkGoqAp9tICvmgcFgRGxqH+WK51hqwH9cw+JykKDhkDKnjNAzGwIhMGYt+4C/1wnUwaRxKmWweQADKnZJkp9oX8otNW5nuNy6cJZ91UWVBF9dmjRvpvvczpbuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940563; c=relaxed/simple;
	bh=MFagdxKbayikzJggDuQHwidUYx5+Wiq1MGiWqy6MxUQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fx+wbj5t/Ju302LZRDCTGdSxKuaHbmlkbLjg4L+PRhe8GwwL/8yXwIVK+q4sBTjwSaeXyBXSYqQOzf6cr9YQcBbakfQQXGb8u/d2ucMeVq5KabrTf1epSnvmes6vEHylqeXrAwKqlmzbBgt5mBu2KfTubBfCqet/nAjnvdwiuGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=Ywox/kHZ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="Ywox/kHZ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38175907a56so3083778a91.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 04:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1783940560; x=1784545360; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FRGrF4i2nmK2rkhMiQH5i1w4BrMy8RzeV71NdueHFlU=;
        b=Ywox/kHZyepBV31YUOq18ecHmyHGhdBneG7rmGAYk0EpknxPbr+Mh7UX6BHGeCGyS7
         K428Vzb6BbHL/GNWDgEYVyj4uGLtlv2ZhY7X2Q5PcBXNpJpqqhZLZMalYvNzJ1iJdQlq
         6QRRpMPnWHHbWd1krikjIIljGeFEbpj7ll6FCFMU0Rbz/YkYmiUWdMjUvpFDWSV/RK3k
         KkANY8B5lOQ8EEnMEwAzQK/BTyW+jY8muUly46nX+LbUFlaczPr3z69nRtj+JL3xk2fX
         Tl2kDhwLei/YGT+v1K34R+K1eQnOex7yDluxMjxFoIn2HnWsspNc3hEWgUPVi+W21H3K
         xFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940560; x=1784545360;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FRGrF4i2nmK2rkhMiQH5i1w4BrMy8RzeV71NdueHFlU=;
        b=bowHoUuEbVkNBzYNFQjMM72OzQtre627v8bOGgcbyEii6EdhbCpcv0cuOGmDEGJMbX
         X/bkbJFlKje+QReKH+D5Ov0Hj4BOgRWxGxaXX4w81TFuDkBJAtYMAD21Ku8iNLvNNyMR
         2XLVcpSAEtOWHcfWblYAIpuNH6SokmSzwxIlyItx+cuiEYnpzJM8onlFIUKwrMBKbR9K
         1pZdBYeXfLLxVqPCSz0pkX21bDh2wESUsM5Fz15JNjBZWnwHVHabLwm2fTMFSVDMx4mr
         nUqroqUhWKkzfauR03A3cOzsgfb3Dyj4zyMNIN5h7QAz+/Ah3cg2ZIXwex6pFpDXRSWa
         uMkA==
X-Gm-Message-State: AOJu0YxWA1zCYZ11XZEaXn+10ABGIRelZ2GGvzoolEY+wi+PT1zK5bxU
	R/gy4Ar364OcdLUtliQnfwuCzQEA/CVFnNUJRvoBBT/X8IIWMpaRzI10ssto+mhlWiA=
X-Gm-Gg: AfdE7cl9bNaFMYbFZiLkth/RGguA+O1Zxh5El5Mupyro1orl+2TFpmBdRrcWCek5Cr6
	hgO2ReowWeXxsSk/Dy/Ea/UEcy/xz4bBLmGlT6MQJrCwQkCnIQj0BACJlS2FkFTig8TMWSZ3O+e
	8U/6faCzTrnuKI8/TlPxN72ornowIQbUypWlBKegypvhRLPZHGKT6EixvhkBH2CEaoVVpbtbdpm
	sQ0iIxvyWXJpCJWGG3n0COH6kdi22rqM+kW0BTeSwLsbTl8IL11QNw4COS6jnthZ6JoPbBcumBQ
	crJEGI0nycfprz6gQ3oz9ZufM3Yh0juwIlw+w89gHlRW3fUVbEwOwcHkZw4I/AV2YMVnqf88Bp+
	1akakShNfzgzmSc8BiEi7B7eCjNkBauRYX4WyCIs5lx0iWFiPYTHWxe2fnB05fOPl8aLcXfv0hN
	YqwukiHD4ykY7yV8s4rtP+8Iw3xe2TcjjP1nO2mWERiyPNYykmQe6vlS+FR/9mddofRTXCRb3bS
	RchC0QUF7xCDyL7XVT03AvgqSpmIGOO1ak=
X-Received: by 2002:a17:90b:5108:b0:385:39ac:fe4b with SMTP id 98e67ed59e1d1-38d15c881d0mr15343936a91.17.1783940560178;
        Mon, 13 Jul 2026 04:02:40 -0700 (PDT)
Received: from [127.0.1.1] ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm52249087eec.22.2026.07.13.04.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:02:39 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Subject: [PATCH 0/2] platform/x86: int1092: Fix two bugs in SAR driver
Date: Mon, 13 Jul 2026 16:32:23 +0530
Message-Id: <20260713-platx86-v1-0-c8991bff03a0@cse.iitm.ac.in>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL/FVGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0Nj3YKcxJIKCzPdpFSzVCPTRONky5QUJaDqgqLUtMwKsEnRsbW1AJ6
 5R+5ZAAAA
To: Shravan Sudhakar <s.shravan@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0

The patchset includes two fixes for
- a potential memory leak in sar_probe()
- an information leak in parse_package()

Both patches are compile tested only.

v2->v3:
- Converted into a patch set with two patches

Link to v1: https://patchwork.kernel.org/project/platform-driver-x86/patch/20260707070524.953741-1-nihaal@cse.iitm.ac.in/
Link to v2: https://patchwork.kernel.org/project/platform-driver-x86/patch/20260710052806.100107-1-nihaal@cse.iitm.ac.in/

Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Abdun Nihaal (2):
      platform/x86: int1092: Fix potential memory leak in sar_probe()
      platform/x86: int1092: Fix info leak in parse_package()

 drivers/platform/x86/intel/int1092/intel_sar.c | 32 ++++++++------------------
 1 file changed, 10 insertions(+), 22 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260713-platx86-be6e25a3c9dd

Best regards,
-- 
Abdun Nihaal <nihaal@cse.iitm.ac.in>

