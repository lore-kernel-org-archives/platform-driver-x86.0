From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: drivers/x86: add thinkpad-wmi
Date: Tue, 7 Nov 2017 14:46:19 +0200
Message-ID: <CAHp75VfRggWw_yx22i0Sd0ow7r6F_5kDxqYOSUGMq+DAd9veLw@mail.gmail.com>
References: <20171021064102.15166-1-corentin.chary@gmail.com>
 <b16e8dbf-a40a-9392-5fb6-c09ef4501171@dell.com> <CAHR064iYRWeCpAQ-FfWK+=6iiJNDGsSBu1vrEt5Sp2iFTmAo8Q@mail.gmail.com>
 <6fd4228bba1947e5b5a3ffe060ee667d@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f170.google.com ([209.85.216.170]:50628 "EHLO
        mail-qt0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751754AbdKGMqV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Nov 2017 07:46:21 -0500
In-Reply-To: <6fd4228bba1947e5b5a3ffe060ee667d@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Nov 6, 2017 at 8:16 PM,  <Mario.Limonciello@dell.com> wrote:
>> On Tue, Oct 24, 2017 at 10:59 PM, Mario Limonciello
>> <Mario.Limonciello@dell.com> wrote:

Mario, thanks for your comments on the subject.

>> > The hope is that eventually drivers on the WMI bus don't need to be very
>> > rich in code, but more intelligence comes from the bus.  That would mean
>> > that the bus parses the MOF and knows what types of data would be passed in
>> > individual method GUIDs.  The bus would know what size of data that is and
>> > what fields represent what in data objects.  The vendor drivers may add some
>> > filtering or permissions checking, but that would be it.
>> >
>> > We still don't have MOF parsing in the kernel, but I think that it's good to
>> > set up concepts that reflect how we want it to work until it's available.
>> > That should mean that if you get the interfaces right that later your driver
>> > can shrink.  My patch series isn't yet accepted, so what I'm doing isn't
>> > necessarily the way it will be done, I just want to let you know about it.
>> >
>> > The big notable differences with how we're approaching our drivers:
>> > 1) GUID's that provide methods are given direct execution paths in sysfs
>> > files through your patch.  This means that there could be a ton of different
>> > sysfs attributes that vary from vendor to vendor based on what they offer.
>> > I set up a concept that method type GUID's would be handled by the WMI bus
>> > by creating a character device in the /dev/wmi and copying in/out data for
>> > those method objects.
>>
>> Wouldn't that be a little harder to use from userspace ? (But I can
>> see how it makes it more generic).
>
> The concept that we're working with would mean that some userspace software
> can read sysfs attributes to understand what data format is being communicated
> and then know how to pack data into the character device when communicating
> with WMI bus.
>
> This is closer to the Windows model too with PowerShell.  You query the namespace
> to determine what methods are offered via the MOF and then you can pack the
> data and PowerShell will ferry it out to the ASL to execute and return the results.

Interoperability with Windows is a plus in my opinion. So, Windows
user or even developer finds themselves in slightly more convenient
environment.

>> > 2) You don't register all devices with the WMI bus.  Each of your GUIDs that
>> > you interact with should really be registered with the bus.  Some of the
>> > data you're interested in should be exposed there.
>> > I can't speak on behalf of Darren and Andy here, but I would anticipate they
>> > don't want "new" WMI drivers introduced that don't register and use the WMI
>> > bus properly.  I only see the single GUID that registered.
>>
>> Well, these aren't really "devices". I can register all methods to the
>> BUS  though, but it'll be weird for the end user.
>> What is your suggestion here ?
>
> The WMI bus device model means that any "GUID" is a device associated to the WMI
> bus.  I view your driver as putting another level of granularity on top of that.
> Whether you adopt a character device or sysfs attributes for communicating to the
> bus, you should still have some sort of driver that packs all the GUID's into subdevices
> under say a platform device.
>
> I think you should look for some feedback from Darren or Andy on how they want to
> see this work.

My preference here is to try to have as much generic and flexible
interface in kernel that may allow user space application utilize
customisations.
Though I think Darren is more involved in WMI activity and can share
his view on all of this.

>> > 3) Your driver provides more granular data than mine (as that's how it is
>> > exposed by Lenovo's design).  I think this is a good thing, and you should
>> > find a way to programattically expose your attributes to sysfs instead of
>> > debugfs if possible.
>> >
>> > The driver looks very good to me though, a few nested comments:
>>
>> Thanks for the review Mario. I'm afraid I won't have much more time in
>> the near future to make changes to this driver. What do you think
>> would be the minimal set of changes to make this good enough to be
>> merged ?
>
> I'm just a contributor myself who has recently worked on a WMI driver series.
> I would defer to Andy and Darren to decide what they would like to accept.

...

> it would be difficult to update to the
> newer model we're working towards when we have the kernel learning how to
> parse MOF and programmatically producing sysfs attributes for interacting with
> character devices.

...and since your stuff is scheduled for v4.15 the possibility to
(re-)use as much as possible from it is a plus.

> Since the kernel has to keep a stable interface to userspace you may run into a
> situation that one day you want to update to the new interfaces and might have a
> difficult time since you have to continue to offer a configuration option to offer these
> old interfaces too.

This is a good point.

-- 
With Best Regards,
Andy Shevchenko
