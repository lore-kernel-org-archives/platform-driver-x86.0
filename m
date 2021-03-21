Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E004C433C1
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 18:41:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7D1361947
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 18:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhCUSkk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 14:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbhCUSkI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 14:40:08 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63ADEC061574
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 11:40:08 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y6so16748162eds.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qtd2H/T/8MAihANrMovrzFI3X5CYwXvfjRDhb4VwocQ=;
        b=f5wK6KLDODSFzM6fZX52FDtgJmPg101vZnG5qpa14SHTayunotAATwkOIEPZyRrvO+
         HA9+00UC5KZ0kMdCmmop3YikeLLZF+WtEiRuDnCBgRmn6y/1enR/9xmEGIredS/9blMV
         hB19t3fJt02qRB8jVEU+KWWKQsaAosDzN3vOR7lOYViMtHovupfgM3LdCrhhiuhmHfO6
         xGSRJDPBHTCVjjKswCmhiBydFkgS3SDazpBCzvJe9Btm31RnQTUU1PDiha/+Zf9jMT58
         v08l2g3pJPgpdKwXeXwdv5uRVi5Tu+DyI3bJ1JOWEWZgHH6EEwtDr9Bznf5diklCcp/L
         YVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qtd2H/T/8MAihANrMovrzFI3X5CYwXvfjRDhb4VwocQ=;
        b=e4LvBAnKvm1uR6CRa99YoBjUkFsS5GZMp3IM2G06Q2n4R3Qmhhd2GCwbipc9IxyN7q
         EKLfvFEPVa7QFf9ILc2GxXkErulqkeCX46lxQEBKj8X7CRYsG8DifpxXF0SEoE3I988W
         lg/9RuZVl6+hax7ftQs7jylM/ZCO5taHckdfPnx320LH7FAacmNiocmNWwSoyzCkEQdz
         1Js6NDb65zwNtC9iQR4Jokb3OmyBGlwtIUjDxluq1O+EmIYJNPG7RNEuRQcabA7F0jf8
         71TDK5Kilt52V8MHL6xroN0ODp/YveFqyRkWohfWZPRMYrcfW0PNNvC8urh7Rs1WSeNN
         c9FQ==
X-Gm-Message-State: AOAM531IliQM/+BPnIN332TozByQJdwpX/v4XpQlSiM+2P89Z1jhaOfb
        xTLQESs38G9dmzJpJXYde28=
X-Google-Smtp-Source: ABdhPJy55iqrQStdLVB6mvVWpkMJBaNFcbPWZY6Zq+KkEaFJXlXGsf7/OlS3olyxAkRtRyWSCV66yQ==
X-Received: by 2002:a05:6402:3593:: with SMTP id y19mr21764576edc.317.1616352006978;
        Sun, 21 Mar 2021 11:40:06 -0700 (PDT)
Received: from PocketRocket.sam (178-85-91-151.dynamic.upc.nl. [178.85.91.151])
        by smtp.gmail.com with ESMTPSA id r13sm8650609edy.3.2021.03.21.11.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 11:40:06 -0700 (PDT)
From:   Esteve Varela Colominas <esteve.varela@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Esteve Varela Colominas <esteve.varela@gmail.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Correct minor typo
Date:   Sun, 21 Mar 2021 19:35:13 +0100
Message-Id: <20210321183512.14551-1-esteve.varela@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <80f7329e-c85d-b45b-fd69-bef85a6ab026@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Signed-off-by: Esteve Varela Colominas <esteve.varela@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 09362dd74..f3f7ae6f6 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4086,7 +4086,7 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 		return true;
 
 	case TP_HKEY_EV_KEY_FN_ESC:
-		/* Get the media key status to foce the status LED to update */
+		/* Get the media key status to force the status LED to update */
 		acpi_evalf(hkey_handle, NULL, "GMKS", "v");
 		*send_acpi_ev = false;
 		*ignore_acpi_ev = true;
-- 
2.26.2

