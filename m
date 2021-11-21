Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41433C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 19 Feb 2022 14:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237997AbiBSOII (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 19 Feb 2022 09:08:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbiBSOIH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 19 Feb 2022 09:08:07 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9FF1C7E9D
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Feb 2022 06:07:48 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id u18so20356827edt.6
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Feb 2022 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:in-reply-to:references:from:date:subject:to:cc;
        bh=6s/xm7XyYnIdEGc60S6Klz86mwA4bYFMtBqnK00PO/U=;
        b=pHoYLXAhxrF3AvEGSzD3wBjNlTtZrv4u4DWoJauj6pzWZp3VCMtL+gX/g0+LCE3TJw
         BkMsO75v94cFyoA2o/cSdGctiBWVdGQ22vsiu5WAKBAtzmezUKcPySmfXNhY9FMq6q2Z
         Ev21hkJOl4oPWzEqPJwAmJ3Bf1OPMkMu8QluQqjYXDEa9DHIyisCPQP9oTYrKX5sm+B8
         YBsvEecaCWUa8ynAtIAv4Hwbm388TZUanVGyUZrothyns4yhrqSUe8GjZLMkALCXBG1n
         zdj/R5TOhzzQFZKBF+t97lb2bP/ezUzcm/EXCaaShXOB6aCeEjpZYHMnE4XzPJiJ8AMM
         H/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:to:cc;
        bh=6s/xm7XyYnIdEGc60S6Klz86mwA4bYFMtBqnK00PO/U=;
        b=6/DFtVWmL/nUwKgtThRDifiMcllRE/miOtomCQKgqww7h4gXDzIYdzwfvmwHrFhrtO
         XLuGmF7kPpWQFbjKoYF7ClUBludcMplB5GdWAT4ikF0S9h7egU4UCgYM7hbDNU4AEzpI
         ugn1v5jcDrqjZKnR4MufqVKKgJihxqIhbAREsZxvMtvwZ6MKQVRcnXVX1DUjvsaHfSv9
         ov0PvU/kPbvhwdAPnCwcgkG8zcIT4GTv5hNelMmGpidNciK2guV7zUDRVFGe5O5NDZj2
         3oe27O1E4B7jR1bhPTKX0XYtAm3gJ+TbDmThG/qNcSyy7ge7fS6p4NYKehm68U6aqg1q
         JKSQ==
X-Gm-Message-State: AOAM530YTH1HqVrm8qpH+UcGlFw8uLBD5aaz75hjIEUFqO0Sd1/RWrMO
        vLIXkWhp6JJLiG9xAaher0bBWLQ5IDGU9uo=
X-Google-Smtp-Source: ABdhPJxq3YHo6tMhVyXEVU7CkDHFYDvyqL4BahVC/iZfe3U1mtecURFmrn1AHbHKJNr4Xy5o++/qrw==
X-Received: by 2002:a05:6402:c81:b0:410:a329:e27a with SMTP id cm1-20020a0564020c8100b00410a329e27amr12941934edb.142.1645279667090;
        Sat, 19 Feb 2022 06:07:47 -0800 (PST)
Received: from localhost ([2a00:a040:195:22d0:fc1:2409:df36:9b25])
        by smtp.gmail.com with ESMTPSA id bo11sm3205462ejb.24.2022.02.19.06.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 06:07:46 -0800 (PST)
Message-Id: <c83c1074057eec03595b22cbb671a7fb3ebcf192.1645278914.git.matan@svgalib.org>
In-Reply-To: <cover.1645278914.git.matan@svgalib.org>
References: <cover.1645278914.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Sun, 21 Nov 2021 09:43:00 +0200
Subject: [PATCH 1/2] lg-laptop: Recognize more models correctly
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

LG uses 5 instead of 0 in the third (second after 2019) digit of
the year string to indicate newer models in the same year.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index ae9293024c77..a91847a551a7 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -657,6 +657,18 @@ static int acpi_add(struct acpi_device *device)
 	if (product && strlen(product) > 4)
 		switch (product[4]) {
 		case '5':
+			if (strlen(product) > 5)
+				switch (product[5]) {
+				case 'N':
+					year = 2021;
+					break;
+				case '0':
+					year = 2016;
+					break;
+				default:
+					year = 2022;
+				}
+			break;
 		case '6':
 			year = 2016;
 			break;
-- 
Matan.

