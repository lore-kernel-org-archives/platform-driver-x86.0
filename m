Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA8830EF7E
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Dec 2025 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765384062; cv=none; b=pB3WXh0hMUQNWej/jyxo+vkPmC7Bs5ZW9SlxzLp7NLNPWgfCqNTotz2PptxjySxGDz5wFXOryXh+tRPDtiHBpeLtCq8KHYcx7KjpteztWVyt0af0t9CFe728DC6DjaDnWTFh8v7c+B9SZzgrQhNBUN3Zv7kHG/6XNCXSnKUU2LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765384062; c=relaxed/simple;
	bh=deCPl6hkb2TZ1lECZ1IKGagdVj6j5L5owCDrTSKKNI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kC9MYEEKRR4n23xFmeqcjIg/NrDpK0C18yy2e5uyM6zIOYSyfC1tozv2WdxBYIdrZ0zb3ILALb6tPQ/Fn+Fu/ewM4zt8RgjrscH+hBg7GeUuL+xxCo0VR/fViSS2iGPpfIQzq48MlgpS9d3VF1ySgbwQMV+BuTjIEr3ocwvY2CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwvcNoGu; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwvcNoGu"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso8041251b3a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Dec 2025 08:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765384060; x=1765988860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8KMFDVB22Zk2gVgNrK6KOYmlGrljr+AgaJp2OmrBusw=;
        b=WwvcNoGuNk4/XXuLzRvZQj8YiBcfxpk+XghyOIEyaDIpBR0QBqooQSVBDsxT14lh4U
         VSGQJ92CEbLOKaY8cb46Pb4BiCs9I2S60vveqGNMxBYkUPq4eZu3dCe4ynv0dmIPQjcM
         HQQiUeSPH+/qAeQvohfUVN+YK/on0SqWOYK54v/tUCHDTnVrv/6YvBBzUfvL5gxt6ZZ7
         ZgbDtJa90Jn+xyzDMX32dKe24/1tLXdBlQbhStuxSdmXCBttg6Pf8woMBEwX1KDKa0S1
         WhRhyQB2NfQQtGyy2M6Vdcz9pjl6t7cYzg/Qq/H//Di03+RZgdw0o1Hjb5oBMv2Bj+Km
         GJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765384060; x=1765988860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KMFDVB22Zk2gVgNrK6KOYmlGrljr+AgaJp2OmrBusw=;
        b=QBw6GTsfT/J0wHuBcQp+UIsSSa0+3V0HgxTxhLyYUhhTpLRBb0qXDxfTBvgliONlRN
         0QHva5CI9pu0xPT7JNRqkNv4C9bB5e/AsRCoAM+GzaptnB9tua2bkvkxTGJI9YDGVBm4
         AOIVffISPPNOCXPDOhPgCU/CjdpLUU0tbLrK4XkyiTk2b2ZpnrmQfOi08LKCWsvmB3r9
         yXIuT3HEXcjgCHlX8slNC1U6rxDnTTtF3lp5ViGXe86PxygtVZ2rWw9QshsyPwQ+qnIc
         aZ3jM0mBOHYPPIOpyi0z0vu1LYuUI0b0+QtpUVTv5+GhN0ZlmoSejGdP/wcXAEH57t8X
         Tuvg==
X-Gm-Message-State: AOJu0YwN2faQRnK9UzmcEEGe7YiQnMKsCLDCFgisjHHf7u1SMrIoFejP
	lfWAnx6s29eWW4FsZ0H68Gvqk9i9aUCxzggVKH0dfOkyiLPcZikNT72bKJi+bMBC8Uw=
X-Gm-Gg: AY/fxX6l6wXVbgROCEYrQpEdBJ0aNRMpmyCCgIYNe6x4DW0/nTmlAHktmB1vFQ4KtGI
	Slb++0xP0fKVwLBrm84wabTeiCMuUphrUoxmxHGj1b7l/r6O3bZkuQXHmvvvTmR7zdAMyOREIq3
	hcMaD5vh5rq1Mkhs4DkF7Ee1o7gaPbz/Vr0AazAMBzk8EDz5byh3GJv+FMtpfROUEMi+CsIqCwB
	dQxwdt8OVyn4LSPkeR1bBDYpwsA2wOegUKRjdmWvAf6xJmucmSSbKTUNj2+5K8jLmZi13M+4K29
	5rXwe8lpCc5yS5EvPhtIiabWEda59gYnuqfqWjQwwgVxgtXEV7yXirHDWvVoldoZi4JZSUUW7zx
	4Y6lrOduTnr7XtDerR51wmjAoeToj3AiWPwI12mVlehBQ0HXD7xZVk4kuoLWQGSybQ1yluP5RHw
	GIZVuxnpryk8hRApBgdWIBysysIUUHVGJX4zyNHrIqQhrpy1c=
