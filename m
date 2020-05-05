From: Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: 5.6 regression caused by "ACPICA: Dispatcher: always generate
 buffer objects for ASL create_field() operator"
Date: Tue, 5 May 2020 15:50:15 +0200
Message-ID: <11795a75-70de-5fcc-878f-14a0381947ea@gmail.com>
References: <49f20a91-9362-6249-d413-1461258d56a9@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <49f20a91-9362-6249-d413-1461258d56a9@redhat.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Bob Moore <robert.moore@intel.com>, Erik Kaneda <erik.kaneda@intel.com>, Mattia Dongili <malattia@linux.it>, William Bader <williambader@hotmail.com>, Dominik Mierzejewski <dominik@greysector.net>
Cc: linux-acpi <linux-acpi@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 5/5/20 2:55 PM, Hans de Goede wrote:
> Hi All,
> 
> Commit 6d232b29cfce ("ACPICA: Dispatcher: always generate buffer
> objects for ASL create_field() operator") has dropped the
> automatic conversion of small buffers into integers.
> 
> But some drivers relied on this automatic conversion, these
> drivers have checks like this:
> 
>          if (object->type != ACPI_TYPE_INTEGER) {
>                  pr_warn("Invalid acpi_object: expected 0x%x got 0x%x\n",
>                                  ACPI_TYPE_INTEGER, object->type);
>                  kfree(object);
>                  return -EINVAL;
>          }
> 
> This specific bit comes from the sony-laptop (platform/x86) code,
> the ACPICA change has broken this code, causing systems using this
> driver to hang on resume from suspend.
> 
> We have multiple bug-reports open for this already:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=207491
> https://bugzilla.redhat.com/show_bug.cgi?id=1829096
> https://bugzilla.redhat.com/show_bug.cgi?id=1830150
> 
> Mattia Dongili, the sony-laptop driver has already submitted
> a fix for this upstream, adjusting the sony-laptop driver
> to deal with the returned object type now being a BUFFER.
> 
> The goal of this email is to:
> 
> 1. Make everyone involved aware of this breakage as we
> may see similar breakage elsewhere.
> 
> 2. Discuss if we should maybe revert the ACPICA change.
> 
> If you are reading this then 1. has been accomplished :)
> 
> Which leaves us with 2. I'm tending towards keeping the
> change, since it seems the right thing to do and dealing
> with the fallout. But since there is fallout we should
> also at least consider reverting the ACPICA change.
> 
> So ACPI maintainers what is you take on this ?
> 
> Regards,
> 
> Hans

Hi,

I'd like to advise against reverting the commit. Quite honestly, I don't
think reverting the commit is a good idea. This will break things for
devices that assume Microsoft-like AML interpreter behavior _inside_ the
DSDT. Such as the MS Surface devices for example, which, as stated in the
commit message, depend on the type being Buffer via a check on
ObjectType(...). There is no fix for those devices other than a)
accepting MS behavior in ACPICA, b) introducing a quirk in ACPICA which
switches between behaviors on a device basis, or c) patching the DSDT of
those devices specifically for Linux.

I'd also argue that since this is MS behavior, this is the behavior that
almost all consumer electronics devices with ACPI will expect. Case in
point, the DSDT of one of the affected Sony laptops, which contains the
following code:

         CreateField (SNBF, Zero, 0x20, SNBD)
         CreateWordField (SNBF, 0x02, CPW0)
         CreateWordField (SNBF, 0x04, CPW1)
         CreateWordField (SNBF, Zero, RCW0)
         CreateWordField (SNBF, 0x02, RCW1)

They explicitly create a Buffer field of 32 bits via CreateField and not
a 32 bit Integer field via CreateDWordField. I'd argue that if they
wanted this field to be an Integer, CreateDWordField would be the
straight-forward approach.

Unfortunately, I also don't see a way to identify all affected calls to
ACPI functions automatically or easily, as this requires to look at the
DSDTs and the code behind those calls. If you have DSDTs, here's a way
to identify if that particular DSDT/driver combo is affected:

If a call to an ACPI function expects an Integer and the ACPI function
returns a field created with CreateField(...) and the field is smaller
than 64 bits (on 64bit machines), then this call is affected.

The only semi-reasonable way, as far as I can see, to identify this on a
broad scale is to get this information out to the respective maintainers
of drivers with apci_evaluate_{integer,object,dsm,..?} calls and ask them
to check those calls against DSDTs. Also maybe help them by introducing a
function which does Buffer-to-Integer conversion.

Regards,
Maximilian
