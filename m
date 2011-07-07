From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] platform-drivers-x86: intel_menlow: add missing return
 AE_OK for intel_menlow_register_sensor()
Date: Thu, 07 Jul 2011 10:05:49 +0800
Message-ID: <1310004349.2481.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:47349 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752115Ab1GGCF7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Jul 2011 22:05:59 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Sujith Thomas <sujith.thomas@intel.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

Otherwise, the error path will always be executed.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/intel_menlow.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/intel_menlow.c b/drivers/platform/x86/intel_menlow.c
index 809adea..abddc83 100644
--- a/drivers/platform/x86/intel_menlow.c
+++ b/drivers/platform/x86/intel_menlow.c
@@ -477,6 +477,8 @@ static acpi_status intel_menlow_register_sensor(acpi_handle handle, u32 lvl,
 		return AE_ERROR;
 	}
 
+	return AE_OK;
+
  aux1_not_found:
 	if (status == AE_NOT_FOUND)
 		return AE_OK;
-- 
1.7.4.1
