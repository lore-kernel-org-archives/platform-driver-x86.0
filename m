From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: silead_dmi: Add touchscreen info for
 I.T.Works TW891 2-in-1
Date: Fri, 7 Jul 2017 13:03:07 +0200
Message-ID: <f04d821a-866f-0213-e9e8-b83da6b136a3@redhat.com>
References: <20170701101522.13646-1-hdegoede@redhat.com>
 <20170706223915.GA19728@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:31553 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751034AbdGGLDK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Jul 2017 07:03:10 -0400
In-Reply-To: <20170706223915.GA19728@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 07-07-17 00:39, Darren Hart wrote:
> On Sat, Jul 01, 2017 at 12:15:22PM +0200, Hans de Goede wrote:
>> Add touchscreen info for I.T.Works TW891 2-in-1.
>>
> 
> ...
> 
>> +		/* I.T.Works TW891 */
>> +		.driver_data = (void *)&itworks_tw891_data,
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
> 
> *groan* you're trolling me now right? ;-)

Nope, sorry, this seemed better then matching on a single
string. FWIW I did an internet search for TW891 and there are
no other devices named TW891.

>> +			DMI_MATCH(DMI_PRODUCT_NAME, "TW891"),
> 
> I presume there are no other identifying strings?

Correct if there was something better I would have used it.

> Pushed to testing.

Thank you.

Regards,

Hans
