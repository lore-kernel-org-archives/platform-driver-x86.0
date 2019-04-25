From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: Re: [PATCH v3 08/11] platform/x86: asus-wmi: Enhance detection of
 thermal data
Date: Thu, 25 Apr 2019 20:51:54 +0200
Message-ID: <a5d5f899-d218-b581-b187-f783759b6afa@gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
 <7595c4f0-3dbb-2fe5-4daf-4b9a266f67d7@gmail.com>
 <3C3E65E75D9910479323816378A812E7414CDE12@BGSMSX104.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3C3E65E75D9910479323816378A812E7414CDE12@BGSMSX104.gar.corp.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Pawnikar, Sumeet R" <sumeet.r.pawnikar@intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, "acpi4asus-user@lists.sourceforge.net" <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 24.04.19 20:25, Pawnikar, Sumeet R wrote:
>> +	/*
>> +	 * If the temperature value in deci-Kelvin is near the absolute
>> +	 * zero temperature, something is clearly wrong.
>> +	 */
>> +	if (!value || value == 1)
>> +		return 0;
> Do you still need to return 0 in case of wrong/failure case ? 
> Shouldn't you return error here ? 

Yes, I think 0 is right there, it's not an error condition in the check
itself (such as IO or memory error). The function returns two values: check
result in asus->asus_hwmon_thermal_available and error code.

This is still a successful negative result. The 0 or 1 (as added in this
patch) there merely indicates that the temperature measurement is not
available this way. It is safe to assume that no device that does provide
temperature will return 0.1 K. The temperature measurement is not critical
for driver operation so the driver proceeds without it.

One could return ENODEV when the check result is negative, but that would
just move the actual check and assignment further to asus_wmi_fan_init.

This is how it might look like in DSDT in this case:
Method (TMPR, 0, NotSerialized)
{
    Return (One)
}
..
If ((IIA0 == 0x00110011))
{
    Return ((TMPR () & 0xFFFF))
}

This is indeed the right method ID but it's nothing there.

Regards,
Yurii
