From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v5 09/14] platform/x86: dell-smbios: Introduce dispatcher
 for SMM calls
Date: Mon, 9 Oct 2017 02:10:15 +0300
Message-ID: <CAHp75VdrEGDixMjPS3kXHqgcLNOSJ3eqYAfz9dX1kkU8NxF0mQ@mail.gmail.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
 <f53c8cfd7002ba288a061dacf70ad4161d203419.1507350554.git.mario.limonciello@dell.com>
 <CAHp75VeD+KReTDfBA2mTG=DczbGf74T5Fyo7NNcaVNp0nqdXfA@mail.gmail.com>
 <CAHp75VcPEtDjFSguTYd=eqfaG7h5hzCPg_d9H5rMK1O390tUBQ@mail.gmail.com> <6a652e65f1bd494ab099a43b8e84a2d0@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6a652e65f1bd494ab099a43b8e84a2d0@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, mjg59@google.com, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 9, 2017 at 12:45 AM,  <Mario.Limonciello@dell.com> wrote:

>> >>  config DELL_SMBIOS
>> >>         tristate
>> >
>> >> +       depends on DELL_SMBIOS_SMM
>> >> +
>> >
>> > If the above dependency is true (which I'm quite sure not) this split
>> > should never happen.
>>
>> Hmm... One more thought here.
>>
>> Which is library and which is not? IOW the question is "can
>> DELL_SMBIOS be a standalone working module"?
>>
>
> It can technically be compiled as a standalone module, but it won't do
> anything as a standalone module as of this patch.
>
> After the sysfs tokens patch it could be used to provide token information
> without the SMM or WMI drivers.
> (although this interface will have to change based upon Greg's most recent
> feedback).
>
> In terms of transitioning people moving from older kernels to new, it makes
> most sense to me that it's automatically selecting DELL_SMBIOS_SMM if you
> had it selected previously, but I'll defer to you judgement if the dependency
> should be dropped since it can be a standalone module that just doesn't do
> anything.

Okay, if we can call it "a library" then remove the reverse dependency
as I mentioned in first comment.

-- 
With Best Regards,
Andy Shevchenko
