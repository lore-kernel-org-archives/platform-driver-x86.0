Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2417D2E737E
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 07:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780212660; cv=none; b=gUOWBYc/qWvQC7J/Eqqmno5weGs7bjaUgPqZJvLyFmi9UsXfmMNeUhU98yqY8055JE4BCWdYR/hcKMfkozxyGTQ3Qca6mqFiGizOUBFxWcWMrjLDiQi+VROCTx1eqJ33ti2QTAgFUZ7kCuUaWR2dVopHPR52nUNRjVolXPI1v/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780212660; c=relaxed/simple;
	bh=exij66Y47buinBlGZgC/x+WKNt7KYUIJ64WU8zMPbQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ooIciIj5NcFkT9JtcfvbazIWr1HDUQU1EoEiJ4gMLZzxckCsvITg/RDhuKynUW8k/yB5Jcy57rnq0OJvWreXiux2DKJuZsQux0WNy304u+f/ZIiulfTVhDiwETVFRwphQUAs3HGnWtYzxSZSQNz6q+h7qAyGtcXahGTIg9sF3YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEIGtXyW; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEIGtXyW"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c858b5de728so546527a12.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 00:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780212658; x=1780817458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=brlabOVMH/WmHXHyEUrMip6bGGnp09/oF2/LWkbxm3A=;
        b=fEIGtXyWjN8gshcFaDEl7w9OnJ31okgcl9ADqNtXEogRJx9DeEoQz3DnR7iqllT3LM
         TO/JMORzoSM67bVOnON2XSWRl2/PY+9/xNMavYNRA1Jxs++khVgy1wm4I4036pnt2izB
         VL+9LPqHwi/5jVaB9UasqsQntSurYYiptl05jBwZ8341Jra2I+m1KEozs1F1xrJcamcT
         1aullVBMUEvNUdiblom62anwNwMeLTBu9fWfkorMhtmiPY3mjRhvnxjet9xZfOiSQBqY
         0NAsfab0adHvtDqkGUow45qs97dS+/QWDeGnqLH+hrAjg6QPvJ0OY7CHrjm3VprpYDW+
         aM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780212658; x=1780817458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brlabOVMH/WmHXHyEUrMip6bGGnp09/oF2/LWkbxm3A=;
        b=S6D2V/KgiwHhLUJAVHkYdeL+pwIWerpMda6mF7wS/lhXHzZdTuDOutYZ8g+T+3pQfH
         auhhNtJLO6s8RSAWG3Zc9hvInOkGh7tPDpdDLCbyYw/+doL/e0Mg0wksiNyLCR6z0l6O
         EZqVtBlQq02TyiLgzdBAwyQRy3JSwCOMQGmKy7VB000RCK2T9pcWXnTvLpk2ImmgBz7s
         javfYAX8lQCaxu6nTICbzCyVC/ni5rFx9xjQfWdPn/UlbVwMd+UujtN8A4wMwq6abJqR
         hjtKLPTnXHBQ9Mu3tFxrbymzNi+/wIejrFVSS3dVZVFhiZF3LGvDErVomi4XjtgEwED9
         pF/g==
X-Gm-Message-State: AOJu0YxJ0jKp/eSdsmPOVXdankno3r/aIpKVHHfoJ2qbdL3jcCBvgnzp
	yKCBcJ3lcN3+eq4PIY+Hq5ZkriAwILtEoj45WlAn3NHz7zwMx30YyCU0vB9oDgHKr5g=
X-Gm-Gg: Acq92OH22qf+9QGVPcF/JQrp2c74O1PJFJU8z2uj1haW5LbvzqUkeD4wRVXUBNa1ih0
	dvci+DGQVzWIU10N9JoXPkaIhOdHq7L/SFI9+KqKZNQfu+zlwUK/IlEV9Ufo6h9VKJbMOsdj7qJ
	JeF6S1lrqsEP4tLNQGdlMwHiuBsquKa21ZHyfOOPRS2JvHIrtZUTqMnAzu3uRmEFnR+AlZy+c4x
	5OgjcYCEnoHRhGVAaMyvW3sstOtV80P2sG8JiESPIhFebw/QylVBFk4/ffbNW5KM5qb7tMa9G76
	KLW3IwVIoPFulGJL8mbYjnU0LU4ui11FB7I2aWzp36d8/11xPi1bZAsaPuZassFLgrm8UI1RU7O
	bXYAWtwWGygUz1IgMv6DeQ2xI+NVbbk0+1YHWL9+MvXpcMnGHs9zO4WOdxj6lPTbghbfkKaZK0S
	BzfWl5dJwCLcXmteXtnw74qclUqFmbIg2mzrsNRm9RymUSJRJFy13VIkzk
X-Received: by 2002:a05:6a00:1802:b0:821:7d7e:41cd with SMTP id d2e1a72fcca58-8422532cbe7mr5740574b3a.10.1780212658219;
        Sun, 31 May 2026 00:30:58 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c38:6221:e402:4ae3:a02c:75da])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214b6797esm7597090b3a.26.2026.05.31.00.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:30:57 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	krishna.chomal108@gmail.com,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v8 0/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
Date: Sun, 31 May 2026 13:00:33 +0530
Message-ID: <20260531073036.195326-1-radheykalra901@gmail.com>
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

v8 keeps the gpu_delta fan-table parsing fix out of this series. Ilpo
suggested postponing that part to the other GPU fan series, so this
version keeps only the board-data and 8A3D support pieces.

I accidentally sent the corrected 3-patch version as v6 after an earlier
v6 had already been sent. v7 fixed the version number for that
corrected structure.

v8 is based on platform-drivers-x86/review-ilpo-next and current Linus
master. It preserves the newer 8902 hp-wmi board entry.

8A3D is added with both the Victus S thermal-profile data and the Victus
fan-control data. The existing generic platform-profile sysfs path on
8A3D accepts writes/readbacks without hp_wmi errors, and the Victus fan
table/control path exposes working PWM control.

Based on platform-drivers-x86/review-ilpo-next commit:
a167ae8eace52dd6c80438b77d92450fe12cd4be

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

 drivers/platform/x86/hp/hp-wmi.c | 209 ++++++++++++++++++++++---------
 1 file changed, 150 insertions(+), 59 deletions(-)

---
Changes in v8:
- Resend after one week with no review comments.
- Rebase on platform-drivers-x86/review-ilpo-next commit
  a167ae8eace5 to preserve the newer 8902 hp-wmi board entry.
- Keep the gpu_delta fan-table parser fix out of this series; it can be
  handled with the other GPU fan series.
- Add Hans de Goede to Cc per MAINTAINERS for X86 PLATFORM DRIVERS.

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
