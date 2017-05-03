From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Wed, 3 May 2017 17:42:02 +0300
Message-ID: <CAHp75Vefzv_1UdRyWVN3tCzTiPpWX616spNLbXoG=VEORuUyFA@mail.gmail.com>
References: <20170217184756.15181-1-rrs@debian.org> <1487759058.9334.7.camel@debian.org>
 <CAHp75VcGYLSsnDgb_dzD0NVCK+aR6w7jZWfR+4nN-BfnAcdRWA@mail.gmail.com>
 <1493448775.9725.5.camel@debian.org> <CAHp75Vds7Vc3aJWpOO8uqo-y+PzUO+PNrhsjnHxGRs4WXt935A@mail.gmail.com>
 <1493822196.17987.3.camel@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:34094 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753336AbdECOmD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 May 2017 10:42:03 -0400
In-Reply-To: <1493822196.17987.3.camel@debian.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ritesh Raj Sarraf <rrs@debian.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, May 3, 2017 at 5:36 PM, Ritesh Raj Sarraf <rrs@debian.org> wrote:
> Resending again, as Google servers are behaving weird lately.
>
> On Sun, 2017-04-30 at 15:54 +0300, Andy Shevchenko wrote:
>> > > the main issue that driver doesn't
>> > > send SW_TABLET_MODE event through input device.
>> >
>> > Well. Yes. That is one part. If SW_TABLET_MODE is done in the driver, much
>> > better. My patch was simply in line with some of the other drivers (hp-wmi
>> > and
>> > thinkpad_acpi) to get it working for Lenovo Yoga series.
>>
>> sysfs ABI for drivers that provide input interface is quite strong for
>> my opinion. It means I'm not totally objecting, but I would accept it
>> if and only if there is nothing else could be done.
>
> The need we have in the user application is for read-only access.

I does not matter at all! You are proposing a part of ABI which will
be closer to what is "carved in stone". Here is the problem.

So, I'm really trying hard to get avoid such "small things" which
would make our lives quite hard in long term prospective while fixing
short-term issues in a good will.

Please, consider to do it better. For now I didn't hear any proof that
there is no other way to achieve your goal.

-- 
With Best Regards,
Andy Shevchenko
