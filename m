Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0064FC6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Mar 2023 03:33:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjCVDdJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Mar 2023 23:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbjCVDdH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Mar 2023 23:33:07 -0400
Received: from m126.mail.126.com (m126.mail.126.com [220.181.12.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4E84340FD
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Mar 2023 20:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=OOvqj
        nANFhM/5I0aa7j5Vctk+HbLhhfTKSBEqkAdaxA=; b=aAGumLQg76ub4IPlb+Mt1
        LUEhpCrN4BafA6au8Q97449Cv17B0AHT4A52Xl6T3PHry3/PyrWiDdvOLzfVw2Ai
        9lY6jHDJsBbyHDvWxUXRrRgvZNkRemRSXaImhqmlzCCFZA1y4Wzpxqy/xMfYb17G
        AZUxwL+N8gW15gvtic60cc=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wB3JZRydhpk7pOZAQ--.58969S2;
        Wed, 22 Mar 2023 11:30:59 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     luzmaximilian@gmail.com, hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, windhl@126.com
Subject: [PATCH] platform/surface: aggregator: Add missing fwnode_handle_put()
Date:   Wed, 22 Mar 2023 11:30:57 +0800
Message-Id: <20230322033057.1855741-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB3JZRydhpk7pOZAQ--.58969S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr1kuFy8ZFy5JFWDJw4UXFb_yoWDKrcEgr
        4jganrJw18GFn2yrn2yw4SgrySqr4YgFWfAFyftrWSv345Xa9xXr1jvF95W347Zr4Yvryr
        W3yqyrWfAry3WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_LIDPUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizho6F18RQrG-ugAAsB
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In fwnode_for_each_child_node(), we should add
fwnode_handle_put() when break out of the iteration
fwnode_for_each_child_node() as it will automatically
increase and decrease the refcounter.

Fixes: fc622b3d36e6 ("platform/surface: Set up Surface Aggregator device registry")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/platform/surface/aggregator/bus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/surface/aggregator/bus.c b/drivers/platform/surface/aggregator/bus.c
index de539938896e..b501a79f2a08 100644
--- a/drivers/platform/surface/aggregator/bus.c
+++ b/drivers/platform/surface/aggregator/bus.c
@@ -485,8 +485,10 @@ int __ssam_register_clients(struct device *parent, struct ssam_controller *ctrl,
 		 * device, so ignore it and continue with the next one.
 		 */
 		status = ssam_add_client_device(parent, ctrl, child);
-		if (status && status != -ENODEV)
+		if (status && status != -ENODEV) {
+			fwnode_handle_put(child);
 			goto err;
+		}
 	}
 
 	return 0;
-- 
2.25.1

