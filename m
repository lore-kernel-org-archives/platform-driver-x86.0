Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7A23E6385
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 14:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286140; cv=none; b=jrMTktsKhYkBPjZY5+o2B9hiS5Uolk/GRGYJ+NSP1VoRcE8XTPtUybfPuv+wdO0b79rqgTvYtgA+aIkjWWB1qMhn/lvPRIm5JyqXdfLCzKEXEs9Bm721UGNAy7bilqmkIniomuwaIHzlq7qbIkz4lsLjTH2/21O1U/t1kl++xUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286140; c=relaxed/simple;
	bh=dJcz2x5wPbYrmLNwLebG2mK3LuA2TtpN5/VAlHufTW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aYnhhOeqxdFhF0r0+oJNGh4jMwAAbS/cGickDW5QztRFzKAaxYCwCjJZANEag54djF+dg+6Ek1jULSKtRfhJEB++1z7fxIYTj1P3UPqjnRGJ3/2v3A7+z/aG6JHYq5Q7bawElbkQyyAhkW2A893EHLJ6Ao6YU7xm0kp4ArYpmsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZWu2x+I; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZWu2x+I"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so1999140b3a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 07:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779286138; x=1779890938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4PjM/aaVribjjuywvnrRVeS+8PdcbQKPM1NfDgeOke4=;
        b=kZWu2x+Ih7g6LOS1dkhTJRGhjd3RryDr4OoBbvgSOpL1P8wlJOON+99chbrwvU8+YI
         w/FWLCytFkPybQyod/L5ZvtLQ4gwuyWwZRZtoU6JJ+cbCEy1kgqgLtquD3Yy3YJsV7fU
         TBe943Cb4ZkSY50iUphbcH0FWf8ynDDGjOIdZaSPvZ7vqNjcz0G/O/js6VisTiL8ua3t
         xB/8ARi5+T6hfjfTDUHxFzItpBX3VAnuBfE/K/IzR2p9i1YqDuc3m2D4/Vz2Ir69nkWo
         3TJ9P6UavWwlYi8DeyqOPAHdxjuLVN2iTKhpe9v5lfScsHiygb+04ScYp4PNCrrzbuBR
         2r2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286138; x=1779890938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PjM/aaVribjjuywvnrRVeS+8PdcbQKPM1NfDgeOke4=;
        b=JMK3MaV0X+pE4Am6QAcMV/XPIbAVnwSNdrrdtaMgl9WqyNtdFyxavwex3KMrtVxQqY
         hfTlUrl+QfcVHG2EkBmKCVNFv/UUe4lZCMaMRLLplWhQ9/8Z4R20Qg+m1xwHxkhlOEut
         74MbaeXFNcNpmEPM6CqUv84tZDE4ON9DG117nnmHKxSzdJ4Exn9AcJQYkyU/KZK0Q5w2
         4sWa1ZUc3lAy+AN6IgBKKS8Q8Y/m1tEuuJUooHxtBWUHcsc9h8g/LSZWt8N0rR1eRJTr
         hUicm0zaYxnsFTqyYNw30B3NF5NAUso6IiNBXu8wrGWaxUYd1mDiBIj4UKKrTsDhplmz
         Uf2w==
X-Gm-Message-State: AOJu0YyQt54oBkroge8oidzED6/hJmibD//PJkaFccmZbG/0GHOU3tjv
	MZXBufu+34Wd/nJ+LgbfVe1q94vtxAJXgnLIU2FJguq7aIEAcd0HlaXQra6HUUCWsUY=
X-Gm-Gg: Acq92OF/7wC7V6hWB8xJOfNqFohsIa4dEilViuo5AaK0xrV3REbLEMxKvIMetC+QvYQ
	OQCK0YwwZ35tikOHKaY0P6PTe79TY00Ib4lO4IRg05P/r+0Fb0qYvwB3lWTR8TLGEVe2AQg1v5J
	G4NC30wzPt0TVx8+f6CvVJ0ovPwzvjuZlWZ95D7pLDWQpRA1TE3PCZwp7XELkj5LptYzNCitFDZ
	l1nrqogW3FpyCXBxvBcdnyoM5KkdIp6idP+TM2sk2XiP+LpGLw2UJR3hfrvuHqPV3gJMhZSrcWA
	0Dh2z3JxNiUEnuKIZ2Fp1eePJweA2p+OeCL42PBcavgJjnSNYvRHq/MEl3jnohPPgdjSA4/Nu5Q
	24X+wfLDLaTmxmSuAofHMOV/zp4+pJbxoLAZXx58KPCHUqr3iTXuKlvUUnb5TFDQKYiskyK+97t
	j/7A+NzwYafjxHtRFVz2heGoiq+nyEKd/eHHK70TntO7ss
X-Received: by 2002:a05:6a00:39a0:b0:82c:d7c4:4c56 with SMTP id d2e1a72fcca58-83f33c43997mr23913343b3a.15.1779286138049;
        Wed, 20 May 2026 07:08:58 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:1e5a:9abb:36af:543:3c14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10989525b3a.48.2026.05.20.07.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:08:57 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	krishna.chomal108@gmail.com,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v5 0/2] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
Date: Wed, 20 May 2026 19:37:46 +0530
Message-ID: <20260520140800.130530-1-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a smaller v5 split for the Victus 15-fb0xxx fan-control change.
Patch 1 prepares the hp-wmi board data and hwmon fan-control selection
so fan support can be described independently from Victus S thermal
profiles. Patch 2 adds fan-control support for Victus 15-fb0xxx board
8A3D.

Based on platform-drivers-x86/for-next commit:
165e81354eefd5551358112773f24027aac59d5a

Tested on a Victus by HP Gaming Laptop 15-fb0xxx, board 8A3D, BIOS
F.22. With the series applied, pwm1 and pwm1_enable are exposed and
the EC-layout warning is not emitted for 8A3D.

Radhey Kalra (2):
  platform/x86: hp-wmi: Prepare Victus fan control board data
  platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control

 drivers/platform/x86/hp/hp-wmi.c | 212 ++++++++++++++++++++++---------
 1 file changed, 153 insertions(+), 59 deletions(-)

---
Changes in v5:
- Reduce the series to two patches: one preparatory board-data/hwmon
  patch and one focused 8A3D enablement patch.
- Drop the active_thermal_profile_params global and dereference the
  thermal-profile data through active_board_params.
- Wrap the setup comment added in the preparatory patch to stay under
  80 columns.

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

-- 
2.54.0
