Return-Path: <SRS0=GDfv=DA=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4AAC2D0A8
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 17:27:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2179D21D43
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 17:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbgIWR1q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Sep 2020 13:27:46 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:35539 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726752AbgIWR1p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Sep 2020 13:27:45 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 23 Sep 2020 20:20:59 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 08NHKtgn020358;
        Wed, 23 Sep 2020 20:20:59 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 3/5] platform_data/mlxreg: Update module license
Date:   Wed, 23 Sep 2020 20:20:51 +0300
Message-Id: <20200923172053.26296-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200923172053.26296-1-vadimp@nvidia.com>
References: <20200923172053.26296-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Update license to SPDX-License.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 include/linux/platform_data/mlxreg.h | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
index 1af9c01563f9..0a727d405a7a 100644
--- a/include/linux/platform_data/mlxreg.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -1,34 +1,6 @@
+/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0 */
 /*
- * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
- * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions are met:
- *
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the distribution.
- * 3. Neither the names of the copyright holders nor the names of its
- *    contributors may be used to endorse or promote products derived from
- *    this software without specific prior written permission.
- *
- * Alternatively, this software may be distributed under the terms of the
- * GNU General Public License ("GPL") version 2 as published by the Free
- * Software Foundation.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
- * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
- * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
- * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
- * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
- * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
- * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
- * POSSIBILITY OF SUCH DAMAGE.
+ * Copyright (C) 2017-2020 Mellanox Technologies Ltd.
  */
 
 #ifndef __LINUX_PLATFORM_DATA_MLXREG_H
-- 
2.11.0

