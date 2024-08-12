Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441B71494B8
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 16:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723478431; cv=none; b=Jvfb/f08iTXnmjvdIK1xpPKTQs3RVFznfBqMdq+ThoCsjlWu6pMRHZ23YBBXxna0tUZ3tTChCz3sCtixulDFJdJCf3jWrAniZrBk3lnjnJJHeWtl8FieuycTHjvXJzMUtGFXrcMEpPa1nWCojQJMaS4HGQ5azS1xZv5ce8g0Vwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723478431; c=relaxed/simple;
	bh=LBMcTtgEQGxFX641bMhxxGyPQ6TpqdKbwfhNnktHFpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cmIyZWBpVgSlMPoSJDGA56nORccx7fIdcymkx4lSz59Zi7AbzcT/z0gcqZrNdY4gpPsHknvyllGXA0uJex+Pzayl8zY9eTGdH3JqMVjoZ9RbhJHf1XPzyGjtMK3cx58A1VMaoh9kkw6EY89r9FG8DbDndEl6UttoSPgQCZ9eONQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=If0OWjSX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="If0OWjSX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723478429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aCjfCE/5ugfX8NCZ+9pGookJgcS2x7h/ooQyXNL61y4=;
	b=If0OWjSX+glvOWmrJ17FbgkIOqqo39eUZWPsBU7Y8H5obCUDfH0At9nfVtx3oIfLfiU7ad
	Pxj3lj0Lu5gylJ7ZDvSMzLEAOgye/W8wZtZxTErP0asRIPYADblivT+6yiM5RfjkvyTd7d
	42ChMo1Xu7BYXO7XXGk69oPSLrJaqeY=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-1pn2PT4ONzyJR5Dr_6W9dA-1; Mon, 12 Aug 2024 12:00:24 -0400
X-MC-Unique: 1pn2PT4ONzyJR5Dr_6W9dA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52eff760f37so5349579e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 09:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723478422; x=1724083222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCjfCE/5ugfX8NCZ+9pGookJgcS2x7h/ooQyXNL61y4=;
        b=QEH5NBcKKzvDS1n9dyth5s5XVhlM+8p7vvpa99pTEraIGNkRqVfwyb5uYMKI5X+vtE
         uCtTTsD1Nz8QODhiKscwa9sJYHWpB+2qPkwmQlozvWZd2AxdfeAvwBkVqPEV0ER1OcHG
         qGbJMUrzAVF6hehDacnbFBV38xQbOfskdM1vYRLcbKWNqNbZT7s0jkrvMPx+IayhVLGj
         zVqeiKIx8SVMoG+LaccHiIUwqvLZE+JE+m9dgE02imEISzrRFFslY7vByR4ZbH/LXFRu
         HdV28fCtL8vbFg1XxrC6n7B/hTFIrkXT8LV3NXzMdMRlNTCECfq1cXSlRYACtHDPHaM2
         ZhMw==
X-Forwarded-Encrypted: i=1; AJvYcCUiBgHJphGKH2SEKgpwOANkWNc5IPx22SFEzIrOTZIhAHaxzzBGjBOAwcKXxXaepGMNIBjDEmbIJRYEhGkyGdEdR/jh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+dvIml2ZSLnb1OAa67dTGXBD3TY4kppWzu6FFkmv5IX7J56KA
	+mtTrfYK4qfaL+6gcAqKWE2xUhSMNYQLFcFWm8gwRzx2gCXP569mi+88bn01IANEI/H8q+MHSsd
	wkGv/Q0y1pNh3Il5AQLwlTs8vHYBsN+j8bfS7SAWjgkW8teEjs0yRAe7fWHA+BQMb0xT9v7g=
X-Received: by 2002:a05:6512:33cb:b0:52e:eacd:bc05 with SMTP id 2adb3069b0e04-532136a4efdmr340674e87.61.1723478422197;
        Mon, 12 Aug 2024 09:00:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp80GLThiR3tlHa9/PsbFmgOZMY8q0CE3u1d/qWUz8W32apuaSJibZIFNMUl+Je7JK2w79tw==
