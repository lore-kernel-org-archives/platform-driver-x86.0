Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D9C2DEA75;
	Thu, 26 Feb 2026 05:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772082756; cv=none; b=XNc1zKt96/A0KUZZSw4EWGMusTmaVWCdAJmJvVFEbsM8mUh39/zdkHiHICGX1fS2tFz5koDuX+xHwVH2eGKiJN5tO4mdXmmQ5YBqyTM1gtbEpJvGkoRzh4k48kkzMAgDO7Dm9xbhCKJjjNPqFl+2d6Ue+i4XiX54pCmZ7eay8zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772082756; c=relaxed/simple;
	bh=hNSUKCt1mpkkhC/gzoSBv7TrlM9O6+knuI5kUAph2AA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GQF47JVRvN0ISEKyZUVVtFNwz2l8PF0MYMPr4SAwS5Ah8uNIoAm7tcqR8zPNFTJ+7f/XA7z34OOvxUa1inW8mMwEU81ud6CtnxLyQBUTsl4pCVdCUwUtdKL3qJwxxGXl6ruoon9grOrRDjyP8ouRgNA4VsiwgiUod2Q0//y06e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=B0bfb1sY; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B0bfb1sY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=//aRfj10FWul1n2+qh2SvIxKDnye5KU8q1k1CwkVak4=; b=B0bfb1sYiGYOkXh5VX7go/HUQJ
	EKrVuzn/4ST3ylpwznCvr94YArp5VYyf1fDqUVOq9JKyhvT6zuu/3Es3S9aKiZGpVJyjt8LO+qC2m
	RfYNJBi2mhhTpZk0wPm8X+LtgPXJ9q1Z7c7F9stgOvKIlj0fCXTfmf2vXdq7Z5iUNMHFcp6vbUNC7
	6p0eq76xIeADJbqpeb6JTwEorBaLi33AuIf5AaMEXdhUhsk/kqWmarWCtbTUboAiY+BIiz0RCvsyM
	cUQBeDS2ATUxsCtTqBoghyWapTXeClK9y1kBnQzSRQ/K5f83V7lvfZ3SvKK0gLitB/XEGRcSUQww2
	3OBfyNxA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvTft-00000005PL6-1s58;
	Thu, 26 Feb 2026 05:12:33 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform_data/mlxreg: mlxreg.h: fix all kernel-doc warnings
Date: Wed, 25 Feb 2026 21:12:29 -0800
Message-ID: <20260226051232.549537-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the correct kernel-doc format & notation to eliminate
kernel-doc warnings:

Warning: include/linux/platform_data/mlxreg.h:24 Enum value
 'MLX_WDT_TYPE1' not described in enum 'mlxreg_wdt_type'
Warning: include/linux/platform_data/mlxreg.h:24 Enum value
 'MLX_WDT_TYPE2' not described in enum 'mlxreg_wdt_type'
Warning: include/linux/platform_data/mlxreg.h:24 Enum value
 'MLX_WDT_TYPE3' not described in enum 'mlxreg_wdt_type'
Warning: include/linux/platform_data/mlxreg.h:37 bad line:
 PHYs ready / unready state;
Warning: include/linux/platform_data/mlxreg.h:153 struct member 'np'
 not described in 'mlxreg_core_data'
Warning: include/linux/platform_data/mlxreg.h:153 struct member 'hpdev'
 not described in 'mlxreg_core_data'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Vadim Pasternak <vadimp@nvidia.com>
Cc: platform-driver-x86@vger.kernel.org

 include/linux/platform_data/mlxreg.h |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

--- linux-next-20260225.orig/include/linux/platform_data/mlxreg.h
+++ linux-next-20260225/include/linux/platform_data/mlxreg.h
@@ -13,10 +13,10 @@
 /**
  * enum mlxreg_wdt_type - type of HW watchdog
  *
- * TYPE1 HW watchdog implementation exist in old systems.
- * All new systems have TYPE2 HW watchdog.
- * TYPE3 HW watchdog can exist on all systems with new CPLD.
- * TYPE3 is selected by WD capability bit.
+ * @MLX_WDT_TYPE1: HW watchdog implementation in old systems.
+ * @MLX_WDT_TYPE2: All new systems have TYPE2 HW watchdog.
+ * @MLX_WDT_TYPE3: HW watchdog that can exist on all systems with new CPLD.
+ *   TYPE3 is selected by WD capability bit.
  */
 enum mlxreg_wdt_type {
 	MLX_WDT_TYPE1,
@@ -35,7 +35,7 @@ enum mlxreg_wdt_type {
  * @MLXREG_HOTPLUG_LC_SYNCED: entry for line card synchronization events, coming
  *			      after hardware-firmware synchronization handshake;
  * @MLXREG_HOTPLUG_LC_READY: entry for line card ready events, indicating line card
-			     PHYs ready / unready state;
+ *			     PHYs ready / unready state;
  * @MLXREG_HOTPLUG_LC_ACTIVE: entry for line card active events, indicating firmware
  *			      availability / unavailability for the ports on line card;
  * @MLXREG_HOTPLUG_LC_THERMAL: entry for line card thermal shutdown events, positive
@@ -123,8 +123,8 @@ struct mlxreg_hotplug_device {
  * @reg_pwr: attribute power register;
  * @reg_ena: attribute enable register;
  * @mode: access mode;
- * @np - pointer to node platform associated with attribute;
- * @hpdev - hotplug device data;
+ * @np: pointer to node platform associated with attribute;
+ * @hpdev: hotplug device data;
  * @notifier: pointer to event notifier block;
  * @health_cntr: dynamic device health indication counter;
  * @attached: true if device has been attached after good health indication;
