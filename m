Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44282C433E0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Jan 2021 00:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A07C20758
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Jan 2021 00:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729469AbhARA6v (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 19:58:51 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11102 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730376AbhARA5N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 19:57:13 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DJtbz13Znz15v6m;
        Mon, 18 Jan 2021 08:54:55 +0800 (CST)
Received: from huawei.com (10.175.112.125) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Mon, 18 Jan 2021
 08:55:54 +0800
From:   Yue Zou <zouyue3@huawei.com>
To:     <malattia@linux.it>, <mchehab@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] sony-laptop: Remove unneeded semicolon
Date:   Mon, 18 Jan 2021 01:01:37 +0000
Message-ID: <20210118010137.214378-1-zouyue3@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.112.125]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Remove a superfluous semicolon after function definition.

Signed-off-by: Yue Zou <zouyue3@huawei.com>
---
 include/linux/sony-laptop.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/sony-laptop.h b/include/linux/sony-laptop.h
index 374d0fdb0743..1e3c92feea6e 100644
--- a/include/linux/sony-laptop.h
+++ b/include/linux/sony-laptop.h
@@ -31,7 +31,7 @@
 #if IS_ENABLED(CONFIG_SONY_LAPTOP)
 int sony_pic_camera_command(int command, u8 value);
 #else
-static inline int sony_pic_camera_command(int command, u8 value) { return 0; };
+static inline int sony_pic_camera_command(int command, u8 value) { return 0; }
 #endif
 
 #endif	/* __KERNEL__ */
-- 
2.25.1

