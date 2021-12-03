Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BD7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Dec 2021 21:28:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353997AbhLCVbm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Dec 2021 16:31:42 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33074
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1354050AbhLCVbl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Dec 2021 16:31:41 -0500
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 568BC3F1B6
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Dec 2021 21:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638566896;
        bh=aELhFy+TuMmllfjvVWTVSx286LtfBt9wC9Wu3gXO6nI=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=msgFoLKvDpedw7784GseJpRj8WlYoM6wksWdi//NYqrIQn4WXYWHXgH48rZHMWB77
         WIhvmNjLKbBsMdTVsFJSCW0RETZqUtgbTxm/UV05w7FysoAtHLmq7KeoaKysV8eD3Y
         DQWNHW3gWApDT80mrVTQuM9fefvLo/TKJJdPezhqaXOrXFSKwmioFfcVyQnuuzyb5M
         hNEke2UuOoMsJ6TRQ1AIfgBl/HC+eyXJ+O0s2nFq6cOaYnuLzoQGwbHKerRmOTZJRZ
         iGeINqWSQfUZyLn0I6U/AglxhqeFC3h1wGW+Jb7OYS9Gi3ww6FSWi0gmAQhge6rQI9
         AWnyIZ6p4NN1g==
Received: by mail-pg1-f197.google.com with SMTP id a8-20020a63cd48000000b00330605939c0so256996pgj.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Dec 2021 13:28:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aELhFy+TuMmllfjvVWTVSx286LtfBt9wC9Wu3gXO6nI=;
        b=UHeoyP66dpPkee5Dw9yO3Fqbn0/GHykWl/hJM2hmoB+1P1fdhZQHD7i8PYu9z+FqoU
         s2uU+61kiq0nnobfEXIt776paaGnA/jVGO5mBC6MmGIw3Z1PBB80/OqPX2lBjlgH5yix
         P4qUuET7/+ojsy9POqUZTjqcj6c3ehfDV1BsXYdyXgRWuhlkqbxXwm91om12EuAhpWdz
         3yjb0tWljl620MBRc9E1BmB4kDUM3LmO99JEJXpVfxdhr5qFD7mdwpqYGkwTwpqLqq0Z
         KyJVnezvbYNsycST8shxYccdkkS56gie4oKYUbNSR3gqY5X+tQmhMgPzECh/fklisaJf
         m/XA==
X-Gm-Message-State: AOAM531BNogtWkvm8/Mea1lESRcGttpCYQDps2b6QCB1WMn7/2kPWFGx
        ChPThdUUCo5ZbNSBNbvHrEveELNlaz1sUWHCFXuBkT4uIMQl4CNl4jhQMF2cZxDBAbOxD1fF+En
        B4aIxxmMHhQ2Ek1qKgRyCNXbl39Kqbu9gDs5xu1MaBaaWlslQExI=
X-Received: by 2002:a17:903:11c4:b0:141:da55:6158 with SMTP id q4-20020a17090311c400b00141da556158mr25889923plh.7.1638566894825;
        Fri, 03 Dec 2021 13:28:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhWOWkIFlHTyIJF631Si4ZatnfvOhhJ25S1lchj0OJT43954ClTWLLJtDW/e2sHWw7PicEKA==
X-Received: by 2002:a17:903:11c4:b0:141:da55:6158 with SMTP id q4-20020a17090311c400b00141da556158mr25889898plh.7.1638566894616;
        Fri, 03 Dec 2021 13:28:14 -0800 (PST)
Received: from canonical.com (node-1w7jr9yebujeq5th4a1ypmeui.ipv6.telus.net. [2001:56a:78ed:fb00::5aa])
        by smtp.gmail.com with ESMTPSA id fw21sm6043587pjb.25.2021.12.03.13.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 13:28:14 -0800 (PST)
From:   Alex Hung <alex.hung@canonical.com>
To:     alex.hung@canonical.com, hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     stable@vger.kernel.org
Subject: [PATCH] platform/x86/intel: hid: add quirk to support Surface Go 3
Date:   Fri,  3 Dec 2021 14:28:10 -0700
Message-Id: <20211203212810.2666508-1-alex.hung@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Similar to other systems Surface Go 3 requires a DMI quirk to enable
5 button array for power and volume buttons.

Buglink: https://github.com/linux-surface/linux-surface/issues/595

Cc: stable@vger.kernel.org
Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/intel/hid.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 08598942a6d7..13f8cf70b9ae 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -99,6 +99,13 @@ static const struct dmi_system_id button_array_table[] = {
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "ThinkPad X1 Tablet Gen 2"),
 		},
 	},
+	{
+		.ident = "Microsoft Surface Go 3",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Surface Go 3"),
+		},
+	},
 	{ }
 };
 
-- 
2.34.1

