Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A58D1DE4DB
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2025 15:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745250053; cv=none; b=V0meTve5JTzM9GQ6m4mCWew8p3WZazfQ31ZQf9NrELCLMN1S0nmLsozD6qD7EicWHRVnDXs4BDfyKvF59oIL4QP0wMjoAdqz0loFRrfG9Nfz7UInCKim+Hy1yCrI/dhTPOiWcGXn1NbVvhobwbkXsMbaHiaDRtNd/1pL3yNSoxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745250053; c=relaxed/simple;
	bh=XlA1eiT/sqL7aOe2gqoLKoU9xXrrDJMnWA4vo4yGvvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0Gr9HMBPpZkJf0cpJ0tg3j43h67Agmwv/JecyX3Gl8U8+hOWRa5T3y7y5jYShl5AvmwjkJSDXLYjJbEW07lXVjEBkff9p0OdZCk5lWYJSW44Q7l4+71GBRw8eFP7NBsLgvwviafqqDGRYf8n9RwZOX4PFzgE+nPr2JJXA73kiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K2o8WsE7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K2o8WsE7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745250049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1+ABVLULVTVxDhYu6SYiLaahJB9TbCwefT+I0md6kI=;
	b=K2o8WsE7VuOlQF0emeNcEde6p4pJr3DxftfoZaaM1WFTOslwTrjxcLXd7gWajGJziZXKK0
	p0DyV2tXez6Q75t0EpIa1ngSME2d/v1zSaQQJnQ+ZDvXDfGxjJdittY1ntkN4VUoYgDzSO
	oPPUkc98waRk0OD2q4UgD1bQ0pjEJN8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-u3bcVoRKOVqOOgkTfKh_7w-1; Mon, 21 Apr 2025 11:40:48 -0400
X-MC-Unique: u3bcVoRKOVqOOgkTfKh_7w-1
X-Mimecast-MFC-AGG-ID: u3bcVoRKOVqOOgkTfKh_7w_1745250047
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac287f28514so345560166b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2025 08:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745250047; x=1745854847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G1+ABVLULVTVxDhYu6SYiLaahJB9TbCwefT+I0md6kI=;
        b=OQsE16uNHdktQtsFJKb4220p2foFAMzvdB2iNHXx5soSoJxzjMgFObz13UnUphAtKN
         /bDEKqlqXVjIj2fwyffkpAPNxvQCmrwIsY6Gbkbh8RmTO3cfnbF10MXAq4Tpmdu40zeq
         DWvDoIX1Y3XV+LQ/2NVXtHmfjZf0YQWTbDP/nKoJisQhT5EsUNsa7qADLbzslxaq9QyF
         8V7NhspEOpBUELnKyuz0LYAxmeXhii3OBaHIB8YLcRlH5V0HxFNbmaHPGhQQoFLPHeAg
         udnlHeglxu0RbNO5OuA0fLd03p1A0ePGrSdDQL+kuJDafqvcfeyoOnmnX7YpQ65K/Ahk
         g52A==
X-Gm-Message-State: AOJu0Yy21/1Zt/yeLGUwlIxZc2T+tLjCcPcdnfz0ht4tbn5yYnXV8yTV
	lHJlDDoPoQnRnqwecpSsWX+7Do1fuKjltqt01yEXJQA6JfmGFljsAuMnOKzK+BlDluFHi3uoXIl
	x9/CEuS0NdJMq7T/PYoMHjV9QgmnwaVylEpoo2fcEabwsNV2QjFWJyzkMYdznn+GGLUTilK4=
X-Gm-Gg: ASbGncu5ey9iLtHMTe+X1KISHX57qTR3uDQHWpE840XMupifyRV9PVXlpYKbY2U2zUI
	85yWMUOzQ89GebLbfdaSQiLZUcc8n8J7JVY/iKTFo1BbfEetEJfVmVtaA5XUuk4MSWzA/g0GrEq
	4aD7yxFAf4NwgDoqaAg+1w3YTsXde0Q3uPAoSp4mT1yPf3ySbDA9K06qvJ2vKQszLJGw0ksDH5E
	bw/HVG2MNCMZzXiETq6jeD9jYcvikjxZcU7WHkcf9VKcn0q5OcTFmyqzq2XFVjqIuJJKceiQAK8
	PPu3QTD6IlmjCPXfpKw19BUUOrS/d17OkP3NFaE+0Css2N1bB/Sp9Z1ArpzYB2aXnBeVX4o/xK7
	1yYbORFXylTMdvgp3VEwknduDNo8lIONQzUJiX8XdwJW5EpB9nZz2B81Yx6s7EA==
X-Received: by 2002:a05:6402:84c:b0:5ed:4181:b03e with SMTP id 4fb4d7f45d1cf-5f628535045mr9692272a12.14.1745250047079;
        Mon, 21 Apr 2025 08:40:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2qrNe+882MldEwGpuI0Ehc4wH1Wn2OubBTVxwl4vineMhDgOpvjt6cNLrtBSHP2jCYdYttg==
X-Received: by 2002:a05:6402:84c:b0:5ed:4181:b03e with SMTP id 4fb4d7f45d1cf-5f628535045mr9692254a12.14.1745250046675;
        Mon, 21 Apr 2025 08:40:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625834033sm4621810a12.62.2025.04.21.08.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 08:40:46 -0700 (PDT)
Message-ID: <964de473-8c93-43d3-8712-2f4ae245cf12@redhat.com>
Date: Mon, 21 Apr 2025 17:40:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] platform/x86/amd/hsmp: Create separate ACPI, plat and
 common drivers
