From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH 01/15] MAINTAINERS: Update git URL for x86 platform drivers
Date: Wed, 16 Jul 2014 19:43:03 +0200
Message-ID: <1405532597-28262-2-git-send-email-minipli@googlemail.com>
References: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:35777 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933174AbaGPRni (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Jul 2014 13:43:38 -0400
Received: by mail-wi0-f172.google.com with SMTP id n3so6619010wiv.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jul 2014 10:43:37 -0700 (PDT)
In-Reply-To: <1405532597-28262-1-git-send-email-minipli@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>

The repo on kernel.org is no longer available but has a replacement at
cavan.codon.org.uk.

Signed-off-by: Mathias Krause <minipli@googlemail.com>
---
 MAINTAINERS |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c411c40d88..4e5554bbc6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9956,7 +9956,7 @@ F:	arch/x86/
 X86 PLATFORM DRIVERS
 M:	Matthew Garrett <matthew.garrett@nebula.com>
 L:	platform-driver-x86@vger.kernel.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mjg59/platform-drivers-x86.git
+T:	git git://cavan.codon.org.uk/platform-drivers-x86.git
 S:	Maintained
 F:	drivers/platform/x86/
 
-- 
1.7.10.4
