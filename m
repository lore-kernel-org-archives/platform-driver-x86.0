From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 0/2] Account for uncorrectable failures in probing
Date: Fri,  3 Nov 2017 11:27:20 -0500
Message-ID: <cover.1509725778.git.mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa3.dell-outbound.iphmx.com ([68.232.153.94]:50004 "EHLO
        esa3.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754251AbdKCQ13 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2017 12:27:29 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>

Pali raised some concerns around corner case scenarios that probing
may fail on dell-wmi-descriptor causing dell-wmi and dell-smbios-wmi
to be stuck in infinite deferred probing loops.

This patch series accounts for that corner case.

Changes since original submission:
- Add as second patch that catches potential NULL pointer
- Avoid potential race condition between driver init and calling
  check for if validation successful
Mario Limonciello (2):
  platform/x86: dell-wmi-descriptor: check if memory was allocated
  platform/x86: dell-*wmi*: Relay failed initial probe to dependent
    drivers

 drivers/platform/x86/dell-smbios-wmi.c     |  4 ++++
 drivers/platform/x86/dell-wmi-descriptor.c | 16 ++++++++++++++++
 drivers/platform/x86/dell-wmi-descriptor.h |  7 +++++++
 drivers/platform/x86/dell-wmi.c            |  5 +++++
 4 files changed, 32 insertions(+)

-- 
2.14.1
