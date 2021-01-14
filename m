Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFA7C433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jan 2021 08:08:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 491F82343F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jan 2021 08:08:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbhANIHS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Jan 2021 03:07:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:59016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728124AbhANIGW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Jan 2021 03:06:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD98123A57;
        Thu, 14 Jan 2021 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610611500;
        bh=aM+KUU8ND9pyof4k4ykSf1dVmSEm8guTu48Zq/aOrf0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u4NqcvP0nUPY2+HwZQCa3P3Qty+DCPQOpt2FxL8ZXN0PQcmWo7Le3ZdKbcG/SOi6s
         MzYDcHleMrNAfTdNkYoK5YlEkqvheOOU78YjjXiPDQb0MjMys7pQTt2+6Ktcv275d2
         g+KywtcbpVfqw+Ku0Dtur8A6BSnx7MWq0Qm04Jl4UoKIVv5uIpAgvBFEFXpp/ptvs1
         WTeBcbUCFuKtMRZaOYQPy6BaepHq9KxJMTM+HjtcF5fKWugBEaiB5sOccyfpebX+5/
         Hfq8OpNqLQAkfm0mS9oQvjfUM/df9MiQCG+98pYeMPEAGa9Bzpi2FVLdiTIUlesbdk
         /18zqSh2nVQVQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kzxco-00EQ74-Hy; Thu, 14 Jan 2021 09:04:58 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v6 16/16] platform/surface: aggregator: fix a kernel-doc markup
Date:   Thu, 14 Jan 2021 09:04:52 +0100
Message-Id: <4a6bf33cfbd06654d78294127f2b6d354d073089.1610610937.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610610937.git.mchehab+huawei@kernel.org>
References: <cover.1610610937.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

A function has a different name between their prototype
and its kernel-doc markup:

	../drivers/platform/surface/aggregator/ssh_request_layer.c:1065: warning: expecting prototype for ssh_rtl_tx_start(). Prototype was for ssh_rtl_start() instead

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/platform/surface/aggregator/ssh_request_layer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/aggregator/ssh_request_layer.c b/drivers/platform/surface/aggregator/ssh_request_layer.c
index bb1c862411a2..25db4d638cfa 100644
--- a/drivers/platform/surface/aggregator/ssh_request_layer.c
+++ b/drivers/platform/surface/aggregator/ssh_request_layer.c
@@ -1056,7 +1056,7 @@ void ssh_rtl_destroy(struct ssh_rtl *rtl)
 }
 
 /**
- * ssh_rtl_tx_start() - Start request transmitter and receiver.
+ * ssh_rtl_start() - Start request transmitter and receiver.
  * @rtl: The request transport layer.
  *
  * Return: Returns zero on success, a negative error code on failure.
-- 
2.29.2

