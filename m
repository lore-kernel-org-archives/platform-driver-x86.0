From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: [PATCH 0/5] platform / x86: Convert a few drivers to struct dev_pm_ops
Date: Sun, 17 Jun 2012 22:26:42 +0200
Message-ID: <201206172226.42729.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Joey Lee <jlee@novell.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi all,

The following series of patches converts a few drivers under platform/x86
to using struct dev_pm_ops objects for power management istead of legacy
callbacks in struct platform_driver.

The ultimate goal of this will be to get rid of PM callbacks from the
platform bus type, which are only necessary because a number of drivers
still use the legacy hooks.

Admittedly, I don't have the hardware to test all of the changes, but
hopefully they are simple enough.

Please let me know if there are any objections.

Thanks,
Rafael
