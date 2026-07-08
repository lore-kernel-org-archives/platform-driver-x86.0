Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B7B3F39D3;
	Wed,  8 Jul 2026 21:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783545599; cv=none; b=rdH9GXZiB/mJpUF6IvIBcqHApY6fDFR+A+2+ST+q9SfYHX9VzO/ZF0HbxkmXp5SDOJp/Iw7XXKd9WQN/hHVMcJyRnnsgJ2MZqYEfGZRS7xZAHcYIJxuPYrH3S2tGVteSa4p6mD+K2oVZdVMYkoePLpnjMv5YqNnzA/Cdy/zgr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783545599; c=relaxed/simple;
	bh=cLxfhROdO+9C8VeTpbllklSPdWHL9QD6FfWt//HChPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9JX94QwhfCIN6XpgJUBx/1dWH5fGjBEXJKUNFolB0tg4frS88SUokQjFXRTtk4F+M8XWZBGj38jlcAVUd78X4TwBHQuZ5rjcp/XDfBvNYM9lStvGmI8kHUs0YiL47PfSYJUBQwX2OlS8o0f6Zm3LTEcfBy0FLPoQT6a7gfWFnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=e1i3FjTq; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="e1i3FjTq"
Received: from wsembach-tuxedo.fritz.box (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id A37292FC0065;
	Wed,  8 Jul 2026 23:19:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1783545594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzOQi2ux2OFCfAexzn1zClEwKDEpllctZcPA35eQruQ=;
	b=e1i3FjTqYQ3kpzvtnagt0ZMldYXHWamICNYja9155SYNcuTGwfRbXasuGJd8XfR0s9k4qs
	SABLqEzEwpIvLXZuZG9xoOKRUP2vwQrObqoaX+aeQMfQm7hbIHjMHzBCBCeiCA75CYg3k4
	/a9XmiZwMNzYlR4mUnb0+S8AVQVsxGc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: uniwill-laptop: Add Avell A60 MUV support
Date: Wed,  8 Jul 2026 23:18:22 +0200
Message-ID: <20260708211950.568799-2-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708211950.568799-1-wse@tuxedocomputers.com>
References: <20260708211950.568799-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Avell A60 MUV based on information from tuxedo-drivers,
formerly known as tuxedo-keyboard:
https://github.com/tuxedocomputers/tuxedo-keyboard/pull/91

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 5e1e0202a5f3e..3104455838324 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2904,6 +2904,13 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &lapqc71a_lapqc71b_descriptor,
 	},
+	{
+		.ident = "Avell A60 MUV",
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_NAME, "A60 MUV"),
+		},
+		.driver_data = &lapqc71a_lapqc71b_descriptor,
+	},
 	{
 		.ident = "Intel NUC x15",
 		.matches = {
-- 
2.43.0

