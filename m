From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 1/3] asus-laptop: remove removed features from feature-removal-schedule.txt
Date: Wed, 30 Mar 2011 16:32:31 +0200
Message-ID: <1301495553-22468-2-git-send-email-corentin.chary@gmail.com>
References: <1301495553-22468-1-git-send-email-corentin.chary@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from fb1.tech.numericable.fr ([82.216.111.51]:43454 "EHLO
	fb1.tech.numericable.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932599Ab1C3OmJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Mar 2011 10:42:09 -0400
Received: from smtp1.tech.numericable.fr (smtp1.nc.sdv.fr [10.0.0.24])
	by fb1.tech.numericable.fr (Postfix) with ESMTP id 87590ADC03
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Mar 2011 16:33:37 +0200 (CEST)
In-Reply-To: <1301495553-22468-1-git-send-email-corentin.chary@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>

commit 3b81cf9d558c57406b4ed9b0d2639113d1d428b6 removed those features.

Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 Documentation/feature-removal-schedule.txt |   20 --------------------
 1 files changed, 0 insertions(+), 20 deletions(-)

diff --git a/Documentation/feature-removal-schedule.txt b/Documentation/feature-removal-schedule.txt
index 274b32d..492e81d 100644
--- a/Documentation/feature-removal-schedule.txt
+++ b/Documentation/feature-removal-schedule.txt
@@ -387,26 +387,6 @@ Who:	Tejun Heo <tj@kernel.org>
 
 ----------------------------
 
-What:	Support for lcd_switch and display_get in asus-laptop driver
-When:	March 2010
-Why:	These two features use non-standard interfaces. There are the
-	only features that really need multiple path to guess what's
-	the right method name on a specific laptop.
-
-	Removing them will allow to remove a lot of code an significantly
-	clean the drivers.
-
-	This will affect the backlight code which won't be able to know
-	if the backlight is on or off. The platform display file will also be
-	write only (like the one in eeepc-laptop).
-
-	This should'nt affect a lot of user because they usually know
-	when their display is on or off.
-
-Who:	Corentin Chary <corentin.chary@gmail.com>
-
-----------------------------
-
 What:	sysfs-class-rfkill state file
 When:	Feb 2014
 Files:	net/rfkill/core.c
-- 
1.7.3.4
