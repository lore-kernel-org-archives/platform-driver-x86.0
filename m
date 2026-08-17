Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073F7426D03
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 14:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786978338; cv=none; b=qJZQ32XSPRrPSyE3vOOa3RPYUwQiphgvgWkkF0g7lgM/yILL8liyqrNinJu3b9l9apRTeKM25aCm1j1KzJzI+vkIJNAVVYJNbxnOhqT/APMhKu4tnVe7iDdmA64lNaZK0zR+zpfp3qC/BAUE84H7/E4POJMWuPETZwf8BVGcoTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786978338; c=relaxed/simple;
	bh=lgWUKWtexDy87J7kIx7OMTuWrdkL3O6iBOku4/t4j94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JmmQkk8kHs8xym7aqjia+oM+JrxXk1DcB2l4qpnHe03aH9AJK59Xss01yPZZHMgB9KooH7z94VqRWDvyQAXce2QhDt3r5oaM+IKMGxZnCjQ2Js4/CrDHSxr+tlTlisJ27ywI4TYomnLrfYmRlL7RPR/y5aOjF3hzvYTpVvSQV3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jo4jj+ib; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jo4jj+ib"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so45729445ad.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Aug 2026 07:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786978336; x=1787583136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQoSIixzHI2u2h02mh9tRBH8FmufPS4PyayXnWonCN8=;
        b=jo4jj+ibes/AOISFm3qHJSphVEzHTNIYqdVSH63hXlslO79S+P2QQ2pdPox91Dnqyk
         7OAlqXeJI4vZTuA42wREYnTSHZJoLUZyE7VRgUihnFCQMB/hGBQiN955XSm2D5n/xUyn
         /nwtckSWqen97JIuZQ3SosmxcLOp503mbtOf/y1RZ9WpU91tmbOU4E0zYFGWNcOxEiVP
         Ip99U1J5Sb3jHSYf/KZmqYEvsecOZrbCUYwPyZCvWPEKVsWvm/srleltJYOlFiGlS7mg
         1HMh+vl4XTGgp71xV/P+D/EQlnwOX8vpqF8dFYlMNLbRDhwOtfBEne/uH9u6eT6GjVWd
         lVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786978336; x=1787583136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQoSIixzHI2u2h02mh9tRBH8FmufPS4PyayXnWonCN8=;
        b=e1dcQCaX4A/WsmmS5USLfssc0s0bza3luuLAKRs+exLjDwdIb1M4c/3aaRwroz7iGg
         Uh9dstPj/wTiIHbEx2uvK0SkNxh/ZylJjcjHw2r2Ge/5JoBZChMZdiEwUmuEsMT0nAb2
         7Zakur9q0xM9r1aK4QDmi+tg0+YMtfXHJ56HQ0IP69ufa3H62zoNahHsdOIvYP3Q+f1c
         6beNRUjqCS0DnaIWjG++327aj8K2ddgdXX5J82CqaVCscvp/CjquqK23Eb/OYQPCf7kz
         mxCwYu2JtdJYafW+JvpoLvqvfAS4iwV2YEbBr0vxLSRENhD79ulhLggEr6161gJnUUEA
         eN/A==
X-Gm-Message-State: AOJu0YzwBgclW4tz4X7g48+F+/3DFIzrmeQZmTKnkL5K1V5fE1yCivUD
	RJniF94EMgUv/OgJUgC2lkHRCJ3qhvNwtNJjYi/c/P2BSr0UGiTXFK5g
X-Gm-Gg: AR+sD12bmzeAP9pFDY/Q4iesE5QHxum94ifB5+ojWcE9U7U+me3LNX2EkjTmsAWk4L8
	V3mDE6nsc4um3Oa3bnvpo5+yi7dHclyjvfZ/5ogg7cbOmhXFiaW0iUi7+lcMisyejtb3sgbfzU3
	NH68koEOlF7O9iX4Rs29QrkFB/b68eUGlz7kIepQLMpIiZGGfuEhCXvdK1eG88nT2cflW07u9La
	Lsqz7KBhB08d2yBXNgCdO92oVTOwREc3iv+pZRNVjNBR6GDpTSy0ZPgYd2+XenaA2uRxQ0HHKi2
	SB6qbL4NkwmCZ9jOWzZqMYVEPXAXewLCLTygzQfReZLzsP//3hKkxIBLRiKM4vOOOVw2Qwu6XHg
	EyeMf0im3JQxGLCuah2e2ZpSuB/Hpds+NFw5DYZN1RAdHS8ZBFQcC54+jyPD4GyHdNs19aLPR6Y
	OUBWwPN5GiShEsTLRUUfFo39+kEDSmZNFeiDI/wT+BL0YqmK1qjLCGf6ouNQM3dxwhssH0sbUdd
	/7ijL//nVHzrdzxYERCDrXNNTV25ZVTzA==
X-Received: by 2002:a05:6a20:918c:b0:3c0:b4f8:bbfb with SMTP id adf61e73a8af0-3cc71c61e5dmr27713820637.22.1786978336101;
        Mon, 17 Aug 2026 07:52:16 -0700 (PDT)
Received: from archlinux ([2409:40d5:5e:a2f1:79a4:a963:a64a:5d0e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14153187de4sm6453435c88.15.2026.08.17.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 07:52:15 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OMEN Transcend 16 8BB3 support
Date: Mon, 17 Aug 2026 20:22:06 +0530
Message-ID: <20260817145206.148600-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN Transcend 16 (board ID: 8BB3) uses the existing
OMEN v1 WMI interface but does not use the standard EC thermal
profile parameters.

Add the DMI board name to hp_wmi_feature_boards[] and map it to
omen_v1_no_ec_board_params.

This enables the existing board-specific handling for 8BB3,
including platform profile and fan control support.

Tested on:

HP OMEN Transcend 16-u0xxx

DMI Board Name: 8BB3

Platform profile registration, fan RPM reporting, and PWM fan
control have been verified on this board.

Link: https://github.com/arfelious/omen-fan-control/commit/5d7a893432f1075ebb030a4eccdc929c35d68d97

Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 5f4853d82de6..49321d7feb93 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -271,6 +271,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8B2F") },
 		.driver_data = (void *)&victus_s_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BB3") },
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
 		.driver_data = (void *)&victus_s_board_params,
-- 
2.55.0

