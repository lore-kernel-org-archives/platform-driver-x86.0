From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 06/12] platform/x86: dell-wmi-smbios: Add a sysfs
 interface for SMBIOS tokens
Date: Wed, 27 Sep 2017 21:31:47 +0300
Message-ID: <CAHp75VfURDc-FPfnsO93B_P5sEz9EzxjuPjHLKArmB39ABMp1w@mail.gmail.com>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <1342f21a4f2c9af86d3033a9af9d9a4d05d27106.1505999739.git.mario.limonciello@dell.com>
 <20170925162333.GL22190@pali> <CAHp75Vd-mwn5O696XM7_F5-HMc2iztxibqQA0D4vOrMQO+WQRg@mail.gmail.com>
 <bb85503730a1479c94810a12802e8027@ausx13mpc120.AMER.DELL.COM>
 <20170927165051.GE23572@fury> <f4d8e4a5df5c4648a60392fc31c00766@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f171.google.com ([209.85.220.171]:46563 "EHLO
        mail-qk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751555AbdI0Sbt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 14:31:49 -0400
In-Reply-To: <f4d8e4a5df5c4648a60392fc31c00766@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, quasisec@google.com

On Wed, Sep 27, 2017 at 9:27 PM,  <Mario.Limonciello@dell.com> wrote:

>> > > > Darren, Andy, any comments? I'm not quite sure if such API is suitable
>> > > > for long term in kernel.
>> > >
>> > > I would try to avoid sysfs interfaces for some particular devices.
>> > > Besides we are creating a character device. Would it be suitable there?
>> >
>> > If the character device having 2 different ioctls for different needs is
>> > acceptable I'm happy to adjust the series to do this instead.
>>
>> One piece of feedback I had re the char device was to see if we could avoid the
>> need for the IOCTL altogether, I'd like to have that discussion before we add
>> another.
>
> My original design was sysfs files for everything but it was raised by several folks
> that you run into the potential of two userspace processes stomping on each
> other's data when they run the ACPI call.  That's why I need to have a mutex to
> protect and make sure that userspace calls get the right results.
>

>> > > > Basically tokens are list of tuples <id, location, value> with
>> > > > possibility to active them, right?
>> > > >
>> >
>> > I didn't add a way to activate them through this, it was only for
>> > reading purpose.  Activating them should be possible through the
>> > SMBIOS calling interface though.
>> >
>>
>> These are read-only as I understood it, and only with the right privileges.
>> Sysfs seemed appropriate for this to me.
>
> Andy S was against having this data as another sysfs file.   From a userspace
> perspective I think it's simpler to just parse a sysfs file with read only static
> data as root.  With the current ioctl based solution it requires userspace to run
> an ioctl to determine how many tokens exist, then allocate a chunk of memory
> big enough to hold all the token data and then run another ioctl to get all the tokens.
>
> Andy S, given this change between v1 and v2 what do you feel is better?

I have no strong opinion on this. That's why I recommended to listen to Andy L.

-- 
With Best Regards,
Andy Shevchenko
