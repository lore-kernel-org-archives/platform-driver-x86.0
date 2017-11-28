From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH] platform/x86: hp-wmi: Actually use mask parameter in
 hp_wmi_hw_state
Date: Tue, 28 Nov 2017 20:41:47 +0100
Message-ID: <f60a192f-c83e-9a27-4d4a-64cecaeb9378@daenzer.net>
References: <20171128151758.9234-1-michel@daenzer.net>
 <20171128165724.GA16349@fury>
 <e8ff5280-537e-bb60-f0ba-791117abb4a4@daenzer.net>
 <CAHp75VdSiR=X-Dq2dto2osc3UiTid7h=T764cZkNgXEyTpEJcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.netline.ch ([148.251.143.178]:44210 "EHLO
        netline-mail3.netline.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752417AbdK1Tlu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 14:41:50 -0500
In-Reply-To: <CAHp75VdSiR=X-Dq2dto2osc3UiTid7h=T764cZkNgXEyTpEJcg@mail.gmail.com>
Content-Language: en-CA
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2017-11-28 08:30 PM, Andy Shevchenko wrote:
> On Tue, Nov 28, 2017 at 8:06 PM, Michel Dänzer <michel@daenzer.net> wrote:
>> On 2017-11-28 05:57 PM, Darren Hart wrote:
>>> On Tue, Nov 28, 2017 at 04:17:58PM +0100, Michel Dänzer wrote:
>>>> We were always checking bit 0 (which represents the docked state)
>>>> regardless of the mask.
>>>>
>>>> Fixes the "tablet mode" state always being reported the same as the
>>>> docked state, which with current libinput can cause the built-in input
>>>> devices of laptops to be incorrectly disabled while docked.
> 
>>> Merged in 4.15-rc1
>>
>> AFAIK commits without
>>
>>  Cc: stable@vger.kernel.org
>>
>> don't get automatically picked up for stable branches. Can you manually
>> nominate 9968e12 for stable?
> 
> AFAIK Greg picks up patches based on Fixes tag as well.
> Feel free to ping us or just forward that one yourself if Greg will
> not pick up in reasonable (month?) time.

Both 4.14.1 and 4.14.2 were released after Linus merged the fix, but
neither has it. Given that, and that a fair number of people seem to be
running into this, seems like a good idea to do it ASAP.


-- 
Earthling Michel Dänzer               |               http://www.amd.com
Libre software enthusiast             |             Mesa and X developer
