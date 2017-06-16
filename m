From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: silead_dmi: Add touchscreen info for
 PoV mobii wintab p800w
Date: Fri, 16 Jun 2017 15:44:45 +0300
Message-ID: <CAHp75VeMN3eeQPbxive1JO2iGKr4g0g5RByoRTpZCpCjYvAb3A@mail.gmail.com>
References: <20170615064832.4148-1-hdegoede@redhat.com> <20170615165311.GF22450@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:36216 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752649AbdFPMoq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jun 2017 08:44:46 -0400
In-Reply-To: <20170615165311.GF22450@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jun 15, 2017 at 7:53 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Thu, Jun 15, 2017 at 08:48:31AM +0200, Hans de Goede wrote:

>> +             /* Point of View mobii wintab p800w */
>> +             .driver_data = (void *)&pov_mobii_wintab_p800w_data,
>> +             .matches = {
>> +                     DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
>> +                     DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
>> +                     DMI_MATCH(DMI_BIOS_VERSION, "3BAIR1013"),
>> +                     /* Above matches are too generic, add bios-date match */
>> +                     DMI_MATCH(DMI_BIOS_DATE, "08/22/2014"),
>
> This is the first time I've seen a BIOS date match used to determine hardware
> features. DMI matching is a (necessary) hack to begin with (the vendors should
> be providing this data via ACPI _DSD anyway) but a date match means we would
> need a kernel patch every time one of these tablets gets a BIOS update...
>
> With words like "Aptio CRB" it's clear the vendor isn't doing their job and just
> using unmodified reference code. The problem with this of course is that the
> vendor is not providing a way to identify this hardware.
>
> Andy, I'd appreciate your thoughts on this... I'm leaning towards not accepting
> bios date (or indeed, BIOS version) as a way to identify a platform.

The question is what is the anticipated amount of affected devices
with BIOS date included and otherwise?

If Hans believes that there will be no update for some devices, while
there are devices with the same DMI strings, but different date and
_fixed_ issue, I think we have no other choice for now.
Also can we use some other strings to distinguish group of devices
which are affected?

In pinctrl-cherryview.c we faced same issue, though for now there all
platforms are affected (first approach was to distinguish with BIOS
date) and we decide to go with black and white lists (white is empty
for now and will be created whenever we will have an update).

-- 
With Best Regards,
Andy Shevchenko
