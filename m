Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19436C636D6
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Feb 2023 15:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbjBIPVj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Feb 2023 10:21:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbjBIPVi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Feb 2023 10:21:38 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25D972AF
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Feb 2023 07:21:36 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id o20so3618172lfk.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Feb 2023 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cthpLXx0f+oWoF1dzgJ83xt8I8sgWAj9IDXrTHyK+HI=;
        b=pvSCPpmO6boIlc/8GfJMMZzVFLc8xPOCk6GRM1D1yvs8C3YfOL03iFuuWDm3B7sYWu
         lUCiSMqMtePy6ReBPEfPhpFvl64fluB1sC4RWlcuFYEe6FG1SNQ58Iy07mPDzJ2J82N9
         fJcIn/YLn1uIZGQ1Rw0Z40Sy2klnUAbZ0BsxIq/qKQczg8ZAiGlycakmVRQi4POjteqX
         148tu/+ka4f43RCGmErg6mO/nnfo8hOrLMtVoPDkXLzwsKTbc+5Iqi8yc1uddSNDqkwt
         MLEV2PpyLe/V103g4xavt6ki34d2x/vx41L3frrGhph9NtbGVQTZQb4ihHjTqH6ilXKQ
         /ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cthpLXx0f+oWoF1dzgJ83xt8I8sgWAj9IDXrTHyK+HI=;
        b=LdweCdNY5+zXE/DPb1nIRF7fR3zzvbzrmlCAgQAjS0foF9wUqtCbB2b+ZfrJxk1bfe
         dEG16Ddag5qAbgCwjWFjHgd8HoMLQ4J7M50CIdCJORg+SEsOYjj8xk3L8tcQuqPtmMp+
         TvHvrQYZe2exDOCsJ2UtChjsuUtbiLpNOB42jfSdee0bRcMWBprNOmScefaWXrfez7N6
         8JV32Jn0zkwFXBbXFmMnlaBAXszc8Ig0qvGCiyluLci/otencUO0uIjCtVB21PAzSVBW
         u3wslzKcQOkX5Rse0pUBF6sV9whvwzco2K3dbtof7dFlykZHCxdJIJHcwsYKAMZMaXbC
         LX2Q==
X-Gm-Message-State: AO0yUKWfcnV+BgBDSeo+FMOZLsSsjVFKjMl8JYIAyi83r0LuPNzmBh3f
        IBHNTF7e1SnDPRyrUDhhdp0rNA==
X-Google-Smtp-Source: AK7set+TU+Y0EfByBRNfYHVNJGDzXTPUI812KqOgxmhS1mCgtjOMwkkgxe3xIvsXQ/qenGNxWLuRAg==
X-Received: by 2002:a05:6512:40d:b0:4d8:530b:25b7 with SMTP id u13-20020a056512040d00b004d8530b25b7mr2736443lfk.58.1675956094955;
        Thu, 09 Feb 2023 07:21:34 -0800 (PST)
Received: from jazctssd.c.googlers.com.com (138.58.228.35.bc.googleusercontent.com. [35.228.58.138])
        by smtp.gmail.com with ESMTPSA id l7-20020ac25547000000b004d40e22c1eesm145037lfk.252.2023.02.09.07.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:21:34 -0800 (PST)
From:   Grzegorz Jaszczyk <jaz@semihalf.com>
To:     linux-kernel@vger.kernel.org, rafael@kernel.org
Cc:     dmy@semihalf.com, tn@semihalf.com, dbehr@google.com,
        zide.chen@intel.corp-partner.google.com, seanjc@google.com,
        upstream@semihalf.com, hdegoede@redhat.com, markgross@kernel.org,
        dtor@google.com, mario.limonciello@amd.com,
        linux-pm@vger.kernel.org, x86@kernel.org,
        platform-driver-x86@vger.kernel.org,
        Grzegorz Jaszczyk <jaz@semihalf.com>
Subject: [RESEND RFCv2 0/1] x86: allow to notify host about guest entering s2idle
Date:   Thu,  9 Feb 2023 15:21:22 +0000
Message-Id: <20230209152123.3186930-1-jaz@semihalf.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

<Resend with some extra lists added to the Cc>

According to the mailing list discussion [1] about the preferred approach
for notifying hypervisor/VMM about guest entering s2idle state this RFC was
implemented.

Instead of original hypercall based approach, which involves KVM change [2]
and makes it hypervisor specific, implement different mechanism, which
takes advantage of MMIO/PIO trapping and makes it hypervisor independent.

For the RFCv1 [3]:
  Patch #1 extends S2Idle ops by new notify handler which will be invoked as a
  very last command before system actually enters S2Idle states. It also allows
  to register and use driver specific notification hook which is used in
  patch #2.

  Patch #2 introduces new driver for virtual PMC, which registers
  acpi_s2idle_dev_ops's notify handler. Its implementation is based on an
  ACPI _DSM evaluation, which in turn can perform MMIO access and allow to
  trap and therefore notify the VMM about guest entering S2Idle state.

For the RFCv2: the patch #1 was dropped as in the meantime Mario Limonciello
introduced a very similar patch [4] which uses s/notify/check and invokes the
callback a bit earlier just before s2idle_entry. Mentioned patch has already
been merged.

This patchset is marked as RFC since patch #2 implements driver for non
existing device "HYPE0001", which ACPI ID was not registered yet.
Furthermore the required registration process [5] will not be started
before getting positive feedback about this patchset.

[1] https://patchwork.kernel.org/project/linux-pm/patch/20220609110337.1238762-2-jaz@semihalf.com/
[2] https://patchwork.kernel.org/project/linux-pm/patch/20220609110337.1238762-3-jaz@semihalf.com/
[3] https://patchwork.kernel.org/project/linux-pm/cover/20220707125329.378277-1-jaz@semihalf.com/
[4] https://patchwork.kernel.org/project/linux-pm/patch/20220829162953.5947-2-mario.limonciello@amd.com
[5] https://uefi.org/PNP_ACPI_Registry

Grzegorz Jaszczyk (1):
  platform/x86: Add virtual PMC driver used for S2Idle

 drivers/platform/x86/Kconfig    |  7 ++++
 drivers/platform/x86/Makefile   |  3 ++
 drivers/platform/x86/virt_pmc.c | 73 +++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 drivers/platform/x86/virt_pmc.c

-- 
2.39.1.519.gcb327c4b5f-goog

