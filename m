From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/5] printk: Add eliminated_printk
Date: Sun, 17 Jun 2012 19:25:07 -0700
Message-ID: <cover.1339985626.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

no_printk keeps side-effects.
eliminated_printk removes all side effects yet still keeps
gcc format and argument verificatino.
By definition, pr_devel should have no side-effects if not enabled.
Convert pr_devel from no_printk to eliminated_printk.

Joe Perches (5):
  printk: Add eliminated_printk macro
  printk: Convert pr_devel to use eliminated_printk
  usb: Convert dbg to pr_eliminated and pr_debug
  fujitsu-laptop: Convert dbg_printk and vdbg_printk to fuj_dbg
  thinkpad_acpi: Convert dbg_printk to tp_dbg and tp_vdbg

 drivers/platform/x86/fujitsu-laptop.c |  103 +++++-----
 drivers/platform/x86/thinkpad_acpi.c  |  358 +++++++++++++++------------------
 include/linux/printk.h                |   12 +-
 include/linux/usb.h                   |   12 +-
 4 files changed, 228 insertions(+), 257 deletions(-)

-- 
1.7.8.111.gad25c.dirty


------------------------------------------------------------------------------
Live Security Virtual Conference
Exclusive live event will cover all the ways today's security and 
threat landscape has changed and how IT managers can respond. Discussions 
will include endpoint security, mobile security and the latest in malware 
threats. http://www.accelacomm.com/jaw/sfrnl04242012/114/50122263/
