Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA920C004D4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Jan 2023 15:11:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjASPLK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Jan 2023 10:11:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbjASPLC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Jan 2023 10:11:02 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78106676DD
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 07:10:56 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id x2-20020a17090a46c200b002295ca9855aso6142679pjg.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 07:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rjD2ycwVIKLN3//929dSSU8RnBGqEP0Vahjv/Iz1Rfw=;
        b=OzHKBEO1haP9YGI26OiOSVZrf8uGP9IKhRd/+HOmFR2U9Y1GNygC4redHLTB7+5Tfd
         ZWtVFq4CUVHNJow6E4k0cTQyUoSpZQlrW90mA60MBED7kl7IvrNZN7K8cMZENQDkjjBX
         ZlzIXauuORoHY10nYNQBOdpI9NPdCdnbiuN9j/gkIT8C2te8nqJTSVZm3Cp8Iy9ansTk
         JjKBMWta/JTyDkP10vjG95ceooW8MK5fqHvZtf64lLTQYWQa1FDC7TR83EcE4BaVUt3n
         WVkVVj57XHtWRUomTCYdr9FsVad5NXXa5FYNAFVlbHMu9c141Lt2W9TbHwR4OFfb2j0N
         stQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjD2ycwVIKLN3//929dSSU8RnBGqEP0Vahjv/Iz1Rfw=;
        b=266LZTa6kfuR0DSw2D8WoPXlyl0tmOlza3hJfZYffjVUWq0VRqUFexvinL5xAMiB4H
         LiawbTNnLqbqUON4jPreeoDG6LQFnazAqTz6etx4aBof8aIWLKN7YrR7F0pHWxUUHKtr
         aMxGZN7M58Ml4HEAs//wJBuQPwRIMBtprb1eeqkya73kMpaKCn5528IScxVj1qZr+fLE
         Gi7PMjLnD1pX88T22dntOQvwLCa0cXu5vBX7xt3lXlEvmyTF6/Lj1xtYoxNurM7RUxKM
         5rLVBkq+JTYUGnUSSEJ0GIYosJOW2422PN6nr6MEGiobGx0t0+AmIOjceQ9+wXGnizvT
         XDAw==
X-Gm-Message-State: AFqh2kqlnB7G9APp5bpiBL4viFQor0hP4sxu0Uj10t9K/pQRwJHkgUqf
        cbhW1jFxUFcF15wFOUShhhQ=
X-Google-Smtp-Source: AMrXdXt4rkNJBiALge3+lS/WAddSaxQC1BZ5etFy5r4XeMZ14poe3jKDdiEm+9cm3yel+HNpJ+1hCw==
X-Received: by 2002:a17:902:820f:b0:194:8e5b:5f55 with SMTP id x15-20020a170902820f00b001948e5b5f55mr11872898pln.2.1674141055973;
        Thu, 19 Jan 2023 07:10:55 -0800 (PST)
Received: from toolbox.. ([2401:4900:1cc5:1cad:40c9:72a:e2eb:7d9f])
        by smtp.gmail.com with ESMTPSA id v7-20020a1709028d8700b00192902287d1sm25066723plo.288.2023.01.19.07.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 07:10:55 -0800 (PST)
From:   Kevin Kuriakose <kevinmkuriakose@gmail.com>
To:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@weissschuh.net>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Kevin Kuriakose <kevinmkuriakose@gmail.com>
Subject: [PATCH] platform/x86: gigabyte-wmi: add support for B450M DS3H WIFI-CF
Date:   Thu, 19 Jan 2023 20:39:25 +0530
Message-Id: <20230119150925.31962-1-kevinmkuriakose@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

To the best of my knowledge this is the same board as the B450M DS3H-CF,
but with an added WiFi card. Name obtained using dmidecode, tested
with force_load on v6.1.6

Signed-off-by: Kevin Kuriakose <kevinmkuriakose@gmail.com>
---
 drivers/platform/x86/gigabyte-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
index 5e7e6659a..322cfaeda 100644
--- a/drivers/platform/x86/gigabyte-wmi.c
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -141,6 +141,7 @@ static u8 gigabyte_wmi_detect_sensor_usability(struct wmi_device *wdev)
 
 static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H-CF"),
+	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H WIFI-CF"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M S2H V2"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE AX V2"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE"),
-- 
2.39.0

