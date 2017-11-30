From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/trivial] samsung-laptop: Grammar s/are can/can/
Date: Thu, 30 Nov 2017 14:32:39 +0100
Message-ID: <1512048759-18075-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <trivial@kernel.org>, Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/ABI/testing/sysfs-driver-samsung-laptop | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-samsung-laptop b/Documentation/ABI/testing/sysfs-driver-samsung-laptop
index 63c1ad0212fc8624..34d3a3359cf4587f 100644
--- a/Documentation/ABI/testing/sysfs-driver-samsung-laptop
+++ b/Documentation/ABI/testing/sysfs-driver-samsung-laptop
@@ -3,7 +3,7 @@ Date:		January 1, 2010
 KernelVersion:	2.6.33
 Contact:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 Description:	Some Samsung laptops have different "performance levels"
-		that are can be modified by a function key, and by this
+		that can be modified by a function key, and by this
 		sysfs file.  These values don't always make a whole lot
 		of sense, but some users like to modify them to keep
 		their fans quiet at all costs.  Reading from this file
-- 
2.7.4
