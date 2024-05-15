Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2404F3BB4D
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 May 2024 13:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715778907; cv=none; b=R06ZQSZUATq6IcjeXG6Z/jN4PcGQSktAGn7mwnV3A/6Qa9+cC8+v5gXzC93+cR0nau6F8rbor2bW/cNsX8U/oEGoStTLkaMEmyCw5AGRwhxnOMiVVSppuYfuWhFiBKn7XtchZafn7PCdFx4Yju956Vwqy0CGmhwmo6qFS0VqL2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715778907; c=relaxed/simple;
	bh=VFAPR4dGRlWWzdN4elkjEIPoB8oat2C+d92N8ve8YOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/maWyb8aEBYaOiP1UpLtWqD7Pd7c+XzYwJG9pX+R7T7xuvqx1/OsIKh4t28jQFAJ/eb/fqOj1lznsTkt5awPYgDJVeftl8/eZtDNHbUJcwN0eUZe0DIGu1xJ2XzkfVTCaxnHPgPXx+jA4j1MI3I34EXuAPSChn0tNJOL1jWiXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qfvay7WS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qfvay7WS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715778904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xh7CpTSy8nr/YyU/5Wk1KHdIIcUDZXXmSnLScAwK89w=;
	b=Qfvay7WSh5+Wz6CtHMwBmpDCFrSbYxdpI1hFDnScdK+A7dGJIToEX/Q8JlbK/BeqniMPBg
	xrE1w4MFnyCdgpmV87rJZse+u5SgsvpTEFL02n/JslatVRkwJ/GZTA8evBiLH6dcvHyZa6
	QpcP7p54+vGywIoBHczRpE/iVy9GnoU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-g9vgMmSMOXix7HnwvolBEw-1; Wed, 15 May 2024 09:15:03 -0400
X-MC-Unique: g9vgMmSMOXix7HnwvolBEw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-56c1ac93679so1763280a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 May 2024 06:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715778902; x=1716383702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh7CpTSy8nr/YyU/5Wk1KHdIIcUDZXXmSnLScAwK89w=;
        b=EtXKNUrAqMbWBj0Jb62FdkIJ5paKzgCcH1SIPI9eWid9mnWk5etCdnIQpazf8ZNPAr
         bz7RDiy2kjvT942vgE/O/JDHDSMn7uDMUqhATMm1fqS4fDsuNsKgND3G58E1Drc3yCsT
         kuywipCCWRHetkCvGsev2l8oe5Gc3jWYcY8vAytdbDiokJAgVbnpwliQYQjuOnwsCLfj
         djUovk0pVF8WWsnjxfeXzhnUc4dsbIHLUlhcyX2NVNIpAJ3TjRPCiEsUN5XWyxFa0KML
         +mXhelrT5kmc0toV+YDV10/yb6AWsDxnv4L97Iy8bjvlxEj+pUPoL1KAQgyy67eDi9g+
         R0Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVjVfrUsMZq4hSbkR6MNSza8+8Js2JvMr3NzDGqmTjwZVX45E92VQc6zKBlyytBPxAtW/48wYY6o6tY80qSn7YU4wdEjHMeG9QdwHxcv8HlyRXJJg==
X-Gm-Message-State: AOJu0Yyx74v1ubnvWmSqL1JMgpj8Axn39z2siOKf/bteYeClGrTvcI6C
	6oltoT8vdjHG4PMm3vw2DaDhpLJB6twdStrnu6FDdGbilCq1jP4+vcJx5aMQWZsAYLEiL2DfcRA
	CJYPZfHr8L9dtXNm9PfECQz6QyzGiJ1xO1WfYH7AQCXriYxUIUcir9rPmfKAXh/r/BibjD+A=
X-Received: by 2002:a50:9f44:0:b0:572:72ff:da35 with SMTP id 4fb4d7f45d1cf-5734d5cc9b8mr9798289a12.12.1715778902106;
        Wed, 15 May 2024 06:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEklQ4gSJ2h8tkobO52OortbYFZMIHTH3VR1HwWSyDD/UCPdSyzBgmoo80AypS3YbCMOansA==
X-Received: by 2002:a50:9f44:0:b0:572:72ff:da35 with SMTP id 4fb4d7f45d1cf-5734d5cc9b8mr9798270a12.12.1715778901691;
        Wed, 15 May 2024 06:15:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-574bcad0362sm5740270a12.20.2024.05.15.06.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 06:15:01 -0700 (PDT)
