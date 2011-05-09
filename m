From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: [GIT PULL] x86 platform driver updates
Date: Mon, 9 May 2011 19:57:27 +0100
Message-ID: <20110509185727.GA9811@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:39432 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751933Ab1EIS5d (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 May 2011 14:57:33 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: torvalds@linux-foundation.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Linus,

A couple of minor fixes and a regression fix for the Sony driver. The 
Thinkpad driver works fine if it's loaded by hand and the rfkill code on 
the Eee is currently completely broken for PCIe systems that don't put 
devices on bus 0. The Sony one is fallout from support for the backlight 
control on new systems - we're currently able to set it outside valid 
ranges, which results in no video or potential hardware damage.

The following changes since commit 8b061610dac3a3b89770c85ad63b481a47b0c38e:

  Merge branch 'perf-fixes-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip (2011-05-07 13:17:37 -0700)

are available in the git repository at:

  ssh://master.kernel.org/pub/scm/linux/kernel/git/mjg59/platform-drivers-x86.git for_linus

Manoj Iyer (1):
      thinkpad-acpi: module autoloading for newer Lenovo ThinkPads.

Matthew Garrett (1):
      eeepc-laptop: Use ACPI handle to identify rfkill port

Mattia Dongili (2):
      sony-laptop: report failures on setting LCD brightness
      sony-laptop: limit brightness range to DSDT provided ones

 drivers/platform/x86/eeepc-laptop.c  |   57 +++++++++++----
 drivers/platform/x86/sony-laptop.c   |  130 +++++++++++++++++++++++++++-------
 drivers/platform/x86/thinkpad_acpi.c |    6 +-
 3 files changed, 150 insertions(+), 43 deletions(-)

-- 
Matthew Garrett | mjg59@srcf.ucam.org
