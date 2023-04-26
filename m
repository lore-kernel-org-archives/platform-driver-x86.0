Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CC2C77B78
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Apr 2023 18:50:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233416AbjDZSup (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Apr 2023 14:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234043AbjDZSuo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Apr 2023 14:50:44 -0400
Received: from mx0b-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDBA7EF7
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 11:50:39 -0700 (PDT)
Received: from pps.filterd (m0094546.ppops.net [127.0.0.1])
        by mx0b-00256a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33QHePZN012416
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 14:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=20180315;
 bh=tz6yrnf+dTN5LZdbLmwKWiSYYpiy3j5Ue6bS4NbkEBg=;
 b=hYKHC94D2uj85bsIJ0MlNmhNPcIr3/LoYiawSIm8QzYIc5NMYxolKV9LoYk/PBm6o55T
 FQQq8hC/OrJAabGkiyQSSBAVuzItA/sogNwYOvAwNjVQBg4CKMc2sY39quEgGppM9vQN
 jl/vtfk0oLIFJt6DULmUQwMp/H2kRiEI2CPwYWx6tQo/nfdINQKB8RqKpP2zdr/FzQeE
 sp88rKGxhD5v9a0AumrDut17mnJouMvw6HR0ml1MTLjBHo4tGyx3bEuGRRij8y3ycaZT
 Ypf1qzCeqF2dIuF9wzJeJgV15/EX5HMVrWyBKN/gZdfJ4gl7gC/AbwYKrJa7Nj8MlpiS gg== 
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
        by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 3q62b5empr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 14:50:39 -0400
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-3ef44f554b1so49077931cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 11:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682535038; x=1685127038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tz6yrnf+dTN5LZdbLmwKWiSYYpiy3j5Ue6bS4NbkEBg=;
        b=WlPVthMI/8OU1HDsRolZ2or7Sq77LyLFC6klLE0Ac5LkIbnV01pRx/KvEIRkhZHu4C
         dKFiN2fOXlVUemHXTGWneGtFCopPn2yWZaLbE+5XDQIj3W+GfwLRPqvMP/MSp67G9BKv
         mdrqOvJCJ0+FaiFAQubUTtsmgbDsGzWxszTYVYIlabQf+62ZOrQ5oG5puFx09cMde7m3
         KUTRuzYQj9jH/qUqSRmUkXDiYXKr2E2LUhgisDnSIHEH6Hw0rfUVdPt+1XmL/oh2Wr/2
         08+bC0OnhZX0J+2d2X95e8Lt19riEldFtO+iztWE2rjOa2qhXyMfItXmcPu3t+f1r4EO
         hZfg==
X-Gm-Message-State: AAQBX9dAs/3HpMEjZ4gFXbGnjx19mIWp9NwBHfsjifnizUt298dCnjbb
        yRYTDufYTP9wzSUoA0QxJQVOuczZGuLwnhq8iUYf2Pfsg0Ja59qFSHVW2SgdTySyscoLaATMfgo
        VKFLtIT9HYB+PkIAcKUknQ189sGyecRAU
X-Received: by 2002:ac8:5f87:0:b0:3e3:7e6f:423c with SMTP id j7-20020ac85f87000000b003e37e6f423cmr35438902qta.34.1682535038288;
        Wed, 26 Apr 2023 11:50:38 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZAbNMSNv3vXSvimA1YFuF+ofgEQxxujSpwrw7k8sY4TA3t9c1ebic7COYrEyM7LyyyAXqHaA==
X-Received: by 2002:ac8:5f87:0:b0:3e3:7e6f:423c with SMTP id j7-20020ac85f87000000b003e37e6f423cmr35438881qta.34.1682535038039;
        Wed, 26 Apr 2023 11:50:38 -0700 (PDT)
Received: from enviable.nyu.edu (216-165-95-156.natpool.nyu.edu. [216.165.95.156])
        by smtp.gmail.com with ESMTPSA id 206-20020a3705d7000000b007469b5bc2c4sm5373476qkf.13.2023.04.26.11.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 11:50:37 -0700 (PDT)
From:   Jonathan Singer <jes965@nyu.edu>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Jorge Lopez <jorge.lopez2@hp.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Jonathan Singer <jes965@nyu.edu>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v3 2/2] platform/x86: hp-wmi: Add HP Envy special key support
Date:   Wed, 26 Apr 2023 14:48:54 -0400
Message-Id: <20230426184852.2100-2-jes965@nyu.edu>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426184852.2100-1-jes965@nyu.edu>
References: <20230426184852.2100-1-jes965@nyu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Leqh5kfXYwIlsjl9oVZ0E12mFSMHhQlT
X-Proofpoint-ORIG-GUID: Leqh5kfXYwIlsjl9oVZ0E12mFSMHhQlT
X-Orig-IP: 209.85.160.200
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0 phishscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304260167
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
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
V2 changes: Removed confusing comment

 drivers/platform/x86/hp/hp-wmi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 18d40270aa0d..2749433b713f 100644
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
@@ -844,11 +846,20 @@ static void hp_wmi_notify(u32 value, void *context)
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

