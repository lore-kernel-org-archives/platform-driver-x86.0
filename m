Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DFF45BD7A
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460113; cv=none; b=hQ1tDqxliFU2je2Hc0JXYAKdOb8NRKpqud9Xr2NH3vSmMUrihSqcXBphGqvMxTzyFUCiTJs9s22E63CHQVGw393QbJPCRes9AUatrs9RzQ2mpzMwy6+P4bc2x/STwQbOtXW7hflh5CGELUma98+x31eJfM7G4fUZZg7iczbnAdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460113; c=relaxed/simple;
	bh=kaM/3Ji2Nhpe2NLwuPLLE/UHPthskiDnTS3lPiq0A4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EAxhQb/B2COZe6EhSRsYBeiZdxWRItRMJ0YoFR3pKA0JcGiSmibT2PCXmmGXjzJY3NcPgCAXoCAsPqMQ8VzKwfolpza+ShMCEEyvX5Ok/VaWKX3DykJUbw+4T/pcqPPv8TOeVQRpPVzI2rTaDyzIhwd6A/obHY6FrZCHMjXOtiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFkZEy4A; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFkZEy4A"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8379e010b01so3257468b3a.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 07:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779460107; x=1780064907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6iYd2LcjmApVKVCdVE1jH3oBaAUymPbzllWKH23cH9w=;
        b=EFkZEy4A+n0YvtgdJRgpa/mELlMhVePL3FzlU3gtgu13EP2qavx7GHa0TJoPpYakmr
         cKzHB3S5tRgim/8llcxK4E51Qv7b2da/OrO3k+FYFpxS889lJ6RBHaQwMc74UBL0Do4p
         LoAJh0hLQ7oLb+JoQkY7ktEgd/oC57I/JeU2gcbw5aR684amoJfjlUZS2POSW46tjMUN
         /Pcf2TzJkuIyJW2kH1LI1y8jytRxdCdeeguOQlL3f5F3h/D8Ul3D/Qf+Seq9YaEiiNRG
         MEqIY1UuunykaX4pGOv6sxhBN1x/SIyjecLlXCCcwqkqVfE81eOv3QiJxG9StmBokvzo
         72fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460107; x=1780064907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6iYd2LcjmApVKVCdVE1jH3oBaAUymPbzllWKH23cH9w=;
        b=Nz7XRuDhwNUdPbwa8tkR5nN93j/aQWw4ZBkgnr19kPs0LYzUdalltObXHOQ07dtoIj
         5GFOHrR3hkynNTF6NSjBZvxj8ro+0I5StDRHb13WBPjIhMLm8+n/7ROySt3fRmmTI+zT
         h+gRaSEBIVOOd1qbl5+sTgx5mtd++2nVEbWzi3yuwB+Fuf8XEQhJiVsu2Uwg0drXJyZF
         JloCDIPQNji9JKJDUHSdddl0q0mW4Y42cYvCeOevPpk9X9jH4qkBiDofDtLSPt8GJ1pF
         KHX6Vpt+xSx8hMvVgAeaeOqNyYp93Nw09hHWfdSmI6ufkPGZPWGBrxlWhC7lwTzuhFIe
         Athw==
X-Gm-Message-State: AOJu0YyLXKEuobQgXB4anoLsISSlAnO3YiLUVgueps8ZcTLQELCdp0dD
	FxjZy7gzCXtJy9yYqgCXO+YLg0rZs9LTJ6rE3RVU55wO9lL4YREH9/IloZKIeJIh
X-Gm-Gg: Acq92OEal9eK3fVcOZk9DHnsG9UrEYNZxRc6jVBttFYz1oWOarV7gXZCqnuMlB5m2Ms
	uRR5iRGibfGQ1j9PCreJPRanukGHcNgwCCGcClbVvpLm65lhmR0XrLwcUXLOfg1i2i8C0GAHaZb
	tLRJVAJstoB2eHbBfB7w+dZwAW313athMkDz1SJDluQ4AWj+0xXtUwpjp7aUjgL+cwoAM1ZLf+7
	p8QiO/yeo1oxM8mgDmFhhQvtBJSbsnQyunum/7wv+1kaCf+xWgLcIR38ENP46DkQc8h0X5h4G67
	VwMCxhYEqxW8hJ/MYClCfPhFoXoMReEmKQjyjL3X8uzZbIh3ea/c8MQld1QW5wpYsAWKZNpvTJ6
	A7sree4A+O1WyuyT2WMeqLc6FclKuWw/9s7o5p89JiZTSYDNKvys704+0eOGdckwLvlq5g85aLi
	RLwcLsoCYpuX+Q78iOgkQf8H5XisNrIJIhN+jMq+taTWiG
X-Received: by 2002:a05:6a00:2d25:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-8415f5d1ca1mr4037981b3a.14.1779460107045;
        Fri, 22 May 2026 07:28:27 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:4610:9413:be16:7d6:5a67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164b0427bsm2585087b3a.22.2026.05.22.07.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 07:28:25 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com
Subject: [PATCH v6 0/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
Date: Fri, 22 May 2026 19:58:05 +0530
Message-ID: <20260522142808.235894-1-radheykalra901@gmail.com>
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

v6 drops the gpu_delta fan-table parsing patch for now. Ilpo suggested
postponing that part to the other GPU fan series, so this version keeps
only the board-data and 8A3D support pieces.

v6 also rebases on current platform-drivers-x86/for-next, preserving the
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
