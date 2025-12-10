Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2631283A
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Dec 2025 16:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765385538; cv=none; b=V0A0XkSDGP3ikF5r8/zbATs4d2iBPBcd/wmoVCAobDXekF4iF4aSlMIfCCfMS5GqC8gOqBhE+21e1BnCahlw5GDdUjF7LVUI5+4K4mCvKzpphttOVTNCeGaYxvcpGkWreSZdqOl4J17+CheCYJEI7HoFwRAMh3tWfGiwMqA4KZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765385538; c=relaxed/simple;
	bh=mBs481MNefzQs/v1ekESn4qJv3QhLVjKRkcQ1gA5/qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8fEeFk3wGbZ4p11s4rmsMM+4yvOF3S6DfJiRI8X+sJ7kbPw5jfSBoVh0n4o3Mi5tY6TOgDZ6L9/6yqBS9N0GVd7tuF69Kiid9Msrv+j3zFB45AD5zemMQTWs89v3WfYw6wd5d41KPGqcWpVNcpzwWpdJ0BgxmX1tH18q7w7LHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxbV0Kwm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxbV0Kwm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297ef378069so680505ad.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Dec 2025 08:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765385533; x=1765990333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0a8RfD/jSfc8VamWXpS1tofTmW2Pstb5lS3Wb7N0q0=;
        b=XxbV0KwmlmMrNv2/aiCfXCnb2t8xe01GU5Bmp6hrJKq3E3mW+gczTRTC7NNg4ryWWF
         uiRA3ITGh5ACnq5oQSi0QBe9AibmOK5AMmM6pdBmZ7JwqViaODL24S0pXFI7JXG9pY4p
         +6Z90QfDi0i2s80a8u0hnAA+HpPMFzc67wjRK0sOCfmgansVHvLN4iVJkxFa903lKXh8
         rcFo4OsGlUg68XKRWQ5QqI5tspQ1CTtR9+5KV4yOhDGkeFzRAtohEBGHFRMVPvDnCzt+
         1yScSOpl4nPwdIqwUEMxAmKQoEf/UQLoiyJZeyicj0sWHlq7IovwxIW33hPAmmLlxEiH
         IyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765385533; x=1765990333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0a8RfD/jSfc8VamWXpS1tofTmW2Pstb5lS3Wb7N0q0=;
        b=OIJrWKgXug/m8xlOKphT7FFYi8/7Z7IKrDOMx+bNLCYs0mgyj3/5HAUAHrtpyu+wlN
         B/l8exP0EfXUlYQ9T9bYlwSA1xScWhcCzsKbTHSBjUu5zLZtzYrUKkd5tfWvcU0Mn2aA
         tnQdIT+75WdJ57IUOKsEKfiTdrNzkYZBhU5mEAwDrKh5SM9qQFlnMjEpLpHN38XdpzmO
         pyOUjtWWGUNSUFYrQfcBNVHAqQjCYaqG/B2ZCgXuKGwFLmN4tzjf+wXNEISNKokmV/OX
         VfEI972wxhim8ixcGEgkFe9/hLxdv2IWqHYobdjTArtnbo0Glccl8eMIDNUgJpXiDwJE
         9V/g==
X-Gm-Message-State: AOJu0YzBW8BogmFbP8EhBFXy2zEEc6srnn2IHqZty6mSfU9y31l1Bl/+
	K1XbPe7OijZ12Wdv8v0TgeZIDY5y3QTvreaZ1BqvPZBiYKNwBTT3yYuW
