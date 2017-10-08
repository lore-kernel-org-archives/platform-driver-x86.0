From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Add Package C-states
 residency info
Date: Sun, 8 Oct 2017 21:31:39 +0300
Message-ID: <CAHp75VdTJNt7dk1hM1X27gZDocp-XnX974c6N1FEzcf=Q6kz0w@mail.gmail.com>
References: <1503059853-5118-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <CAHp75VfFrdiSDb_SAunCAdWZY0FPY9hxriCgVUYn00_gmOQQcw@mail.gmail.com>
 <20170818145843.GA10366@raj-desk2.iind.intel.com> <CAHp75Vd5Wnio-RCEBENtonYWOJF2+88FDvqkUv1HzV3CdcaaPA@mail.gmail.com>
 <20170818174725.GB12519@raj-desk2.iind.intel.com> <CACK8Z6H=B4w7n+U8R7Z7wWJTdvv5iCJpBe61mwGF34XMCDXiWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:50859 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751572AbdJHSbk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 8 Oct 2017 14:31:40 -0400
In-Reply-To: <CACK8Z6H=B4w7n+U8R7Z7wWJTdvv5iCJpBe61mwGF34XMCDXiWw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajat Jain <rajatja@google.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Derek Basehore <dbasehore@chromium.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Derek Basehore <dbasehore@google.com>

On Sat, Aug 19, 2017 at 2:23 AM, Rajat Jain <rajatja@google.com> wrote:
> On Fri, Aug 18, 2017 at 10:47 AM, Rajneesh Bhardwaj
> <rajneesh.bhardwaj@intel.com> wrote:
>> On Fri, Aug 18, 2017 at 08:17:32PM +0300, Andy Shevchenko wrote:
>>> On Fri, Aug 18, 2017 at 5:58 PM, Rajneesh Bhardwaj
>>> <rajneesh.bhardwaj@intel.com> wrote:
>>> > On Fri, Aug 18, 2017 at 03:57:34PM +0300, Andy Shevchenko wrote:
>>> >> On Fri, Aug 18, 2017 at 3:37 PM, Rajneesh Bhardwaj
>>> >> <rajneesh.bhardwaj@intel.com> wrote:

>>> > This is needed to enhance the S0ix failure debug capabilities from within
>>> > the kernel. On ChromeOS we have S0ix failsafe kernel framework that is used
>>> > to validate S0ix and report the blockers in case of a failure.
>>> > https://patchwork.kernel.org/patch/9148999/
>>>
>>> (It's not part of upstream)
>>
>> Sorry i sent an older link. There are fresh attempts to get this into
>> mainline kernel and looks like there is a traction for it.
>> https://patchwork.kernel.org/patch/9831229/
>>
>> Package C-state (PC10) validation is discussed there.
>
> Yes, Derek has been trying to get it up streamed, and is currently
> taking care of the comments. One of the comments Rafael Wysocki had
> (https://lkml.org/lkml/2017/7/10/741), was that getting to PC10 takes
> care of large amount of power savings, and PC10 is a logical milestone
> to track / validate as it validates the north complex power state. To
> do that we need an API to get the PC10 counter.

So, how many ways we have to get that counter?

From HW prospective; from Linux kernel prospective; from user space prospective.

> I do agree that an exposed API needs to have a user code that uses the
> API. In this case it seems to be a chicken and egg problem i.e. the
> S0ix failsafe framework (https://patchwork.kernel.org/patch/9831229/)
> needs this API, and the API needs a user (failsafe framework) for it
> to be accepted?

So, Derek's patch as I can see didn't made upstream and the whole
activity seems staled.

I'm going to mark this as Rejected. Whenever it would be new approach
feel free to send a new version.

-- 
With Best Regards,
Andy Shevchenko
