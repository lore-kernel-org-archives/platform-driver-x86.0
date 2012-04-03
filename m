From: Robert Gerlach <khnz@gmx.de>
Subject: [PATCH 1/3] fujitsu-tablet: remove duplicated code
Date: Tue,  3 Apr 2012 22:34:33 +0200
Message-ID: <1333485275-2752-2-git-send-email-khnz@gmx.de>
References: <1333485275-2752-1-git-send-email-khnz@gmx.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:44818 "HELO
	mailout-de.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753286Ab2DCUel (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Apr 2012 16:34:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by kolab.lan (Postfix) with ESMTP id 98CA9166A1
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Apr 2012 22:34:39 +0200 (CEST)
Received: from kolab.lan ([127.0.0.1])
	by localhost (kolab.lan [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pc0US6yxOG3J for <platform-driver-x86@vger.kernel.org>;
	Tue,  3 Apr 2012 22:34:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by kolab.lan (Postfix) with ESMTP id A2315166A5
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Apr 2012 22:34:37 +0200 (CEST)
In-Reply-To: <1333485275-2752-1-git-send-email-khnz@gmx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Robert Gerlach <khnz@gmx.de>


Signed-off-by: Robert Gerlach <khnz@gmx.de>
---
 drivers/platform/x86/fujitsu-tablet.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-tablet.c b/drivers/platform/x86/fujitsu-tablet.c
index 580d80a..4830f5d 100644
--- a/drivers/platform/x86/fujitsu-tablet.c
+++ b/drivers/platform/x86/fujitsu-tablet.c
@@ -221,9 +221,6 @@ static int __devinit input_fujitsu_setup(struct device *parent,
 	input_set_capability(idev, EV_SW, SW_DOCK);
 	input_set_capability(idev, EV_SW, SW_TABLET_MODE);
 
-	input_set_capability(idev, EV_SW, SW_DOCK);
-	input_set_capability(idev, EV_SW, SW_TABLET_MODE);
-
 	error = input_register_device(idev);
 	if (error) {
 		input_free_device(idev);
-- 
1.7.9.1
