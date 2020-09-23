Return-Path: <SRS0=GDfv=DA=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A0AC4727D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 17:27:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EE2B221F0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 17:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgIWR1q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Sep 2020 13:27:46 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:35541 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726761AbgIWR1p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Sep 2020 13:27:45 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 23 Sep 2020 20:21:01 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 08NHKtgo020358;
        Wed, 23 Sep 2020 20:21:00 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 4/5] platform_data/mlxreg:  Extend core platform structure
Date:   Wed, 23 Sep 2020 20:20:52 +0300
Message-Id: <20200923172053.26296-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200923172053.26296-1-vadimp@nvidia.com>
References: <20200923172053.26296-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add 'capability' field to structure 'mlxreg_core_platform_data'.
The purpose of this filed to indicate  the actual number of the
components within the particular group. Such components could be,
for example the number of the FAN drawers. Some systems are equipped
with FAN drawers with one tachometer inside, others with FAN drawers
with several tachometers inside.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 include/linux/platform_data/mlxreg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 0a727d405a7a..101333fe2b8d 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -109,6 +109,7 @@ struct mlxreg_core_item {
  * @features: supported features of device;
  * @version: implementation version;
  * @identity: device identity name;
+ * @capability: device capability register;
  */
 struct mlxreg_core_platform_data {
 	struct mlxreg_core_data *data;
@@ -117,6 +118,7 @@ struct mlxreg_core_platform_data {
 	u32 features;
 	u32 version;
 	char identity[MLXREG_CORE_LABEL_MAX_SIZE];
+	u32 capability;
 };
 
 /**
-- 
2.11.0

