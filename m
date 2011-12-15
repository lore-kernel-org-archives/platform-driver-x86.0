From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [PATCH 3/4] platform-x86: intel_mid_thermal: turn off thermistor
 voltage by default
Date: Thu, 15 Dec 2011 22:28:24 +0000
Message-ID: <20111215222821.9670.11798.stgit@bob.linux.org.uk>
References: <20111215222702.9670.63670.stgit@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:60679 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759541Ab1LOWQJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Dec 2011 17:16:09 -0500
In-Reply-To: <20111215222702.9670.63670.stgit@bob.linux.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com, platform-driver-x86@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

Instead of complaining that the voltage is on, we can just ask the MSIC to
turn the voltage off. This should save some power.

Voltage for thermistors is turned on when ADC conversion is initiated.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_mid_thermal.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)


diff --git a/drivers/platform/x86/intel_mid_thermal.c b/drivers/platform/x86/intel_mid_thermal.c
index aef4979..a4e56be 100644
--- a/drivers/platform/x86/intel_mid_thermal.c
+++ b/drivers/platform/x86/intel_mid_thermal.c
@@ -360,8 +360,10 @@ static int mid_initialize_adc(struct device *dev)
 	if (ret)
 		return ret;
 
-	if (data & MSIC_ADCTHERM_MASK)
-		dev_warn(dev, "ADCTHERM already set");
+	data &= ~MSIC_ADCTHERM_MASK;
+	ret = intel_msic_reg_write(INTEL_MSIC_ADC1CNTL3, data);
+	if (ret)
+		return ret;
 
 	/* Index of the first channel in which the stop bit is set */
 	channel_index = find_free_channel();
