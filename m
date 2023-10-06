Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1049E81E1F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 17:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbjJFR4f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 13:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbjJFR4e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 13:56:34 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D49B8BE
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 10:56:32 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c28e35752cso30019611fa.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Oct 2023 10:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696614990; x=1697219790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/url4rR0ruvRNM0Ooo8mo6QoRq5VVVX7tUSuJsufO6E=;
        b=SyVB1kXiqdnW5El5VUerHxhaw+NLec2rvXvzXQz/u1R5rks+2/wx/GSEP1RIGymAG8
         lDchuXF4OHYdPMuk9+fEY/h/FtoG1YEkQOdL8G13kZr0qOYMzQC/OcWWHkxucGtN6UPh
         HVi55jdoWKIWPQp01+x/8yp8Ux1H5AS/VSJpO6Rc00tb/w6CDb8VwWUrKKysHJz1Xc4o
         SI3wjqVxRHDLHexilKJGW6XFpTWSG2ZfuoMr1TnpmoJ6lrxUiVLPCQcgCZivixN6L6eU
         WGKoiLx5Yl5NL6wvH/5s5OxOnlrzLITivp8UX/lZCj36i+0X/aJvesK0dowE28XgzY3C
         jQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696614990; x=1697219790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/url4rR0ruvRNM0Ooo8mo6QoRq5VVVX7tUSuJsufO6E=;
        b=Yhsv4/otaumY81cSsCo89YWhVYcMdcz7sWXKB4Kt8hcDUzR6xjBEVpQ18U71PmSnj4
         tQRR+pZOeev6xprtpB08zBlBB/c68L6M2SwRmz+RSgP7NX5P7Tzl6DH8p8kaEG5XG7y9
         QDGeQvXvCFt/57S2v1nV9c8nMd3Kve82p6qOTspwGR1j7Ds19dsZVbqH6SWjRfXq8iZa
         +CRaXfZksD9FzFdeBt8l6XIt2gqO4QEf0BJJMzMMoqJL8gCweEeHUKzeXs7iHgdx1ta6
         L6FwlgUSKT9mpIqIyD5iFTwTR9/fVHxPw1ZvaTKC6wq4EYrH+LI0yyvzqxOqB7veg1rM
         HvBw==
X-Gm-Message-State: AOJu0YxZUp8wvz6ik5mbrs9enPKjgMHNNFBBH49EdKG6vr0IbMKlm4Rf
        Exyfqyx26LCp0JyK1Xk5Qk4SgMvjcuw=
X-Google-Smtp-Source: AGHT+IFvDykzD5sNnyuVfa3pumX/fWGK8BgxZk0qcKPaHDXg9vO6AuWXEYwoqkPWRh1sZtX4h6VnVA==
X-Received: by 2002:a05:6512:3603:b0:4f3:9136:9cd0 with SMTP id f3-20020a056512360300b004f391369cd0mr6133325lfs.44.1696614990318;
        Fri, 06 Oct 2023 10:56:30 -0700 (PDT)
Received: from localhost.localdomain ([81.177.126.202])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ee09000000b00500d1a72734sm379050lfb.130.2023.10.06.10.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 10:56:30 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH v2 0/3] platform/x86: msi-ec: add and fix EC configs
Date:   Fri,  6 Oct 2023 20:53:51 +0300
Message-ID: <20231006175352.1753017-3-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi!

This patch series adds EC configs for more firmware (patch 3),
fixes a couple of issues with an existing configuration (patch 1),
and renames a struct field for consistency with downstream (patch 2)
in the msi-ec driver.

Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
---
Changes in v2:
- Add a Fixes tag
- Split the first patch into two


Nikita Kravets (3):
  platform/x86: msi-ec: Fix the 3rd config
  platform/x86: msi-ec: rename fn_super_swap
  platform/x86: msi-ec: Add more EC configs

 drivers/platform/x86/msi-ec.c | 486 +++++++++++++++++++++++++++++++++-
 drivers/platform/x86/msi-ec.h |   4 +-
 2 files changed, 478 insertions(+), 12 deletions(-)

-- 
2.42.0

