Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA7E2D6E64;
	Mon,  5 Oct 2026 20:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791230445; cv=none; b=e1TzR9iNUlDCc2Ro/50Kg8lrav17PmUejluPtvxif92LKdn2YJrqCkq+U+7Po6GTv3FmjytYYMH7pnrwhlpZOlwyWat2ChvPvV6GYFIQ2dGG6+btYChATsq4ljT7yycoE4NDjEx3G3NIOkHscdp4nTixYB+3DEShAwAJT8WJd98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791230445; c=relaxed/simple;
	bh=7KYYgiQV/od8UbBr0gUdULYxTdeXTwrL8oGXvjvfP2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JsGaQRNMjDhrhYIxZIX2noqQr4i/UoGaRkgZwQFugdyFDt4b6YdBibuDF505rQ2mIsjJNc3HYTU959LaWmi/vtajs1CJqv2XogsBZAaBCFfZTDjbAXiMYnayVG362DN0E/xMo3mW7Yy7c/ou27pzmUdtgi496w9jET17H3M91cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=relwxsXo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="relwxsXo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4516C2BCF4;
	Mon,  5 Oct 2026 20:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791230444;
	bh=7KYYgiQV/od8UbBr0gUdULYxTdeXTwrL8oGXvjvfP2o=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=relwxsXounXdI7wl2PsmEK6k4X/VjjdMijxHWajaFqs6amLOV8RN5ih1yILrSJprY
	 y/SL0DlBz/oW6uyYSMCAoAt6uo429efiNJmr+WFB/Dt+iysSRfhcf9V52ylLV/Fgkl
	 leFH7aEBcX3BVHJiQbvvScynbYXaulsrQgH3mJ66LPJJzz25Qpa9oNUUJCoNAnwepm
	 Xb0HW0sPryoT8TaZ7SHyk2SacNN01nzppQ5IwMq0A+fK3s3KvBqmBTNlilNId4nIuC
	 k9MYyoUWJWV5g9FniYkUPJQ/GAsyR+pEzoCZdFOwJBf5obtQEmoiZopwYli3J1oc0F
	 H1imdNoNCS99A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C12CA5FF0;
	Mon,  5 Oct 2026 20:00:44 +0000 (UTC)
From: Angel Lindo via B4 Relay <devnull+angellindo.gmail.com@kernel.org>
Date: Mon, 05 Oct 2026 15:00:34 -0500
Subject: [PATCH] platform/x86/intel/pmc: Add Sunrise Point-H support
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-intel-pmc-spt-h-v1-1-78c98e4f4620@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTtJKcjCqxgXtvzIEKxNpxgTw
 t2psPwW762kSAKlW7VSwldUPqGgvlTkx2d4gaUvJmtsVxtzZQkZM8e3Z42ZR27g0Da9Nd3gqFQ
 xYZDfcbw/TuviJvj839C27T9c/ndzAAAA
X-Change-ID: 20261005-intel-pmc-spt-h-3ebe43d206fb
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, 
 Xi Pardee <xi.pardee@linux.intel.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Angel Lindo <angellindo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791230443; l=3591;
 i=angellindo@gmail.com; s=20261005; h=from:subject:message-id;
 bh=bkKXvh7aruVV5KEgO6BGxb8rhWigF7LQcSCkmGAYupQ=;
 b=Lmmyyyso6og4rMut9WJnDkBoMcqiPmiSQlWtpoF8GlGuuw2gg7G09tWdGwHt3BAfuNkPwfQcL
 OV2NEw9qYaIAP97jnpGMsGhp8CDtJ8Ya+Ni47csJT0UDafM/SMzlnYD
X-Developer-Key: i=angellindo@gmail.com; a=ed25519;
 pk=9aX9KrUZRFEbzPyCQvHssDnZU0zZ34gcfSUJXYeuIto=
X-Endpoint-Received: by B4 Relay for angellindo@gmail.com/20261005 with
 auth_id=1118
X-Original-From: Angel Lindo <angellindo@gmail.com>
Reply-To: angellindo@gmail.com

From: Angel Lindo <angellindo@gmail.com>

