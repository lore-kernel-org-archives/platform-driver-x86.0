Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4DAC43217
	for <platform-driver-x86@archiver.kernel.org>; Tue, 18 Oct 2022 20:35:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbiJRUfg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 18 Oct 2022 16:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbiJRUff (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Oct 2022 16:35:35 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1542F647D5
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:35:34 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id cb2-20020a056830618200b00661b6e5dcd8so8324488otb.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Oct 2022 13:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KCnDNs8vO8ORQHC1vYFnJCUTce7+aNbVyMBEWpsBflQ=;
        b=n/2GiUUD0AT86b+rW5kTBmAjbcagcywJy7MCfa3TbjH5JsSIaEBFgsXoIxM1DeQNeu
         Ff/gLr58GX0SzdiEKx6PczMrHwG0s9XGrUqw9Y19lx7CV/Qg9C4DeX3BJ9OQBxMjQp0F
         CvSTWTqJiTud4K0TrPtr4nnmJCZQ4GcVbpbkpfJv2frixOmW7234Gz3NiclpxtaTFhIf
         yBdkrLBWaxnw+eMJgS2XpgieEiMoBi5Ue+zQolEA8lV8Y8dCrv3C5WDPPDjwmzcCukyL
         Wk8AbwkMgvkh/Qj2Fmxru43xTW7RrhHeB4E/dz8HrfdvvvYl3HOtB/fHqiVZMjacvx+v
         v9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCnDNs8vO8ORQHC1vYFnJCUTce7+aNbVyMBEWpsBflQ=;
        b=b4MouOwEFRhT+TVje9XZAL1RAxEQvRMU+SVt0BEycKZBhxTfKeKpILrCiJBHu1T5TC
         EjsgcdUKKIflWPRCKrYPW5Oh9e39UZu1ujfihj7/VhtP9TM2j0jdSBzRIAiMzZJTV7y5
         qT64GZrwz3cjlGUyhraEiZXVOiGG5DQmhz9HOaGtk828rY/lRDdZ322P74Tw898ZnCRm
         AbUKiN9sjot5NKskrGxUT/rlqaRE+I7y+KBopTXFJVElIrXIuCWj4QnbEvXvxAmZtrdb
         it9fUtpYJ9uG62wxpPoPaWvrpQEZ6QhZN/mDb2xujyZD9qHa92N7Sn9yZPpwFFxxd1tz
         w7Zg==
X-Gm-Message-State: ACrzQf3JikZC4CdBb8IS20ASps358Ot1UQWTlu/c+8F9dWYSGqN8BZfO
        bDlGU7RehBmg9NIqOFCS3egg7oQuDXk=
X-Google-Smtp-Source: AMsMyM6OlnXBi2WS+vISbcBaPlzsFZSNoLEFrFhQcW4cJQVrFM0ods9R8ULg/pmy7b1lQRcH2mk4gg==
X-Received: by 2002:a05:6830:2705:b0:661:e1a2:825d with SMTP id j5-20020a056830270500b00661e1a2825dmr2239453otu.215.1666125333264;
        Tue, 18 Oct 2022 13:35:33 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:6d8c:32db:7793:d4c0])
        by smtp.gmail.com with ESMTPSA id s4-20020a056870248400b00136cfb02a94sm6580722oaq.7.2022.10.18.13.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 13:35:32 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 0/6] Introduction of HP-BIOSCFG driver
Date:   Tue, 18 Oct 2022 15:35:25 -0500
Message-Id: <20221018203531.17130-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Version 2 -> Version 3
------------------------------------------------------

Introduction of HP-BIOSCFG driver (1/6)
	- No new changes
	
Update pending_reboot state value (2/6)
	- No new changes

Set current_value permissions appropriate to read-only attributes (3/6)
	- No new changes

Improve friendly display name values (4/6)
	- No new changes

Moving existing HP drivers to a central location (5/6)
    
    The purpose of this patch is to provide a central location where all
    HP related drivers are found. HP drivers will recide under hp
    directory with exception of hp-bioscfg.  hp-bioscfg is found under
    hp/hp-bioscfg/ directory.
    
    Introduced changes to Kconfig file to list all HP driver under "HP X86
    Platform Specific Device Drivers" menu option.

    Changes needed to relocate hp-bioscfg driver 
    
    Relocation of the driver requires minor changes such updating the path 
    for a local include file.  Additional changes include update MAINTAINERS 
    file to indicated support status, reviewer, and maintainer of hp-bioscfg 
    driver.  Lastly, removal of 'stddef' include file from the source.

Clarify how elements order list impacts priority (6/6)
    
    This patch provides additional clarification and describes how
    priority is determined according to the order.  Elements listed first
    are given higher priority to those listed last.

Version 1 -> Version 2
------------------------------------------------------

Introduction of HP-BIOSCFG driver (1/4)
	- No new changes

Update pending_reboot state value (2/4)

    There is not a reliable mechanism to programmatically determine which
    BIOS settings require a reboot to be updated.  The latest changes
    leverages “RequiredPhysicalPresence” reported value to set
    pending_reboot.

