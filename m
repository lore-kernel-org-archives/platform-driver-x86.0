Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4D533290C
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766061792; cv=none; b=eWjpeUwwrouDb8efclqr01bNAfG2n4HWkZvw+48+ctWyZrYVuESBxzlMDJMKEsuO1GABAuk/ttFxzBp46FNLUntGSfJyhpQUJ3a4PknauMn0ZTY8WFmMIfVmdR880vcdvxf9xbFlpjnLtvTpyLP/nchDPpFizf7YSm6kkxFHJ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766061792; c=relaxed/simple;
	bh=z8kS1zamd7FYWgF+0IDTDIHcbIHcQYf0BLScd1a3U1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h4fyKW3b6124ibjmrsTtw89/QnYtXsx2/Zu2VV/e5PWFmAM+isvIKJidJqtfdb0kRuojdOSvAbXJQVRRZ/56dS50YVHWGFZ1l7VQNtZV0XOw56fwfIGeWO98z5sIPBqBPboua7nBnoqZLQcBdCkMMjeFCAOZ2b2oVJ1prDiYLqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5xkCR3Q; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5xkCR3Q"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so567685b3a.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 04:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766061790; x=1766666590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPDlhgOF9vzPtqaMIfOo7ph4nGVpreuQezuEbQlezKY=;
        b=j5xkCR3QX0i4nh8jA6sH8RWvUVwEXfRFZRq755u+Vgz82TBMwO5QBPIwpUZGV9QMCM
         AxaLgd7TmOCGWwmdvjkn9iAIRuGnfyossRZUrLQicejNa/eUiEEy9gx9M13ygNsaXzQg
         mqT8uoqu3WZMbw52p9I3KUGyQDW02yfn4/Bo2L6KX+dd7k5JpONC0+dU+C3u7sovoFDI
         zKkkcj6fCwg4DrOGIRawTukriDLmhz4Yrwt+/SE+yaOufZ0o1KMjPKBcdEuqztJ1u3ns
         f7q1Anlxyn4NP4ogVIISJyqvsVqqAgk0h4MwBoQQJ+9BE66QTVqoP3ouT9rzm9CoyGcx
         1B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766061790; x=1766666590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPDlhgOF9vzPtqaMIfOo7ph4nGVpreuQezuEbQlezKY=;
        b=RIyiuAfFqWYVtIeZC8SUx4mqqfUPE9P3UmF9edmbGTtGRU4ZT1w1mdJFcmuo1XFW1J
         FJn03gHZuCdyuo3ZuQtTFJ+KUTq+JVurTKU1ERTSNSQy2NhqfAwWTmtJ972V8sNLpods
         FFAnHMT4E5xo0WTvE07VGJH9ngOPHBhoo037FJRzaWV/D0cvPutznogvjnoghJm9STUO
         k45akmMXR9exsWG1almZcBQfL94FWdWyf+rIniRKg48+Ca7rQn4iCAtkMKKLUmepTGiF
         2e+wUjrl/o8+a55SUCLqXZ432fEPFLSNqjUmnw+ueT1niQGzraMoX+7qumAodLFXZpF2
         k+yw==
X-Gm-Message-State: AOJu0YxaFdUWpgDP5yYtMJcdvow1kPsxB0YVN8xKvWo6EieXLCXVM0PL
	fuL3sgQthXz1X8IWc+frRMupsVbVf5X5MfEL7FbpGlhBLvvChtwxsLFi
X-Gm-Gg: AY/fxX70TfhHw6KLfxdcRk+Ql2RKkDdT6PFjcWZmp3oqHSNc/US6Dmttlmc8nySZL8M
	ozC2gnWv5n6cAiACryldEt03yY59Hf9fz2IK4t1/q+ZmW5LG/eqsccN41K2NEJ8nMJg5WshBZIn
	QADOZ0EoWVfc328WHiSwPfB9y1VThNNlVxPiSDGT/bHOCJYKYC3YaQWdZ81Oar1lTOpQNXaRtPw
	WN3AiA+7OrfCUezfloGJPl83GoKCNDT8Ecx1/OdlJ3RqTEq3q1U6hDso0uvEVtNECz6HStkKBLa
	k3sUDcLLTtEnJ78wN5Oksy0MHSEHvGiC/XBn0N6UFRu+EoV7RulUxfWlH5DkcAI7S0/mtKuiodL
	87L9ky62as2H7U954UgBgcwKkrKjdVhi/C00SVrW9qUsWVGHWjQA0rh4/rOgF4qqwnmZLFULLGo
	mP3k6XpOHIFLCBSqvgH3c=
X-Google-Smtp-Source: AGHT+IH/DtNLwLPHtjKUIK9EPmOXeEc4W9tgNeXr9wnBytzptK6h+fNclaBCa39VPGyyZILVE2IfQw==
X-Received: by 2002:a05:6a00:4502:b0:7e8:4471:ae76 with SMTP id d2e1a72fcca58-7f669f751f5mr17876395b3a.66.1766061789977;
        Thu, 18 Dec 2025 04:43:09 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe13d853c1sm2597575b3a.43.2025.12.18.04.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:43:09 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v4 0/2] Fix Omen 16-wf1xxx thermal profile and add EC readback
Date: Thu, 18 Dec 2025 18:13:01 +0530
Message-ID: <20251218124303.22024-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes incorrect thermal profile parameters sent for HP Omen
16-wf1xxx and implements hardware readback support for Victus S thermal
profiles.

The first patch refactors the DMI handling for Victus S boards. By
moving from simple string list to DMI system id table with driver_data,
we can now map each board to its correct thermal parameters.

The second patch implements "get" callback for the platform profile API.
It reads the hardware state from EC register 0x59. This ensures that the
driver stays in sync with the hardware during driver init and power
source change events.

Changes in v4:
- Fixed driver load failure caused in v3
- Handle err after calling victus_s_gpu_thermal_profile_get()
- Fixed wrong function call victus_s_powersource_event()

Changes in v3:
- Moved DMI lookup to hp_wmi_init()
- Marked DMI table as __initconst
- Renamed `eco` to `low_power`
- Added second patch to implement "get" support for Victus S devices

Changes in v2:
- Refactored victus_s_thermal_profile_boards to use DMI table
- Implemented driver_data to handle thermal profile parameters
- Moved enum definitions earlier in the file for thermal profile
  parameters

Changes in v1:
  Initial fix for Omen 16-wf1xxx thermal profile values

Krishna Chomal (2):
  platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx
  platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile

 drivers/platform/x86/hp/hp-wmi.c | 269 ++++++++++++++++++++++++-------
 1 file changed, 207 insertions(+), 62 deletions(-)

-- 
2.52.0

