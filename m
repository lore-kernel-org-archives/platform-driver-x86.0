Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848B21CB328
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jul 2024 18:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719946462; cv=none; b=GOvz6UEYFlWI1Fk7MxT/sOcswRErgenSF1xUCkpievCT2vYxmyg46VPbp2YoJDD/7M0aEu3iyUJDEkMd9jV3Vp7nB8lmLUyv4YPQEC08wHo8NB26H21gU7UpXLPAE1IyK0uz3u0ePrH3jvyzyjKDm1UeAsOq+vKLVrP0L/ls8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719946462; c=relaxed/simple;
	bh=4qE85VTHRed9N7yZCyphRi6j9bwjl4sHj+pTdwh7MZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wt06r55+y8ivAi58Lg3v3ZYMFxTCZjJ98rmK4BSpPdZWkp3w+PL9w4LC5aLUgcaNgxIq98KilDsGQVzbkHmzoyUJqoobwMvzXkvLRwQsTxF68+ZCetYsKUIMDiQvOk3xrCnAzhG5IgUcsTfeU95PA1IWPNwh1UdO35gclbgzuuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G+jZplHJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G+jZplHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719946459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LD1rDI7vzH+BUNwJvqoLJztb1cQFJWc/R9BsKURQaEk=;
	b=G+jZplHJ9JQbccMULVhDDm0fRbm4rA7ByxfZbcztUVy2Ud9KSfAbqGhVb4OukuJ8LP86OR
	JosVv7Jx5kjshVU7Og4Y+NKRolLA57HcQ9PTk1HVkPlBqBCEPMpqgVlL5fkgbvjEiQB1XM
	bg9dSAyaEGzgKBP2KnFkqQhh4sHXj38=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-puSbrtesPqCkUIsXJT5Piw-1; Tue, 02 Jul 2024 14:54:12 -0400
X-MC-Unique: puSbrtesPqCkUIsXJT5Piw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a72af18f571so359974166b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jul 2024 11:54:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719946452; x=1720551252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LD1rDI7vzH+BUNwJvqoLJztb1cQFJWc/R9BsKURQaEk=;
        b=RM2B0c+mm7ssXzyLxA4phaVNyPXn+OIJXfPseU+pHKrCSJqafimSIaQBudMHo5a/c1
         SJQTtIUnBI1uva4cZWDfIGdU/TU1nCelzf5cUvEucFWHtsIvFQL5K3CFOYi6IycALedk
         rRaRybJCHqZR8/iwGZCyHWLx0tx8zf2oJoMgrBQIh5D1nYHIgEQX2G1P5UcuJF0RXKZu
         r5ZZkNJHSFrtp0+4d3aQI7UqIHgGhyqf8XYFzsp6sPEKqlTTC/sTRfualwmDK0JEU41h
         HjsgikFJMGjEyfzLrmUNEi53Wpk1cH1PkjYsxVP4Ht73C/yI/fCXFBORRrPWOsjbowkt
         hFew==
X-Forwarded-Encrypted: i=1; AJvYcCXUf6nnf9oUh6A9jmtQbS+cZ9Ep0xWrprSdFMfFYyTFs9f8lfTs3TX9VvLvToHK9+jrKEVDgS4blUDYgIS8AZxscIP129/uPIJWxd7ZYJ27k6fJuQ==
X-Gm-Message-State: AOJu0Yzas+CuN1Mqf7e1RL5gpC7G8YB/bImVh/l4RsTQ7VcWkMX5hCUt
	83Q1Hz9uK5AgNRw8pxWrpTl4/f4sffoiyDEp879JBZnRJaOnIfFUPIYhbN+fE4ly3axRaEkh0H3
	TDhZk4MgYt8ZR73D8RTj21qSMm9dCyWTW7j04yWguAvcVIubXmz1GghCIWpj8y1JIhh4XRkA=
