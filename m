From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v4 05/14] platform/x86: dell-wmi-descriptor: split WMI
 descriptor into it's own driver
Date: Thu, 5 Oct 2017 08:29:10 +0300
Message-ID: <CAHp75Vc0umEt0cGn5-NWva6j1T0yry1Ag7Egnn4iSvz=cs_kTg@mail.gmail.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ff211830e3953c70aa8e0d43614619f1fb423668.1507156392.git.mario.limonciello@dell.com>
 <20171005010909.GC25018@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005010909.GC25018@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Mario Limonciello <mario.limonciello@dell.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, mjg59@google.com, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 5, 2017 at 4:09 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Oct 04, 2017 at 05:48:31PM -0500, Mario Limonciello wrote:
>> All communication on individual GUIDs should occur in separate drivers.
>> Allowing a driver to communicate with the bus to another GUID is just
>> a hack that discourages drivers to adopt the bus model.
>>
>> The information found from the WMI descriptor driver is now exported
>> for use by other drivers.

> You'll want to add something like:
>
> #ifdef CONFIG_DELL_WMI_DESCRIPTOR_MODULE
>         if (request_module("dell_wmi_descriptor"))
>                 /* FAIL */
> #endif
>
> During init.

I don't think #ifdef is needed.

We may just request module.

But looking in the code it seems that we simple need to select that
module. No request_module will be needed.
Did I miss something?

-- 
With Best Regards,
Andy Shevchenko
