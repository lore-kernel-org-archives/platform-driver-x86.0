From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Handle return error form
 dell_get_intensity.
Date: Thu, 9 Mar 2017 11:13:15 +0530
Message-ID: <4b91fac9-9c76-24c0-47a3-28a589760725@gmail.com>
References: <1488975747-32184-1-git-send-email-arvind.yadav.cs@gmail.com>
 <20170308125406.GB30539@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:35285 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750784AbdCIFnr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2017 00:43:47 -0500
In-Reply-To: <20170308125406.GB30539@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: mjg59@srcf.ucam.org, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,
Yes, you are right. I will handle return error correctly.

Thanks
-Arvind

On Wednesday 08 March 2017 06:24 PM, Pali Rohár wrote:
> Hi!
>
> On Wednesday 08 March 2017 17:52:27 Arvind Yadav wrote:
>> Here, dell_get_intensity can return an error.
> Right. That is truth and we should check for errors.
>
>> So we can assgine props.brightness as max_brightness.
> But why to max_brightness? Seems that this is incorrect handling of
> error too...
>
>> This change is done using Coccinelle.
>>
>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
>> ---
>>   drivers/platform/x86/dell-laptop.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
>> index f57dd28..0891de3 100644
>> --- a/drivers/platform/x86/dell-laptop.c
>> +++ b/drivers/platform/x86/dell-laptop.c
>> @@ -2053,6 +2053,9 @@ static int __init dell_init(void)
>>   
>>   		dell_backlight_device->props.brightness =
>>   			dell_get_intensity(dell_backlight_device);
>> +		if (dell_backlight_device->props.brightness < 0) {
>> +			dell_backlight_device->props.brightness = props.max_brightness;
>> +		}
>>   		backlight_update_status(dell_backlight_device);
>>   	}
>>   
