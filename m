Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC33C4743C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 14:03:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 835D76023E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 14:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbhFWOGQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Jun 2021 10:06:16 -0400
Received: from mga09.intel.com ([134.134.136.24]:2425 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230206AbhFWOGQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Jun 2021 10:06:16 -0400
IronPort-SDR: fDqWapYVk4uwv5zarFZhobORh2H5AIf60IJY6HFxELlErpiHoFBCjg2+H6LeZ+F2eXP2OlhB+9
 78rcNFJEy5Cg==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207203898"
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; 
   d="scan'208";a="207203898"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 07:02:54 -0700
IronPort-SDR: 6oguYrBUbUCPJWh0P6fCNAFMt3jLAtuNru+yVN8VQluPGCMmcqKnG5gGzZtIb0XeIY0h/jbQ2e
 nmbGzbx3RQsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; 
   d="scan'208";a="639460208"
Received: from intel-tiger-lake-client-platform.iind.intel.com ([10.224.178.120])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jun 2021 07:02:52 -0700
From:   Shravan S <s.shravan@intel.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
Subject: [PATCH V2 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
Date:   Mon, 10 May 2021 13:10:15 +0530
Message-Id: <20210510074016.31627-1-s.shravan@intel.com>
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
    sends notifications whenever there is change in Device Mode. (each OEM has different mechanism
    of updating this DEVICE Mode info). This is notified to User-space applications using 
    the sysfs_notify interface.
•	WWAN Device Service listens for sysfs_notify messages and reads the sysfs data and routes them 
	to Modem using MBIM.

Shravan S (1):
  [x86]: BIOS Dynamic SAR driver for Intel M.2 Modem

 drivers/platform/x86/Kconfig                |  12 +
 drivers/platform/x86/Makefile               |   1 +
 drivers/platform/x86/intel-sar.c            | 550 ++++++++++++++++++++
 include/linux/platform_data/x86/intel-sar.h |  91 ++++
 4 files changed, 654 insertions(+)
 create mode 100644 drivers/platform/x86/intel-sar.c
 create mode 100644 include/linux/platform_data/x86/intel-sar.h


base-commit: 0c18f29aae7ce3dadd26d8ee3505d07cc982df75
-- 
2.17.1

