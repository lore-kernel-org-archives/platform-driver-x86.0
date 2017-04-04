From: Santeri Toivonen <santeri.toivonen@vatsul.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Add wapf=4 quirk for Asus
 X302UA
Date: Tue, 4 Apr 2017 16:35:37 +0300
Message-ID: <01385ec9-b40c-a680-e9e2-7ab29b322056@vatsul.com>
References: <CAN88QNC4bv0JKRxzyCOjDh2pex9t1+7J9WXt2C1d6vOF6tT+eQ@mail.gmail.com>
 <20170403230540.GC17322@fury>
 <CAN88QNC1B6TyqJbNVmCD6J72zdWAJyFyjrCXrXOT=2p5FMGrEQ@mail.gmail.com>
 <1491306253.708.116.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rs224.mailgun.us ([209.61.151.224]:37658 "EHLO rs224.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752595AbdDDNfq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2017 09:35:46 -0400
In-Reply-To: <1491306253.708.116.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>
Cc: Santeri Toivonen <santeri.toivonen@vatsul.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org



On 4.4.2017 14:44, Andy Shevchenko wrote:
> On Tue, 2017-04-04 at 13:14 +0300, Jala - wrote:
>> The issue should be corrected in the following.
>>
>
> You need to add your Signed-off-by line here with your Real Name.
>
> Usually you may achieve this by passing -s when do git commit
>
> Example:
> % git commit -a -s
>
> Before doing this you need to configure your credentials in global or
> local configuration file:
>
> % git config --global user.name "Real Name"
> % git config --global user.email "real.name@domain.com"
>
>
>> ---
>>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-nb-wmi.c
>> b/drivers/platform/x86/asus-nb-wmi.c
>> index dea98ffb6f60..1ae58d906536 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -144,6 +144,15 @@ static const struct dmi_system_id asus_quirks[] =
>> {
>>   },
>>   {
>>   .callback = dmi_matched,
>> + .ident = "ASUSTeK COMPUTER INC. X302UA",
>> + .matches = {
>> + DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> + DMI_MATCH(DMI_PRODUCT_NAME, "X302UA"),
>> + },
>> + .driver_data = &quirk_asus_wapf4,
>> + },
>> + {
>> + .callback = dmi_matched,
>
> Now here.
> As Darren already said to you you need to properly indent strings like
> 	.matches = {
> 		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> and alike.
>
> Looking closer to the mail I would suggest to check your mail client and
> gateway that they do not mangle the message body.
>
> And, if you are doing this manually, better to use special tool, i.e.
> git-send-email instead.
>
>>   .ident = "ASUSTeK COMPUTER INC. X401U",
>>   .matches = {
>>   DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>

There were indeed some issues wit hthe mail client ruining the 
formatting which should finally be fixed in the following:

Signed-off-by: Santeri Toivonen <santeri.toivonen@vatsul.com>
---
  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
  1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c 
b/drivers/platform/x86/asus-nb-wmi.c
index dea98ffb6f60..1ae58d906536 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -144,6 +144,15 @@ static const struct dmi_system_id asus_quirks[] = {
  	},
  	{
  		.callback = dmi_matched,
+		.ident = "ASUSTeK COMPUTER INC. X302UA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "X302UA"),
+		},
+		.driver_data = &quirk_asus_wapf4,
+	},
+	{
+		.callback = dmi_matched,
  		.ident = "ASUSTeK COMPUTER INC. X401U",
  		.matches = {
  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.11.0.windows.3
