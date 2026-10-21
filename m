Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566632;
	b=LoOklzcWaPc6EP5uNsMS/F0PlQI1DeSmUQ1v12q3NIu566sfuErmYKEsdm821Sor9lte
	 kXo0yEge9oIrBd9uhJd2rfPzVUywCUWauYktQna5SJx9flurpfl7ymMfn+d37sd0g0FOp
	 ST0UvSvUTXh9QnL2nje7RgjCOBxmaJITz93bfuKp9pVvVHisQRKARQ4iqIbR4zQZeh+Wf
	 rk+YhhF5Vga1gjU1PZBFCu3t5wsk7w4RMbX1uQOU6eNxK5pQ2587RCBs9S0Io4UvYwzNU
	 wWEXZTK7NwToENQxHERVcDr5KiF5Z5W0yVrzRIdg+lWfAGHz1ImAhbEOD1tZa4XqfVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566632;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rix1p1Cyzqd0FxvmT7jEXaKym4HfEZY1F+++eXXNjow=;
	b=0fX3viqwnFT3fzwT1Kbkfs74ukTRYhYW4PEBCQxiLfDXWeiywdkQICREB32VWHZ81KoE
	 HIVQZzOtgCaX3n96mVsCAp7qn3Nl5bApxxDxQz/2ag2AOZkPv4M/hjz1RZiBJMeSZqKbd
	 Vb5usIe0LHWvMvtfS7ZHp8EwLlIC7mf5dW1th0H0jRRkBzGSglpm3rVEV8KgL7aS/niB3
	 0l6APvZPTae1c3lbnnAuyuplv4u5/hHp7dMVRJkZbGbks78C/uwk76A7x2xvY6s9IB4sF
	 LTj4GpSh3YLa6OjlDJ+F9eTZIOVUmtqM8hTUvphM7TaOzhZkQouEAdYzu37oH6VTMjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8974C606A31B;
	Wed, 21 Oct 2026 07:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8974C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 843A880F2B;
	Wed, 21 Oct 2026 09:10:23 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jumLQudmijQE; Wed, 21 Oct 2026 09:10:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792566622; bh=PZ1GvDFUXRjWYbO2XyfsDNhfyv/qKWSYBm4vd8JR6Js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hKuRzUs6d5oAXZfo67I3LeFwcWg8qsN7KE3s10EtG0Qu1W9vhLqqR51/9BfNk4YGB
	 K1uOdldFhu7S9MZX3Ljdg6aP+arFsCWG0KLvlv0rfcECqLfUfsyHltcCCQrTdLB7Lt
	 ogvddKggW/HbX54rUxkLE6omWg+eF7sMMfY6kQIIR5ThTRAVzeyH97k2VH40RNHU/M
	 bxi8cPbJP9Zyh82s/CY/XBjNhZblDmknjDyxsE34i2AHcxii5iy8GYGo6VtoJreX8i
	 BFyydwNM+UI542255E2xP3E9s20/7xJ5LCfzv5jMq6naWcz46pqvoreeAIBwGi6xX2
	 fn1LryieF3MyQ==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v4 2/7] platform/x86: asus-armoury: add power limits quirk for FA608PM
Date: Wed, 21 Oct 2026 09:08:14 +0200
Message-ID: <20261021070948.19916-3-scardracs@disroot.org>
In-Reply-To: <20261021070948.19916-1-scardracs@disroot.org>
References: <20261021070948.19916-1-scardracs@disroot.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a power limits quirk entry for the ASUS FA608PM laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 31 changes(+/-)
 1 file changed, 31 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -789,6 +789,37 @@
 	},
 	{
 		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA608PM"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.nv_dynamic_boost_max = 15,
+				.nv_dynamic_boost_min = 10,
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.nv_tgp_max = 100,
+				.nv_tgp_min = 55,
+				.ppt_pl1_spl_max = 100,
+				.ppt_pl1_spl_min = 45,
+				.ppt_pl2_sppt_max = 115,
+				.ppt_pl2_sppt_min = 60,
+				.ppt_pl3_fppt_max = 135,
+				.ppt_pl3_fppt_min = 80,
+			},
+			.dc_data = &(struct power_limits) {
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.ppt_pl1_spl_max = 68,
+				.ppt_pl1_spl_min = 35,
+				.ppt_pl2_sppt_max = 71,
+				.ppt_pl2_sppt_min = 36,
+				.ppt_pl3_fppt_max = 74,
+				.ppt_pl3_fppt_min = 70,
+			},
+		},
+	},
+	{
+		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "FA608UM"),
 		},
 		.driver_data = &(struct power_data) {
-- 
2.56.0
