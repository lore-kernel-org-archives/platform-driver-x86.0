Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599DAC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 17:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbiFHRQh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 13:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiFHRQ3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 13:16:29 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFCA4137ED
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 10:03:15 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-f2e0a41009so27972620fac.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=d8pU2LR1sgLaGrHhZM0U7eca21knKQK4hDLNcZkuKx0=;
        b=IRC497ErHE61t/roSBtpl3hiLcCQLQGzUKjVC8fq/3wgvREwSWmnjB47nNfFHGES+o
         j5Lq9S3N2UTWG6l4sjFfbZYST8ItAu+AcpLUcTrzk7i4YvFlq9hRwFW5ZTz6XLy+YqH2
         aqu7izCraEvkJDipAJxX30e/mTx3wh2Z3fcKLhHZi1e54un6Lbl/S3dZayJKKgChg0TG
         H/69UXEB/Ave0bxfnr8s9ZfE2IRCMfVHShx32WPyv9oPYbiAdn+wREyWRLbYoi24P4bz
         cpVAPKKqJUUdBvcPMQVWov1hz/xWZFqbzUIqdURLeW7MxFmwLddGxd14REkZ1GDFCavp
         UqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d8pU2LR1sgLaGrHhZM0U7eca21knKQK4hDLNcZkuKx0=;
        b=CPNF2dMYL5oySbgZXqaQukbphZzTivQfd9Ws6QfjB25tDOHFGT2+hkqx84q3+XRjGp
         HumL7Czmc3rtVLhA3UOfIlucyhFA65Pn5sr5BE+tPQ0Vb8gBXRtYOVRtHHZJ1FXywU+t
         5FrpmKVZW/biQy4NHNGNW/FlybwVKOkaCv3kJcb0gazluQmQBiTV/1yNjBNHl5wbIyt6
         C8ADiXRa+b7l/6VWKpTBTW/elF2bMaF+NN5AessLrbsRXUKKYl7wSVUEUW7aASxpLQUy
         +uv4XVLUQXh5zl0PYUZEKym0Xe1ftQoh+LldcQiOWQjpjxPFWR7MtaomuIjkwVnmHaQN
         vpfA==
X-Gm-Message-State: AOAM531gHFxfUji0Qx6sNksvqJgULnd/hsk4S2FoZZuFtT1sXWsMoxIf
        jcqoQo9HAobKhJo/CgyU+Dm0Rokugn4=
X-Google-Smtp-Source: ABdhPJwVdJbodO5Qq/rZc7++wnZ8YGVDw8M/fHYemUwlVfSlBw6/RF1iw6wQQBYp614CqQI5q6cpmQ==
X-Received: by 2002:a05:6870:f143:b0:f3:3d31:1da9 with SMTP id l3-20020a056870f14300b000f33d311da9mr2857931oac.134.1654707794689;
        Wed, 08 Jun 2022 10:03:14 -0700 (PDT)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:e5f7:48da:3306:a654])
        by smtp.gmail.com with ESMTPSA id g24-20020a544f98000000b00325cda1ffb4sm11411196oiy.51.2022.06.08.10.03.05
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 10:03:06 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/2] Organize declaration variables
Date:   Wed,  8 Jun 2022 12:02:20 -0500
Message-Id: <20220608170220.5751-3-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608170220.5751-1-jorge.lopez2@hp.com>
References: <20220608170220.5751-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch organizes declaration variables in method
hp_wmi_perform_query as requested.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next

V1 - Original submission
V2 - Organize declaration variables
---
 drivers/platform/x86/hp-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 7bcfa07cc6ab..d3540dd62d06 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -290,9 +290,9 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	struct bios_return *bios_return;
 	union acpi_object *obj = NULL;
 	struct bios_args *args = NULL;
-	int mid, actual_outsize, ret;
+	int mid, actual_insize, actual_outsize;
 	size_t bios_args_size;
-	int actual_insize;
+	int ret;
 
 	mid = encode_outsize_for_pvsz(outsize);
 	if (WARN_ON(mid < 0))
-- 
2.25.1

