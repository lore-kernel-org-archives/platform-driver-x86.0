From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 0/2] Parse multiple duplicate WMI GUIDs
Date: Fri,  8 Dec 2017 20:34:19 -0600
Message-ID: <1512786861-1014-1-git-send-email-mario.limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:57377 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753157AbdLICer (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 21:34:47 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Mario Limonciello <mario.limonciello@dell.com>

I recently discovered that multiple instances of the WMI BMOF
GUID are present on some machines with more advanced WMI implementations.

Only the first found instance is parsed today with the rest ignored.

The rest of the instances should be readable by the wmi-bmof driver
(and userspace) to allow improving any parsing implementations.

Andy L. indicated he thought fixing this should require changing the
WMI driver to no longer track a block list of devices, but I don't
think that's necessary.  The only significant change is that the WMI
bus will need to build the symlinks in /sys/bus/wmi/devices in a way
to prevent clashes with multiple devices sharing the same GUID.

The most obvious solution (and that which I implemented) is to include
the ACPI device associated with the GUID.

Since this is a symlink and the actual path remains stable I don't
know if that's considered changing a userspace interface. If so, then
an alternative would be to append a number when a second instance of
a GUID has been discovered and keep the "old" symlink path for the first
instance stable.

Mario Limonciello (2):
  platform/x86: wmi: prefix sysfs files in /sys/bus/wmi with the ACPI
    device
  platform/x86: wmi: Allow creating WMI devices with the same GUID

 drivers/platform/x86/wmi.c | 34 ++--------------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

-- 
2.14.1
