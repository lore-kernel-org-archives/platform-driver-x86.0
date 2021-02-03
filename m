Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8343EC433E6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A04564F8C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 17:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbhBCRhW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 12:37:22 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:50946 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232304AbhBCRhU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 12:37:20 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 3 Feb 2021 19:36:27 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 113HaOOI001002;
        Wed, 3 Feb 2021 19:36:27 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy@infradead.org, hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH RFC platform-next 3/8] Documentation/ABI: Add new attributes for mlxreg-io sysfs interfaces
Date:   Wed,  3 Feb 2021 19:36:17 +0200
Message-Id: <20210203173622.5845-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210203173622.5845-1-vadimp@nvidia.com>
References: <20210203173622.5845-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add documentation for the new attributes:
- "lc{n}_enable" - for put/release the line card to/from enable state.
- "lc{n}_pwr" - for power on/off the line card.
- "lc{n}_rst_mask" - for line card reset state enforced by ASIC, when
  it sets it due to some abnormal ASIC behavior.
- "psu3_on"; "psu4_on" - for connection/disconnection power supply unit
  to/from the power source.
- "os_ready" - for indication that OS is taking control over systems
  programmable devices.
- "pm_mgmt_en" - for setting power management control ownership. When
  power management control is provided by hardware, it means that
  hardware will automatically power off one or more line cards in case
  system power budget is under power required for feeding all powered
  on line cards. It could be a case, when some of power units lost
  power good state.
- "shutdown_unlock" - for unlocking system after hardware or firmware
  thermal shutdown, which causes locking of the all interfaces to ASIC.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 103 ++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index fd9a8045bb0c..1d1a8ee59534 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -223,3 +223,106 @@ Description:	These files show with which CPLD part numbers and minor
 		system.
 
 		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc1_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc2_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc3_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc4_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc5_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc6_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc7_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc8_enable
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files allow line cards enable state control.
+		Expected behavior:
+		When  lc{n}_enable is written 1, related line card is released
+		from the reset state, when 0 - is hold in reset state.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc1_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc2_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc3_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc4_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc5_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc6_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc7_pwr
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc8_pwr
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files switching line cards power on and off.
+		Expected behavior:
+		When  lc{n}_pwr is written 1, related line card is powered
+		on, when written 0 - powered off.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc1_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc2_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc3_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc4_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc5_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc6_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc7_rst_mask
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/lc8_rst_mask
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files clear line card reset bit enforced by ASIC, when it
+		sets it due to some abnormal ASIC behavior.
+		Expected behavior:
+		When  lc{n}_rst_mask is written 1, related line card reset bit
+		is cleared, when written 0 - no effect.
+
+		The files are read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/os_ready
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file, when written 1, indicates that OS is taking control
+		over systems programmable devices.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pm_mgmt_en
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file assigns power management control ownership.
+		When power management control is provided by hardware, it means
+		that hardware will automatically power off one or more line
+		cards in case system power budget is under power required for
+		feeding all powered on line cards. It could be a case, when
+		some of power units lost power good state.
+		When pm_mgmt_en is written 1, power management control by
+		software is enabled, 0 - power management control by hardware.
+		Default is 0.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu3_on
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/psu4_on
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	These files switching power supply units on and off.
+		Expected behavior:
+		When  psu3_on or psu4_on is written 1, related unit will be
+		disconnected from the power source, when written 0 - connected.
+
+		The files are write only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
+Date:		March 2021
+KernelVersion:	5.12
+Contact:	Vadim Pasternak <vadimp@nvidia.com>
+Description:	This file unlocks system after hardware or firmware thermal
+		shutdown, which causes locking of the all interfaces to ASIC.
+		When shutdown_unlock is written 1 and after that 0, it removes
+		locking.
+
+		The file is read/write.
-- 
2.11.0

