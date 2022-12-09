Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52070C3DA71
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Dec 2022 14:05:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbiLIOFY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Dec 2022 09:05:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiLIOFS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Dec 2022 09:05:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497B97868B;
        Fri,  9 Dec 2022 06:05:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E5910B82879;
        Fri,  9 Dec 2022 14:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F51C433A7;
        Fri,  9 Dec 2022 14:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670594713;
        bh=niOEf+y/CPs0Wgq9no1nSEQwpCfRmMUIj1MEHaqp6o0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qMh5hmBZHRacWKxQ3PhjUYbyvKsBDG6k/6Ha4xNVKmoF0sgZWrXE30p010cv9xPbX
         U7mmlRkKAIpZMC/0ZhNFREAmOwYAuOedHoVxcEpAcqnQ6jvlqQVp/QXeBohqLpsu7L
         AGYEeDPju+UkCyuAeZGdkWg8VPRbtbrN7P4V24oCGQ2PjPBJGD0o/AqlI+izZeNe3z
         njngGonkfbj8pebR4ZOOqF4knVeISyx6YUQMUZvjxiKcxdtAw4W3HT8i9X637hlbDW
         Vg8I5CGt/E3fGd2kQOllmkhzVuWUVJJj9al7te1/JqBBgfG/Zai7rPTtPybMIUv7U0
         29QVlwJLrQBBQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1p3e0I-0000RV-F7; Fri, 09 Dec 2022 15:05:30 +0100
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 04/19] irqdomain: Fix association race
Date:   Fri,  9 Dec 2022 15:01:35 +0100
Message-Id: <20221209140150.1453-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221209140150.1453-1-johan+linaro@kernel.org>
References: <20221209140150.1453-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The sanity check for an already mapped virq was done outside of the
irq_domain_mutex-protected section which meant that an (unlikely) racing
association may not be detected.

Fix this by factoring out the association implementation, which will
also be used in follow-on changes to rework the locking.

Fixes: ddaf144c61da ("irqdomain: Refactor irq_domain_associate_many()")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 kernel/irq/irqdomain.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index dfd60bd49109..b2087f55a1ac 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -558,8 +558,8 @@ static void irq_domain_disassociate(struct irq_domain *domain, unsigned int irq)
 	irq_domain_clear_mapping(domain, hwirq);
 }
 
-int irq_domain_associate(struct irq_domain *domain, unsigned int virq,
-			 irq_hw_number_t hwirq)
+static int __irq_domain_associate(struct irq_domain *domain, unsigned int virq,
+				  irq_hw_number_t hwirq)
 {
 	struct irq_data *irq_data = irq_get_irq_data(virq);
 	int ret;
@@ -572,7 +572,6 @@ int irq_domain_associate(struct irq_domain *domain, unsigned int virq,
 	if (WARN(irq_data->domain, "error: virq%i is already associated", virq))
 		return -EINVAL;
 
-	mutex_lock(&irq_domain_mutex);
 	irq_data->hwirq = hwirq;
 	irq_data->domain = domain;
 	if (domain->ops->map) {
@@ -589,19 +588,29 @@ int irq_domain_associate(struct irq_domain *domain, unsigned int virq,
 			}
 			irq_data->domain = NULL;
 			irq_data->hwirq = 0;
-			mutex_unlock(&irq_domain_mutex);
 			return ret;
 		}
 	}
 
 	domain->mapcount++;
 	irq_domain_set_mapping(domain, hwirq, irq_data);
-	mutex_unlock(&irq_domain_mutex);
 
 	irq_clear_status_flags(virq, IRQ_NOREQUEST);
 
 	return 0;
 }
+
+int irq_domain_associate(struct irq_domain *domain, unsigned int virq,
+			 irq_hw_number_t hwirq)
+{
+	int ret;
+
+	mutex_lock(&irq_domain_mutex);
+	ret = __irq_domain_associate(domain, virq, hwirq);
+	mutex_unlock(&irq_domain_mutex);
+
+	return ret;
+}
 EXPORT_SYMBOL_GPL(irq_domain_associate);
 
 void irq_domain_associate_many(struct irq_domain *domain, unsigned int irq_base,
-- 
2.37.4

