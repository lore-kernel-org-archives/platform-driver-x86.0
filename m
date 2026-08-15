Received: from mta0.migadu.com (out-47.mta0.migadu.com [91.218.175.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4D4352C54
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785759; cv=none; b=lcPjZ6Wx/ZkGZew34vp340lJCFxxe6FQcWsJsSuGXdcWit6FeirEqjXGrMfMbAyVfbhpk3YZw7PeI6O4T76+LgAoLmfVAYw9EinnSFCxzXxC79s3cZvqo5k4lxqik/wHLHkQhP9/vELHTDOHnO+zQHc+qQsKa+bCc7uABUT3uv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785759; c=relaxed/simple;
	bh=1Jemc0udqo95SvjO+bw28kGUcObykWuv/+fTQVmkRNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q++DQqHTk1/t/Uk+NgxV/5DBJ0/oJKe8ByeUB6UqTOTjpDkQmAbcO4sR3dwhmSv5r08RoutobgR1cETakSPsqiRCUDcONQ2CaD7v0S1GkBJTS0m4ZROx4F82vdZWBaPcmB7mpa+iHG7DNcCfsrNL/pf9OZNylFpW86cvgXoU5Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d5yc5aSA; arc=none smtp.client-ip=91.218.175.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d5yc5aSA"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1Jemc0udqo95SvjO+bw28kGUcObykWuv/+fTQVmkRNc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786785755; v=1; x=1787390555;
 b=d5yc5aSAA9f03JFjsfy3selOeJDZY83JXX6q8LfeApVC61OBvvilPERSC3llwIOzO673QJCB
 0pEFCqyAglLxylxL4/7vv1MC3+Mhk6Kg7pYMh2exigq5GJ/T+XjysTLEpwXugf5G0HLsXhifILt
 I94VeERN3H6cuQ0iTWqijl1U=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: from fedora.fritz.box (62.216.208.217)
	by mta11.migadu.com with ESMTPS id 6ec7395b40bd43da;
	Sat, 15 Aug 2026 09:22:35 +0000
X-Migadu-Flow: FLOW_OUT
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "David E. Box" <david.e.box@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/intel/vsec: Use bool for run_once
Date: Sat, 15 Aug 2026 11:21:39 +0200
Message-ID: <20260815092138.91072-3-thorsten.blum@linux.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=902; i=thorsten.blum@linux.dev; h=from:subject; bh=1Jemc0udqo95SvjO+bw28kGUcObykWuv/+fTQVmkRNc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkN+ouMWhVZpKJeh/59slBgn9RJnscv/57ZcaGQXbJU1 I1fkkuso5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACbiKs3IcMeY72BboYjjmR2t SfV7Js44dG7WPK4NFdaRbecM1wRx8jL8FUg13ilXMWfWS3etq7skVnMqRM8u9Fhatl+bb4Zw+XV RLgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use bool for run_once in intel_vsec_pci_init().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/platform/x86/intel/vsec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 5ab2215fdd7f..f78438d5c936 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -669,7 +669,7 @@ static int intel_vsec_pci_init(struct pci_dev *pdev)
 {
 	struct vsec_priv *priv = pci_get_drvdata(pdev);
 	const struct intel_vsec_platform_info *info = priv->info;
-	int run_once = 0;
+	bool run_once = false;
 	bool found_any = false;
 	int num_caps;
 
@@ -682,7 +682,7 @@ static int intel_vsec_pci_init(struct pci_dev *pdev)
 
 		if (!run_once) {
 			intel_vsec_skip_missing_dependencies(pdev);
-			run_once = 1;
+			run_once = true;
 		}
 	}
 
