Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B413D8B1
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 18:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731523157; cv=none; b=Pjl/0RA7c/mjgK2lLlKrAn8H/QiNl16oWxiSHrlv9cuzeP4CiLPbpdBEcpf3cgWi1m9RAjfWkh6pG1r5dRKB5/Ov+2r91mHJLI3Jkv9TEkUPIowA5RJ7FCVEA4c6Tb/mvVu0Ju8OcV4cRvKsDwEtgiiSlHzBF5O9TiagdfmHPr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731523157; c=relaxed/simple;
	bh=jjuVdWU7zSVeYxbOflUlo5CQAJpwgAMude4YJp+CV+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1oMEZcRd+wxA7+88yKmDLa/L3jyfEF6dRuu4bor/3/tUX8AuGBWljl0WyLK+4w74H3O/L19bNPmbSK1OT1POrMiq6mXdl+RWFXkfXGNy8v+K9tiWTAeqgS7hdBYue9IbrKcrRy1CZu+ENtE37pXV4vED48iIQSAQmREKe2W/Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=beBquw/T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="beBquw/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731523154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mcbkjwECU8Y7+6lafe9yZ7pyaau+st73Hne50Zv2aPo=;
	b=beBquw/TyDUyaihWyBlE4QrbF+8hL+YCUtsnGXky+Xft3cB0BfyTClXeUf7aLo+YjjFCHN
	91dRWBN//0iHUvTMoFBf1Shg6nqwy9NjSEZVv9+OeHUsxQT+6k6YgXttvqUW6bMqKcvKat
	zZA2UrM69oHHfMZ9iEUmUFZzy5zYF6w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-yrJtUc_uOWa-2eK56t3HPg-1; Wed, 13 Nov 2024 13:39:12 -0500
X-MC-Unique: yrJtUc_uOWa-2eK56t3HPg-1
X-Mimecast-MFC-AGG-ID: yrJtUc_uOWa-2eK56t3HPg
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c947d9afc9so5878136a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 10:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731523152; x=1732127952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mcbkjwECU8Y7+6lafe9yZ7pyaau+st73Hne50Zv2aPo=;
        b=HrO6ObP+XD+jMdf4fCKJ3xcQ2rbxvtKeGkizN4q9tBTTFBRP3SxUnmQxm4Aeq7z4zs
         Lt4zxUVf04hmcR+hTgs/vgOGXh0dbyTryOgB/n1B0nb8GVafXjiefLKzMV5c17EF/GTt
         qikUXUwwtSRa5B1A1Q37sPsuz7dewNvzifuKNw6gtoXR+edo5GQOOCuYcpQrqhnKmcwK
         aSHVVrplgklluuy7EyI2tQcAM77YICIRA7x1J58xMUzx5dYHDH42usNUuS6ImU3BhXP1
         ZqbqlzOM8JRoDK3H3Zjg10Gl8VWWAqBLXkxpnSTtaeZXSP+Uqy0/mrxDW7vi2ZsVK8TM
         mZmA==
X-Forwarded-Encrypted: i=1; AJvYcCW97k85We/tRZWJacqxIDg/UAb4bbDJaN9jQBhNmOOutGeD8yB1aqEhgWXtZ5PAZuQ5uMGNhQv/8HZVFlqCVZ1ekN9w@vger.kernel.org
X-Gm-Message-State: AOJu0YzbLz+hl/oV5ljYXbctLjqpJzgxa8WcWq3cfUTiNkhrGP9SP15G
	OHuheXTEnsPGacrdTFdKBLv9OBoDNo5CLXzsoybvFNfWVEu/Ub7I6nB7atiAGn7CjvvZVAUV5tt
	Z4AchVgF6r5Y2JbWxDfBSB6BAAyWFz1eKYzPROJ63Djx3wcdqL4KcI62Mr27OFbQfIhmg3v0=
X-Received: by 2002:a17:907:3e8e:b0:a99:f6ee:1ee3 with SMTP id a640c23a62f3a-aa1f8106245mr365405866b.43.1731523151661;
        Wed, 13 Nov 2024 10:39:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUVqwY6xWiWiUm7kVlrB9M1MSKlS/Lxxyf3kAHg+T0yi0Jz5WlRcSbeJOz0PbOdM7PimsReQ==
X-Received: by 2002:a17:907:3e8e:b0:a99:f6ee:1ee3 with SMTP id a640c23a62f3a-aa1f8106245mr365404466b.43.1731523151268;
        Wed, 13 Nov 2024 10:39:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a17684sm905969266b.34.2024.11.13.10.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 10:39:10 -0800 (PST)
Message-ID: <8d666b0a-a33e-4ee2-9f7f-fbb0a5ffc365@redhat.com>
Date: Wed, 13 Nov 2024 19:39:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Add Vexia EDU ATLA
 10 EC battery driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
