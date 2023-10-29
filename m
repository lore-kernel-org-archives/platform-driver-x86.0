Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE85C4167B
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Oct 2023 23:06:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbjJ2XGT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 29 Oct 2023 19:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231991AbjJ2XFq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 29 Oct 2023 19:05:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982136A7D;
        Sun, 29 Oct 2023 16:01:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC51C433C7;
        Sun, 29 Oct 2023 22:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698620398;
        bh=QjzhNeZ1skYvKCj+5xx8iOynDv8Qdyy8qRRAcFnICec=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PeZrj9lzDGo5U80kENxUpC83mC0Q2VCG+EcQUTsSQk+Pgvf1eVNh+lW/dlWODxM7w
         C+OxGNg9iSKgDuSfcX3mXMuv2EUFc5LdCOhIYViWCYLZQdoABYvnnoP/u1F/lzTNhQ
         DZoeUZtQdCoxfwaPbZOPKz/CPYZE/3L64ANyZJqzNiubMgkQIoFBVERm9/HU8P2aQg
         LibKNK7On90rxOX88fBZU/lwvDqh6gJ/lDH/pGI8fkFr2kDxC/K4hD+OvFuac6D7mt
         NR8LgbpoCPIx0e54zEJ2RJwpEG4fffspJOdWFvq0cdx4vAmJ5bVee1hVkh4gksRVG1
         GLtw36NNAFFaw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Liming Sun <limings@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>, ilpo.jarvinen@linux.intel.com,
        markgross@kernel.org, vadimp@nvidia.com,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 26/28] platform/mellanox: mlxbf-tmfifo: Fix a warning message
Date:   Sun, 29 Oct 2023 18:59:01 -0400
Message-ID: <20231029225916.791798-26-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231029225916.791798-1-sashal@kernel.org>
References: <20231029225916.791798-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.137
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Liming Sun <limings@nvidia.com>

[ Upstream commit 99c09c985e5973c8f0ad976ebae069548dd86f12 ]

This commit fixes the smatch static checker warning in function
mlxbf_tmfifo_rxtx_word() which complains data not initialized at
line 634 when IS_VRING_DROP() is TRUE.

Signed-off-by: Liming Sun <limings@nvidia.com>
Link: https://lore.kernel.org/r/20231012230235.219861-1-limings@nvidia.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/mellanox/mlxbf-tmfifo.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index 194f3205e5597..767f4406e55f1 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -588,24 +588,25 @@ static void mlxbf_tmfifo_rxtx_word(struct mlxbf_tmfifo_vring *vring,
 
 	if (vring->cur_len + sizeof(u64) <= len) {
 		/* The whole word. */
-		if (!IS_VRING_DROP(vring)) {
-			if (is_rx)
+		if (is_rx) {
+			if (!IS_VRING_DROP(vring))
 				memcpy(addr + vring->cur_len, &data,
 				       sizeof(u64));
-			else
-				memcpy(&data, addr + vring->cur_len,
-				       sizeof(u64));
+		} else {
+			memcpy(&data, addr + vring->cur_len,
+			       sizeof(u64));
 		}
 		vring->cur_len += sizeof(u64);
 	} else {
 		/* Leftover bytes. */
-		if (!IS_VRING_DROP(vring)) {
-			if (is_rx)
+		if (is_rx) {
+			if (!IS_VRING_DROP(vring))
 				memcpy(addr + vring->cur_len, &data,
 				       len - vring->cur_len);
-			else
-				memcpy(&data, addr + vring->cur_len,
-				       len - vring->cur_len);
+		} else {
+			data = 0;
+			memcpy(&data, addr + vring->cur_len,
+			       len - vring->cur_len);
 		}
 		vring->cur_len = len;
 	}
-- 
2.42.0

