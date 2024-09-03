Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9044080C02
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Sep 2024 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373724; cv=none; b=ufvhy0u9ojC0V3NXbOVECvrCyf7WybtCe1JgOGGiK8BLhVYWZxKxpeFslgE7Nq5KQEO7vXClOPaW1+bnUo+WequHJ0ZfDhZLOQZFLTXTNuKZ7uo5lStca5xKBusSo6B8K8QOSFQCPjhX2E3HXWzssDjfVUQ9Dq1BfuRmayOfGCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373724; c=relaxed/simple;
	bh=j+YKgqN4bTWbs7/xF12PWj0qZf/PYKhk18vtQIx99nk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UYmYfa57x4cHq2QKl/rm7Ly85uhCwQKkbi8DwiYU6bSYjU6AXrZHadRkx1zH70d9hKWIulwDxttoIqcpSmVCPfKdruSKRTma+OknIuTlawcj+EfmxB8fbbbx2udjKmTpWqg69pGXcOoW8v5D0FH/jWFATMsUaJpP1XU6Epnlz6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wynz74LK5zyR1q;
	Tue,  3 Sep 2024 22:28:03 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id B39AA1800A7;
	Tue,  3 Sep 2024 22:28:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 3 Sep
 2024 22:28:40 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>
CC: <lizetao1@huawei.com>, <platform-driver-x86@vger.kernel.org>
Subject: [PATCH -next] platform/olpc: Remove redundant null pointer checks in olpc_ec_setup_debugfs()
Date: Tue, 3 Sep 2024 22:37:14 +0800
Message-ID: <20240903143714.2004947-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Since the debugfs_create_dir() never returns a null pointer, checking
the return value for a null pointer is redundant, and using IS_ERR is
safe enough.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/platform/olpc/olpc-ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/olpc/olpc-ec.c b/drivers/platform/olpc/olpc-ec.c
index 921520475ff6..66287a2ddbf3 100644
--- a/drivers/platform/olpc/olpc-ec.c
+++ b/drivers/platform/olpc/olpc-ec.c
@@ -332,7 +332,7 @@ static struct dentry *olpc_ec_setup_debugfs(void)
 	struct dentry *dbgfs_dir;
 
 	dbgfs_dir = debugfs_create_dir("olpc-ec", NULL);
-	if (IS_ERR_OR_NULL(dbgfs_dir))
+	if (IS_ERR(dbgfs_dir))
 		return NULL;
 
 	debugfs_create_file("cmd", 0600, dbgfs_dir, NULL, &ec_dbgfs_ops);
-- 
2.34.1

