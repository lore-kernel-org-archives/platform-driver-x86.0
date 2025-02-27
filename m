Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757461AC435
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Feb 2025 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675821; cv=none; b=fzemXXjxj4wYzeWRVMRjW968IGGAv/2oUr3oZJXQ1G/Z+6xW/w/RByuIBdBhC6oXzL3+/x8R631xcO6VH9Wqv11Ip1XfZ2alpWvLl1nvGrPLSi68xE6MysP9S2PaZd3goZYyubhQ43anku+n2DsRfr9VotnAKusrW2ql0fVYfBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675821; c=relaxed/simple;
	bh=V0pke1QChMvriYjzkw6I0KHzKXYiWhWPXewCBg6n80s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aAPgq5q2nDelWGFptZ7x315aLaj0OK+zMY50gTDD97rFP6JtAqRJxNQAAQW1gI2bcpKxkgRInaTjp6JeHmgkWsF6yDpgy5YZ4avWT9GVoaOSNGkAbKPExASkTiDwpVLTk2sRs8kjzBT4kyzS+0y3SKoEyCBzqyKU5NYrNnrvk/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y08zOotG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y08zOotG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D0FC4CEDD;
	Thu, 27 Feb 2025 17:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740675820;
	bh=V0pke1QChMvriYjzkw6I0KHzKXYiWhWPXewCBg6n80s=;
	h=From:To:Cc:Subject:Date:From;
	b=Y08zOotGWnG5QqYvM4KdOhaM2ne3iqYVutm49ipPIZ+cyyzMjlolFKYvDIdVtddB6
	 mUkmtzXouGz/GdiPGjuLCAmBWfkxImcvA8IqsiBg79AxIg25UlwvC5igT7epVuWVyA
	 +BE5SpaQojiBo87PRoU09Brf9X4/qzYeOVRXNAtek7EpZYTd378tyMYekGDkgccnEa
	 qpFftB9IOd/Kmj2pTvTkTd+8ubrR3xryBAT80YkVQQgU73VZnsIOZ3MB01LMbpsAuq
	 q6h71Ryww7WcMIezJvu3e5QAkSE1bNBUiCBSx52+w9Qd6OXKzQlJ65TQlLzLQZ4NVI
	 LaAJSBknDdY+w==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	Patil.Reddy@amd.com
Cc: Yijun Shen <Yijun.Shen@dell.com>,
	Richard Gong <richgong@amd.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmf: Initialize and clean up `cb_mutex`
Date: Thu, 27 Feb 2025 11:03:06 -0600
Message-ID: <20250227170308.435862-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

`cb_mutex` was introduced in commit 9e0894d07072e ("platform/x86/amd/pmf:
Enable Custom BIOS Inputs for PMF-TA") to prevent conccurrent access for
BIOS inputs. It however isn't initialized and so on use it may lead to
a NULL pointer dereference.

Add code to initialize on probe and clean up on destroy.

Reported-by: Yijun Shen <Yijun.Shen@dell.com>
Cc: Richard Gong <richgong@amd.com>
Fixes: 9e0894d07072e ("platform/x86/amd/pmf: Enable Custom BIOS Inputs for PMF-TA")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 764cc1fe90ae4..a2cb2d5544f5b 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -452,6 +452,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->lock);
 	mutex_init(&dev->update_mutex);
+	mutex_init(&dev->cb_mutex);
 
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
@@ -477,6 +478,7 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	amd_pmf_dbgfs_unregister(dev);
 	mutex_destroy(&dev->lock);
 	mutex_destroy(&dev->update_mutex);
+	mutex_destroy(&dev->cb_mutex);
 	kfree(dev->buf);
 }
 
-- 
2.43.0

