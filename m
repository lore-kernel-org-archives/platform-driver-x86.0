From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] intel_ips: fix error handling for debugfs_create_dir()
Date: Fri, 19 Jul 2013 08:51:44 +0300
Message-ID: <20130719055144.GE9729@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:25024 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965200Ab3GSFv7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 19 Jul 2013 01:51:59 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

If debugfs is not enabled then debugfs_create_dir() returns
ERR_PTR(-ENODEV).  Also my static checker complains that we are trying
to print the error code, but it's is always just NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 18dcb58..4416d92 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1328,7 +1328,7 @@ static void ips_debugfs_init(struct ips_driver *ips)
 	int i;
 
 	ips->debug_root = debugfs_create_dir("ips", NULL);
-	if (!ips->debug_root) {
+	if (IS_ERR_OR_NULL(ips->debug_root)) {
 		dev_err(&ips->dev->dev,
 			"failed to create debugfs entries: %ld\n",
 			PTR_ERR(ips->debug_root));
@@ -1343,7 +1343,7 @@ static void ips_debugfs_init(struct ips_driver *ips)
 		ent = debugfs_create_file(node->name, S_IFREG | S_IRUGO,
 					  ips->debug_root, node,
 					  &ips_debugfs_ops);
-		if (!ent) {
+		if (IS_ERR_OR_NULL(ent)) {
 			dev_err(&ips->dev->dev,
 				"failed to create debug file: %ld\n",
 				PTR_ERR(ent));
