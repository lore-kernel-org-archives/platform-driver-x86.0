From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH] platform/x86: dell-smbios: Correct notation for filtering
Date: Fri,  5 Jan 2018 08:56:48 -0600
Message-ID: <1515164208-32510-1-git-send-email-mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

The class/select were mistakingly put into octal notation but
intended to be in decimal notation.

Suggest-by: Pali Rohar <pali.rohar@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 6a60db5..8541cde 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -65,10 +65,10 @@ static struct smbios_call call_whitelist[] = {
 
 /* calls that are explicitly blacklisted */
 static struct smbios_call call_blacklist[] = {
-	{0x0000, 01, 07}, /* manufacturing use */
-	{0x0000, 06, 05}, /* manufacturing use */
-	{0x0000, 11, 03}, /* write once */
-	{0x0000, 11, 07}, /* write once */
+	{0x0000,  1,  7}, /* manufacturing use */
+	{0x0000,  6,  5}, /* manufacturing use */
+	{0x0000, 11,  3}, /* write once */
+	{0x0000, 11,  7}, /* write once */
 	{0x0000, 11, 11}, /* write once */
 	{0x0000, 19, -1}, /* diagnostics */
 	/* handled by kernel: dell-laptop */
-- 
2.7.4
