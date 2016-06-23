From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Correct iTCO Watchdog for Apollo Lake
Date: Thu, 23 Jun 2016 06:37:55 -0700
Message-ID: <576BE633.3040104@roeck-us.net>
References: <1463541972-19758-1-git-send-email-jonathan.yong@intel.com>
 <1466123817-50679-1-git-send-email-jonathan.yong@intel.com>
 <576A19BC.4000502@intel.com> <576A299D.5010300@roeck-us.net>
 <20160623050218.GC3379@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623050218.GC3379-EK61lajVJsRSq9BJjBFyUp/QNRX+jHPU@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: "Yong, Jonathan" <jonathan.yong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On 06/22/2016 10:02 PM, Darren Hart wrote:
> On Tue, Jun 21, 2016 at 11:01:01PM -0700, Guenter Roeck wrote:
>> On 06/21/2016 09:53 PM, Yong, Jonathan wrote:
>>> On 06/17/2016 08:36, Yong, Jonathan wrote:
>>>> These patches fix the iTCO watchdog for Apollo Lake.
>>>> I changed the watchdog memory io to only use 4 bytes rather
>>>> the whole region, I'm not sure if that is the correct way.
>>>>
>>>> The previous 0x30h offset in intel_pmc_ipc.c was for based
>>>> on the earlier BXT-M platform. Apollo Lake has it at 0x40h.
>>>>
>>>> Let me know if the patches need changes.
>>>> Please CC me as I am not subscribed, thanks.
>>>>
>>>> * Resent, typo in linux-kernel email address
>>>>
>>>> Changes since v1:
>>>>      * Watchdog NO_REBOOT bit off-by-one corrected.
>>>>
>>>> Yong, Jonathan (2):
>>>>     watchdog: iTCO-wdt handle 5th variation for Apollo Lake
>>>>     x86: Fix Apollo Lake Watchdog address in PMC driver
>>>>
>>>>    drivers/platform/x86/intel_pmc_ipc.c | 10 ++++++----
>>>>    drivers/watchdog/iTCO_wdt.c          |  2 ++
>>>>    2 files changed, 8 insertions(+), 4 deletions(-)
>>>>
>>>
>>> Ping.
>>>
>>>
>> Waiting for an Ack from Darren.
>
> Jonathan verified that the change will not break existing external platforms.
> I'm happy with it from that perspective.
>
> Guenter, will you take both patches together?
>

Yes, I'll add them to my queue of patches to send to Wim.

Thanks,
Guenter

> Reviewed-by: Darren Hart <dvhart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
