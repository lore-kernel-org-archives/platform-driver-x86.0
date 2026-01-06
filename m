Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EB62D5922;
	Tue,  6 Jan 2026 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690839; cv=none; b=s0cJX1g/Z/t2LL4T3lQ2bgWn82zTDZA6GDUW/qCmJ3Dus5Bqqkbrr4eDJ404qY/Xu4kdawymaWOQEFVlt27RM+VyFaBOAb3LZ5g/CbikzGLsJIybytjEh1FBSZ1aXUoXwZBVZl7vd3gkrsbKPDpjwhmaO4l1GmilwlP2a5Smhlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690839; c=relaxed/simple;
	bh=cY9XnpQG8CT4AxH88OevZ9zAmmZHR85Fk15Qd4qkFHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aVbFPokgBpsUNSwEW+Ve5momjBGAPJjy3k+XRYP37229sMnHHmt7EJu+SmRb+dyusfTVQsazOYPQFEVtewZzBrt43ghgxkGTZXK2idVyMj514AaUjrgyK2hbwKJYImvY9HG8QS+uiWahiSoJsQzFc96GY47dFjj1uel8yleU4sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=Un8Yl/nE; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="Un8Yl/nE"
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2fa9d9808;
	Tue, 6 Jan 2026 17:13:53 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zilin Guan <zilin@seu.edu.cn>,
	Markus Elfring <Markus.Elfring@web.de>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH v3 2/2] platform/x86/amd: Use scope-based cleanup for wbrf_record()
Date: Tue,  6 Jan 2026 09:13:18 +0000
Message-Id: <20260106091318.747019-2-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106091318.747019-1-zilin@seu.edu.cn>
References: <20260106091318.747019-1-zilin@seu.edu.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b92958ddb03a1kunmf48217a63a7f2f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGRpJVk0YH08ZSE1OTB5ISVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZS1VLVUtVS1kG
DKIM-Signature: a=rsa-sha256;
	b=Un8Yl/nEL09qxLTc5tjX6pGnwOR/jUVdJ9AHN8uw2Qbv74T7uSTPQNhlKAVQ18ys9VNcg0yMsMurpeegxmgaK39Z77j0AGyvvqFYzI6Y/TbwjiVkJWDyUeRmaJsWdttLOWBFxuei6CbrkAWzHdB6F2sTsEbnvdt+18ZUahCQxZQ=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=V4u+pzBHf87XNUZ0XohLkF8xYq/77bi7Z/FBqPAd6+s=;
	h=date:mime-version:subject:message-id:from;

Simplify resource management in wbrf_record() by using the scope-based
cleanup helper __free(). This ensures that the tmp and obj are
automatically freed when they go out of scope, eliminating the need for
explicit error handling labels and manual freeing.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Suggested-by: Markus Elfring <Markus.Elfring@web.de>
Co-developed-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
Changes in v3:
- Split from v2.
- Use __free(kfree) for 'obj' instead of adding a new DEFINE_FREE() macro.

Changes in v2:
- Use scope-based cleanup helper __free() for automatic resource cleanup.

 drivers/platform/x86/amd/wbrf.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/amd/wbrf.c b/drivers/platform/x86/amd/wbrf.c
index 0f58d252b620..dc10d12bc80d 100644
--- a/drivers/platform/x86/amd/wbrf.c
+++ b/drivers/platform/x86/amd/wbrf.c
@@ -42,8 +42,6 @@ static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
 static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ranges_in_out *in)
 {
 	union acpi_object argv4;
-	union acpi_object *tmp;
-	union acpi_object *obj;
 	u32 num_of_ranges = 0;
 	u32 num_of_elements;
 	u32 arg_idx = 0;
@@ -74,7 +72,7 @@ static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ran
 	 */
 	num_of_elements = 2 * num_of_ranges + 2;
 
-	tmp = kcalloc(num_of_elements, sizeof(*tmp), GFP_KERNEL);
+	union acpi_object *tmp __free(kfree) = kcalloc(num_of_elements, sizeof(*tmp), GFP_KERNEL);
 	if (!tmp)
 		return -ENOMEM;
 
@@ -101,26 +99,19 @@ static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ran
 		tmp[arg_idx++].integer.value = in->band_list[i].end;
 	}
 
-	obj = acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
-				WBRF_REVISION, WBRF_RECORD, &argv4);
+	union acpi_object *obj __free(kfree) =
+		acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
+				  WBRF_REVISION, WBRF_RECORD, &argv4);
 
-	if (!obj) {
-		kfree(tmp);
+	if (!obj)
 		return -EINVAL;
-	}
 
-	if (obj->type != ACPI_TYPE_INTEGER) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (obj->type != ACPI_TYPE_INTEGER)
+		return -EINVAL;
 
 	ret = obj->integer.value;
 	if (ret)
-		ret = -EINVAL;
-
-out:
-	ACPI_FREE(obj);
-	kfree(tmp);
+		return -EINVAL;
 
 	return ret;
 }
-- 
2.34.1

