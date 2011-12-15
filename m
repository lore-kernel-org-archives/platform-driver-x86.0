From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [PATCH 4/4] x86, mrst: add msic_thermal platform support
Date: Thu, 15 Dec 2011 22:28:37 +0000
Message-ID: <20111215222834.9670.16010.stgit@bob.linux.org.uk>
References: <20111215222702.9670.63670.stgit@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:60681 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759376Ab1LOWQW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Dec 2011 17:16:22 -0500
In-Reply-To: <20111215222702.9670.63670.stgit@bob.linux.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com, platform-driver-x86@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

This will let the MSIC driver to create platform device for the thermal
driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 arch/x86/platform/mrst/mrst.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)


diff --git a/arch/x86/platform/mrst/mrst.c b/arch/x86/platform/mrst/mrst.c
index 4c2235d..a9a4732 100644
--- a/arch/x86/platform/mrst/mrst.c
+++ b/arch/x86/platform/mrst/mrst.c
@@ -686,6 +686,11 @@ static void *msic_ocd_platform_data(void *info)
 	return msic_generic_platform_data(info, INTEL_MSIC_BLOCK_OCD);
 }
 
+static void *msic_thermal_platform_data(void *info)
+{
+	return msic_generic_platform_data(info, INTEL_MSIC_BLOCK_THERMAL);
+}
+
 static const struct devs_id __initconst device_ids[] = {
 	{"bma023", SFI_DEV_TYPE_I2C, 1, &no_platform_data},
 	{"pmic_gpio", SFI_DEV_TYPE_SPI, 1, &pmic_gpio_platform_data},
@@ -705,6 +710,7 @@ static const struct devs_id __initconst device_ids[] = {
 	{"msic_audio", SFI_DEV_TYPE_IPC, 1, &msic_audio_platform_data},
 	{"msic_power_btn", SFI_DEV_TYPE_IPC, 1, &msic_power_btn_platform_data},
 	{"msic_ocd", SFI_DEV_TYPE_IPC, 1, &msic_ocd_platform_data},
+	{"msic_thermal", SFI_DEV_TYPE_IPC, 1, &msic_thermal_platform_data},
 
 	{},
 };