References: <20241104203555.61104-1-hdegoede@redhat.com>
 <20241104203555.61104-2-hdegoede@redhat.com>
 <CAHp75Vdkwg4pUs=k-GNv9wxuecVpMromh_F49bbfhYL7sxjwDg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vdkwg4pUs=k-GNv9wxuecVpMromh_F49bbfhYL7sxjwDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 5-Nov-24 11:39 AM, Andy Shevchenko wrote:
> On Mon, Nov 4, 2024 at 10:36 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Vexia EDU ATLA 10 tablet has an embedded controller instead of
>> giving the os direct access to the charger + fuel-gauge ICs as is normal
>> on tablets designed for Android.
>>
>> There is ACPI Battery device in the DSDT using the EC which should work
>> expect that it expects the I2C controller to be enumerated as an ACPI
> 
> expect --> except
> 
>> device and the tablet's BIOS enumerates all LPSS devices as PCI devices
>> (and changing the LPSS BIOS settings from PCI -> ACPI does not work).
>>
>> Add a power_supply class driver for the Atla 10 EC to expert battery info
>> to userspace. This is made part of the x86-android-tablets directory and
>> Kconfig option because the i2c_client it binds to is instantiated by
>> the x86-android-tablets kmod.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thank you for the reviews for both patches. I'll try to prepare a v2
series addressing the small remarks you had tomorrow.

Regards,

Hans




> 
> ...
> 
>>  obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
>> +obj-$(CONFIG_X86_ANDROID_TABLETS) += vexia_atla10_ec.o
> 
> This splits the original (compound) object lines, please move it
> either before (and this seems even better with ordering by name in
> mind) or after this block.
>>
> 
> Actually this blank line gives the false impression that the
> originally two lines are not related. I would drop this blank line as
> well.
> 
>>  x86-android-tablets-y := core.o dmi.o shared-psy-info.o \
>>                          asus.o lenovo.o other.o
> 
> ...
> 
>> +#include <linux/bits.h>
>> +#include <linux/devm-helpers.h>
> 
> + err.h
> 
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/power_supply.h>
>> +#include <linux/types.h>
>> +#include <linux/workqueue.h>
>> +
>> +#include <asm/byteorder.h>
> 
> ...
> 
>> +/* From broken ACPI battery device in DSDT */
>> +#define ATLA10_EC_VOLTAGE_MIN_DESIGN           3750000
> 
> _uV ?
> 
> ...
> 
>> +struct atla10_ec_battery_state {
>> +       u8 len;                         /* Struct length excluding the len field, always 12 */
>> +       u8 status;                      /* Using ACPI Battery spec status bits */
>> +       u8 capacity;                    /* Percent */
>> +       __le16 charge_now;              /* mAh */
>> +       __le16 voltage_now;             /* mV */
>> +       __le16 current_now;             /* mA */
>> +       __le16 charge_full;             /* mAh */
>> +       __le16 temp;                    /* centi degrees celcius */
> 
> Celsius / celsius
> 
>> +} __packed;
>> +
>> +struct atla10_ec_battery_info {
>> +       u8 len;                         /* Struct length excluding the len field, always 6 */
>> +       __le16 charge_full_design;      /* mAh */
>> +       __le16 voltage_now;             /* mV, should be design voltage, but is not ? */
>> +       __le16 charge_full_design2;     /* mAh */
>> +} __packed;
> 
> Instead I would add the respective units to the variable names:
> _mAh
> _mV
> ...etc.
> 
> (* yes, with the capital letters to follow the proper spelling)
> 
> ...
> 
>> +static int atla10_ec_cmd(struct atla10_ec_data *data, u8 cmd, u8 len, u8 *values)
>> +{
>> +       struct device *dev = &data->client->dev;
>> +       int ret;
>> +
>> +       ret = i2c_smbus_read_i2c_block_data(data->client, cmd, len, values);
>> +       if (ret != len) {
>> +               dev_err(dev, "I2C command 0x%02x error: %d\n", cmd, ret);
>> +               return -EIO;
>> +       }
> 
>> +       if (values[0] != (len - 1)) {
> 
> Hmm... AFAIU this is part of SMBus protocol. Why do we need to care
> about this? Or is this an additional header on top of that?
> 
>> +               dev_err(dev, "I2C command 0x%02x header length mismatch expected %u got %u\n",
>> +                       cmd, len - 1, values[0]);
>> +               return -EIO;
>> +       }
>> +
>> +       return 0;
>> +}
> 
> ...
> 
>> +               val->intval = min(charge_now, charge_full) * 1000;
> 
> MILLI (here and below)?
> 
>> +               break;
>> +       case POWER_SUPPLY_PROP_VOLTAGE_NOW:
>> +               val->intval = le16_to_cpu(data->state.voltage_now) * 1000;
>> +               break;
>> +       case POWER_SUPPLY_PROP_CURRENT_NOW:
>> +               val->intval = le16_to_cpu(data->state.current_now) * 1000;
>> +               /*
>> +                * Documentation/ABI/testing/sysfs-class-power specifies
>> +                * negative current for discharing.
> 
> discharging
> 
>> +                */
> 
> --
> With Best Regards,
> Andy Shevchenko
> 

