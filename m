From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] platform/x86: silead_dmi: Add touchscreen info for
 PoV mobii wintab p800w
Date: Fri, 16 Jun 2017 14:34:41 +0200
Message-ID: <424f1f8f-6ca1-9923-c904-d1a55465d84c@redhat.com>
References: <20170615064832.4148-1-hdegoede@redhat.com>
 <20170615165311.GF22450@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:1702 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751909AbdFPMen (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jun 2017 08:34:43 -0400
In-Reply-To: <20170615165311.GF22450@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 15-06-17 18:53, Darren Hart wrote:
> On Thu, Jun 15, 2017 at 08:48:31AM +0200, Hans de Goede wrote:
>> Add touchscreen info for the Point of View mobii wintab p800w tablet.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/platform/x86/silead_dmi.c | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
> 
> ...
> 
>> +		/* Point of View mobii wintab p800w */
>> +		.driver_data = (void *)&pov_mobii_wintab_p800w_data,
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
>> +			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
>> +			DMI_MATCH(DMI_BIOS_VERSION, "3BAIR1013"),
>> +			/* Above matches are too generic, add bios-date match */
>> +			DMI_MATCH(DMI_BIOS_DATE, "08/22/2014"),
> 
> This is the first time I've seen a BIOS date match used to determine hardware
> features. DMI matching is a (necessary) hack to begin with (the vendors should
> be providing this data via ACPI _DSD anyway) but a date match means we would
> need a kernel patch every time one of these tablets gets a BIOS update...

I don't think this specific model is still being produced and I've never
seen a vendor issue a BIOS update to one of these cheap tablets. The Asus
and Dell, etc. Bay and Cherry Trail devices get BIOS updates (and have proper
DMI strings), the cheap OEM models are more a case of ship it and never look
back. So for this specific entry I'm not worried about BIOS updates.

> With words like "Aptio CRB" it's clear the vendor isn't doing their job and just
> using unmodified reference code. The problem with this of course is that the
> vendor is not providing a way to identify this hardware.

Yes, I'm just as unhappy with this as you are, the alternative is users with
such devices not having a working touchscreen. So my vote goes to live with
the ugliness (added to the ugliness of needing the table at all), but I
understand your reluctance towards this.

Regards,

Hans
