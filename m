Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25205C4361B
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 06:12:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E583223A61
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 06:12:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgLHGM3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Dec 2020 01:12:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbgLHGM2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Dec 2020 01:12:28 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A04C061749
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Dec 2020 22:11:42 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id t6so890416plq.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Dec 2020 22:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UpVQF3Vudkbc3GHoWROwS054gUR7+NaA51Md2j04exk=;
        b=MO4q8Daiy7xSk0OWg8VXqYhYklCqqE1W9wZHqn4xUf/MmMlgyVCQJbCefKD3IlLPo5
         68BreaQqF3oOFwd0dXQ1W523QExDItYrWAaw++qVF1oNxHxlYFD2tf0Q4ZbevR+wkMWp
         tw/c4E5vYcT+MZvCpmFAtI4y3aZOLTLfOUj7LeuIQf0MaNXEIuKa29vMbtbBR7T/6kSE
         GOA3AoUSgYkGvwSiZWOjUOpgvSWDd+5z5G1WoGt6owN/G3rhgy982d0H7OwCjiJS/6f3
         bGiF1i0l5TkxUq4mniAKrcU0gUn2kGlQdAzcmxeaOat9ZKw/Khn5MPRF5syo4Jf3iBts
         kCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UpVQF3Vudkbc3GHoWROwS054gUR7+NaA51Md2j04exk=;
        b=FO8Nb3Tsry8Sl1hs8z2TVAbaACoGs3AahrGpgeCfC++KJyI0c4HtR4jgAC7oWf6hAH
         5l2poXXVWxMlOC0ziMrtuf4tPViHYJhdmSXl1p6JNo39ahedUUPMAJh0IKZpF2yKFE2g
         LXedLszzFW+QVzsmbcVzOQwfKo3bxi5x/f14B6h0IJIQ3/pXPgWvDtIWZJggM3Sy9AC4
         ERzvdTxLGTsJ9estEC6qbBmhbArCZpIgjThZv3OfR4q98KKnL2Tx6gN2KmHMOidFgKQ2
         ZzkFV78EkYj2+zTy82WrS9f8OA8rhl0jyck538DYtGUrrAzdC430ft9SlPGhj1JaQret
         n5Lg==
X-Gm-Message-State: AOAM533fLkWxhuQOxHueKo4ugBkvu2NB02v7rOI4J1XnWbpDA+jYMOLe
        l22Za4hdouIg3doGqszatsq1JQ==
X-Google-Smtp-Source: ABdhPJxQ7wCgvPqgz9ego4638i3fjxTVNJlcUZ2n0nqpNJKE4NIpX6odJWAB6a0FOaM14bjDRvanmA==
X-Received: by 2002:a17:902:a708:b029:da:ec42:a3d4 with SMTP id w8-20020a170902a708b02900daec42a3d4mr11356142plq.40.1607407902173;
        Mon, 07 Dec 2020 22:11:42 -0800 (PST)
Received: from endless.endlessm-sf.com (ec2-34-209-191-27.us-west-2.compute.amazonaws.com. [34.209.191.27])
        by smtp.googlemail.com with ESMTPSA id q35sm1725015pjh.38.2020.12.07.22.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 22:11:41 -0800 (PST)
From:   Chris Chiu <chiu@endlessos.org>
To:     cascardo@holoscopio.com, don@syst.com.br, dvhart@infradead.org,
        andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessos.org, Carlo Caione <carlo@endlessm.com>,
        Chris Chiu <chiu@endlessos.org>
Subject: [PATCH] x86/platform: classmate-laptop: add WiFi media button
Date:   Tue,  8 Dec 2020 14:11:11 +0800
Message-Id: <20201208061111.29073-1-chiu@endlessos.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Carlo Caione <carlo@endlessm.com>

The WiFi media button on the Quanta NL3 reports keycodes 0x8b and 0x9b
to the platform driver. Add the mapping to support these codes.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
Reviewed-by: Chris Chiu <chiu@endlessos.org>
---
 drivers/platform/x86/classmate-laptop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
index af063f690846..3e03e8d3a07f 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -1023,6 +1023,8 @@ static int cmpc_keys_codes[] = {
 	KEY_CAMERA,
 	KEY_BACK,
 	KEY_FORWARD,
+	KEY_UNKNOWN,
+	KEY_WLAN, /* NL3: 0x8b (press), 0x9b (release) */
 	KEY_MAX
 };
 
-- 
2.20.1

