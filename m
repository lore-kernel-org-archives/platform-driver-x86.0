From: Maximilian Luz <luzmaximilian@gmail.com>
Subject: Re: [PATCH] platform/x86: Add Driver to set up lid GPEs on MS Surface
 device
Date: Tue, 8 Sep 2020 22:19:27 +0200
Message-ID: <d1d3b1bb-1d7b-ae8d-fbe4-23f995df47fb@gmail.com>
References: <20200908171934.1661509-1-luzmaximilian@gmail.com>
 <CAHp75VevrwKaba_FsZj-nPqJGR9fkmFPzvdCew0wCqF_L6QLbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <CAHp75VevrwKaba_FsZj-nPqJGR9fkmFPzvdCew0wCqF_L6QLbA@mail.gmail.com>
Content-Language: en-US
Sender: linux-acpi-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Gayatri Kammela <gayatri.kammela@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 9/8/20 8:40 PM, Andy Shevchenko wrote:
> On Tue, Sep 8, 2020 at 8:20 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:

...

>> +       .gpe_number = 0x17,
>> +       .gpe_number = 0x4D,
>> +       .gpe_number = 0x4F,
>> +       .gpe_number = 0x57,
> 
>  From where these numbers come from? Can we get them from firmware (ACPI)?

Yes, they are obtained from ACPI/the DSDT. Specifically from the name of
the GPE handler notifying the lid device. See [1] for a repo full of
Surface ACPI dumps (source for this). I'll add a comment pointing this out
in v2.

[1]: https://github.com/linux-surface/acpidumps

...

>> +static int surface_gpe_probe(struct platform_device *pdev)
>> +{
>> +       const struct surface_lid_device *lid;
>> +       int status;
>> +
> 
>> +       lid = dev_get_platdata(&pdev->dev);
>> +       if (!lid)
>> +               return -ENODEV;
> 
> Can we use software nodes?

As far as I can tell this would work via fwnode_create_software_node /
fwnode_remove_software_node and device properties? I don't seem to find
much documentation on this (there doesn't seem to be an entry for
software nodes in the official docs?), but I think I should be able to
make this work.

>> +       status = acpi_mark_gpe_for_wake(NULL, lid->gpe_number);
>> +       if (status) {
>> +               dev_err(&pdev->dev, "failed to mark GPE for wake: %d\n", status);
>> +               return -EINVAL;
>> +       }
>> +
> 
>> +       status = acpi_enable_gpe(NULL, lid->gpe_number);
> 
> Did I miss anything or all calls of enable / disable GPE are using
> NULL as a first parameter? What the point in such case?

As far as I can tell, some of the more generic uses have a non-NULL
gpe_device parameter (acpi/device_pm.c, acpi/wakeup.c) and NULL just
means index-0/main device? Not an expert on that though, so probably
just ignore me here and let the ACPI guys answer this.

...

>> +MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfacePro:*");
>> +MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurfacePro4:*");
> 
> Can simply
> 
> MODULE_ALIAS("dmi:*:svnMicrosoftCorporation:pnSurface*:*");
> 
> work?

Depends on your preference, really. That would also auto-load the module
on Surface Pro 3 and earlier devices (just won't do anything on those).
So it's a trade-off between unnecessary loading of the module and
maintainability/readability. Let me know what you prefer and I'll switch
to that.

Style and other issues are noted, I'll fix them for v2.

Regards,
Max
