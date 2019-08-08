From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: [PATCH 0/2] intel-hid: intel-vbtn: Suspend-related fix and update
Date: Thu, 08 Aug 2019 10:40:19 +0200
Message-ID: <1717835.1Yz4jNODO2@kreacher>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

These two patches fix a minor issue related to system suspend in the intel-hid
and intel-vbtn drivers and update the suspend/resume handling in intel-hid to
reduce special-casing in it somewhat.

Please refer to the changelogs for details.

Thanks,
Rafael
