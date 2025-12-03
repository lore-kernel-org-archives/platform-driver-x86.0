Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E252EDD78
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Dec 2025 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764758097; cv=none; b=qYdx+czuAxKCWdCwk+XPlO1gWsgAEnaH9xAv9kC5eqn7ZbAthIKE7xed3obmwFLtNX//MSizLF0jRcpjkTuJ22admh8LWUa1PU1XUvzI71FNogUVYQrTFgJ8K9qFj8SIRJvZ7uLrkfoK9xzOIYEGyhtWrFL6cq8fCLXs8qFPvI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764758097; c=relaxed/simple;
	bh=NcBvPtDx3uKKhBXHzwBnLEIw+Hw1V5CriYvfJkwTdW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=glFlX85piWmGLkdcqEXLjKoXAcTO//DMkzGGpnrDg7+iAT+nEmykVb1dKp/eA1yuenHupdQjASVPDAE8TY0kGk/l8mKBQov6jUDVcCvALsYw7XdVYm0WnhmVxVh6Wk8xgHoNBwflOjGl4b7GFWmXv+SV4WqRFr3jEJqtT55J+Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRxHLupr; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRxHLupr"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2958db8ae4fso66749295ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Dec 2025 02:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764758095; x=1765362895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K5k5/UpDamU592uOh9O6jwQRqoKuuy87SI0l0YR9WQs=;
        b=GRxHLuprS/PN/SgYFDPm0ZlKHP7hf1dOlWoUqkcRvvP2NWJjs0QJl76kstBcgW+qBM
         ymOllE5qoTxFydZXKruEsqYdH3Z+0ii6WRA4ZnJpz+hp/fcu4mPcNIJqGRGBFLVbUKAU
         L4GZRhlaGkS3bN/wnNxxLZuSFCyYpwIgoi5VT9hmJrY1lxkIEyTrmUAoNbVVk2WBkg9I
         Y6ZmDnEBap6X92xDv7khZceKigIhuVUUzZdjF2b2PZDZYMLxn44hsgiXNefvCcIVdmv5
         slc8tJyNQ0YLFkG/RJSdjxXPEBsGSYi6FmXElAqBpgVIanDgoZ5zcYHkUWM3VIgPgxEZ
         Uu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764758095; x=1765362895;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5k5/UpDamU592uOh9O6jwQRqoKuuy87SI0l0YR9WQs=;
        b=hA26S6ZN0UjpQdbrdCy99Aql33KXS3Dp6ZlStxSmTPShK/xkciiBaYlhBGY80J84hG
         88+mcO1on482qQyOKV+7BwUk+Jn51ga3bsUvZXOXjl8x5BZ78UC5CJSMqP9Wkv59SC8y
         Y35H+PjLY3y3Gwmh6cFDB8z6HphLF5mqtpzJdXW9yA30cn4+kuwGX3+5vaoIIsHjwJlN
         6BLRE6rUXQrj67Ki3uf/GWeckkJN7Bc4fh8MWjkgGi7zrfNjJfD5oav/020a5wu01+PV
         1Ye3IwY7y17g3n6OHRaE8pcR/U1YtyVvMoMmi5xT1qC6yUurN+K2f3XybX4/k10YRs7S
         EU5g==
X-Forwarded-Encrypted: i=1; AJvYcCVjyrlX30fnP2NSCgvMmxyJgpRbpgIAxcHcLT+MDjELZyvHb26Jo6Q498gF+W+jAJuYKPZk1tJZxAsZOvmJlB08ecJx@vger.kernel.org
X-Gm-Message-State: AOJu0YxWfXL+3PsIP79/nky0Oj5uVCw46BL+5If6jtLgOUO507GbHaIT
	SiNeJpsVWK/4q7DHKDQXXCysWEg8lb8XWRbW4H2FrwUhff+O3KqbVWyM
