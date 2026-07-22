Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8031E4457D7;
	Wed, 22 Jul 2026 18:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784745902; cv=pass; b=V0AXp2sV+F1sX3I8BjDNTiV93r/EAZl1Zk0TghGCS2pJxQabBx8ofDMkzGOkLYRF3FdNuVGX3WOAdPphiG6JAexwUnmXBCb+p/D1iouha/lzIxAioKm3i5U8cgSuVY/G3h8YqDmfx1W7lVHUnI5/p5H1TchNWEaGgW+JCLUDYVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784745902; c=relaxed/simple;
	bh=MemtA8sRzZ/iX6lpET5loEo/6F+bD+wY8J1MmWiaXbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UEVo4WOLZYxv94BaFxjkUIevYZ4SDzof/eiHwMHKJMy47Vip30SEMl5ZScrf7mt4jl5jKel0mxtQMYcb/Fb+PBS3MaF4ViJ9zKth435FpzmhrZoj0zojzobj9DIxga/ySIh01sgiGaD+eex+psBRjRZ5mLoKVOOxW/hmg+tclgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=WaXxf0+v; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="WaXxf0+v"
ARC-Seal: i=1; a=rsa-sha256; t=1784745892; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ENYkv4fGQelmGTl7qQBPrEAjIonbpEmR0vAKwjCe0br1sdmBbZvtiYvQxeoH5t3DEX8KZ/YlJ0qkVD6PkOcMD5RyvNXB1RC16Oy2Yh3S56YFL7XRzkzWpMXflWLtubI1UmcI0Gx0L/kBCIeWLUW3Lr+TopOI9teT8ZtK4Sx4OGQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784745892; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UgviEVK6iP1MWUGQoBXyrjTNZsbAzbmulaSGRZE6Orc=; 
	b=Zx6tMTTGUmgTc5swjH+w9UPGAC8PvtqsgNgFFKDiWhMSebJeMyyW3m5IacDvgpkyokQhOH1ALjbNMjx7LSBhA3GGR0twzomd5zN1eM4VDhm1yS8wDdSOyvtT/SnzI72oJAl/Yswj+/IHNeziT7Lls4If+ndhocs0MDyG1b2bcO4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784745892;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=UgviEVK6iP1MWUGQoBXyrjTNZsbAzbmulaSGRZE6Orc=;
	b=WaXxf0+vS7vZ/0exLxLqZ0Okb/8LxkBd+SQlmIBBOO1mJ5cc+QLFDPD3Q2c6t/sc
	sXTwEz5IPfYv4Tp8965OFQqSmaWLpmxZ1B1MQ/67IQc5AEGzkEK8r7Egj8hfWzQ+X8q
	u4hi4z3yYcXQlzj2C8y6+GHxMPFXAHZxCgOwnmCydgpOB/ehWxc9L8gjvijiCFweF9X
	HPfGH8QdWpKV9MTXrSYwhr+8B3EsC6yOSThEc1bhAVetMaZ+JWUKaG4fB+3canFNKyo
	z4UyjN4X6QFlZCDb39Vdw/A+oIVkacxAxzzJHg/M8Z6GLgB0hxO06wozai3wBklIs4n
	5wLJ122ubQ==
Received: by mx.zohomail.com with SMTPS id 1784745890425256.91338624155003;
	Wed, 22 Jul 2026 11:44:50 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 23 Jul 2026 02:44:37 +0800
Subject: [PATCH v2] platform/x86: ideapad-laptop: Fix driver unregistration
 order
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-ideapad-rev-exit-v2-1-9c31159022de@rong.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2pq2UAVX/odh0ccAYyIlbSUYw
 r9bcOvyJOeeu0LEQBjhVqwQcKZIfswgTwXYQY89MnKZwXCnFNoyI+pJO5ZlhgslVtbCVLqxRuk
 K8mwK2NFyJB/tj+PbPNGmvbMbA8Xkw+f4nMXugeTywq/yT34WTDDTcVdr2xiF7h782J9fHqHdt
 u0LagYDV8EAAAA=
X-Change-ID: b0d55ec3-ideapad-rev-exit-381b4a9cb5a4
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Philipp Jungkamp <p.jungkamp@gmx.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-2f6f2
X-ZohoMailClient: External

There are two drivers in the ideapad-laptop module: a wmi_driver and a
platform_driver. The former is registered before the latter, but the
unregistration order is the same as the init one instead of the reverse.

Fix the driver unregistration order by reversing it.

Fixes: f32e02417614 ("platform/x86: ideapad-laptop: support for more special keys in WMI")
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Fix a typo in title
- Link to v1: https://patch.msgid.link/20260723-ideapad-rev-exit-v1-1-bf0d8ac9b5ed@rong.moe
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 4fbc904f1fc3..8213524504ee 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -2564,8 +2564,8 @@ module_init(ideapad_laptop_init)
 
 static void __exit ideapad_laptop_exit(void)
 {
-	ideapad_wmi_driver_unregister();
 	platform_driver_unregister(&ideapad_acpi_driver);
+	ideapad_wmi_driver_unregister();
 }
 module_exit(ideapad_laptop_exit)
 

---
base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
change-id: b0d55ec3-ideapad-rev-exit-381b4a9cb5a4

Thanks,
Rong