X-Gm-Gg: AY/fxX6MsHCQQDqJvNULOdow1V0iWFWtOR1/fwUGQ21U1y333OWZZCQvgEOKNRdkwDD
	CA93RGp6CeIPnl+sfq7fG48F0eA28bJ+CXk44SwzSMLXt/LWDN2hdswkORP5ImXru9xN+a4ITRk
	fFJlCjz+VcFoTSM6XhFhAVJOjVgxSYkMzKIvowCn4/h7vhI7FOwxArKVFH7FAl13OFNBltVj1Gf
	FodWSE0GxNiqBFhyoxZl/HeDotM6b9KpzHg/0hy/sptmyXWuGh+rPXfpz1szbb/1m23z9cIzTnp
	TMXjChUNf839yZu1nzGW+7BY+9GrDG7h0dMyzdS4tRj49q55G/R/sZEDRtKCdgKWIehmVRYII1N
	m53yLICZHVj0gsu0akU2zAVaRibnuCTVoMTHZqPmwf1xFl2y880oS3OeHwCMGCN03C2mc+n0h32
	92A9bkEDkoUR6Iw3nNXSqmyP/HWdNkMSnYtVs02TZI78APVzE=
X-Google-Smtp-Source: AGHT+IEEjE2Uz9MtbQ/oxJ58Q1TbxQgjnQFpFz0prtLGZggwWtg9ULVWDpHSUPhy+CeG1B9Pg+eRWQ==
X-Received: by 2002:a17:903:1aab:b0:295:86a1:5008 with SMTP id d9443c01a7336-29ec259e125mr29898665ad.38.1765385533150;
        Wed, 10 Dec 2025 08:52:13 -0800 (PST)