X-Received: by 2002:a05:6512:33cb:b0:52e:eacd:bc05 with SMTP id 2adb3069b0e04-532136a4efdmr340641e87.61.1723478421613;
        Mon, 12 Aug 2024 09:00:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd187f4e19sm2195651a12.20.2024.08.12.09.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 09:00:21 -0700 (PDT)
Message-ID: <3a4f4c6c-3069-412e-9c71-b4e0308fccd4@redhat.com>
Date: Mon, 12 Aug 2024 18:00:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240805133708.160737-1-hdegoede@redhat.com>
 <20240805133708.160737-5-hdegoede@redhat.com>
 <CAHp75VeCVCqmG0Px8_EyztS6ZeBbhU0Nbtru5mkQxKNeR6pynQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeCVCqmG0Px8_EyztS6ZeBbhU0Nbtru5mkQxKNeR6pynQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

Thank you for the reviews.

On 8/5/24 10:48 PM, Andy Shevchenko wrote:
> On Mon, Aug 5, 2024 at 3:38 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Various Dell laptops have an lis3lv02d freefall/accelerometer sensor.
>> The lis3lv02d chip has an interrupt line as well as an I2C connection to
>> the system's main SMBus.
>>
>> The lis3lv02d is described in the ACPI tables by an SMO88xx ACPI device,
>> but the SMO88xx ACPI fwnodes are incomplete and only list an IRQ resource.
>>
>> So far this has been worked around with some SMO88xx specific quirk code
>> in the generic i2c-i801 driver, but it is not necessary to handle the Dell
>> specific instantiation of i2c_client-s for SMO88xx ACPI devices there.
>>
>> The kernel already instantiates platform_device-s for these with an
>> acpi:SMO88xx modalias. The drivers/platform/x86/dell/dell-smo8800.c
>> driver binds to this platform device but this only deals with
>> the interrupt resource. Add a drivers/platform/x86/dell/dell-lis3lv02d.c
>> which will matches on the same acpi:SMO88xx modaliases and move
>> the i2c_client instantiation from the generic i2c-i801 driver there.
>>
>> Moving the i2c_client instantiation has the following advantages:
>>
>> 1. This moves the SMO88xx ACPI device quirk handling away from the generic
>> i2c-i801 module which is loaded on all Intel x86 machines to a module
>> which will only be loaded when there is an ACPI SMO88xx device.
>>
>> 2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) table
>> between the i2c-i801 and dell-smo8800 drivers.
>>
>> 3. This allows extending the quirk handling by adding new code and related
>> module parameters to the dell-lis3lv02d driver, without needing to modify
>> the i2c-i801 code.
> 
> ...
> 
>> +static void instantiate_i2c_client(struct work_struct *work)
>> +{
>> +       struct i2c_board_info info = { };
>> +       struct i2c_adapter *adap = NULL;
>> +
>> +       if (i2c_dev)
>> +               return;
>> +
>> +       bus_for_each_dev(&i2c_bus_type, NULL, &adap, find_i801);
>> +       if (!adap)
>> +               return;
> 
> May i2c_for_each_dev() be used here?

The main difference between i2c_for_each_dev() and
bus_for_each_dev() is that i2c_for_each_dev() holds
the i2c core mutex while it is calling the passed
in callback.

And find_i801() calls i2c_get_adapter() which also
takes the i2c core mutex, so i2c_for_each_dev()
cannot be used here since then things deadlock.

> 
>> +       info.addr = i2c_addr;
>> +       strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
>> +
>> +       i2c_dev = i2c_new_client_device(adap, &info);
>> +       if (IS_ERR(i2c_dev)) {
>> +               pr_err("error %ld registering i2c_client\n", PTR_ERR(i2c_dev));
>> +               i2c_dev = NULL;
>> +       } else {
>> +               pr_debug("registered lis3lv02d on address 0x%02x\n", info.addr);
>> +       }
>> +
>> +       i2c_put_adapter(adap);
>> +}
> 
> ...
> 
>> +static int __init match_acpi_device_ids(struct device *dev, const void *data)
>> +{
>> +       const struct acpi_device_id *ids = data;
> 
> Wondering if this is needed. Can the compiler implicitly cast const
> void * to the const something * ?

I have just tried this and the compiler is happy with the ids variable
dropped, so I'll use that for v8.

Regards,

Hans




