Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586073;
	b=it/v9r7ajcyzxisk7RAcVslMcd006+/Z0AH0U0NTUHq1WRqoJBGwYWfHLf/quuCMMB9/
	 GVTsrXvoApYYvRoHsEtA07x3+SES+mfcbQogKyy80mOypwB3rhVkJkNjB5ZApL8nnLtgu
	 HUvIxiG+lhwuSfnrMjEttsSZ5Dz+u+xiwurheMGMwlN12+ZA2QTJVqxPb++/Azk8IdNbb
	 kqYt9s17y2wyA/zmhzN7+S7TBT5wMz+WOCfLbd8/65/rBpnuhq9/UjvuXRssYg9D+t9mi
	 3s56xfeA/vAQRH/g9QApPnd9duVn8/G04NCfN2qDHEzrRWOi/RQ3tQkMhomursBDBkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XO8Ovd8Yga4MN2GzBAV0MC7glt1HQ8NzqivIkAGhHag=;
	b=Qq6oeN/hYq+AsJKS25B9BpLgux/H/KSUC1gXwTcO6lIytPPL0XXuorp15RYzYxZea4gz
	 MHS5g2E+IB/1T6/IR8h/Tn7Bon/scSw5XRjKyL2A04j0gb8FxjYU2hVoNr+UtRP/iD8F4
	 Je2OW2nswVTY+KfwPSTUAStrlHUf55yCZkKM6Qkmcr46Y4MAI6MRyv4VF1FyG05YvqhBB
	 L32Xerb0Uz1mc40L4FXocH9rslC1i8CMYuyX2K0rNnjEK07eHvdZyjZzB8StR/XcdWbYl
	 XMDztADZcCs5svioC2wtr3sDKlXupdpX6swmIgbthURJzizF5axVzpZ0BZRm/+LtFLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LIGMdYiR;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A46A606A31F
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 12:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A46A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LIGMdYiR
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so404128a91.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 05:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586072; x=1793190872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XO8Ovd8Yga4MN2GzBAV0MC7glt1HQ8NzqivIkAGhHag=;
        b=LIGMdYiRZ/LgfeAWS3K7xA4D9vdGmAhtmyJIzl7jROn5XS2gJKFwOEIIi1HCzyuGoZ
         vqMD2l3P5uiOYvLgciZ1LglD+5hmKqdh+c1QhDxUI8Xw5M57AdaB2cqqGrhqfRexV+gq
         UxC6RZsD2fIWcFbV3mxCQMLYYsbMFTCi9KEBYom1zlXPrRRtZBtw/lUR52kkaX996xeN
         P06rzkw8b+oBb/ryHRDCu57R4HBaWWN3L9roc3JeD7NG86fQLgVf0NhsqO32c6vXH+in
         XMlc5L+PRGh5LUWGk6lxW8NL71++Acn7CeaRZRMWj0QRFu1QNIEQPi2OPP1jaNKG70kr
         Xbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586072; x=1793190872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XO8Ovd8Yga4MN2GzBAV0MC7glt1HQ8NzqivIkAGhHag=;
        b=rJb43djFiVR6x7hVXIKHWRVTPOQ/zz8KpAHhewkHMMC+i5Kxgc5AMs+4TZB7bAgA/s
         0nDfVxabHzZmXCJU8xUIBjdiSJ/gxs8/AR/YC54XRgq1MtCyY53QK785lts60ZXzUA3Z
         TtszDOJZZU9Us+Vfj+MhiIruxPwIAYIlw83OLmh8wSEdlcW011kdRhDNcesZWCJWFSLC
         iQgAJT9UH51nfVjo3PT9IcAEF7dom8tq5Pc5v1ZmigkvPgNhEVuPw44G6xqV9g4KcYOb
         r+gMgSCrBXS4uAp4uZlpxqEvNzOyvEINqNuMwyXFZqVB80d+0QCj7p1BhJghfiDTrBk6
         qFxg==
X-Forwarded-Encrypted: i=1; AKwUvBykbL7IsGnQnyiSorYVCb9LLwdMnCQ5HfwgcbT+2iQyaKSPEEG6uUKcxnjrEYcfP8G07wSq7yTOWrLsNnxCNhcWrBkz@vger.kernel.org
X-Gm-Message-State: AFq9FYKYPSG6XiSsbaCp8l8jxjZHlCSDdXNsN38yb0lGULDSkdFD41rm
	PVN8FQsN1uYKiMRBEwAHFe1RuMwtviBFNXHWtPUTHuyVgUX3+ArjFwCq
