From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: drivers/x86: add thinkpad-wmi
Date: Fri, 10 Nov 2017 14:43:15 +0100
Message-ID: <CAHR064iDaYBEK9Yov1UebaQrqcpgV0zfiO-nvDqKJg2MgHTRDg@mail.gmail.com>
References: <20171021064102.15166-1-corentin.chary@gmail.com>
 <b16e8dbf-a40a-9392-5fb6-c09ef4501171@dell.com> <CAHR064iYRWeCpAQ-FfWK+=6iiJNDGsSBu1vrEt5Sp2iFTmAo8Q@mail.gmail.com>
 <6fd4228bba1947e5b5a3ffe060ee667d@ausx13mpc120.AMER.DELL.COM>
 <CAHp75VfRggWw_yx22i0Sd0ow7r6F_5kDxqYOSUGMq+DAd9veLw@mail.gmail.com> <20171108213156.GC21449@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:54131 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751664AbdKJNnR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Nov 2017 08:43:17 -0500
In-Reply-To: <20171108213156.GC21449@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 8, 2017 at 10:31 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, Nov 07, 2017 at 02:46:19PM +0200, Andy Shevchenko wrote:
>> On Mon, Nov 6, 2017 at 8:16 PM,  <Mario.Limonciello@dell.com> wrote:
>> >> On Tue, Oct 24, 2017 at 10:59 PM, Mario Limonciello
>> >> <Mario.Limonciello@dell.com> wrote:
>>
>> Mario, thanks for your comments on the subject.
>>
>> >> > The hope is that eventually drivers on the WMI bus don't need to be very
>> >> > rich in code, but more intelligence comes from the bus.  That would mean
>> >> > that the bus parses the MOF and knows what types of data would be passed in
>> >> > individual method GUIDs.  The bus would know what size of data that is and
>> >> > what fields represent what in data objects.  The vendor drivers may add some
>> >> > filtering or permissions checking, but that would be it.
>> >> >
>> >> > We still don't have MOF parsing in the kernel, but I think that it's good to
>> >> > set up concepts that reflect how we want it to work until it's available.
>> >> > That should mean that if you get the interfaces right that later your driver
>> >> > can shrink.  My patch series isn't yet accepted, so what I'm doing isn't
>> >> > necessarily the way it will be done, I just want to let you know about it.
>> >> >
>> >> > The big notable differences with how we're approaching our drivers:
>> >> > 1) GUID's that provide methods are given direct execution paths in sysfs
>> >> > files through your patch.  This means that there could be a ton of different
>> >> > sysfs attributes that vary from vendor to vendor based on what they offer.
>> >> > I set up a concept that method type GUID's would be handled by the WMI bus
>> >> > by creating a character device in the /dev/wmi and copying in/out data for
>> >> > those method objects.
>> >>
>> >> Wouldn't that be a little harder to use from userspace ? (But I can
>> >> see how it makes it more generic).
>
> Yes, it doesn't provide as discoverable an interface, now one that is as
> easy to use from the shell. However, it does so through sysfs and a
> defined character device rather than through debugfs, and can be relied
> upon by applications to exist.
>
> From a vendors perspective, this is an important distinction -
> especially for things like bios settings, passwords, etc. which tend to
> be of value in enterprise deployments, where something like debugfs is
> not going to be enabled.
>
> I can definitely see why the approach you took would be appealing to an
> individual developer.
>
> For our context - Corentin, what motivated you to write the thinkpad-wmi driver
> exposing these sorts of features?

I did it for fun a few years ago. I know that it ended up being used
in at least one company with a large fleet of lenovo laptop.

