Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589E62874E3
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 May 2026 03:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779593684; cv=none; b=iEdt3Z/XchxsaqkmwxoPNzLRHGyiHDTQMvkGVNNPqKPHz/SnNlkxiwkdrJgjt1BDCQF1h0BWEog28MbriNIk7MO+1kIogJOXgbZ5MEMYUYRNQYTHqOL5QJ9yuN6383uPIqGn+y13Vq6HU7SVqZVwzk53dOf7nct1fYBxnUCcGgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779593684; c=relaxed/simple;
	bh=852wWEla3y8RUJN4oXglwrsdZ/cwKfTAK+A+V1YGBzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pai02cWXnEjF5huU9X699yvOVChJOMIgQggO+JlFoLa+/PTRUiUuIf5eh81kOV2QK/kF9eKB85tYb5nG1iXdd5Y3ULut/aod2zq9ER5EOTLeOvZPK2HbVV3C3kYOxyadyKT4e2XhzGVMnz2MRI1TZgEcxjI6uUKWctWKJc43exY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJu975A2; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJu975A2"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bc763e2ba8so42980585ad.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 May 2026 20:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779593683; x=1780198483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=weTz/i4vyOC5S4+QY1OXN5C6HWjAtCUyxLr5p6318GU=;
        b=DJu975A27qj/vBvxCFpQqGE/jqkawrFh1KF1NqWvtaTbJyUdedSEVKuPn3QQlZRcTl
         Me3JWdtxpVwVEOI10bWJowrskrn98EOL4ydqlOOQDq1bUG1IbcDAhphrCbr+KP4lMb7H
         qGzHL4cIF1/2w3IPvhtEcqcQZV9iZ5pKsCZi50uXoQJnXmIye/aLA4r82qSwbkmGnscm
         kyENsTfUYJ/RmucgBrIdkasXpVax2eY3XEmH/L/m3FV2rCpfwwPR2H5A4witfzmeWTW4
         Mps+kEk+8AX4IDDvkSFMpG+rY5Da3V3X8lG5XZ1WSBj0CKQEKDw3Tv+tllgFJrX2PHB9
         01wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779593683; x=1780198483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weTz/i4vyOC5S4+QY1OXN5C6HWjAtCUyxLr5p6318GU=;
        b=AdTuqvaHLER72GCZFMkUr70/qiJidhv3O25G23XfStkQLg88a9KtSDA1j/4s1m1EBw
         TcyQEkrEzEZ/1dGKhpss/uE9gO/P07WqwsC9r9vu0Fi2sJ5JWGEqVN0Ht4N1f0ptiJkJ
         hN6roN6BqgtnWqRcattBM9f+P5q727hiUKs2ebW6AEPMJQ7YfpqwvGiN6ve81+aHSYYn
         +90xGaizQ9csoBecd+x16v/9GR41cFowY0d95rdb73enGgfqWuudWp2o1Xk4U7axAEzr
         7/R4b9YpO2n5y9MylGz+7ZEmoaWr+lIbjKESG5rFseFt4QAOoEqrPAJUPl/qwYMgXa0/
         CWHw==
X-Gm-Message-State: AOJu0YzCQvMakB6f+mmpviDUxNSAQi/ZXHMPwIGpeYp80nQIl64VvcoH
	xAmwmTa/gHChlyNc5RDAeMhOJSBkPfflBphzuRM+bMgLtTpFHak8B7zqzjJWxGl/
X-Gm-Gg: Acq92OG3a+V16YM1ShEMFkb+iUpK1Ecui1o+IzAfI8hrhzqq6fnqShec/DVmbg3ZsXX
	NH5BwCxTuiKzmP/7EA2ecYsV1ZQnyJsVrl9Vu6D7feriF9EClr8f6Pcb+pGY2jseaRWH78l7kSs
	3t1S3el0GbBOR0fU0eFaJofyXo6i49chIpJZ8rCW0UQS0FLLV4asLCLjCXnnIc11Po1GMzOCC4N
	GqLJ7dVlNPryTGcUR4bH4YvF/HdyDsMAUxcXwGrNJX9RX2mYF6x5JKIPgmEzTRW1UkVoBDcpJB8
	8BFQn33fwthObfnw01jGc1dHwTHc9dgXMKY25h1szuLiokbdNU6FNuB1cp6JZpWeNBJeU1rpzpB
	0qLLRrxaxWNF8uKn3ywKBBM3clltlr7L/gOwKuaF4H5AZSRzVPZZ0pZADQv+YkP04ZDG7uO8+fu
	T70CfzlFDM9G5g2oFwf8lkkTMJ+XQ=