spt_core_init() decides between the Sunrise Point and Cannon Point
register maps by looking for the Sunrise Point PMC PCI device, but only
the SPT-LP ID (0x9d21) is listed. On Skylake-H/Kaby Lake-H systems with
a Sunrise Point-H PCH (PMC 8086:a121), pci_dev_present() fails and the
driver takes the Coffee Lake path, using cnp_pmc_dev. That map does not
describe this PCH, so the debugfs output is wrong.

Seen on a MacBookPro14,3 (i7-7820HQ, PCH-H, PMC 8086:a121). With the
stock driver, ltr_show lists Cannon Point IP names (SOUTHPORT_A, CNV,
EVA, ...) and every entry reads RAW 0xffffffff. I was debugging why
the package never goes deeper than PC3 on this machine, and without a
working PMC map there is no way to see which PCH IP blocks it.

Add the SPT-H PMC ID to spt_pmc_pci_id[] so these systems use the
Sunrise Point map.

Tested on MacBookPro14,3 (Apple firmware 529.140.2.0.0), kernel 7.2.5,
with the module built with this ID:
- ltr_show lists the Sunrise Point IP names, and the values match a
  direct read of the PWRMBASE registers through /dev/mem bit for bit.
- pch_ip_power_gating_status follows device state: LPSS reads On while
  the Bluetooth UART (00:1e.0) is bound and turns Off once it is
  unbound and the UART enters D3hot.
- No warnings on load.

Limitations:
- spt_pfear_map is the SPT-LP layout and is reused as is. SPT-H has
  two more PCIe controllers (SPD and SPE). Bits 13 and 21 are RSVD in
  the SPT map but SPD/SPE in the Cannon Point map; I could not verify
  this on PCH-H, so the map is left unchanged.
- slp_s0_residency_usec reads 0 on this machine.

Fixes: 661405bd817b ("platform/x86: intel_pmc_core: Special case for Coffeelake")
Assisted-by: claude-opus-5-5
Signed-off-by: Angel Lindo <angellindo@gmail.com>
---
On the same machine and firmware, macOS reaches PC10 (~81%) at idle,
while Linux never goes deeper than PC3. This patch only fixes the PMC
detection so pch_ip_power_gating_status and ltr_show become usable for
that investigation. With it, the PCH IPs report gating states consistent
with device state (LPSS confirmed by toggling the Bluetooth UART); PC6
and SLP_S0 residency are still 0.
I plan to send a separate report on the PC3 limit to linux-pm.
---
 drivers/platform/x86/intel/pmc/core.h | 1 +
 drivers/platform/x86/intel/pmc/spt.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
index b4c7399f8..5822dbbda 100644
--- a/drivers/platform/x86/intel/pmc/core.h
+++ b/drivers/platform/x86/intel/pmc/core.h
@@ -36,6 +36,7 @@ DEFINE_FREE(pmc_acpi_free, void *, if (_T) ACPI_FREE(_T))
 
 /* Sunrise Point Power Management Controller PCI Device ID */
 #define SPT_PMC_PCI_DEVICE_ID			0x9d21
+#define SPT_H_PMC_PCI_DEVICE_ID			0xa121
 #define SPT_PMC_BASE_ADDR_OFFSET		0x48
 #define SPT_PMC_SLP_S0_RES_COUNTER_OFFSET	0x13c
 #define SPT_PMC_PM_CFG_OFFSET			0x18
diff --git a/drivers/platform/x86/intel/pmc/spt.c b/drivers/platform/x86/intel/pmc/spt.c
index b50534aa2..5c4b8d536 100644
--- a/drivers/platform/x86/intel/pmc/spt.c
+++ b/drivers/platform/x86/intel/pmc/spt.c
@@ -138,6 +138,7 @@ static const struct pmc_reg_map spt_reg_map = {
 
 static const struct pci_device_id spt_pmc_pci_id[] = {
 	{ PCI_VDEVICE(INTEL, SPT_PMC_PCI_DEVICE_ID) },
+	{ PCI_VDEVICE(INTEL, SPT_H_PMC_PCI_DEVICE_ID) },
 	{ }
 };
 

---
base-commit: cf963c9359dd6c5d0bc6af16df5cf1f691bba4f3
change-id: 20261005-intel-pmc-spt-h-3ebe43d206fb

Best regards,
--  
Angel Lindo <angellindo@gmail.com>