Set current_value permissions appropriate to read-only attributes (3/4)

    This patch updates ‘current_value’ permissions to match the value
    reported by ‘is_readonly’ value associated with the attribute.
    ‘current_value’ permissions are set to read-only if ‘is_readonly’
    value is 1.  ‘current_value’ permissions are set to read-write if
    ‘is_readonly’ value is zero.   Other read-only and write-only
    permissions will remain unchanged.
    
Improve friendly display name values (4/4)

    The purpose of this patch is to improve the friendly display name for
    few numbers of attributes associated with ‘Schedule Power-ON.’  BIOS
    assign names such ‘Tuesday’ to an attribute. The name is correct, but
    it is not descriptive enough for the user.  It is under those
    conditions a portion of the path data value is append to the attribute
    name to create a user-friendly name.
    
    For instance, the attribute name is ‘Tuesday,’ and the display name
    value is ‘Schedule Power-ON – Tuesday’

    
------------------------------------------------------
Version: 1

  Introduction of HP-BIOSCFG driver (1/4)
  
    The purpose for this patch is submit HP BIOSCFG driver to be list of
    HP Linux kernel drivers.  HP BIOS Configuration driver purpose is to
    provide a driver supporting the latest sysfs class firmware attributes
    framework allowing the user to change BIOS settings and security
    solutions on HP Inc.’s commercial notebooks.
    
    Many features of HP Commercial PC’s can be managed using Windows
    Management Instrumentation (WMI). WMI is an implementation of Web-Based
    Enterprise Management (WBEM) that provides a standards-based interface
    for changing and monitoring system settings.  HP BISOCFG driver provides
    a native Linux solution and the exposed features facilitates the
    migration to Linux environments.
    
    The Linux security features to be provided in hp-bioscfg driver enables
    managing the BIOS settings and security solutions via sysfs, a virtual
    filesystem that can be used by user-mode applications.   The new
    documentation cover features such Secure Platform Management, Sure
    Admin, and Sure Start.  Each section provides security feature
    description and identifies sysfs directories and files exposed by
    the driver.
    
    Many HP Commercial PC’s include a feature called Secure Platform
    Management (SPM), which replaces older password-based BIOS settings
    management with public key cryptography. PC secure product management
    begins when a target system is provisioned with cryptographic keys
    that are used to ensure the integrity of communications between system
    management utilities and the BIOS.
    
    HP Commercial PC’s have several BIOS settings that control its behaviour
    and capabilities, many of which are related to security. To prevent
    unauthorized changes to these settings, the system can be configured
    to use a Sure Admin cryptographic signature-based authorization string
    that the BIOS will use to verify authorization to modify the setting.


Jorge Lopez (6):
  Introduction of HP-BIOSCFG driver
  Update pending_reboot state value
  Set current_value permissions appropriate to read-only attributes
  Improve friendly display name values
  Moving existing HP drivers to a central location
  Clarify how elements order list impacts priority

 .../testing/sysfs-class-firmware-attributes   |  181 ++-
 MAINTAINERS                                   |   15 +-
 drivers/platform/x86/Kconfig                  |    1 +
 drivers/platform/x86/Makefile                 |    4 +-
 drivers/platform/x86/hp/Kconfig               |   84 ++
 drivers/platform/x86/hp/Makefile              |   11 +
 drivers/platform/x86/hp/hp-bioscfg/Makefile   |   19 +
 .../x86/hp/hp-bioscfg/biosattr-interface.c    |  285 +++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 1064 +++++++++++++++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  671 +++++++++++
 .../x86/hp/hp-bioscfg/enum-attributes.c       |  521 ++++++++
 .../x86/hp/hp-bioscfg/int-attributes.c        |  478 ++++++++
 .../x86/hp/hp-bioscfg/ordered-attributes.c    |  586 +++++++++
 .../x86/hp/hp-bioscfg/passwdattr-interface.c  |   50 +
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  647 ++++++++++
 .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  408 +++++++
 .../x86/hp/hp-bioscfg/string-attributes.c     |  457 +++++++
 .../x86/hp/hp-bioscfg/sureadmin-attributes.c  | 1014 ++++++++++++++++
 .../x86/hp/hp-bioscfg/surestart-attributes.c  |  145 +++
 drivers/platform/x86/{ => hp}/hp-wmi.c        |    0
 drivers/platform/x86/{ => hp}/hp_accel.c      |    0
 drivers/platform/x86/{ => hp}/tc1100-wmi.c    |    0
 22 files changed, 6631 insertions(+), 10 deletions(-)
 create mode 100644 drivers/platform/x86/hp/Kconfig
 create mode 100644 drivers/platform/x86/hp/Makefile
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
 rename drivers/platform/x86/{ => hp}/hp-wmi.c (100%)
 rename drivers/platform/x86/{ => hp}/hp_accel.c (100%)
 rename drivers/platform/x86/{ => hp}/tc1100-wmi.c (100%)

--
2.34.1

