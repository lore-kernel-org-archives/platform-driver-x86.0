From: Andy Lutomirski <luto@kernel.org>
Subject: Re: RFC: WMI Enhancements
Date: Thu, 13 Apr 2017 08:34:48 -0700
Message-ID: <CALCETrWOY2Jzj4ht37GUVEisqotPXucEHaaym=HU97CwYh3n8A@mail.gmail.com>
References: <20170412230854.GA11963@fury> <20170413073228.GB1462@ozzy.nask.waw.pl>
 <3370431810bd4bc09fd9eb16eb9abea5@ausx13mpc120.AMER.DELL.COM> <20170413135102.GL3090@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20170413135102.GL3090@pali>
Sender: linux-pm-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Mario.Limonciello@dell.com, Hans de Goede <hdegoede@redhat.com>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, corentin.chary@gmail.com, Andrew Lutomirski <luto@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 13, 2017 at 6:51 AM, Pali Rohár <pali.rohar@gmail.com> wrote:
> On Thursday 13 April 2017 13:29:41 Mario.Limonciello@dell.com wrote:
>> > Please pardon my ignorance, but what do we actually gain by exposing WMI to
>> > userspace?  Enabling applications to fetch SMBIOS data?  We already have an
>> > interface for that.  Enabling applications to receive input events?  Likewise.
>>
>> Input notifications are just one aspect that received over WMI.  I don't see any
>> reason to move the notifications out of the kernel.
>>
>> In terms of userspace applications, once a WMI interface to userspace is available
>> libsmbios would change over to that.  Applications using libsmbios would benefit.
>
> Really libsmbios matters here? Hans (added to thread) wrote that
> libsmbios is a relic, something of ages long gone by and a normal user
> should never use it.
>
> If this is truth and libsmbios should not be used, then we probably do
> not need to care about it in changes for WMI.
>
> Hans, Mario, any comment/clarification about it?
>
>> > You mentioned WMI's efficiency compared to SMI/SMM, but is it a difference
>> > significant enough for anyone to notice?
>>
>> At least for Dell there are optimizations being made when data is requested over
>> the WMI-ACPI wrapper instead of directly via SMI/SMM.
>>
>> For example if the data is a "static" table or the request is to something that is
>> passed thru to the EC it's a big waste of effort to put the CPU in SMM.
>>
>> The savings there is significant.
>
> Maybe we can use this Dell WMI-ACPI wrapper for kernel drivers instead
> of current SMI/SMM direct access?
>

This would make sense to me.  IIRC the only functional difference is
the way that pointers are handled.  It shouldn't be that hard to make
it work for both variants, though.  It could look like:

buf = dell_smbios_alloc(...);
dell_smbios_put_pointer(buf, offset of pointer, offset of pointee);
dell_smbios_call(buf);

or similar.
