From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] acer-wmi: Add wireless quirk for Lenovo 3000 N200
Date: Thu, 6 Oct 2011 15:01:55 -0500
Message-ID: <20111006200155.GI29557@thinkpad-t410>
References: <1317756778-11822-1-git-send-email-seth.forshee@canonical.com>
 <1317890314.11626.115.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1317890314.11626.115.camel@linux-s257.site>
Sender: linux-kernel-owner@vger.kernel.org
To: joeyli <jlee@suse.com>, Matthew Garrett <mjg@redhat.com>
Cc: Joey Lee <jlee@novell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 06, 2011 at 04:38:34PM +0800, joeyli wrote:
> Simple applied and tested on my acer machine, no problem!
> 
> Reviewed-by: Lee, Chun-Yi <jlee@novell.com>

Thanks, Joey!

Matthew, I just realized that I got the wrong bug number in the
description. Could you take the version below instead? It's identical
except for the bug number. Thanks!


From ddaa90fce02f0aaaaa4fd3308f3a86fbe522bb86 Mon Sep 17 00:00:00 2001
From: Seth Forshee <seth.forshee@canonical.com>
Date: Wed, 28 Sep 2011 13:12:52 -0500
Subject: [PATCH] acer-wmi: Add wireless quirk for Lenovo 3000 N200

This quirk fixes the wlan rfkill status on this machine. Without
it, wlan is permanently soft blocked whenever acer-wmi is loaded.

BugLink: https://bugs.launchpad.net/bugs/857297
Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/acer-wmi.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index af2bb20..dac286a 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -464,6 +464,15 @@ static struct dmi_system_id acer_quirks[] = {
 		},
 		.driver_data = &quirk_lenovo_ideapad_s205,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Lenovo 3000 N200",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "0687A31"),
+		},
+		.driver_data = &quirk_fujitsu_amilo_li_1718,
+	},
 	{}
 };
 
-- 
1.7.4.1
