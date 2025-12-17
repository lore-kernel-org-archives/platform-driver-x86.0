Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9259C2AE84
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Dec 2025 02:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765938035; cv=none; b=cy9XBx1TCHlHdSevUbdfO93UobRchU2AHDq4otTvAyAPlbOXQ4AJjk97fg9rXceGKWZ1iVNZqwnKV17yJH4K5FicYlWshSn7JevjaUMKaUWQ2FaC7hX7lbgEgtPuMT5dvHNtbqfewB+fhb8LU1Im/0cqTczEHLUzYe8SOaAnBco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765938035; c=relaxed/simple;
	bh=QzS7Vj3ywmkSuyS2uxSlUmsKxM1qhkOvT3eI1GWCfbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVGcq5nqtTiT3t9KlYegugEOA/DaW10Tp9aWCvz5ui8FT+sMGJElD7T813lnDgZra4GhTgf7D8odqSrjwyqEJ3LnoPEHHHxDRtwYLsVIQrYl/hv0jKAZ/qDd9ynzbw3Su4HlJ+p2yyQGjcj458W+/Vvxib9J56QoWKtoFzWwpG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CX+9fV/c; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CX+9fV/c"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so3821078b3a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 18:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765938033; x=1766542833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ymD6SOrUCvHNduZ3CTmEvugnVrqDlDYPAEWfoOb3Ug=;
        b=CX+9fV/cdsnYfUMs2GtAY6tRX1KySl3WpVp4HFxotOymeHk7JhHqKW/Ywbk7wPP9Kn
         AhK+jIbHAcu8kjOWJorczq7ABnGxxEB15T+SObLfeW0y4vHS6QIXFx1QF5c0PA9UiHRq
         MarHg7FJUiTDjCNP1bXgy3M5Ta8sWddcJuh3oFkR5tBjVk6LRbjTZxt97WzUwxmT13dG
         vATFXTxXtWnR8GVx7jdYYhxFfk8VpnhiWTsrE9jv+4XYpgSBjoRjf3dcBbyjiJDDo/sQ
         csS/pOMOjtbeF78nHM7n5eVleWsE58a6YOvErrlhTQIUA5XmssuNQgUXM4k/BXlyHf0w
         vBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765938033; x=1766542833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ymD6SOrUCvHNduZ3CTmEvugnVrqDlDYPAEWfoOb3Ug=;
        b=NspfYbA+1LpIo76BkxfZN3XQm1Etutap50NfthAcj0bs8wahuXdW02j/CT89wTzS7z
         oyOV+92IRan8aRYjeSJvWTaDqPRG0RvtO7fLhmmILXBnBUNew6oMz8RBOsrRTbXX7MLZ
         RaylzsAIARcaK1HLL/4SNIWIrMW3t4cq6HK+GoX14MaR4iYAR0cyD8zFcMN5Re4ohQm4
         CkAnQdXL0EF4sQssQnLD81LyqOyj9wEZVKLR7/1v//AplvfYVe1kqFPZxIPzkfgmJ2AS
         nWpmap+bvEd5MfM3yrJL8MhGSHA4f+OhBAs+3cbf7eRfoK4W0/niHWPVPJw46SFHzW7Z
         r+VA==
X-Forwarded-Encrypted: i=1; AJvYcCXEOfdm+ZlCACu6UxF+3+ZhbQ+znm92xtHSTlpd+M3IWeB04t/nlYRDNz1xsFG734fj67QsZaTmzL7NpBeHjc1Ax+K3@vger.kernel.org
X-Gm-Message-State: AOJu0YwrN2QBK8BdD4/yTXCm2UQTltApz373sNWuiwbQ5HmbGaqqBHUY
	jKjg+joGU6tH4zzVD7/GRF/qreevncbSjeIfoMa9L2VJ3la7RyGlASmw
X-Gm-Gg: AY/fxX4PjRUOvgYBFBV6jIafrbN0OCw4jFngau8gwjFb41x+St4XfLUzgcvzOCYtpk7
	PqhYCWoS+ndnOuIEYzFuLRtBPO+TCfSnZtfK4/fiMJ+xybfmeFkirGCjCGECdqP9XLMZ4bwU36d
	fhqF3TzY/tkEOzFVVT3Wya4iMPRv+gSuPxcn4IqC2oHTOyTKb1Boo9fK9jS42xsGCtH9H3hcQ5W
	CKYFhJfJiql+3hE/Ac6AP6J0WEtBpfkFUKgjQ/sycqHG63BcPVvlYfBzSvpWwdsDSPk7IA22NY+
	JpVR6McVA3FvKuJrr7Cn4XG0+yaDw0uFJlns80TWeXQsXwbwT9ouoUwjaQ+0ziKXEkHU2cxyat4
	4C2EPIXgyEhTkMC76u6myMFuBvPaReqq79Gc8rx0eumsFg0fowEAxKK0nTinsWHmkJOhC0sIw/t
	/PEmkaaM+lnQJOsKel7+GUivJrSIVkWObeniG2x/TPNrXr2dFQH56lkvExCmmSyN+zQ/nm
