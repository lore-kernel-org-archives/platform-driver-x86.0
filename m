Return-Path: <SRS0=p7YD=EK=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A124C388F7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Nov 2020 11:18:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEBBC223AB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Nov 2020 11:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZwFav17U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729675AbgKDLRx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Nov 2020 06:17:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729608AbgKDLR2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Nov 2020 06:17:28 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C44C061A4A
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Nov 2020 03:17:27 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id p1so2457047wrf.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Nov 2020 03:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QwJRAenGdZ42PlyVXV73a6SJR/jbxK4qTgDqEtZcRKI=;
        b=ZwFav17UiX7OB2VG0aiFLtzFz3I529oV9cElzmWVaa4Fki3EDEYq0iPllVsQgQPmMw
         aepxl/tm88EQ8J5edcxCC1EiBmzWci/DkiJhpUumCiIJq8R4DJGzQubVQBE3eH0oURE1
         zfmemkUAL9P7oo4gnjl3/646srMNRa7nnbkInjO0TAi+FLDq5li9Sf3S+GTbrw4k/jJx
         vNotE/y0ZNZZ6GlIjGOK/LVX0YRmu52LwKEErEcevsAMZRgmtN5JVvEeJU1I6VROaMwH
         Yo9XFaAhz+Ja2x8ENv8aRDaUMCMuVExWvUdKRGk/ONxGSw6p4Z1qS8yrr5ucY+rci7xv
         /rig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QwJRAenGdZ42PlyVXV73a6SJR/jbxK4qTgDqEtZcRKI=;
        b=WkoJZiygEpL/w+EjdvZIHD7/zEP0P5oWEElRRc/MYhlp4CI5R0Ys9oGoBQPPF/ooRt
         /ZKV0ldl2pwoFKjufV4uR06mWNcgXq/rDb9CymXBlwlphlMY+sx7BRfkUYXz2S10XY9T
         pXJHFoiDxfqOJ1EXgda158QlkiRIARgudLfIGSOnr5M58IK69bpflYKUZF6QzlrGO78k
         ErVqigG7/WPy9frq9FSWyVCB5F5WfJwj4qA+4p0AysGI/R2jJrLwHlTwPNkwaRWVzO0k
         eeOGB4+TXJmKwjHCwoTAlRrnbZZeg+FMEgJutTMdfN7bDEJ8z01Geu4T5ZzQspzqdn/F
         CyNQ==
X-Gm-Message-State: AOAM530/s4p1LfsLmZff3jHohnceewL9tSyy0KUIMpL5v1j0myKSw7Ey
        6PWbGbUDVZWTLov8mKr66uEp2A==
X-Google-Smtp-Source: ABdhPJylDyszvDYbcQVFZaKGr+c5qdRrKrG+v/xQYoBbfvNo7aVuD4qNL1hMyV3EIru6EViw62tYGQ==
X-Received: by 2002:a05:6000:4c:: with SMTP id k12mr30555969wrx.278.1604488645803;
        Wed, 04 Nov 2020 03:17:25 -0800 (PST)
Received: from dell ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id m14sm2090453wro.43.2020.11.04.03.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 03:17:25 -0800 (PST)
Date:   Wed, 4 Nov 2020 11:17:23 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "David E. Box" <david.e.box@linux.intel.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com, bhelgaas@google.com,
        alexey.budankov@linux.intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and x86 due for the v5.11
 merge window
Message-ID: <20201104111723.GC4488@dell>
References: <20201029014449.14955-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201029014449.14955-1-david.e.box@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Enjoy!

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-x86-v5.11

for you to fetch changes up to 5ef9998c96b0c99c49c202054586967e609286d2:

  platform/x86: Intel PMT Crashlog capability driver (2020-11-04 11:14:38 +0000)

----------------------------------------------------------------
Immutable branch between MFD and x86 due for the v5.11 merge window

----------------------------------------------------------------
Alexander Duyck (3):
      platform/x86: Intel PMT class driver
      platform/x86: Intel PMT Telemetry capability driver
      platform/x86: Intel PMT Crashlog capability driver

David E. Box (2):
      PCI: Add defines for Designated Vendor-Specific Extended Capability
      mfd: Intel Platform Monitoring Technology support

 Documentation/ABI/testing/sysfs-class-intel_pmt | 119 +++++++++
 MAINTAINERS                                     |   6 +
 drivers/mfd/Kconfig                             |  10 +
 drivers/mfd/Makefile                            |   1 +
 drivers/mfd/intel_pmt.c                         | 223 ++++++++++++++++
 drivers/platform/x86/Kconfig                    |  34 +++
 drivers/platform/x86/Makefile                   |   3 +
 drivers/platform/x86/intel_pmt_class.c          | 297 +++++++++++++++++++++
 drivers/platform/x86/intel_pmt_class.h          |  52 ++++
 drivers/platform/x86/intel_pmt_crashlog.c       | 328 ++++++++++++++++++++++++
 drivers/platform/x86/intel_pmt_telemetry.c      | 160 ++++++++++++
 include/uapi/linux/pci_regs.h                   |   5 +
 12 files changed, 1238 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-intel_pmt
 create mode 100644 drivers/mfd/intel_pmt.c
 create mode 100644 drivers/platform/x86/intel_pmt_class.c
 create mode 100644 drivers/platform/x86/intel_pmt_class.h
 create mode 100644 drivers/platform/x86/intel_pmt_crashlog.c
 create mode 100644 drivers/platform/x86/intel_pmt_telemetry.c

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