X-Gm-Gg: ASbGncvuUcOWtI8Wpfjv8RLUGZ4R8zmHI1i1zQS/ChM922/QMQWYm4semTDH8qPJDJE
	+IjNd2YGaPZ/hWG0qOL+n9mqZZW1TgZwnDcIFTF+U5E9597vXsBoFCGB0Y94OL39OxrkmBqIBo7
	874L80fuuf67gjBdoilRn9B/daVAbs+3dsL8SepL5M7KIqxMR88/eMEqfWRX0A5u0xgr33dmFvZ
	FQZZg8Fh0GRpatx4NX4Xd++NtCjJJTtL1IDAnxiccTJyJAoLZEMyeavmFMsdoFFZ86KsGnbkqzX
	ecnuP3oneErtGiYblkoLnLd1DlAQ0G8kKKERoADF/5pO4KTmEPqlDOoj/xjTMtAqit3e1ZBKhwB
	aen2EZiHLcKZcdBH72YFiWlKPBiyT5wFjesFa07yh5okqxOt9antxYnZLnga1QIWQ2AZwfvPEIL
	78oeHRNO6tCQcXa/wKI54A/CpP77uYY2UUASnkfJeyh1oYhdwbzJ9IL47QVOTtbK/zgZA=
X-Google-Smtp-Source: AGHT+IER7dqjWfcT1QkjTkS8vHXt5sm3jlVuqCEjj0vl+jgCoKswB6G7/u0z8zwhIvJ0pMFU3cmmMg==
X-Received: by 2002:a17:903:11c3:b0:297:d6c2:d06 with SMTP id d9443c01a7336-29d682f4d7dmr21146735ad.20.1764758095104;
        Wed, 03 Dec 2025 02:34:55 -0800 (PST)
