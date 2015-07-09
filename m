From: Darren Hart <dvhart@infradead.org>
Subject: [IGNORE] platform-drivers-x86 for 4.2-2
Date: Wed, 08 Jul 2015 17:02:00 -0700
Message-ID: <pdx86-20150708.170200@fury>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:59242 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751279AbbGIADa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jul 2015 20:03:30 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

(Testing vger delivery 002)

Hi Nobody,

The following came in a bit later and I wanted them to bake in next a
few more days before submitting, thus the second pull.

I've changed my tag formatting to mirror how I've seen you reformat my
summarized changelogs, and all the relevant information for the merge
commit is intended to be in the tag now.

Thanks,

Darren Hart
Intel Open Source Technology Center

The following changes since commit 5ee7041e5bc0fe8ba04a554dc2f9a18f709b=
c005:

  MAINTAINERS: Orphan x86 driver msi-wmi (2015-06-15 13:39:35 -0700)

are available in the git repository at:

  git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git t=
ags/platform-drivers-x86-v4.2-2

for you to fetch changes up to 0a8b83530b6f67b9a50bd7937d57a5deea187b5b=
:

  intel_pmc_ipc: Add Intel Apollo Lake PMC IPC driver (2015-06-29 15:28=
:14 -0700)

----------------------------------------------------------------
platform-drivers-x86 for 4.2-2

A new intel_pmc_ipc driver, a symmetrical allocation and free fix in
dell-laptop, a couple minor fixes, and some updated documentation in th=
e
dell-laptop comments.

intel_pmc_ipc:
 - Add Intel Apollo Lake PMC IPC driver

tc1100-wmi:
 - Delete an unnecessary check before the function call "kfree"

dell-laptop:
 - Fix allocating & freeing SMI buffer page
 - Show info about WiGig and UWB in debugfs
 - Update information about wireless control

----------------------------------------------------------------
Markus Elfring (1):
      tc1100-wmi: Delete an unnecessary check before the function call =
"kfree"

Pali Roh=C3=A1r (3):
      dell-laptop: Update information about wireless control
      dell-laptop: Show info about WiGig and UWB in debugfs
      dell-laptop: Fix allocating & freeing SMI buffer page

qipeng.zha (1):
      intel_pmc_ipc: Add Intel Apollo Lake PMC IPC driver

 MAINTAINERS                          |   7 +
 arch/x86/include/asm/intel_pmc_ipc.h |  82 ++++
 drivers/platform/x86/Kconfig         |   7 +
 drivers/platform/x86/Makefile        |   1 +
 drivers/platform/x86/dell-laptop.c   | 183 +++++++--
 drivers/platform/x86/intel_pmc_ipc.c | 767 +++++++++++++++++++++++++++=
++++++++
 drivers/platform/x86/tc1100-wmi.c    |   2 +-
 7 files changed, 1004 insertions(+), 45 deletions(-)
 create mode 100644 arch/x86/include/asm/intel_pmc_ipc.h
 create mode 100644 drivers/platform/x86/intel_pmc_ipc.c
