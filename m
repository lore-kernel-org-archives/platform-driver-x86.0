Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415D7C07E95
	for <platform-driver-x86@archiver.kernel.org>; Fri, 16 Jul 2021 11:25:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E69C613CC
	for <platform-driver-x86@archiver.kernel.org>; Fri, 16 Jul 2021 11:25:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbhGPL2W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 16 Jul 2021 07:28:22 -0400
Received: from mga09.intel.com ([134.134.136.24]:46140 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231680AbhGPL2V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jul 2021 07:28:21 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="210705331"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="210705331"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2021 04:25:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="631046154"
Received: from intel-tiger-lake-client-platform.iind.intel.com ([10.224.178.120])
  by orsmga005.jf.intel.com with ESMTP; 16 Jul 2021 04:25:21 -0700
From:   Shravan S <s.shravan@intel.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com, s.shravan@intel.com
Subject: [PATCH V3 0/1] platform/x86: Add BIOS Dynamic SAR driver for Intel M.2 Modem
Date:   Wed,  2 Jun 2021 10:31:48 +0530
Message-Id: <20210602050149.6230-1-s.shravan@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SAR (Specific Absorption Rate) driver is a host driver implemented for Linux
or chrome platform to limit the exposure of human body to RF frequency by informing
the Intel M.2 modem to regulate the RF power based on SAR data obtained from the sensors
captured in the BIOS. ACPI interface exposes this data from the BIOS to SAR driver. The
front end application in userspace ( eg: Modem Manager) will interact with SAR driver 
to obtain information like the device mode (Example: tablets, laptops, etx), Antenna index,
baseband index, SAR table index and use available communication like MBIM interface to enable
data communication to modem for RF power regulation.

The BIOS gets notified about device mode changes through Sensor Driver. This information is 
given to a (newly created) WWAN ACPI function driver when there is a device mode change. 
The driver then uses a _DSM method to retrieve the required information from BIOS. 
This information is then forwarded to the User-space using the sysfs_notify interface.
A lookup table is maintained inside the BIOS which suggests the SAR Table index and Antenna 
Tuner Table Index values for individual device modes.

The SAR parameters to be used on the Modem differs for each Regulatory Mode like FCC, CE and ISED.
Hence, the SAR parameters are stored separately in the SMBIOS table in the OEM BIOS, 
for each of the Regulatory mode. Regulatory modes will be different based on the region and network
available in that region.

Hence the entire SAR functionality handling is divided into 2 parts:

•	A ACPI function driver implemented that uses a dedicated ACPI node for WWAN device.
    Sends notifications whenever there is change in Device Mode. (each OEM has different mechanism
    of updating this DEVICE Mode info). This is notified to User-space applications using 
    the sysfs_notify interface.
•	WWAN Device Service listens for sysfs_notify messages and reads the sysfs data and routes them 
	to Modem using MBIM.


Shravan S (1):
  platform/x86: Add BIOS Dynamic SAR driver for Intel M.2 Modem

 .../networking/device_drivers/wwan/index.rst  |   9 +-
 .../device_drivers/wwan/intc_sar.rst          |  60 ++++
 drivers/platform/x86/Kconfig                  |  12 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/intel-sar.c              | 326 ++++++++++++++++++
 include/linux/platform_data/x86/intel-sar.h   |  89 +++++
 6 files changed, 493 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/networking/device_drivers/wwan/intc_sar.rst
 create mode 100644 drivers/platform/x86/intel-sar.c
 create mode 100644 include/linux/platform_data/x86/intel-sar.h


base-commit: d936eb23874433caa3e3d841cfa16f5434b85dcf
-- 
2.17.1

