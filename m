Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597C2C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Nov 2021 20:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238970AbhKWUWw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Nov 2021 15:22:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237077AbhKWUWv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 15:22:51 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35BA5C061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Nov 2021 12:19:43 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id t5so392539edd.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Nov 2021 12:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version;
        bh=0MqILgxXppDkEKLwiTJninixeDa0Ln5+eVLsWvzieHI=;
        b=toSZhE/19Xe+JO6L3GzDAag9ZQsT3kfuy7O0tPuhExnr1mlBN5/3KdSqyqFZqE/Jky
         NOlJxEJKZOAKMdOaONAMKSMmTotbMys8ehM0NdhedU+6rvFgvgrtz78RkQIcUe4VwGFP
         F4v8WCSEEjRJ1nhIatocT+/WQuaDMzkgQY19fP2enESnfByd6HejTg4HvIGs0vVMu3BO
         3H3qMRfXDAUuyCX8es89m1rOagE89NOujAn9H8oVQCg0AYkKornhnl0fLgOtn63rd1eI
         tW82NHq4ol5zzSZw4MHyg95RdPEq63cYloIbJtqoGSbpN5p+Y4itcn75itMS/m0I83vQ
         BphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version;
        bh=0MqILgxXppDkEKLwiTJninixeDa0Ln5+eVLsWvzieHI=;
        b=1ySaUeYje+mXegaTp1Ugumms9OuA8wiuUrgiiAbQIvwfE0OCg2oo2Qjy3iYu/9Q1sZ
         2pS+bZjCSkBnkfFSTjiOV4fabN40JL2s+AdSNN49WM9HRvupgfWBWZpj/MGus0IShSx5
         kptjs1PNE0/V6TW7ki0ptXQUTFJGipz2aCqT8IC0c3KYyysR4KEkHZG8D8zZkRg51szh
         rRG2y10WrpXCxPugtEZR3UIhIWuU4Px7wD/3OomEBslVk3+6BVyNiyTWPtZmEenq4Kln
         z85b0PWgCXPuELggeu6axloNL4dzCGt8xFsdNkqYgbu1qqIVDCLLZxlKQT3Q3XCRukvA
         73FA==
X-Gm-Message-State: AOAM533tfUqnEAWHLOs3G2KLjUMSpcZZ/yKuhr2FuIBj2nJEPPqxouVv
        RI9hebBldroPqvcEB21vKOhMLO6q3ZYvQaiWkg==
X-Google-Smtp-Source: ABdhPJzMGVHMzva3Z/9m2AOYTCxRl2DXQMwJfxqVkY2+z2W8YZGNjeUlesYj9zazwfkZY6djusO6xg==
X-Received: by 2002:aa7:c3c8:: with SMTP id l8mr13899424edr.278.1637698781557;
        Tue, 23 Nov 2021 12:19:41 -0800 (PST)
Received: from localhost ([80.246.130.57])
        by smtp.gmail.com with ESMTPSA id h10sm6052061edk.41.2021.11.23.12.19.40
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 12:19:41 -0800 (PST)
Received: from 127.0.0.1 (ident=unknown) by gram.home with esmtp
 (masqmail 0.2.21) id 1mpcBr-1uF-00; Tue, 23 Nov 2021 22:14:55 +0200
Date:   Tue, 23 Nov 2021 22:14:55 +0200 (IST)
From:   Matan Ziv-Av <matan@svgalib.org>
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
cc:     Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] lg-laptop: Recognize more models
Message-ID: <c752b3b2-9718-bd9a-732d-e165aa8a1fca@svgalib.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


LG uses 5 instead of 0 in the third digit (second digit after 2019) 
of the year string to indicate newer models in the same year. Handle 
this case as well.

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

