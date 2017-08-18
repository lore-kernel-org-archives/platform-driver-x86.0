From: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Add Package C-states
 residency info
Date: Fri, 18 Aug 2017 16:23:34 -0700
Message-ID: <CACK8Z6H=B4w7n+U8R7Z7wWJTdvv5iCJpBe61mwGF34XMCDXiWw@mail.gmail.com>
References: <1503059853-5118-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <CAHp75VfFrdiSDb_SAunCAdWZY0FPY9hxriCgVUYn00_gmOQQcw@mail.gmail.com>
 <20170818145843.GA10366@raj-desk2.iind.intel.com> <CAHp75Vd5Wnio-RCEBENtonYWOJF2+88FDvqkUv1HzV3CdcaaPA@mail.gmail.com>
 <20170818174725.GB12519@raj-desk2.iind.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f177.google.com ([209.85.161.177]:33663 "EHLO
        mail-yw0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751614AbdHRXYQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2017 19:24:16 -0400
Received: by mail-yw0-f177.google.com with SMTP id p68so67132829ywg.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Aug 2017 16:24:15 -0700 (PDT)
In-Reply-To: <20170818174725.GB12519@raj-desk2.iind.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Derek Basehore <dbasehore@chromium.org>, rjw@rjwysocki.net, Derek Basehore <dbasehore@google.com>

Hello,

On Fri, Aug 18, 2017 at 10:47 AM, Rajneesh Bhardwaj
<rajneesh.bhardwaj@intel.com> wrote:
> On Fri, Aug 18, 2017 at 08:17:32PM +0300, Andy Shevchenko wrote:
>> +PeterZ (since I mentioned his name)
>>
>> On Fri, Aug 18, 2017 at 5:58 PM, Rajneesh Bhardwaj
>> <rajneesh.bhardwaj@intel.com> wrote:
>> > On Fri, Aug 18, 2017 at 03:57:34PM +0300, Andy Shevchenko wrote:
>> >> On Fri, Aug 18, 2017 at 3:37 PM, Rajneesh Bhardwaj
>> >> <rajneesh.bhardwaj@intel.com> wrote:
>> >> > This patch introduces a new debugfs entry to read current Package C-state
>> >> > residency values and, one new kernel API to read the Package C-10 residency
>> >> > counter.
>> >> >
>> >> > Package C-state residency MSRs provide useful debug information about system
>> >> > idle states. In idle states system must enter deeper Package C-states.
>>
>> >> Why this patch is needed?
>> >
>> > Andy, I'll try to give some background for this.
>> >
>> > This is needed to enhance the S0ix failure debug capabilities from within
>> > the kernel. On ChromeOS we have S0ix failsafe kernel framework that is used
>> > to validate S0ix and report the blockers in case of a failure.
>> > https://patchwork.kernel.org/patch/9148999/
>>
>> (It's not part of upstream)
>
> Sorry i sent an older link. There are fresh attempts to get this into
> mainline kernel and looks like there is a traction for it.
> https://patchwork.kernel.org/patch/9831229/
>
> Package C-state (PC10) validation is discussed there.

Yes, Derek has been trying to get it up streamed, and is currently
taking care of the comments. One of the comments Rafael Wysocki had
(https://lkml.org/lkml/2017/7/10/741), was that getting to PC10 takes
care of large amount of power savings, and PC10 is a logical milestone
to track / validate as it validates the north complex power state. To
do that we need an API to get the PC10 counter.

I do agree that an exposed API needs to have a user code that uses the
API. In this case it seems to be a chicken and egg problem i.e. the
S0ix failsafe framework (https://patchwork.kernel.org/patch/9831229/)
needs this API, and the API needs a user (failsafe framework) for it
to be accepted?

Best Regards,

Rajat

>
>>
>> > So far only intel_pmc_slp_s0_counter_read is called by this framework to
>> > check whether the previous attempt to enter S0ix was success or not.
>>
>> I harder see even a single user of that API in current kernel. It
>> should be unexported and removed I think.
>>
>> >  Having
>> > another PC10 counter related exported function enhances the S0ix debug since
>> > PC10 state is a prerequisite to enter S0ix.
>> >
>> >> See, we have turbostat and cpupower user space tools which do this
>> >> without any additional code to be written in kernel. What prevents
>> >> your user space application do the same?
>> >>
>> >> Moreover, we have events for cstate, I assume perf or something alike
>> >> can monitor those counters as well.
>> >
>> > You're right, perhaps the debugfs is redundant when we have those user space
>> > tools but such tools are not available readily for all platforms/distros.
>> > Interfaces like /dev/cpu/*/msr that turbostat uses are not available on all
>> > the platforms.
>> > PMC driver is a debug driver so i thought its better to show Package C-state
>> > related info for low power debug here.
>> >
>> >>
>> >> Sorry, NAK.
>> >
>> > This patch has two parts i.e. exported PC10 API and the debugfs. Based on
>> > the above explanation, if the patch is not good as is, please let me know if
>> > i should drop the debugfs part and respin a v2 with just the exported API or
>> > drop this totally.
>> >
>> > Thanks for the feedback and thanks for taking time to review!
>>
>> Reading above makes me think that entire design of this is misguided.
>> Since the most of values are counters they better to be accessed in a
>> way how perf does.
>>
>> In case you need *in-kernel* facility, do some APIs (if it's not done
>> yet) for events drivers first.
>> cstate event driver is already in upstream.
>>
>> Sorry, NAK for entire patch until it would be blessed by people like Peter Z.
>>
>> --
>> With Best Regards,
>> Andy Shevchenko
>
> --
> Best Regards,
> Rajneesh
