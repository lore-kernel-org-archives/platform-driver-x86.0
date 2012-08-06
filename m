From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] dell-laptop: Add 6 machines to touchpad led quirk
Date: Mon, 6 Aug 2012 09:49:37 +0800
Message-ID: <CAMz9Wg9Lh0_fwT-A7pYRiTFUo=Do0+bb2B=WQJwZSqWe=veQfA@mail.gmail.com>
References: <1342168797-26080-1-git-send-email-acelan.kao@canonical.com>
	<501BD59C.5040007@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41510 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755286Ab2HFBti (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Aug 2012 21:49:38 -0400
Received: by pbbrr13 with SMTP id rr13so1758586pbb.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Aug 2012 18:49:37 -0700 (PDT)
In-Reply-To: <501BD59C.5040007@igalia.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

Dear Carlos,

Yes, you are right.
I copy/paste the wrong word all over the patch.
I just submitted a patch for it, thanks for your report.

Best regards,
AceLan Kao.

2012/8/3 Carlos Alberto Lopez Perez <clopez@igalia.com>:
> On 13/07/12 10:39, AceLan Kao wrote:
>> Add the following machines into quirk,
>> Isnpiron 5420, Isnpiron 5520, Isnpiron 5720,
>> Isnpiron 7420, Isnpiron 7520, Isnpiron 7720
>>
>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>> ---
>>  drivers/platform/x86/dell-laptop.c |   54 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
>>
>> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
>> index 5f78aac..4e96e8c 100644
>> --- a/drivers/platform/x86/dell-laptop.c
>> +++ b/drivers/platform/x86/dell-laptop.c
>> @@ -206,6 +206,60 @@ static struct dmi_system_id __devinitdata dell_quirks[] = {
>>               },
>>               .driver_data = &quirk_dell_vostro_v130,
>>       },
>> +     {
>> +             .callback = dmi_matched,
>> +             .ident = "Dell Inspiron 5420",
>> +             .matches = {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 5420"),
>> +             },
>> +             .driver_data = &quirk_dell_vostro_v130,
>> +     },
>> +     {
>> +             .callback = dmi_matched,
>> +             .ident = "Dell Inspiron 5520",
>> +             .matches = {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 5520"),
>> +             },
>> +             .driver_data = &quirk_dell_vostro_v130,
>> +     },
>> +     {
>> +             .callback = dmi_matched,
>> +             .ident = "Dell Inspiron 5720",
>> +             .matches = {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 5720"),
>> +             },
>> +             .driver_data = &quirk_dell_vostro_v130,
>> +     },
>> +     {
>> +             .callback = dmi_matched,
>> +             .ident = "Dell Inspiron 7420",
>> +             .matches = {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 7420"),
>> +             },
>> +             .driver_data = &quirk_dell_vostro_v130,
>> +     },
>> +     {
>> +             .callback = dmi_matched,
>> +             .ident = "Dell Inspiron 7520",
>> +             .matches = {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 7520"),
>> +             },
>> +             .driver_data = &quirk_dell_vostro_v130,
>> +     },
>> +     {
>> +             .callback = dmi_matched,
>> +             .ident = "Dell Inspiron 7720",
>> +             .matches = {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "Isnpiron 7720"),
>> +             },
>> +             .driver_data = &quirk_dell_vostro_v130,
>> +     },
>>       { }
>>  };
>>
>
> Perhaps this needs a sed "s/Isnpiron/Inspiron/g" ???
>



-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
