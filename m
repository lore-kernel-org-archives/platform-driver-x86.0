From: Carlo Caione <carlo@caione.org>
Subject: [PATCH 1/2] hp-wmi: Fix error value for hp_wmi_tablet_state
Date: Sun,  9 Apr 2017 15:56:07 +0200
Message-ID: <20170409135608.15621-2-carlo@caione.org>
References: <20170409135608.15621-1-carlo@caione.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35061 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752406AbdDIN4R (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2017 09:56:17 -0400
In-Reply-To: <20170409135608.15621-1-carlo@caione.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
Cc: Carlo Caione <carlo@endlessm.com>

From: Carlo Caione <carlo@endlessm.com>

hp_wmi_tablet_state() fails to return the correct error code when
hp_wmi_perform_query() returns the HP WMI query specific error code
that is a positive value.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 drivers/platform/x86/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 96ffda4..13ba65c 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -290,7 +290,7 @@ static int hp_wmi_tablet_state(void)
 	int ret = hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, 0, &state,
 				       sizeof(state), sizeof(state));
 	if (ret)
-		return ret;
+		return -EINVAL;
 
 	return (state & 0x4) ? 1 : 0;
 }
-- 
2.9.3
