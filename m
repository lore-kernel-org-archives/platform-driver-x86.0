Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037DCC433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 09:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238066AbiKOJS4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 04:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238088AbiKOJSl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 04:18:41 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753A01F2D7
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 01:17:53 -0800 (PST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NBLDY3vLBzRpHG;
        Tue, 15 Nov 2022 17:17:33 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 15 Nov
 2022 17:17:45 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <dvhart@infradead.org>, <andy@infradead.org>, <tglx@linutronix.de>,
        <mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
        <x86@kernel.org>, <hpa@zytor.com>, <david.e.box@linux.intel.com>,
        <hdegoede@redhat.com>, <jarkko.nikula@linux.intel.com>,
        <wsa@kernel.org>, <rafael.j.wysocki@intel.com>,
        <platform-driver-x86@vger.kernel.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH v2] x86/platform/intel/iosf_mbi: Fix error handling in iosf_mbi_init()
Date:   Tue, 15 Nov 2022 09:16:00 +0000
Message-ID: <20221115091600.74246-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

A problem about modprobe iosf_mbi failed is triggered with the following
log given:

 debugfs: Directory 'iosf_sb' with parent '/' already present!

The reason is that iosf_mbi_init() returns pci_register_driver()
directly without checking its return value, if pci_register_driver()
failed, it returns without removing debugfs, resulting the debugfs of
iosf_sb can never be created later.

 iosf_mbi_init()
   iosf_mbi_dbg_init() # create debugfs
   pci_register_driver()
     driver_register()
       bus_add_driver()
         priv = kzalloc(...) # OOM happened
   # return without remove debugfs and destroy workqueue

Fix by removing debugfs and iosf_mbi_pm_qos when pci_register_driver()
returns error.

Fixes: 8dc12f933c9d ("x86/iosf: Add debugfs support")
Fixes: e09db3d241f8 ("x86: baytrail/cherrytrail: Rework and move P-Unit PMIC bus semaphore code")
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
Changes in v2:
- fix typos in commit msg
- change to the suggested error handling style
 arch/x86/platform/intel/iosf_mbi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/intel/iosf_mbi.c b/arch/x86/platform/intel/iosf_mbi.c
index fdd49d70b437..2d64985c53f9 100644
--- a/arch/x86/platform/intel/iosf_mbi.c
+++ b/arch/x86/platform/intel/iosf_mbi.c
@@ -545,11 +545,23 @@ static struct pci_driver iosf_mbi_pci_driver = {
 
 static int __init iosf_mbi_init(void)
 {
+	int ret;
+
 	iosf_debugfs_init();
 
 	cpu_latency_qos_add_request(&iosf_mbi_pm_qos, PM_QOS_DEFAULT_VALUE);
 
-	return pci_register_driver(&iosf_mbi_pci_driver);
+	ret = pci_register_driver(&iosf_mbi_pci_driver);
+	if (ret)
+		goto err_remove;
+
+	return 0;
+
+err_remove:
+	cpu_latency_qos_remove_request(&iosf_mbi_pm_qos);
+	iosf_debugfs_remove();
+
+	return ret;
 }
 
 static void __exit iosf_mbi_exit(void)
-- 
2.17.1

