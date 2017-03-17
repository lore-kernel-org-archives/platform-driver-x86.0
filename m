From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/4] watchdog: iTCO_wdt: Fix PMC GCR memory mapping failure
Date: Fri, 17 Mar 2017 16:25:28 +0200
Message-ID: <CAHp75VdyW-kH2nzk63_A=XD62ftrMbSfbec9nBiKbexpP+9zkg@mail.gmail.com>
References: <b89221c652d06c3c07fdf2ec32fd4fc8930c64df.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <2c41b3b6344f9cb455ac57e1e41aa229adb2867d.1489710235.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20170317114313.GE24582@rajaneesh-OptiPlex-9010> <0a68f91f-e396-90aa-8337-cad3aa28a0f7@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0a68f91f-e396-90aa-8337-cad3aa28a0f7-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Zha Qipeng <qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org" <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, David Box <david.e.box-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Mar 17, 2017 at 3:40 PM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> On 03/17/2017 04:43 AM, Rajneesh Bhardwaj wrote:
>> On Thu, Mar 16, 2017 at 05:41:35PM -0700, Kuppuswamy Sathyanarayanan
>> wrote:
>>>
>>> Currently, iTCO watchdog driver uses memory map to access
>>> PMC_CFG GCR register. But the entire GCR address space is
>>> already mapped in intel_scu_ipc driver. So remapping the

> I don't think I (or the watchdog mailing list) was copied on the original
> patch.
> Major immediate concern is that this introduces a dependency on external
> code.
> The pmc_ipc driver's Kconfig entry states "This is not needed for PC-type
> machines". I don't know where the function is introduced, but I hope this
> change
> does not require the pmc_ipc code to be present on such machines for the
> watchdog
> to work. It would be bad if it does. If it doesn't, it appears that the
> function
> should not be declared in asm/intel_pmc_ipc.h.

Agree.

I already asked once [1] to fix up the mess we have in PDx86 regarding SCU IPC.
(PMC IPC how it's called is actually just a [main] part of SCU in newer SoCs).

Rajneesh, Kuppuswamy,
please pay attention on the below.

We have two libraries doing almost the same (basics) one for old
platforms, one for new.

My vision what should be done before we go further is:
1. Split out common part from intel_scu_ipc and intel_pmc_ipc to some library.
2. Move headers to linux/platform_data/x86 for sharing with drivers
that are supporting non-Intel / not-newest-Intel hardware.
3. Fix the mess inside the intel_pmc_ipc code (like use devm_()
helpers where it makes sense, no use of global variables, etc)

On top of that
4. Fix up Whiskey Cove PMIC code (See Hans' message [2] for the details)

[1] Oops, it happened on internal mailing list Jan 27. And mentioned
publicly after in a review on some patch here.
[2] http://lkml.iu.edu/hypermail/linux/kernel/1702.3/01408.html

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
