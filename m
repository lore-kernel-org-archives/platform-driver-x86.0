Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C932F32C320
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764256575; cv=none; b=SFuUwwoMjrul9nNziRkbWavi4AYNcLDZzMAsrTNlCGJSiDFV5wXvl5o5FEaYPdtanupzM99VBhUvMmpelaff3SVBXHjUMIVnCG0ZvLf/ZD6AVW2upwcjoTzUR+o07CJQoeqlgZ938aO3nJYZpxcFyDIlhNB5KxeaH2qhJpm2HxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764256575; c=relaxed/simple;
	bh=WwMLobnu+D0efGsATUA1Gw89i4CUGPUY5A4C7NZzBs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FvKJHOG9x1QwBy9PSlGbZs7H8QBVw7FhUd9dLF5kfppYKLAAAaKMa84bxi9U9JOZzdZB+IAqhUzgnPc0g5esv19Aqd9q52aN0laf263LVEU6oyQ/VJWcfzNKtjjI36LvCFDQndy6+qAb3XKRI/P5LeXZezNBeQuxKOgoPDjrwV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+Qb/E96; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+Qb/E96"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7ba92341f83so1545884b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 07:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764256571; x=1764861371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wiV6R1vlmXrHgZfzQSWNBuKjhfxpu4gsWfPp8c9V5+4=;
        b=S+Qb/E96RUGwTiXOKPv+JVk4LtO0oZNNbax9UqzNGOQ/l0OaCH08U55IIbwl0DgfSy
         hpwAxibRQpMYEVU1TeU/uMhqL9HoFfdcpERnvhN9lCtIn2YIayUxPlloK7nORKmdtHYJ
         bWkJee1MXc8O2T33Kw6AhrlnPuoGXky94Vg+rGYX0zyGg631B95mpMuF4Nx6wgai/6Z4
         EwA/urk6sSs2JJpc1ypADKLLmve90VGJJBDCbdJuD9X4rtRCYY45d19N/WUflNVmz3xG
         HD7nTpE19wOmbcgKUkFzojhANw+GI2oFPcMt7PLFokVIKTJhzxU6Gf9RnMID42o7Wt/H
         JCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764256572; x=1764861372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiV6R1vlmXrHgZfzQSWNBuKjhfxpu4gsWfPp8c9V5+4=;
        b=hkwk6B6rWtm+vNjT3yHFgEKEf1fiuLPhVAq1arr0SIXnudRk7l/JRguBHWeWvXh05D
         ohB9S8vVvN104PRPJmSVoqsu3QfqjAWlialkY5Hw6wUmaT30bDuYKpQ5Fk9cVo/+6/i9
         YivGhXL/CMC2v+qVcnneQXKfeKcqF0VkJFHw6Si0dE0YjikFlUhgjDkEaYMbTBGRfPvM
         KaT532bvtkBawgyTFK0WJRgPXpcd+M4L9duVj3YofUGlyvva6s5bTeya83+KkVeVyQNo
         ct+fY1ViXthmFcwzuTX8ikxFwuAkJ41qTQJN8EIpC35Kcs4gD8M1N80cWwiWN0U5lz6b
         qBgw==
X-Forwarded-Encrypted: i=1; AJvYcCVY5qMFoVQcwMEpexrBK5IJ5LOmvqZEQiBvAq3zF0SB2AClnewlR9Gfh7gd+7rbHSmMSF89F6LPnA87LIUlufW6gOuv@vger.kernel.org
X-Gm-Message-State: AOJu0YzDUxwDcYNyV291QPOlulmlEbTsCp3AlMeBE2aIcZqAXOFFA1YP
	lTpJuSPmfsW4o5Yvc7KuBYE+SrsxS3nh6Xv6fWmfyJ5F5w/UNKS+qPJJ
