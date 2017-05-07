From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: Add sysfs interface for
 touchpad state
Date: Sun, 7 May 2017 14:36:29 +0300
Message-ID: <CAHp75Vfsj4yzjgqaVmu14V4CLKzt7TAduFQjLZpHwUfpYF598Q@mail.gmail.com>
References: <20170217184756.15181-1-rrs@debian.org> <1487759058.9334.7.camel@debian.org>
 <CAHp75VcGYLSsnDgb_dzD0NVCK+aR6w7jZWfR+4nN-BfnAcdRWA@mail.gmail.com>
 <1493448775.9725.5.camel@debian.org> <CAHp75Vds7Vc3aJWpOO8uqo-y+PzUO+PNrhsjnHxGRs4WXt935A@mail.gmail.com>
 <1493822196.17987.3.camel@debian.org> <CAHp75Vefzv_1UdRyWVN3tCzTiPpWX616spNLbXoG=VEORuUyFA@mail.gmail.com>
 <20170503161104.GA30927@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:33564 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751086AbdEGXHN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 7 May 2017 19:07:13 -0400
In-Reply-To: <20170503161104.GA30927@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Ritesh Raj Sarraf <rrs@debian.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, May 3, 2017 at 7:11 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, May 03, 2017 at 05:42:02PM +0300, Andy Shevchenko wrote:
>> On Wed, May 3, 2017 at 5:36 PM, Ritesh Raj Sarraf <rrs@debian.org> wrote:
>> > Resending again, as Google servers are behaving weird lately.
>> >
>> > On Sun, 2017-04-30 at 15:54 +0300, Andy Shevchenko wrote:
>> >> > > the main issue that driver doesn't
>> >> > > send SW_TABLET_MODE event through input device.
>> >> >
>> >> > Well. Yes. That is one part. If SW_TABLET_MODE is done in the driver, much
>> >> > better. My patch was simply in line with some of the other drivers (hp-wmi
>> >> > and
>> >> > thinkpad_acpi) to get it working for Lenovo Yoga series.
>> >>
>> >> sysfs ABI for drivers that provide input interface is quite strong for
>> >> my opinion. It means I'm not totally objecting, but I would accept it
>> >> if and only if there is nothing else could be done.
>> >
>> > The need we have in the user application is for read-only access.
>>
>> I does not matter at all! You are proposing a part of ABI which will
>> be closer to what is "carved in stone". Here is the problem.
>>
>> So, I'm really trying hard to get avoid such "small things" which
>> would make our lives quite hard in long term prospective while fixing
>> short-term issues in a good will.
>>
>> Please, consider to do it better. For now I didn't hear any proof that
>> there is no other way to achieve your goal.
>
> I spent a day with the Lenovo Yoga 2 11 I have available, and have not yet found
> a reliable means of detecting the tablet mode (reverse engineering these things
> isn't something I'm expert at though). I've reached out to the original author
> for some context, but that didn't lead to any revelations as of yet.

Okay, I have pushed to testing current version and put on top the
separate patch for switching attribute to be RO.
(I just realized it might produce a warning since we have defined and
not used function.)

> Ultimately, this sysfs attribute is no better or worse than others that exist in
> our tree. So until we can provide a better solution, we do need to be careful
> to not inadvertently favor one laptop driver over another while seeking to avoid
> sysfs stable API issues.
>
> I do think we need to start distinguishing between core kernel userspace
> interfaces and leaf node driver sysfs attributes.

More flexibility -- more ways to abuse it OTOH :-)

-- 
With Best Regards,
Andy Shevchenko