X-Google-Smtp-Source: AGHT+IGkWoEvNMmkOFNiqV6c3oIPVALBG20L6pooCgf0vCr2eydvUrm0K+MtQpKVmMrprDhfF1DSLw==
X-Received: by 2002:a05:6a00:92a7:b0:7b8:87e1:a648 with SMTP id d2e1a72fcca58-7f22c8451admr2917696b3a.3.1765384059310;
        Wed, 10 Dec 2025 08:27:39 -0800 (PST)
Received: from ?IPV6:240f:102:8600:1:e5ea:73e5:ae85:d6b? ([240f:102:8600:1:e5ea:73e5:ae85:d6b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c237f357sm28109b3a.6.2025.12.10.08.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 08:27:38 -0800 (PST)
Message-ID: <d7b9167d-ddb2-4bec-b294-513010501ca9@gmail.com>
Date: Thu, 11 Dec 2025 01:27:34 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: thinkpad_acpi: Add sysfs to display
 details of damaged device.
To: Mario Limonciello <mario.limonciello@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20251210151133.7933-1-nitjoshi@gmail.com>
 <20251210151133.7933-2-nitjoshi@gmail.com>
 <21503e42-64c7-4ba1-a6b5-b27cb19af429@amd.com>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <21503e42-64c7-4ba1-a6b5-b27cb19af429@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mario,

Thank you for your comments.

On 12/11/25 00:43, Mario Limonciello wrote:
> On 12/10/25 9:11 AM, Nitin Joshi wrote:
>> Add new sysfs interface to identify the impacted component with 
>> location of
>> device.
>>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
>> ---
>>   .../admin-guide/laptops/thinkpad-acpi.rst     |  13 +-
>>   drivers/platform/x86/lenovo/thinkpad_acpi.c   | 112 +++++++++++++++++-
>>   2 files changed, 121 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst 
>> b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> index 94349e5f1298..3a9190ac47d0 100644
>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> @@ -1580,7 +1580,7 @@ Documentation/ABI/testing/sysfs-class-power.
>>   Hardware damage detection capability
>>   -----------------
>>   -sysfs attributes: hwdd_status
>> +sysfs attributes: hwdd_status, hwdd_detail
>>     Thinkpads are adding the ability to detect and report hardware 
>> damage.
>>   Add new sysfs interface to identify the damaged device status.
>> @@ -1594,6 +1594,17 @@ This value displays status of device damaged
>>   - 0 = Not Damaged
>>   - 1 = Damaged
>>   +The command to check location of damaged device is::
>> +
>> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_detail
>> +
>> +This value displays location of damaged device having 1 line per 
>> damaged "item".
>> +For example:
>> +if no damage is detected:
>> +  No damage detected
>> +if damage detected:
>> +  TYPE-C: Base, Right side, Center port
>> +
>>   The property is read-only. If feature is not supported then sysfs
>>   attribute is not created.
>>   diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
>> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> index 4cf365550bcb..a092d57d995d 100644
>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> @@ -11089,8 +11089,24 @@ static const struct attribute_group 
>> auxmac_attr_group = {
>>   #define HWDD_NOT_SUPPORTED    BIT(31)
>>   #define HWDD_SUPPORT_USBC    BIT(0)
>>   -#define PORT_STATUS        GENMASK(7, 4)
>> -#define NUM_PORTS        4
>> +#define PORT_STATUS     GENMASK(7, 4)
>> +#define LID_STATUS      GENMASK(11, 8)
>> +#define BASE_STATUS     GENMASK(15, 12)
>> +#define POS_STATUS      GENMASK(3, 2)
>> +#define PANEL_STATUS    GENMASK(1, 0)
>> +
>> +#define PORT_DETAIL_OFFSET    16
>> +
>> +#define PANEL_TOP    0
>> +#define PANEL_BASE    1
>> +#define PANEL_LEFT    2
>> +#define PANEL_RIGHT    3
>> +
>> +#define POS_LEFT    0
>> +#define POS_CENTER    1
>> +#define POS_RIGHT    2
>> +
>> +#define NUM_PORTS    4
>>     static bool hwdd_support_available;
>>   static bool ucdd_supported;
>> @@ -11108,7 +11124,95 @@ static int hwdd_command(int command, int 
>> *output)
>>       return 0;
>>   }
>>   -/* sysfs type-c damage detection capability */
>> +static bool display_damage(char *buf, int *count, char *type, 
>> unsigned int dmg_status)
>> +{
>> +    unsigned char lid_status, base_status, port_status;
>> +    unsigned char loc_status, pos_status, panel_status;
>> +    bool damage_detected = false;
>> +    int i;
>> +
>> +    port_status = FIELD_GET(PORT_STATUS, dmg_status);
>> +    lid_status = FIELD_GET(LID_STATUS, dmg_status);
>> +    base_status = FIELD_GET(BASE_STATUS, dmg_status);
>> +    for (i = 0; i < NUM_PORTS; i++) {
>> +        if (!(dmg_status & BIT(i)))
>> +            continue;
>> +
>> +        if (port_status & BIT(i)) {
>> +            *count += sysfs_emit_at(buf, *count, "%s: ", type);
>> +            loc_status = (dmg_status >> (PORT_DETAIL_OFFSET + (4 * 
>> i))) & 0xF;
>> +            pos_status = FIELD_GET(POS_STATUS, loc_status);
>> +            panel_status = FIELD_GET(PANEL_STATUS, loc_status);
>> +
>> +            if (lid_status & BIT(i))
>> +                *count += sysfs_emit_at(buf, *count, "Lid, ");
>> +            if (base_status & BIT(i))
>> +                *count += sysfs_emit_at(buf, *count, "Base, ");
>> +
>> +            switch (pos_status) {
>> +            case PANEL_TOP:
>> +                *count += sysfs_emit_at(buf, *count, "Top, ");
>> +                break;
>> +            case PANEL_BASE:
>> +                *count += sysfs_emit_at(buf, *count, "Bottom, ");
>> +                break;
>> +            case PANEL_LEFT:
>> +                *count += sysfs_emit_at(buf, *count, "Left, ");
>> +                break;
>> +            case PANEL_RIGHT:
>> +                *count += sysfs_emit_at(buf, *count, "Right, ");
>> +                break;
>> +            default:
>> +                pr_err("Unexpected value %d in switch statement\n", 
>> pos_status);
>> +            };
>> +
>> +            switch (panel_status) {
>> +            case POS_LEFT:
>> +                *count += sysfs_emit_at(buf, *count, "Left port\n");
>> +                break;
>> +            case POS_CENTER:
>> +                *count += sysfs_emit_at(buf, *count, "Center port\n");
>> +                break;
>> +            case POS_RIGHT:
>> +                *count += sysfs_emit_at(buf, *count, "Right port\n");
>> +                break;
>> +            default:
>> +                *count += sysfs_emit_at(buf, *count, "Undefined\n");
>> +                break;
>> +            };
>> +            damage_detected = true;
>> +        }
>> +    }
>> +    return damage_detected;
>> +}
>> +
>> +/* sysfs type-c damage detection detail */
>> +static ssize_t hwdd_detail_show(struct device *dev,
>> +                struct device_attribute *attr,
>> +                char *buf)
>> +{
>> +    bool damage_detected = false;
>> +    unsigned int damage_status;
>> +    int err, count = 0;
>> +
>> +
>> +    if (ucdd_supported) {
>> +        /* Get USB TYPE-C damage status */
>> +        err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
>> +        if (err)
>> +            return err;
>> +
>> +        if (display_damage(buf, &count, "Type-C", damage_status))
>> +            damage_detected = true;
>> +    }
>
> Since this is always visible aren't you missing a case for 
> !ucdd_supported?  I would think you should be returning -ENODEV.

In actual, this condition should never occur as only USB Type-C is 
supported  in this ASL method but i think it's ok to add this check, if 
there is any benefit.

In this case, is it recommended to add such case like  !ucdd_supported?

Also, if new device id like type-a etc..  is added in future then we 
need to include corresponding device id supported also in this check to 
make sysfs visible.

>
> Although arguably it would be better to control visibility of the 
> sysfs attribute based upon ucdd_supported.  You can simplify 
> hwdd_detail_show() too then.

If new device id is added in future then we need to add additional flag 
to control visibility of sysfs .

At this moment , i cant see anything obvious to be simplified 
in hwdd_detail_show() . Did i missed something ?

>
>
>> +
>> +    if (!damage_detected)
>> +        count += sysfs_emit_at(buf, count, "No damage detected\n");
>> +
>> +    return count;
>> +}
>> +
>> +/* sysfs typc damage detection capability */
>>   static ssize_t hwdd_status_show(struct device *dev,
>>                   struct device_attribute *attr,
>>                   char *buf)
>> @@ -11134,9 +11238,11 @@ static ssize_t hwdd_status_show(struct 
>> device *dev,
>>       return sysfs_emit(buf, "0\n");
>>   }
>>   static DEVICE_ATTR_RO(hwdd_status);
>> +static DEVICE_ATTR_RO(hwdd_detail);
>>     static struct attribute *hwdd_attributes[] = {
>>       &dev_attr_hwdd_status.attr,
>> +    &dev_attr_hwdd_detail.attr,
>>       NULL
>>   };
> Thank you !
