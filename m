Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABC12FD697
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Feb 2026 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770382624; cv=none; b=fLDKCepRbZ8JfJm92jYq/NsrolV3JNzlzug76k8KTbkB6d21GP/PQHQEchl9BYC0Bn/BacFpI4heA68Y+jgtEdkUH5p4Q39HyahSWvfnfth2BCEpjAYgxab7B5NaJIa3Ayryf5uvZSMzBdb2Uw/dhruS9bQi72b+tipDZm9GLCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770382624; c=relaxed/simple;
	bh=lPMKCKine6EnGaLRHoDnAZD3pBalk/QVNk6LUOmwHIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oaXoLzbvk661M2BXOmPTnpJQ17T2POXDCWPIlcawaQ+IDyYqJV39UcDDQYdI+LV+Yi5478wiyy4QfZOR8Yia3LDcU9fkWADFx5Yh14XrI5q0rYfcp/227l7LW8g52F4MKj0dfL99Hn+Vk5TJ8acv+TmupfAilouBl4fchLIlPlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMIhqhjW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMIhqhjW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a09757004cso18326165ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Feb 2026 04:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770382623; x=1770987423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VhIKYL6qAt2DSiA4osOFJOOBKX8k+F4lLE7VdpKfBZM=;
        b=SMIhqhjWYRZYxxOY5eb8mpPtSMsWr3wC9djUaOMR4UQFinA4zI2iHKyKMfeweAcVpI
         R3xnrxxJRoYaYEOJavpWiTM/KPGqYiwTzjQ3JCdPfIGzgvtiP2wx0DxGJ1L4gqvBk8b5
         6gejtjS9NCAnuE2TMNygTy4jRbUGMKaYxyG8ylyzMOyJqzV4KoIiWpN+X2l/lJ3bbZvU
         4zztyC5RswPexMmSLXIa+Qcs1+x/8BzdNGtVBNiON4FM5F1J4GifVlzgsOoOCtVpBt7b
         2tXxtcsBj46TJWVmarJ8R+MNf9dwBTDvYHcI5pNT9iNdjicsHF1TO7lGrYdMBSbkGTZN
         oIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770382623; x=1770987423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhIKYL6qAt2DSiA4osOFJOOBKX8k+F4lLE7VdpKfBZM=;
        b=bgVw69zWq5ECtmVXAPGCv1cdlXIGLZSQA/xsbeMos3JYgsEQBxi9deGqLwkp4+0wyo
         pDkoM3bU9FMgu1iVtXCqeKVllxfvVGh+Z4c86K6TNDRbEAr6Cx6SmS49IRBGFLYRvULO
         VipPE1sduvZ5deM37jrUnLjQKwgSpWCUdJfwQmNPNoEY7ZOnZY8F+e/aCpxFdYIpHoJl
         IwhhADkE9aM+GWBge0xQHd07thchy0q30VwNspqK1kWnXnRDQw92whARemig0+z64mtR
         /k2FteQc25eMQKbhpaqBdsYMsgBg4TgnjuwGQh3IBlMCqT39f8BABfoe+ssav2CvRatS
         JSaA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ95RIT1k8LcoXpoMtRUXrJohehzjqP/5cL4ccjQ1x3bljxhoThLPVjHn04ZqgRA1G/DGeK2AXe89azUMyvGv2ztdV@vger.kernel.org
X-Gm-Message-State: AOJu0YyQcBJYa2n76Gp+aVXxHdc6Oz/iEVJkUL8KkGdqHrATAi061mSU
	rQRBtj/Y3sLOIMfkyjMWm/dsCuQiW7gxErqGfz6QFWQcDFbS0OvkJdA=
X-Gm-Gg: AZuq6aI5z+X/S+g1vlRnYA1CPKr3aDfHv8IJOE1X3NgZnU0hm1+GyTQO3yN0R3eNPvh
	xBojvz/Gi8Cm5u5DyH2qoqQekCB45wdrlTRzPjZHpJZOvLVC92/tw8KwQedyr4CNBV5apqylarF
	2XGwrLIatOgMXvKSG3M/8OxYkpPwxnkeIBqvWND1D+xfseEHAodghX78EWM8zBbqTMLG21E09Ia
	5JhLus5pxURSK+VsbfOpPkv8bNlsCWqAnT6vvc+htVhAj9HTCTyfREOGuXxh+JZb/7rv3tjEWAu
	LLvpquefqWchmTPSsKvMMmo+P3A5pUXqakqhA+zU3jP3pQnD2NS4VL7ir01xS7NXl286B2cw3jD
	5nY/15cq1rI/T8uCd68IOPnxlH21dhOKuevbmPF5euT7UwPMoHXPj8aTbCGGNRXPGZlaTgI3euS
	91pjr5plEJ8MNNZF8=
X-Received: by 2002:a17:903:1aa6:b0:2a9:410:23fe with SMTP id d9443c01a7336-2a9516d3e18mr34008135ad.36.1770382623349;
        Fri, 06 Feb 2026 04:57:03 -0800 (PST)
Received: from at.. ([171.61.167.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a636aasm23336005ad.12.2026.02.06.04.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:57:03 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Lukas Wunner <lukas@wunner.de>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] Save Brightness on Macs
Date: Fri,  6 Feb 2026 12:56:20 +0000
Message-ID: <20260206125641.12983-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, when a Mac is rebooted, the display brightness does not reflect
the level used during the previous boot. Instead, the brightness is
reset to the value last stored by macOS, causing the system to
ignore any changes made since that time.

We fix this by writing the brightness value to efivar "backlight-level"
every 300ms.

Atharva Tiwari (2):
  efi: Save Brightness using EFI on Macs
  platform/apple-gmux: use apple_brightness to save brightness to EFI

 drivers/firmware/efi/Kconfig                  | 10 ++
 drivers/firmware/efi/Makefile                 |  1 +
 drivers/firmware/efi/apple-brightness.c       | 91 +++++++++++++++++++
 drivers/platform/x86/apple-gmux.c             |  7 ++
 .../linux/platform_data/apple-brightness.h    | 21 +++++
 5 files changed, 130 insertions(+)
 create mode 100644 drivers/firmware/efi/apple-brightness.c
 create mode 100644 include/linux/platform_data/apple-brightness.h

-- 
2.43.0

