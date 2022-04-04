Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA40C43217
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 21:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382551AbiDDVbM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380590AbiDDUi3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 16:38:29 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E65125EB8
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 13:36:32 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id e4so11291189oif.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2022 13:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3DP2VETGu/Iuoa+ea/3r5cjfRcfG1p42JYqwFR3hnwo=;
        b=ZtxlaAjX5GgEgJhkrCOCdMTYMrcHLZVzGBb8TKg7g/Jz+5dAlDwpD3J9jAvfsRnn5U
         S+/deJ36qTrvRZSSqqcyhJec2SdmdTmZDLLJjvX+8AFXVbNPqCXAeoUjYYeVJ9wOoZf3
         GBoDCogJrDrtNRbwhc7dSix+CtoGIwm5n2uRGrUtI7z6QU2dfeoAauLB3gzPF9+ZO4jT
         yPMujGnK8PGG2xduTQTtito77lM+aBmy6pQPnhZIZ20XApKI1G0qJKGDCxbfnK4abxd5
         j854TYAmSbeMIB1llowmrlZIYXjSqP1Xr4cvweoGpy0sYsiaEOkgnlJLLccmuIcCSzlk
         K3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3DP2VETGu/Iuoa+ea/3r5cjfRcfG1p42JYqwFR3hnwo=;
        b=LQw39RB98Y5f3zSIJwqtlAuoxnOO/DugdYysRjHzLK2DHZA5pnh8zeIs/KoK/Dt2IX
         L9pnrXs0Uf1LnDSdtcVeMUU05H2rWg5jP4QL6vhqpwhwtPx+NDqFsSnLT5CilZDQ+eKr
         M0dXA2JRbm5M2B8HHA0T08OwiI/ItMnQSZMiOnD8yCxJgGD3wctYsfin1/VVilD5xpGU
         6wZTQejlfzoxbfVd9DjMgPe0IBx6CKCy7ksfwkqSniokFhYArRpE1smh4IilGFddNjgD
         hckQHL/4LlGXSBp31xP0CDbJu8KSgkwErJWO91UJ9aUaoYvxh0znMXrJ+zcIvzoYqB3N
         uuXQ==
X-Gm-Message-State: AOAM533+VaxHmW3z6EgwYooUPcxgjNPqb+Oz/MxIbpCiodNlpVS//Y+g
        eMWV7h8krcFd9UTepdsagKUTJwlw4tk=
X-Google-Smtp-Source: ABdhPJxD80x8iuaStTrLTDj/9r/YjGdexDobr+r+IkXYXj47hX4egQtA7JGOYSqAOA9jykOv9dI/1A==
X-Received: by 2002:aca:aa55:0:b0:2ee:e8e8:cf80 with SMTP id t82-20020acaaa55000000b002eee8e8cf80mr35929oie.64.1649104591361;
        Mon, 04 Apr 2022 13:36:31 -0700 (PDT)
Received: from grumpy-vm.hsd1.tx.comcast.net ([2601:2c3:480:7390:c57b:f63e:33f5:caed])
        by smtp.gmail.com with ESMTPSA id u20-20020a4a9e94000000b003291f6ac4b2sm3765786ook.28.2022.04.04.13.36.30
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 13:36:31 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 6/6] HP Security Features Documentation
Date:   Mon,  4 Apr 2022 15:36:26 -0500
Message-Id: <20220404203626.4311-7-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404203626.4311-1-jorge.lopez2@hp.com>
References: <20220404203626.4311-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Provide documentation for three new security features introduced in
the hp-wmi driver. The security features include Secure Platform
Management, Sure Admin, and Sure Start. Each documentation section
provides security feature description, identifies sysfs directories,
and files exposed by the driver.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next

This patch replaces and provides missing ABI/testing file in
v1-0001-HP-Security-Features-solutions-Documentation patch.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 .../ABI/testing/sysfs-platform-hp-wmi         |  96 ++++++++++++
 Documentation/admin-guide/hp_wmi.rst          | 141 ++++++++++++++++++
 Documentation/admin-guide/index.rst           |   1 +
 3 files changed, 238 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-hp-wmi
 create mode 100644 Documentation/admin-guide/hp_wmi.rst

