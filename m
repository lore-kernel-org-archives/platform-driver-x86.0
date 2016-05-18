From: "Yong, Jonathan" <jonathan.yong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] Correct iTCO Watchdog for Apollo Lake
Date: Wed, 18 May 2016 03:26:10 +0000
Message-ID: <1463541972-19758-1-git-send-email-jonathan.yong@intel.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jonathan.yong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

These patches fix the iTCO watchdog for Apollo Lake.
I changed the watchdog memory io to only use 4 bytes rather
the whole region, I'm not sure if that is the correct way.

Let me know if the patches need changes.
Please CC me as I am not subscribed, thanks.

Yong, Jonathan (2):
  watchdog: iTCO-wdt handle 5th variation for Apollo Lake
  x86: Fix Apollo Lake Watchdog address in PMC driver

 drivers/platform/x86/intel_pmc_ipc.c | 10 ++++++----
 drivers/watchdog/iTCO_wdt.c          |  4 ++++
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.7.3

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
