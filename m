From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: [GIT] x86 platform driver update
Date: Thu, 23 Sep 2010 20:54:50 +0100
Message-ID: <20100923195450.GA27852@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Linus,

Just an update to MAINTAINERS and a fix for a regression in the Thinkpad 
hotkey handling.

The following changes since commit 57aebd7739c8dbbf403876ee1e9673fafc83d856:

  Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/percpu (2010-09-23 08:06:55 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mjg59/platform-drivers-x86.git for_linus

Henrique de Moraes Holschuh (1):
      thinkpad-acpi: avoid keymap pitfall

Lee, Chun-Yi (1):
      Change MSI LAPTOP driver maintainer to Lee, Chun-Yi

 MAINTAINERS                          |    4 +---
 drivers/platform/x86/thinkpad_acpi.c |    5 +++--
 2 files changed, 4 insertions(+), 5 deletions(-)

-- 
Matthew Garrett | mjg59@srcf.ucam.org
