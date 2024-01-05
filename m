Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696742E852
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AZHTfz7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704471919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cp7nflXMANPc6byg0dD4UU0d0LhqujoHl9ndAMIkYcg=;
	b=AZHTfz7v5NoqEuDLcg+RPpNgs60+Gw52LMXFu0fPR/fUfgkmg3EYPbyYYcQabAJ8GBQJ7M
	HLlyzmURjX/aczGNWbiSt1lXLCgTHkWiu1IbrkrGJpYkcBpfrbOPY5JF6/P1JmNThpjkz2
	ED6xzB97rdTs6DwkXGcFTTvBBtIbRXM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-Vhe4dChNN5u169a3blBclA-1; Fri, 05 Jan 2024 11:25:15 -0500
X-MC-Unique: Vhe4dChNN5u169a3blBclA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a279cf3ded1so76858466b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Jan 2024 08:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704471914; x=1705076714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cp7nflXMANPc6byg0dD4UU0d0LhqujoHl9ndAMIkYcg=;
        b=uRNMiPFuqhCHl+le9kzHf59WEHVk2QONMrETtbqOurvy49VMhVGn/cEjHHTg/kIfVc
         /y/imSgSj6jWYC1IWWaS2jWKdMNnvcBIzafjqURs51czCfOGCOx3pZMYlitUeZrzkIeE
         vs6ossAB/e2rP0s5CYLrcrLP45cD71mQmsb7/WTjz5e/PThz0A39mQeUmuJIzmKWwzqu
         qJiJNyQ5D3KdQP+FfwlKwG4ARTZa09wW7Ul7MgobZdJdPozPxV8a1xTXLh0c7C9uRyTY
         bWacfefndSKw2iXUPW7Pp4FitNSC+uARWXe1AIuepGREl137p/CsWvhQZzy0MmeWL6ke
         YQaw==
X-Gm-Message-State: AOJu0Yxr22+uS9kTsrq3HBRFkP//VamyZQuiyuMmkOuDjDA1jUgxQnP+
	3UKsPfCP16QcrI3GmWyxoPSrYDb7vGAgpqTTl9U+ZwAniD+WiGnOq55FXzrt5zyvKpK2etwkv0L
	/yMnwb6Th+q0/Lkq+lbcA+Snh64qKKPC87xbq87+xXw==
X-Received: by 2002:a17:906:c4ca:b0:a28:c7fe:5458 with SMTP id cl10-20020a170906c4ca00b00a28c7fe5458mr1020994ejb.94.1704471914416;
        Fri, 05 Jan 2024 08:25:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH86eAFwjwI7891zB+pPFTD4Pd4hV+iWj2MKqUnu4LySGlnP+rEBqQrUPMlLBSR3mr9MJ/CEw==
X-Received: by 2002:a17:906:c4ca:b0:a28:c7fe:5458 with SMTP id cl10-20020a170906c4ca00b00a28c7fe5458mr1020986ejb.94.1704471914072;
        Fri, 05 Jan 2024 08:25:14 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t13-20020a170906178d00b00a28cf49520asm1019785eje.203.2024.01.05.08.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 08:25:13 -0800 (PST)
Message-ID: <daa6db84-7403-4882-b77a-5fe6d8d6733a@redhat.com>
Date: Fri, 5 Jan 2024 17:25:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] platform/x86: dell-smo8800: Only load on Dell laptops
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Eric Piel <eric.piel@tremplin-utc.net>, Paul Menzel <pmenzel@molgen.mpg.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
 Marius Hoch <mail@mariushoch.de>, Kai Heng Feng
 <kai.heng.feng@canonical.com>, Wolfram Sang <wsa@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-2-hdegoede@redhat.com>
 <20231224214853.sntvdrsz2mvzgrdf@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231224214853.sntvdrsz2mvzgrdf@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

Thank you for your feedback on this series.

On 12/24/23 22:48, Pali Rohár wrote:
> On Sunday 24 December 2023 22:36:17 Hans de Goede wrote:
>> The SMO8xxx ACPI HIDs are generic accelerometer ids which are also used
>> by other vendors. Add a sys_vendor check to ensure that the dell-smo8800
>> driver only loads on Dell laptops.
> 
> I saw that this driver was used also on some Acer laptops. As you wrote
> above, and now after years I have also feeling that these ACPI HIDs are
> generic, not Dell specific.
> 
> So I would propose to not restrict smo8800 driver just for Dell laptops
> like this patch is introducing.

Ok, I was not aware that some Acer laptops were also using this.

I was just trying to honor the vendor check done in
the i2c-i801 driver after the move of the i2c-client instantiation
to dell-smo8800.

Given that we are keeping the existing DMI matching I don't 
think keeping the sys-vendor check is necessary. So I'll
drop the patch from v2 of the series.

Regards,

Hans





> Maybe better option would be to move this driver out of the dell
> namespace.
> 
> Are we able to collect dmesg outputs and verify this information on how
> many non-dell laptops is this driver loaded?
> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/dell/dell-smo8800.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
>> index f7ec17c56833..4d5f778fb599 100644
>> --- a/drivers/platform/x86/dell/dell-smo8800.c
>> +++ b/drivers/platform/x86/dell/dell-smo8800.c
>> @@ -10,6 +10,7 @@
>>  
>>  #define DRIVER_NAME "smo8800"
>>  
>> +#include <linux/dmi.h>
>>  #include <linux/fs.h>
>>  #include <linux/interrupt.h>
>>  #include <linux/kernel.h>
>> @@ -108,6 +109,9 @@ static int smo8800_probe(struct platform_device *device)
>>  	int err;
>>  	struct smo8800_device *smo8800;
>>  
>> +	if (!dmi_match(DMI_SYS_VENDOR, "Dell Inc."))
>> +		return false;
>> +
>>  	smo8800 = devm_kzalloc(&device->dev, sizeof(*smo8800), GFP_KERNEL);
>>  	if (!smo8800) {
>>  		dev_err(&device->dev, "failed to allocate device data\n");
>> -- 
>> 2.43.0
>>
> 

