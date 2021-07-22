Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C459BC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 12:15:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A226A61029
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Aug 2021 12:15:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236902AbhHQMPv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Aug 2021 08:15:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:25709 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236113AbhHQMPv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Aug 2021 08:15:51 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="196325887"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; 
   d="scan'208";a="196325887"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2021 05:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; 
   d="scan'208";a="441474298"
Received: from intel-tiger-lake-client-platform.iind.intel.com ([10.224.178.120])
  by orsmga002.jf.intel.com with ESMTP; 17 Aug 2021 05:15:16 -0700
From:   Shravan S <s.shravan@intel.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com, s.shravan@intel.com
Subject: [PATCH V6 0/1] platform/x86: BIOS SAR driver for Intel M.2 Modem
Date:   Fri, 23 Jul 2021 03:14:45 +0530
Message-Id: <20210722214446.21987-1-s.shravan@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SAR (Specific Absorption Rate) driver is a host driver implemented for Linux or chrome platform to limit the exposure of human body to RF frequency by informing the Intel M.2 modem to regulate the RF power based on SAR data obtained from the sensors captured in the BIOS. ACPI interface exposes this data from the BIOS to SAR driver. The front end application in userspace ( eg: Modem Manager) will interact with SAR driver to obtain information like the device mode (Example: tablets, laptops, etx), Antenna index, baseband index, SAR table index and use available communication like MBIM interface to enable data communication to modem for RF power regulation.

The BIOS gets notified about device mode changes through Sensor Driver. This information is given to a (newly created) WWAN ACPI function driver when there is a device mode change.
The driver then uses a _DSM method to retrieve the required information from BIOS.
This information is then forwarded to the User-space using the sysfs_notify interface.
A lookup table is maintained inside the BIOS which suggests the SAR Table index and Antenna Tuner Table Index values for individual device modes.

The SAR parameters to be used on the Modem differs for each Regulatory Mode like FCC, CE and ISED.
Hence, the SAR parameters are stored separately in the SMBIOS table in the OEM BIOS, for each of the Regulatory mode. Regulatory modes will be different based on the region and network available in that region.

Hence the entire SAR functionality handling is divided into 2 parts:

•	A ACPI function driver implemented that uses a dedicated ACPI node for WWAN device.
	Sends notifications whenever there is change in Device Mode. (each OEM has different mechanism
	of updating this DEVICE Mode info). This is notified to User-space applications using 
	the sysfs_notify interface.
•	WWAN Device Service listens for sysfs_notify messages and reads the sysfs data and routes them 
	to Modem using MBIM.

Shravan S (1):
  platform/x86: BIOS SAR driver for Intel M.2 Modem

 .../ABI/testing/sysfs-driver-intc_sar         |  57 ++++
 MAINTAINERS                                   |   7 +
 drivers/platform/x86/intel/Kconfig            |   1 +
 drivers/platform/x86/intel/Makefile           |   1 +
 drivers/platform/x86/intel/int1092/Kconfig    |  14 +
 drivers/platform/x86/intel/int1092/Makefile   |   1 +
 .../platform/x86/intel/int1092/intel_sar.c    | 319 ++++++++++++++++++
 .../platform/x86/intel/int1092/intel_sar.h    |  86 +++++
 8 files changed, 486 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intc_sar
 create mode 100644 drivers/platform/x86/intel/int1092/Kconfig
 create mode 100644 drivers/platform/x86/intel/int1092/Makefile
 create mode 100644 drivers/platform/x86/intel/int1092/intel_sar.c
 create mode 100644 drivers/platform/x86/intel/int1092/intel_sar.h


base-commit: 794c7931a2428a656551f2179e6a093233a6e0aa
-- 
2.17.1

