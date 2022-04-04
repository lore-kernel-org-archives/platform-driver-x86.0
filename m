Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30659C35276
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 21:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382581AbiDDVb0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:31:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380587AbiDDUi0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 16:38:26 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD1526AC8
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 13:36:29 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-df0940c4eeso12142903fac.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2022 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jdzqjbj+EXZVpnQGFjZafV4mVPSJl+K5k7xong2l9Eg=;
        b=FGCTflOqdYUNvmEUMkts7jMAYyFuqoAJKERt/B3inw/iHmbD3cPEwHveIezEmwygCE
         lw3Vigxj9Ag85APhvAEipzWaCIA4APWhfwnIHc/Bd3rx0wu1eOFp0xr8VBv2CPr9LZQV
         aZ92Jw1wlbMp5Jw/UJF79Ci1tzN7HaunywDgGWBVdBE9WsOL63APxcAUYFUm5zRD46pP
         KhN2R5tSwomdEfLGcDc9cFnC8O6rnRp2k/xKpwnU15h9CUjNAds/aphiFRF2DsL+zQG2
         YTpzEdljowdnv/UE5Yr2OWZu9q1UrLYBeqsuxyZSr7Nrj/nzzu3oHxQmW9L0KlprR6Lq
         KAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jdzqjbj+EXZVpnQGFjZafV4mVPSJl+K5k7xong2l9Eg=;
        b=heGeK15J8Be4+VgrhlxLSkegMMbVpQ2sCWoxbU2Oa6nx+HO3XsYQelKJYTEWGMtCnH
         X2ZlwtuNxZxQfegFdwdiLpBZGqo9GCoMvNMockqDMPPfqZfKLOPIuivDKSNO2/RuHJeX
         A+yrJsRMIGZ2mDMUwjX4YiPn5GJsguHfkJctbTUSyuq1immq9vOgzNeGchpHm+wlA9is
         fKDQOOL6q+JKf58N0Qr+YqTLfCgFrMVLuRoQBxSd2sTt209LbD62a4YOPUD/u5pQNFSu
         4q0PGxjJatqET/2OswhKIN+s5wBSfVP6K94+cIZcKE2G4ofrgohOr7bxo/VXAIycj5GK
         2bSA==
X-Gm-Message-State: AOAM531CnLJ9OMhsHeJ28w5vvB/WhsVhq6bCnqdjSQu7P17I7zQfAnfC
        V3jSs9dK0CVdI3Gjn7b1y2MTfWGJPGE=
X-Google-Smtp-Source: ABdhPJwXBKs7TFjMvM29bqSZlBckiP4/wr0A0tAlVHz5zVLgmJVBr0gBNLry2D8I7vMTuQ02MZ3ZSA==
X-Received: by 2002:a05:6870:58aa:b0:dd:a976:5e8f with SMTP id be42-20020a05687058aa00b000dda9765e8fmr2783oab.112.1649104588185;
        Mon, 04 Apr 2022 13:36:28 -0700 (PDT)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c57b:f63e:33f5:caed])
        by smtp.gmail.com with ESMTPSA id u20-20020a4a9e94000000b003291f6ac4b2sm3765786ook.28.2022.04.04.13.36.27
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 13:36:27 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 1/6] Correct code style related issues in hp-wmi
Date:   Mon,  4 Apr 2022 15:36:21 -0500
Message-Id: <20220404203626.4311-2-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404203626.4311-1-jorge.lopez2@hp.com>
References: <20220404203626.4311-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Update hp-wmi driver to address all code style issues reported
by checkpatch.pl script.

All changes were validated on a HP ZBook Workstation,
HP EliteBook x360, and HP EliteBook 850 G8 notebooks.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next

v1-0001-Update-hp_wmi_group-to-simplify-feature-addition patch was
broken in two separate patches.  This patch is patch 1 of 2
---
 drivers/platform/x86/hp-wmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0e9a25b56e0e..667f94bba905 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -605,6 +605,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	for (i = 0; i < rfkill2_count; i++) {
 		int num = rfkill2[i].num;
 		struct bios_rfkill2_device_state *devstate;
+
 		devstate = &state.device[num];
 
 		if (num >= state.count ||
@@ -625,6 +626,7 @@ static ssize_t display_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	int value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -634,6 +636,7 @@ static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
 	int value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -643,6 +646,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
 	int value = hp_wmi_read_int(HPWMI_ALS_QUERY);
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -652,6 +656,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	int value = hp_wmi_get_dock_state();
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -661,6 +666,7 @@ static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	int value = hp_wmi_get_tablet_mode();
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "%d\n", value);
@@ -671,6 +677,7 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
 {
 	/* Get the POST error code of previous boot failure. */
 	int value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
+
 	if (value < 0)
 		return value;
 	return sprintf(buf, "0x%x\n", value);
@@ -1013,6 +1020,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
 		struct rfkill *rfkill;
 		enum rfkill_type type;
 		char *name;
+
 		switch (state.device[i].radio_type) {
 		case HPWMI_WIFI:
 			type = RFKILL_TYPE_WLAN;
-- 
2.25.1