Message-ID: <a2074a60-1d95-4366-9868-9bda4503f9d4@redhat.com>
Date: Wed, 15 May 2024 15:15:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: Add new MeeGoPad ANX7428 Type-C Cross
 Switch driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20240514180343.70795-1-hdegoede@redhat.com>
 <CAHp75Vdb3_yHmS1A0cixKGRXHu_aUg0a7+cXLvtQFT-DumDQgA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vdb3_yHmS1A0cixKGRXHu_aUg0a7+cXLvtQFT-DumDQgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/15/24 6:53 AM, Andy Shevchenko wrote:
> On Tue, May 14, 2024 at 9:03 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Some MeeGoPad top-set boxes have an ANX7428 Type-C Switch for USB3.1 Gen 1
>> and DisplayPort over Type-C alternate mode support.
>>
>> The ANX7428 has a microcontroller which takes care of the PD negotiation
>> and automatically sets the builtin Crosspoint Switch to send the right
>> signal to the 4 highspeed pairs of the Type-C connector. It also takes
>> care of HPD and AUX channel routing for DP alternate mode.
>>
>> IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
>> things look like there simple is a USB-3 Type-A connector and a
>> separate DisplayPort connector. Except that the BIOS does not
>> power on the ANX7428 at boot (meh).
>>
>> Add a driver to power on the ANX7428. This driver is added under
>> drivers/platform/x86 rather than under drivers/usb/typec for 2 reasons:
>>
>> 1. This driver is specifically written to work with how the ANX7428 is
>> described in the ACPI tables of the MeeGoPad x86 (Cherry Trail) devices.
>>
>> 2. This driver only powers on the ANX7428 and does not do anything wrt
>> its Type-C functionality. It should be possible to tell the controller
>> which data- and/or power-role to negotiate and to swap the role(s) after
>> negotiation but the MeeGoPad top-set boxes always draw their power from
>> a separate power-connector and they only support USB host-mode. So this
>> functionality is unnecessary and due to lack of documentation this is
>> tricky to support.
> 
> ...
> 
>> + * DisplayPort over Type-C alternate mode support.
>> + *
>> + * The ANX7428 has a microcontroller which takes care of the PD
>> + * negotiation and automatically sets the builtin Crosspoint Switch
>> + * to send the right signal to the 4 highspeed pairs of the Type-C
>> + * connector. It also takes care of HPD and AUX channel routing for
>> + * DP alternate mode.
>> + *
>> + * IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
>> + * things look like there simple is a USB-3 Type-A connector and a
> 
> simply
> 
>> + * separate DisplayPort connector. Except that the BIOS does not
>> + * power on the ANX7428 at boot. This driver takes care of powering
>> + * on the ANX7428.
>> + *
>> + * It should be possible to tell the micro-controller which data- and/or
>> + * power-role to negotiate and to swap the role(s) after negotiation
>> + * but the MeeGoPad top-set boxes always draw their power from a separate
>> + * power-connector and they only support USB host-mode. So this functionality
>> + * is unnecessary and due to lack of documentation this is tricky to support.
>> + *
>> + * For a more complete ANX7428 driver see drivers/usb/misc/anx7418/ of
>> + * the LineageOS kernel for the LG G5 (International) aka the LG H850:
>> + * https://github.com/LineageOS/android_kernel_lge_msm8996/
> 
> ...
> 
>> +#include <linux/acpi.h>
>> +#include <linux/bits.h>
>> +#include <linux/delay.h>
> 
> + dev_printk.h
> 
>> +#include <linux/dmi.h>
> 
> + err.h
> 
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/module.h>
> 
> + types.h
> 
> ...
> 
>> +static struct i2c_driver anx7428_driver = {
>> +       .driver = {
>> +               .name = "meegopad_anx7428",
>> +               .acpi_match_table = anx7428_acpi_match,
>> +       },
>> +       .probe = anx7428_probe,
>> +};
> 
>> +
> 
> Unneeded blank line.
> 
>> +module_i2c_driver(anx7428_driver);
> 
> ...
> 
> You can fold the above into the current one, no need to resend.

Thank you for the review.

I've squashed fixes for all of these into the existing commit.

Regards,

Hans


