Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF0573522
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Feb 2024 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709125823; cv=none; b=cV1V5lD5LjG2WuvpnK7g4vwdZykWRLRTLMPixMpF7QoByj/sCef9hMtARdx1LKczIHSI1dy9HlhQe8LWwjP40Bz7d/yhik8h/fHHztck2CYM3iL/AkWwj5P0SJnl5xBmIx5KobBHfGT8mkxeCgyIoDAhfqLS0v/+NKAMgZ9SCJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709125823; c=relaxed/simple;
	bh=M4E1rwnTlnzfrruXE8DGxlNzb5PJaOHTEaClwvFTksE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5ZuOFvr8iolf3tjAs3xmBE+CzY2U1nMAYtMABVBBln/AIduah11wX+JNOmZlP8k9kx+168WK5xDFSeh44jg6VYm0M2ci6Sol0Vj+t+eS7ojD9txYJWyyNuspYeBmOJGGZXL77pUxBUHnLcL5t+6BQB8mJbYb4V3icnhs39LsYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ddzywXjS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ddzywXjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709125820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DexqIOoSO9KFMr8XQf/oDgjK6Z6M/Fq/dKZt8eVix00=;
	b=ddzywXjSuSSIsx/gHPCba/5TpAMv4Zpq2wfHJiONr8/4QnHFEv1wANyD8nyMnZkKCIYLX5
	ZOEhOJ2OivgBYysxKCnKLAb9Hblc+CV66wvo3OsPeso42vy6hV0WzrNHBJIXdaUW/HyVJ8
	FQbrsLYA4tCMVsY+pRXAXz8lk+V3GP0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-3M-jbiw6MBmQ-qyvxc-Vdw-1; Wed, 28 Feb 2024 08:10:17 -0500
X-MC-Unique: 3M-jbiw6MBmQ-qyvxc-Vdw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-513154c153cso1096262e87.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Feb 2024 05:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709125816; x=1709730616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DexqIOoSO9KFMr8XQf/oDgjK6Z6M/Fq/dKZt8eVix00=;
        b=lWQrxW2GVWWfk5uggCsWirIOrvqb4Om2EkOcVmSEo0ynXx3NdsrmYw+dOyrzVXcINr
         F7fjFquL1uXgRD3QHOKNRYdquwpyhhMoKRkYDmt26iXlevxqxyIIsYaZHILlpBNJGkIP
         iO4cbS4vF7IeotjsSZ3t4JPj4goDrskzvNfpZd8byLY7YMlRARvBBkDVaqaZEaDT6nDi
         9EWl3PtFBmDclDrRGPMsSd1GLOnrmGercde5qMGzTEIU6bifxy8f687NW1wy4Xe8tcHG
         ePUidkoIu4JjUg+4YX4bF1f+MRwUaliSmfBPy1yQoz9JiaFXv4/KVhg9TPKJ+a4TL1ZF
         e4Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX+s24wk0u42FztSjKyRqrRf1awMLP3dVg9uW/4axZOFh1ehO07wQgfCaucyGQRimLdJ+ccivM2c4rFg94w/NbgC8REZaOmpDsXSWNRrEMzc+WWHQ==
X-Gm-Message-State: AOJu0Ywgu7JDWPaN+cGHHVQJmHxcgIWvZQO5+u00n260OtKrgVKGe5zn
	X7H+88GwWad2xniKob2CMl7/QHTh0tTKisntBswWvsCwTnguZFgGl6kdTDIkOb15OAcPK/a6rsX
	GcNOH2GE9ipMDdWeOqKT4N3WGMIiB3L/HAbQXk1WCGeZbOOlUSJq//8SnDQJaguT0pSMPpY0=
X-Received: by 2002:a05:6512:282c:b0:512:a371:3b27 with SMTP id cf44-20020a056512282c00b00512a3713b27mr11104261lfb.13.1709125816196;
        Wed, 28 Feb 2024 05:10:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWG4RNhU5mSzkXO97COQPuG5NqxMD1scCzapw5gUTR2z4HgXun7bjZqZsqL1t6MHT678WVZA==
X-Received: by 2002:a05:6512:282c:b0:512:a371:3b27 with SMTP id cf44-20020a056512282c00b00512a3713b27mr11104234lfb.13.1709125815792;
        Wed, 28 Feb 2024 05:10:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c5-20020a0564021f8500b005653439cadcsm1778400edc.25.2024.02.28.05.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 05:10:15 -0800 (PST)
Message-ID: <4344926b-40e9-4423-b208-c18263248a82@redhat.com>
Date: Wed, 28 Feb 2024 14:10:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Content-Language: en-US, nl
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Jean Delvare <jdelvare@suse.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali>
 <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
 <20240227214011.xeys7rtukn6hksdw@pali>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240227214011.xeys7rtukn6hksdw@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

