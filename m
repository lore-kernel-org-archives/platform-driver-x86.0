Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A98C1E50E;
	Tue,  6 Jan 2026 09:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690828; cv=none; b=sDV+Tpuwk5Xycz93sR//g58G8zy3A/5XU4j2khr1ANCDK//XTzcSgc5vvUY9SyVgVs9StpvefxsfnsGIHqOMkiq9xbwBUZFnp5Z4RnBz8UifoTA0Hdyb+AAQsGomU76ZJoifSnaltNJmvoHdq8J1ZRy0ljxTe7+iOKmdAFnFEW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690828; c=relaxed/simple;
	bh=j8j2HJLnlGAvwhguVpmYr3QaeSd+zsWMqTHegcbG8Vk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=jR60VV7aF4CYpRmLTMbdzHCwonwVvlpQ+Mf7NFj9Sz4kibG01VSXhnvcXVF0VeKgxmtiwAk9frfXcUVKW0n5vVYOP02htdkZDraOyX3jOON73xNMuEayhzC6Gf84TroolqNuLxUW9CdJUw4ykhmqMemf6rPN7zMddp0l5dJUces=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=BBzyBv8D; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="BBzyBv8D"
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2fa9d97f6;
	Tue, 6 Jan 2026 17:13:36 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH v3 1/2] platform/x86/amd: Fix memory leak in wbrf_record()
Date: Tue,  6 Jan 2026 09:13:17 +0000
Message-Id: <20260106091318.747019-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b92954cfc03a1kunmf48217a63a7edf
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGh9JVk5KGR5LGUoZTkJLGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZS1VLVUtVS1kG
DKIM-Signature: a=rsa-sha256;
	b=BBzyBv8DSC9RmcWXc1/NkYpjCU3jg+I5CIWAPwo+qwkNdt1yJsvOLKnIOM9+TwTwOPhn9yDKSZumgB9AaaAwOjBm7k3GJih7icYhRDWil4Idr2nspmdR5utr7kUBqDSUVlu8IT+fGnQJWyFY/ntujdLu4UqxV+DcayZtm5DH68I=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=75NhXWv741GtNG9oPUQo3nSpJ3eDzFRK0Ih38qcSNOQ=;
	h=date:mime-version:subject:message-id:from;

The tmp buffer is allocated using kcalloc() but is not freed if
acpi_evaluate_dsm() fails. This causes a memory leak in the error path.

Fix this by explicitly freeing the tmp buffer in the error handling
path of acpi_evaluate_dsm().

Fixes: 58e82a62669d ("platform/x86/amd: Add support for AMD ACPI based Wifi band RFI mitigation feature")
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Co-developed-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
Changes in v3:
- Split from v2 to separate the fix from the cleanup.

Changes in v2:
- Use scope-based cleanup helper __free() for automatic resource cleanup.

 drivers/platform/x86/amd/wbrf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/wbrf.c b/drivers/platform/x86/amd/wbrf.c
index dd197b3aebe0..0f58d252b620 100644
--- a/drivers/platform/x86/amd/wbrf.c
+++ b/drivers/platform/x86/amd/wbrf.c
@@ -104,8 +104,10 @@ static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ran
 	obj = acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
 				WBRF_REVISION, WBRF_RECORD, &argv4);
 
-	if (!obj)
+	if (!obj) {
+		kfree(tmp);
 		return -EINVAL;
+	}
 
 	if (obj->type != ACPI_TYPE_INTEGER) {
 		ret = -EINVAL;
-- 
2.34.1

