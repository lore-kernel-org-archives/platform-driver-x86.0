Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792566633;
	b=D2Cqsf5ynz06IXq+u5f+9Ih59zFhwn5pf2Z03U52xFdocyTj2x6EVI06VL68paPApj4H
	 iylep5rVJ49sfCxT62eWcKYUIjFYvoZQ+ghucfmrxe7+rKK0GYKFFhRu86a0mVq+Bu9GT
	 4gjy8Cnbl/h9VpO9gxnB/LeLytAV9t6BxS+2XnJiJx9RLu5bMtqkbE36/q0nvGBNG408P
	 ep/k6FMFebJsGLBW7mUtlsWXj31elwD10lNrV2k1dQYwuX5ovsIA+dohbwRZSedwWPl9u
	 Lm/qEwHX0gF+Qc8Ae+cDYrekii/ERy5YZLM50clTY9ZGqeDGzi2PBPJbfUqOD0tr/9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566633;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HU0DgYEIJu5mFVDiJohXgcz5rQuk+d5Erzh8HNG3TgY=;
	b=GvYX0N3mPdKh0hnDDvkuu0HkH7b2rrfJOnuvqMhsCo6YvZls3t9DOpc3FV15DUSPG5L8
	 I+aK8+ZUxlCgBJgJvbx5YQPTe3u8yxMuqz/yCc4iCJ6FTuOmoMAlvMklfldxkp4nfo5U8
	 SwOMGVfLVbVNpGWsiBQ340Ty69TK2oiHgRcr4rT5K4IRimlGC09O/Fh1yhnLgSfgY65EJ
	 TkVfvOo5FiQC2DavOXh/mYH/lr98tJkclYGIWUmrB2RZprGY8GrLLlU9AYcB7N6W49zG5
	 hfzHUSJo3lR1taqxzRV1TdAczmqU2rMrhBGCtI1l3+J8aywOYnw7ZS+ERerAisx6HkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=LQBX0ONW;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5365E606A32C;
	Wed, 21 Oct 2026 07:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5365E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=LQBX0ONW
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 117BE82B86;
	Wed, 21 Oct 2026 09:10:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vtzqd4CMtV37; Wed, 21 Oct 2026 09:10:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792566623; bh=TQzkw5MRnCzAuEGf8rImQkWxUVG96q1rb8/lh2BSgdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LQBX0ONWMS9WV1ZHIUIkiIAV3WwR1obbufezi/KtTz7VCB0SgCPd/xyiraVN07MBq
	 KQt0coearCy2fIhg8r8RjfrCA6u6a9VVrenSGkEV2baiff1jkaIXzQ9FqI4J4tfLRn
	 Vgqll5uDt4/X3RlEUszyEPqduI+d4x726DTQ7KSP9J3yHwpXOi0Ib+fRpDrSTWmImi
	 JPLw6tJiLVsBObvkBpsd+UbVDgXgEJ6hbd3dPwbCKMk9N9xGSa8yXL/M5YWHXaNjmP
	 FzZ+DfOL2aDaQYzz7wcCo9c6vnWQMeOyIO6WzSffCGJeA+SPMXHx/NiYdHiHLYQTeh
	 nXBiIILJQBs4w==
From: Marco Scardovi <scardracs@disroot.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v4 3/7] platform/x86: asus-armoury: add power limits quirk for FA608UH
Date: Wed, 21 Oct 2026 09:08:15 +0200
Message-ID: <20261021070948.19916-4-scardracs@disroot.org>
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

Add a power limits quirk entry for the ASUS FA608UH laptop. The limits
are extracted from the device's ThrottleGear XML configuration.

Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.h | 33 changes(+/-)
 1 file changed, 33 insertions(+), 0 deletions(-)

--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -820,6 +820,39 @@
 	},
 	{
 		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA608UH"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.nv_dynamic_boost_max = 15,
+				.nv_dynamic_boost_min = 10,
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.nv_tgp_max = 100,
+				.nv_tgp_min = 55,
+				.ppt_pl1_spl_max = 90,
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl2_sppt_max = 90,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl3_fppt_max = 90,
+				.ppt_pl3_fppt_min = 35,
+			},
+			.dc_data = &(struct power_limits) {
+				.nv_temp_target_max = 87,
+				.nv_temp_target_min = 75,
+				.ppt_pl1_spl_def = 45,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl2_sppt_def = 54,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
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
