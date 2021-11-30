Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EA4C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 04:15:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbhK3ETM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 29 Nov 2021 23:19:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbhK3ETM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Nov 2021 23:19:12 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C765AC061574
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2021 20:15:53 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id k23so38630744lje.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2021 20:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=oiLUBzfS5kVNp5nqG1DGs/sOGKQpjYJhcmwwqiFFqUc=;
        b=anpwr2WTAPx9nP4LN4JdPP1yo/ibE2ZdQeZcVJ2tO2yumVmqirckoC78d0hNu6Jfur
         YtYnnuK3VLxV/kNEuOokGMP+h7EEfYdpPXeR/ipri3jeIzH5mFNHkQsE1CyGtuxKercu
         46OqN4uxI6FCklE6vx2V/z8gKNfVcH8ro0HCLcE29U0FQWOf7US2vFvHLal8adcsY6LR
         tdF/SSZUvBC/1naiDjYUZEM8jEKt+g3R75zFlfjUa2CqlZgFK0uy84xUqfh6MgPexggO
         6pMQkThFvON8ynrq8jiRJcHro2beeZVCi4KnCSTOKS1pFt50zrShWlMEJVdnz1j9uufu
         7IeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=oiLUBzfS5kVNp5nqG1DGs/sOGKQpjYJhcmwwqiFFqUc=;
        b=zSMZJWGzMg/rbFATpZaLHslEzfPMHUYM7sZ1uwC85oeFJ0ETMzsvUmpRJP5CLx/IVI
         7j73DbqoXyXv9XBCBpZ/NssXzuHYJd5tdNYLM69cq3XykLuvA7cNzLhCJ7o+AojJoa53
         GALE0gmixJYqXvm0OTC9lKWSM9GCIas0HAvn0/1kLIluAo7drWtLUonSOlBIAbKJFl4c
         Ao6kYa3OtMPr4NNT4tPGlXRwtCfBYJT6l0Cnv7nIZjs0o0iWViKfy506jqBKrItQMx2M
         G9hNecgQkJQ8WxT/64lumnzjFSH6O3WA19s65gqoYFpMiyItHsBLbW8vaJBYfz0QMCWA
         1o3A==
X-Gm-Message-State: AOAM530jsjVeTvRauLp6gexuyRXBmp7mmiq9eis0rP38lQLQRmvTiM0h
        K/LYEsEgsIY+AGdEnQr7zG3kdvdZ8YWFMPThF3La7VrQ
X-Google-Smtp-Source: ABdhPJyaTmc1vNv2BEzfQenSJP83dR/x59MW4TVZHWU7lOlXh5ofPRaSzHurb/Vn2aVF7LYPLGDb5tV54PzQxonSBX8=
X-Received: by 2002:a2e:c42:: with SMTP id o2mr13402795ljd.126.1638245751797;
 Mon, 29 Nov 2021 20:15:51 -0800 (PST)
MIME-Version: 1.0
From:   Fabrizio Bertocci <fabriziobertocci@gmail.com>
Date:   Mon, 29 Nov 2021 23:15:40 -0500
Message-ID: <CADtzkx7TdfbwtaVEXUdD6YXPey52E-nZVQNs+Z41DTx7gqMqtw@mail.gmail.com>
Subject: [PATCH 1/1] amd-pmu: fix s2idle failures on certain AMD laptops
To:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On some AMD hardware laptops, the system fails communicating with the
PMU when entering s2idle and the machine is battery powered.

Hardware description: HP Pavilion Aero Laptop 13-be0097nr
CPU: AMD Ryzen 7 5800U with Radeon Graphics
GPU: 03:00.0 VGA compatible controller [0300]: Advanced Micro Devices,
Inc. [AMD/ATI] Device [1002:1638] (rev c1)

Detailed description of the problem (and investigation) here:
https://gitlab.freedesktop.org/drm/amd/-/issues/1799

Patch is a single line: reduce the polling delay in half, from 100uSec
to 50uSec when waiting for a change in state from the PMC after a
write command operation.

Tested on kernel tree detached at tag 5.14
(7d2a07b769330c34b4deabeed939325c77a7ec2f)
After changing the delay, I did not see a single failure on this
machine (I have this fix for now more than one week and s2idle worked
every single time on battery power).

Signed-off-by: Fabrizio Bertocci <fabriziobertocci@gmail.com>
---
diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
index b7e50ed050a8..841c44cd64c2 100644
--- a/drivers/platform/x86/amd-pmc.c
+++ b/drivers/platform/x86/amd-pmc.c
@@ -76,7 +76,7 @@
 #define AMD_CPU_ID_CZN                 AMD_CPU_ID_RN
 #define AMD_CPU_ID_YC                  0x14B5

-#define PMC_MSG_DELAY_MIN_US           100
+#define PMC_MSG_DELAY_MIN_US           50
 #define RESPONSE_REGISTER_LOOP_MAX     20000

 #define SOC_SUBSYSTEM_IP_MAX   12
---
