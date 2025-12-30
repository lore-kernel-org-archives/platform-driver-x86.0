Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7363D22068D;
	Tue, 30 Dec 2025 06:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767077016; cv=none; b=Ek9MIt/AakRKN/8pT0esrGZHvhEL21dUDlVWuRFcgW0YvLAOzv2dryXYxKPo4a1oJMRjX+nTQ0/cP+uRl+KO5xsPxcXZKEH3q0K0Fs/ewkRNeHN0B7jhX3zOyhIzp1SuBJPaEdN/dQXh8EdsYy3ssEiWwduNOTc5LpltwVqQtDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767077016; c=relaxed/simple;
	bh=4D6Wp3Ou3ZOPcEHv/0PfsT/KuLqwGBa7tb4vrk8eKcM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jd6AHkAwMjTc/5DVj8J3bnrqwARhNPxGB0txGLLSsXpIZaPP/MNfPEXKabTsBWdF9p5IQS6r0nCkSGd3yMGqQL2TfyQIHu9fWPo4v99n7dWaWAHkln7myDU/StGwH39rhfJrosHZgYe2VMqNDekFkjgdnhnV2Sf82WYrNeFp6B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=kY2e7Fxf; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="kY2e7Fxf"
Received: from LAPTOP-N070L597.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2efe9d7e1;
	Tue, 30 Dec 2025 14:43:28 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH] platform/x86/amd: Fix memory leak in wbrf_record()
Date: Tue, 30 Dec 2025 06:43:25 +0000
Message-Id: <20251230064325.1036637-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b6dff549003a1kunm10289fb714dcaa
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUJCVhhOSBlPHxkeThpMSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=kY2e7Fxf2Up8k5fs2OM+UiEGkhGRC1jyohZE8CnrZV1OeHPEef6FjCwrQOxhOFWVGo9mNuEupQr9u23NNrXcyA1IjeieqXa4HRyW9/WnqHxLxpxJmI3rW84M2O+pp0w5vTKYHgksAwJ+0RuV2KRyNTkeGJiKRn7pmIxPDIF4QJA=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=T/759eC1LFN+Kw7dj2+5GV07Bovnjmur0FzryAndi+k=;
	h=date:mime-version:subject:message-id:from;

The tmp buffer is allocated using kcalloc() but is not freed if
acpi_evaluate_dsm() fails. This causes a memory leak in the error path.

Fix this by adding a free_tmp label and jumping to it when obj is NULL,
ensuring tmp is properly freed.

Fixes: 58e82a62669d ("platform/x86/amd: Add support for AMD ACPI based Wifi band RFI mitigation feature")
Co-developed-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
 drivers/platform/x86/amd/wbrf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/wbrf.c b/drivers/platform/x86/amd/wbrf.c
index dd197b3aebe0..b35e9369b62a 100644
--- a/drivers/platform/x86/amd/wbrf.c
+++ b/drivers/platform/x86/amd/wbrf.c
@@ -104,8 +104,10 @@ static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ran
 	obj = acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
 				WBRF_REVISION, WBRF_RECORD, &argv4);
 
-	if (!obj)
-		return -EINVAL;
+	if (!obj) {
+		ret = -EINVAL;
+		goto free_tmp;
+	}
 
 	if (obj->type != ACPI_TYPE_INTEGER) {
 		ret = -EINVAL;
@@ -118,6 +120,7 @@ static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ran
 
 out:
 	ACPI_FREE(obj);
+free_tmp:
 	kfree(tmp);
 
 	return ret;
-- 
2.34.1

