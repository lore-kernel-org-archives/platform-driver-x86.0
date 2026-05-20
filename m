Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6C42DCBEC
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 03:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779246074; cv=none; b=VWoMi00P3VNYiaOtRezeN2pTONdZQY4Pqcpf8+g23QuRydu9hluAUQHFC193fhuC8TnM2n0uP7VQFUbAvff/V6fp0VYaf5Ucy9c6Tpjw7dnfunOur80caUbDIgYEWDGYTx4r6MMqvhu7any2nApfk9UaZt+Zj4ImVcA/34bjoxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779246074; c=relaxed/simple;
	bh=MnfXcacvO4fo995CTbnmEGGrOoCmBkedxNleAwJrkLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nozPlqatBVpyOyn0EapLYrNMpDi+hd7MDkLoazoSa8E4uqAmAutehCEkbDkFIr+U2YINWo/zQfIaOmbMuNWxFgRrq0OarT/lKW0K+DJZEeWs53TLtfSNrjD72syDG4CPgVzzQxwI9Oco0+19cVOoWSGN2H1FQyqphgPXKyD2izg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPsQTZBS; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPsQTZBS"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3697c35eab7so2353725a91.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 20:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779246072; x=1779850872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oY7AMc/jX7iDlQ5e06aPBjrjjJdOjsvVa2w6mgpCI2s=;
        b=LPsQTZBSUIMY4E0dEQ8ejU8DICqpySqTuX3Ji0UYIsViwB0CNHY/JZo9utoXp9aszp
         r2VVxec3DWzj+Z8WdF4+mhZLlMgDXAto8PpFMI6TFpxzbN53s3hsHnXIGBdfKcVxvtwM
         JiMOD0CjDuEhbhQVcAxaC2f22z2RfZLk5GXvf/cFhiqRFR0D6vjt/yrUjAcUMmKN5gal
         Af0Tph+WwuYi9mT6arfFKASge/GeNwT4kXI+GsNR0CAe3iagp2yKrGdqbZMC4TABiIJr
         l5wrahQBLchCOKMH303YQix1xXRAjU959ofQgzmrClviWZCwKAv23He5Gfk6EiChjpBG
         XTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779246072; x=1779850872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oY7AMc/jX7iDlQ5e06aPBjrjjJdOjsvVa2w6mgpCI2s=;
        b=EoJ/B+/0Jfm/gOl0IcjjvM7mphLgoY+4lO1Udje1S6riXIa31ndqFmcVEV02FEDMJ1
         GiodYNjKnB+Y/IWrjXRghY7QwQrHkYSloaG4bIcvDfYjZXI/enqt9tdWyv/GCV0jYD9y
         BWMF9PXsuOND/HKZwBUwJ8cpD7swVKGdGOqRRLNeTj0oi8TjH647rTQptlGGdCl8T7Rg
         P3BmvZzQHM6Vm8Ddm/6N3t8sk9OmG7LP4ggbPdAT32qNtg72tu6KPIBWBCPTGB5UCtN1
         o8A7ij1TNodDUOQUobndOZqvsYW3IKJ1Unwzv9EnhsMO2/pvx+FrFPKE2ZJ8NpjYV3L3
         WpGA==
X-Gm-Message-State: AOJu0YzWhXhY7YVlB+mhHJsjYOxrhNqkxBVSepuoeATFK4c7XMLBTZ7a
	QgTIuu/JjkWFaPZgMuPqkAcc/01jMWeweWLjzWjLyTzrMf6BG71FvTFuFolgVyKVdjc=
X-Gm-Gg: Acq92OGL8M3Yc7PRPNwMMS1y9j3T1tlYSgoPoRD7FmgQLK8S/MNqdS7bN39MNQsA0gv
	ES59VDcxLZcsvp/fPxA866NLrrtBauOUkLDq/R/3THKp+hpi4G8oORyKlApoTsyE6flmyWqh+Yy
	cjj5rxQ15KOUZ2etapPVoU3FgiTrn1nf0wPs1mX5xyExceGDUMNJIofTnlnQHbEEFMpQFTb0YG/
	kjWjXk0IQV22pD85BtKe5ZpsC9txwA7P+bToSQx8iUEMor1kNYU+Cm9ua/NSpQqRnQlcX/ZAq8r
	NxQrMNoHogoJX99+NyOQP5aXh2TV7uFaMJJeXhMOEj/pR4BDMi3XGqsjCJDPRxve1iB9oHRUyxj
	gR7MXziIKi8ZUE78ZqNHRevvz3ct38qVk4UN1qf0xFOnPBEmH3OGywH9To8tu4f8EpCVGua7+3m
	rt9nv8K5uulfvsiZyRwUXYoFY6zxQlAIZgCF3z2m6v9CSH
X-Received: by 2002:a17:90b:258b:b0:369:e4d4:7460 with SMTP id 98e67ed59e1d1-369e4d47b07mr9153598a91.21.1779246072354;
        Tue, 19 May 2026 20:01:12 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:1e5a:9abb:36af:543:3c14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126f9eesm19869676a91.5.2026.05.19.20.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 20:01:11 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	hansg@kernel.org,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v4 0/4] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
Date: Wed, 20 May 2026 08:23:21 +0530
Message-ID: <20260520025325.103701-1-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a split version of v3 as requested. Patches 1 and 2 are
no-functional-changes-intended refactors which move the existing
thermal-profile and fan-control decisions into board-specific
.driver_data. Patch 3 fixes the fan-table GPU delta parsing issue
found while testing this board. Patch 4 adds fan-control support for
Victus 15-fb0xxx board 8A3D.

Based on platform-drivers-x86/for-next commit:
165e81354eefd5551358112773f24027aac59d5a

Tested on a Victus by HP Gaming Laptop 15-fb0xxx, board 8A3D, BIOS
F.22. With the series applied, pwm1 and pwm1_enable are exposed and
the EC-layout warning is not emitted for 8A3D.

Radhey Kalra (4):
  platform/x86: hp-wmi: Introduce board-specific feature data
  platform/x86: hp-wmi: Drive fan control from board data
  platform/x86: hp-wmi: Skip zero GPU RPM rows for fan speed delta
  platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control

---
Changes in v4:
- Split v3 into two no-functional-changes-intended refactors, one
  fan-table parsing fix, and one 8A3D support patch.
- Rebase on platform-drivers-x86/for-next commit 165e81354eefd555.
- Move revision notes to the cover letter.

Changes in v3:
- Rebase on platform-drivers-x86/for-next commit 165e81354eefd555.
- Keep the v2 board-data approach and 8A3D fan-control-only handling.

Changes in v2:
- Use real name in Signed-off-by.
- Replace the ad-hoc fan-control DMI table with board data in
  .driver_data.
- Keep 8A3D fan-control-only instead of enabling Victus S thermal
  profiles.
- Use the fixed fan-table parser path and derive gpu_delta from the
  first non-zero GPU row.

 drivers/platform/x86/hp/hp-wmi.c | 197 +++++++++++++++++++++----------
 1 file changed, 136 insertions(+), 61 deletions(-)

-- 
2.54.0
