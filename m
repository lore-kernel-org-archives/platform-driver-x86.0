From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: [GIT PULL] x86 platform drivers
Date: Fri, 23 Apr 2010 20:41:25 +0100
Message-ID: <20100423194125.GA574@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:37822 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755948Ab0DWTl3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Apr 2010 15:41:29 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: torvalds@linux-foundation.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

Some minor bugfixes and a the addition of a backlight control for recent 
Eees.

The following changes since commit 0eddb519b9127c73d53db4bf3ec1d45b13f844d1:
  Linus Torvalds (1):
        Merge branch 'for-linus' of git://git.kernel.org/.../roland/infiniband

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mjg59/platform-drivers-x86.git for_linus

Corentin Chary (1):
      eeepc-laptop: add missing sparse_keymap_free

Dan Carpenter (1):
      asus: don't modify bluetooth/wlan on boot

Ingo Molnar (1):
      eeepc-wmi: Build fix

Yong Wang (4):
      eeepc-wmi: add an eeepc_wmi context structure
      eeepc-wmi: use a platform device as parent device of all sub-devices
      eeepc-wmi: add backlight support
      dell-wmi: Fix memory leak

 drivers/platform/x86/Kconfig        |    1 +
 drivers/platform/x86/asus-laptop.c  |    8 +-
 drivers/platform/x86/dell-wmi.c     |    3 +-
 drivers/platform/x86/eeepc-laptop.c |    3 +-
 drivers/platform/x86/eeepc-wmi.c    |  333 +++++++++++++++++++++++++++++++----
 5 files changed, 302 insertions(+), 46 deletions(-)

-- 
Matthew Garrett | mjg59@srcf.ucam.org
