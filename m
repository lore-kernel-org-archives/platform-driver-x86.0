From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v2 0/2] Account for uncorrectable failures in probing
Date: Thu,  9 Nov 2017 11:49:08 -0600
Message-ID: <cover.1510246939.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa5.dell-outbound.iphmx.com ([68.232.153.95]:52654 "EHLO
        esa5.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751066AbdKIRtT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Nov 2017 12:49:19 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>

Pali raised some concerns around corner case scenarios that probing
may fail on dell-wmi-descriptor causing dell-wmi and dell-smbios-wmi
to be stuck in infinite deferred probing loops.
This patch series accounts for that corner case.

changes from v1 to v2:
- Add Reviewed by from Pali for patch 1
- Move wmi_has_guid check into dell-wmi-descriptor.c instead of
  dependent drivers.
Mario Limonciello (2):
  platform/x86: dell-wmi-descriptor: check if memory was allocated
  platform/x86: dell-*wmi*: Relay failed initial probe to dependent
    drivers

 drivers/platform/x86/dell-smbios-wmi.c     |  5 +++--
 drivers/platform/x86/dell-wmi-descriptor.c | 21 +++++++++++++++++++++
 drivers/platform/x86/dell-wmi-descriptor.h |  8 +++++++-
 drivers/platform/x86/dell-wmi.c            |  6 ++++--
 4 files changed, 35 insertions(+), 5 deletions(-)

-- 
2.14.1
