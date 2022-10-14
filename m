Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6ABC433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Oct 2022 23:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiJNX1b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Oct 2022 19:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiJNX1a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Oct 2022 19:27:30 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A69649B4A
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 16:27:29 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id p24-20020a9d6958000000b00661c528849eso2715656oto.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Oct 2022 16:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EFV8AxIYDSCpfetZ1w0TFd35/krdgSI8X4VHfEnltSY=;
        b=H6iexQx3KIIb2meZKtML/352NuCk0acoGGU6qc2NoG/7HMVLFSUrSTE8IDk1qhKxVA
         8TzKxNM46BL3s52KhUr9yo0voKK+PYFNVyxm4Oqvd37kM0X0av4Scpcuz34/TIuI9mjP
         heFaxmnKNplxn+/OB0F8S/K4mYS0HngfPSsdluy+4qCUUi6cTz5kOcl8Cf3fTIUjiItf
         FHFT376OWKfMtLiwVSGVyleaey/UaoCK7fXTN8DUT+nhHKfDsAB7J4odRI+lCiLQZUME
         XFuBbQoc4nUDaTDqT9sKVE2H4K9g6TZb3vQPRtKX+gE0dinVKl8K91iE5AwS+HAs5xsX
         vdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EFV8AxIYDSCpfetZ1w0TFd35/krdgSI8X4VHfEnltSY=;
        b=HMoaSLMAvDkumbM33T26OBGA9th8FL5vkVN8hSY3GleyNjqtqaRhnoFOhyGmDgeZvI
         yX6cFPKagj2VdVCzpKXS5fQUhVqF2qwmOZIL44A6Cy9Vp5kCIMOwItmj8/dpSMqRxTTI
         SQ9+SoXQuBUNoQCwpXnOJrj1Dn8nwLhTmrqU8+SNibQ2/M7E9crZeQ98XDT6mpZ01WtM
         fuPzjzPIFd+YOaijUW3bEiahqnoPK4FaaIj57aeS5WQW8DcyW9TzsiG/yzW+TGZJhyCe
         4sEs0IQF0pupwHcAy9mZfiNc5BWW6327ttOn8bg9z5T7DEPOHMGyk0VY2EOwU6643uZR
         n0qQ==
X-Gm-Message-State: ACrzQf17F8bvMqpkBh22bPmLZTiQLrZwS0sr/d0UHTN+pjaqvT5/GEto
        PiYs0XovRpQG6waTaOIZRdXp13SPgqI=
X-Google-Smtp-Source: AMsMyM5fTk3dhOgL9UzikCLF6czXoWMUUtj6sfjHSXcQDCC83n1FjGPq2u3ElGQvZdnF1mlLt1ashA==
X-Received: by 2002:a05:6830:1644:b0:661:8b9f:16c3 with SMTP id h4-20020a056830164400b006618b9f16c3mr144430otr.235.1665790048887;
        Fri, 14 Oct 2022 16:27:28 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:d0e8:abee:fc20:2322])
        by smtp.gmail.com with ESMTPSA id r6-20020a9d7cc6000000b0066192cb6ccfsm1778431otn.77.2022.10.14.16.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 16:27:28 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/4]  Introduction of HP-BIOSCFG driver
Date:   Fri, 14 Oct 2022 18:27:22 -0500
Message-Id: <20221014232726.31301-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

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

Version: 2

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


 .../testing/sysfs-class-firmware-attributes   |  175 ++-
 drivers/platform/x86/Kconfig                  |    1 +
 drivers/platform/x86/Makefile                 |    1 +
 drivers/platform/x86/hp/Kconfig               |   35 +
 drivers/platform/x86/hp/Makefile              |   19 +
 drivers/platform/x86/hp/biosattr-interface.c  |  286 +++++
 drivers/platform/x86/hp/bioscfg.c             | 1064 +++++++++++++++++
 drivers/platform/x86/hp/bioscfg.h             |  671 +++++++++++
 drivers/platform/x86/hp/enum-attributes.c     |  521 ++++++++
 drivers/platform/x86/hp/int-attributes.c      |  478 ++++++++
 drivers/platform/x86/hp/ordered-attributes.c  |  586 +++++++++
 .../platform/x86/hp/passwdattr-interface.c    |   50 +
 .../platform/x86/hp/passwdobj-attributes.c    |  647 ++++++++++
 drivers/platform/x86/hp/spmobj-attributes.c   |  408 +++++++
 drivers/platform/x86/hp/string-attributes.c   |  457 +++++++
 .../platform/x86/hp/sureadmin-attributes.c    | 1014 ++++++++++++++++
 .../platform/x86/hp/surestart-attributes.c    |  145 +++
 17 files changed, 6557 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/hp/Kconfig
 create mode 100644 drivers/platform/x86/hp/Makefile
 create mode 100644 drivers/platform/x86/hp/biosattr-interface.c
 create mode 100644 drivers/platform/x86/hp/bioscfg.c
 create mode 100644 drivers/platform/x86/hp/bioscfg.h
 create mode 100644 drivers/platform/x86/hp/enum-attributes.c
 create mode 100644 drivers/platform/x86/hp/int-attributes.c
 create mode 100644 drivers/platform/x86/hp/ordered-attributes.c
 create mode 100644 drivers/platform/x86/hp/passwdattr-interface.c
 create mode 100644 drivers/platform/x86/hp/passwdobj-attributes.c
 create mode 100644 drivers/platform/x86/hp/spmobj-attributes.c
 create mode 100644 drivers/platform/x86/hp/string-attributes.c
 create mode 100644 drivers/platform/x86/hp/sureadmin-attributes.c
 create mode 100644 drivers/platform/x86/hp/surestart-attributes.c

-- 
2.34.1

