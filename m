Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B091C1F02;
	Fri,  3 Jan 2025 23:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945519; cv=none; b=eVz5m8eGBRjEhwtadG5eaQgGrhWmu7kEuT/stG57J1SgCXUSXITClEz4qnGB5mYNoId3xklGtOb+rZO4jp/On3MneKBLC8IgFBEcf5ARK+NWMRmpvCH62b2G16MIBmD+pP2/u4iLDBIfPWHf4TOZuCndsvlDj1WPUHf+sDq1qFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945519; c=relaxed/simple;
	bh=YoouXlu002q1WZ6g29OUd+t7Zn/SwUQqCC3JSp6O1Jc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B87FzDinGX3abZZ/PWUgPViLsFHXgtQ3sG85OGcS7t8YkpTcAT3dfj/GXUKnVxcaZwWrPYcU8L3YcRdWoz72Qvx2yKVMHhVtKjn96+sUtp5OH2KILi7yu3xME562mIzQSxCAqGOFOwW4Ch5+G1uw3n4lAIqKntJKID6DCs7WhLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=VaQKqh+i; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="VaQKqh+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735945513;
	bh=YoouXlu002q1WZ6g29OUd+t7Zn/SwUQqCC3JSp6O1Jc=;
	h=From:Subject:Date:To:Cc:From;
	b=VaQKqh+isyTPDfrl6p8bGsha5CoJ9ACkE4T+C3PgStkNZ4A3x31mtUQZKQw+/Li20
	 6EW8zMYsDAXXZIKLsDwA2+FFHXS4b1jbo1XEmYAr/aaBvuDFYR6AwBGHF4GxcIFRy+
	 2vk25tAz5tzuyN/R0/ch7q7YRz0TQPUQBZtim2Q0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/6] platform/x86: firmware_attributes_class: Simplify API
Date: Sat, 04 Jan 2025 00:05:08 +0100
Message-Id: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACRteGcC/x3MTQ6CMBAG0KuQWTtJWykJXMW4qDLVLwEkM/Uvh
 LvbuHybt5GJQoyGZiOVFwyPpcIfGrre03ITxlhNwYXovDtyhs7vpMKpFMXlWcTYMK8T8pf7JLH
 zbexD56gWq0rG59+fzvv+AwS3mS9uAAAA
X-Change-ID: 20250103-firmware-attributes-simplify-9ae561459260
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mark Pearson <markpearson@lenovo.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735945513; l=1469;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=YoouXlu002q1WZ6g29OUd+t7Zn/SwUQqCC3JSp6O1Jc=;
 b=HgezHQ18G63eHu2R/4t+rp3wZ5YGckYxFFNrcEi/xiw2KALHN8qil3EZQyL+6gh7W57216GUB
 Evw5IBAvpXwCdYwd24XRulXvKRn1n5v2F5GNYGSEVKwpkcbq0N9Gkx5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Looking at the users of firmware_attributes_class makes my head hurt.
Simplify the subsystem and its users.

This will break the currently developed samsung-galaxybook driver,
resolving the breakage should be trivial.

Only compile-tested.

I have some further improvements in the pipeline building on these
changes, but those will need some more time.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (6):
      platform/x86: firmware_attributes_class: Move include linux/device/class.h
      platform/x86: firmware_attributes_class: Simplify API
      platform/x86: think-lmi: Directly use firmware_attributes_class
      platform/x86: hp-bioscfg: Directly use firmware_attributes_class
      platform/x86: dell-sysman: Directly use firmware_attributes_class
      platform/x86: firmware_attributes_class: Drop lifecycle functions

 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 17 +++------
 drivers/platform/x86/firmware_attributes_class.c   | 42 +++++-----------------
 drivers/platform/x86/firmware_attributes_class.h   |  5 +--
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       | 14 ++------
 drivers/platform/x86/think-lmi.c                   | 13 ++-----
 5 files changed, 21 insertions(+), 70 deletions(-)
---
base-commit: 0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
change-id: 20250103-firmware-attributes-simplify-9ae561459260

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