>
>> >
>> > The concept that we're working with would mean that some userspace software
>> > can read sysfs attributes to understand what data format is being communicated
>> > and then know how to pack data into the character device when communicating
>> > with WMI bus.
>> >
>> > This is closer to the Windows model too with PowerShell.  You query the namespace
>> > to determine what methods are offered via the MOF and then you can pack the
>> > data and PowerShell will ferry it out to the ASL to execute and return the results.
>>
>> Interoperability with Windows is a plus in my opinion. So, Windows
>> user or even developer finds themselves in slightly more convenient
>> environment.
>>
>
> Indeed.
>
>> >> > 2) You don't register all devices with the WMI bus.  Each of your GUIDs that
>> >> > you interact with should really be registered with the bus.  Some of the
>> >> > data you're interested in should be exposed there.
>> >> > I can't speak on behalf of Darren and Andy here, but I would anticipate they
>> >> > don't want "new" WMI drivers introduced that don't register and use the WMI
>> >> > bus properly.  I only see the single GUID that registered.
>> >>
>> >> Well, these aren't really "devices". I can register all methods to the
>
> With the WMI bus abstraction model Andy L. introduced, each GUID is a
> device, as Mario describes below.
>
>> >> BUS  though, but it'll be weird for the end user.
>> >> What is your suggestion here ?
>> >
>> > The WMI bus device model means that any "GUID" is a device associated to the WMI
>> > bus.  I view your driver as putting another level of granularity on top of that.
>> > Whether you adopt a character device or sysfs attributes for communicating to the
>> > bus, you should still have some sort of driver that packs all the GUID's into subdevices
>> > under say a platform device.
>> >
>> > I think you should look for some feedback from Darren or Andy on how they want to
>> > see this work.
>>
>> My preference here is to try to have as much generic and flexible
>> interface in kernel that may allow user space application utilize
>> customisations.
>> Though I think Darren is more involved in WMI activity and can share
>> his view on all of this.
>>
>
> I would certainly prefer to see new drivers use this model - however!
> one of the requirements to exporting WMI devices to userspace via the
> generic mechanism is involvement from the vendor. Is Lenovo involved?
> Can we talk to them about their level of testing and input validation to
> ensure these methods don't do something else in addition to their
> stated purpose?

I have no link with Lenovo.

>
>> >> > 3) Your driver provides more granular data than mine (as that's how it is
>> >> > exposed by Lenovo's design).  I think this is a good thing, and you should
>> >> > find a way to programattically expose your attributes to sysfs instead of
>> >> > debugfs if possible.
>> >>
>
> Using sysfs wherever possible is definitely preferred, yes.

The general idea with the current driver was to make these feature
available but still be free to change the interface, thus the use of
debugfs instead of sysfs for now.

>
>> >> > The driver looks very good to me though, a few nested comments:
>> >>
>> >> Thanks for the review Mario. I'm afraid I won't have much more time in
>> >> the near future to make changes to this driver. What do you think
>> >> would be the minimal set of changes to make this good enough to be
>> >> merged ?
>> >
>> > I'm just a contributor myself who has recently worked on a WMI driver series.
>> > I would defer to Andy and Darren to decide what they would like to accept.
>>
>
> Holding off here until Corentin has a chance to respond to my inquiries
> above.
>
>> ...
>>
>> > it would be difficult to update to the
>> > newer model we're working towards when we have the kernel learning how to
>> > parse MOF and programmatically producing sysfs attributes for interacting with
>> > character devices.
>>
>> ...and since your stuff is scheduled for v4.15 the possibility to
>> (re-)use as much as possible from it is a plus.
>>
>> > Since the kernel has to keep a stable interface to userspace you may run into a
>> > situation that one day you want to update to the new interfaces and might have a
>> > difficult time since you have to continue to offer a configuration option to offer these
>> > old interfaces too.
>>
>> This is a good point.
>
> And one which debugfs helps skirt a bit. If this was done with sysfs and
> merged, we would basically have to create a new thinkpad-wmi-2 driver
> providing the new bus/driver/mof model.
>
> Let's talk about intel and vendor involvement above, and revisit next
> steps after that.
>
> --
> Darren Hart
> VMware Open Source Technology Center



-- 
Corentin Chary
http://xf.iksaif.net
