Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F5BC48BCF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 07:17:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70F246008E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 07:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234156AbhFIHTa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 03:19:30 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:8110 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234118AbhFIHTa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 03:19:30 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G0JJh4Xz6zYrt2;
        Wed,  9 Jun 2021 15:14:44 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 15:17:30 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 9 Jun 2021
 15:17:29 +0800
From:   Baokun Li <libaokun1@huawei.com>
To:     <linux-kernel@vger.kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
CC:     <weiyongjun1@huawei.com>, <yuehaibing@huawei.com>,
        <yangjihong1@huawei.com>, <yukuai3@huawei.com>,
        <libaokun1@huawei.com>, <platform-driver-x86@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next v2] platform/surface: aggregator: Use list_move_tail instead of list_del/list_add_tail in ssh_request_layer.c
Date:   Wed, 9 Jun 2021 15:26:38 +0800
Message-ID: <20210609072638.1358174-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Using list_move_tail() instead of list_del() + list_add_tail() in ssh_request_layer.c.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
V1->V2:
	CC mailist

 .../surface/aggregator/ssh_request_layer.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/surface/aggregator/ssh_request_layer.c b/drivers/platform/surface/aggregator/ssh_request_layer.c
index 52a83a8fcf82..fec2d7af2646 100644
--- a/drivers/platform/surface/aggregator/ssh_request_layer.c
+++ b/drivers/platform/surface/aggregator/ssh_request_layer.c
@@ -863,9 +863,7 @@ static void ssh_rtl_timeout_reap(struct work_struct *work)
 		clear_bit(SSH_REQUEST_SF_PENDING_BIT, &r->state);
 
 		atomic_dec(&rtl->pending.count);
-		list_del(&r->node);
-
-		list_add_tail(&r->node, &claimed);
+		list_move_tail(&r->node, &claimed);
 	}
 	spin_unlock(&rtl->pending.lock);
 
@@ -1204,8 +1202,7 @@ void ssh_rtl_shutdown(struct ssh_rtl *rtl)
 		smp_mb__before_atomic();
 		clear_bit(SSH_REQUEST_SF_QUEUED_BIT, &r->state);
 
-		list_del(&r->node);
-		list_add_tail(&r->node, &claimed);
+		list_move_tail(&r->node, &claimed);
 	}
 	spin_unlock(&rtl->queue.lock);
 
@@ -1238,8 +1235,7 @@ void ssh_rtl_shutdown(struct ssh_rtl *rtl)
 			smp_mb__before_atomic();
 			clear_bit(SSH_REQUEST_SF_PENDING_BIT, &r->state);
 
-			list_del(&r->node);
-			list_add_tail(&r->node, &claimed);
+			list_move_tail(&r->node, &claimed);
 		}
 		spin_unlock(&rtl->pending.lock);
 	}