Received: from [10.131.179.186] (zz20234032476F6CA7C6.userreverse.dion.ne.jp. [111.108.167.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470263sm179509035ad.40.2025.12.03.02.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 02:34:54 -0800 (PST)
Message-ID: <2f94f4bb-c0e5-40c0-9cf3-7ba31fefbc2b@gmail.com>
Date: Wed, 3 Dec 2025 19:34:51 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251203034032.6018-1-nitjoshi@gmail.com>
 <22f766d6-9010-3e87-f05b-bfd9b5888881@linux.intel.com>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <22f766d6-9010-3e87-f05b-bfd9b5888881@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ilpo,

Thank you for reviewing the patch.

On 12/3/25 18:44, Ilpo Järvinen wrote:
> On Wed, 3 Dec 2025, Nitin Joshi wrote:
>
>> Thinkpads are adding the ability to detect and report hardware damage
>> status. Add new sysfs interface to identify the impacted component
>> with status.
>> Initial support is available for the USB-C replaceable connector.
>>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
>> ---
>>   .../admin-guide/laptops/thinkpad-acpi.rst     |  26 +++
>>   drivers/platform/x86/lenovo/thinkpad_acpi.c   | 179 ++++++++++++++++++
>>   2 files changed, 205 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> index 4ab0fef7d440..4a3220529489 100644
>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> @@ -54,6 +54,7 @@ detailed description):
>>   	- Setting keyboard language
>>   	- WWAN Antenna type
>>   	- Auxmac
>> +	- Hardware damage detection capability
>>   
>>   A compatibility table by model and feature is maintained on the web
>>   site, http://ibm-acpi.sf.net/. I appreciate any success or failure
>> @@ -1576,6 +1577,31 @@ percentage level, above which charging will stop.
>>   The exact semantics of the attributes may be found in
>>   Documentation/ABI/testing/sysfs-class-power.
>>   
>> +Hardware damage detection capability
>> +-----------------
>> +
>> +sysfs attributes: hwdd_status
>> +
>> +Thinkpads are adding the ability to detect and report hardware damage.
>> +Add new sysfs interface to identify the impacted component.
>> +Initial support is available for the USB-C replaceable connector.
>> +
>> +The available commands are::
>> +
>> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
>> +
>> +This value displays device type and location of device with damage status.
>> +For example:
>> +if no damage is detected:
>> +  No damage detected
>> +if damage detected:
>> +  Damage detected:
>> +  Device: TYPE-C
>> +  Location: Base, Right side, Center port
>> +
>> +The property is read-only. If feature is not supported then sysfs
>> +class is not created.
>> +
>>   Multiple Commands, Module Parameters
>>   ------------------------------------
>>   
>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> index cc19fe520ea9..c3629bed9a8e 100644
>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> @@ -11080,6 +11080,180 @@ static const struct attribute_group auxmac_attr_group = {
>>   	.attrs = auxmac_attributes,
>>   };
>>   
>> +/*************************************************************************
>> + * HWDD subdriver, for the Lenovo Hardware Damage Detection feature.
>> + */
>> +
>> +#define HWDD_GET_DMG_USBC 0x80000001
>> +#define HWDD_GET_CAP 0
>> +#define HWDD_NOT_SUPPORTED BIT(31)
>> +#define HWDD_SUPPORT_USBC BIT(0)
> Align values.

Ack, i will align values like below:

#define HWDD_GET_CAP 0
#define HWDD_GET_DMG_USBC 0x80000001
#define HWDD_SUPPORT_USBC BIT(0)
#define HWDD_NOT_SUPPORTED BIT(31)

>> +#define HWDD_GET_CAP       0
>> +
>> +#define DAMAGE_STATUS_BIT  BIT(0)
>> +#define PORT_STATUS_OFFSET  4
>> +#define LID_STATUS_OFFSET  8
>> +#define BASE_STATUS_OFFSET 12
>> +#define PORT_DETAIL_OFFSET 16
>> +
>> +#define PORT_POS_OFFSET    2
>> +#define PORT_LOC_MASK      0x3
>> +
>> +#define PANEL_TOP   0
>> +#define PANEL_BASE  1
>> +#define PANEL_LEFT  2
>> +#define PANEL_RIGHT 3
>> +
>> +#define POS_LEFT    0
>> +#define POS_CENTER  1
>> +#define POS_RIGHT   2
>> +
>> +#define NUM_PORTS 4
> Add an empty line
Ack.
>
>> +static bool hwdd_support_available;
>> +static bool ucdd_supported;
> Add an empty line
Ack.
>
>> +static int hwdd_command(int command, int *output)
>> +{
>> +	acpi_handle hwdd_handle;
>> +
>> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "HWDD", &hwdd_handle)))
>> +		return -ENODEV;
>> +
>> +	if (!acpi_evalf(hwdd_handle, output, NULL, "dd", command))
>> +		return -EIO;
>> +
>> +	return 0;
>> +}
>> +
>> +static bool display_damage(char *buf, int *count, char *type, unsigned int dmg_status)
>> +{
>> +	unsigned char lid_status, base_status, port_status;
>> +	unsigned char loc_status, pos_status, panel_status;
>> +	bool damage_detected = false;
>> +	unsigned int i;
>> +
>> +	port_status = (dmg_status >> PORT_STATUS_OFFSET) & 0xF;
>> +	lid_status = (dmg_status >> LID_STATUS_OFFSET) & 0xF;
>> +	base_status = (dmg_status >> BASE_STATUS_OFFSET) & 0xF;
> Define these as fields using GENMASK() and use FIELD_GET() here. Don't
> forget to check you also have the includes for those.
Ack. I will recheck and modify it.
>
>> +	for (i = 0; i < NUM_PORTS; i++) {
>> +		if (dmg_status & BIT(i)) {
>> +			if (port_status & BIT(i)) {
> Reverse the logic in these and use continue to bring down indentation
> level.
Ack. I will recheck and modify it.
>
>> +				*count += sysfs_emit_at(buf, *count, "%s damage detected:\n", type);
>> +				loc_status = (dmg_status >> (PORT_DETAIL_OFFSET + (4 * i))) & 0xF;
>> +				pos_status = (loc_status  >> PORT_POS_OFFSET) & PORT_LOC_MASK;
> Extra space & use FIELD_GET().
Ack.
>
>> +				panel_status = loc_status & PORT_LOC_MASK;
>> +
>> +				*count += sysfs_emit_at(buf, *count, "Location: ");
>> +				if (lid_status & BIT(i))
>> +					*count += sysfs_emit_at(buf, *count, "Lid, ");
>> +				if (base_status & BIT(i))
>> +					*count += sysfs_emit_at(buf, *count, "Base, ");
>> +
>> +				switch (pos_status) {
>> +				case PANEL_TOP:
>> +					*count += sysfs_emit_at(buf, *count, "Top, ");
>> +					break;
>> +				case PANEL_BASE:
>> +					*count += sysfs_emit_at(buf, *count, "Bottom, ");
>> +					break;
>> +				case PANEL_LEFT:
>> +					*count += sysfs_emit_at(buf, *count, "Left, ");
>> +					break;
>> +				case PANEL_RIGHT:
>> +					*count += sysfs_emit_at(buf, *count, "Right, ");
>> +					break;
> Some checkers likely won't be happy if you're not having default: at all,
> even if it is unnecessary here. So add something like this:
>
> 				default:
> 					WARN_ON(1);
> 					return ...;
Ack, I will recheck and modify it.
>> +				};
>> +
>> +				switch (panel_status) {
>> +				case POS_LEFT:
>> +					*count += sysfs_emit_at(buf, *count, "Left port\n");
>> +					break;
>> +				case POS_CENTER:
>> +					*count += sysfs_emit_at(buf, *count, "Center port\n");
>> +					break;
>> +				case POS_RIGHT:
>> +					*count += sysfs_emit_at(buf, *count, "Right port\n");
>> +					break;
>> +				default:
>> +					*count += sysfs_emit_at(buf, *count, "Undefined\n");
>> +					break;
>> +				};
>> +				damage_detected = true;
>> +			}
>> +		}
>> +	}
>> +	return damage_detected;
>> +}
>> +
>> +/* sysfs typc damage detection capability */
>> +static ssize_t hwdd_status_show(struct device *dev,
>> +				struct device_attribute *attr,
>> +				char *buf)
>> +{
>> +	bool damage_detected = false;
>> +	unsigned int damage_status;
>> +	int err, count = 0;
>> +
>> +	if (ucdd_supported) {
>> +		/* Get USB TYPE-C damage status */
>> +		err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
>> +		if (err)
>> +			return err;
>> +
>> +		if (display_damage(buf, &count, "Type-C", damage_status))
>> +			damage_detected = true;
>> +	}
>> +
>> +	if (!damage_detected)
>> +		count  = count + sysfs_emit_at(buf, count, "No damage detected\n");
> Extra space, please also use += instead.
Ack.
>
>> +
>> +	return count;
>> +}
>> +static DEVICE_ATTR_RO(hwdd_status);
>> +
>> +static struct attribute *hwdd_attributes[] = {
>> +	&dev_attr_hwdd_status.attr,
>> +	NULL
>> +};
>> +
>> +static umode_t hwdd_attr_is_visible(struct kobject *kobj,
>> +				struct attribute *attr, int n)
>> +{
>> +	return hwdd_support_available ? attr->mode : 0;
>> +}
>> +
>> +static const struct attribute_group hwdd_attr_group = {
>> +	.is_visible = hwdd_attr_is_visible,
>> +	.attrs = hwdd_attributes,
>> +};
>> +
>> +static int tpacpi_hwdd_init(struct ibm_init_struct *iibm)
>> +{
>> +	int err, output;
>> +
>> +	/* Below command checks the HWDD damage capability */
>> +	err = hwdd_command(HWDD_GET_CAP, &output);
>> +	if (err)
>> +		return err;
>> +
>> +	if (!(output & HWDD_NOT_SUPPORTED))
>> +		return -ENODEV;
>> +
>> +	hwdd_support_available = true;
>> +
>> +	/*
>> +	 * BIT(0) is assigned to check capability of damage detection is
>> +	 * supported for USB Type-C port or not.
>> +	 */
>> +	if (output & HWDD_SUPPORT_USBC)
>> +		ucdd_supported = true;
>> +
>> +	return err;
>> +}
>> +
>> +static struct ibm_struct hwdd_driver_data = {
>> +	.name = "hwdd",
>> +};
>> +
>>   /* --------------------------------------------------------------------- */
>>   
>>   static struct attribute *tpacpi_driver_attributes[] = {
>> @@ -11139,6 +11313,7 @@ static const struct attribute_group *tpacpi_groups[] = {
>>   	&kbdlang_attr_group,
>>   	&dprc_attr_group,
>>   	&auxmac_attr_group,
>> +	&hwdd_attr_group,
>>   	NULL,
>>   };
>>   
>> @@ -11752,6 +11927,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>>   		.init = auxmac_init,
>>   		.data = &auxmac_data,
>>   	},
>> +	{
>> +		.init = tpacpi_hwdd_init,
>> +		.data = &hwdd_driver_data,
>> +	},
>>   };
>>   
>>   static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
>>
