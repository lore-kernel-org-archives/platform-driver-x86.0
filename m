From: "Yong, Jonathan" <jonathan.yong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] x86: Fix Apollo Lake Watchdog address in PMC driver
Date: Mon, 13 Jun 2016 12:42:23 +0800
Message-ID: <575E39AF.6050906@intel.com>
References: <1463541972-19758-1-git-send-email-jonathan.yong@intel.com> <1463541972-19758-3-git-send-email-jonathan.yong@intel.com> <573BE985.1000306@roeck-us.net> <573BF421.2020503@intel.com> <573C7E0C.7050304@roeck-us.net> <20160524201316.GA5857@f23x64.localdomain> <57455A8B.1090807@intel.com> <574FEE13.30500@intel.com> <20160607220323.GA28348@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160607220323.GA28348-EK61lajVJsRSq9BJjBFyUp/QNRX+jHPU@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On 06/08/2016 06:03, Darren Hart wrote:
>>>
>>> Hi Qipeng,
>>>
>>> Do you know the history behind drivers/platform/x86/intel_pmc_ipc.c?
>>> Were the specs based on earlier prototypes?
>>>
>>
>> Qipeng, ping?
>>
>
> Jonathan, can you follow-up with Qiping (possibly internally) and get back to
> the list with a definitive response? Getting these into 4.7-rc would be good so
> we don't have to push it back via stable, but we need to be sure it's the right
> fix.
>

I checked with Qipeng, the 0x30h offset was based on an earlier internal 
prototype, 0x40h should be OK for Apollo Lake.

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