X-Google-Smtp-Source: AGHT+IHypCGleL6nWyJJ788qjfPYIWgkzutIydb/Vi58xhBLARCUku08Ow3e9w6aWMNZh23T6Ji04w==
X-Received: by 2002:a05:6a00:340a:b0:7e8:4587:e8c7 with SMTP id d2e1a72fcca58-7f669c8e6c6mr14754112b3a.58.1765938032441;
        Tue, 16 Dec 2025 18:20:32 -0800 (PST)
Received: from ?IPV6:2405:201:3006:188a:4b8f:99bd:7069:8c6f? ([2405:201:3006:188a:4b8f:99bd:7069:8c6f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fd230634a9sm191705b3a.41.2025.12.16.18.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 18:20:32 -0800 (PST)
Message-ID: <79df0522-c38f-4666-9191-ca1516115aea@gmail.com>
Date: Wed, 17 Dec 2025 11:20:26 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] platform/x86: thinkpad_acpi: Add sysfs to display
 details of damaged device.
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251216120454.41076-1-nitjoshi@gmail.com>
 <20251216120454.41076-2-nitjoshi@gmail.com>
 <42c66ffc-8e36-c595-25bd-e58335087ba3@linux.intel.com>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <42c66ffc-8e36-c595-25bd-e58335087ba3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/16/25 21:14, Ilpo Järvinen wrote:
> On Tue, 16 Dec 2025, Nitin Joshi wrote:
>
>> Add new sysfs interface to identify the impacted component with location of
>> device.
>>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
>> ---
>> Changes since v2:
>> -Control visibility of the sysfs attribute based upon ucdd_supported
>> Changes since v3:
>> -Fix documentation build warning
>> ---
>>   .../admin-guide/laptops/thinkpad-acpi.rst     |  13 +-
>>   drivers/platform/x86/lenovo/thinkpad_acpi.c   | 114 +++++++++++++++++-
>>   2 files changed, 122 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> index 2db05f718b11..3a37b14863a8 100644
>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> @@ -1580,7 +1580,7 @@ Documentation/ABI/testing/sysfs-class-power.
>>   Hardware damage detection capability
>>   ------------------------------------
>>   
>> -sysfs attributes: hwdd_status
>> +sysfs attributes: hwdd_status, hwdd_detail
>>   
>>   Thinkpads are adding the ability to detect and report hardware damage.
>>   Add new sysfs interface to identify the damaged device status.
>> @@ -1594,6 +1594,17 @@ This value displays status of device damaged
>>   - 0 = Not Damaged
>>   - 1 = Damaged
>>   
>> +The command to check location of damaged device is::
>> +
>> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_detail
>> +
>> +This value displays location of damaged device having 1 line per damaged "item".
>> +For example:
>> +if no damage is detected:
>> +- No damage detected
>> +if damage detected:
>> +- TYPE-C: Base, Right side, Center port
>> +
>>   The property is read-only. If feature is not supported then sysfs
>>   attribute is not created.
>>   
>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> index b0f7dc0bd531..0dc6d7e07213 100644
>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> @@ -11089,8 +11089,24 @@ static const struct attribute_group auxmac_attr_group = {
>>   #define HWDD_NOT_SUPPORTED	BIT(31)
>>   #define HWDD_SUPPORT_USBC	BIT(0)
>>   
>> -#define PORT_STATUS		GENMASK(7, 4)
>> -#define NUM_PORTS		4
>> +#define PORT_STATUS     GENMASK(7, 4)
>> +#define LID_STATUS      GENMASK(11, 8)
>> +#define BASE_STATUS     GENMASK(15, 12)
>> +#define POS_STATUS      GENMASK(3, 2)
>> +#define PANEL_STATUS    GENMASK(1, 0)
>> +
>> +#define PORT_DETAIL_OFFSET	16
>> +
>> +#define PANEL_TOP	0
>> +#define PANEL_BASE	1
>> +#define PANEL_LEFT	2
>> +#define PANEL_RIGHT	3
>> +
>> +#define POS_LEFT	0
>> +#define POS_CENTER	1
>> +#define POS_RIGHT	2
>> +
>> +#define NUM_PORTS	4
>>   
>>   static bool hwdd_support_available;
>>   static bool ucdd_supported;
>> @@ -11108,7 +11124,96 @@ static int hwdd_command(int command, int *output)
>>   	return 0;
>>   }
>>   
>> -/* sysfs type-c damage detection capability */
>> +static bool display_damage(char *buf, int *count, char *type, unsigned int dmg_status)
>> +{
>> +	unsigned char lid_status, base_status, port_status;
>> +	unsigned char loc_status, pos_status, panel_status;
>> +	bool damage_detected = false;
>> +	int i;
>> +
>> +	port_status = FIELD_GET(PORT_STATUS, dmg_status);
>> +	lid_status = FIELD_GET(LID_STATUS, dmg_status);
>> +	base_status = FIELD_GET(BASE_STATUS, dmg_status);
>> +	for (i = 0; i < NUM_PORTS; i++) {
>> +		if (!(dmg_status & BIT(i)))
>> +			continue;
>> +
>> +		if (port_status & BIT(i)) {
> Could this too be using reverse logic to reduce indentation level?
Ack , I will modify it in next version. Thanks
>
>> +			*count += sysfs_emit_at(buf, *count, "%s: ", type);
>> +			loc_status = (dmg_status >> (PORT_DETAIL_OFFSET + (4 * i))) & 0xF;
>> +			pos_status = FIELD_GET(POS_STATUS, loc_status);
>> +			panel_status = FIELD_GET(PANEL_STATUS, loc_status);
>> +
>> +			if (lid_status & BIT(i))
>> +				*count += sysfs_emit_at(buf, *count, "Lid, ");
>> +			if (base_status & BIT(i))
>> +				*count += sysfs_emit_at(buf, *count, "Base, ");
>> +
>> +			switch (pos_status) {
>> +			case PANEL_TOP:
>> +				*count += sysfs_emit_at(buf, *count, "Top, ");
>> +				break;
>> +			case PANEL_BASE:
>> +				*count += sysfs_emit_at(buf, *count, "Bottom, ");
>> +				break;
>> +			case PANEL_LEFT:
>> +				*count += sysfs_emit_at(buf, *count, "Left, ");
>> +				break;
>> +			case PANEL_RIGHT:
>> +				*count += sysfs_emit_at(buf, *count, "Right, ");
>> +				break;
>> +			default:
>> +				pr_err("Unexpected value %d in switch statement\n", pos_status);
>> +			};
>> +
>> +			switch (panel_status) {
>> +			case POS_LEFT:
>> +				*count += sysfs_emit_at(buf, *count, "Left port\n");
>> +				break;
>> +			case POS_CENTER:
>> +				*count += sysfs_emit_at(buf, *count, "Center port\n");
>> +				break;
>> +			case POS_RIGHT:
>> +				*count += sysfs_emit_at(buf, *count, "Right port\n");
>> +				break;
>> +			default:
>> +				*count += sysfs_emit_at(buf, *count, "Undefined\n");
>> +				break;
>> +			};
>> +			damage_detected = true;
>> +		}
>> +	}
>> +	return damage_detected;
>> +}
>> +
>> +/* sysfs type-c damage detection detail */
>> +static ssize_t hwdd_detail_show(struct device *dev,
>> +				struct device_attribute *attr,
>> +				char *buf)
>> +{
>> +	bool damage_detected = false;
>> +	unsigned int damage_status;
>> +	int err, count = 0;
>> +
>> +
> Please remove the extra empty line.
Ack
>
>> +	if (ucdd_supported) {
>> +		/* Get USB TYPE-C damage status */
>> +		err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
>> +		if (err)
>> +			return err;
>> +
>> +		if (display_damage(buf, &count, "Type-C", damage_status))
>> +			damage_detected = true;
>> +	} else
>> +		return -ENODEV;
>> +
>> +	if (!damage_detected)
>> +		count += sysfs_emit_at(buf, count, "No damage detected\n");
>> +
>> +	return count;
>> +}
>> +
>> +/* sysfs typc damage detection capability */
>>   static ssize_t hwdd_status_show(struct device *dev,
>>   				struct device_attribute *attr,
>>   				char *buf)
>> @@ -11132,13 +11237,14 @@ static ssize_t hwdd_status_show(struct device *dev,
>>   	} else
>>   		return -ENODEV;
>>   
>> -
>>   	return sysfs_emit(buf, "0\n");
> This belongs to the previous patch.
Ack ,
>
>>   }
>>   static DEVICE_ATTR_RO(hwdd_status);
>> +static DEVICE_ATTR_RO(hwdd_detail);
>>   
>>   static struct attribute *hwdd_attributes[] = {
>>   	&dev_attr_hwdd_status.attr,
>> +	&dev_attr_hwdd_detail.attr,
>>   	NULL
>>   };
>>   
>>
Thanks & Regards,

Nitin Joshi

