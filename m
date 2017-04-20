From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH v1 0/9] platform/x86: hp-wmi: Driver refactoring and cleanups
Date: Wed, 19 Apr 2017 19:25:12 -0700
Message-ID: <cover.1492654448.git.dvhart@infradead.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:33808 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933601AbdDTCZu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 22:25:50 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, carlo@caione.org

From: "Darren Hart (VMware)" <dvhart@infradead.org>

This series factors out some redundant code, cleans up a number of style issues,
modernizes the sysfs usage, and cleans up the return paths. All told, the driver
is reduced in size by 37 lines (3.6%).

I do not have an HP laptop, so I'm hoping Carlo can help out with some testing.
In particular we need to verify that hotkeys and sysfs continue to work as
before.

This series is also available here for convenience:
git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git hp-wmi


Darren Hart (VMware) (9):
  platform/x86: hp-wmi: Cleanup local variable declarations
  platform/x86: hp-wmi: Add bios_args initializer
  platform/x86: hp-wmi: Standardize enum usage for constants
  platform/x86: hp-wmi: Refactor redundant HPWMI_READ functions
  platform/x86: hp-wmi: Cleanup wireless get_(hw|sw)state functions
  platform/x86: hp-wmi: Refactor dock and tablet state fetchers
  platform/x86: hp-wmi: Use DEVICE_ATTR_(RO|RW) helper macros
  platform/x86: hp-wmi: Do not shadow errors in sysfs show functions
  platform/x86: hp-wmi: Cleanup exit paths

 drivers/platform/x86/hp-wmi.c | 385 +++++++++++++++++++-----------------------
 1 file changed, 174 insertions(+), 211 deletions(-)

-- 
2.9.3
