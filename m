Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F34C77B7C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Apr 2023 20:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236271AbjDYUWi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Apr 2023 16:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236187AbjDYUWh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2023 16:22:37 -0400
X-Greylist: delayed 75 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 25 Apr 2023 13:22:35 PDT
Received: from mx0b-00256a01.pphosted.com (mx0b-00256a01.pphosted.com [67.231.153.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE4A17A06
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 13:22:35 -0700 (PDT)
Received: from pps.filterd (m0355791.ppops.net [127.0.0.1])
        by mx0b-00256a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33PHivPD017246
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 16:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding;
 s=20180315; bh=79sHrAEj5hNmmwiOWP5bra7BXbatTc7MFEdKV9lCbEg=;
 b=SYuc8Uj9vcPmCTBfp4xgA2NC7a2k12qHGZAPoEtSVxfV13ehIiogtFnUQro7WekQlb2C
 0qH77P+QIlSAOBVDFudksahotxi6sCufQAbMHFJvIwubWmbAZAlhsxCCESskYY1kIksu
 0fy5V93Qts2m+vhUPMkhdTeQoOQW19kgdYCnWbvcD9Nsnvezrq74u8Oe0S/Tt/LnySmq
 H3YcPwSFJL8HFJ/u6AvEEsAeTzk9KNyMnTml6ALWUeI98s0NptMqhjV8oKGOd2Xn5U4O
 OzSUBbSHLLllibBFdBsz0vtwoPnfLO5gvklLXUNWAiESeTjP9UVjt+DPvTVGZCDAD8mI tg== 
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
        by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 3q48sv3dx7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 16:22:34 -0400
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-3ef33ed8843so38943561cf.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 13:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682454154; x=1685046154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79sHrAEj5hNmmwiOWP5bra7BXbatTc7MFEdKV9lCbEg=;
        b=ZNa7tYx4lmT5Ic3d3r9VpsxbhiI+DKohc24/+BZXOKmAiwwr/nRKYr7FgsJFcVxVmu
         IcmaCSxDpA1ooerz5+W4NQVwfdoPqxP+4Lgt/8xx9jHt7dxUz4byFArNKxjId8mRIV4R
         NBOkMHDmGT9z/2CuKHoj4yTUpXBBNT0R17Y9jiSmxod0VvmY6DQGmIwHReck86J/lh+G
         874pw92PoP3geDRanuwlqINxK+fDXlt3B8wRoi3wpzpQp9drh+ooQezvKtAoChoR8u6i
         j02DWjGFDtHCgrIR5iLg669GERnpNxfc/z30VC2TIVZwNI2WWdHqnLyARSrZZcDopMWJ
         9Zeg==
X-Gm-Message-State: AAQBX9dzsHbx1/ewMe6dymQm0jg8niD2lSF4N9gGAa5MMOGhUDxGY2E/
        kXsSShR1hS6LV4azZXMmhBuBnyB22Sp3Nt+uDUTAHJtqsVsh69q9Uk+99T5XoC9FjJu4o/S33/C
        FMVUn5XXt0WhUiWTTQwiLVYwMfJN/dqcB7alb5+fxuxM=
X-Received: by 2002:a05:622a:247:b0:3ef:658c:6b33 with SMTP id c7-20020a05622a024700b003ef658c6b33mr21799748qtx.43.1682454153854;
        Tue, 25 Apr 2023 13:22:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350bXalb6KNUFxy602syb2mx3rbxcInYNZKvz7dlsT5PAYTZ1Lkcgx/ZIdqH4EGO0cCNjXbdL/A==
X-Received: by 2002:a05:622a:247:b0:3ef:658c:6b33 with SMTP id c7-20020a05622a024700b003ef658c6b33mr21799728qtx.43.1682454153621;
        Tue, 25 Apr 2023 13:22:33 -0700 (PDT)
Received: from enviable.nyu.edu (216-165-95-139.natpool.nyu.edu. [216.165.95.139])
        by smtp.gmail.com with ESMTPSA id ee27-20020a05620a801b00b0073b878e3f30sm3798281qkb.59.2023.04.25.13.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 13:22:33 -0700 (PDT)
From:   Jonathan Singer <jes965@nyu.edu>
To:     platform-driver-x86@vger.kernel.org
Cc:     Jonathan Singer <jes965@nyu.edu>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Jorge Lopez <jorge.lopez2@hp.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Daniel Houldsworth <dhould3@gmail.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: hp-wmi: Add HP Envy special key support
Date:   Tue, 25 Apr 2023 16:22:18 -0400
Message-Id: <20230425202219.7511-1-jes965@nyu.edu>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FS1h9p5oSnAary5TMvzSgEE9mgpIn4Dn
X-Proofpoint-ORIG-GUID: FS1h9p5oSnAary5TMvzSgEE9mgpIn4Dn
X-Orig-IP: 209.85.160.198
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0 mlxlogscore=999
 mlxscore=0 spamscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250183
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Previously, some support for certain keys on the HP keyboard has been
added already in commit 3ee5447b2048 ("platform/x86: hp-wmi: Handle Omen
Key event"), however this as tested did not allow even the fn+esc key on
my HP Envy which uses the same keycode on my HP Envy x360 laptop to work
--the keycode rather than being passed in as a separate int from WMI, was
being passed in as the event_data for the HPWMI_OMEN_KEY event.

This patch, as tested was able to properly get the keycode for fn+esc,
and for fn+f12 which is supposed to be a programmable key according to
HP's keyboard diagram and is thus mapped to KEY_PROG2. The fn+f8 key
combination (mute microphone) was a standard HPWMI_BEZEL_BUTTON key,
however it did not previously have an entry in the sparse keymap. This
patch preserves the original HPWMI_OMEN_KEY behavior for laptops that
use it by only taking the keycode from the event_data only when the 
event_data is nonzero.

Signed-off-by: Jonathan Singer <jes965@nyu.edu>
---
 drivers/platform/x86/hp/hp-wmi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b27362209b04..b61185fc0d8a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -212,6 +212,7 @@ struct bios_rfkill2_state {
 static const struct key_entry hp_wmi_keymap[] = {
 	{ KE_KEY, 0x02,    { KEY_BRIGHTNESSUP } },
 	{ KE_KEY, 0x03,    { KEY_BRIGHTNESSDOWN } },
+	{ KE_KEY, 0x270,   { KEY_MICMUTE } },
 	{ KE_KEY, 0x20e6,  { KEY_PROG1 } },
 	{ KE_KEY, 0x20e8,  { KEY_MEDIA } },
 	{ KE_KEY, 0x2142,  { KEY_MEDIA } },
@@ -222,6 +223,7 @@ static const struct key_entry hp_wmi_keymap[] = {
 	{ KE_IGNORE, 0x121a4, }, /* Win Lock Off */
 	{ KE_KEY, 0x21a5,  { KEY_PROG2 } }, /* HP Omen Key */
 	{ KE_KEY, 0x21a7,  { KEY_FN_ESC } },
+	{ KE_KEY, 0x21a8,  { KEY_PROG2 } }, /* HP Envy x360 programmable key */
 	{ KE_KEY, 0x21a9,  { KEY_TOUCHPAD_OFF } },
 	{ KE_KEY, 0x121a9, { KEY_TOUCHPAD_ON } },
 	{ KE_KEY, 0x231b,  { KEY_HELP } },
@@ -816,11 +818,20 @@ static void hp_wmi_notify(u32 value, void *context)
 	case HPWMI_SMART_ADAPTER:
 		break;
 	case HPWMI_BEZEL_BUTTON:
-	case HPWMI_OMEN_KEY:
 		key_code = hp_wmi_read_int(HPWMI_HOTKEY_QUERY);
 		if (key_code < 0)
 			break;
 
+		if (!sparse_keymap_report_event(hp_wmi_input_dev,
+						key_code, 1, true))
+			pr_info("Unknown key code - 0x%x\n", key_code);
+		break;
+	case HPWMI_OMEN_KEY:
+		if (event_data) /* Only should be true for HP Omen */
+			key_code = event_data;
+		else
+			key_code = hp_wmi_read_int(HPWMI_HOTKEY_QUERY);
+
 		if (!sparse_keymap_report_event(hp_wmi_input_dev,
 						key_code, 1, true))
 			pr_info("Unknown key code - 0x%x\n", key_code);
-- 
2.40.0

