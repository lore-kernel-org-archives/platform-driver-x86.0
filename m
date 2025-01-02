Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B736063D;
	Thu,  2 Jan 2025 00:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735778947; cv=none; b=fYXqVQo7eyXBpwUJ7uIBgQJGrQ2NNIwenanQKLRXFRckx80hKfgGh8Nz/D/eTMxBoYcuEq0EMVJBL30HA5M2p1i30eXpqeu9vAzywTug5xx50CU62X2dHkW2YwgRCRcvG3onaD7+CpEL8qKcRHg0BHhI9nBmI66mtrCGxjwBG5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735778947; c=relaxed/simple;
	bh=ugHPYC6j1ZndMkgQWgurT8zLsPf+9nmJ5LHQfcvd7b0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RYRHJgzPGv0uPGbhlWT2/n+mVJiZrsCzC1J6W6nY7SNft765oHGQr+5qslRoC7OKLl5E9TKyErdR+gNWRhr3pbZpURZQQK30RxM5gqx94lwrBcJqwm9mIFtGpItD5GJzGU+SlehGMz5J+i+MnWC0IOtvS53M2gs3AR1zkPhCl9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WB7yjeIx; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WB7yjeIx"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef760a1001so14768918a91.0;
        Wed, 01 Jan 2025 16:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735778945; x=1736383745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Igjw+uWg6O1JgIzIHygYP4klEbzhduIPHJ7Y6zmGQc=;
        b=WB7yjeIx3Ckh/ALmD5m50q4tkf/3j2T3GHxNkCDz6QH7t0ViSADJV3y8+Drhneo7U1
         cwu3vzYSdpYMtoSpB8I7oOUvZ+XsD7du/CWlveUJEUS0XrqWY2fLx+yMvo2UJftm0/n9
         J7YwJN+SI1ttqjO2BiY5hv+06C0UROS24NqtnxNxG+KQ1mLgshTF2ggWODtMApeEgcwz
         hgXGWGgmqUa7ci5bCCNNO/t42doiL/WddDMEbSXYpDXvQX3+g4fy9Uscp1x9RzBiL00y
         Fdv/s/2IXk/Ez8NsCliwCCtFgrjgdrKD+RZgxLHpdeax+8xBFQfRLq5ftjsK6V2kr9lm
         pmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735778945; x=1736383745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Igjw+uWg6O1JgIzIHygYP4klEbzhduIPHJ7Y6zmGQc=;
        b=Thvau5DwFkhU/dC4GrWzVqBBxV0e7ZbEme8pZD2H4mCqLCQkddu69D5hVxLgFet6uM
         iANFxc7vMVi5ak8V3YuYFmOXhWw7fZh/5iEslPTPWEJP/KsRz2vpLF5DYVmBtCuvhmij
         xaIN4k6YhhxKBRlBn3MkZT6oGrPEv9VOW6MFxMh2JnJ2MPVlZiI6lNcphAVpPUCr+Yfz
         TbAhxattXgqdzWfwdde5X8Yyg9/zMjM6exu81WXZRYJVFMnFzGaQTv4iLfL1za+WVpJ8
         A1KuRZVSLmGUOkkJDWeD3TjXpKDTQ0bS6Ty3szhuP+KtOnHAV+FuuO+Gy34f9FuM12XF
         HVTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlATpsuNu/U08p/cY6djBESmZSlblDzfEcPyIqdDYii2O2f7ngtlhVRgN/ziUUOlx5d8IeGe382pc=@vger.kernel.org, AJvYcCUwsiX6jNE8zVxNKj4HjJLNmltVFJ7hoSOiJgrUbJt0ZK1vHpphNKNvws+4tshTBgUe5oNbA4N0tU7TWL/X@vger.kernel.org, AJvYcCWDNpHhRbbtnRgBj6wzygu0e7NUZ24qdxfnbioLsm2YgXmXGQmMhubFawmywWZPTgZ+u4YM44AVbHTt+4nv+DD+s1f73Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCjampUWATimRfpGN9TTqnV8edUnmTL4S3ty+WMLPYEduhqeT3
	lrW7pYZ12T/qBOTHne/2wh8Bh79fvlp8z0fklzoE7UWfAZh9lktV
X-Gm-Gg: ASbGncuZGopDHOidcJs+7DWB3Pe5ik5oUfJxWlnOa2YjiTVKk9VC5xAtHd+HncG5GMh
	qy+Xyghjw/QUjlupNmzJ5AKTxPFq8rmG+eR814abBf0B4rT7cnMuk9j70ONCkdRKmOYVDZ0Z5yY
	k9Uwp3zrFrLZC/y8Yp0Jo5HlrQJvFctBSAsr8+y1X69hgJxMPAhUjAOjl2nn3+nMsJ9hQZWwH4D
	dTvIU7XH7xQ/di9zTeGAnh5cZAypdGlSaaRp2JZ/DPNdx7cn32C8qUcs4298q5+Hbpb/HTbsp/W
	WXnuzZYOGzBeaVraV6RSef5PI3UJh52l4VPgyDuIz6L++hRtThHq7D8=
