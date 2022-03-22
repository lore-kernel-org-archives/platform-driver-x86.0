Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54284C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Mar 2022 21:52:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236941AbiCVVwq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Mar 2022 17:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236897AbiCVVwn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Mar 2022 17:52:43 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623A76D96D
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2022 14:51:15 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id i11-20020a9d4a8b000000b005cda3b9754aso1359165otf.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2022 14:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ecP9Iq53zz5AasvC2URp0G6060mXxCava9IKAzYlB7w=;
        b=O+L9hQNzmfynhuyh1v/YEKih8AfgbZtK9GekBUrzQ8JLt6EY/TiiPkPyGxytQBRbqz
         i+3J2h6oqq7HW/HJ5DlTRVT5D0E6MGJ4PtOXstZvgVouASERqu1TkwBLHYbqvcTS90eG
         6CQVujP5xPvIDtcVtQnKAa6POPJJHsFobRfiVcvjdzUNIxabh1IY5hj+RKBy61AXv7SY
         JSRVrJ9bZGPbFerGI7MkdWNGQqPacyk4cVdB/7+AOE2AjxMVSPM0U8iSg30kOluJl3SO
         gvMGg8WTkvfpMLmWQsYwpMJhi5asy/wmGBUMhnbrfpjU/rJw/kD0YLbHXeDv1HIytE99
         Kmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ecP9Iq53zz5AasvC2URp0G6060mXxCava9IKAzYlB7w=;
        b=LekBkt7ylkAOSMcBl5s6QG2vzPOGnZa0YwJ3FaEXfqNG9Tr5792ZqN/T4yCtNApGDM
         xqaMfKDZNGssEIWLBC27Q9PNg2cL51grwyFqhU69dqGSbtCw0N16hPG/cuHdINb9u+3p
         vBAVlIfik2/zg03BBXMdjbpUXGviNZLnqVjLY6Sp0EXfNj+xSNWXb4HU6CrCSWzMsAGw
         nfr3NkzcNgVAEf11mH/29LMo1KsDHzHXXfd3+8dxDybYxLcDg9VzAfjGs64rxULIYSxu
         XiIt6aks6sX1TeFGyxL3H7+8dbIVIXhjJhQJ/UIQODxj3ffdQ8gaahMKIhMtCG42VhrY
         J3mw==
X-Gm-Message-State: AOAM533YEoJYoBVXtF13v2F7HT2gf7rOOcaSeQloZxFTYcpH4NCY6Hug
        vXHAzUL7NLAIQjH5jp4DDlLAC7gEW0A=
X-Google-Smtp-Source: ABdhPJzRMJWtlnJjsmNevreJK+RCJy1oHWQ83FyWMRbOmB7bqrYG37lejMn6pnV5FmNEp3eMFIwm3g==
X-Received: by 2002:a9d:6c58:0:b0:5cd:8ccb:c128 with SMTP id g24-20020a9d6c58000000b005cd8ccbc128mr4976161otq.254.1647985874313;
        Tue, 22 Mar 2022 14:51:14 -0700 (PDT)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:8a31:5c82:5969:c7ae])
        by smtp.gmail.com with ESMTPSA id n6-20020a9d6f06000000b005b266e43c92sm9070830otq.73.2022.03.22.14.51.13
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 14:51:14 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v1] HP Security Features solutions Documentation
Date:   Tue, 22 Mar 2022 16:51:13 -0500
Message-Id: <20220322215113.3110-1-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose for this patch is add documentation for the HP WMI driver.
It describes how to use and manage BIOS settings & security
solutions on HP Inc.’s commercial platforms.  Patches to integrate
the security features in hp-wmi driver will follow shortly.

Many features of HP Commercial PC’s can be managed using Windows
Management Instrumentation (WMI). WMI is an implementation of Web-Based
Enterprise Management (WBEM) that provides a standards-based interface
for changing and monitoring system settings.  HP WMI driver provides
a native Linux solution and the exposed features facilitates the
migration to Linux environments.

The Linux security features to be provided in hp-wmi driver enables
managing the BIOS settings and security solutions via sysfs, a virtual
filesystem that can be used by usermode applications.   The new
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

Document contents was reviewed and approved by HP internal team for
accuracy.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 Documentation/admin-guide/hp_wmi.rst | 115 +++++++++++++++++++++++++++
 Documentation/admin-guide/index.rst  |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 Documentation/admin-guide/hp_wmi.rst

