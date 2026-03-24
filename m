Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCDB3DBD4E;
	Tue, 24 Mar 2026 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358831; cv=none; b=jdllx1klRGEZdjC/cKY/S1ktsopoa4S5wXTmeiS+C0iGhQ3FGs9tmpxBCux/hXRimpOphBs+mrG7GVCal0Zaz7AhZHD9GhyVUuiJvRBeBm3flkVduF3Zw3Tub7S+nEIF/pSSwtISTk5GgHNKGI3q4oNI2oDNHL8lxfhdAQpR0VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358831; c=relaxed/simple;
	bh=3L9p5e9nvd+qrtL8f5+ZZhP+PDfq7Wd/FRDkf/kcYvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+tLDo9xlgEfLgn6r0wNoSiGS20ncWj+tSmOLSEaoEu3EryEmWwzuVsQFgnK++B35OUNTkD2Bszl3XppT4Oe56ovzmSf1OynX3SGQtdVg+8QNPOzmADe0rGWQASgRVWVqcAOPfDTBXepdRVp2O6XrKVNLJym95EZaqPXx853WaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=k2eT5SKj; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="k2eT5SKj"
Received: from [192.168.178.24] (i5C75F50F.versanet.de [92.117.245.15])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 4E5642FC0217;
	Tue, 24 Mar 2026 14:18:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1774358282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4HpAyun62203W2OTUMnNtrWECMcsqZ1Dwl8cY4Qt9gM=;
	b=k2eT5SKjDIcXW0EJCGgDTXw/xiofa3zV4ZKKK+sAEI+f1DnemJkcr6qhzcm+yoCSkyr5P5
	doTOySXULt7Cf6qHtXoZ7xwaogmTeJm1W8gibZ3Gzw21ERzmCVEIwhqQtN7TDNrOUhpP8l
	hTKclQtIUMcGf7T1HTZQ/OI9iL1SVNo=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <118aaa63-1050-4a98-88e1-a824c4e01315@tuxedocomputers.com>
Date: Tue, 24 Mar 2026 14:18:01 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] platform/x86: uniwill-laptop: Implement USB-C
 power priority setting
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260312192705.76576-1-wse@tuxedocomputers.com>
 <20260312192705.76576-3-wse@tuxedocomputers.com>
 <fc314dee-c341-8ff3-794c-2edecefc079a@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <fc314dee-c341-8ff3-794c-2edecefc079a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ilpo,

Am 24.03.26 um 14:08 schrieb Ilpo Järvinen:
> On Thu, 12 Mar 2026, Werner Sembach wrote:
>
>> On some devices Uniwill offers the option to set the USB-C port to
>> prioritise charging or performance. This patch exposes this setting to the
>> userspace via sysfs for all TUXEDO devices supporting it.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 145 +++++++++++++++++++-
>>   1 file changed, 138 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 048b265bff374..22ae5fccd6a06 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -266,8 +266,8 @@
>>   #define BATTERY_CHARGE_FULL_OVER_24H	BIT(3)
>>   #define BATTERY_ERM_STATUS_REACHED	BIT(4)
>>   
>> -#define EC_ADDR_CHARGE_PRIO		0x07CC
>> -#define CHARGING_PERFORMANCE		BIT(7)
>> +#define EC_ADDR_USB_C_POWER_PRIORITY	0x07CC
>> +#define USB_C_POWER_PRIORITY		BIT(7)
>>   
>>   /* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
>>   #define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
>> @@ -324,6 +324,12 @@
>>   #define UNIWILL_FEATURE_PRIMARY_FAN		BIT(7)
>>   #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
>>   #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
>> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(10)
>> +
>> +enum usb_c_power_priority_options {
>> +	USB_C_POWER_PRIORITY_CHARGING = 0,
>> +	USB_C_POWER_PRIORITY_PERFORMANCE,
>> +};
>>   
>>   struct uniwill_data {
>>   	struct device *dev;
>> @@ -343,6 +349,8 @@ struct uniwill_data {
>>   	struct mutex input_lock;	/* Protects input sequence during notify */
>>   	struct input_dev *input_device;
>>   	struct notifier_block nb;
>> +	struct mutex usb_c_power_priority_lock; /* Protects dependent bit write and state safe */
>> +	enum usb_c_power_priority_options last_usb_c_power_priority_option;
>>   };
>>   
>>   struct uniwill_battery_entry {
>> @@ -527,6 +535,7 @@ static bool uniwill_writeable_reg(struct device *dev, unsigned int reg)
>>   	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>   	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>   	case EC_ADDR_CTGP_DB_DB_OFFSET:
>> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>>   		return true;
>>   	default:
>>   		return false;
>> @@ -565,6 +574,7 @@ static bool uniwill_readable_reg(struct device *dev, unsigned int reg)
>>   	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>   	case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>   	case EC_ADDR_CTGP_DB_DB_OFFSET:
>> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>>   		return true;
>>   	default:
>>   		return false;
>> @@ -587,6 +597,7 @@ static bool uniwill_volatile_reg(struct device *dev, unsigned int reg)
>>   	case EC_ADDR_TRIGGER:
>>   	case EC_ADDR_SWITCH_STATUS:
>>   	case EC_ADDR_CHARGE_CTRL:
>> +	case EC_ADDR_USB_C_POWER_PRIORITY:
>>   		return true;
>>   	default:
>>   		return false;
>> @@ -883,6 +894,104 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
>>   	return 0;
>>   }
>>   
>> +static const char * const USB_C_POWER_PRIORITY_TEXT[] = {
>> +static const u8 USB_C_POWER_PRIORITY_VALUE[] = {
> These two arrays need to be lowercase as they're not macros.

I copied a design pattern if found here for example: 
https://elixir.bootlin.com/linux/v6.19.9/source/drivers/power/supply/power_supply_sysfs.c#L63

But ofc can lower case it.

Best regards,

Werner

>
> --
>   i.
>
>
