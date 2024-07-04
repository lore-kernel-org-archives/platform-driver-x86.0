Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1901AB908
	for <platform-driver-x86@vger.kernel.org>; Thu,  4 Jul 2024 10:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720088953; cv=none; b=lj1/2iJSdS7AixpwJf6p9s0wxyK6m/QP0Uv3eP8GUQNryrHfM9rcAtoEdUgLHOgYqgBCS/FfrXUBBHt1leHRTyL41suNbfCU84KQrA4hK32qkn5Rc2LqcX+BqYXs/H2l6PX88huiWv2INCP1D4qwqifW7kKYRpxSbeyZUF9NfCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720088953; c=relaxed/simple;
	bh=0D8z08ExpB4BKnsruvMFbrdP2Lh/HsbGLznWTd0ZamI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpEiMSsx+wXYoets/0sjSEwrg3RKdCLAuODz2jILir+1JH5zQGEBIU4OtYUe9xA2QIj/V0gF1Rzmf3pCExH75g42OKAu2Io35FF+2B3DUmZgqJEoKKRMqT44g0BrL2nQSLhCrSWIbKCZfgula8rxRHDfZL1tRF7roH47G2D8iSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hQUIAUwk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hQUIAUwk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720088950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kwPBkRYs11l1I/mUlPb9LEIZeo7wTk5nsxSD/f9hQkk=;
	b=hQUIAUwkPZ1n8Fo1a5JhesS3PdJaRlfBHZ59EbbeQefteMAgRWigeseMVXrvj+w+wV7zQO
	5yyezBPG+WESyks4xJ2lYEsLGhy+jpoLbAkQYrtMxeeEt7FMImWrnjwwAOcbKm+eoyH9+I
	q/kpgKO26LzGRhQML/GzvezWtvPJ9A8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-yf88YB6zMoutqfMah78_1Q-1; Thu, 04 Jul 2024 06:29:09 -0400
X-MC-Unique: yf88YB6zMoutqfMah78_1Q-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-58d784d316aso245739a12.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Jul 2024 03:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720088948; x=1720693748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kwPBkRYs11l1I/mUlPb9LEIZeo7wTk5nsxSD/f9hQkk=;
        b=cFQLj1o79gswEyYoqBSEDGwYGUQuHp19pUXJJERtCfAuNC8dze9xqvtSjorumk7/A4
         9BAT2R2NNNxQjhs3GnSVeoIFI1Qvc9MQaZB7HE9U0Amm2i/QGRWGKhr7avT4KuDCMAUm
         YqKiFs+uSRLuEKh8uC/3aJexTBQqTnpEt7sEdnlK1ICjLTPD94jut/jdTIYTNggxxYEs
         Lyy9CeqDzmLmXEXCFtKZQXzJn4izEkixs0yUzK46fd78GERuyG0djkTtgS58ixq8qo+f
         QWKeHWQFMH7JtdcBB0j2GPVnsArTkP1KBTwdm6FRG2Xe/1xeOlQLoT24utj+xOzg+5IW
         z1LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz9YGVZ46fzLx1WkQ5LHoQ8Y6iTXqsi6jqG63cZE8PuimpFH6VgjDqw+oP7O87+F1xJBYdHa13IZzT/tXC3F4nRdRdoa33rLtzQtGkSzEs7QzEyg==
X-Gm-Message-State: AOJu0Yw1j0o6jWmSb5A6tuFNrigqhh9Z8tdqIPc9GKcN8ovwSs0WGPzY
	S9X27l85XnVJM/uJ9H2bMUDVpF/dtGcWNLfpaxZbMquXriD7PoTILD8/Il/d/S5zZFSg773WaPB
	p7VGvptEAvPxzOvAacZ3FHej4+1cHxvTHpYfeW6SMdnsQTUNmCi5FLCBJ82P88ZNkiFHFKHs=
X-Received: by 2002:a05:6402:274d:b0:582:8746:6534 with SMTP id 4fb4d7f45d1cf-58e5b898ad5mr1215023a12.28.1720088948123;
        Thu, 04 Jul 2024 03:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPd16uy5eUjJIvxsoRHku6uhwWO0Ff3D8afRU/TcIdDhd0IRPjc/a/RWD9/7KWmPWqjhCKzQ==
X-Received: by 2002:a05:6402:274d:b0:582:8746:6534 with SMTP id 4fb4d7f45d1cf-58e5b898ad5mr1214991a12.28.1720088947693;
        Thu, 04 Jul 2024 03:29:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614d50464sm8208308a12.69.2024.07.04.03.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 03:29:07 -0700 (PDT)
