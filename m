From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 06/12] platform/x86: dell-wmi-smbios: Add a sysfs
 interface for SMBIOS tokens
Date: Wed, 27 Sep 2017 12:49:04 -0700
Message-ID: <3a5a8de9-0a5b-45ad-73c6-6b3ebfdd5ebb@kernel.org>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <1342f21a4f2c9af86d3033a9af9d9a4d05d27106.1505999739.git.mario.limonciello@dell.com>
 <20170925162333.GL22190@pali>
 <CAHp75Vd-mwn5O696XM7_F5-HMc2iztxibqQA0D4vOrMQO+WQRg@mail.gmail.com>
 <bb85503730a1479c94810a12802e8027@ausx13mpc120.AMER.DELL.COM>
 <20170927165051.GE23572@fury>
 <f4d8e4a5df5c4648a60392fc31c00766@ausx13mpc120.AMER.DELL.COM>
 <CAHp75VfURDc-FPfnsO93B_P5sEz9EzxjuPjHLKArmB39ABMp1w@mail.gmail.com>
 <20170927185514.GN23572@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751811AbdI0TtF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 15:49:05 -0400
In-Reply-To: <20170927185514.GN23572@fury>
Content-Language: en-MW
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Lutomirski <luto@amacapital.net>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, quasisec@google.com

On 09/27/2017 11:55 AM, Darren Hart wrote:
> On Wed, Sep 27, 2017 at 09:31:47PM +0300, Andy Shevchenko wrote:
>> On Wed, Sep 27, 2017 at 9:27 PM,  <Mario.Limonciello@dell.com> wrote:
>>
>>>>>>> Darren, Andy, any comments? I'm not quite sure if such API is suitable
>>>>>>> for long term in kernel.
>>>>>>
>>>>>> I would try to avoid sysfs interfaces for some particular devices.
>>>>>> Besides we are creating a character device. Would it be suitable there?
>>>>>
>>>>> If the character device having 2 different ioctls for different needs is
>>>>> acceptable I'm happy to adjust the series to do this instead.
>>>>
>>>> One piece of feedback I had re the char device was to see if we could avoid the
>>>> need for the IOCTL altogether, I'd like to have that discussion before we add
>>>> another.
>>>
>>> My original design was sysfs files for everything but it was raised by several folks
>>> that you run into the potential of two userspace processes stomping on each
>>> other's data when they run the ACPI call.  That's why I need to have a mutex to
>>> protect and make sure that userspace calls get the right results.
>>>
>>
>>>>>>> Basically tokens are list of tuples <id, location, value> with
>>>>>>> possibility to active them, right?
>>>>>>>
>>>>>
>>>>> I didn't add a way to activate them through this, it was only for
>>>>> reading purpose.  Activating them should be possible through the
>>>>> SMBIOS calling interface though.
>>>>>
>>>>
>>>> These are read-only as I understood it, and only with the right privileges.
>>>> Sysfs seemed appropriate for this to me.
>>>
>>> Andy S was against having this data as another sysfs file.   From a userspace
>>> perspective I think it's simpler to just parse a sysfs file with read only static
>>> data as root.  With the current ioctl based solution it requires userspace to run
>>> an ioctl to determine how many tokens exist, then allocate a chunk of memory
>>> big enough to hold all the token data and then run another ioctl to get all the tokens.
>>>
>>> Andy S, given this change between v1 and v2 what do you feel is better?
>>
>> I have no strong opinion on this. That's why I recommended to listen to Andy L.
> 
> +Andy Lutomirski
> 
> Andy L, any preference on your part regarding exporting these tokens via sysfs
> or through an additional IOCTL in the chardev?
> 

Not really.  If this is indeed static data that is potentially useful 
for scripts and such, than sysfs is kind of nice.
