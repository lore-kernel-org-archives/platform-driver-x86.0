Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98F93CE49E;
	Tue, 28 Jul 2026 07:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223150; cv=none; b=mibD7O0UIZRsYUXFGXDyenuktSWeeflFaBNSGVB7qFZEfygW78Ug2OYotQ+OlsbG02xSHPZ6GmnrjIq+bCiPD7Up8UzU/1hwkJvR5SJKebear0mIV90cjeNsFHqlj4YyC/rGmxU4tVzT1dvjW5L//erkasHkmV33G+g+y/57TBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223150; c=relaxed/simple;
	bh=CK/G1+emNfayUpNgTMHsAVoNxWBEZjSqNbbQvq/hO1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZiSOW3XEISfGIdhlliA6A/xCukUTccx0H09QwvddcjWsTqzy6g2W3xd353gVZo4LvIErZrEn0SSuODrhqsEXdUoOqspJO6DQKhd/h7j+nZNNxaERYmB50LfnN3oh1OISR2SudHKOjLutr4e2D+xhbgMGDy3NqUW5jQIV0sM8API=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=W0WOsrXE; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="W0WOsrXE"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6E26787259;
	Tue, 28 Jul 2026 09:18:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0LKNGWT2P9di; Tue, 28 Jul 2026 09:18:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785223138; bh=CK/G1+emNfayUpNgTMHsAVoNxWBEZjSqNbbQvq/hO1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W0WOsrXE2F8sKD/9Wjacbw95yKAl+U46knlckByLzFCBA57W18JvbT7wjnE+KTTQm
	 tDPC92i5bqOZFLyjnM1XOUBvyjd41r4B4ce1UVBxTI6/RxsCHMSo2xOyU/lFZ3Fi2f
	 Wi/1oSsAC1nDRO4vO+uab1si7JwmpETZZJhfIpx6cYhmBWTbQwxDp+be8bQQlWRDmP
	 8BrXKpCZtetqMXl0+h6KbaWvHdqA6EaBOjw6Lrf/cQom6xvlSZmhN3gYerD5/9WxL3
	 JU/mj+N5dtkj5WBnaqJ31eHTyuN7PgYVkHhcMoEV3jlapJMy+2K5bcng2NkjKKox4r
	 OHXXY5XxKDAtA==
From: Marco Scardovi <scardracs@disroot.org>
To: platform-driver-x86@vger.kernel.org
Cc: luke@ljones.dev,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	corentin.chary@gmail.com,
	denis.benato@linux.dev,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 1/2] platform/x86: asus-wmi: add Whisper Mode WMI device ID defines
Date: Tue, 28 Jul 2026 09:18:38 +0200
Message-ID: <20260728071843.130492-2-scardracs@disroot.org>
In-Reply-To: <20260728071843.130492-1-scardracs@disroot.org>
References: <20260728071843.130492-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add WMI device ID definitions for ASUS Whisper Mode hardware control.

The WMI device IDs used by ASUS laptops to query and configure Whisper
Mode profiles (BIOS Whisper Mode toggle, Dynamic Whisper enable, and Dynamic
Whisper status/control) were missing from asus-wmi.h.

Add ASUS_WMI_DEVID_WHISPER_MODE (0x0012007A), ASUS_WMI_DEVID_WHISPER_ENABLE
(0x00090022), and ASUS_WMI_DEVID_WHISPER_STATUS (0x00090023).

This change only introduces constant macro definitions and has no side effects
on existing driver code.

Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 include/linux/platform_data/x86/asus-wmi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index b5ed8c83ace1..3971ddc3af15 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -164,6 +164,11 @@
 /* Bootup sound control */
 #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
 
+/* Whisper Mode controls */
+#define ASUS_WMI_DEVID_WHISPER_MODE	0x0012007A
+#define ASUS_WMI_DEVID_WHISPER_ENABLE	0x00090022
+#define ASUS_WMI_DEVID_WHISPER_STATUS	0x00090023
+
 /* DSTS masks */
 #define ASUS_WMI_DSTS_STATUS_BIT	0x00000001
 #define ASUS_WMI_DSTS_UNKNOWN_BIT	0x00000002
-- 
2.55.0