Message-ID: <d4f82aab-f17d-46d7-a1b0-d96af57e3b92@redhat.com>
Date: Thu, 4 Jul 2024 12:29:06 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] i2c-i801 / dell-lis3lv02d: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240624111519.15652-1-hdegoede@redhat.com>
 <20240624182812.fa6akymygv3qolug@pali>
 <a6a554d1-2cdb-4e34-ac07-2778d534b558@redhat.com>
 <20240703184121.t2wh5sb5ki2kwots@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240703184121.t2wh5sb5ki2kwots@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/3/24 8:41 PM, Pali Rohár wrote:
> On Wednesday 03 July 2024 12:58:01 Hans de Goede wrote:
>> Hi,
>>
>> On 6/24/24 8:28 PM, Pali Rohár wrote:
>>> On Monday 24 June 2024 13:15:12 Hans de Goede wrote:
>>>> Hans de Goede (6):
>>>>   i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
>>>>   i2c: i801: Use a different adapter-name for IDF adapters
>>>>   platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to
>>>>     dell-smo8800-ids.h
>>>>   platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
>>>>     from i2c-i801 to dell-lis3lv02d
>>>>   platform/x86: dell-smo8800: Add a couple more models to
>>>>     lis3lv02d_devices[]
>>>>   platform/x86: dell-smo8800: Add support for probing for the
>>>>     accelerometer i2c address
>>>
>>> Patches 1-5 looks good. There are just a few minor things, but you can add
>>> Reviewed-by: Pali Rohár <pali@kernel.org>
>>
>> Thank you.
>>
>>> For patch 6 as I mentioned previously I'm strictly against this change
>>> until somebody goes and politely ask Dell about the current situation of
>>> the discovering of accelerometer's i2c address.
>>
>> Dell is on the Cc and not responding...
> 
> And what do you expecting here? That somebody on the group address
> specified in CC list would react to all your tons of messages? Not
> mentioning the fact that you did not even ask anything.
> 
> This is not how things works.
> 
> If you do not change your attitude here then I highly doubt that
> somebody will respond to you.
> 
> I have feeling that you are doing it on purpose just because you do not
> want to do anything, and trying to find some kind of proof that nobody
> is responding to you, to convince others for merge your last hack change.

p.s.

This is not a hack, please stop with this nonsense about how this
is a hack and super dangerous. It is neither.

Probing for i2c-addresses is something which the kernel has done since
the 199x years. The whole i2c-core has infrastructure for drivers to
indicate which addresses they want the core to probe for them.

This is used by a lot of hwmon i2c drivers since hwmon chips typically
are not described in the ACPI tables.

So userspace manually modprobes these (after a sensors-detect run
setting up the config)  and then when loaded the core will call
these drivers detect() callback for the addresses listed in their
i2c_driver struct.

People using these driver are having the i2c-addresses listed in these
drivers probed (on adapters which indicate they support probing like
i2c-i801) every single boot!

Regards,

Hans









>>> And if there is no other
>>> option than start discussion if Dell can include this information into
>>> DMI / ACPI / WMI or other part of firmware data which they can send from
>>> BIOS/UEFI to operating system.
>>
>> AFAIK newer Dell laptops don't have a freefall sensor anymore since
>> everything has moved to nvme. Even the bigger laptops seems to simply
>> have multiple nvme slots rather then room for a 2.5" HDD. Note I did not
>> research this, this is is my observation from 3 newer Dell laptops which
>> I have access to.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>>>  drivers/i2c/busses/i2c-i801.c                | 133 +-------
>>>>  drivers/i2c/i2c-core-base.c                  |  18 +-
>>>>  drivers/platform/x86/dell/Makefile           |   1 +
>>>>  drivers/platform/x86/dell/dell-lis3lv02d.c   | 331 +++++++++++++++++++
>>>>  drivers/platform/x86/dell/dell-smo8800-ids.h |  26 ++
>>>>  drivers/platform/x86/dell/dell-smo8800.c     |  16 +-
>>>>  6 files changed, 379 insertions(+), 146 deletions(-)
>>>>  create mode 100644 drivers/platform/x86/dell/dell-lis3lv02d.c
>>>>  create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h
>>>>
>>>> -- 
>>>> 2.45.1
>>>>
>>>
>>
> 

