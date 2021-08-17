Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27DCC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 17:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C07860C40
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 17:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhHQRMm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Aug 2021 13:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbhHQRMl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Aug 2021 13:12:41 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B23C5C061764
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Aug 2021 10:12:08 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d17so25529733plr.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Aug 2021 10:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PXdNlja+rCoKgd0kcEEgLVGGuIxN7Yz0fiYwWYb4vvg=;
        b=R6ROpAjxPqcpMN4Fkk5+guMbtbNkUC1vUUsseFFjol53wtA5KC8WJvXclu+OQ+oRDM
         u5x4lEXUOVgD7R4/fJ0aCscPTDG3JtKqiT8elP9NUsS05Yruryyrz6TirbHclMIi4ztn
         /Ur6l+32jSwHjdXHbuVE6AQnTd2iOTSOYhDgKJzzddHGQI2Sg+P5Msdxb7/s0fNUc3dJ
         yM4cqvCLfdsCKZP+hR7n5q13lR6LQlOAKoIOnEXUKkeXAGaru0NA65u4yOBfezMVAYgn
         Vtp0xzBF1p7Neox2Sq2oAqIYC1Y7IqB77X3xf9cxNk8jUgamJdkeDc2U+rSU1/w7vuVI
         3dRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PXdNlja+rCoKgd0kcEEgLVGGuIxN7Yz0fiYwWYb4vvg=;
        b=Z921Dx55P5FbK63d9PhOnlBw+kWk5XXebXuCPIxB6MScesEghAITYJiKmoIn4lDAQr
         83ubvd4H417v2NsKDxlU0a4SE6h+r6k+BUAddLn9cJUAsDS+KyHmq7HMqvxpd6d8UUw7
         VS5EYAVgSc8ahR227Q0TU7UhoVZVcR7eDgcv3iPkLK5fP8oCOg11v5qvIPkH7viivKeW
         q5QNWd8Oq7Xkuy6Fq3w2E3jZ3M1/qV4rfYCBQ192zNWmA5GkSj1jZATYcLOdHfQpTIGW
         Su8Icn9KBpyITiJUHBr5tdIBIqsl8SrvXc1YnhzHSixU8miDt36AoxBCmOdBlkUsnoHD
         vNiw==
X-Gm-Message-State: AOAM530FpVrvcrA9RWFVDEZuV5YUeOe0anchUyhugEqAhinTmKkg9deY
        i0tQGPavFGXJfCVetlgO9lA=
X-Google-Smtp-Source: ABdhPJx1/PowRTicFi7XrOBAo2PohQ6m7VSG2WPl6F8XWXdpnZ1t3OzcUkByixe6H7nXkdMfLQrstw==
X-Received: by 2002:a65:400a:: with SMTP id f10mr4498566pgp.327.1629220328311;
        Tue, 17 Aug 2021 10:12:08 -0700 (PDT)
Received: from localhost ([2604:e8c0::a:1005])
        by smtp.gmail.com with ESMTPSA id x1sm3074408pfn.64.2021.08.17.10.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 10:12:08 -0700 (PDT)
From:   Meng Dong <whenov@gmail.com>
To:     Ike Panhc <ike.pan@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Meng Dong <whenov@gmail.com>
Subject: [PATCH] ideapad-laptop: Fix Legion 5 Fn lock LED
Date:   Wed, 18 Aug 2021 01:12:03 +0800
Message-Id: <20210817171203.12855-1-whenov@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch fixes the bug 212671.
Althrough the Fn lock (Fn + Esc) works on Legion 5 (R7000P), its LED
light does not change with the state. This modification sets the Fn lock
state to its current value on receiving the wmi event
8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 to update the LED state.

Signed-off-by: Meng Dong <whenov@gmail.com>
---
Another possible approach is to call `ideapad_input_report(priv, value)`
to send a keycode and let the user handle the LED by echoing the current
value of /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/fn_lock back
into itself. But the problem with this approach is Fn+F9 and Fn+Esc
trigger the same WMI GUID and event value and I have no idea how to
distinguish them.

 drivers/platform/x86/ideapad-laptop.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 784326bd72f0..48561b666547 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -41,6 +41,7 @@
 static const char *const ideapad_wmi_fnesc_events[] = {
 	"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", /* Yoga 3 */
 	"56322276-8493-4CE8-A783-98C991274F5E", /* Yoga 700 */
+	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", /* Legion 5 */
 };
 #endif
 
@@ -1464,6 +1465,15 @@ static void ideapad_wmi_notify(u32 value, void *context)
 	case 128:
 		ideapad_input_report(priv, value);
 		break;
+	case 208:
+		unsigned long result;
+
+		if (!eval_hals(priv->adev->handle, &result)) {
+			bool state = test_bit(HALS_FNLOCK_STATE_BIT, &result);
+
+			exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
+		}
+		break;
 	default:
 		dev_info(&priv->platform_device->dev,
 			 "Unknown WMI event: %u\n", value);
-- 
2.32.0

