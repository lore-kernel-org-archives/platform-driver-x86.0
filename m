Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C328FC77B7C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Apr 2023 15:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241304AbjDZPWE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Apr 2023 11:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241293AbjDZPWD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Apr 2023 11:22:03 -0400
Received: from mx0b-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F983AA5
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 08:22:01 -0700 (PDT)
Received: from pps.filterd (m0142701.ppops.net [127.0.0.1])
        by mx0b-00256a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33QE70jU039379
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 11:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=20180315;
 bh=8gTVCBwc5VGvaZBc2XzQW+c5lJbEvMLF+SVJa+RnuVw=;
 b=D9ukbx4cfb57BRZ/jf2CbUb2aaVGFVagCJqSx0/AxGZhh+ZUsCXTymorXjbRfLbtSgmm
 l577KFo2aF9OTybVvT7Vt1fShFki11yRYeJI0W57yvzhBB4a3F2gPpMxyQ5dmB7s/US2
 gNY8oua8FTnYsoqOOKdHXxpa8gUPvqQQ3bDWs/FEZojk4TTj0YWl1wey8SZInqkc9/H6
 WLiKdnXF1WKjEAL6p6pUyaXAMJBthzks9Xef9/Yx1OFryik2FYbmEkm1BlyED5flRTk9
 dtOyd/Fl13CxKfFbvHzgXuHVkeRLm2sMN6Yuj2tzchUz3CDUnz2o6JyKb3C51qwiRRmu rA== 
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
        by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 3q5vhcgtg0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 11:22:01 -0400
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-3ef5c322d56so40266251cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 08:22:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682522520; x=1685114520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gTVCBwc5VGvaZBc2XzQW+c5lJbEvMLF+SVJa+RnuVw=;
        b=Sz87D3tdKfOHLlWKoUZXwxNiXr+vavBsKMWQ6ouBMZkYfCiML6d/MZM6yYY3NF6Qmk
         4mzBYGApsja7rJP8AWAp0UnIWfZePlczZej5GmsJGg8dbMjCT+hLejdcDDAZGc6PuFrD
         GSBa+aXnw897TttUiTdDTZKrULMXauBC3p8D7gTkZaZAYa9MSPY8fECPJh2EB7tTX99q
         De84PbIafEoRdMTl7SkojRKvnOgWvtesI9CH0YBXuP7nL/laD0iMmS6u7EggprN1rB/G
         RnfLJsccCn9EmSz/CbgCx9UOzen5J83f4ALQVrLa1ZF+xzqhmp/d0HXcczEkUyAjKSdP
         pWxQ==
X-Gm-Message-State: AAQBX9dH0POYgHRZYq+8bKZG2oAQcrfMQJjxiBzLVzetU8Wk8Gaill4+
        6oEgkwtMj4Tw29JEewT+A3ad0OG2rI6hRxRPBbpfXVN8nAp6vWNB/JHV0fCSVXNkKYsytrfNGVM
        sjnFryIPTtZrKXyHBeqAG7grUH2cjWy3N
X-Received: by 2002:ac8:59d6:0:b0:3ef:62f7:899b with SMTP id f22-20020ac859d6000000b003ef62f7899bmr27471018qtf.57.1682522520264;
        Wed, 26 Apr 2023 08:22:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350a0aPYxzwrOApvjK7xLEB7242kvtOUoVybFBs8mpYeEoKVCRfKatlWTw0FjrDhmiz2Cw4IsHw==
X-Received: by 2002:ac8:59d6:0:b0:3ef:62f7:899b with SMTP id f22-20020ac859d6000000b003ef62f7899bmr27470996qtf.57.1682522520008;
        Wed, 26 Apr 2023 08:22:00 -0700 (PDT)
Received: from enviable.nyu.edu (216-165-95-134.natpool.nyu.edu. [216.165.95.134])
        by smtp.gmail.com with ESMTPSA id i12-20020a05620a27cc00b0074e020ff0e9sm5149169qkp.50.2023.04.26.08.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 08:21:59 -0700 (PDT)
From:   Jonathan Singer <jes965@nyu.edu>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Jorge Lopez <jorge.lopez2@hp.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Jonathan Singer <jes965@nyu.edu>
Subject: [PATCH v2 2/2] platform/x86: hp-wmi: Add HP Envy special key support
Date:   Wed, 26 Apr 2023 11:21:39 -0400
Message-Id: <20230426152139.1692-2-jes965@nyu.edu>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426152139.1692-1-jes965@nyu.edu>
References: <20230426152139.1692-1-jes965@nyu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qi0DcdlAzrJ7PgxbBCLUUJWcPHrwMHsN
X-Proofpoint-GUID: qi0DcdlAzrJ7PgxbBCLUUJWcPHrwMHsN
X-Orig-IP: 209.85.160.200
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260136
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
index a7fb33ac49b8..399163b4aca0 100644
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
@@ -847,11 +849,20 @@ static void hp_wmi_notify(u32 value, void *context)
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

