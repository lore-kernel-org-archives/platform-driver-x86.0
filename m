Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7F1C47088
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Dec 2022 17:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbiLBRg2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Dec 2022 12:36:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233736AbiLBRg2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Dec 2022 12:36:28 -0500
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE09ECE58
        for <platform-driver-x86@vger.kernel.org>; Fri,  2 Dec 2022 09:36:20 -0800 (PST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1432a5f6468so6278160fac.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Dec 2022 09:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TtwyRzJBWbgJ+IMoPJNObnDmyL9qDHdUBJR8YpaRPc=;
        b=HtazYQk1BXWu0qj6srTYEZLWlHazWhTgQu/xPSfDCorVocNTcNIsz4d9ZCwaXcPeEI
         eZhtxeX1wTE/uMM9QCrd8IoUJdaLOXwphIg16hUyXTpxUSXehvKJg/vf36cY69WUse2X
         /P7QnjwWAio/eo86/Mlp/NCIoOflKl/JlnGjiQESAVIpV/01tAVUnPGekEm2isnufIQh
         K+o1VuRUkgOs+O/oTia87FrDl5JZF5K2K2q31gZEsKdgzux33zjC6QCX9hJA6iLihzhx
         zUKJs3WfxwE0697dp4iP3blc1lCOy9ZbYVekTM8YbuqZadZQLyOJs8iuAR5wubhKDbNw
         pzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TtwyRzJBWbgJ+IMoPJNObnDmyL9qDHdUBJR8YpaRPc=;
        b=2aDavHE0GcH6e8Fay7x/qQxA/Dd+mqZgUdLFqhvI4mU6M1ptnO7KSZ1/KAfeDIKLNg
         2N+2zvxXKfu1UhwZvLSJb3Wu0Z4PRnyq0CKnZNdY2hElstxB347Ah9h02NEQdKhnnFnk
         SEPXOJFSqe6r+AoyZpndtAzGYR5HVKchdpcSDLcpoduSf8N6sTsqVdOOA42Pdz0Hv/rg
         zUZWJHd/WLdG54XbNwLgJfdRQqyZg4VKEcrbN0bdyexbgVzoeD3LvlRf7Tb9375Z04W8
         zQkyvIOdL2DedXiLIOlLhgx6rxxQ7k5uHRkTn2sMreD+GnV04c9paX/1kLEe92FZ6Ber
         5YEw==
X-Gm-Message-State: ANoB5pkGIEpAaFpZ0mmjRL1WTt35/V1LiwsfCrFDDkov6YgspBoYDr/M
        u/XI2q2kAGDvykfsywCYmo5UGEhUp2wjlw==
X-Google-Smtp-Source: AA0mqf6sy5ShrO0I7NYSsJkTp3ucedfqbNcWIeB0VcSliFyytmGfWu0e4dOSI3R5o7mI7worszm9Hg==
X-Received: by 2002:a05:6870:c0b:b0:143:a7c5:add2 with SMTP id le11-20020a0568700c0b00b00143a7c5add2mr15470856oab.175.1670002579867;
        Fri, 02 Dec 2022 09:36:19 -0800 (PST)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:bec7:8390:5104:e759])
        by smtp.gmail.com with ESMTPSA id n7-20020a056870558700b0013cd709659dsm4371692oao.52.2022.12.02.09.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:36:19 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 1/5] Introduction of HP-BIOSCFG driver (1)
Date:   Fri,  2 Dec 2022 11:36:12 -0600
Message-Id: <20221202173616.180108-2-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202173616.180108-1-jorge.lopez2@hp.com>
References: <20221202173616.180108-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose for this patch is submit HP BIOSCFG driver to be list of
HP Linux kernel drivers.  The driver include a total of 12 files
broken in several patches.  This is set 1 of 4.

HP BIOS Configuration driver purpose is to provide a driver supporting
the latest sysfs class firmware attributes framework allowing the user
to change BIOS settings and security solutions on HP Inc.’s commercial
notebooks.

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

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next

History

Version 5
	Remove version 4 patch 1
	Address review changes proposed in Version 4
	Reorganize all patches number and file order
