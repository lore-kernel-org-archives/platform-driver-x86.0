From: minskey guo <chaohong.guo@linux.intel.com>
Subject: [PATCH 1/4 RESEND] [intel_ips] seqno mask of THM_ITV register is 8bit
Date: Tue, 12 Oct 2010 14:40:49 +0800
Message-ID: <1286865649-22899-1-git-send-email-chaohong.guo@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:13843 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752690Ab0JLGqU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Oct 2010 02:46:20 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jbarnes@virtuousgeek.org, mjg@redhat.com
Cc: chaohong.guo@intel.com, minskey guo <chaohong.guo@linux.intel.com>

The mask of sequence number in THM_ITV register is 8bit instead
of 4bit.

Signed-off-by: minskey guo <chaohong.guo@intel.com>
Acked-by: Jesse Barnes <jbarnes@virtuousgeek.org>
---
 drivers/platform/x86/intel_ips.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 9024480..fb31700 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -230,7 +230,7 @@
 #define THM_TC2		0xac
 #define THM_DTV		0xb0
 #define THM_ITV		0xd8
-#define   ITV_ME_SEQNO_MASK 0x000f0000 /* ME should update every ~200ms */
+#define   ITV_ME_SEQNO_MASK 0x00ff0000 /* ME should update every ~200ms */
 #define   ITV_ME_SEQNO_SHIFT (16)
 #define   ITV_MCH_TEMP_MASK 0x0000ff00
 #define   ITV_MCH_TEMP_SHIFT (8)
-- 
1.7.1
