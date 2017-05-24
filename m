From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: Delete unused function ipc_data_readb()
Date: Wed, 24 May 2017 08:39:29 -0700
Message-ID: <CAD=FV=WojgDOFZ0AMbe18-B55XtJHbkXiPJyy=KE=ZzLBaci6g@mail.gmail.com>
References: <20170523205539.71450-1-mka@chromium.org> <20170524143932.11593845@alans-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:33737 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760072AbdEXPjb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 May 2017 11:39:31 -0400
Received: by mail-wm0-f54.google.com with SMTP id m7so24115570wmg.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 May 2017 08:39:31 -0700 (PDT)
In-Reply-To: <20170524143932.11593845@alans-desktop>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Cc: Matthias Kaehlcke <mka@chromium.org>, Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

Hi,

On Wed, May 24, 2017 at 6:39 AM, Alan Cox <gnomes@lxorguk.ukuu.org.uk> wrote:
> On Tue, 23 May 2017 13:55:39 -0700
> Matthias Kaehlcke <mka@chromium.org> wrote:
>
>> The function was added by commit 0a8b83530b6f ("intel_pmc_ipc: Add Intel
>> Apollo Lake PMC IPC driver") in 2015 and hasn't been used since then.
>> Removing it fixes the following warning when building with clang:
>>
>>     drivers/platform/x86/intel_pmc_ipc.c:189:18: error: unused function
>>         'ipc_data_readb' [-Werror,-Wunused-function]
>
> It is however also part of the API and a consistent sensible function to
> have present should it be needed. As it's static it's eliminated
> correctly by gcc.
>
> I'm all for eliminating unused functions but in this case I have to wonder

If it's a useful function to have present, it seems like adding
"__maybe_unused" makes sense, as Matthias did in
<https://patchwork.kernel.org/patch/9732009/>.  Would that work for
you?

-Doug
