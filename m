Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFB4C4332B
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BBAD64F84
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbhBCRhX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 12:37:23 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50975 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232324AbhBCRhV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 12:37:21 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 3 Feb 2021 19:36:32 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 113HaOON001002;
        Wed, 3 Feb 2021 19:36:32 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy@infradead.org, hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH RFC platform-next 8/8] Documentation/ABI: Add new line card attributes for mlxreg-io sysfs interfaces
Date:   Wed,  3 Feb 2021 19:36:22 +0200
Message-Id: <20210203173622.5845-9-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210203173622.5845-1-vadimp@nvidia.com>
References: <20210203173622.5845-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add documentation for the new attributes for line cards:
- CPLDs versioning.
- Write protection control for 'nvram' devices.
- Line card reset reasons.
- Enabling burning of FPGA and CPLDs.
- Enabling burning of FPGA and gearbox SPI flashes,
- Enabling power of whole line card.
- Enabling power of QSFP ports equipped on line card.
- The maximum powered required for line card feeding.
- Line card configuration Id.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 92 +++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 1d1a8ee59534..a22e9d6c0904 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -326,3 +326,95 @@ Description:	This file unlocks system after hardware or firmware thermal
 		locking.
 
 		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_pn
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version_min
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show with which CPLD major and minor versions
+		and part number has been burned CPLD device on line card.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_pn
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version_min
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show with which FPGA major and minor versions
+		and part number has been burned FPGA device on line card.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/ini_wp
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/vpd_wp
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow to overwrite line card VPD and firmware blob
+		hardware write protection mode. When attribute is set 1 - write
+		protection is disabled, when 0 - enabled. By default both are
+		write protected.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_ref
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_dc_dc_pwr_fail
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_fpga_not_done
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_from_chassis
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_line_card
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_pwr_off_from_chassis
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files show the line reset cause, as following: power
+		auxiliary outage or power refresh, DC-to-DC power failure, FPGA reset
+		failed, line card reset failed, power off from chassis.
+		Value 1 in file means this is reset cause, 0 - otherwise. Only one of
+		the above causes could be 1 at the same time, representing only last
+		reset cause.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld_upgrade_en
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_upgrade_en
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow CPLD and FPGA burning. Value 1 in file means burning
+		is enabled, 0 - otherwise.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/qsfp_pwr_en
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/pwr_en
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow to power on/off all QSFP ports and whole line card.
+		The attributes are set 1 for power on, 0 - for power off.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/agb_spi_burn_en
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_spi_burn_en
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow gearboxes and FPGA SPI flash burning.
+		The attributes are set 1 to enable burning, 0 - to disable.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/max_power
+What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/config
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files provide the maximum powered required for line card
+		feeding and line card configuration Id.
+
+		The files are read only.
-- 
2.11.0

