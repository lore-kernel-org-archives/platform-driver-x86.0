Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D20E81E1E
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 17:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbjJFR5h (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 13:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233140AbjJFR5f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 13:57:35 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC84BBE
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 10:57:33 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-505a62d24b9so2893339e87.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Oct 2023 10:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696615051; x=1697219851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQON4lipwgIuT7bZ0NK7lDVy8dSdUxiEvQ5BnNb8LOI=;
        b=hYDaxDdlDeHgrEMDxoiPPKQNfNB166UXjAVSgClLowVffzTRf7HRfGMd6JjxsQcJZb
         bCPYESgw9yqTiAsITiBROrZqY8xPnvXri5VyV16D1Klyls7akGkEWAnp7uTTKnEb/myB
         +fvVTsByTpM0sJmz5Q3lQqzuIC+V9soYmWjUUEbXVLzFVN23brCQ/s3LbGRnVzWIqXlM
         Zj87lm3qYNU6Y6k/0HwUQVrwSjsHV0vfT8GbzJWpVsTbAdiEUjAu6F7AXkYnTbDMVv2T
         YNrgOivavRuwXdlGinuFhM7nUP6LyiMw1lsYqkAGTwKgjl1P04KTawwu/bB3RotTkLvw
         5ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696615051; x=1697219851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQON4lipwgIuT7bZ0NK7lDVy8dSdUxiEvQ5BnNb8LOI=;
        b=SiMEnjPvsRmLrX8t4cWyxC4Lo57H6kJNdOubJGtU1tFkozK6wpi0AJ+LhVsgekVjUa
         JhAMSVbuf2PUUiL5Q8z4X+YuuUZAEymQ4l5C/tgs033Dbfa3SBUEFn8mAyFOkg3wBub8
         tpBCzkfA27Jc1HcL4z+496yRcg383HryFfptKIFP47nudw1VFJlNOxUfYJxRgjK12L0K
         MBGhsHlV6qoth5lM0FJs3HN0FNa3dhkmltXka67gAILTX5d0VTnj4yjbY+3BzbDswSo3
         5gbS/7/1Z9fmnADVbEpChLukN8D2HiEMwWTmyn1W3i4wn1FMa5ZGp9d2nA4+4qUn5Inb
         kS3w==
X-Gm-Message-State: AOJu0YyrZcnfUm4mSXV+MZL/SvqFmrWPDuGyIXSsk9+n7OZYyNXmf1zE
        W76VFpf579/c8eYisa6iiBOpOuAVGnY=
X-Google-Smtp-Source: AGHT+IFaB013ksLCgsd81/o2RC4cMzUB535cig5kkiIe38xhE1q/ES46HsK8o3M/IRuEmaUt71K16Q==
X-Received: by 2002:a19:a414:0:b0:500:79a9:d714 with SMTP id q20-20020a19a414000000b0050079a9d714mr6684880lfc.65.1696615051401;
        Fri, 06 Oct 2023 10:57:31 -0700 (PDT)
Received: from localhost.localdomain ([81.177.126.202])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ee09000000b00500d1a72734sm379050lfb.130.2023.10.06.10.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 10:57:31 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH v2 1/3] platform/x86: msi-ec: Fix the 3rd config
Date:   Fri,  6 Oct 2023 20:53:53 +0300
Message-ID: <20231006175352.1753017-5-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006175352.1753017-3-teackot@gmail.com>
References: <20231006175352.1753017-3-teackot@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix the charge control address of CONF3 and remove an incorrect firmware
version which turned out to be a BIOS firmware and not an EC firmware.

Fixes: 392cacf2aa10 ("platform/x86: Add new msi-ec driver")
Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
Signed-off-by: Nikita Kravets <teackot@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index f26a3121092f..492eb383ee7a 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -276,14 +276,13 @@ static struct msi_ec_conf CONF2 __initdata = {
 
 static const char * const ALLOWED_FW_3[] __initconst = {
 	"1592EMS1.111",
-	"E1592IMS.10C",
 	NULL
 };
 
 static struct msi_ec_conf CONF3 __initdata = {
 	.allowed_fw = ALLOWED_FW_3,
 	.charge_control = {
-		.address      = 0xef,
+		.address      = 0xd7,
 		.offset_start = 0x8a,
 		.offset_end   = 0x80,
 		.range_min    = 0x8a,
-- 
2.42.0