X-Received: by 2002:a17:903:2bce:b0:2b2:4260:109 with SMTP id d9443c01a7336-2beb074f776mr101074655ad.23.1779593682501;
        Sat, 23 May 2026 20:34:42 -0700 (PDT)
Received: from pico-cachyos ([2a09:bac5:3e0b:7eb::ca:1aa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c49b2sm55469805ad.60.2026.05.23.20.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 20:34:41 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	radheykalra901@gmail.com
Subject: [PATCH v7 0/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
Date: Sun, 24 May 2026 09:04:21 +0530
Message-ID: <20260524033424.61847-1-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a split version of the Victus 15-fb0xxx support change. Patches
1 and 2 are no-functional-changes-intended refactors which move the
existing thermal-profile and fan-control decisions into board-specific
.driver_data. Patch 3 adds support for Victus 15-fb0xxx board 8A3D.

v7 keeps the gpu_delta fan-table parsing fix out of this series. Ilpo
suggested postponing that part to the other GPU fan series, so this
version keeps only the board-data and 8A3D support pieces.

I accidentally sent the corrected 3-patch version as v6 after an earlier
v6 had already been sent. This v7 is the same corrected structure with
the version number fixed.

v7 is based on current platform-drivers-x86/for-next and preserves the
recent 8BC2 and 8D41 hp-wmi changes.

8A3D is added with both the Victus S thermal-profile data and the Victus
fan-control data. The existing generic platform-profile sysfs path on
8A3D accepts writes/readbacks without hp_wmi errors, and the Victus fan
table/control path exposes working PWM control.

Based on platform-drivers-x86/for-next commit:
5fdac9983681f743cfaa89414ea154a2c5fd39c4

Tested on a Victus by HP Gaming Laptop 15-fb0xxx, board 8A3D, BIOS
F.22. With the series applied, the platform-profile choices are
low-power, balanced, and performance. Writes to all three profiles
succeeded and read back the selected value. In a CPU stress test with
powerprofilesctl held at performance, low-power reduced CPU package
power to about 30 W, while balanced and performance both ran at about
47 W. In a light PRIME offload test, low-power also kept the NVIDIA GPU
at lower clocks and power than the other profiles. pwm1 and pwm1_enable
are exposed through hwmon.

Radhey Kalra (3):
  platform/x86: hp-wmi: Introduce board-specific feature data
  platform/x86: hp-wmi: Drive fan control from board data
  platform/x86: hp-wmi: Add Victus 15-fb0xxx support

 drivers/platform/x86/hp/hp-wmi.c | 207 ++++++++++++++++++++++---------
 1 file changed, 149 insertions(+), 58 deletions(-)

---
Changes in v7:
- Bump the version because v6 was already sent.
- Note that the corrected 3-patch version was accidentally sent as v6
  after an earlier v6 had already been sent.
- Keep the gpu_delta fan-table parser fix out of this series; it can be
  handled with the other GPU fan series.
- Keep 8A3D on the Victus S thermal-profile path after testing profile
  writes/readbacks, CPU package power, and light PRIME offload behavior.

Changes in v6:
- Drop the gpu_delta fan-table parser fix for now; it can be handled
  with the other GPU fan series.
- Rebase on platform-drivers-x86/for-next commit 5fdac9983681.
- Preserve the recently added 8BC2 board entry.
- Preserve the 8D41 switch to omen_v1_no_ec_thermal_params.
- Add 8A3D with Victus S thermal-profile data and Victus fan-control
  data.

Changes in v5:
- Drop the active_thermal_profile_params global and dereference the
  thermal-profile data through active_board_params.
- Move the generic fan-only board handling into patch 1, keeping the
  final 8A3D patch focused on adding the board data and DMI match.
- Wrap the setup comment added in patch 1 to stay under 80 columns.

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
