Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DDC224F3
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jun 2026 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780732943; cv=none; b=KAGbAYrLBpBkFq1/h5QO+rT4LL9dQlJeJ0h9EjLp8JvuUudlAFeCVm/5Hsal09K4as+/MjkbHxN3ykiVpYHEfZ7aMxIq7Ym/JTEPQsotKFhY7MtdbAyoyRsNve8U1Y4zWxV6HuGSvqw1ripmBysYJt3wYDpS1Zhf1C6BVzI2/+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780732943; c=relaxed/simple;
	bh=rEHmQP0XbZlIZCljAOEM85hGkOGReZrr64Tk/WsUnxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k5tu3YMd5JZrAiffgKNS+WT1ZzpRmnJZEg2E7T0FrGDvRDSWByfREup5qfRVypaQCKNNJ+PN8vi071wWJ4ocJRj3OjC3/sycWCfWhBpaJx+j22V571nfDHZzQOS+peCIktHyAUzqyhT69Bu6THmBh9C9pj0b44NHQe5nPQ3ErI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvbfWH0u; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvbfWH0u"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0bb4a94b8so22467365ad.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 Jun 2026 01:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780732941; x=1781337741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdP+lGUIwR80Na/F+gNsUU/s1f2M210QXj5yAnWw+es=;
        b=YvbfWH0uUh+lRkFbQ/XDy9CunOG7YaNY464wLTsIiHB90slUe/2xpswCo6JXqmEItP
         cTa0FOVF2FY+WMOJrgzyu5np/1MTY2CVQ9XHwXuPlpcfw+In0m1XSHGLzcaj6HZofFpM
         2KK8MawDLua3rWF8WIydqNQz5v8QpfqrFaXwBQzhjISnsmchLhxUd2b3sa5+DmkTT4xu
         2gpnxTvcCTLwOWKSsm+0qGl+CNI9E+JtIxBbYyi6MhIgcDxQaDZPksed/GTdWeUBMlzA
         WpGoGveGdINatEAYScQx351oFJcezekdr0OI30HP/NnCm6mkV46k39ZzlonRToyT4x+b
         Gmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780732941; x=1781337741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdP+lGUIwR80Na/F+gNsUU/s1f2M210QXj5yAnWw+es=;
        b=qqZSuqZ/YesXEIcT40dA4rPnXhv72aqTHaDSwQ8GZ9LVBuaT2a+b94vfEyXv50Qcap
         CaMWs3Obmxs4UMchm9Gsnm0wD63bF0/cTznN9+dkgGjtRMRDGQcOTleFVp3Y+Io/tzFW
         e8TC0b5rRPhwcOJmTKr9iB7GXPM0shGD+SXHiNLMh7xXAfMe0o850ozNFdYqsTf8tiRY
         LZAR12uKjoZhIr26PE2wBhQklq/x7wrQatxKul7akcTnFC3vCoWLE3kZrWZ7hivXjtFG
         KbhDozBkj2K60elJKRaMuB6vSmoY4istD5g2n8OTUxRZ86crbohV5jJtUOGRB7zoJiep
         5i2g==
X-Gm-Message-State: AOJu0YwHcXQSQKDzefUEQdZ+5QjGVbuKTwDpKCW14FWkmgxGkLVp/YCG
	sAnmoHI41Qf44zRle88N2qjBKwPIvEznYrNlZgVwnF4glWpgI5gLxRmMjvRYR2NQEl8=
X-Gm-Gg: Acq92OEsxkEDM6jrrJ4frM8VJ16Jk8cXYpTqYm0vAkqvTf8W1zxgJiN9W1vjrrGrqD5
	Ro3p2DuAy8pomw0iLGKsZmM7Ipx94HI8wh1tEwDXG4oXffCe0I/BGgT9wuAHcUWb/8TLnrAcsGc
	1yguKaFlTIz4D9kZFTQlMz0b5F3QDRj0og+/8gplJDtlEhyi+Vt6jxPvf4bi96hMtkQuMCLEbq1
	xio21aYg1CjDv7Ntu5a2CxRj+3hyPEFkyzkCkdJ58v4q4HbDwUOFESlYU1JN8LhQXzhIV2Hxzkn
	Mb6nbqb2FiPT+VMy/SaaEor98nR+EAc4Qu8OlBXm0p+WTWUTDKU0dJXI8GOrArUqQ1XwG0w8IJU
	MQEIocYvKASuRcBn9R9vbxxVP6eFugoMvJF8F2XmiEPt8x9QMP+tP0reX44D7HXh4Jmz7CiA7oK
	WDkT7b9kRiRSqahIudW8DVBIWPJnJwijLt2k7KWaboYonvNW+UhEneIJhi
X-Received: by 2002:a17:903:2a8e:b0:2c1:20fe:9d5a with SMTP id d9443c01a7336-2c1e83502b0mr96983285ad.35.1780732941004;
        Sat, 06 Jun 2026 01:02:21 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:eafa:a84d:d4c0:cda7:baa6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm120818145ad.27.2026.06.06.01.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 01:02:20 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	krishna.chomal108@gmail.com,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: [PATCH v9 0/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
Date: Sat,  6 Jun 2026 13:31:53 +0530
Message-ID: <20260606080204.724444-1-radheykalra901@gmail.com>
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

v9 keeps the gpu_delta fan-table parsing fix out of this series. Ilpo
suggested postponing that part to the other GPU fan series, so this
version keeps only the board-data and 8A3D support pieces.

The last public review discussion was on the earlier v6 0/4 thread. This
series follows up on that by dropping the gpu_delta patch from this
series, testing the Victus S thermal-profile path on 8A3D, and keeping
8A3D on the Victus S thermal-profile and fan-control data.

v9 is a resend after one week with no review comments. There are no code
changes from v8 because platform-drivers-x86/review-ilpo-next and
for-next have not moved since v8. v8 already rebased the v7 series from
commit 5fdac9983681 to a167ae8eace5, preserving the newer 8902 board
entry and the system_dfl_wq delayed-work change.

I accidentally sent the corrected 3-patch version as v6 after an earlier
v6 had already been sent. v7 fixed the version number for that
corrected structure.

v9 is based on platform-drivers-x86/review-ilpo-next commit
a167ae8eace52dd6c80438b77d92450fe12cd4be, which is still current on
review-ilpo-next and for-next. It preserves the newer 8902 hp-wmi board
entry.

8A3D is added with both the Victus S thermal-profile data and the Victus
fan-control data. The existing generic platform-profile sysfs path on
8A3D accepts writes/readbacks without hp_wmi errors, and the Victus fan
table/control path exposes working PWM control.

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
Changes in v9:
- Resend after one week with no review comments.
- Clarify that the series follows up on the earlier v6 0/4 review by
  dropping the gpu_delta patch and using the tested Victus S path.
- No code changes from v8 because the target platform-drivers-x86 branch
  has not moved since v8.
- Recheck that platform-drivers-x86/review-ilpo-next and for-next still
  point at commit a167ae8eace5.

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
