Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6B6361DA8
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 13:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812293; cv=none; b=ZAq6+4RfXBW1ubkd9dzooJlmDRG0jiD6IBXn4iDWLzdr0c82nfDNzXB/ZlDXozTaZM8C5C4jytteR83yi/2WWubnTL3VzyjiQjbkg4dZFQQoMUNuTu373ijNL949/VqGSJ38lLEWKzfegh9lUhjN2w25/j/SwH2PTdwHpG8zYgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812293; c=relaxed/simple;
	bh=9MxIQ7jZUFv8moEEopZU8pjWgsmASzzXb+xzk3tr21o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T+BawAnDixeHE1roK+jfAGX2cllscXE6d4H4qU5ac7FD1eToBb6xgEfZOl9U8rxzwid6FADno1hbDyfoJo0N0XVt4VeHZMrXDHmsRbKKSkdrLCsNtUo20dImw/Ht8lyRzcus0vaMGMmNzvzKJROaR3+H9RomfKeuCMXZ/mOkha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqJsGssE; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqJsGssE"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1099064a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812292; x=1792417092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfDTlgBnqxtigNlcm0sph4MMrg2IfmGLuxOuTkWPTtI=;
        b=QqJsGssEoYpB7HDq2FvkUPUk5Tpw+D77rgRm0cBpkgslvL+pOX6otb9SzaK04wo0jX
         bDW5+6q/uHU9kOo5/5qgMb3D4v6KMeANUcNGJMXa0Ri3tq8JFSOVLE/9SL0KiXGSdGu9
         Vngbk2H5y9uLYemgBH9TLyBnz4PtXmBI4wv49HUbNA2LoX6gYF76MGqDrKkFh2p/IzFy
         MYUWlt/wZVbSDOWhq6N3wU6lsJDorhbFcCTxOm4v5brj1yb//tB5+WXLSoo27n34Lfo8
         NPsawibpqlJ7FYIN4yGJpyyhtFytr7hun3SsWpcv64r6vJyl9pQR7OpRMYqKIDiXeFb+
         rjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812292; x=1792417092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfDTlgBnqxtigNlcm0sph4MMrg2IfmGLuxOuTkWPTtI=;
        b=ByPO/SWuTfx4L9kVCz9Z2B6K6UieTJh2X1SFak3qMBZfqHwFnrIpF8Rw1Wj1FPux0e
         e13ancRxdm9thVrBbIMVBBfMuLn2/LEOn2vmHwSzossfeRfDX22wT80/q+DFuneSGS80
         F0H6A1z9jL8gEk+cjCendotuXoizR3GsQmiLG41i2JwymHrwJZaNPq4jSx5GgvM7xIET
         LUeCN9J6fOsRPEsRrizEnXqJ4sTRtbV1eIlkTeaYsJ7U/bBd8qKAibPLanCFQqi9/uo2
         FBFxJ0eBmhoRocU6AYWdkoGXiFbLH7DWTCDgRoJsjEaUQ1WaCovLnnkrp/P7iPao1Wk3
         we9A==
X-Forwarded-Encrypted: i=1; AKwUvByu8zOfbgrKTs+LjkfNZ4yfLj+UrSunur04hJZAmeNEoUWVjnV5mYUx24WlsMFUR73mkFU7u0ldgrJFWeMxi5fMknDG@vger.kernel.org
X-Gm-Message-State: AFq9FYK7icqdHYh4NQObYQVpEzjidFR6SQohnAEs1s7KmrSWsp60s7Dm
	Z0Ts2YGpfJyU1pDkDTE+h8UoiuvHYU17LM4sLkM3JiSwWzwognMDDBiH
X-Gm-Gg: AYBFou2JFB2SiRFacJAmEIJKrzsSLXOnbD2q4F0eAGzdEhddauHQgpqw5Wfoe8iogUW
	9VA7HLDC9nWY8S40WFcx54llSDxxg7fnegR9Vk5gll5D/LtrlSrqCtezZJl1e2jxZYa+43HXOTM
	eSL1viuUP1kON9TeAMrLFT4zgx8H1qSlNNweBdXOgNbv7+utTXEbunpM57Z7OHXFtsT59gIDARB
	7WgF8t/cdIUBuvn8nXLl387+fch+20fsJ7NQJgSsLcLlzmBOGAy0vYcJMFar12+oqobJrZI9aQN
	/VIGLpKMcmDHfhWHuZ2ZgjauQNElOtDa9/rBIAcmRqzH0BLXtoYNCQ5KYDjSZyUNwZTFdHQIf6R
	2OWjk0gkhHfOYQQ1FVYCV+0i5ya7K04W+h/BUMc4PPhdkHxCIxWTKoM+RppPoDeXFRwAerGbrWf
	Gx1SoNom1E7dd8OIjHnoc5lDHP31gSyvv7rq9WPXK6XslyyDXRh1YBDIRha3uicVusrYFtqLM=
X-Received: by 2002:a17:90b:3a48:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3ab3ab5a652mr8033661a91.13.1791812291676;
        Mon, 12 Oct 2026 06:38:11 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab50ce9d98sm14534878a91.9.2026.10.12.06.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:38:11 -0700 (PDT)
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
Subject: [PATCH v12 0/6] Merge redmi-wmi into bitland-mifs-wmi
Date: Mon, 12 Oct 2026 21:36:42 +0800
Message-ID: <20261012133648.132363-1-qby140326@gmail.com>
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

And by the way, the no_set member in bitland_profile_entry means a
platform profile is only report by the firmware but not available for
set.

I don't have any LLM API credits (and I don't want to order it for now),
so I cannot run sashiko reviews. Could you share the other review comments
to me?

v12:
Fix the issues mentioned in https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/ .
Copy payload_data to output->data at bitland_mifs_wmi_call, not
overwrite the entire struct.
Correct the key name (Mic Mute) in the commit message of
"platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries"
and my device doesn't have a FN-ESC key, so I renamed the enum variant to
WMI_EVENT_MIC_MUTE.

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
 drivers/platform/x86/bitland-mifs-wmi.c | 345 ++++++++++++++++--------
 drivers/platform/x86/redmi-wmi.c        | 154 -----------
 5 files changed, 243 insertions(+), 276 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 98f039265e580291d5e76a11b2072541fbb1c393
-- 
2.55.0

