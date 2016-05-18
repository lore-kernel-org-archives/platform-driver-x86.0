From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH 2/2] x86: Fix Apollo Lake Watchdog address in PMC driver
Date: Wed, 18 May 2016 07:37:00 -0700
Message-ID: <573C7E0C.7050304@roeck-us.net>
References: <1463541972-19758-1-git-send-email-jonathan.yong@intel.com>
 <1463541972-19758-3-git-send-email-jonathan.yong@intel.com>
 <573BE985.1000306@roeck-us.net> <573BF421.2020503@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <573BF421.2020503-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Yong, Jonathan" <jonathan.yong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On 05/17/2016 09:48 PM, Yong, Jonathan wrote:
> On 05/18/2016 12:03, Guenter Roeck wrote:
>> On 05/17/2016 08:26 PM, Yong, Jonathan wrote:
>>> The TCO I/O base is 40h rather than the usual 30h, and the
>>> re_reboot bit is at ACPIBASE+8.
>>>
>>
>> Does this mean that the code never worked, or in other words that it
>> was never tested, or are there now other chips which used the old
>> definitions which no longer work after this patch has been applied ?
>
> To my knowledge, it has never worked since 30h is claimed by ACPI GPE0_BLK.
>
Hmm.. Darren will have to take that one. I am not in a position to
determine if the new patch is correct or not, and/or if it causes some
other platform/architecture to fail. I'll Ack the other patch, and
would suggest for Darren to take it as well to keep the two patches together.

Guenter

> With this patch, watchdog ioctl is working properly with WDIOC_SETTIMEOUT, WDIOC_GETTIMEOUT and WDIOC_GETTIMELEFT as expected.
>

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
