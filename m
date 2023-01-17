Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB18C63797
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Jan 2023 12:34:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236221AbjAQMep (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Jan 2023 07:34:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236103AbjAQMeo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Jan 2023 07:34:44 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F0FA35264
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jan 2023 04:34:42 -0800 (PST)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7CF073F760
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jan 2023 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1673958880;
        bh=Dr9R5dfY2nTTstdwaC++TmcM/uDTBZdBUz78esGlC00=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=RmLlJ3yB9hECoctWew2F4AlEb0NubEgeud2JD4koWPHTZhs4J8LZuQcahIpKQdEiY
         WdyOanMF4rb6wrEU3wfk6GshoQ4knC+O2xTQ+N5TuXS1slqwY8X1sT5zhEn5j6pQ5w
         LuIOWCi3bcG/pTpEcpu834J7I5IZ1+t/hWehlEfqOoK7lrQu+YoHOGw28mDdajGK60
         fyKSvQLddg4c7xQHmvPUV+yJXQpGTLrnLOfkhwPWp0hB7GP39SeAdhsHNg8yacl1pV
         IIarvEV9Z+DOIIa7oyrZvZi1k5oOoskWsIMeNgTEQlZZzNSvYZQQttlzHoSI239yL/
         6fdy7S8imJqZg==
Received: by mail-pg1-f200.google.com with SMTP id g32-20020a635660000000b00478c21b8095so13971767pgm.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jan 2023 04:34:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dr9R5dfY2nTTstdwaC++TmcM/uDTBZdBUz78esGlC00=;
        b=ceNP8mQSxSKt11ItA3R36SRbgL1csqsvCeFHlAW+i9GBjO5WLcE9AgUN3WuZH67E/N
         VunawgZwh6NWEc99jd1houtVx8MyHW/KzhfYr/gEL2hWNSXpTXxeoq316RAdyLWmLTWr
         crjY4PbL1IHIkZEDWCE0CK5IwhjOJWINbgbYPnv/qQYZIN7uaUnTS/qSho+LgCiw0Dyp
         MPDhS2SS9fVaRk3wy9dPGGVxMe/OuD9IseVylN4KPhL28R3EHz+flIBOE/fHQ7uoJM8p
         ctkuoK3v/aecU2Cr6EviHe7tkUh7CFacR20Pd6a5y8GaZcMg/8Hx8k2bAd26hwId8mbo
         cI2A==
X-Gm-Message-State: AFqh2kq9RA0FkXJkPAzQ4/Wep0P0Q9d70E2LfV7jtKlJwc2gwHqVxrFL
        uR08JUtSiqvMd3NwNNILm9u1qZh6olwL0vWvKmi/8fiJ43zzJUN3tcpkLVqxUJWK4fGS5KZs9dS
        2Q8cVR0sueOIaDRyKpURGqY5NaLNaaI2l4iwpaX8637Upd7cAye8=
X-Received: by 2002:a17:903:41d2:b0:194:8293:7aed with SMTP id u18-20020a17090341d200b0019482937aedmr4803360ple.6.1673958879123;
        Tue, 17 Jan 2023 04:34:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvx1PIXSEHmS/z7z5lb8KgmnS5yWSwxFE1DXqNZzoijW82rL44xDXdWbSzbhs1ZKeFHCrvm3g==
X-Received: by 2002:a17:903:41d2:b0:194:8293:7aed with SMTP id u18-20020a17090341d200b0019482937aedmr4803333ple.6.1673958878803;
        Tue, 17 Jan 2023 04:34:38 -0800 (PST)
Received: from canonical.com (2001-b011-3007-1498-1355-049d-ac04-c0c3.dynamic-ip6.hinet.net. [2001:b011:3007:1498:1355:49d:ac04:c0c3])
        by smtp.gmail.com with ESMTPSA id m2-20020a170902bb8200b001949c680b52sm3090850pls.193.2023.01.17.04.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 04:34:38 -0800 (PST)
From:   Koba Ko <koba.ko@canonical.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-wmi: Add a keymap for KEY_MUTE in type 0x0010 table
Date:   Tue, 17 Jan 2023 20:34:36 +0800
Message-Id: <20230117123436.200440-1-koba.ko@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some platforms send the speaker-mute key from EC. dell-wmi can't
recognize it.

Add a new keymap for KEY_MUTE in type 0x0010 table.

Signed-off-by: Koba Ko <koba.ko@canonical.com>
---
 drivers/platform/x86/dell/dell-wmi-base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
index 0a259a27459f6..502783a7adb11 100644
--- a/drivers/platform/x86/dell/dell-wmi-base.c
+++ b/drivers/platform/x86/dell/dell-wmi-base.c
@@ -261,6 +261,9 @@ static const struct key_entry dell_wmi_keymap_type_0010[] = {
 	{ KE_KEY,    0x57, { KEY_BRIGHTNESSDOWN } },
 	{ KE_KEY,    0x58, { KEY_BRIGHTNESSUP } },
 
+	/*Speaker Mute*/
+	{ KE_KEY, 0x109, { KEY_MUTE} },
+
 	/* Mic mute */
 	{ KE_KEY, 0x150, { KEY_MICMUTE } },
 
-- 
2.34.1

