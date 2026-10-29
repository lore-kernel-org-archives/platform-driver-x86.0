Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793240051;
	b=PS5j9xwWyNEKWg/ilQ89cSpRQfwW4B/ydX2dPhpun8oJ9H8pJ+xIaaLx5GfkQOw6sRXI
	 L8UK4o3bz4uxcqzhvn1yEUkcx1j0K0SLqCwYSJ+xIjE+eYBR6RDCAxN92GekasSXFelB1
	 lpNQELe5J3LC0RFTMKM8Z6uxkaz2pDeejQWdgX7aC734JrPDI+fmm59UYnpR86ApaPNb/
	 uouCQ+EpIVYvMjrZSduZrdqqqJtfwiIkpowOUIawkHl1bnw2bcPBUeIV2heY40hIWnWgG
	 rMsEv8UkI1MoPNqdZX6vRukzgxgiRflcjWcAPL72vQPUBVEQAgtS5I9JPP5Iorxo/pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793240051;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Slc2AKyaowZpbLm0PAB+O5peX7+yq4xY8GJXYbjsRpI=;
	b=epIKXIhMHwQwXdUfVeHC1Lm68qyD9ShfxPuOWx2JudoYPCbYEu2EBaqeFfvoR6gCR7BY
	 vvFjBhvwbRns1+1mlMFKZJ+kl+WBNGwiIfMGgQhXV3xYW07oc0IK1orqJ4RE35DyLKYEN
	 TyFzv0sxrBlS4BNMhV9KeKVKsDEfYag2M2yWEdLXvkEaDZO8K3ADlNra4SbMKxIO2FKqk
	 04Zt8HqCUlOLT+ntPZo+JHamWSsSc57rOdxvK7fja5cAxXoK/AkgfgHR6E2rxQPgQxPmZ
	 bZ4FYL8DoqeKkbWTIHu/m6C+kEmrxa8ljs4/uJwHr8nb6NYtM4enI+MrTYT5ZLVi1sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YskRyQuq;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2571606A31C;
	Thu, 29 Oct 2026 02:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2571606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YskRyQuq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Sl
	c2AKyaowZpbLm0PAB+O5peX7+yq4xY8GJXYbjsRpI=; b=YskRyQuqYLAqbkK4D8
	RKZfdfU5QH8ZkOuU6PGL7b0nstX1aWGETvIhoEwMQ4ik2uHpS3Q0kVm39fupulBv
	KuztT+lcuW+kBvNSAvGeqotqpmKDYKhBy1F6J0iggkItzPoXzK1/SoU3gCjPhotq
	86GMtJyp3gm4IoDpEaNj2FxOQ=
Received: from haiyue-pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3XyPNq+JqzDc4DQ--.7637S2;
	Thu, 29 Oct 2026 10:13:34 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: platform-driver-x86@vger.kernel.org
Cc: Haiyue Wang <haiyuewa@163.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1] platform: arm64: drop the vacuous THERMAL dependency from EC_ASUS_GLYMUR
Date: Thu, 29 Oct 2026 10:12:30 +0800
Message-ID: <20261029021330.460192-1-haiyuewa@163.com>
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
X-CM-TRANSID:_____wD3XyPNq+JqzDc4DQ--.7637S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr15tr13tFyDKF17GFWkXrb_yoW8CFWfpF
	ZYg347Cr47JF4Fqw4Ut3yxuFW5Jan3JFW5JF1fC34jvasxZr95ur90vFyxXa1kArs5J3WY
	qa9YgFy7KF15urUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_fHUxUUUUU=
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbC8BBy3Wriq9DnFwAA3M

'depends on THERMAL || THERMAL=n' is always true and is semantically a
no-op, but it couples NEW_LEDS, which is selected here, to THERMAL and
closes a Kconfig dependency loop. The C tools stay silent because they
fold the always-true expression to 'y' before running dependency loop
detection; kconfiglib, used by the Yocto kernel config audit, does not
fold and rejects the config at parse time.

The loop is easy to expose with the in-tree tools, using the technique
from commit b33a654a5bd6 ("drm/tiny: Kconfig: Remove always-y THERMAL
dep. from TINYDRM_REPAPER"),
https://git.kernel.org/linus/b33a654a5bd6: temporarily make THERMAL
tristate so the folding stops, then any config target reports it:

  $ sed -i 's/bool "Thermal drivers"/tristate "Thermal drivers"/' \
      drivers/thermal/Kconfig
  $ make allnoconfig
  error: recursive dependency detected!
	symbol POWER_SUPPLY is selected by HID_ASUS
	symbol HID_ASUS depends on LEDS_CLASS
	symbol LEDS_CLASS depends on NEW_LEDS
	symbol NEW_LEDS is selected by EC_ASUS_GLYMUR
	symbol EC_ASUS_GLYMUR depends on THERMAL
	symbol THERMAL is selected by AB8500_BM
	symbol AB8500_BM depends on POWER_SUPPLY

Drop the vacuous line to break the loop; the driver still builds both
with and without THERMAL.

Fixes: db3a9dddab5f ("platform: arm64: Add a driver for the EC found on ASUS Glymur machines")
Signed-off-by: Haiyue Wang <haiyuewa@163.com>
Assisted-by: LLM
---
 drivers/platform/arm64/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 2a84775a13a9..3f879410b311 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -40,7 +40,6 @@ config EC_ASUS_GLYMUR
 	depends on HWMON
 	depends on INPUT
 	depends on PM
-	depends on THERMAL || THERMAL=n
 	select NEW_LEDS
 	select LEDS_CLASS
 	help
-- 
2.56.0

