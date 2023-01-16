Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D273FC678D9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Jan 2023 13:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbjAPNvM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Jan 2023 08:51:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbjAPNuo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Jan 2023 08:50:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5263E2197E;
        Mon, 16 Jan 2023 05:50:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A52260FDB;
        Mon, 16 Jan 2023 13:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CF4C43330;
        Mon, 16 Jan 2023 13:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673877041;
        bh=ggk54ncazk/OvpoVopO401NRPXtbra5OsVaBMxjoHtE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I/MJ4XiEWMNX1n/mFVQna8r9fFJUYXORoumXe4znvqaceuikdzQw77rAnz2v9g8/h
         OpAH0kyZaZwdf/Q6OBpC8hBpkKEUoyEFj47at1nmrT2LZlA4t3su1m/VcoK3xpyRlu
         rXfZiBdiU7jtv50ODGMmXKZenXWb2apkKf9U/N05j6VjdALzedKp7oZlnvu+Whi3w0
         DyiqnBtAsHkOmcihxbOsIoe9iZKg9jAXMHvvQ7rhHkhzsuieNBV1HkrlTcMRbgpmXM
         5OBru3m2h1spMeop4NRWTuh83tHuN21ZH+MVD2vs/hgfiH/S7t6/duY1K5BeMWd0vW
         SXz0KzsulH7Hw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1pHPt6-0003vG-ID; Mon, 16 Jan 2023 14:51:00 +0100
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc:     x86@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: [PATCH v4 12/19] x86/apic: Use irq_domain_create_hierarchy()
Date:   Mon, 16 Jan 2023 14:50:37 +0100
Message-Id: <20230116135044.14998-13-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230116135044.14998-1-johan+linaro@kernel.org>
References: <20230116135044.14998-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use the irq_domain_create_hierarchy() helper to create the hierarchical
domain, which both serves as documentation and avoids poking at
irqdomain internals.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/x86/platform/uv/uv_irq.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/platform/uv/uv_irq.c b/arch/x86/platform/uv/uv_irq.c
index 1a536a187d74..ee21d6a36a80 100644
--- a/arch/x86/platform/uv/uv_irq.c
+++ b/arch/x86/platform/uv/uv_irq.c
@@ -166,10 +166,9 @@ static struct irq_domain *uv_get_irq_domain(void)
 	if (!fn)
 		goto out;
 
-	uv_domain = irq_domain_create_tree(fn, &uv_domain_ops, NULL);
-	if (uv_domain)
-		uv_domain->parent = x86_vector_domain;
-	else
+	uv_domain = irq_domain_create_hierarchy(x86_vector_domain, 0, 0, fn,
+						&uv_domain_ops, NULL);
+	if (!uv_domain)
 		irq_domain_free_fwnode(fn);
 out:
 	mutex_unlock(&uv_lock);
-- 
2.38.2

