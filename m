Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23CCCCA48F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 00:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380503AbiFHAiY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 20:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1574588AbiFGXZz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 19:25:55 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CCB401BF5
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 14:37:06 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id p8so16626022pfh.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 14:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DTvYG6vUXmBDPGSvzYQyN/7uYcWQjt7gPfq8E7HXzmo=;
        b=aoGH1BTPYJprtHOp06snSR7UZAY6VNv3KrAzVMglRz31rZNoIErpXeq9l47Y/aFsTo
         SAYMq9BP8bLIoSRM3lYNGAtRcDkYVWL0sSoPt+eDlr36jmsFGcNm/xIOj/NAbsYFW7EA
         SAREov9YjSzsU6DUWadRTdAf39sMRN+5GqjnmN3ud6qL1oIrdiAt6r65c/Rwegs/Xora
         NszvPPtJKzHI6z2eKu5+KvbqpJhdVbIdKQiO/HX6c2WUa6sn0Qk28BTKqSmTKjQZyZpW
         2glCpxd7Xkwane+TvVGotOd6pBm0tpaJGVuxORJmPDLOzg7YXMXW3AJrkk7sfVGJKjnf
         01pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DTvYG6vUXmBDPGSvzYQyN/7uYcWQjt7gPfq8E7HXzmo=;
        b=qwOKhlqNvDDWP7sM+8IMne853zy46/AF0Ao5ZQrLqfnkwIHF1kVIzZybBhPiaCF+LE
         /J0FdFG1Q5BEHP6QflZSuuExHhzKrlKP+xDnBhdNaUDCD/QC3l6NY+Noj1j2BptHKEOV
         0gpCSrh78Z2lvg4b8p6FNNtF6AxC58PlCUiRFKjLFs05tzoaPqHodcvSszzi8SIIHGzS
         y9DMuUrptRELveuzoY7UKRCrOjtSZzU6BcOyaM47scoDj1Rb7HRzrWHi+Pwluhi3mA2a
         zIMwwofJD85WyBcFSXx8lSLLeJnDaTsTljBt4hMkQYmytWSq22GTF8qcQC+7rUzXlYEA
         yTtw==
X-Gm-Message-State: AOAM531eOcc2RUHTRnODFFEKZiBBksjJYjopesq660MRoS5QUU0jE/Xt
        NabDGCld1moQC5VZYPwCUO4=
X-Google-Smtp-Source: ABdhPJzPbjvaiyFqmdg0Q4BymFeLVQIjhP7Z7BdnCj9RG2+ZLzBshbl88XCyduEwYTooUwS20ikwYA==
X-Received: by 2002:a63:894a:0:b0:3fc:a724:578c with SMTP id v71-20020a63894a000000b003fca724578cmr27432205pgd.499.1654637826176;
        Tue, 07 Jun 2022 14:37:06 -0700 (PDT)
Received: from chopin.mithril (ip72-220-159-98.sd.sd.cox.net. [72.220.159.98])
        by smtp.gmail.com with ESMTPSA id v12-20020a170902b7cc00b00163f2fe1e64sm13051844plz.255.2022.06.07.14.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:37:05 -0700 (PDT)
From:   Duke Lee <krnhotwings@gmail.com>
To:     Alex Hung <alex.hung@canonical.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Duke Lee <krnhotwings@gmail.com>
Subject: [PATCH] platform/x86/intel: hid: Add Surface Go to VGBS allow list
Date:   Tue,  7 Jun 2022 14:36:54 -0700
Message-Id: <20220607213654.5567-1-krnhotwings@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Surface Go reports Chassis Type 9 (Laptop,) so the device needs to be
added to dmi_vgbs_allow_list to enable tablet mode when an attached Type
Cover is folded back.

Relevant bug report and discussion:
https://github.com/linux-surface/linux-surface/issues/837

Signed-off-by: Duke Lee <krnhotwings@gmail.com>
---
 drivers/platform/x86/intel/hid.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 216d31e3403d..79cff1fc675c 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -122,6 +122,12 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Convertible 15-df0xxx"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go"),
+		},
+	},
 	{ }
 };
 
-- 
2.36.1

