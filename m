From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH v3 02/12] msi-laptop: Work around gcc warning
Date: Fri,  7 Dec 2012 15:49:12 +0200
Message-ID: <1354888162-12109-3-git-send-email-maxtram95@gmail.com>
References: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:62343 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030475Ab2LGNtv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Dec 2012 08:49:51 -0500
Received: by mail-ee0-f46.google.com with SMTP id e53so289080eek.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Dec 2012 05:49:50 -0800 (PST)
In-Reply-To: <1354888162-12109-1-git-send-email-maxtram95@gmail.com>
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
