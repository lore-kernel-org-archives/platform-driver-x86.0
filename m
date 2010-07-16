From: Thomas Renninger <trenn@suse.de>
Subject: Version 2: Provide /sys/../ec with read/write access and some cleanups
Date: Fri, 16 Jul 2010 13:11:30 +0200
Message-ID: <1279278697-3694-1-git-send-email-trenn@suse.de>
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: lenb@kernel.org
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This patchset is againt the acpi test branch.
It would be great if these can be applied there.
Patches are test compiled, booted and I played a bit with reading
writing...

Changes to the previous patchset:
    - Use debugfs /sys/kernel/debug/ec/* instead of /sys/devices/...
    - Keep some EC Documentation in the thinkpad driver
    - Add Documentation/ABI describing the new interface

Possible further enhancements:
    - Expose EC Fields and make them read/writable
    - Allow userspace to switch on burst mode to be able to test
      EC burst transitions in userspace

Thanks,

       Thomas

