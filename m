Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2006531A07B;
	Mon,  6 Jul 2026 01:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783300872; cv=none; b=R+fwRP/HbBm+ZpDzPXAn2SkXcFNbavjD2mfdL8Hep+qMRHuvlereQx5QDA69ho0SpODi7o+ZGWCvHWhYqJ9qr1rA+uf4QU1xJSXNupppbBozeRFOsMZ7AuEG2lzh1lrRFwPHUtfjcti1Mr+Gk/9OwsIKDiiKjrVcRZlwH85UKHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783300872; c=relaxed/simple;
	bh=+oZ+5Wc7J/USqV+BHvgUQb/MfttRZdvJ0SnoiLriZQY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dDWC9VezvOIh4SXyBjPVbeVQRLcZ5NHIpkfK9SDxc98OwoPECOKxEB4S+mIHhqkJa8ONCD+5zCS8B/toqfxndNK3e5mCIKErc2QKy6Ey8f6iCC9soaTcFStgFAz/4L3YkIbrWKLKk5g6bGxJYa0grEAWgJK4OcoQcgCRjQwbJcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f2dd96cc78d811f1aa26b74ffac11d73-20260706
X-CID-CACHE: Type:Local,Time:202607060915+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:9c9bc05e-fc66-4809-8cdc-42bf57b6b168,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:e7bac3a,CLOUDID:a591e0ecf862eadd6f5a4e21edac7c58,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f2dd96cc78d811f1aa26b74ffac11d73-20260706
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 769632892; Mon, 06 Jul 2026 09:21:00 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH] platform/mellanox: mlxbf-pmc: Check ACPI_COMPANION() against NULL
Date: Mon,  6 Jul 2026 09:20:56 +0800
Message-Id: <20260706012056.524096-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every platform driver can be forced to match a device that doesn't match
its list of device IDs because of device_match_driver_override(), so
platform drivers that rely on the existence of a device's ACPI companion
object need to verify its presence.

mlxbf_pmc_probe() passes the result of ACPI_COMPANION() to
acpi_device_hid(), which dereferences it, so force-binding the driver to
a device without an ACPI companion leads to a NULL pointer dereference.

Accordingly, add a requisite ACPI_COMPANION() check against NULL to the
mlxbf-pmc driver and return -ENODEV when the companion is missing.

Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField PMC driver")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/platform/mellanox/mlxbf-pmc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 5ec1ad471696..2ad9e2b0493c 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -2262,13 +2262,19 @@ static int mlxbf_pmc_map_counters(struct device *dev)
 
 static int mlxbf_pmc_probe(struct platform_device *pdev)
 {
-	struct acpi_device *acpi_dev = ACPI_COMPANION(&pdev->dev);
-	const char *hid = acpi_device_hid(acpi_dev);
 	struct device *dev = &pdev->dev;
+	struct acpi_device *acpi_dev;
 	struct arm_smccc_res res;
+	const char *hid;
 	guid_t guid;
 	int ret;
 
+	acpi_dev = ACPI_COMPANION(&pdev->dev);
+	if (!acpi_dev)
+		return -ENODEV;
+
+	hid = acpi_device_hid(acpi_dev);
+
 	/* Ensure we have the UUID we expect for this service. */
 	arm_smccc_smc(MLXBF_PMC_SIP_SVC_UID, 0, 0, 0, 0, 0, 0, 0, &res);
 	guid_parse(mlxbf_pmc_svc_uuid_str, &guid);
-- 
2.25.1

