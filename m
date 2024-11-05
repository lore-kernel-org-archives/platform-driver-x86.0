Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E571D63CF
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 12:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730808767; cv=none; b=aRERtBRdEks+VVMz4+KPo7nc3yyCFFqS5SBwGkUwln9e8ySXyOmTpJu7SdG2bhJCxYscbUoQzdsH8AlynHA4q8gEjaXUPdnV6ScywyqOpwO5/GZsCm4q+QyGOxDtEob4c1mrcPR1M+ODHnR3/1a6jH8G2o1ZG3IC5rK8OJ2M04k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730808767; c=relaxed/simple;
	bh=yAEn1c9V1atWm8MoKpQnKH89PtgvTybNuZNR7bo91uA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gU41tjSLm4s1dVqrO1ngbfVLVUST6H+4gFRnH+vsRlBhBP1jYUB4eV+uwLTRBrRjnNwWlCrSwACMNH2981rLvrqo9qBGEIANavIMW8t68JnepQXYfL7VqEnCcsOmOGYliyI1pZfTO1t1OmmTPypqNWwJVsLkuCJuHgeNccuRo4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XjRxv5MPZz1SDyx;
	Tue,  5 Nov 2024 20:10:59 +0800 (CST)
Received: from dggpeml500024.china.huawei.com (unknown [7.185.36.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 3665E1402E2;
	Tue,  5 Nov 2024 20:12:40 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 5 Nov
 2024 20:12:39 +0800
From: Yuan Can <yuancan@huawei.com>
To: <jithu.joseph@intel.com>, <ashok.raj.linux@gmail.com>,
	<tony.luck@intel.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <darcari@redhat.com>,
	<platform-driver-x86@vger.kernel.org>
CC: <yuancan@huawei.com>
Subject: [PATCH] platform/x86/intel/ifs: Add missing destroy_work_on_stack()
Date: Tue, 5 Nov 2024 20:07:28 +0800
Message-ID: <20241105120728.21646-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500024.china.huawei.com (7.185.36.10)

This commit add missed destroy_work_on_stack() operations for
local_work.w in scan_chunks_sanity_check().

Fixes: 3279decb2c3c ("platform/x86/intel/ifs: Annotate work queue on stack so object debug does not complain")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/platform/x86/intel/ifs/load.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/ifs/load.c b/drivers/platform/x86/intel/ifs/load.c
index de54bd1a5970..2faeb1ffbd92 100644
--- a/drivers/platform/x86/intel/ifs/load.c
+++ b/drivers/platform/x86/intel/ifs/load.c
@@ -347,6 +347,7 @@ static int scan_chunks_sanity_check(struct device *dev)
 		INIT_WORK_ONSTACK(&local_work.w, copy_hashes_authenticate_chunks);
 		schedule_work_on(cpu, &local_work.w);
 		wait_for_completion(&ifs_done);
+		destroy_work_on_stack(&local_work.w);
 		if (ifsd->loading_error) {
 			ret = -EIO;
 			goto out;
-- 
2.17.1

