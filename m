Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4785521CFFD;
	Wed, 19 Nov 2025 00:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513204; cv=none; b=GOZL2rZMB3Hv5CV272tq0L5nKp/iSNibZmnVBrHOoSngI3U/qDyWRiIMv0RKIGDSC95dBlVRb0dhY+w3d84O6N0UXVM2rGxh9NGZs85YrJItip5TFT7XtVl4m8zWKTha23KH8HXsVUmFdJyv2C7NWX3icA9qU6yhyBt2WYmDdnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513204; c=relaxed/simple;
	bh=06cpehSyLcKF+FCKfNuXbYCCBHPqz5xLGvtPNKpye50=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gzX9FRRUFey+3uJ12PLUkT8+22EqdUVk9FxxIIsITSsandNs31I1zxiZW5XjlADIbjToubTDzlirVTOhKXxkRoN6l/YG2n43DViy6sVw5Bj+2ecDEjk4UCsk3WgcMtNqCEiqBMxKqh41+PLsz2GWL6DmVec/rCDfKvIID8g3PTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXfxbraC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXfxbraC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E13BC2BCB6;
	Wed, 19 Nov 2025 00:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763513203;
	bh=06cpehSyLcKF+FCKfNuXbYCCBHPqz5xLGvtPNKpye50=;
	h=From:Subject:Date:To:Cc:From;
	b=lXfxbraCYCliXOrm5GI+r6Lo912B18595b/pcxhBoaOnXNmtt3jA2/2+5VuaPz9Hr
	 XRUBACdDFt9PSjNIEd5j0NnNtT+giiOrnmf8ALiGaFTHYNki7Hkv/joQ7etTi2k9ue
	 3YP3suVW0Z2ychuO+VQb4h3a7WqZj/rLN/HpUXLiQb1P8gvzxW6LbTTI42YahVHGRF
	 ALX8ErY+yfSBpi7DYC+87kNMR0OFEsez98eQYVJr0PYzxNrlm7lD/V5l167vIyhNFW
	 GHV6aSlZg/EHWz/qTG97q+ttx6Ez4zGW+ESic7bJsIaYlN2g3gJZYTyHBGkzBYfl9R
	 PcHf3ba28aPng==
Received: by venus (Postfix, from userid 1000)
	id 8E14C1801B6; Wed, 19 Nov 2025 01:46:38 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 0/4] platform: arm64: thinkpad-t14s-ec: fixes and
 suspend support
Date: Wed, 19 Nov 2025 01:41:39 +0100
Message-Id: <20251119-thinkpad-t14s-ec-improvements-v2-0-441219857c02@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMSHWkC/4XNQQ7CIBCF4as0rB3DVLDVlfcwXSCd2okWGiBE0
 /TuYhPXLv+3+N4iIgWmKM7VIgJljuxdiXpXCTsadyfgvrSoZa0RpYY0snvMpoeEKgJZ4GkOPtN
 ELkVQqlf20A40NCiKMQca+LX51670yDH58N7uMn7Xn3z8I2cECShPWrWGGm3lxfrn09x8MHvrJ
 9Gt6/oB7595Sc4AAAA=
X-Change-ID: 20251105-thinkpad-t14s-ec-improvements-44d4c38fef71
To: Sebastian Reichel <sre@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351; i=sre@kernel.org;
 h=from:subject:message-id; bh=06cpehSyLcKF+FCKfNuXbYCCBHPqz5xLGvtPNKpye50=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBpHRNsLg0krxG0U0x3iwt2rwY/AUR054FrXkyLz
 8dkLvjOH92JAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaR0TbAAKCRDY7tfzyDv6
 mtR3EACd6DhvwI7asFUYsruZpTk6v2R2TjobjcGx62hD91rn+J770IAdYFHOHBaDpRQKHkhNnC3
 jtvm+HU+nB5BxykLFPcQbEG46jcT+WDtTcI+FV/AqMrMmS6zrBLJiccBGxrDooPTRvfhnfZfu/6
 /yzjWptHJOlZHcm2yR2eO7xg1LMUVHncsUr+OAVwfRcVp+5mlzzijk1jSWRG6QjQ8D1FhkLG+DD
 krD1A0jDFU26ahmzI23mrG3T7Isl3kKeX1Ivk/GmvfgBid1KQThbzwN5g1Y6cOpi0u9zDBVbBQc
 ICG6dE4bJO9MMLs052pzxzwChvzNHRaIrtdhtqMZGWCIgk8zS1ssi0fTMrmBROvmLKggkTaRu7k
 kMFx638+od72SzG71P+d44cwzqJIGw3BxxfUVZ6WzItobR+6eUnMUZgazYWCh12yQzMd9eE+Db1
 PRZKC7zy0xR6Yb30INpOZoWISZfzaxCb7N60oqvnQLST2wrORF14KWO1z/kHzANT2rmcx31IF9V
 jfhz9pyihOsY0CzxemNsBpr5sBdEuwQmKsTPtDGKS60AdNvj2FHqymY54BkpTv77J0gjxOX2XyK
 vEmKvG/eYeM9X7lQ0t4ZuAvL+9TIaxc4wDcrcADdkvhKee5iWDG0B80qMEx46gJ1SkaKqCYEw10
 xE6+chs3iRSDdJQ==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

I have a two fixes for the T14s Gen6 Snapdragon EC driver as well as
improved system suspend support. I've been using my Thinkpad with these
patches for a few weeks as daily driver doing regular system suspend and
things seem to run well.

If there is enough time after review the fixes are probably good
material for the 6.18 release cycle.

Changes in v2:
- Link to v1: https://patch.msgid.link/20251106-thinkpad-t14s-ec-improvements-v1-0-109548ae75c0@collabora.com
- Add dmesg call trace in first patch description
- Mention ECWS ACPI function in PM patch description
- Include linux/pm.h in second patch
- Mention Thinkpad ACPI driver behavior in last patch

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
Sebastian Reichel (4):
      platform: arm64: thinkpad-t14s-ec: fix IRQ race condition
      platform: arm64: thinkpad-t14s-ec: sleep after EC access
      platform: arm64: thinkpad-t14s-ec: add system PM hooks
      platform: arm64: thinkpad-t14s-ec: add suspend handler for keyboard backlight

 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 74 ++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 14 deletions(-)
---
base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
change-id: 20251105-thinkpad-t14s-ec-improvements-44d4c38fef71

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>