X-Gm-Gg: AYBFou1QdPBjXB0WS1DZDYiY5XSui7o+FH30RqXVwIdXfUmkPbSH2C275THjHhEFLZ9
	DOdcO/ZDcaeT4lJop6Bolw1vcMgoxMNs/zui1loTkIaHsfJ1oCkRgcq2Ymipj3hcq4pQEHBtyCN
	oUKnOR+vRciKIM6KLHZngguPJXFEylHHAkAseoRccLc02pJYA3KrSAnQ9cVpSm8Q0720yMKaYm8
	FjcjKWnGPNK/b+vSB/a519GOgllz8QG3XhLPLO1Es9L97+r7E5KhtwdJV9mv3GFCxXM+DDzFlQ4
	GM6sGk0QSLBTVOc43+TPltYX7MPvwUz8XMYoWxLl/WxPWwodtFSKBq4ZPHoPEmH4ckrFMq608uy
	HIoUP97RKrYHa8loLaNf+QA3wT8mGpnATKeDfE4RPAlXdDJYxLDgl9J9we0B2iKvpb1O9MrJGAz
	1Ta0nfFZHl5Q24LJHBm7OZ/NVjaD3U12OKWykjwOtjIZHwQb48FOBspXnnIETuw8zfLllLVilRI
	oO2fLrAOHyKuMJt9Ger98QwDOBEzfLR8/3Al8LPyXzI1SyIjN3cqg/E
X-Received: by 2002:a17:90b:2886:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ad86ed22e0mr1474331a91.26.1792586072096;
        Wed, 21 Oct 2026 05:34:32 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1823615a91.3.2026.10.21.05.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:34:31 -0700 (PDT)
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
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v13 0/7] Merge redmi-wmi into bitland-mifs-wmi
Date: Wed, 21 Oct 2026 20:34:07 +0800
Message-ID: <20261021123414.25516-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
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
for Redmibooks, dropped the previous redmi-wmi driver and intrudoced
the quirks table for the bitland-mifs-wmi driver.

I don't have a Redmi or other Bitland device. So I cannot work on the
real device.

Features are working properly on my device (Lecoo Bellator N176).

I leave the future reverse engineering work to the community.

Tests are welcome.

And by the way, the no_set member in bitland_profile_entry means a
platform profile is only report by the firmware but not available for
set.

Does accept_zero_function still necessary since the driver now permits
0x0 function field on SET operations?

And I've got a question, from sashiko's comment in my v12

https://sashiko.dev/#/patchset/20261012133648.132363-1-qby140326%40gmail.com

> Will this result in the loss of KEY_PERFORMANCE events on event-only legacy
> devices?
> Looking at bitland_mifs_wmi_probe() in drivers/platform/x86/bitland-mifs-wmi.c,
> if dev_type == BITLAND_WMI_EVENT, it returns early after registering the input
> device:
> 	if (dev_type == BITLAND_WMI_EVENT) {
> 		/* Register input device for hotkeys */
> 		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
> 		...
> 		return input_register_device(drv_data->input_dev);
> 	}
> When the performance key is pressed, bitland_mifs_wmi_notify() intercepts it,
> invokes the bitland_notifier_list, and returns without reporting an input event:
> 	case WMI_EVENT_PERFORMANCE_PLAN:
> 	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
> 		blocking_notifier_call_chain(&bitland_notifier_list,
> 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
> 					     NULL);
> 		return;
> Because the platform profile and notifier were not registered during probe
> for event-only devices, does this mean the events are silently dropped instead
> of emitting KEY_PERFORMANCE like the old driver did?

I ackknowledged that KEY_PERFORMANCE (WMI_EVENT_PERFORMANCE_PLAN_ALT in
bitland-mifs-wmi) looks like an event in this LKML thread

> Since the event reports a change that has already happened,
> platform_profile_notify() is the natural way to pass it on, as
> suggested in my v6 reply: power-profiles-daemon then re-reads the
> profile, which is harmless after the driver's own writes too. If
> KEY_PERFORMANCE should stay for on-screen displays (Ibragim asked to
> keep these events observable), it may be worth not reporting it for the
> event that echoes the driver's own write, or at least saying in a
> comment that it reports a mode change that already happened. On
> Ibragim's TM2209 the profile SET is reported not to work [3], so there
> 0x16 can only come from Fn+K and the echo does not exist; Ibragim, can
> you confirm?

https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/

So should I follow sashiko's advice?

v13:
Fix the zero function value problem find on my device
Fix the memcpy size issue
Remove WMI_EVENT_PERFORMANCE_PLAN_ALT in the keymap
Select BITLAND_MIFS_WMI and deprecate REDMI_WMI instead remove the
config entry

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

Mingyou Chen (7):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add quirks table
  platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile
    if last performance profile is not available
  platform/x86: bitland-mifs-wmi: Permit zero on SET functions

 MAINTAINERS                             |   7 +-
 drivers/platform/x86/Kconfig            |  11 +-
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 357 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 ----------
 5 files changed, 259 insertions(+), 271 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 893018d51f27ec0449155b0afe371aaf65380630
-- 
2.56.0

