From: "Yong, Jonathan" <jonathan.yong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] x86: Fix Apollo Lake Watchdog address in PMC driver
Date: Wed, 25 May 2016 15:55:55 +0800
Message-ID: <57455A8B.1090807@intel.com>
References: <1463541972-19758-1-git-send-email-jonathan.yong@intel.com> <1463541972-19758-3-git-send-email-jonathan.yong@intel.com> <573BE985.1000306@roeck-us.net> <573BF421.2020503@intel.com> <573C7E0C.7050304@roeck-us.net> <20160524201316.GA5857@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160524201316.GA5857-EK61lajVJsRSq9BJjBFyUp/QNRX+jHPU@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On 05/25/2016 04:13, Darren Hart wrote:
>
> The history of this driver is for Apollo Lake, so the question is if there exist
> v3 and v5 APL products, or if we only need to concern ourselves with v5 in the
> upstream driver.
>
> Especially given the "I don't know if this is the right way" in the cover
> letter, I will need an Acked-by at the very least from Qipeng.
>

Hi Qipeng,

Do you know the history behind drivers/platform/x86/intel_pmc_ipc.c? 
Were the specs based on earlier prototypes?

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
