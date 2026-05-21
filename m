Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE17242D7F
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 13:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779370450; cv=none; b=HgQdvWxAIeg/G5musri3wNHulnSPseakChX/bXFq++po4Ny1Atj85I+tZmzjVeqGWfTEIomVIAMTj4wGvKzlWTk4661tfiAumsNnEPe7VUMKYkX6qvetbuknMK8dfdz2g/qoU+fyZv3kb3c4/CFN2sQqo+xSkv4PyN1DoLh2cLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779370450; c=relaxed/simple;
	bh=kKLs40tY8cQpW2M0RTRkHToXREKA5JUN3xnzkWzTCs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PRsqrIIWL/t6/if08yAqRV4sQqqCF6otLp4HOgZmeTSzsa8QRInyZYHl710L4Siw8aCcz5oD3B7j8vPmE5DZuLNwht9sGjhq+b/4+AFFLAdbj3Wl8iusYbo7d2fv8Ik/aK94y2//ODF+sxAGGBJc3haqs1kjf/5YgUzTsxPYe/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NU8tCsn0; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NU8tCsn0"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c801d732058so2754749a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 06:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779370447; x=1779975247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFCFIRvyeGpba4qrJe9Ya43603Kz6snIXtXCrMWffwc=;
        b=NU8tCsn0u+djQy4Jc4LJ3tutgE6v2jfg8L06z+WEV6wdW892ufBVMxJIP3u5LRF9+a
         CwyJAL6Et3T1mJ3Mkr5psWR6+nezYkxK67CjNbFOIrXFZV6X3kUtVC/YVgk0wJSjXCGr
         vDq/QeeJbLi2ivC7p4rdoRoGfxEg4wxys/k+RM5m+TZvBRICoU2I6HRUJMI0FOPu65mH
         ZstqzvaffwXmyq+3OQrZ9GEaQjL+/Q0n0HBy6/AVImuHGfOxT6a2ReUzL8uCD88LjaA2
         KWHV7+vxEprP5EnXi3Q4/eWp0jQatgEXttED2NkW4zW5Og/+YY5T8hcjvDLcXm92APMc
         QmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779370447; x=1779975247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFCFIRvyeGpba4qrJe9Ya43603Kz6snIXtXCrMWffwc=;
        b=gsUMjdmXDUFF0vjYNXbDuZqWREVKG1T4kWUX4lOTQLqShEr45DsRaxxxHG3SP3VBal
         6F2Idt08ifBhg/oBU/ECa3gAhDylUeUiB5H7HAhkqARvB8vWcVSGLefcKWl42dDxPMSx
         w47zRVlnvktTq8JmZNBhFYgHfbANTCgWugI12eRe1qZXtr97BYoRTKTqkuIMQ2QSd00q
         z8TywSWu9yASiB4K0wvppeAAKc5laxgoA3cxOUvESb5UE7+VxPNG2zDoPEuJaSZ9qCb/
         A893CGZkUjFokdwVI7x9qvqSWdUK2Y0NRACQ2eTPDb2gA2WCW2BWmA9PrgCahOZz48R3
         kveg==
X-Gm-Message-State: AOJu0YxgOx7fPQF1VPsmEvygv42MUMThyvcFG0j1d+7/sG2zxfHO5JvJ
	4xhOiEZh/a+yYy4gyX6AfeKyYbQamw/OzPnd3K/tq66PvndYoSSgr/6R39hB4vG2u+8=
X-Gm-Gg: Acq92OHDDyYyYiQ3YNeGSYo7mKVMX8eiF3e3rtPmjmCYvCQBKGHf4RdwEVf4g4COi8H
	JG52OZEFWwsahDonXcZ6gdIjGvW6D/JLx4DzUdFxZAJBcMNz2Eg9PLjCNvBFLFt2YNLpAo9J7g/
	ZFMShfZNxx3lS+0TFJLgqFe6Tfb1pP8KAooZVdG61Or9gGNmcr5dyuN/nqN/omSqhegf1KaSnCE
	w5b3X9+GcMms3AhQaEfqoxtK5q6hgdbo/vrnbn1tlUurijrpU5BhtsMK6EJUTVF6AxKnAZ8TQhr
	QaSTOs8AA1xNH8ImeYNGkII8tkSRI3npCa9ZJjCVHJjQQBc+47e49NcCK+5h8LcoSX0AcUiT9Wz
	w53WE9El0JcExaRwLZO7BxX078cfBE9Zo564sU/B4WvO/TzJ9BP2LiAjv5XqqGGx9jvYCOWKSal
	PhY/XLD9DM5wTAxVGV2TAGL909G8ayY/VT6g==
X-Received: by 2002:a17:903:2286:b0:2bd:8c03:2efe with SMTP id d9443c01a7336-2bea23e21e8mr27805185ad.26.1779370447026;
        Thu, 21 May 2026 06:34:07 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:4610:9413:be16:7d6:5a67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea929d774sm12284785ad.32.2026.05.21.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:34:06 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com
Subject: [PATCH v6 0/4] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
Date: Thu, 21 May 2026 19:03:47 +0530
Message-ID: <20260521133351.1512718-1-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is a split version of the Victus 15-fb0xxx fan-control change.
Patches 1 and 2 are no-functional-changes-intended refactors which move
the existing thermal-profile and fan-control decisions into
board-specific .driver_data. Patch 3 fixes the fan-table GPU delta
parsing issue found while testing this board. Patch 4 adds fan-control
support for Victus 15-fb0xxx board 8A3D.

v6 splits the gpu_delta fan-table parsing fix back into its own patch.
The previous 2-patch v5 folded that behavioral parser fix into the board
data preparation patch, which was a mistake.

8A3D is kept fan-control-only because the verified behavior is the
Victus fan-control path. The existing generic platform-profile sysfs path
on 8A3D accepts writes/readbacks without hp_wmi errors, but CPU/GPU
power-policy behavior was not meaningfully validated.

Adding 8A3D to the Victus S thermal-profile table would move it to a
different, Victus S-specific platform-profile path that has not been
verified on this board.

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

 drivers/platform/x86/hp/hp-wmi.c | 212 ++++++++++++++++++++++---------
 1 file changed, 153 insertions(+), 59 deletions(-)

---
Changes in v6:
- Split the gpu_delta fan-table parser fix back out into its own patch.
- Keep 8A3D fan-control-only and document why the Victus S
  platform-profile path is not enabled for this board.

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
