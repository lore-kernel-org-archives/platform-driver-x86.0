From: "Yong, Jonathan" <jonathan.yong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Correct iTCO Watchdog for Apollo Lake
Date: Wed, 22 Jun 2016 12:53:16 +0800
Message-ID: <576A19BC.4000502@intel.com>
References: <1463541972-19758-1-git-send-email-jonathan.yong@intel.com> <1466123817-50679-1-git-send-email-jonathan.yong@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466123817-50679-1-git-send-email-jonathan.yong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On 06/17/2016 08:36, Yong, Jonathan wrote:
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
> * Resent, typo in linux-kernel email address
>
> Changes since v1:
> 	* Watchdog NO_REBOOT bit off-by-one corrected.
>
> Yong, Jonathan (2):
>    watchdog: iTCO-wdt handle 5th variation for Apollo Lake
>    x86: Fix Apollo Lake Watchdog address in PMC driver
>
>   drivers/platform/x86/intel_pmc_ipc.c | 10 ++++++----
>   drivers/watchdog/iTCO_wdt.c          |  2 ++
>   2 files changed, 8 insertions(+), 4 deletions(-)
>

Ping.

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
