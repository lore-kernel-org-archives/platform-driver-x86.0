From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] msi-laptop: make struct rfkill_ops const
Date: Thu, 08 Jul 2010 10:08:55 +0800
Message-ID: <1278554935.7162.12.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:33757 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754007Ab0GHCIm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 Jul 2010 22:08:42 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Lennart Poettering <mzxreary@0pointer.de>, Matthew Garrett <mjg@redhat.com>, "Lee, Chun-Yi" <jlee@novell.com>, Greg Kroah-Hartman <gregkh@suse.de>, Richard Purdie <rpurdie@linux.intel.com>, platform-driver-x86@vger.kernel.org

rfkill uses a const struct rfkill_ops pointer.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/msi-laptop.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index afd762b..05634f8 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -562,15 +562,15 @@ static int rfkill_threeg_set(void *data, bool blocked)
 	return 0;
 }
 
-static struct rfkill_ops rfkill_bluetooth_ops = {
+static const struct rfkill_ops rfkill_bluetooth_ops = {
 	.set_block = rfkill_bluetooth_set
 };
 
-static struct rfkill_ops rfkill_wlan_ops = {
+static const struct rfkill_ops rfkill_wlan_ops = {
 	.set_block = rfkill_wlan_set
 };
 
-static struct rfkill_ops rfkill_threeg_ops = {
+static const struct rfkill_ops rfkill_threeg_ops = {
 	.set_block = rfkill_threeg_set
 };
 
-- 
1.5.4.3
