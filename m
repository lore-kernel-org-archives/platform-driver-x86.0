From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH 0/5] ideapad: patches for v3.2 kernel
Date: Tue,  6 Sep 2011 02:31:07 +0800
Message-ID: <1315247467-8812-1-git-send-email-ike.pan@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:39936 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753372Ab1IESbK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 5 Sep 2011 14:31:10 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>

No function changed with first two patches.

Adding event for Novo key, two nodes in debugfs and removing cfg
from sysfs.

Ike Panhc (5):
  ideapad: define vpc commands
  ideapad: change parameter of ideapad_sync_rfk_state
  ideapad: add event for Novo key
  ideapad: add debugfs support
  ideapad: remove sysfs node for cfg

 Documentation/ABI/testing/debugfs-ideapad          |   19 ++
 .../ABI/testing/sysfs-platform-ideapad-laptop      |   15 --
 drivers/platform/x86/ideapad-laptop.c              |  249 +++++++++++++++++---
 3 files changed, 234 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/ABI/testing/debugfs-ideapad

-- 
1.7.5.4
