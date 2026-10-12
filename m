Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72754472F89
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799564; cv=none; b=gB58Bu1nnd6pHxX/taQUZhFnvvSTL4/b+0KuvWdknlQ3jRrazkdVauJyFIEFMGkBvRtirQTyNbglF8f8289Z51M++9bJNdn9dP5k3Uzqs0zdVIgkV/d0o91fHWoq6cmHs/d2a3QAxKxPR0/otiRhZXeISR3VS/GVLoNrCX2vDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799564; c=relaxed/simple;
	bh=dsofuRbj1U4u65rs9vpPl8XfBksCcIRSR3AfB0h5FQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BcZzqkAEhesuez8Ez2DN2wCAvLxtOtC6ktibtZkESQJ9h1xfgBtHnOBq8gub0UWNYz6Usiz+vZwPhUWDhOtynJMuC+iqXq3jFbBdFRhEmeqKyKOPaPszVGWo21dsa9NLHicLZXgAE2HePZ2awlC4UZbe3+o8W4pHBvCCCkKt5BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p5Najpwu; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p5Najpwu"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so845911a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799554; x=1792404354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d5YuHRGq/vndhRol3HJiJRdr2lwoe+AASVbFdfJsNtE=;
        b=p5NajpwupoHvdgXlP7VrmUbx7s5GqseFLA3D/Z3qfx031eICmWPuUY5I8livigvmOG
         Fc9UiveZAX/ABwUvQWU9zC0fc5VlZBU6wrk2dttvIbANoFXVKxLjCoTkM/PkTeq4NAMM
         0tFaTp8gog3cpu14dVe9zIwE4ANbXWf3ppg431eQd+sT2zhyFJFJwC1Zb7VXWeD5TLeU
         P1a1DhUmv4CjtMbHbRT9yssX07uF5JO4E2PNIUo2vbmBurHdCmIGuGJs7NNG0aOAVZcc
         Ly/L4siXao1ZD3Q5ZyKlcVsE17tHy4PtncY4EIgnHpRQNc0e3r+EmOThb/Xg6Z4mnOLt
         SG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799554; x=1792404354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d5YuHRGq/vndhRol3HJiJRdr2lwoe+AASVbFdfJsNtE=;
        b=r13vOgruL3EuymLfcmvcAk7v/5X8PecHX236zoex3wVXqVxXZDQHDfAvA8RvMWe9m4
         1XjIrSw3AA5lF9G0bCJNh8tRMi6i/rHqDP0VcCHal4RRWvKOUsGjm3VpR5EXTBnu2W7h
         KKl1hVNWVImKA1LyHQIGTOp2AXTXJVEzgKhUSm+VnQCvF0dvXvogQrleQX6ux8q0wdPS
         IOk4ZiHhNqxvso4anquW7PPn/wT/FzlYLe0XfenvD+ul3mvo0mBFa8mgB4Dv6Od8LJ6P
         g0ePOD94q/aDCSd8iroKOsc7QuPw7XkICmyvPzw13GmvmmCOGY9p8xsmm+ll6p7tPMqC
         +YWw==
X-Forwarded-Encrypted: i=1; AKwUvBzzQr7o3ESCBzAJD4ZqA9OZhjwQgnv9fNkC5RCgw8DacNSq3w8QnVchmN5PAs8mrLfokmS44uYdnl9iyWS9uc8PjRD+@vger.kernel.org
X-Gm-Message-State: AFq9FYKl86B7uPQrJujhiHk1tGEpKMR5k/KPREBGjaU4E211N22fgcYr
	EWGWxH63pj/oGXGnm+MvvOs7zG0Bg1BCCeEKyqcxjYWcexLedUD80apB
X-Gm-Gg: AYBFou0teBDET1hz0afVDocjjuwnOZ1f92XlJ1zjKx69GYzaebSooxRXMe0z6AvMRq5
	z0trjgXe56KFRZuW/dZg0lc5V/0+TrJu1X+z8f8LbrOG2RpW+1cHp53kT/Wds+LQfgJ+lk5AXbj
	+6yzVhI7dyRjLbaEqejDnGXq96a4WoZ+ZDUFHcIyY2XmwQULnT/6BOaJUXzpxKF5VKdnRk/X9Kx
	gs9TW4Z2rHrdA8xi2tqHiINCHvkdXfoK6MdsN4W5TiO4u06mpFh3Ck1NYPib+FrEahTHTkhqunY
	TZgP6GEHwMUNqIMe8B9cmuBaT63FLeUTvoMeiRZnyoS/hCsNinX1JWC920RAXqnEv0h6Fw+z/Na
	yPrOGsFo1n8+C98BGezoyrFRAjc/b6F+VjPxtxfmefxMRwEHzThLSJdG1LxUYGZ5DF9MyUk8CrY
	huyeLOiTVi6frhkOfgIpNvMt+EYHTRy4GZng6GfDokPbNXZaJVxnEqEqxG6V+F3QSI7QUyTHXUJ
	IntYrlahw==
X-Received: by 2002:a17:90b:4a8f:b0:3aa:fc22:8ab0 with SMTP id 98e67ed59e1d1-3ab3a8e55damr7486615a91.38.1791799554223;
        Mon, 12 Oct 2026 03:05:54 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm4074272a12.29.2026.10.12.03.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:05:53 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v11 0/6] Merge redmi-wmi into bitland-mifs-wmi
Date: Mon, 12 Oct 2026 18:05:26 +0800
Message-ID: <20261012100532.19612-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

Redmi operations were not contained in this patch series, future reverse
engineering is required.

This series introduce a newly reported mic-mute hotkey definition
for Redmibooks
and dropped the previous redmi-wmi driver.

I don't have a Redmi or other Bitland device. So I cannot work on the
real device.

Features are working properly on my device (Lecoo Bellator N176).

I leave the future reverse engineering work to the community.

v11:
Add missing return_code_at_end and accept_zero_function logic
Fallback to balanced platform profile if resume to performance failed

v10:
Replace the previous "profile table" with dmi quirk table

v9:
Add the missing feature introduced in the commit
e0d6312578e1 ("platform/x86: redmi-wmi: report EC state change events").

v8:
Correct Ilya Gladyshev's email address in the MAINTAINERS entry

v7:
Swap low bit and high bit for WMI_EVENT_KBD_BRIGHTNESS
in bitland_mifs_wmi_keymap
0x00800501 -> BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),

Report KEY_FN_ESC when WMI_EVENT_FNLOCK_STATE events received
Rename the reserved names
Use Xmas tree order in bitland_mifs_wmi_notify
Collect the Tested-by and Reviewed-by tags

v6:
Drop the wrong Redmi ops

v5:
Correct Xiaomi DMI vendor name

v4:
Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
doesn't support full-speed mode.

Mingyou Chen (6):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add quirks table
  platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile
    if last performance profile is not available

 MAINTAINERS                             |   7 +-
 drivers/platform/x86/Kconfig            |  12 -
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 347 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 -----------
 5 files changed, 246 insertions(+), 275 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 98f039265e580291d5e76a11b2072541fbb1c393
-- 
2.55.0

