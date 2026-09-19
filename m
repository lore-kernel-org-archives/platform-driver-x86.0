Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D71A9F8C;
	Sat, 19 Sep 2026 05:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795030; cv=none; b=E+7Nuw8fzDowKXN88tYhs3MVOVDwr2boYReahmGMKACIBK5aGl8S4EOUC6CxkssBH6uXKTsbd4nGmc63jGUpg4WUkiletUAC4NmhhTfOTdRBbYzmNbHTYSLv/pz/KTQYnELP71ZYEbGHLlRARDqZHXe7COqLjI3NypD7EOWBnBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795030; c=relaxed/simple;
	bh=Iagbc3S9oK8i9XuKMVv5zjfuJ//dsM4mtS+LkoO1SKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tqC4Yt5j7N9c4G2Uzxw9mjWu6HZXbhNMcRgOlWgBnnc2Ke/w/xGS3L2Zv6bKXAfJ5O7spHF9YxsYs77ptvMQmJL6AMi/qRDWITh3Em0kIypMuEqr3cvOTMFOccV89S3l7OlKVCzDfYE0Gh4CD92GNk1tGWyADe20BNzUtn5x+QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=VDca79gl; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="VDca79gl"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3820182BD3;
	Sat, 19 Sep 2026 07:17:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CAulc7qoPqtV; Sat, 19 Sep 2026 07:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1789795024; bh=Iagbc3S9oK8i9XuKMVv5zjfuJ//dsM4mtS+LkoO1SKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VDca79gljJe9wXPi59wfxPRA80gcJHVPn1gFFQwwXukAAgCY6m+UCq1jRSWpEYjHE
	 Gvhz+yUA0FJ0DRXr0uj4ASN0fwZeKmaCel8FC8vJHMpJK8sPwSb4qH6Xm4wMxnRQ6v
	 c4sKkc/Ten6XMMOcN0BmpySIvmsubnmdPxchA6fZMBNVZ14Qr9BE02dohwFZQ6q6or
	 FA6RQTi7/5UdOYoTze6jpdYlMNvC4opKIcBDPul4aZzvkFGVm2uuH36H7Bddbya+RP
	 o5bTcNDUdplC2P0Y3e5cCQdKWW+sWJniW8fYhP9kWJ7AKJjhZH03NPuhRKfp+aGnSu
	 mMy6eAOHfEBng==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com
Cc: scardracs@disroot.org,
	corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/1] platform/x86: asus-armoury: add power limits quirk for G614FM
Date: Sat, 19 Sep 2026 07:16:17 +0200
Message-ID: <4d561b599712eeb483c2d1f7c042827c6f8c8719.1789794282.git.scardracs@disroot.org>
In-Reply-To: <cover.1789794282.git.scardracs@disroot.org>
References: <2ac49a94-be85-1a2f-a43a-a376d2545a01@linux.intel.com> <cover.1789794282.git.scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a power limits quirk entry for the ASUS G614FM laptop.
The limits are extracted from the device's ThrottleGear XML
configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---

 drivers/platform/x86/asus-armoury.h | 32 +++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 0e301d663..efb4dc66e 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1988,6 +1988,38 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G614FM"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 30,
+				.ppt_pl1_spl_max = 120,
+				.ppt_pl2_sppt_min = 65,
+				.ppt_pl2_sppt_def = 140,
+				.ppt_pl2_sppt_max = 165,
+				.ppt_pl3_fppt_min = 65,
+				.ppt_pl3_fppt_def = 140,
+				.ppt_pl3_fppt_max = 165,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 15,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 75,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "G614FP"),
-- 
2.55.0
