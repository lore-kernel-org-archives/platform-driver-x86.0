From: Hans de Goede <hdegoede@redhat.com>
Subject: 5.6 regression caused by "ACPICA: Dispatcher: always generate buffer
 objects for ASL create_field() operator"
Date: Tue, 5 May 2020 14:55:54 +0200
Message-ID: <49f20a91-9362-6249-d413-1461258d56a9@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Maximilian Luz <luzmaximilian@gmail.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Bob Moore <robert.moore@intel.com>, Erik Kaneda <erik.kaneda@intel.com>, Mattia Dongili <malattia@linux.it>, William Bader <williambader@hotmail.com>, Dominik Mierzejewski <dominik@greysector.net>
Cc: linux-acpi <linux-acpi@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi All,

Commit 6d232b29cfce ("ACPICA: Dispatcher: always generate buffer
objects for ASL create_field() operator") has dropped the
automatic conversion of small buffers into integers.

But some drivers relied on this automatic conversion, these
drivers have checks like this:

         if (object->type != ACPI_TYPE_INTEGER) {
                 pr_warn("Invalid acpi_object: expected 0x%x got 0x%x\n",
                                 ACPI_TYPE_INTEGER, object->type);
                 kfree(object);
                 return -EINVAL;
         }

This specific bit comes from the sony-laptop (platform/x86) code,
the ACPICA change has broken this code, causing systems using this
driver to hang on resume from suspend.

We have multiple bug-reports open for this already:

https://bugzilla.kernel.org/show_bug.cgi?id=207491
https://bugzilla.redhat.com/show_bug.cgi?id=1829096
https://bugzilla.redhat.com/show_bug.cgi?id=1830150

Mattia Dongili, the sony-laptop driver has already submitted
a fix for this upstream, adjusting the sony-laptop driver
to deal with the returned object type now being a BUFFER.

The goal of this email is to:

1. Make everyone involved aware of this breakage as we
may see similar breakage elsewhere.

2. Discuss if we should maybe revert the ACPICA change.

If you are reading this then 1. has been accomplished :)

Which leaves us with 2. I'm tending towards keeping the
change, since it seems the right thing to do and dealing
with the fallout. But since there is fallout we should
also at least consider reverting the ACPICA change.

So ACPI maintainers what is you take on this ?

Regards,

Hans