X-Received: by 2002:a17:906:f88f:b0:a6f:e19:6fb2 with SMTP id a640c23a62f3a-a751443ba6fmr662055966b.29.1719946451740;
        Tue, 02 Jul 2024 11:54:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXL6gF9jlO+SjQOVwahEtjMkFL6WJuUJ/B/YJlxXCeGU7FUrCdCASvs2XA2/W01kXfugboLg==
X-Received: by 2002:a17:906:f88f:b0:a6f:e19:6fb2 with SMTP id a640c23a62f3a-a751443ba6fmr662054866b.29.1719946451353;
        Tue, 02 Jul 2024 11:54:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72b033f3a3sm416843766b.187.2024.07.02.11.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 11:54:10 -0700 (PDT)
Message-ID: <64f9103b-becf-4a66-908b-c655b3c37a38@redhat.com>
Date: Tue, 2 Jul 2024 20:54:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] platform/x86: dell-smo8800: Move instantiation of
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
 <20240624111519.15652-5-hdegoede@redhat.com>
 <20240624181420.nvdszjycejdc5fer@pali>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240624181420.nvdszjycejdc5fer@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/24/24 8:14 PM, Pali Rohár wrote:
> On Monday 24 June 2024 13:15:16 Hans de Goede wrote:
>> +static int match_acpi_device_ids(struct device *dev, const void *data)
>> +{
> 
> You can mark this function as __init as it is called only from
> dell_lis3lv02d_init to free space.
> 
>> +	const struct acpi_device_id *ids = data;
>> +
>> +	return acpi_match_device(ids, dev) ? 1 : 0;
>> +}
>> +
>> +static int __init dell_lis3lv02d_init(void)
>> +{
>> +	struct device *dev;
>> +	int err;
>> +
>> +	/*
>> +	 * First check for a matching platform_device. This protects against
>> +	 * SMO88xx ACPI fwnodes which actually do have an I2C resource, which
>> +	 * will already have an i2c_client instantiated (not a platform_device).
>> +	 */
>> +	dev = bus_find_device(&platform_bus_type, NULL, smo8800_ids, match_acpi_device_ids);
>> +	if (!dev) {
>> +		pr_debug("No SMO88xx platform-device found\n");
>> +		return 0;
> 
> Is zero return value expected? Should not be it something like -ENODEV?

This is a module_init() function returning non 0 leads to an error getting
logged and the modprobe command to return a non 0 value which is not what
we want.

>> +	}
>> +	put_device(dev);
>> +
>> +	lis3lv02d_dmi_id = dmi_first_match(lis3lv02d_devices);
>> +	if (!lis3lv02d_dmi_id) {
> 
> You can cache the value lis3lv02d_dmi_id->driver_data instead of caching
> lis3lv02d_dmi_id pointer and then you can mark lis3lv02d_devices array
> as __initconst to free additional space not needed at runtime on x86
> machines without accelerometer where CONFIG_DELL_SMO8800=y.

This is a good idea, done for v5.

Regards,

Hans


> 
>> +		pr_warn("accelerometer is present on SMBus but its address is unknown, skipping registration\n");
>> +		return 0;
>> +	}
>> +
>> +	/*
>> +	 * Register i2c-bus notifier + queue initial scan for lis3lv02d
>> +	 * i2c_client instantiation.
>> +	 */
>> +	err = bus_register_notifier(&i2c_bus_type, &i2c_nb);
>> +	if (err)
>> +		return err;
>> +
>> +	notifier_registered = true;
>> +
>> +	queue_work(system_long_wq, &i2c_work);
>> +	return 0;
>> +}
>> +module_init(dell_lis3lv02d_init);
>> +
>> +static void __exit dell_lis3lv02d_module_exit(void)
>> +{
>> +	if (!notifier_registered)
>> +		return;
>> +
>> +	bus_unregister_notifier(&i2c_bus_type, &i2c_nb);
>> +	cancel_work_sync(&i2c_work);
>> +	i2c_unregister_device(i2c_dev);
>> +}
>> +module_exit(dell_lis3lv02d_module_exit);
>> +
>> +MODULE_DESCRIPTION("lis3lv02d i2c-client instantiation for ACPI SMO88xx devices");
>> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.45.1
>>
> 


