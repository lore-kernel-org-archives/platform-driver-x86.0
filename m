From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: 5.6 regression caused by "ACPICA: Dispatcher: always generate
 buffer objects for ASL create_field() operator"
Date: Thu, 7 May 2020 09:34:19 +0200
Message-ID: <4443e82e-6c1f-696f-1f16-12b1c0c33b13@redhat.com>
References: <49f20a91-9362-6249-d413-1461258d56a9@redhat.com>
 <11795a75-70de-5fcc-878f-14a0381947ea@gmail.com>
 <BYAPR11MB3096868FE8523B2F94A50F9DF0A70@BYAPR11MB3096.namprd11.prod.outlook.com>
 <7fb8757c-41e7-3be0-5552-80696559bdfe@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <7fb8757c-41e7-3be0-5552-80696559bdfe@intel.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, "Kaneda, Erik" <erik.kaneda@intel.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, "Moore, Robert" <robert.moore@intel.com>, Mattia Dongili <malattia@linux.it>, William Bader <williambader@hotmail.com>, Dominik Mierzejewski <dominik@greysector.net>, linux-acpi <linux-acpi@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 5/6/20 7:21 PM, Rafael J. Wysocki wrote:
> On 5/6/2020 12:11 AM, Kaneda, Erik wrote:
>>
>>> -----Original Message-----
>>> From: linux-acpi-owner@vger.kernel.org <linux-acpi-
>>> owner@vger.kernel.org> On Behalf Of Maximilian Luz
>>> Sent: Tuesday, May 5, 2020 6:50 AM
>>> To: Hans de Goede <hdegoede@redhat.com>; Wysocki, Rafael J
>>> <rafael.j.wysocki@intel.com>; Moore, Robert <robert.moore@intel.com>;
>>> Kaneda, Erik <erik.kaneda@intel.com>; Mattia Dongili <malattia@linux.it>;
>>> William Bader <williambader@hotmail.com>; Dominik Mierzejewski
>>> <dominik@greysector.net>
>>> Cc: linux-acpi <linux-acpi@vger.kernel.org>; Darren Hart
>>> <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>;
>>> platform-driver-x86@vger.kernel.org
>>> Subject: Re: 5.6 regression caused by "ACPICA: Dispatcher: always generate
>>> buffer objects for ASL create_field() operator"
>>>
>>> On 5/5/20 2:55 PM, Hans de Goede wrote:
>>>> Hi All,
>>>>
>>>> Commit 6d232b29cfce ("ACPICA: Dispatcher: always generate buffer
>>>> objects for ASL create_field() operator") has dropped the automatic
>>>> conversion of small buffers into integers.
>>>>
>>>> But some drivers relied on this automatic conversion, these drivers
>>>> have checks like this:
>>>>
>>>>           if (object->type != ACPI_TYPE_INTEGER) {
>>>>                   pr_warn("Invalid acpi_object: expected 0x%x got 0x%x\n",
>>>>                                   ACPI_TYPE_INTEGER, object->type);
>>>>                   kfree(object);
>>>>                   return -EINVAL;
>>>>           }
>>>>
>>>> This specific bit comes from the sony-laptop (platform/x86) code, the
>>>> ACPICA change has broken this code, causing systems using this driver
>>>> to hang on resume from suspend.
>>>>
>>>> We have multiple bug-reports open for this already:
>>>>
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=207491
>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1829096
>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1830150
>>>>
>>>> Mattia Dongili, the sony-laptop driver has already submitted a fix for
>>>> this upstream, adjusting the sony-laptop driver to deal with the
>>>> returned object type now being a BUFFER.
>>>>
>>>> The goal of this email is to:
>>>>
>>>> 1. Make everyone involved aware of this breakage as we may see similar
>>>> breakage elsewhere.
>>>>
>>>> 2. Discuss if we should maybe revert the ACPICA change.
>>>>
>>>> If you are reading this then 1. has been accomplished :)
>>>>
>>>> Which leaves us with 2. I'm tending towards keeping the change, since
>>>> it seems the right thing to do and dealing with the fallout. But since
>>>> there is fallout we should also at least consider reverting the ACPICA
>>>> change.
>>>>
>>>> So ACPI maintainers what is you take on this ?
>> What a mess. Several thoughts...
>>
>> I think we should keep the internal AML interpreter behavior as is because it solves a problem.
> 
> I also would prefer to deal with the fallout rather than to revert the fix.
> 
> I think that the potential damage is limited and the affected driver code should be fixed anyway which may not happen if the change in question is reverted.

Ok, so it seems that we are all in agreement to NOT revert and to deal
with any (other) fallout instead.

Andy / Darren can you get the sony-laptop fix merged and on its way
to Linus as a fix please?

Regards,

Hans
