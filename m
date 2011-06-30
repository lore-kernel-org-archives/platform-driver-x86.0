From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH 1/3] ideapad: define cfg bits and create sysfs node for
 cfg
Date: Thu, 30 Jun 2011 18:59:56 +0800
Message-ID: <4E0C572C.8000409@canonical.com>
References: <1308729781-2590-1-git-send-email-ike.pan@canonical.com> <1308729943-2624-1-git-send-email-ike.pan@canonical.com> <20110622193523.GA8861@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:54384 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751470Ab1F3K76 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Jun 2011 06:59:58 -0400
In-Reply-To: <20110622193523.GA8861@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On 06/23/2011 03:35 AM, Matthew Garrett wrote:
> On Wed, Jun 22, 2011 at 04:05:43PM +0800, Ike Panhc wrote:
>>  static int __devinit ideapad_acpi_add(struct acpi_device *adevice)
>>  {
>> -	int ret, i, cfg;
>> +	int ret, i;
>> +	unsigned long cfg;
> 
> You change this to an unsigned long, but you cast it to an int in 
> several places. Is that just to avoid casting to a long here?
> 
>> -		if (test_bit(ideapad_rfk_data[i].cfgbit, (unsigned long *)&cfg))
>> +		if (test_bit(ideapad_rfk_data[i].cfgbit, &cfg))
> 
> I think it seems neater the other way around, but don't have terribly 
> strong opinions.
> 

I read again how cfg is used. They are 2 test_bit, one sprintf and
read_method_int.

test_bit is the major reason of changing from int to unsigned long. I will
change the format string in sprintf from %X to %lX. After the change there
will be only one cast left.
