Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406376;
	b=TR0ufQQbWuflQFRNyFLi7w0HApwqG0RY5vTOMzie1TBplbelFDZRT/VMq+y93w4D0/dn
	 nuNCQ2WDxwO4gPy9RPaHQvF+CTqN49SnLnUwYtAbMTXhSjAOfLQVmfFrPCDmNQUzjwNUV
	 G2p209UTlJEca8gL5e51oZJOJkR8uEB5CqFjzU6wHyXxDVWHybVbLPVycqIyn7sucnxaT
	 lM8YJYPo2cR1K27qdi6TTo7kCsKmBZV23pT3DqiJNY7a2JSv55S0CasjHSb89MBkQEFHf
	 xaG7A31MK6nZtDA3YHfaYDB9vrilbArWndu6vkSk85DHXUjPwqS38MUxBDIa3SZ1Wlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RyaNr0cCFD9SOnyOAkomip6CQoV5it2GgjFP5fUVLZc=;
	b=uUyWgLvtI175Rz5VwYRBY5DuRv0Z6plnpOpHXUpemYKVQEIzgxib4Ju2qn9zaJu5Eqx4
	 u+yOWMKxfYBN2jEv7YkUueJZ+2U2aBugBoZkUeko5M9KwSODwxdjaVNd+FQWSlT3746D9
	 dqX9o0F4xdmRRZj286UQ/rNVr2eCII3ROU08atuCA6e8HOod6U9/T2wfN+Dze9bqhdqXM
	 R9EPGYckI/M9Y9jWMbCBTPoL3ZyhrMDxyOxpMZQajNLoKUigfmUfGYxVffUi2SFLm7Iz2
	 6osBxYzdYnphblvo8fE8cR67iXutc6p/Fs+W8x8Hrx4oSbVT85u6TZihkUOCOyRwjpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4WFNAqw;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A9E606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 14:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A9E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4WFNAqw
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1826068a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 06:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406375; x=1795011175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RyaNr0cCFD9SOnyOAkomip6CQoV5it2GgjFP5fUVLZc=;
        b=I4WFNAqwqxvempASyT1z5T5B0ADkS9xre7QOdQZk3GdZ6ziNDcILW2I+2oAUcOQC42
         fUqhbc1kg/i/ozB/syT3mj8dMDUAQeIwXw2BmDBQhhsrCfKNOFD5qGns2o425Y4tf+P/
         76qBL1XJ5Oi4iCIG8F7tDRTkcEqVnuwEcmwT98kCwV/kJsWDvIA8E15FMNJuM4iuuRNI
         p1iNCvUArJj9drgyee1kfju9vAPbJBeb3EhknHz/ErPwNjq21CnD6N8ALvilIQPqJARv
         4xw9JrkarAe/dP4f9szVM1u4fk41Rpz6AKhl+KbJ19Wf2DHS7XiN7PqoWF5Eqi/l4tkx
         V8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406375; x=1795011175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyaNr0cCFD9SOnyOAkomip6CQoV5it2GgjFP5fUVLZc=;
        b=pYlSFihC+oolRO5ojG8OFhA0/ijyjPnzXbSrVU1GsJAVjcO1hFsfHnUrM3e66IhuYL
         sU+qK8AWQ8bOwUwKyApGzMiVfeO9kwGEWTg7ufVk38ZtQeDMv8xQgXJgHLxvrxMfcaGA
         FS7rv9WUjN0A11SW7iVp2ovwV4IGxpDsMYTlrGfD/nCE1YfoPlhMZOVEFc3F1uOuQyAU
         FgS4O5AdB4ZbSY1DIfZi+j2768xXqHQZ0rQhgZWa70WMlXp4/iOECzYJO5CykpTP9Sv+
         ZEfkDl2t55NfG6j4bSIVbbRbZ/w4QRF3ya/7Ra+yfSYsNOVaYlZhPYEkxDOjzRjxmRWq
         27Fg==
X-Forwarded-Encrypted: i=1; AL+hErFXGdJKdSinG0z8BD2Zo4qOzRLsfvL+n+OEVISveHSJZbPfTISX/KMwkueQguHEvLvfVCkX6+u/y+cnIelX7O1DJjAt@vger.kernel.org
X-Gm-Message-State: APuU4Z9d4F4cAKECwCxpWDyN7YdXDxoan2KI34Wa57cEe+Z6bJ4XNty1
	3ItkDvmQas5cZLCkv0Ta60+VH8UNI8uGmRMmTcRiy6DVK1nXXdVibb15
X-Gm-Gg: AYBFou3i1qYdZTE2Z5LKT2oegT3Mr5J64o3belHfu6kdogQKElkVC3jzmOG0RgoyNC3
	yVwaSdmjSKUfILC94FkMIRglDXa2FnJyDlPBbrW9MyRgAiDxyKmJnFVnOetH4w0dhmSd/LlRqAR
	4A598RkXpQFpFZ49vE4gBS/Nzl3P7wHwn32zMoCqDWFEKnxnXBZtJyaouuvUZuPf6FaDV4CdvfS
	otk7/FW2A/dKaCHY/OyLYh1Ud/kYMc+JTWHFIBmiNyZK1yugLW1Ngxic5CPrSGKBrJ9t3LTbwgT
	VzffVxy5h8kuY4Qcr/XNAPJ2sXZsvuWBGngya9hAyxFPc6uD0kyfXUmBpd4ib/x5EiHiy37El07
	DGo5gW8i2SsTSUU5ng/lbyUTT/Z17qqeC0c5H8bKXMEkWxd44LfuZw5KEuX3NfDoB6ZBXVasdgL
	svlAcfl/OHyt4afnaVnky2i65Zf0L+1Q4i53NehbThh5G6og1HHfr7XjIFrtPCZqAFXHrUd16Ul
	/lTWDk9fsyBIHWt85flV17qVx4GsbOs4gRS52ukbQ6AIFP/BwvRohr01n+N2B8QB8rqZoHaiWmB
	yjNH
X-Received: by 2002:a17:90b:55cd:b0:3ab:d26b:c2df with SMTP id 98e67ed59e1d1-3b182f2d866mr1703829a91.27.1794406374864;
        Wed, 11 Nov 2026 06:12:54 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db319bdsm4789970a91.6.2026.11.11.06.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:12:53 -0800 (PST)
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
	okluar <okluar@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v16 0/6] Merge redmi-wmi into bitland-mifs-wmi
Date: Wed, 11 Nov 2026 22:12:20 +0800
Message-ID: <20261111141226.9482-1-qby140326@gmail.com>
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

v16:
Rebased onto review-ilpo-next branch

v15:
Fix the build issue reported by kernel-test-bot
https://lore.kernel.org/oe-kbuild-all/202610270608.l51GVbZ8-lkp@intel.com/

v14:
Drop the accept_zero_function quirk based on Chris' comment
https://lore.kernel.org/lkml/CAAcRvKPSk5FYzZGkw12cPVGkxWVGFACwRvupBDDNae7B_JwF0A@mail.gmail.com/

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
 drivers/platform/x86/Kconfig            |  13 +-
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 353 +++++++++++++++++-------
 drivers/platform/x86/redmi-wmi.c        | 154 -----------
 5 files changed, 256 insertions(+), 272 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: 5680519168f65666d2c03cc6ed8fe2b7052aee12
-- 
2.56.0