---
 .../testing/sysfs-class-firmware-attributes   | 181 +++++++++++++++++-
 MAINTAINERS                                   |   6 +
 drivers/platform/x86/hp/Kconfig               |  16 ++
 drivers/platform/x86/hp/Makefile              |   1 +
 drivers/platform/x86/hp/hp-bioscfg/Makefile   |  19 ++
 5 files changed, 221 insertions(+), 2 deletions(-)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 4cdba3477176..da8e06d9bb43 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -22,6 +22,13 @@ Description:
 			- integer: a range of numerical values
 			- string
 
+		HP specific types
+		-----------------
+			- ordered-list - a set of ordered list valid values
+			- sure-admin
+			- sure-start
+
+
 		All attribute types support the following values:
 
 		current_value:
@@ -126,6 +133,67 @@ Description:
 					value will not be effective through sysfs until this rule is
 					met.
 
+		HP specific class extensions
+		------------------------------
+
+		On HP systems the following additional attributes are available:
+
+		"ordered-list"-type specific properties:
+
+		elements:
+					A file that can be read to obtain the possible
+					list of values of the <attr>. Values are separated using
+					semi-colon (``;``). The order individual elements are listed
+					according to their priority.  An Element listed first has the
+					hightest priority. Writing the list in a different order to
+					current_value alters the priority order for the particular
+					attribute.
+
+		"sure-admin"-type specific properties:
+
+		settings:
+					A file associated with Sure Admin. BIOS settings can
+					be read or written through the Sure Admin settings file in sysfs.
+
+					[BIOS setting],[new value],[auth token]
+
+					Sample settings reported data
+
+					{
+						"Class": "HPBIOS_BIOSEnumeration",
+						"Name": "USB Storage Boot",
+						"Path": "\\Advanced\\Boot Options",
+						"IsReadOnly": 0,
+						...
+						"Value": "Enable",
+						"Size": 2,
+						"PossibleValues": [
+							"Disable",
+							"Enable"
+							]
+					}
+
+					This file can also be written to in order to update
+					the value sof a <attr> using a CMSL generated payload.
+					For example:
+
+					<attr>,[value],[CMSL generated payload]
+
+		"sure-start"-type specific properties:
+
+		audit_log_entries:
+					A read-only file that returns the events in the log.
+
+					Audit log entry format
+
+					Byte 0-15:   Requested Audit Log entry  (Each Audit log is 16 bytes)
+					Byte 16-127: Unused
+
+		audit_log_entry_count:
+					A read-only file that returns the number of existing audit log events available to be read.
+
+					[No of entries],[log entry size],[Max number of entries supported]
+
 What:		/sys/class/firmware-attributes/*/authentication/
 Date:		February 2021
 KernelVersion:	5.11
@@ -206,7 +274,7 @@ Description:
 		Drivers may emit a CHANGE uevent when a password is set or unset
 		userspace may check it again.
 
-		On Dell and Lenovo systems, if Admin password is set, then all BIOS attributes
+		On Dell, Lenovo, and HP systems, if Admin password is set, then all BIOS attributes
 		require password validation.
 		On Lenovo systems if you change the Admin password the new password is not active until
 		the next boot.
@@ -296,6 +364,15 @@ Description:
 						echo "signature" > authentication/Admin/signature
 						echo "password" > authentication/Admin/certificate_to_password
 
+		HP specific class extensions
+		--------------------------------
+
+		On HP systems the following additional settings are available:
+
+		role: enhanced-bios-auth:
+					This role is specific to Secure Platform Management (SPM) attribute.
+					It requires configuring an endorsement (kek) and signing certificate (sk).
+
 
 What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
 Date:		February 2021
@@ -311,7 +388,7 @@ Description:
 			==	=========================================
 			0	All BIOS attributes setting are current
 			1	A reboot is necessary to get pending BIOS
-			        attribute changes applied
+				attribute changes applied
 			==	=========================================
 
 		Note, userspace applications need to follow below steps for efficient
@@ -364,3 +441,103 @@ Description:
 		use it to enable extra debug attributes or BIOS features for testing purposes.
 
 		Note that any changes to this attribute requires a reboot for changes to take effect.
+
+
+		HP specific class extensions
+		--------------------------------
+
+What:		/sys/class/firmware-attributes/*/authentication/SPM/kek
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
+What:		/sys/class/firmware-attributes/*/authentication/SPM/sk
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
+What:		/sys/class/firmware-attributes/*/authentication/SPM/status
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
+What:		/sys/class/firmware-attributes/*/authentication/SPM/statusbin
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	'statusbin' is a read-only file that returns identical status
+		information reported by 'status' file in binary format.
+
+
+What:		/sys/class/firmware-attributes/*/attributes/Sure_Admin/settings
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
+What:		/sys/class/firmware-attributes/*/attributes/Sure_Start/audit_log_entry_count
+Date:		March 29
+KernelVersion:	5.18
+Contact:	"Jorge Lopez" <jorge.lopez2@hp.com>
+Description:	audit_log_entry_count is a read-only file that returns the
+		number of existing audit log events available to be read.
+
+		  [No of entries],[log entry size],[Max number of entries supported]
+
+
+What:		/sys/class/firmware-attributes/*/attributes/Sure_Start/audit_log_entries
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 893c63e8beef..6cc9dd0c9ec2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9363,6 +9363,12 @@ S:	Obsolete
 W:	http://w1.fi/hostap-driver.html
 F:	drivers/net/wireless/intersil/hostap/
 
