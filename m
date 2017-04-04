From: Santeri Toivonen <santeri.toivonen@vatsul.com>
Subject: Re: [PATCH 1/1] asus-nb-wmi: Add wapf4 quirk for the X302UA
Date: Tue, 4 Apr 2017 21:09:00 +0300
Message-ID: <de716c9f-e435-ad27-dc1a-a7b46195c87d@vatsul.com>
References: <4a7fe8c6-e790-e855-1571-24603c5ca80f@vatsul.com>
 <20170404165212.GF5936@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rs224.mailgun.us ([209.61.151.224]:39497 "EHLO rs224.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932275AbdDDSJh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2017 14:09:37 -0400
In-Reply-To: <20170404165212.GF5936@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Santeri Toivonen <santeri.toivonen@vatsul.com>
Cc: dvhart@linux.intel.com, Corentin Chary <corentin.chary@gmail.com>, jprvita@gmail.com, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, marcos.souza.org@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On 4.4.2017 19:52, Darren Hart wrote:
> On Tue, Apr 04, 2017 at 07:35:00PM +0300, Santeri Toivonen wrote:
>> Asus laptop X302UA starts up with Wi-Fi disabled,
>> without a way to enable it. Set wapf=4 to fix the problem.
>>
>> Signed-off-by: Santeri Toivonen <santeri.toivonen@vatsul.com>
>> ---
>>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-nb-wmi.c
>> b/drivers/platform/x86/asus-nb-wmi.c
>> index dea98ffb6f60..1ae58d906536 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -144,6 +144,15 @@ static const struct dmi_system_id asus_quirks[] = {
>>  	},
>>  	{
>>  		.callback = dmi_matched,
>> +		.ident = "ASUSTeK COMPUTER INC. X302UA",
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "X302UA"),
>> +		},
>> +		.driver_data = &quirk_asus_wapf4,
>> +	},
>> +	{
>> +		.callback = dmi_matched,
>>  		.ident = "ASUSTeK COMPUTER INC. X401U",
>>  		.matches = {
>>  			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>
> Hi Santeri,
>
> How are you preparing your patches? The context lines have an extra
leading
> space and fail to apply with git-am and patch.
>
> Git will create properly formatted patches using the "git
format-patch" command
> after you have committed the change to your local repository.
Alternatively you can use "diff -Nurp" directly, although that's much
more tedious. Documentation/process/submitting-patches.rst has detailed
instructions in "1) ``diff -up``".
>

It seems that some thunderbird default configurations resulted in random
spaces at line breaks. I created the patch with git format-patch command
and applied it successfully while testing.


From: Santeri Toivonen <santeri.toivonen@vatsul.com>
Subject: [PATCH] asus-nb-wmi: Add wapf4 quirk for the X302UA

Asus laptop X302UA starts up with Wi-Fi disabled,
without a way to enable it. Set wapf=4 to fix the problem.

Signed-off-by: Santeri Toivonen <santeri.toivonen@vatsul.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c
b/drivers/platform/x86/asus-nb-wmi.c
index 38f905d86f1f..0b0fde21cf5b 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -180,6 +180,15 @@ static const struct dmi_system_id asus_quirks[] = {
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
