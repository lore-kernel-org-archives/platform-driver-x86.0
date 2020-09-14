From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] Introduce support for Systems Management Driver over WMI
 for Dell Systems
Date: Mon, 14 Sep 2020 11:53:17 +0200
Message-ID: <71aebcf6-ecc5-72ce-e230-8bd25a294de8@redhat.com>
References: <20200730143122.10237-1-divya_bharathi@dell.com>
 <9b0e8473-1582-eb02-70f4-0f25d09c720c@redhat.com>
 <CAHp75Vfxgf4ttL931M08WqiWVELtZQotHvikDbmrTGkOyd=ZtQ@mail.gmail.com>
 <DM6PR19MB2636225813D7359A210D8DCCFA2C0@DM6PR19MB2636.namprd19.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DM6PR19MB2636225813D7359A210D8DCCFA2C0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Limonciello, Mario" <Mario.Limonciello@dell.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Divya Bharathi <divya27392@gmail.com>, Darren Hart <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "Bharathi, Divya" <Divya.Bharathi@Dell.com>, "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 9/3/20 4:27 PM, Limonciello, Mario wrote:

<snip>

>>>> +     /* look up if user set a password for the requests */
>>>> +     current_password = get_current_password("Admin");
>>>> +     if (!current_password)
>>>> +             return -ENODEV;
>>>
>>> Can we instead of passing "Admin" and "System" to this function
>>> just have 2 separate get_current_admin_password and
>> get_current_system_password
>>> helpers and then drop the error handling ?
> 
> The error handling for -ENODEV is actually important in case a WMI driver
> was unbound.

I see and checking for that is good, but then please make it
explicit, rather then hiding it like this. As is the code suggests
to someone reading the code that the problem is a missing password not
the driver being unbound.

As I mentioned before, since the code clearly assume that
only 1 instance of each WMI GUID is present, it should move to
storing all its data into a shared global struct. Protected
by a single shared global mutex.

And then functions exposed through sysfs attributes can do:

	mutex_lock(&dell_wmi_bios_attr_mutex);

	if (!dell_wmi_bios_attr_data.bios_attr_wdev ||
	    !dell_wmi_bios_attr_data.password_attr_wdev) {
		mutex_unlock(&call_mutex);
		return -ENODEV;
	}

And the password data can simply be directly read from
dell_wmi_bios_attr_data without needing a helper for it at all.

>>>> +
>>>> +     /* password is set */
>>>> +     if (strlen(current_password) > 0)
>>>> +             security_area_size = (sizeof(u32) * 2) +
>> strlen(current_password) +
>>>> +                                     strlen(current_password) % 2;
>>>> +     /* password not set */
>>>> +     else
>>>> +             security_area_size = sizeof(u32) * 2;
>>>
>>> Since you are using more then 1 line here please use {} around the state-
>> ments,
>>> also please put the /* password not set */ after the else:
>>>
>>>                  ...
>>>          } else { /* password not set */
>>>                  ...
>>>
>>>> +     string_area_size = (strlen(a_name) + strlen(a_value))*2;
>>>> +     buffer_size = security_area_size + string_area_size + sizeof(u16) *
>> 2;
>>>> +
>>>> +     buffer = kzalloc(buffer_size, GFP_KERNEL);
>>
>> Actually above looks like home grown kasprintf() implementation.
> 
> I don't think so, sprintf isn't used at all here.  It's a calculation to determine
> the size of the buffer to use.

Ack, this is different because it concats a UTF16 string together with some
other data into the new buf.

Regards,

Hans
