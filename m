From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Sun, 30 Apr 2017 15:54:43 +0300
Message-ID: <CAHp75Vds7Vc3aJWpOO8uqo-y+PzUO+PNrhsjnHxGRs4WXt935A@mail.gmail.com>
References: <20170217184756.15181-1-rrs@debian.org> <1487759058.9334.7.camel@debian.org>
 <CAHp75VcGYLSsnDgb_dzD0NVCK+aR6w7jZWfR+4nN-BfnAcdRWA@mail.gmail.com> <1493448775.9725.5.camel@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f170.google.com ([209.85.216.170]:33045 "EHLO
        mail-qt0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S969829AbdD3Myp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Apr 2017 08:54:45 -0400
In-Reply-To: <1493448775.9725.5.camel@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ritesh Raj Sarraf <rrs@debian.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Apr 29, 2017 at 9:52 AM, Ritesh Raj Sarraf <rrs@debian.org> wrote:
> Hello,
>
> On Fri, 2017-04-28 at 22:17 +0300, Andy Shevchenko wrote:
>> On Wed, Feb 22, 2017 at 12:24 PM, Ritesh Raj Sarraf <rrs@debian.org> wrote:
>>
>> > Any further comment on this patch ? Will this be accepted ?
>> > Please give a N/ACK.
>>
>> Sorry for a long delay, but I can't go with this without clear
>> understanding that there is indeed no other ways available.
>> From what I read in the above link
>
> i am assuming you are referring to the launchpad bug report here.

Correct.

>> the main issue that driver doesn't
>> send SW_TABLET_MODE event through input device.
>
> Well. Yes. That is one part. If SW_TABLET_MODE is done in the driver, much
> better. My patch was simply in line with some of the other drivers (hp-wmi and
> thinkpad_acpi) to get it working for Lenovo Yoga series.

sysfs ABI for drivers that provide input interface is quite strong for
my opinion. It means I'm not totally objecting, but I would accept it
if and only if there is nothing else could be done.

-- 
With Best Regards,
Andy Shevchenko
