From: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Correct iTCO Watchdog for Apollo Lake
Date: Sun, 17 Jul 2016 22:16:15 +0200
Message-ID: <20160717201615.GA841@spo001.leaseweb.nl>
References: <1463541972-19758-1-git-send-email-jonathan.yong@intel.com> <1466123612-50633-1-git-send-email-jonathan.yong@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466123612-50633-1-git-send-email-jonathan.yong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Yong, Jonathan" <jonathan.yong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-kernel.vger.kernel.org-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Jonathan,

> These patches fix the iTCO watchdog for Apollo Lake.
> I changed the watchdog memory io to only use 4 bytes rather
> the whole region, I'm not sure if that is the correct way.
> 
> The previous 0x30h offset in intel_pmc_ipc.c was for based
> on the earlier BXT-M platform. Apollo Lake has it at 0x40h.
> 
> Let me know if the patches need changes.
> Please CC me as I am not subscribed, thanks.
> 
> Changes since v1:
> 	* Watchdog NO_REBOOT bit off-by-one corrected.
> 
> Yong, Jonathan (2):
>   watchdog: iTCO-wdt handle 5th variation for Apollo Lake
>   x86: Fix Apollo Lake Watchdog address in PMC driver
> 
>  drivers/platform/x86/intel_pmc_ipc.c | 10 ++++++----
>  drivers/watchdog/iTCO_wdt.c          |  2 ++
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> -- 
> 2.7.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Both patches have been added to linux-watchdog-next.

Kind regards,
Wim.

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
