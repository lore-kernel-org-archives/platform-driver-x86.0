From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 020/100] platform/x86: Add the VLV ISP PCI ID to atomisp2_pm
Date: Fri, 18 Oct 2019 18:04:05 -0400
Message-ID: <20191018220525.9042-20-sashal@kernel.org>
References: <20191018220525.9042-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20191018220525.9042-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Alan Cox <alan@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

[ Upstream commit 8a7d7141528ad67e465bc6afacc6a3144d1fe320 ]

If the ISP is exposed as a PCI device VLV machines need the
same treatment as CHV machines to power gate the ISP. Otherwise
s0ix will not work.

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Alan Cox <alan@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel_atomisp2_pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel_atomisp2_pm.c b/drivers/platform/x86/intel_atomisp2_pm.c
index 9371603a0ac90..4a2ec5eeb6d8a 100644
--- a/drivers/platform/x86/intel_atomisp2_pm.c
+++ b/drivers/platform/x86/intel_atomisp2_pm.c
@@ -99,6 +99,7 @@ static UNIVERSAL_DEV_PM_OPS(isp_pm_ops, isp_pci_suspend,
 			    isp_pci_resume, NULL);
 
 static const struct pci_device_id isp_id_table[] = {
+	{ PCI_VDEVICE(INTEL, 0x0f38), },
 	{ PCI_VDEVICE(INTEL, 0x22b8), },
 	{ 0, }
 };
-- 
2.20.1
