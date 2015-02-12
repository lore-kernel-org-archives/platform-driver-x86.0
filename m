From: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/2] toshiba_acpi: Cleanup GPL header
Date: Wed, 11 Feb 2015 21:57:08 -0800
Message-ID: <c57c0fa4bc9c2ad023674ef478c25719abaace7d.1423720561.git.dvhart@linux.intel.com>
References: <1423720628-26313-1-git-send-email-dvhart@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:42158 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750942AbbBLF5Y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 Feb 2015 00:57:24 -0500
In-Reply-To: <1423720628-26313-1-git-send-email-dvhart@linux.intel.com>
In-Reply-To: <e0769fe6f28b500868c2b1059f74ab1177ff41db.1423720561.git.dvhart@linux.intel.com>
References: <e0769fe6f28b500868c2b1059f74ab1177ff41db.1423720561.git.dvhart@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, coproscefalo@gmail.com, Darren Hart <dvhart@linux.intel.com>

Remove the Free Software Foundation street address paragraph and
reference COPYING.

Remove an empty TODO block.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 drivers/platform/x86/toshiba_acpi.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 07be889..dbcb7a8 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1,7 +1,6 @@
 /*
  *  toshiba_acpi.c - Toshiba Laptop ACPI Extras
  *
- *
  *  Copyright (C) 2002-2004 John Belmonte
  *  Copyright (C) 2008 Philip Langdale
  *  Copyright (C) 2010 Pierre Ducroquet
@@ -17,10 +16,8 @@
  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *  GNU General Public License for more details.
  *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
- *
+ *  The full GNU General Public License is included in this distribution in
+ *  the file called "COPYING".
  *
  *  The devolpment page for this driver is located at
  *  http://memebeam.org/toys/ToshibaAcpiDriver.
@@ -30,10 +27,6 @@
  *		engineering the Windows drivers
  *	Yasushi Nagato - changes for linux kernel 2.4 -> 2.5
  *	Rob Miller - TV out and hotkeys help
- *
- *
- *  TODO
- *
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-- 
2.1.4
