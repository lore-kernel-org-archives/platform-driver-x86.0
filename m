From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [PATCH 3/5] platform-x86: intel_mid_thermal: add msic_thermal alias
Date: Thu, 26 Jan 2012 17:39:16 +0000
Message-ID: <20120126173912.16719.51752.stgit@bob.linux.org.uk>
References: <20120126173729.16719.15431.stgit@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:55288 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751926Ab2AZRZm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Jan 2012 12:25:42 -0500
In-Reply-To: <20120126173729.16719.15431.stgit@bob.linux.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

In newer boards this device is called "msic_thermal" instead of
"msic_sensor". To support both we add suitable alias for the driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_mid_thermal.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)


diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index ccd7b1f..de2e62e 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -550,6 +550,7 @@ static int mid_thermal_remove(struct platform_device *pdev)
 
 static const struct platform_device_id therm_id_table[] = {
 	{ DRIVER_NAME, 1 },
+	{ "msic_thermal", 1 },
 	{ }
 };
 
