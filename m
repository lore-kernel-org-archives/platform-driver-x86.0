From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] platform-drivers-x86: dell-laptop: Remove unneeded
 mutex_init() for buffer_mutex
Date: Wed, 08 Jun 2011 14:56:42 +0800
Message-ID: <1307516202.8028.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:37847 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753344Ab1FHG4u (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jun 2011 02:56:50 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

DEFINE_MUTEX() will automatically initialize buffer_mutex,
no need to call mutex_init() in dell_init().

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/dell-laptop.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index d3841de..dbe336e 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -632,7 +632,6 @@ static int __init dell_init(void)
 	if (!bufferpage)
 		goto fail_buffer;
 	buffer = page_address(bufferpage);
-	mutex_init(&buffer_mutex);
 
 	ret = dell_setup_rfkill();
 
-- 
1.7.4.1
