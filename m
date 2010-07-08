From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] classmate-laptop: make needlessly global symbols static
Date: Thu, 08 Jul 2010 09:47:50 +0800
Message-ID: <1278553670.7162.4.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:51264 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756667Ab0GHBwy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 Jul 2010 21:52:54 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Daniel Oliveira Nascimento <don@syst.com.br>, Matthew Garrett <mjg@redhat.com>, Richard Purdie <rpurdie@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, platform-driver-x86@vger.kernel.org

cmpc_accel_sensitivity_attr is needlessly defined global.
This patch makes the symbol static.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/classmate-laptop.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
index 3bf399f..6c63303 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -208,7 +208,7 @@ static ssize_t cmpc_accel_sensitivity_store(struct device *dev,
 	return strnlen(buf, count);
 }
 
-struct device_attribute cmpc_accel_sensitivity_attr = {
+static struct device_attribute cmpc_accel_sensitivity_attr = {
 	.attr = { .name = "sensitivity", .mode = 0660 },
 	.show = cmpc_accel_sensitivity_show,
 	.store = cmpc_accel_sensitivity_store
-- 
1.5.4.3