To: Suma Hegde <Suma.Hegde@amd.com>, Gregory Price <gourry@gourry.net>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20241021111428.2676884-1-suma.hegde@amd.com>
 <20241021111428.2676884-8-suma.hegde@amd.com>
 <aALZxvHWmphNL1wa@gourry-fedora-PF4VCD3F>
 <8c0d9751-767f-4e8e-bbf1-bbab89c1b8c9@redhat.com>
 <65a8045b-42ca-4d13-b0d6-2f739582faa5@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <65a8045b-42ca-4d13-b0d6-2f739582faa5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 21-Apr-25 12:34 PM, Suma Hegde wrote:
> Hi Hans and Gregory,
> 
> 
> On 4/19/2025 2:29 PM, Hans de Goede wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> Hi Gregory,
>>
>> On 19-Apr-25 1:01 AM, Gregory Price wrote:
>>> On Mon, Oct 21, 2024 at 11:14:25AM +0000, Suma Hegde wrote:
>>>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>>> ... snip ...
>>>> +#define DRIVER_NAME         "amd_hsmp"
>>> ... snip ...
>>>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>>>> +#define DRIVER_NAME         "amd_hsmp"
>>> Hi,
>>>
>>>  From looking around this patch, the code seems to suggest that these
>>> drivers should not be mutually exclusive, but we are seeing an error
>>> when attempting to load them both - apparently because they both use the
>>> same driver name.
>>>
>>> Was this intended, or should the DRIVER_NAME="hsmp_acpi" for acpi.c?
>> These drivers are mutually exclusive in the sense that only one of
>> them should actually bind to the hw.
>>
>> Looking at the code this seems not to be guaranteed though ...
> 
> These drivers are supposed to be mutually exclusive drivers.
> 
> We don't expect them to co-exist, Thats the reason we used the same name for the driver,

That will not work though for legacy devices if e.g. both
are builtin and the acpi.c code gets to register its
driver first. In that case the legacy code will fail to
register its driver, even though it is the one which should
be used.

Same happens if the acpi.c and plat.c code both are modules
but acpi.c is (manually) loaded first on a legacy platform.

> same name for character device and device file.

Those are fine.

> amd_hsmp is only for legacy platforms. All the new platforms will be having ACPI device.
> 
>>
>> drivers/platform/x86/amd/hsmp/plat.c has:
>>
>> static int __init hsmp_plt_init(void)
>> {
>>          int ret = -ENODEV;
>>
>>          if (!legacy_hsmp_support()) {
>>                  pr_info("HSMP is not supported on Family:%x model:%x\n",
>>                          boot_cpu_data.x86, boot_cpu_data.x86_model);
>>                  return ret;
>>          }
>>
>>          ...
>>
>> So loading that module should fail on AMD CPUs which fail the
>> legacy_hsmp_support() check. Which checks CPU family and model.
>>
>> Since you are seeing the error you are reporting the system you
>> are testing on does pass that test.
>>
>> Question, did you manually load hsmp_acpi, or did that auto-load?
>>
>> Or a totally different way to ask the same thing, do you have
>> any AMDI0097:0? devices under /sys/bus/platform/devices ?
>>
>> ATM it seems that the plat.c code assumes that on hw where
>> legacy_hsmp_support() returns true there will never be an
>> AMDI0097:0? device which I'm not sure is a safe assumption
>> to make.
>>
>> IMHO besides the "if (!legacy_hsmp_support())" check,
>> hsmp_plt_init() should also do:
>>
>>          if (acpi_dev_present("AMDI0097", NULL, -1))
>>                  return -ENODEV;
>>
>> leaving the HSMP handling up to the hsmp_acpi driver
>> when an AMDI0097:0? device is present.
>>
>> Note that the identical driver-name is still an issue even
>> with this check, because if both checks pass a user could
>> still manually load hsmp_acpi and get the driver name conflict
>> error.
> 
> To fix the "Driver 'amd_hsmp' is already registered, aborting..." error when both are loaded, the driver name has to be changed, but while changing the driver name
> 
> adding the below lines which is suggested above by Hans is important.
> 
> if (acpi_dev_present("AMDI0097", NULL, -1))
>                 return -ENODEV;

Ack, the combination of rename of the driver + the above check
should fix things.

> Otherwise on Family 0x1A Model 0x0-0xF platform where both are supported (this is the transitional platform where both are supported)
> 
> it will register the driver and complain for creating duplicate entries of character device if user tries to load both.
> 
> We will add this check and send out the updated patch.
> 
>> Another issue with the driver seems to be that hsmp_acpi_probe()
>> relies on hsmp_pdev->is_probed to only do some initialization
>> once, but that is_probed flag is not protected by a mutex,
>> so when async probing is used 2 hsmp_acpi_probe() calls can
>> race and make a mess of things.
> 
> For the asynchronous probing, we will guard hsmp_pdev->is_probed code with mutex.

Great, thank you. Note you need to keep the mutex locked
for almost the entire code flow in hsmp_acpi_probe() (until
is_probed = true is done).

Please consider using:

	guard(mutex)(&hsmp_pdev->mutex);

in hsmp_acpi_probe() directly after getting hsmp_dev, this
this avoids the need to manual unlock the mutex.

Note the mutex will be a new addition to struct hsmp_plat_device,
currently this has no mutex.

And this will need to use a static mutex initializer.

Regards,

Hans



