From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3] platform/x86/asus-nb-wmi.c: Add X45U quirk
Date: Tue, 15 Nov 2016 00:05:30 +0200
Message-ID: <CAHp75Veu5EGVEP=xPoeqDAbzzQ5bhP+jpCBTRbRhAxda=whWLA@mail.gmail.com>
References: <1478563352-2524-1-git-send-email-marcos.souza.org@gmail.com> <20161114093232.GA24343@xfiles>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161114093232.GA24343@xfiles>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 14, 2016 at 11:32 AM, Marcos Paulo de Souza
<marcos.souza.org@gmail.com> wrote:
> ping?

Please, don't do empty pings especially in top posting.
I will look at this as soon as I can.

>
> On Mon, Nov 07, 2016 at 10:02:32PM -0200, Marcos Paulo de Souza wrote:
>> Without this patch, the Asus X45U wireless card can't be turned
>> on (hard-blocked), but after a suspend/resume it just starts working.
>>
>> Following this bug report[1], there are other cases like this one, but
>> this Asus is the only model that I can test.
>>
>> [1] https://ubuntuforums.org/showthread.php?t=2181558
>>
>> Cc: stable@vger.kernel.org # 4.4.x-
>> Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
>>
>> ---
>> v2 -> v3:
>>  Add stable version in the CC line of stable email address
>> v1 -> v2:
>>  Add stable copy and specify the stable version to apply this patch
>>
>>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>> index 26e4cbc..6032b70 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -175,6 +175,15 @@ static const struct dmi_system_id asus_quirks[] = {
>>       },
>>       {
>>               .callback = dmi_matched,
>> +             .ident = "ASUSTeK COMPUTER INC. X45U",
>> +             .matches = {
>> +                     DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +                     DMI_MATCH(DMI_PRODUCT_NAME, "X45U"),
>> +             },
>> +             .driver_data = &quirk_asus_wapf4,
>> +     },
>> +     {
>> +             .callback = dmi_matched,
>>               .ident = "ASUSTeK COMPUTER INC. X456UA",
>>               .matches = {
>>                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> --
>> 2.7.4



-- 
With Best Regards,
Andy Shevchenko
