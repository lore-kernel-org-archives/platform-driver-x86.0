From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH 00/11] Series short description
Date: Mon, 26 Jul 2010 10:02:15 +0100
Message-ID: <20100726090031.12329.53555.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:37996 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753909Ab0GZJfZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jul 2010 05:35:25 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

This patch set updates the intel SCU IPC to our internal version and fixes
various bugs/cleanliness issues as well as making the CPU detection occur
automatically and removing the module parameter.
---

Alan Cox (1):
      intel_scu_ipc: Use the new cpu identification function

Andy Ross (1):
      Clean up command packing on MRST.

Arjan van de Ven (2):
      zero the stack buffer before giving random garbage to the SCU
      Fix stack buffer size for IPC writev messages

Hong Liu (3):
      intel_scu_ipc: fix size field for intel_scu_ipc_command
      intel_scu_ipc: return -EIO for error condition in busy_loop

Sreedhara DS (4):
      intel_scu_ipc: tidy up unused bits
      Remove indirect read write api support.
      intel_scu_ipc: Support Medfield processors
      intel_scu_ipc: detect CPU type automatically


 arch/x86/include/asm/intel_scu_ipc.h |   14 ---
 drivers/platform/x86/intel_scu_ipc.c |  180 ++++++++++------------------------
 2 files changed, 52 insertions(+), 142 deletions(-)

-- 
	"It's 106 miles to Chicago, we've got a full tank of gas, the
	 sat-nav has crashed, it's dark and we're completely lost"