diff --git a/Documentation/admin-guide/hp_wmi.rst b/Documentation/admin-guide/hp_wmi.rst
new file mode 100644
index 000000000000..745de80a7386
--- /dev/null
+++ b/Documentation/admin-guide/hp_wmi.rst
@@ -0,0 +1,115 @@
+.. SPDX-License-Identifier: GPL-2.0
+===========================
+HP Inc. WMI driver (hp_wmi)
+===========================
+
+Purpose
+=======
+To document the use of the HP WMI driver to manage BIOS settings & security
+solutions on HP Inc.’s commercial platforms
+
+Scope
+=====
+This document discusses the functionality of the hp_wmi driver only.
+It does not cover the support needed from applications to configure the BIOS
+settings and enable the security features.
+
+Overview
+========
+Many features of HP Commercial PC’s can be managed using Windows Management
+Instrumentation (WMI).  WMI is an implementation of Web-Based Enterprise
+Management (WBEM) that provides a standards-based interface for changing and
+monitoring system settings.
+
+The hp-wmi driver enables managing the BIOS settings and security solutions
+via sysfs, a virtual filesystem that can be used by usermode applications.
+
+When the driver loads, it creates the following directories and files in the
+/sys file system: ::
+
+	/sys/devices/platform/hp-wmi/spm/kek
+	/sys/devices/platform/hp-wmi/spm/sk
+	/sys/devices/platform/hp-wmi/spm/status
+	/sys/devices/platform/hp-wmi/spm/statusbin
+	/sys/devices/platform/hp-wmi/sure_admin/settings
+	/sys/devices/platform/hp-wmi/sure_start/audit_log_entries
+	/sys/devices/platform/hp-wmi/sure_start/audit_log_entry_count
+
+If the driver is unloaded, all the allocated memory is freed and directories
+and files in the /sys file system removed.
+
+Secure Platform Management
+==========================
+Many HP Commercial PC’s include a feature called Secure Platform Management
+(SPM), which replaces older password-based BIOS settings management with public
+key cryptography.  PC secure product management begins when a target system is
+provisioned with cryptographic keys that are used to ensure the integrity of
+communications between system management utilities and the BIOS.
+
+The private key is used by system management utilities to sign payloads
+containing configuration changes.  The BIOS on a target system uses the
+associated public key to verify the integrity of the payload and apply the
+changes.
+
+At the end of the PC’s lifecycle a signed deprovisioning command restores
+the factory default state.
+
+KEK Certificate (KEK) and Signing Key (SK) get provisioned and status can
+be read either as text from the status file or binary from statusbin. ::
+
+	/sys/devices/platform/hp-wmi/spm/kek
+	/sys/devices/platform/hp-wmi/spm/sk
+	/sys/devices/platform/hp-wmi/spm/status
+	/sys/devices/platform/hp-wmi/spm/statusbin
+
+**status** is a read-only file that returns ASCII text reporting the
+following values: ::
+
+	State:  Not Provisioned / Provisioned / Provisioning in progress
+	Version:  Major.   Minor
+	Feature Bit Mask: <16-bit unsigned number display in hex>
+	SPM Counter: <16-bit unsigned number display in base 10>
+	Signing Key Public Key Modulus (base64):
+	KEK Public Key Modulus (base64):
+
+**kek** is a write-only file that can be used to configure the RSA public
+key that will be used by the BIOS to verify signatures when setting the
+signing key.  When written, the bytes should correspond to the KEK
+certificate (x509 .DER format containing an OU).  The size of the
+certificate must be less than or equal to 4095 bytes.
+
+**sk** is a write-only file that can be used to configure the RSA public
+key that will be used by the BIOS to verify signatures when configuring
+BIOS settings and security features.  When written, the bytes should
+correspond to the modulus of the public key.  The exponent is assumed
+to be 0x10001.
+
+Sure Admin
+==========
+HP Commercial PC’s have several BIOS settings that control its behaviour and
+capabilities, many of which are related to security.  To prevent unauthorized
+changes to these settings, the system can be configured to use a Sure Admin
+cryptographic signature-based authorization string that the BIOS will use to
+verify authorization to modify the setting.
+Behind the scenes, Sure Admin uses Secure Platform Management (SPM) and WMI
+
+**settings** is a file associated with Sure Admin. BIOS settings can be read
+or written through the Sure Admin settings file in sysfs. ::
+
+	/sys/devices/platform/hp-wmi/sure_admin/settings
+
+Sure Start
+==========
+Sure Start provides advanced firmware protection and resiliency by identifying
+and repairing unauthorized BIOS changes.  It maintains an audit log of these
+events and other important system configuration changes.  The following sysfs
+entries can be used to read the contents of the audit log.
+
+**audit_log_entry_count** is a read-only file that returns the number of
+existing audit log events available to be read. ::
+
+	/sys/devices/platform/hp-wmi/sure_start/audit_log_entry_count
+
+**audit_log_entries** is a read-only file that returns the events in the log. ::
+
+	/sys/devices/platform/hp-wmi/sure_start/audit_log_entries
diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 1bedab498104..58b9b0541cb5 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -86,6 +86,7 @@ configure specific aspects of kernel behavior to your liking.
    nfs/index
    gpio/index
    highuid
+   hp_wmi
    hw_random
    initrd
    iostats
-- 
2.25.1

