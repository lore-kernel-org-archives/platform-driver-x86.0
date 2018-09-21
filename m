From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 0/6] platform/x86: acerhdf: new BIOS string, better modparam handling
Date: Thu, 20 Sep 2018 21:44:15 -0400
Message-ID: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Feuerer <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

I came across this older netbook over the xmas holidays, and noticed the
acerhdf driver wouldn't load.  Turns out the BIOS string was too new,
and not listed in the driver.  There were module params for overrides,
but I found their use isn't quite clear without reading the source.

Here I clarify some of the module parameter usage, and then add the new
BIOS string, so they won't be needed for this particular platform.  Some
probe code is also shifted out to be __init to reduce the driver size a
bit.  Further details can be found in the respective commit logs.

Since it was months ago when I created these patches, I retested on top
of tree to ensure things still work, as can be seen below.

root@gw:~# cat /proc/version 
Linux version 4.19.0-rc4+ (paul@host) (gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.10)) #1 SMP Thu Sep 20 18:47:15 EDT 2018
root@gw:~# modprobe acerhdf
root@gw:~# dmesg|tail -n3
acerhdf: Acer Aspire One Fan driver, v.0.7.0
acerhdf: Fan control off, to enable do:
acerhdf: echo -n "enabled" > /sys/class/thermal/thermal_zoneN/mode # N=0,1,2...
root@gw:~# lsmod
Module                  Size  Used by
acerhdf                16384  0 
root@gw:~# 

Paul.
---

Cc: Peter Feuerer <peter@piie.net>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>

Paul Gortmaker (6):
  platform/x86: acerhdf: clarify modinfo messages for BIOS override
  platform/x86: acerhdf: Enable ability to list supported systems
  platform/x86: acerhdf: Remove cut-and-paste trap from instructions
  platform/x86: acerhdf: Add BIOS entry for Gateway LT31 v1.3307
  platform/x86: acerhdf: mark appropriate content with __init prefix
  platform/x86: acerhdf: restructure to allow large BIOS table be __initconst

 drivers/platform/x86/Kconfig   |  5 +++-
 drivers/platform/x86/acerhdf.c | 68 ++++++++++++++++++++++++++++++------------
 2 files changed, 53 insertions(+), 20 deletions(-)

-- 
2.15.0