On 2/27/24 22:40, Pali Rohár wrote:
> On Saturday 17 February 2024 11:33:21 Hans de Goede wrote:
>> Hi Jean,
>>
>> On 2/13/24 17:30, Jean Delvare wrote:
>>> Hi Pali, Hans,
>>>
>>> On Sun, 7 Jan 2024 18:10:55 +0100, Pali Rohár wrote:
>>>> On Saturday 06 January 2024 17:09:29 Hans de Goede wrote:
>>>>> It is not necessary to handle the Dell specific instantiation of
>>>>> i2c_client-s for SMO8xxx ACPI devices without an ACPI I2cResource
>>>>> inside the generic i801 I2C adapter driver.
>>>>>
>>>>> The kernel already instantiates platform_device-s for these ACPI devices
>>>>> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
>>>>> platform drivers.
>>>>>
>>>>> Move the i2c_client instantiation from the generic i2c-i801 driver to
>>>>> the Dell specific dell-smo8800 driver.
>>>>>
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
>>>>> - Add a comment documenting the IDF PCI device ids
>>>>> ---
>>>>>  drivers/i2c/busses/i2c-i801.c            | 126 +----------------------
>>>>>  drivers/platform/x86/dell/dell-smo8800.c | 121 +++++++++++++++++++++-
>>>>>  2 files changed, 123 insertions(+), 124 deletions(-)  
>>>>
>>>> I'm looking at this change again and I'm not not sure if it is a good
>>>> direction to do this movement. (...)
>>>
>>> Same feeling here. Having to lookup the parent i2c bus, which may or
>>> may not be present yet, doesn't feel good.
>>>
>>> I wouldn't object if everybody was happy with the move and moving the
>>> code was solving an actual issue, but that doesn't seem to be the case.
>>
>> I thought you would actually like getting this somewhat clunky code
>> which basically works around the hw not being properly described in
>> the ACPI tables out of the generic i2c-i801 code.
>>
>> I didn't get around to answer's Pali's concerns yet, so let me
>> start by addressing those since you indicate that you share Pali's
>> concerns:
>>
>> Pali wrote:
>>> Now after looking at this change again I see there a problem. If i2c-801
>>> driver initialize i2c-801 device after this smo8800 is called then
>>> accelerometer i2c device would not happen.
>>
>> That is a good point (which Jean also points out). But this can simply
>> be fixed by making the dell-smo8800's probe() method return -EPROBE_DEFER
>> if the i2c-i801 i2c-bus is not present yet (all designs using the
>> dell-smo8800 driver will have an i2c-bus so waiting for this to show
>> up should not cause regressions).
> 
> Adding EPROBE_DEFER just complicates the dependency and state model.
> I would really suggest to come up with a simpler solution, not too
> complicated where it is required to think a lot if is is correct and if
> all edge-cases are handled.

I'm not sure what you are worried about here. dell-smo8800 is
a leave driver, nothing inside the kernel depends on it being 
loaded or not. So there are no -EPROBE_DEFER complexities here,
yes -EPROBE_DEFER can become a bit hairy with complex dependency
graphs, but this is a very KISS case.

Are there any specific scenarios you are actually worried about
in this specific case?

>> If we can agree to move forward this series I'll fix this.
>>
>> Pali wrote:
>>> Also it has same problem if PCI i801 device is reloaded or reset.
>>
>> The i801 device is not hotplugable, so normally this will never
>> happen. If the user manually unbinds + rebinds the i2c-i801 driver
>> them the i2c_client for the smo88xx device will indeed get removed
>> and not re-added. But this will normally never happen and if
>> a user is manually poking things then the user can also unbind +
>> rebind the dell-mso8800 driver after the i2c-i801 rebind.
>> So I don't really see this as an issue.
> 
> Well, rmmod & modprobe is not the rare cases. Whatever developers say
> about rmmod (or modprobe -r or whatever is the way for unloading
> modules), this is something which is used by a lot of users and would be
> used. 

Many modules actually have bugs in there remove paths and crash,
this is really not a common case. Sometimes users use rmmod + modprobe
surrounding suspend/resume for e.g. a wifi driver to work around
suspend/resume problems but I have never heard of this being used
for a driver like i2c-i801.

And again if users are manually meddling with this, the they can
also rmmod + modprobe dell-smo8800 after re-modprobing i2c-i801.

>> With those remarks addressed let me try to explain why I think
>> that moving this to the dell-smo8800 code is a good idea:
>>
>> 1. It is a SMO88xx ACPI device specific kludge and as such IMHO
>> thus belongs in the driver for the SMO88xx ACPI platform_device.
> 
> I'm not sure if it belongs to "SMO88xx ACPI platform_device" but for
> sure I agree with you that it does not belong to i801 code. I would say
> that it belongs to some SMO8800 glue code -- because it is not the
> classic ACPI driver too. But I'm not against to have SMO glue code and
> SMO ACPI driver in one file (maybe it is even better to have it).

We are trying to get rid of acpi_driver drivers using only
platform_driver drivers for the platform_devices created for
ACPI devices / fwnodes which do not have another physical device.

Also we only want this workaround when the SMO88xx ACPI fwnode
is missing the I2cSerialBusV2 resource for the i2c_client and
conveniently the platform_device will only be created for
ACPI fwnodes without the I2cSerialBusV2 resource for proper
ACPI fwnodes which have the I2C resource an i2c_client will
be created instead. So putting the workaround in
the platform_driver automatically ensures that it only runs
when the ACPI fwnode is incomplete.


> 
>> The i2c-i801 driver gets loaded on every x86 system and it is
>> undesirable to have this extra code and the DMI table in RAM
>> on all those other systems.
> 
> I think we can take an assumption that ACPI SMO device does not change
> it existence or ACPI enabled/disabled state during runtime. So we can
> scan for ACPI SMO device just once in function stored in __init section
> called during the kernel/module initialization and cache the result
> (bool if device was found + its i2c address). After function marked as
> __init finish its job then together with DMI tables can be discarded
> from RAM. With this way it does take extra memory on every x86 system.
> Also we can combine this with an SMO config option, so the whole code
> "glue" code would not be compiled when SMO driver is not enabled via
> Kconfig.

This approach does not work because i2c-i801.c registers a PCI driver,
there is no guarantee that the adapter has already been probed and
an i2c_adapter has been created before it. A PCI driver's probe()
function must not be __init and thus any code which it calls also
must not be __init.

So the majority of the smo88xx handling can not be __init.

Regards,

Hans


