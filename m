From: sathyanarayanan kuppuswamy
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v2 2/2] platform/x86: dell-*wmi*: Relay failed initial
 probe to dependent drivers
Date: Thu, 9 Nov 2017 14:33:13 -0800
Message-ID: <8084fc57-c15e-6287-d978-188bdb9d2793@linux.intel.com>
References: <cover.1510246939.git.mario.limonciello@dell.com>
 <2080bee9a4c98164498aa32c4f10b12bc50b183d.1510246939.git.mario.limonciello@dell.com>
 <f37a94f2-2c57-25c4-80a7-8f2d9a4e72cb@linux.intel.com>
 <a42b0ab9bb0e4a4a9e95d5f7157753f9@ausx13mpc120.AMER.DELL.COM>
Reply-To: sathyanarayanan.kuppuswamy@linux.intel.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:24043 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752588AbdKIWdS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Nov 2017 17:33:18 -0500
In-Reply-To: <a42b0ab9bb0e4a4a9e95d5f7157753f9@ausx13mpc120.AMER.DELL.COM>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com, dvhart@infradead.org, andy.shevchenko@gmail.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, pali.rohar@gmail.com

Hi,


On 11/09/2017 11:00 AM, Mario.Limonciello@dell.com wrote:
>
>> -----Original Message-----
>> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-x86-
>> owner@vger.kernel.org] On Behalf Of sathyanarayanan kuppuswamy
>> Sent: Thursday, November 9, 2017 12:51 PM
>> To: Limonciello, Mario <Mario_Limonciello@Dell.com>; dvhart@infradead.org;
>> Andy Shevchenko <andy.shevchenko@gmail.com>
>> Cc: LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
>> pali.rohar@gmail.com
>> Subject: Re: [PATCH v2 2/2] platform/x86: dell-*wmi*: Relay failed initial probe to
>> dependent drivers
>>
>> Hi,
>>
>>
>> On 11/09/2017 09:49 AM, Mario Limonciello wrote:
>>> dell-wmi and dell-smbios-wmi are dependent upon dell-wmi-descriptor
>>> finishing probe successfully to probe themselves.
>> if they are dependent, then why not control the device creation of
>> dell-wmi and dell-smbios-wmi drivers in del-wmi-descriptor probe ?
> The dependency is just in a function call that dell-wmi-descriptor provides
> information to the other drivers.
Got it. Thanks for the clarification.
>
> Each of these is a driver that binds to a GUID on the WMI bus.
> They can each be built/configured independently of one another and also
> independently bound or unbound to a GUID on the WMI bus.
>
> Since these are bus drivers, the WMI bus will control creation of devices
> when probe routines are run.
>
>>> Currently if dell-wmi-descriptor fails probing in a non-recoverable way
>>> (such as invalid header) dell-wmi and dell-smbios-wmi will continue to
>>> try to redo probing due to deferred probing.
>>>
>>> To solve this have the dependent drivers query the dell-wmi-descriptor
>>> driver whether the descriptor has been determined valid. The possible
>>> results are:
>>> -ENODEV: Descriptor GUID missing from WMI bus
>>> -EPROBE_DEFER: Descriptor not yet probed, dependent driver should wait
>>>    and use deferred probing
>>> < 0: Descriptor probed, invalid.  Dependent driver should return an
>>>    error.
>>> 0: Successful descriptor probe, dependent driver can continue
>>>
>>> Successful descriptor probe still doesn't mean that the descriptor driver
>>> is necessarily bound at the time of initialization of dependent driver.
>>> Userspace can unbind the driver, so all methods used from driver
>>> should still be verified to return success values otherwise deferred
>>> probing be used.
>>>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
>>> ---
>>>    drivers/platform/x86/dell-smbios-wmi.c     |  5 +++--
>>>    drivers/platform/x86/dell-wmi-descriptor.c | 16 ++++++++++++++++
>>>    drivers/platform/x86/dell-wmi-descriptor.h |  8 +++++++-
>>>    drivers/platform/x86/dell-wmi.c            |  6 ++++--
>>>    4 files changed, 30 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-
>> smbios-wmi.c
>>> index 35c13815b24c..ca556803c8c9 100644
>>> --- a/drivers/platform/x86/dell-smbios-wmi.c
>>> +++ b/drivers/platform/x86/dell-smbios-wmi.c
>>> @@ -148,8 +148,9 @@ static int dell_smbios_wmi_probe(struct wmi_device
>> *wdev)
>>>    	int count;
>>>    	int ret;
>>>
>>> -	if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
>>> -		return -ENODEV;
>>> +	ret = dell_wmi_get_descriptor_valid();
>>> +	if (ret)
>>> +		return ret;
>>>
>>>    	priv = devm_kzalloc(&wdev->dev, sizeof(struct wmi_smbios_priv),
>>>    			    GFP_KERNEL);
>>> diff --git a/drivers/platform/x86/dell-wmi-descriptor.c
>> b/drivers/platform/x86/dell-wmi-descriptor.c
>>> index 28ef5f37cfbf..4dfef1f53481 100644
>>> --- a/drivers/platform/x86/dell-wmi-descriptor.c
>>> +++ b/drivers/platform/x86/dell-wmi-descriptor.c
>>> @@ -21,14 +21,26 @@
>>>    #include <linux/wmi.h>
>>>    #include "dell-wmi-descriptor.h"
>>>
>>> +#define DELL_WMI_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-
>> B622A1EF5492"
>>> +
>>>    struct descriptor_priv {
>>>    	struct list_head list;
>>>    	u32 interface_version;
>>>    	u32 size;
>>>    };
>>> +static int descriptor_valid = -EPROBE_DEFER;
>>>    static LIST_HEAD(wmi_list);
>>>    static DEFINE_MUTEX(list_mutex);
>>>
>>> +int dell_wmi_get_descriptor_valid(void)
>>> +{
>>> +	if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
>>> +		return -ENODEV;
>>> +
>>> +	return descriptor_valid;
>>> +}
>>> +EXPORT_SYMBOL_GPL(dell_wmi_get_descriptor_valid);
>>> +
>>>    bool dell_wmi_get_interface_version(u32 *version)
>>>    {
>>>    	struct descriptor_priv *priv;
>>> @@ -91,6 +103,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device
>> *wdev)
>>>    	if (obj->type != ACPI_TYPE_BUFFER) {
>>>    		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
>>>    		ret = -EINVAL;
>>> +		descriptor_valid = ret;
>>>    		goto out;
>>>    	}
>>>
>>> @@ -102,6 +115,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device
>> *wdev)
>>>    			"Dell descriptor buffer has unexpected length (%d)\n",
>>>    			obj->buffer.length);
>>>    		ret = -EINVAL;
>>> +		descriptor_valid = ret;
>>>    		goto out;
>>>    	}
>>>
>>> @@ -111,8 +125,10 @@ static int dell_wmi_descriptor_probe(struct wmi_device
>> *wdev)
>>>    		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature
>> (%8ph)\n",
>>>    			buffer);
>>>    		ret = -EINVAL;
>>> +		descriptor_valid = ret;
>>>    		goto out;
>>>    	}
>>> +	descriptor_valid = 0;
>>>
>>>    	if (buffer[2] != 0 && buffer[2] != 1)
>>>    		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown
>> version (%lu)\n",
>>> diff --git a/drivers/platform/x86/dell-wmi-descriptor.h
>> b/drivers/platform/x86/dell-wmi-descriptor.h
>>> index 5f7b69c2c83a..1e8cb96ffd78 100644
>>> --- a/drivers/platform/x86/dell-wmi-descriptor.h
>>> +++ b/drivers/platform/x86/dell-wmi-descriptor.h
>>> @@ -13,7 +13,13 @@
>>>
>>>    #include <linux/wmi.h>
>>>
>>> -#define DELL_WMI_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-
>> B622A1EF5492"
>>> +/* possible return values:
>>> + *  -ENODEV: Descriptor GUID missing from WMI bus
>>> + *  -EPROBE_DEFER: probing for dell-wmi-descriptor not yet run
>>> + *  0: valid descriptor, successfully probed
>>> + *  < 0: invalid descriptor, don't probe dependent devices
>>> + */
>>> +int dell_wmi_get_descriptor_valid(void);
>>>
>>>    bool dell_wmi_get_interface_version(u32 *version);
>>>    bool dell_wmi_get_size(u32 *size);
>>> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
>>> index 54321080a30d..39d2f4518483 100644
>>> --- a/drivers/platform/x86/dell-wmi.c
>>> +++ b/drivers/platform/x86/dell-wmi.c
>>> @@ -655,9 +655,11 @@ static int dell_wmi_events_set_enabled(bool enable)
>>>    static int dell_wmi_probe(struct wmi_device *wdev)
>>>    {
>>>    	struct dell_wmi_priv *priv;
>>> +	int ret;
>>>
>>> -	if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
>>> -		return -ENODEV;
>>> +	ret = dell_wmi_get_descriptor_valid();
>>> +	if (ret)
>>> +		return ret;
>>>
>>>    	priv = devm_kzalloc(
>>>    		&wdev->dev, sizeof(struct dell_wmi_priv), GFP_KERNEL);
>> --
>> Sathyanarayanan Kuppuswamy
>> Linux kernel developer

-- 
Sathyanarayanan Kuppuswamy
Linux kernel developer