Received: from ?IPV6:240f:102:8600:1:e5ea:73e5:ae85:d6b? ([240f:102:8600:1:e5ea:73e5:ae85:d6b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49c96bsm187160235ad.8.2025.12.10.08.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 08:52:12 -0800 (PST)
Message-ID: <28eb21b4-6bd6-4129-895f-b6ccefd4c639@gmail.com>
Date: Thu, 11 Dec 2025 01:52:09 +0900
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
 <d7b9167d-ddb2-4bec-b294-513010501ca9@gmail.com>
 <198f751e-7178-4363-a849-a6b0abd42016@amd.com>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <198f751e-7178-4363-a849-a6b0abd42016@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/11/25 01:44, Mario Limonciello wrote:
> On 12/10/25 10:27 AM, Nitin wrote:
>> Hi Mario,
>>
>> Thank you for your comments.
>>
>> On 12/11/25 00:43, Mario Limonciello wrote:
>>> On 12/10/25 9:11 AM, Nitin Joshi wrote:
>>>> Add new sysfs interface to identify the impacted component with 
>>>> location of
>>>> device.
>>>>
>>>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
>>>> ---
>>>>   .../admin-guide/laptops/thinkpad-acpi.rst     |  13 +-
>>>>   drivers/platform/x86/lenovo/thinkpad_acpi.c   | 112 
>>>> +++++++++++++++++-
>>>>   2 files changed, 121 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/ 
>>>> Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>> index 94349e5f1298..3a9190ac47d0 100644
>>>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>> @@ -1580,7 +1580,7 @@ Documentation/ABI/testing/sysfs-class-power.
>>>>   Hardware damage detection capability
>>>>   -----------------
>>>>   -sysfs attributes: hwdd_status
>>>> +sysfs attributes: hwdd_status, hwdd_detail
>>>>     Thinkpads are adding the ability to detect and report hardware 
>>>> damage.
>>>>   Add new sysfs interface to identify the damaged device status.
>>>> @@ -1594,6 +1594,17 @@ This value displays status of device damaged
>>>>   - 0 = Not Damaged
>>>>   - 1 = Damaged
>>>>   +The command to check location of damaged device is::
>>>> +
>>>> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_detail
>>>> +
>>>> +This value displays location of damaged device having 1 line per 
>>>> damaged "item".
>>>> +For example:
>>>> +if no damage is detected:
>>>> +  No damage detected
>>>> +if damage detected:
>>>> +  TYPE-C: Base, Right side, Center port
>>>> +
>>>>   The property is read-only. If feature is not supported then sysfs
>>>>   attribute is not created.
>>>>   diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
>>>> b/drivers/ platform/x86/lenovo/thinkpad_acpi.c
>>>> index 4cf365550bcb..a092d57d995d 100644
>>>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>>>> @@ -11089,8 +11089,24 @@ static const struct attribute_group 
>>>> auxmac_attr_group = {
>>>>   #define HWDD_NOT_SUPPORTED    BIT(31)
>>>>   #define HWDD_SUPPORT_USBC    BIT(0)
>>>>   -#define PORT_STATUS        GENMASK(7, 4)
>>>> -#define NUM_PORTS        4
>>>> +#define PORT_STATUS     GENMASK(7, 4)
>>>> +#define LID_STATUS      GENMASK(11, 8)
>>>> +#define BASE_STATUS     GENMASK(15, 12)
>>>> +#define POS_STATUS      GENMASK(3, 2)
>>>> +#define PANEL_STATUS    GENMASK(1, 0)
>>>> +
>>>> +#define PORT_DETAIL_OFFSET    16
>>>> +
>>>> +#define PANEL_TOP    0
>>>> +#define PANEL_BASE    1
>>>> +#define PANEL_LEFT    2
>>>> +#define PANEL_RIGHT    3
>>>> +
>>>> +#define POS_LEFT    0
>>>> +#define POS_CENTER    1
>>>> +#define POS_RIGHT    2
>>>> +
>>>> +#define NUM_PORTS    4
>>>>     static bool hwdd_support_available;
>>>>   static bool ucdd_supported;
>>>> @@ -11108,7 +11124,95 @@ static int hwdd_command(int command, int 
>>>> *output)
>>>>       return 0;
>>>>   }
>>>>   -/* sysfs type-c damage detection capability */
>>>> +static bool display_damage(char *buf, int *count, char *type, 
>>>> unsigned int dmg_status)
>>>> +{
>>>> +    unsigned char lid_status, base_status, port_status;
>>>> +    unsigned char loc_status, pos_status, panel_status;
>>>> +    bool damage_detected = false;
>>>> +    int i;
>>>> +
>>>> +    port_status = FIELD_GET(PORT_STATUS, dmg_status);
>>>> +    lid_status = FIELD_GET(LID_STATUS, dmg_status);
>>>> +    base_status = FIELD_GET(BASE_STATUS, dmg_status);
>>>> +    for (i = 0; i < NUM_PORTS; i++) {
>>>> +        if (!(dmg_status & BIT(i)))
>>>> +            continue;
>>>> +
>>>> +        if (port_status & BIT(i)) {
>>>> +            *count += sysfs_emit_at(buf, *count, "%s: ", type);
>>>> +            loc_status = (dmg_status >> (PORT_DETAIL_OFFSET + (4 * 
>>>> i))) & 0xF;
>>>> +            pos_status = FIELD_GET(POS_STATUS, loc_status);
>>>> +            panel_status = FIELD_GET(PANEL_STATUS, loc_status);
>>>> +
>>>> +            if (lid_status & BIT(i))
>>>> +                *count += sysfs_emit_at(buf, *count, "Lid, ");
>>>> +            if (base_status & BIT(i))
>>>> +                *count += sysfs_emit_at(buf, *count, "Base, ");
>>>> +
>>>> +            switch (pos_status) {
>>>> +            case PANEL_TOP:
>>>> +                *count += sysfs_emit_at(buf, *count, "Top, ");
>>>> +                break;
>>>> +            case PANEL_BASE:
>>>> +                *count += sysfs_emit_at(buf, *count, "Bottom, ");
>>>> +                break;
>>>> +            case PANEL_LEFT:
>>>> +                *count += sysfs_emit_at(buf, *count, "Left, ");
>>>> +                break;
>>>> +            case PANEL_RIGHT:
>>>> +                *count += sysfs_emit_at(buf, *count, "Right, ");
>>>> +                break;
>>>> +            default:
>>>> +                pr_err("Unexpected value %d in switch 
>>>> statement\n", pos_status);
>>>> +            };
>>>> +
>>>> +            switch (panel_status) {
>>>> +            case POS_LEFT:
>>>> +                *count += sysfs_emit_at(buf, *count, "Left port\n");
>>>> +                break;
>>>> +            case POS_CENTER:
>>>> +                *count += sysfs_emit_at(buf, *count, "Center 
>>>> port\n");
>>>> +                break;
>>>> +            case POS_RIGHT:
>>>> +                *count += sysfs_emit_at(buf, *count, "Right port\n");
>>>> +                break;
>>>> +            default:
>>>> +                *count += sysfs_emit_at(buf, *count, "Undefined\n");
>>>> +                break;
>>>> +            };
>>>> +            damage_detected = true;
>>>> +        }
>>>> +    }
>>>> +    return damage_detected;
>>>> +}
>>>> +
>>>> +/* sysfs type-c damage detection detail */
>>>> +static ssize_t hwdd_detail_show(struct device *dev,
>>>> +                struct device_attribute *attr,
>>>> +                char *buf)
>>>> +{
>>>> +    bool damage_detected = false;
>>>> +    unsigned int damage_status;
>>>> +    int err, count = 0;
>>>> +
>>>> +
>>>> +    if (ucdd_supported) {
>>>> +        /* Get USB TYPE-C damage status */
>>>> +        err = hwdd_command(HWDD_GET_DMG_USBC, &damage_status);
>>>> +        if (err)
>>>> +            return err;
>>>> +
>>>> +        if (display_damage(buf, &count, "Type-C", damage_status))
>>>> +            damage_detected = true;
>>>> +    }
>>>
>>> Since this is always visible aren't you missing a case for ! 
>>> ucdd_supported?  I would think you should be returning -ENODEV.
>>
>> In actual, this condition should never occur as only USB Type-C is 
>> supported  in this ASL method but i think it's ok to add this check, 
>> if there is any benefit.
>>
>> In this case, is it recommended to add such case like  !ucdd_supported?
>>
>> Also, if new device id like type-a etc..  is added in future then we 
>> need to include corresponding device id supported also in this check 
>> to make sysfs visible.
>>
>>>
>>> Although arguably it would be better to control visibility of the 
>>> sysfs attribute based upon ucdd_supported.  You can simplify 
>>> hwdd_detail_show() too then.
>>
>> If new device id is added in future then we need to add additional 
>> flag to control visibility of sysfs .
>>
>> At this moment , i cant see anything obvious to be simplified 
>> in hwdd_detail_show() . Did i missed something ?
>
> Well my comment was specifically upon visibility. If you avoid 
> attribute being visible conditional on ucdd_supported, you don't need 
> to actually check this in *_show().

Ack !

  I will include case for !ucdd_supported in next version. Thank you !

>>
>>>
>>>
>>>> +
>>>> +    if (!damage_detected)
>>>> +        count += sysfs_emit_at(buf, count, "No damage detected\n");
>>>> +
>>>> +    return count;
>>>> +}
>>>> +
>>>> +/* sysfs typc damage detection capability */
>>>>   static ssize_t hwdd_status_show(struct device *dev,
>>>>                   struct device_attribute *attr,
>>>>                   char *buf)
>>>> @@ -11134,9 +11238,11 @@ static ssize_t hwdd_status_show(struct 
>>>> device *dev,
>>>>       return sysfs_emit(buf, "0\n");
>>>>   }
>>>>   static DEVICE_ATTR_RO(hwdd_status);
>>>> +static DEVICE_ATTR_RO(hwdd_detail);
>>>>     static struct attribute *hwdd_attributes[] = {
>>>>       &dev_attr_hwdd_status.attr,
>>>> +    &dev_attr_hwdd_detail.attr,
>>>>       NULL
>>>>   };
>>> Thank you !
>
