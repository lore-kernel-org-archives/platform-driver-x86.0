Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AABF8C77B61
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Apr 2023 20:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236261AbjDYUt2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Apr 2023 16:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbjDYUt1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2023 16:49:27 -0400
Received: from mx0b-00256a01.pphosted.com (mx0b-00256a01.pphosted.com [67.231.153.242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15BD414F4D
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 13:49:25 -0700 (PDT)
Received: from pps.filterd (m0119691.ppops.net [127.0.0.1])
        by mx0b-00256a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33PJ3ccZ037429
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 16:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding;
 s=20180315; bh=2SpjziBxMinJvCqJ5ONrJCSYQ5/Fm7e8HW8ZmGTQ0IU=;
 b=0vIGuUYyFUuWH/Nutk4PhpqX4jK95ddw5GduakQ5sVerOsqGgARbOv/GhETVNXtmmDBH
 PSqKCf2cJSaXjndQKHZguU4qYgRC/ZgYMyQ1OMicV0C6e2vOLXDZsMXVAnJpjdNiO9oy
 3kU3L3dUfXVr4SI8Yb8Bawhhqw22KXiUcR662IsFLShgEgto9J7KKAkCw1iSjiTt4xOK
 Hm5sAa5/63Fcm/YSpdT5gs1mKeCieKuePgfQZx5IQKlCi7AtiJfHnwU39CNcjv+i0fUC
 L6Peffl/R1i3GTAPGN0QFkwe0PHuY1+EuayYJKczL8Of1pTnbH8UaKrUoSgK87aBO8YR ag== 
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
        by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 3q6mpj1r7d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 16:49:25 -0400
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-3ef65714d24so56544211cf.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 13:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682455764; x=1685047764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SpjziBxMinJvCqJ5ONrJCSYQ5/Fm7e8HW8ZmGTQ0IU=;
        b=EWasoLylMgE1gakHZ63ydflh5gH5l/XEMOKV0I1/6vR1/zhRM/e2woi2qlqyBc1hZ4
         2BuEN7pQiVHyWxAmoj04cYFuW8mAmlyl517wLUYHD0xsja+aUvqqKkdxWRpYAeqyDFmV
         okcun5S1jHl6fl+jEm3kaM4B/AqpzRmfy9Za75gE0ytWYnmdUDJ4ZDgZF8g6OIllPx36
         e+/yPVh7ipAhimUiVjys4zTExNEoVLwaOsvoXBFMO6VTv7A0KxE+Td5YcShzTiCGjMVk
         UKsRCSuXs9fX/69FtiZqpsMVNJ+ZAwiidNHOf0VgmuIQ8dIcnBJFn2E7wz0OsU14fn25
         wfIg==
X-Gm-Message-State: AAQBX9dt9pC+JiE40YAlrNHLWsU0Vkw+Fe5ulphokaq7DI/hB2i0Yk+g
        pLdQ0XSmEynCWZLMczv2y/ADr8x+jJqjrDb2JKx6Ub2W6kbEm65TCM/eEheX+HvQa5dKGg3XQgg
        pS928lXwuu+b7FHpSNJ+k2tC4kom6h+TYfgqwfNoh0OQ=
X-Received: by 2002:ac8:5915:0:b0:3d9:45a4:e7b9 with SMTP id 21-20020ac85915000000b003d945a4e7b9mr31977214qty.45.1682455764159;
        Tue, 25 Apr 2023 13:49:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350b6F5UbwNqQllo6hDifdFdxhv68oGQoFJyHsJCyuacxs20tvumkml1OVP7Ld/N1FQaqGqKMMg==
X-Received: by 2002:ac8:5915:0:b0:3d9:45a4:e7b9 with SMTP id 21-20020ac85915000000b003d945a4e7b9mr31977193qty.45.1682455763915;
        Tue, 25 Apr 2023 13:49:23 -0700 (PDT)
Received: from enviable.nyu.edu (216-165-95-139.natpool.nyu.edu. [216.165.95.139])
        by smtp.gmail.com with ESMTPSA id h2-20020a05620a21c200b0074636e35405sm4626821qka.65.2023.04.25.13.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 13:49:23 -0700 (PDT)
From:   Jonathan Singer <jes965@nyu.edu>
To:     platform-driver-x86@vger.kernel.org
Cc:     Jonathan Singer <jes965@nyu.edu>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Jorge Lopez <jorge.lopez2@hp.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: hp-wmi: Add camera toggle switch to HP WMI
Date:   Tue, 25 Apr 2023 16:46:42 -0400
Message-Id: <20230425204643.11582-1-jes965@nyu.edu>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GAkahGdZ1vxXd02WDByiYuAAlYBCVN4Y
X-Proofpoint-ORIG-GUID: GAkahGdZ1vxXd02WDByiYuAAlYBCVN4Y
X-Orig-IP: 209.85.160.199
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0 adultscore=0 mlxscore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=645
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250185
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Previously, when the camera toggle switch was hit, the hp-wmi driver
would report an invalid event code. By adding a case for that in the
event handling switch statement we can eliminate that error code and
enable a framework for potential further kernel handling of that key.
This change was tested on my HP Envy x360 15-ey0023dx laptop, but it
would likely work for any HP laptop with a camera toggle button.

Signed-off-by: Jonathan Singer <jes965@nyu.edu>
---
 drivers/platform/x86/hp/hp-wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 873f59c3e280..b27362209b04 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -90,6 +90,7 @@ enum hp_wmi_event_ids {
 	HPWMI_PEAKSHIFT_PERIOD		= 0x0F,
 	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
 	HPWMI_SANITIZATION_MODE		= 0x17,
+	HPWMI_CAMERA_TOGGLE		= 0x1A,
 	HPWMI_OMEN_KEY			= 0x1D,
 	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
 };
@@ -866,6 +867,8 @@ static void hp_wmi_notify(u32 value, void *context)
 		break;
 	case HPWMI_SANITIZATION_MODE:
 		break;
+	case HPWMI_CAMERA_TOGGLE:
+		break;
 	case HPWMI_SMART_EXPERIENCE_APP:
 		break;
 	default:
-- 
2.40.0

