Received: from mail.sntiq.com (mail.sntiq.com [45.149.154.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29557327C18;
	Thu, 28 May 2026 18:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.149.154.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779993818; cv=none; b=jr3jfX2fy/6v6GKbpn+ECOItju+hMHaJicox7D6XJ71Gd92mnTfSIuM4HEQEA4o837F6m3uLiWnkmawrYvGmrQjTyevmJ4iU2vUDAenObS/6IUwFbiLfdbD10isXLDexuT7Ozq6hlq6Ej8APhj/2iz55LiSEsejaUJBZ2e7a2c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779993818; c=relaxed/simple;
	bh=PQuJs6xVlHRJr10Z9xjJHH/x3Oepaap4I3APQ5Ki9Wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SGzMXSptMY42yyKypHxKcBxw15WlP8uxkWWGZKN4i/RmgaaVU+N/sgcJGYOU2WmhdRYaMKGJt5+Gw1MXL1lVKaZ0appWNVXzvqa07ZkvV4gTbU7HIX0w17HylcLpuX+XOfUCMJQHZXtEKUSZeioQSncgBqDm1dc0snQmUfHvRpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntiq.com; spf=pass smtp.mailfrom=sntiq.com; dkim=pass (2048-bit key) header.d=sntiq.com header.i=@sntiq.com header.b=kj94fsf/; arc=none smtp.client-ip=45.149.154.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntiq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntiq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntiq.com header.i=@sntiq.com header.b="kj94fsf/"
Received: from node.lan (unknown [145.224.72.191])
	by mail.sntiq.com (Postfix) with ESMTPSA id D5AC6803D0;
	Thu, 28 May 2026 18:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sntiq.com; s=dkim;
	t=1779993366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i6U3RNGGd1fpaNuW0d4doDOlmNaVHcWVx3ltj/ZoHoo=;
	b=kj94fsf/kjgXyX+SGuKOHsfYUxN5GsvZFLIksBGRLGFly5Fits6/pRGMabgRYM//WL4llI
	WSttrVZr5x1PpVUOYp2wAWpslWOc/AnAkuH9jqonndeQTENH5SE6AECjpytimoB9jP5N+V
	tDPLczks1KlaFLTVj0t3pBGg9aJWi3wqImKKP6D1vU6/lbFSIu6iBR4h5dyZB/jmSMBRYe
	0dm7zMidYY3Wstla3Iln3pM5v4o8yufEyrd1ZHLkLuBThpwpwllR+maEsFVYyRHlKxNuXs
	ZjgfCbFMDKqyfoJVKpXSfnfRLNoS0QmLxxyGkDSyTCOftVABVegDjkO2OGJfAQ==
From: David Glushkov <david.glushkov@sntiq.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Glushkov <david.glushkov@sntiq.com>
Subject: [PATCH] platform/x86: msi-ec: Add MSI Raider A18 HX A9WJG EC firmware
Date: Thu, 28 May 2026 20:33:58 +0200
Message-ID: <20260528183358.552782-1-david.glushkov@sntiq.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for EC firmware 182LIMS1.111, found on the
MSI Raider A18 HX A9WJG.

The out-of-tree msi-ec driver probes successfully on this
machine and exports the msi-ec platform device. Without this
entry, the in-tree driver rejects the EC firmware as
unsupported.

Tested on MSI Raider A18 HX A9WJG with BIOS E182LAMS.31A.

Signed-off-by: David Glushkov <david.glushkov@sntiq.com>
---
 drivers/platform/x86/msi-ec.c | 81 +++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index f19504dbf..2ef31fb82 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -1128,6 +1128,86 @@ static struct msi_ec_conf CONF13 __initdata = {
 	},
 };
 
+static const char * const ALLOWED_FW_14[] __initconst = {
+	"1824EMS1.108", // Raider 18 HX AI A2XWJG (MS-1824)
+	"182LIMS1.108", // Vector A18 HX A9WHG
+	"182LIMS1.111", // MSI Raider A18 HX A9WJG / Vector A18 HX A9WHG
+	"182KIMS1.113", // Raider A18 HX A7VIG
+	NULL
+};
+
+static struct msi_ec_conf CONF14 __initdata = {
+	.allowed_fw = ALLOWED_FW_14,
+	.charge_control = {
+		.address      = 0xd7,
+		.offset_start = 0x8a,
+		.offset_end   = 0x80,
+		.range_min    = 0x8a,
+		.range_max    = 0xe4,
+	},
+	.webcam = {
+		.address       = 0x2e,
+		.block_address = 0x2f,
+		.bit           = 1,
+	},
+	.fn_win_swap = {
+		.address = 0xe8,
+		.bit     = 4,
+	},
+	.cooler_boost = {
+		.address = 0x98,
+		.bit     = 7,
+	},
+	.shift_mode = {
+		.address = 0xd2,
+		.modes = {
+			{ SM_ECO_NAME,     0xc2 },
+			{ SM_COMFORT_NAME, 0xc1 },
+			{ SM_TURBO_NAME,   0xc4 },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.super_battery = {
+		.address = 0xeb,
+		.mask    = 0x0f,
+	},
+	.fan_mode = {
+		.address = 0xd4,
+		.modes = {
+			{ FM_AUTO_NAME,     0x0d },
+			{ FM_SILENT_NAME,   0x1d },
+			{ FM_ADVANCED_NAME, 0x8d },
+			MSI_EC_MODE_NULL
+		},
+	},
+	.cpu = {
+		.rt_temp_address       = 0x68,
+		.rt_fan_speed_address  = 0x71,
+		.rt_fan_speed_base_min = 0x00,
+		.rt_fan_speed_base_max = 0x96,
+		.bs_fan_speed_address  = MSI_EC_ADDR_UNSUPP,
+		.bs_fan_speed_base_min = 0x00,
+		.bs_fan_speed_base_max = 0x0f,
+	},
+	.gpu = {
+		.rt_temp_address      = 0x80,
+		.rt_fan_speed_address = 0x89,
+	},
+	.leds = {
+		.micmute_led_address = 0x2c,
+		.mute_led_address    = 0x2d,
+		.bit                 = 1,
+	},
+	.kbd_bl = {
+		.bl_mode_address  = MSI_EC_ADDR_UNSUPP,
+		.bl_modes         = { 0x00, 0x08 },
+		.max_mode         = 1,
+		.bl_state_address = MSI_EC_ADDR_UNSUPP,
+		.state_base_value = 0x80,
+		.max_state        = 3,
+	},
+};
+
 static struct msi_ec_conf *CONFIGS[] __initdata = {
 	&CONF0,
 	&CONF1,
@@ -1143,6 +1223,7 @@ static struct msi_ec_conf *CONFIGS[] __initdata = {
 	&CONF11,
 	&CONF12,
 	&CONF13,
+	&CONF14,
 	NULL
 };
 
-- 
2.54.0

