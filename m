Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0976AC4321E
	for <platform-driver-x86@archiver.kernel.org>; Sat, 19 Nov 2022 02:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234892AbiKSCVA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Nov 2022 21:21:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234876AbiKSCUN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Nov 2022 21:20:13 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404A7B6B1E;
        Fri, 18 Nov 2022 18:14:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 914776283D;
        Sat, 19 Nov 2022 02:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A07C43152;
        Sat, 19 Nov 2022 02:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668824066;
        bh=7pe1PkZe/SrrO2Y2GMqOMFfTCp6zaav9Mb6qW8e5Saw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZoiIF1b62q/CUMPd2hmhP6R+/bfTmBUTF1WFKoDQgsjgdInoE4qd7m1jI4va4cp1z
         YAr+F1JXJ+Oq341Gl26wfJ0XAad6KyZFch2eRfEdg7BWcZHhvSWcYhOpJwbhy56WTp
         SVKWDMU7oAtGavyl8dShnzUt/VLr4os/BxSoxKRyyxlXpnLuWeqtc79tBh2nV56ug9
         zNRJT49SKONnA11XP4wnZuKKTHIg6jns7QUCr/JIHf+11S1lViYFM2GR4/h3ei4qfY
         64jRzC3EvCescaW1fq+oYcetRlN0HOX0/ozTWtbrplOMo5IiJ9Cyp5XBqUmmVwgYEp
         elN/DJ5Xu298A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Ivan Hu <ivan.hu@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>, alex.hung@canonical.com,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 17/27] platform/x86/intel/hid: Add some ACPI device IDs
Date:   Fri, 18 Nov 2022 21:13:42 -0500
Message-Id: <20221119021352.1774592-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021352.1774592-1-sashal@kernel.org>
References: <20221119021352.1774592-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Ivan Hu <ivan.hu@canonical.com>

[ Upstream commit a977ece5773b6746b814aac410da4776023db239 ]

Add INTC1076 (JasonLake), INTC1077 (MeteorLake) and INTC1078 (RaptorLake)
devices IDs.

Signed-off-by: Ivan Hu <ivan.hu@canonical.com>
Link: https://lore.kernel.org/r/20221102020548.5225-1-ivan.hu@canonical.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel/hid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index d7d6782c40c2..4d1c78635114 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -27,6 +27,9 @@ static const struct acpi_device_id intel_hid_ids[] = {
 	{"INTC1051", 0},
 	{"INTC1054", 0},
 	{"INTC1070", 0},
+	{"INTC1076", 0},
+	{"INTC1077", 0},
+	{"INTC1078", 0},
 	{"", 0},
 };
 MODULE_DEVICE_TABLE(acpi, intel_hid_ids);
-- 
2.35.1

