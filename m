Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ED623FC5A
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 22:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773613231; cv=none; b=FWdzkUX4F6SxHZrpT/lQ8aB4vDDg2E65YF+OuQC5spWpJUOdm7AFDcESlNZ2/NM9We05zZgDnPXq8flCif5eqSUIc4B8KYTNvp5dlxuOJ48C6X9Bb2f0m9aa1pjl8eNpx65WB+f6/QGm27oBgqo/XKfmyj2CFKem0IQRWlg3D7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773613231; c=relaxed/simple;
	bh=t0k+R8o/3sKaARYlmigL/kuSWYfwOy9jsY3xXNSKQgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bPFi2N74UCRbLPXgTc+pZFqi+N0MMSrLtom9mr4d42ahXDe9JqgBAa5aKt/VPXYKziYE5sQOS+Z2QAanZHG5CSJD5QccQ66u5IlW2+pKMak5icWXNnQOpHz9DTv9T4ru1MwimCZ5l3MM+z0dZCWQWwVgDDBphlh5PAQPrTh5i5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vo1pBx3C; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vo1pBx3C"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso1995912a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 15:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773613229; x=1774218029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uw+L+ihqUtvJm/SAPvJBVUSllbH8AxJalBd+JbegTb0=;
        b=Vo1pBx3CNOQHg2o9+3IicWZj2QyIbZYJb4g4KdsPqTS/u2738ni/nBB9puy8EmHsyn
         fJw+Pk3pIijmeE6NRbQ9I4IzsS9RNrpcxsIjzKFXGjS1fLovKi3tCS9iC1MCzRf4hmh+
         W8KHtDgYztMGovackOE+XKU09HXXQrPGfP9xqnB7abL+70YEPHo6tXbTO4WsHiLMPCu7
         t5bNLRd7c20Ei/mg7b/j7OCa+REdxl1nMG07SK1t87pZnMvOOVWeUPeOj1NmP4MaR/7l
         ojUSKhvPVtMOzx9cNQFssnnZDOs13wqU4/YQ+9+09YPE6j2qgUSPPHeDh82s8amRkHgr
         23XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773613229; x=1774218029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uw+L+ihqUtvJm/SAPvJBVUSllbH8AxJalBd+JbegTb0=;
        b=G2eeDaIxxmwbOMsQKdoDTYAqVNTZPY13NfGy5obI/mkJjbdT6gLvV1NFil42X268xO
         okpyfaeCgLZfE4TiforcYtuc+JNb4k0wBdTISab/fKSr7acguGRHKDoBF2ismbZsMYjS
         wfLa+n01ZezusNzUbYo7j7jlAhCrWAWrhX/BqtkTKQzuugZHjrksgbgbinqx6bOGYy3I
         f3ymojWICTWrGsBFa5wYLPaG1o3l1pHeHMJ+b2qc3zK+4OMzHz5ReWXlqOhyFmHpbJuv
         j3KedklgoJpNF+m7cEXcxZjDOySnXyX2QN0KpheSh1o01/JaTUWM6ciumABmF3CFmRpz
         hheQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb8YoCAAG3GInMbVyEV6JWI08OIcxKoBWvUmcsMQ2HY3pEZt8oOnosIkuWxxjkRPZxf+3EXH3MpBdP9m5ItnIgZvrn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw6NdxV14npAbmJ3cAGt4N1NEDMvBl0KRVO7eOiCQUU2ksbwOj
	cNAnXERbF5T7QCSRPEtiwE5Ik1fN460c1E1tMQy5iUnnKT1h2PWjCak=
X-Gm-Gg: ATEYQzzUQvJR1AM+5887QmluYC6XbZR2FloRm81W+5PXB9B3qLml60qnDM3eUN0nehU
	vCKg7UiZdByBRdSeAROuNElwXqzozlTgpHTD2cdC011wVYRnxwaDaFk2ULyqWaATjkEUf7b+RR1
	QqVFv13BV9860J8rYpvXKuZF24aXBDhKmLNTEND0fVkEUSBl+qraGxkDhBK67OCT2qpniCXG5vs
	Kzyo70EiMS2AnHbx9VxD3NmQUs1SuusrF2tAfYqxv/AgH5KbNCPSWO3dDU7GZpfRuiG/FKczuiR
	wVdoB47EYlugPu5zjHr36BMmeKsMirksJR44CoD9gDxddXcDQPCDJPJDrzrlbOMeVl6hf2lc6GE
	uVF9V/QicQBCkUGfpU1AhhKco1SH7VxtP2eElqaisHgnLkVt62IzFuczCyH/TScbXtDAbfXhn/p
	eAYPH82jB1gzhQR0lZkbTR5Ruk2+VEnI5LOViJtt5kVCKgm3Lm/mpiOgRi2dwAVRg=
X-Received: by 2002:a17:90b:5828:b0:359:ff8a:ee47 with SMTP id 98e67ed59e1d1-35a21e1c7b6mr10189025a91.6.1773613229414;
        Sun, 15 Mar 2026 15:20:29 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b98f0e5a6sm2547141a91.5.2026.03.15.15.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 15:20:28 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-efi@vger.kernel.org (open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH v3 0/2] Save Brightness on Macs
Date: Mon, 16 Mar 2026 03:49:58 +0530
Message-ID: <20260315222020.24341-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We fix this by writing the brightness value to efivar 'backlight-level'
at shutdown only, when it is changed since the last boot.

Changes in v3:
- Fixed a bug, in which apple_brightness_shutdown is still called on
   non-supported devices.
Changes in v2:
- Saved the brightness only when it is different than the previous boot.

Link to v2:
https://lore.kernel.org/all/20260315215302.24087-1-atharvatiwarilinuxdev@gmail.com/
Link to v1:
https://lore.kernel.org/all/20260206125641.12983-1-atharvatiwarilinuxdev@gmail.com/

Atharva Tiwari (2):
  efi: Save Brightness using EFI on Macs
  platform/apple-gmux: use apple_brightness to save brightness to EFI

 drivers/firmware/efi/Kconfig                  | 10 +++
 drivers/firmware/efi/Makefile                 |  1 +
 drivers/firmware/efi/apple-brightness.c       | 67 +++++++++++++++++++
 drivers/platform/x86/apple-gmux.c             | 21 ++++++
 .../linux/platform_data/apple-brightness.h    | 20 ++++++
 5 files changed, 119 insertions(+)
 create mode 100644 drivers/firmware/efi/apple-brightness.c
 create mode 100644 include/linux/platform_data/apple-brightness.h

-- 
2.43.0

