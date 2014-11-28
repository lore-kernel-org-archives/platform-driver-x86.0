From: Giedrius Statkevicius <giedriuswork@gmail.com>
Subject: Re: [PATCH] platform: x86: hp_wireless: Inform the user if hp_wireless_input_setup()/add()
 fails
Date: Sat, 29 Nov 2014 01:48:31 +0200
Message-ID: <547909CF.8060907@gmail.com>
References: <1417212867-25187-1-git-send-email-giedriuswork@gmail.com> <20141128231555.GA31468@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:37927 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751312AbaK1Xtg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Nov 2014 18:49:36 -0500
In-Reply-To: <20141128231555.GA31468@pd.tnic>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 2014.11.29 01:15, Borislav Petkov wrote:
> On Sat, Nov 29, 2014 at 12:14:27AM +0200, Giedrius Statkevicius wrote:
>> In hpwl_add() there is a unused variable err to which we assign the
>> result of hp_wireless_input_setup() but we don't do anything depending
>> on the result so print out a message that informs the user if add()
>> (hp_wireless_input_setup()) fails since acpi_device_probe() doesn't
>> print anything in this case.
>>
>> Signed-off-by: Giedrius Statkevicius <giedriuswork@gmail.com>
>> ---
>>  drivers/platform/x86/hp-wireless.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/hp-wireless.c
>> index 415348f..4e4cc8b 100644
>> --- a/drivers/platform/x86/hp-wireless.c
>> +++ b/drivers/platform/x86/hp-wireless.c
>> @@ -85,6 +85,9 @@ static int hpwl_add(struct acpi_device *device)
>>  	int err;
>>  
>>  	err = hp_wireless_input_setup();
>> +	if (err)
>> +		pr_err("Failed to setup hp wireless hotkeys\n");
>> +
> 
> I don't think there's need for that. Just do:
> 
> 	return hp_wireless_input_setup();
> 
> and drop err completely.
> 
> The upper layer which calls the ->add() method should propagate the
> error properly.
Looking at other platform drivers code some add() methods do give
information to the user via pr_{err,warn,info} macros, some don't. My
first patch to deal with this just removed the err variable like you
have wrote but Darren Hart and Rafael J. Wysocki commented that maybe it
should be better to inform the user about this error. That is why
probably there was a variable for this in the first place but probably
the original author just forgot to add a pr_err().
