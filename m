Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6A0C07E94
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 13:49:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB7A0613C9
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Jun 2021 13:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhFDNvG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Jun 2021 09:51:06 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]:44690 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbhFDNvF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Jun 2021 09:51:05 -0400
Received: by mail-wr1-f51.google.com with SMTP id f2so9356996wri.11;
        Fri, 04 Jun 2021 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YqUvpMmz705GhCWmLxYJQO2eV15tdQbmMi+pH+r0IAA=;
        b=P2XHJzSEv5j2qYW8no7gmd9OkzP8Sp3FJsV7ID8/aglZddcAyYPTlsQbMPM5t2fcwv
         V96LYgGfI35QKQ1L6ER1tvPqpCUEl1jKSqKehwXHDigkfVhkT3a3NBIJJBRwMqYHoL44
         PgJHURUe3F412mpi6Uglp9cMP/+R+gaS1k//kFxEacZ2vamcSIxFHOhgtRGOkR85Q/w2
         WsfVc0Oqhq/ghwIyvRZhlER6C1nSz2JIXxEN0ytDeWGUUpcPYAi+HQg3zU9diHFFLYwa
         36Xn0nWMM5u5CL+E69du/2USvgAMccYhqs8C3owQpHmsFazxlLPm/N8EznDrFqLtNPFp
         ibxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YqUvpMmz705GhCWmLxYJQO2eV15tdQbmMi+pH+r0IAA=;
        b=jklVEwDoz5zL5fgcJUGCmcpnP7ogWUsRpBo4NUqFuq8aGiPFKnu/GnCg6O/j/QPuE2
         is0rvuAmo971hOEL6DVMDPuCPu1oLTk3qFC18ME1V/Q2prd2r7Nf4bkoZTPV+sojnInT
         ZwP7+GKc+M0Hs2n3TCrMLvg0dwpmu6yphg86+dm9VoYmO0DctxQYuwrcrjFmJpIuSGHs
         0NguMYNfWF4pXqk9ZCvG+aDqIBi0wbb6YMb5JOObsqIM22cV07COgN3xxONSaMSlA88U
         AaOIVxKxW2tkDcypAMuRcEAOgyjRY3p2eVsXMlpoBzTmuONT1yT1gH+sF82xBNfRoloA
         7a4g==
X-Gm-Message-State: AOAM531VHIbRZLd5c531um75EnQYwjcA/K+jYPnni0FcWa0Y002PBM2d
        vQvPVqk656ECOQSie7yM+9Ohhx9FjQY=
X-Google-Smtp-Source: ABdhPJyBIwOfDIbswHqIHJ8pDe3I1nsav/kZOw6+MUuKbpGdn0U4ONh1CKpKibDDgbki3GZiAQQd7A==
X-Received: by 2002:a5d:6952:: with SMTP id r18mr3997593wrw.392.1622814498333;
        Fri, 04 Jun 2021 06:48:18 -0700 (PDT)
Received: from xws.localdomain (pd9e5aba0.dip0.t-ipconnect.de. [217.229.171.160])
        by smtp.gmail.com with ESMTPSA id u16sm7403167wru.56.2021.06.04.06.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 06:48:17 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] platform/surface: aggregator: Extend user-space interface for events
Date:   Fri,  4 Jun 2021 15:47:48 +0200
Message-Id: <20210604134755.535590-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Extend the user-space debug interface so that it can be used to receive
SSAM events in user-space.

Version 1 and rationale:
  https://lore.kernel.org/platform-driver-x86/20210603234526.2503590-1-luzmaximilian@gmail.com/

Changes in version 2:
 - PATCH 2/7: Avoid code duplication, remove unused variable
 - PATCH 4/7: Add missing mutex_destroy() calls

Maximilian Luz (7):
  platform/surface: aggregator: Allow registering notifiers without
    enabling events
  platform/surface: aggregator: Allow enabling of events without
    notifiers
  platform/surface: aggregator: Update copyright
  platform/surface: aggregator_cdev: Add support for forwarding events
    to user-space
  platform/surface: aggregator_cdev: Allow enabling of events from
    user-space
  platform/surface: aggregator_cdev: Add lockdep support
  docs: driver-api: Update Surface Aggregator user-space interface
    documentation

 .../surface_aggregator/clients/cdev.rst       | 127 ++++-
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +-
 drivers/platform/surface/aggregator/Kconfig   |   2 +-
 drivers/platform/surface/aggregator/Makefile  |   2 +-
 drivers/platform/surface/aggregator/bus.c     |   2 +-
 drivers/platform/surface/aggregator/bus.h     |   2 +-
 .../platform/surface/aggregator/controller.c  | 332 +++++++++--
 .../platform/surface/aggregator/controller.h  |   2 +-
 drivers/platform/surface/aggregator/core.c    |   2 +-
 .../platform/surface/aggregator/ssh_msgb.h    |   2 +-
 .../surface/aggregator/ssh_packet_layer.c     |   2 +-
 .../surface/aggregator/ssh_packet_layer.h     |   2 +-
 .../platform/surface/aggregator/ssh_parser.c  |   2 +-
 .../platform/surface/aggregator/ssh_parser.h  |   2 +-
 .../surface/aggregator/ssh_request_layer.c    |   2 +-
 .../surface/aggregator/ssh_request_layer.h    |   2 +-
 drivers/platform/surface/aggregator/trace.h   |   2 +-
 .../surface/surface_aggregator_cdev.c         | 534 +++++++++++++++++-
 include/linux/surface_aggregator/controller.h |  27 +-
 include/linux/surface_aggregator/device.h     |   2 +-
 include/linux/surface_aggregator/serial_hub.h |   2 +-
 include/uapi/linux/surface_aggregator/cdev.h  |  73 ++-
 22 files changed, 1018 insertions(+), 109 deletions(-)

-- 
2.31.1

