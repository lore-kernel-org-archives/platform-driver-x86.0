Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0113C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 12 Mar 2022 14:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbiCLOyr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 12 Mar 2022 09:54:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbiCLOyq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 12 Mar 2022 09:54:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 191E85BD12
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Mar 2022 06:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647096819;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=idEHkhQAaOBliwENS0wsp/XJ+A6XVFB7baxao15C+mw=;
        b=UbBFl/vXPIqBnVs0oLDaHY5nCVFWOejUfWSJtUuPBj2KSMepMu7uTgTkTzo9DMvmepL8lK
        KqyEyHwPjCBF1tAn1wgj+3u6MrHdvht1qOhlxgOuk10bBNhUAW+ThgUp/m5sO8oN/Xgmf0
        gcG5f9ZAv4uA4zQ/0CSCzy3A2FZ+7nk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-IkKZnPQfO-iLobUNFOwwtQ-1; Sat, 12 Mar 2022 09:53:37 -0500
X-MC-Unique: IkKZnPQfO-iLobUNFOwwtQ-1
Received: by mail-qt1-f200.google.com with SMTP id r7-20020a05622a034700b002e06ebbc866so8779171qtw.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Mar 2022 06:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=idEHkhQAaOBliwENS0wsp/XJ+A6XVFB7baxao15C+mw=;
        b=oHHkD8M6y6ydZzumYVdO5kv+F09/iJQh70h2YMfEeNEhtoqL4dnJockFHPEW8Y5PG5
         H8DtJkRGf7g14cnpWyNLcpBPXRTOW1Wi1o7QDUHy6nq4m3vTDiXaRD8kHSm9G3FrAOiN
         0ZYR+dvQZ5zelm5InEIvaojCDLx0zjmp18KEgfB7YLK7CkjURN9fhFkYxMOmxRMB9NOD
         A/K2NQSabxB6AZcyIy+7WmJ0adQmRJ/iQsLiVACJJCsoPtfNuEWruVtzE86Ut/Cm7eL6
         ZwhhSmnLj94sJYVVVSAMRMropzDJkKxRmaeVKmBv6ZkzGquWUuGDP5t5iYqZoLe/BGAY
         cKIA==
X-Gm-Message-State: AOAM533J+1wgAxjjqn0VvNLQr9vIlMCrPpm7Li8o7Qq47kwBaRmMMXC/
        EfHaoE5yevk0D5wSbxzBChlkk/avS+kiwtZ7/td7xc5mFfIs/B4NjyidZ+6jrs3TQaamYVvVyZz
        8dcfkrt8n2oIgv6Q1gVd+Zv3mclv7iYKA1w==
X-Received: by 2002:a05:622a:1a12:b0:2e1:a631:aecc with SMTP id f18-20020a05622a1a1200b002e1a631aeccmr12502475qtb.383.1647096817452;
        Sat, 12 Mar 2022 06:53:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyedg6i9wIc8nITyii9SK3A7/ikxZR+w6n+U2G2GpCA5FFJbmerz+UION3dSN4kxgzqvNDuqA==
X-Received: by 2002:a05:622a:1a12:b0:2e1:a631:aecc with SMTP id f18-20020a05622a1a1200b002e1a631aeccmr12502459qtb.383.1647096817232;
        Sat, 12 Mar 2022 06:53:37 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id h62-20020a37b741000000b0067da4164f8fsm669640qkf.126.2022.03.12.06.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 06:53:36 -0800 (PST)
From:   trix@redhat.com
To:     hmh@hmh.eng.br, hdegoede@redhat.com, markgross@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: consistently check fan_get_status return.
Date:   Sat, 12 Mar 2022 06:53:27 -0800
Message-Id: <20220312145327.1398510-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Clang static analysis returns this false positive
thinkpad_acpi.c:8926:19: warning: The left operand
  of '!=' is a garbage value
  (status != 0) ? "enabled" : "disabled", status);
   ~~~~~~ ^

The return of fan_get_status* is checked inconsistenly.
Sometime ret < 0 is an error, sometimes !ret.
Both fan_get_status() and fan_get_status_safe() return
0 on success and return negative otherwise.  Change
the checks for error, ret < 0, into checks for
not success, !ret.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 708743ec9ae79..c568fae56db29 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8285,7 +8285,7 @@ static int fan_set_enable(void)
 	case TPACPI_FAN_WR_ACPI_FANS:
 	case TPACPI_FAN_WR_TPEC:
 		rc = fan_get_status(&s);
-		if (rc < 0)
+		if (rc)
 			break;
 
 		/* Don't go out of emergency fan mode */
@@ -8304,7 +8304,7 @@ static int fan_set_enable(void)
 
 	case TPACPI_FAN_WR_ACPI_SFAN:
 		rc = fan_get_status(&s);
-		if (rc < 0)
+		if (rc)
 			break;
 
 		s &= 0x07;
@@ -8843,7 +8843,7 @@ static void fan_suspend(void)
 	/* Store fan status in cache */
 	fan_control_resume_level = 0;
 	rc = fan_get_status_safe(&fan_control_resume_level);
-	if (rc < 0)
+	if (rc)
 		pr_notice("failed to read fan level for later restore during resume: %d\n",
 			  rc);
 
@@ -8864,7 +8864,7 @@ static void fan_resume(void)
 
 	if (!fan_control_allowed ||
 	    !fan_control_resume_level ||
-	    (fan_get_status_safe(&current_level) < 0))
+	    fan_get_status_safe(&current_level))
 		return;
 
 	switch (fan_control_access_mode) {
@@ -8918,7 +8918,7 @@ static int fan_read(struct seq_file *m)
 	case TPACPI_FAN_RD_ACPI_GFAN:
 		/* 570, 600e/x, 770e, 770x */
 		rc = fan_get_status_safe(&status);
-		if (rc < 0)
+		if (rc)
 			return rc;
 
 		seq_printf(m, "status:\t\t%s\n"
@@ -8929,7 +8929,7 @@ static int fan_read(struct seq_file *m)
 	case TPACPI_FAN_RD_TPEC:
 		/* all except 570, 600e/x, 770e, 770x */
 		rc = fan_get_status_safe(&status);
-		if (rc < 0)
+		if (rc)
 			return rc;
 
 		seq_printf(m, "status:\t\t%s\n",
-- 
2.26.3