X-Gm-Gg: ASbGncvoZPkozQ2+yk8WZwTyuIzFNPjkAu1TrUlOJXnrP7rXCewsaf15VCz3RmMYI6B
	bP3zEMliwAOuaHqMPrd85ajc/SMChJPVgby3i2zW42WrzG1IBOw1SAAbKtIxf1tm951+AFTmuEb
	jhJhpi0ziONXlB8MfyzojDFOfKczkv9hdJSvxRVklA32JQ1C177ug2TEBPjeF6abd8qgytcQdPj
	ztwcxUuWykfoB0eA3PGDkW/Fya3E4+Fgy+u8c8kZusBhZ0MLXrCOGgHolwfrCNwAn/B+9SH0PXS
	0AV5HRgb9Vdvx8H8gM01wlNDgyBu71NyovY1qbxK3gJNiaCj4e0Ptyg5PaNK2qldKMKQ9es9vQE
	ybXRNC8FY6bnBCtC89wPnFawNQEGaykEj602hh6maFF6DCy4AxFqToNFTNaO+VG7ddoPNmXcFSu
	tTDe1IklHN5grgNx+ZzvEjtmZ6Qlp30CtmW7Bw3yO81D2Ac0PGuU994adZ4Abqg6cOMJs=
X-Google-Smtp-Source: AGHT+IFd1tsj8i1fuFllq8M+Us0CAnfM9u3urHFsNyMVndTLSc4t9XxvGPy0JyQPnwq9EIFp2b7Ksw==
X-Received: by 2002:a05:7022:e01:b0:119:e56b:c74f with SMTP id a92af1059eb24-11cb3ed2996mr8778050c88.20.1764256571336;
        Thu, 27 Nov 2025 07:16:11 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb067088sm5099656c88.10.2025.11.27.07.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 07:16:10 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Len Brown <lenb@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mario Limonciello <superm1@kernel.org>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 0/3] Add max-power platform profile
Date: Thu, 27 Nov 2025 07:16:02 -0800
Message-ID: <20251127151605.1018026-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new "max-power" platform profile mode and uses it for
the lenovo-wmi-gamezone driver. It also adds the Lenovo Legion Go 2 to
the extreme mode quirks table.

On some Lenovo Legion devices there is a thermal mode called extreme
that corresponds to setting ppt/spl vlaues to the maximum achievable by
the cooling solution. This correlates strongly with an overall power draw
that exceeds the DC power draw capability of the internal battery. This
mode being mapped to performance when extreme mode is detected as
supported, with the actual performance mode being set to
balanced-performance, has led to some misinformation being promulgated
that performance is always a bad setting in Linux for these devices.
There is also some confusion that the mode labeled performance in
userspace, which corresponds to a red LED in Windows, shows as purple
when set using the hardware extreme mode.

I'll also note that as the hard TDP limits are refreshed when on AC or DC
by the ACPI notifier of lenovo-wmi-other method driver, no special handling
of the battery is needed for safety limiting extreme mode.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

---
v4:
 - prevent  platform_profile_cycle() from selecting max_power.
v3: https://lore.kernel.org/platform-driver-x86/20251113212639.459896-1-derekjohn.clark@gmail.com/
 - Rename the vendor specific "extreme" to a vendor agnositic "max-power"
   to better allign with the "low-power" platform profile.
v2: https://lore.kernel.org/platform-driver-x86/20251106212121.447030-1-derekjohn.clark@gmail.com/
 - Drop patch 3/3, keep extreme mode quirks table
 - Add Legion Go 2 to quirks table
 - Fix nits from Mario
v1: https://lore.kernel.org/platform-driver-x86/20251026081240.997038-1-derekjohn.clark@gmail.com/


Derek J. Clark (3):
  acpi: platform_profile - Add max-power profile option
  platform/x86: lenovo-wmi-gamezone Use max-power rather than
    balanced-performance
  platform/x86: wmi-gamezone: Add Legion Go 2 Quirks

 .../ABI/testing/sysfs-class-platform-profile  |  2 ++
 .../wmi/devices/lenovo-wmi-gamezone.rst       | 31 ++++++++--------
 drivers/acpi/platform_profile.c               |  7 ++--
 drivers/platform/x86/lenovo/wmi-gamezone.c    | 35 +++++++++++--------
 include/linux/platform_profile.h              |  1 +
 5 files changed, 44 insertions(+), 32 deletions(-)

-- 
2.51.2

