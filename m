Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EA42E1EFC;
	Mon,  5 Oct 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217913; cv=none; b=FYNEiWwWbKyYW8R2Hd3osAh/35UJz0yqgAvgGnk0p9uZao0uYdHlxdVV9aO7K5pii6j5cSpTfiluVA36BdVTdreqOJ8oHlEdPdLWIOD+qTaVofgICA0IXdRj55RnV+YyF80SEEcvegdV9kb3czcvbfWSbbJSB4+/QURive5QykY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217913; c=relaxed/simple;
	bh=NOfpo6xVChl2DCbx1KooLKem6nQn6czQpVcrrmG/2lo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sEsO8niquC/33OdR1dQysm43xQ3KzHMZ+ZhM7yBGdX2pIkT14ZsEWGSv/IWhnB4yx6yz5T77+d97AtD5pJcvBU1mqMgTyvWoP+3b+CYt1RJl5zrQDpGGfJqtXN8cRl2MmN+irgIY72TP+BbSU6f67fp9PZDfvWLki9tncyESWw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=axzFR5EP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="axzFR5EP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21D61F000FF;
	Mon,  5 Oct 2026 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791217911;
	bh=jY5oyGJrmlqdDo1GtZbEYKKIPo7J2hzky4typ16ddEc=;
	h=From:To:Cc:Subject:Date;
	b=axzFR5EPWGlUQ/8GCnYn1LLorRtz3yHvIm+GRgByq2kNHFqz9SmvXoGUflkEIA2UU
	 OK8oFId0ArFnoUHHDXAbWBXFyQfEsClwCPeKaIyWM0IXcKfdvg/rtoEw4GQcCwwfBx
	 5cMU7704hRL2TuJ6xNgSMdtCnMhe21Ho4Dp8kdCz0tu7EiFGyjfLA/SyVeFmj3mD7X
	 8avodGwHCaP2iUZx+BceEM2GugLnvYbh/2dG3w3U5hc1nMH3G5Cwos07uxI9bG+ijD
	 Fw2fIm+uteVMCkZZx43TFGPykl9dH1soc59crJ7XEW30ig+3KEpPH6+7MXIiMyjpvW
	 iUZ1TEh55bQeA==
From: Thorsten Blum <blum@kernel.org>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <blum@kernel.org>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Use bool for local is_thinkpad variable
Date: Mon,  5 Oct 2026 18:31:31 +0200
Message-ID: <20261005163130.20375-2-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=710; i=blum@kernel.org; h=from:subject; bh=NOfpo6xVChl2DCbx1KooLKem6nQn6czQpVcrrmG/2lo=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmHLzyuLV83u+n8h4534i0//zifc9J/E/XU9b3KLdd73 Gs4zvh0dZSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEZgUzMhyMkpXjLOPxVF/v 9+Pd1Z6Pd5bnOKa8TvrsJzzBdt2e7jUMf4Vzls5+svv6BdFbTewHPOSSFuqIcnsrM1roLYjX8+Y 2ZAIA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use bool for the local is_thinkpad variable because it only stores a
boolean value.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1661f070c571..1082c36ae723 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -11925,7 +11925,7 @@ static int __must_check __init get_thinkpad_model_data(
 
 static int __init probe_for_thinkpad(void)
 {
-	int is_thinkpad;
+	bool is_thinkpad;
 
 	if (acpi_disabled)
 		return -ENODEV;