+HP BIOSCFG DRIVER
+M:	Jorge Lopez <jorge.lopez2@hp.com>
+S:	Maintained
+L:      platform-driver-x86@vger.kernel.org
+F:	drivers/platform/x86/hp/hp-bioscfg/
+
 HP COMPAQ TC1100 TABLET WMI EXTRAS DRIVER
 L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
index ae165955311c..7fef4f12e498 100644
--- a/drivers/platform/x86/hp/Kconfig
+++ b/drivers/platform/x86/hp/Kconfig
@@ -60,4 +60,20 @@ config TC1100_WMI
 	  This is a driver for the WMI extensions (wireless and bluetooth power
 	  control) of the HP Compaq TC1100 tablet.
 
+config HP_BIOSCFG
+	tristate "HP BIOS Configuration Driver"
+	default m
+	depends on ACPI_WMI
+	select NLS
+	select FW_ATTR_CLASS
+	help
+	  This driver enables administrators to securely manage BIOS settings
+	  using digital certificates and public-key cryptography that eliminate
+	  the need for passwords for both remote and local management. It supports
+	  changing BIOS settings on many HP machines from 2018 and newer without
+	  the use of any additional software.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called hp-bioscfg.
+
 endif # X86_PLATFORM_DRIVERS_HP
diff --git a/drivers/platform/x86/hp/Makefile b/drivers/platform/x86/hp/Makefile
index db1eed4cd7c7..e4f908a61acf 100644
--- a/drivers/platform/x86/hp/Makefile
+++ b/drivers/platform/x86/hp/Makefile
@@ -8,3 +8,4 @@
 obj-$(CONFIG_HP_ACCEL)		+= hp_accel.o
 obj-$(CONFIG_HP_WMI)		+= hp-wmi.o
 obj-$(CONFIG_TC1100_WMI)	+= tc1100-wmi.o
+obj-$(CONFIG_HP_BIOSCFG)	+= hp-bioscfg/
diff --git a/drivers/platform/x86/hp/hp-bioscfg/Makefile b/drivers/platform/x86/hp/hp-bioscfg/Makefile
new file mode 100644
index 000000000000..cc1a613f9223
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/Makefile
@@ -0,0 +1,19 @@
+obj-$(CONFIG_HP_BIOSCFG) := hp-bioscfg.o
+
+hp-bioscfg-objs := bioscfg.o	\
+	enum-attributes.o	\
+	int-attributes.o	\
+	string-attributes.o	\
+	passwdobj-attributes.o	\
+	biosattr-interface.o	\
+	passwdattr-interface.o	\
+	ordered-attributes.o	\
+	surestart-attributes.o	\
+	spmobj-attributes.o	\
+	sureadmin-attributes.o
+
+default:
+	make -C /lib/modules/`uname -r`/build M=$(PWD) hp-bioscfg.ko
+
+clean:
+	make -C /lib/modules/`uname -r`/build M=$(PWD) clean
-- 
2.34.1

