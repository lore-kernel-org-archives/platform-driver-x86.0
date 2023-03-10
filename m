Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EDCC6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 04:22:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjCJEWI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Mar 2023 23:22:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjCJEV0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2023 23:21:26 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A181B543
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Mar 2023 20:17:38 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id bo22so4159514pjb.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2023 20:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678421858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAcpMpA4VQxdtvZRKKH/ICMpqaJwhqiMI4kwSgSqYnw=;
        b=ciXKfPOwkYQz8aUMr4dGfAsTnIMDTCVvA/BZ/Fd8OjAYl5GgaGRmB2jOuw5MUH9ZUS
         iEsnWdVaKJDRgEczD3PNrQf42PAztl4r6pAO8/dKRs0t2p4S+M4AoT6acX5C/W2lGcLL
         c4G2jQyrDYb0f2s9BJtiwDebxhwW4xEUa/hhLETVhee6ZEGCdSp9J4YsHTfNAeQiqPkB
         Rj2tm4+DnsXH6ebp6dK4/mf7zM2oVU19RgYOJhvsUoNvDxTt+uog1C9f0j43G1jVJVPU
         YGSqtSWJvFApfSXk7WEdVW7e+X+of8m5PfNhiQCeV7dqI49MOidHOhIMPAb3026umJfm
         jI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678421858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAcpMpA4VQxdtvZRKKH/ICMpqaJwhqiMI4kwSgSqYnw=;
        b=jiJkRtU4QoVUXaTJGLA7611lMCYxfWqIPGzNhfUcesMZj9m7k5v4dQ7CevjYQkVhqL
         zJ46xIe4XT6mZ32XLIgosbJ6uul20h9218G3xyWjrQKR6bz4X8p8zYxVCaJYF/QZzQhN
         6J1ZnsrxDuVAgKb+nqjsAivmX/DodNfWo92oGVoROXEzAxyh1TdoDp5801Mh7Avr8bfd
         N+ytWF0JG8LXn/zd9B1p4UgMf4Ywsdmi+L17Ra9yh+LmzCfPnOPvKUfnBevtyPASsGxX
         rRzJW7TH41DU7Ye7NXqHP6G5ryEzTo6UXQ16sZ3qsRPMiCmERNV61O6wFUaTKVyFLZ9O
         +1eQ==
X-Gm-Message-State: AO0yUKUkzWv4/3gjSOwQfhCBLKy535SdSRUIhOkt+ZhAu909EzVfqo2Q
        G127KA8E56nl9hcsAen/1wI4P7QTSlOEBQ==
X-Google-Smtp-Source: AK7set+Jp3AYM7H4Z8DYjH6X2OzsAL9terTCmSK+kr5/5/lfJTlN+BnOAVXCxyfBLd6QClpRsAI7lw==
X-Received: by 2002:a17:903:22c3:b0:19e:8452:1944 with SMTP id y3-20020a17090322c300b0019e84521944mr30973763plg.5.1678421857680;
        Thu, 09 Mar 2023 20:17:37 -0800 (PST)
Received: from localhost.localdomain ([47.147.242.129])
        by smtp.gmail.com with ESMTPSA id u8-20020a170902e5c800b0019a928a8982sm388406plf.118.2023.03.09.20.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 20:17:37 -0800 (PST)
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
To:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
        soyer@irl.hu
Cc:     Andrew Kallmeyer <kallmeyeras@gmail.com>
Subject: [PATCH 0/2] platform/x86: Add driver for Yoga Tablet mode switch
Date:   Thu,  9 Mar 2023 20:17:24 -0800
Message-Id: <20230310041726.217447-1-kallmeyeras@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20221004214332.35934-1-soyer@irl.hu>
References: <20221004214332.35934-1-soyer@irl.hu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This driver maps the Lenovo Yoga tablet mode switch to a SW_TABLET_MODE input
device. This will make the tablet status available to desktop environments.

This patch series is the result of the discussion at
https://lore.kernel.org/r/CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com/

I decided to follow-up on the patch Gergo wrote and respond to the review
comments to get it merged and available for everyone.

As Gergo said: It should work with  models like the Yoga C940, Ideapad
flex 14API, Yoga 9 14IAP7, Yoga 7 14ARB7.
The 14ARB7 model must trigger the EC to send mode change events. This
might be a firmware bug.

I have additionally tested this on the Yoga 7 14IAL7.

Andrew Kallmeyer (1):
  platform/x86: Move ideapad ACPI helpers to a new header

Gergo Koteles (1):
  platform/x86: Add driver for Yoga Tablet Mode switch

 drivers/platform/x86/Kconfig          |  10 ++
 drivers/platform/x86/Makefile         |   1 +
 drivers/platform/x86/ideapad-laptop.c | 135 +-------------------
 drivers/platform/x86/ideapad-laptop.h | 152 ++++++++++++++++++++++
 drivers/platform/x86/lenovo-ymc.c     | 177 ++++++++++++++++++++++++++
 5 files changed, 341 insertions(+), 134 deletions(-)
 create mode 100644 drivers/platform/x86/ideapad-laptop.h
 create mode 100644 drivers/platform/x86/lenovo-ymc.c

-- 
2.39.2