diff --git a/Documentation/ABI/testing/sysfs-platform-hp-wmi b/Documentation/ABI/testing/sysfs-platform-hp-wmi
new file mode 100644
index 000000000000..836b1cdbc260
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-hp-wmi
@@ -0,0 +1,96 @@
+
+What:		/sys/devices/platform/hp-wmi/spm/kek
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	'kek' is a write-only file that can be used to configure the
+		RSA public key that will be used by the BIOS to verify
+		signatures when setting the signing key.  When written,
+		the bytes should correspond to the KEK certificate
+		(x509 .DER format containing an OU).  The size of the
+		certificate must be less than or equal to 4095 bytes.
+
+
+What:		/sys/devices/platform/hp-wmi/sk
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	'sk' is a write-only file that can be used to configure the RSA
+		public key that will be used by the BIOS to verify signatures
+		when configuring BIOS settings and security features.  When
+		written, the bytes should correspond to the modulus of the
+		public key.  The exponent is assumed to be 0x10001.
+
+
+What:		/sys/devices/platform/hp-wmi/status
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	'status' is a read-only file that returns ASCII text reporting
+		the status information.
+
+		  State:  Not Provisioned / Provisioned / Provisioning in progress
+		  Version:  Major.   Minor
+		  Feature Bit Mask: <16-bit unsigned number display in hex>
+		  SPM Counter: <16-bit unsigned number display in base 10>
+		  Signing Key Public Key Modulus (base64):
+		  KEK Public Key Modulus (base64):
+
+
+What:		/sys/devices/platform/hp-wmi/statusbin
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	'statusbin' is a read-only file that returns identical status
+		information reported by 'status' file in binary format.
+
+
+What:		/sys/devices/platform/hp-wmi/sure_admin/settings
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	'settings' is a file associated with Sure Admin. BIOS settings can
+		be read or written through the Sure Admin settings file in sysfs.
+
+		Expected data format to update BIOS setting
+
+		  [BIOS setting],[new value],[auth token]
+
+		Sample settings reported data
+
+		  {
+			  "Class": "HPBIOS_BIOSEnumeration",
+			  "Name": "USB Storage Boot",
+			  "Path": "\\Advanced\\Boot Options",
+			  "IsReadOnly": 0,
+			  ...
+			  "Value": "Enable",
+			  "Size": 2,
+			  "PossibleValues": [
+				"Disable",
+				"Enable"
+				]
+		  }
+
+
+What:		/sys/devices/platform/hp-wmi/sure_start/audit_log_entry_count
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	audit_log_entry_count is a read-only file that returns the
+		number of existing audit log events available to be read.
+
+		  [No of entries],[log entry size],[Max number of entries supported]
+
+
+What:		/sys/devices/platform/hp-wmi/sure_start/audit_log_entries
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	audit_log_entries is a read-only file that returns the events
+		in the log.
+
+		Audit log entry format
+
+		  Byte 0-15:   Requested Audit Log entry  (Each Audit log is 16 bytes)
+		  Byte 16-127: Unused
diff --git a/Documentation/admin-guide/hp_wmi.rst b/Documentation/admin-guide/hp_wmi.rst
new file mode 100644
index 000000000000..4dcb416bbf08
--- /dev/null
+++ b/Documentation/admin-guide/hp_wmi.rst
@@ -0,0 +1,141 @@
+.. SPDX-License-Identifier: GPL-2.0
+
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
+/sys file system::
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
+following information::
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
+or written through the Sure Admin settings file in sysfs::
+
+	/sys/devices/platform/hp-wmi/sure_admin/settings
+
+Expected data format to update BIOS setting::
+
+	[BIOS setting],[new value],[auth token]
+
+Sample settings reported data::
+
+	{
+		"Class": "HPBIOS_BIOSEnumeration",
+		"Name": "USB Storage Boot",
+		"Path": "\\Advanced\\Boot Options",
+		"IsReadOnly": 0,
+		...
+		"Value": "Enable",
+		"Size": 2,
+		"PossibleValues": [
+			"Disable",
+			"Enable"
+		]
+	}
+
+Sure Start
+==========
+Sure Start provides advanced firmware protection and resiliency by identifying
+and repairing unauthorized BIOS changes.  It maintains an audit log of these
+events and other important system configuration changes.  The following sysfs
+entries can be used to read the contents of the audit log.
+
+**audit_log_entry_count** is a read-only file that returns the number of
+existing audit log events available to be read::
+
+	/sys/devices/platform/hp-wmi/sure_start/audit_log_entry_count
+
+Reported data format::
+
+	[No of entries],[log entry size in bytes],[Max number of entries supported]
+
+
+**audit_log_entries** is a read-only file that returns the events in the log::
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

