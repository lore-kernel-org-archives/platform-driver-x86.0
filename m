Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FE121B905;
	Sat,  3 Jan 2026 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767442920; cv=none; b=e4p6glEQ1KF5wiw6+6jOagkWvC20kZpWC7WRQZrs6to9ygqv1pucGf8aNj0zBbRneZYiaXj/fVddTpjb1QxwyuzN0Gtc/QVv6Sc48PV8w08XFbm95PPbb5BUk/QsKCo1ES5RszaykTbB9g4te18z5h5sniF0S5PzWPaZ14dZad4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767442920; c=relaxed/simple;
	bh=qUUoAhKwTnFWbK4nJL1GGSUDC3AsWXIYX1dFUU74ets=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=I4YH5j9trEAh5JmDaMW1hcEFtDxgPH3X5ClWB1r9wCCq2c3c7BiS5mRZX2u3/QG9FBx/ZueNEky35b4zZv1O1VnxRz942/CoslRUFni4CW91ZuuClBhkc4E5jgJEac8H/OrATpntiJxsx1JeFuuC/Ni6oJ50oPBPPMhZf5f4d+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=Vt3Kjdkt; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="Vt3Kjdkt"
Received: from LAPTOP-N070L597.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2f5c4232c;
	Sat, 3 Jan 2026 20:21:53 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus.Elfring@web.de,
	Zilin Guan <zilin@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH v2] platform/x86/amd: Fix memory leak in wbrf_record()
Date: Sat,  3 Jan 2026 12:21:51 +0000
Message-Id: <20260103122151.157174-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b83ce992b03a1kunmb5d8747326353b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSx8aVhlOHhgaTUgZT0gZTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVU
	tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Vt3KjdktWfHde1GWybn26Dm+mLBngWMgazeHHJQu+D63HU9xi1t6lxofL6EGEYjexL3XRswtOZsZxx3ckkEnT9cNDXb1Uv6NlvHqEoDhc5YcspA6i7L0B+NgVtKtlXzAC6dAXCz9hL1Nga7sqVmDkTr9uxVf+5JWmVZU1HsZHHc=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=j2eicwEfxNkK/wyIqR2NBi+A5o50uUq7fZvhjDn926s=;
	h=date:mime-version:subject:message-id:from;

The tmp buffer is allocated using kcalloc() but is not freed if
acpi_evaluate_dsm() fails. This causes a memory leak in the error path.

Fix this by using the scope-based cleanup helper __free() for automatic
resource cleanup. This ensures that both the tmp buffer and the ACPI
object are automatically freed when they go out of scope, simplifying
error handling and preventing leaks.

Fixes: 58e82a62669d ("platform/x86/amd: Add support for AMD ACPI based Wifi band RFI mitigation feature")\
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Suggested-by: Markus Elfring <Markus.Elfring@web.de>
Co-developed-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Jianhao Xu <jianhao.xu@seu.edu.cn>
Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
---
Changes in v2:
- using scope-based cleanup helper __free() for automatic resource cleanup.

 drivers/platform/x86/amd/wbrf.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/amd/wbrf.c b/drivers/platform/x86/amd/wbrf.c
index dd197b3aebe0..4517d139d768 100644
--- a/drivers/platform/x86/amd/wbrf.c
+++ b/drivers/platform/x86/amd/wbrf.c
@@ -39,11 +39,11 @@ static const guid_t wifi_acpi_dsm_guid =
  */
 static BLOCKING_NOTIFIER_HEAD(wbrf_chain_head);
 
+DEFINE_FREE(acpi_object, union acpi_object *, if (_T) ACPI_FREE(_T))
+
 static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ranges_in_out *in)
 {
 	union acpi_object argv4;
-	union acpi_object *tmp;
-	union acpi_object *obj;
 	u32 num_of_ranges = 0;
 	u32 num_of_elements;
 	u32 arg_idx = 0;
@@ -74,7 +74,7 @@ static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ran
 	 */
 	num_of_elements = 2 * num_of_ranges + 2;
 
-	tmp = kcalloc(num_of_elements, sizeof(*tmp), GFP_KERNEL);
+	union acpi_object *tmp __free(kfree) = kcalloc(num_of_elements, sizeof(*tmp), GFP_KERNEL);
 	if (!tmp)
 		return -ENOMEM;
 
@@ -101,25 +101,20 @@ static int wbrf_record(struct acpi_device *adev, uint8_t action, struct wbrf_ran
 		tmp[arg_idx++].integer.value = in->band_list[i].end;
 	}
 
-	obj = acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
-				WBRF_REVISION, WBRF_RECORD, &argv4);
+	union acpi_object *obj __free(acpi_object) =
+		acpi_evaluate_dsm(adev->handle, &wifi_acpi_dsm_guid,
+				  WBRF_REVISION, WBRF_RECORD, &argv4);
 
 	if (!obj)
 		return -EINVAL;
 
-	if (obj->type != ACPI_TYPE_INTEGER) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (obj->type != ACPI_TYPE_INTEGER)
+		return -EINVAL;
 
 	ret = obj->integer.value;
 	if (ret)
 		ret = -EINVAL;
 
-out:
-	ACPI_FREE(obj);
-	kfree(tmp);
-
 	return ret;
 }
 
-- 
2.34.1