X-Google-Smtp-Source: AGHT+IGBMnUQPQuZy45YZ8AeFUrw7qbpfB1CNxsLjadhWZWbR//95UMcpD6S3Vu4QmU8aH/hkm8g4A==
X-Received: by 2002:a05:6a00:4c07:b0:72a:9ddf:55ab with SMTP id d2e1a72fcca58-72abdd9c06dmr64598510b3a.10.1735778944860;
        Wed, 01 Jan 2025 16:49:04 -0800 (PST)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8351fasm23793594b3a.62.2025.01.01.16.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 16:49:04 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] platform/x86: Add Lenovo Gaming Series WMI Drivers
Date: Wed,  1 Jan 2025 16:47:18 -0800
Message-ID: <20250102004854.14874-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the Lenovo "Gaming Series" of laptop hardware that use
WMI interfaces that control various power settings. There are multiple WMI
interfaces that work in concert to provide getting and setting values as
well as validation of input. Currently only the "GameZone", "Other
Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
I attempted to structure the driver so that adding the "Custom Mode",
"Lighting", and other data block interfaces would be trivial in a later
patches.

This driver is distinct from, but should be considered a replacement for
this patch:
https://lore.kernel.org/all/20241118100503.14228-1-jonmail@163.com/

This driver attempts to standardize the exposed sysfs by mirroring the
asus-armoury driver currently under review. As such, a lot of
inspiration has been drawn from that driver.
https://lore.kernel.org/all/20240930000046.51388-1-luke@ljones.dev/

The drivers have been tested by me on the Lenovo Legion Go.

v2:
- Broke up initial patch into a 4 patch series.
- Removed all references to "Legion" in documentation, Kconfig,
  driver structs, functions, etc. Everything now refers either to the
  interface being used or the Lenovo "Gaming Series" of laptop hardware.
- Fixed all Acked changes requested by Mario and Armin.
- Capability Data is now cached before kset creation for each attribute.
  If the lenovo-wmi-capdata01 interface is not present, fails to grab
  valid data, doesn't include the requested attribute id page, or the
  data block indicates the attribute is not supported, the attribute will
  not be created in sysfs.
- The sysfs path for the firmware-attributes class was moved from
  lenovo-legion-wmi to lenovo-wmi-other.

- The Other Mode WMI interface no longer relies on gamezone as
  discussed. However; this creates a problem that should be discussed
  here. The current_value attribute is now only accurate when the
  "custom" profile is set on the device. Previously it would report the
  value from the Capability Data 01 instance related to the currently
  selected profile, which reported an accurate accounting of the current
  system state in all cases. I submitted this as-is since we discussed
  removing that dependency, but I am not a fan of the current_value
  attribute being incorrect for 3 of the 4 available profiles, especially
  when the data is available. There is also no way to -ENOTSUPP or
  similar when not in custom mode as that would also require us to know
  the state of the gamezone interface. What I would prefer to do would be
  to make the gamezone interface optional by treating custom as the
  default mode in the current_value functions, then only update the mode
  if a callback to get the current fan profile is a success. That way the
  logic will work with or without the GameZone interface, but it will be
  greatly improved if it is present.

- I did extensive testing of this firmware-attributes interface and its
  ability to retain the value set by the user. The SPL, SPPT, FPPT, and 
  platform profile all retain the users last setting when resuming from
  suspend, a full reboot, and a full shutdown. The only time the values
  are not preserved is when the user manually selects a new platform
  profile using either the pprof interface or the manual selection
  button on the device, in which case you would not expect them to be
  retained as they were intentionally changed. Based on the previous
  discussion it may be the case that older BIOS' will preserve the
  settings even after changing profiles, though I haven't confirmed
  this.

v1:
https://lore.kernel.org/platform-driver-x86/CAFqHKTna+kJpHLo5s4Fm1TmHcSSqSTr96JHDm0DJ0dxsZMkixA@mail.gmail.com/T/#t

Suggested-by: Mario Limonciello <superm1@kernel.org>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

Derek J. Clark (4):
  platform/x86: Add lenovo-wmi drivers Documentation
  platform/x86: Add Lenovo GameZone WMI Driver
  platform/x86: Add Lenovo Capability Data 01 WMI Driver
  platform/x86: Add Lenovo Other Mode WMI Driver

 Documentation/wmi/devices/lenovo-wmi.rst    | 104 ++++++
 MAINTAINERS                                 |   9 +
 drivers/platform/x86/Kconfig                |  34 ++
 drivers/platform/x86/Makefile               |   3 +
 drivers/platform/x86/lenovo-wmi-capdata01.c | 131 +++++++
 drivers/platform/x86/lenovo-wmi-gamezone.c  | 203 +++++++++++
 drivers/platform/x86/lenovo-wmi-other.c     | 385 ++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi.h           | 241 ++++++++++++
 8 files changed, 1110 insertions(+)
 create mode 100644 Documentation/wmi/devices/lenovo-wmi.rst
 create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
 create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
 create mode 100644 drivers/platform/x86/lenovo-wmi.h

-- 
2.47.0

