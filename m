From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v4 02/12] msi-laptop: Work around gcc warning
Date: Sat, 15 Dec 2012 19:31:26 +0200
Message-ID: <1355592696-15454-3-git-send-email-maxtram95@gmail.com>
References: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f174.google.com ([209.85.215.174]:51341 "EHLO
	mail-ea0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750795Ab2LORcP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 15 Dec 2012 12:32:15 -0500
Received: by mail-ea0-f174.google.com with SMTP id e13so1773817eaa.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Dec 2012 09:32:13 -0800 (PST)
In-Reply-To: <1355592696-15454-1-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, jlee@suse.com, anisse@astier.eu
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>

Assign initial value to variable in order to prevent gcc warning about
uninitialized variable.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/msi-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 063113c..7ba107a 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -291,7 +291,7 @@ static ssize_t show_wlan(struct device *dev,
 	struct device_attribute *attr, char *buf)
 {
 
-	int ret, enabled;
+	int ret, enabled = 0;
 
 	if (old_ec_model) {
 		ret = get_wireless_state(&enabled, NULL);
@@ -315,7 +315,7 @@ static ssize_t show_bluetooth(struct device *dev,
 	struct device_attribute *attr, char *buf)
 {
 
-	int ret, enabled;
+	int ret, enabled = 0;
 
 	if (old_ec_model) {
 		ret = get_wireless_state(NULL, &enabled);
-- 
1.8.0.1
