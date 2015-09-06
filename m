From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] asus-nb-wmi: Add wapf=4 quirk for X456UA/X456UF
Date: Sun, 6 Sep 2015 10:40:05 +0200
Message-ID: <CAHR064ihJRzCCqOTn4fdhZSUae4Qfwed0fHUUfU56CDduBUGPQ@mail.gmail.com>
References: <1441231834-12873-1-git-send-email-drake@endlessm.com>
	<20150903225452.GA60159@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f182.google.com ([209.85.217.182]:33570 "EHLO
	mail-lb0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751157AbbIFIkI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 6 Sep 2015 04:40:08 -0400
Received: by lbcjc2 with SMTP id jc2so27258078lbc.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Sep 2015 01:40:06 -0700 (PDT)
In-Reply-To: <20150903225452.GA60159@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Daniel Drake <drake@endlessm.com>, AceLan Kao <acelan.kao@canonical.com>, carlo@endlessm.com, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Looks good.

Acked-by: Corentin Chary <corentin.chary@gmail.com>

I'd like to get somebody from Asus help us guess these values instead
of just hard-coding them.. Unfortunately I have no contact with them
anymore.

On Fri, Sep 4, 2015 at 12:54 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Sep 02, 2015 at 04:10:34PM -0600, Daniel Drake wrote:
>> These laptops boot with wifi as hard-blocked, with no obvious way to
>> enable it. Using a quirk to set wapf=4 solves the problem.
>>
>> Signed-off-by: Daniel Drake <drake@endlessm.com>
>
> Looks good.
>
> Corentin, any concerns?
>
>> ---
>>  drivers/platform/x86/asus-nb-wmi.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>> index abdaed3..131fee2 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -128,6 +128,24 @@ static const struct dmi_system_id asus_quirks[] = {
>>       },
>>       {
>>               .callback = dmi_matched,
>> +             .ident = "ASUSTeK COMPUTER INC. X456UA",
>> +             .matches = {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "X456UA"),
>> +             },
>> +             .driver_data = &quirk_asus_wapf4,
>> +     },
>> +     {
>> +             .callback = dmi_matched,
>> +             .ident = "ASUSTeK COMPUTER INC. X456UF",
>> +             .matches = {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "X456UF"),
>> +             },
>> +             .driver_data = &quirk_asus_wapf4,
>> +     },
>> +     {
>> +             .callback = dmi_matched,
>>               .ident = "ASUSTeK COMPUTER INC. X501U",
>>               .matches = {
>>                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> --
>> 2.1.4
>>
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center



-- 
Corentin Chary
http://xf.iksaif.net
