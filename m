From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 2/3] asus-laptop: Add key found on Asus N61JQ
Date: Tue, 24 Aug 2010 09:30:45 +0200
Message-ID: <1282635046-6366-2-git-send-email-corentincj@iksaif.net>
References: <1282635046-6366-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:55911 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752120Ab0HXHfA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Aug 2010 03:35:00 -0400
Received: from relay2-v.mail.gandi.net (relay2-v.mail.gandi.net [217.70.178.76])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id DC839865C2
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Aug 2010 09:31:12 +0200 (CEST)
In-Reply-To: <1282635046-6366-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Corentin Chary <corentincj@iksaif.net>

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/asus-laptop.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index ffab9b4..27298a4 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -278,6 +278,7 @@ static const struct key_entry asus_keymap[] = {
 	{KE_KEY, 0x99, { KEY_PHONE } },
 	{KE_KEY, 0xc4, { KEY_KBDILLUMUP } },
 	{KE_KEY, 0xc5, { KEY_KBDILLUMDOWN } },
+	{KE_KEY, 0xb5, { KEY_CALC } },
 	{KE_END, 0},
 };
 
-- 
1.7.1
