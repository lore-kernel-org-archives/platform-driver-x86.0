From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Mark expected switch
 fall-throughs
Date: Tue, 19 Feb 2019 10:33:53 -0600
Message-ID: <4d97e602-6de8-4b4f-86a8-39a835c1c699@embeddedor.com>
References: <20180705203807.GA10327@embeddedor.com>
 <20181129001533.GA2468@fedora.eng.vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129001533.GA2468@fedora.eng.vmware.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On 11/28/18 6:15 PM, Darren Hart wrote:
> On Thu, Jul 05, 2018 at 03:38:07PM -0500, Gustavo A. R. Silva wrote:
>> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
>> where we are expecting to fall through.
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> 
> I've applied this patch, but not the acer or sony fall through patches
> due to the pending questions there. Happy to revisit those as needed,
> but closing these out of the patch queue.
> 

Thanks, Darren.

I'll send separate patches for those that are still pending.  Hopefully,
I'll get some feedback this time.

--
Gustavo

>> ---
>>  drivers/platform/x86/dell-laptop.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
>> index f1fa861..1938f11 100644
>> --- a/drivers/platform/x86/dell-laptop.c
>> +++ b/drivers/platform/x86/dell-laptop.c
>> @@ -1565,8 +1565,10 @@ static ssize_t kbd_led_timeout_store(struct device *dev,
>>  		switch (unit) {
>>  		case KBD_TIMEOUT_DAYS:
>>  			value *= 24;
>> +			/* fall through */
>>  		case KBD_TIMEOUT_HOURS:
>>  			value *= 60;
>> +			/* fall through */
>>  		case KBD_TIMEOUT_MINUTES:
>>  			value *= 60;
>>  			unit = KBD_TIMEOUT_SECONDS;
>> -- 
>> 2.7.4
>>
>>
> 
