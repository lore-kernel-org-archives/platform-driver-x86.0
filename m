Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C50152E12
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733334111; cv=none; b=PnJEhpmkYxHeilV5x7TBgFYpNAoLEDD3y+vkO9882Ikwpmsr9nneoWuA5oPn0ibkBIIIA5s+CHWfF8exuBDr7j9ek77tAExFRe16yHe1LPQn8zQqzDgnBDZPak1mKVGAsXOt0yAuCP8uMA0zlC9zOKqWg6Ot29UuLOlGpG9RSZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733334111; c=relaxed/simple;
	bh=w1nFTnmq4P/YXJW/wGKT0DODLadUKOW+HkLhF3FGE0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnVe9UQScF3MqsBV0aLFLcgGjTr0sBwMSdIjZ7SGqLVo0/I5LVNLKG7o8GA1cXm/wvd+K65rFjPrgSRldN6Ewt5J2pT67j1dlsCAkIwgcwvdiQTGXM+U8/5od27jnvP9aBe15DkPKc55vPAV5rZE2Wyflp0RtcxO78rC/nMPerY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VEFj6bqm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VEFj6bqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733334107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOxSnrK7S3S62uXLFm8Pnjix1Pct1bQjHiENe4UQbAE=;
	b=VEFj6bqmCsM9Eb85kL3zc4lORefEvGgzfOlzVukNL7Q+hMuUNnZzOvVUk4bXCB+QReaLlO
	RB5qMWysW6UEwyyKmEDOZjMl43KzfW9Jdo8JpAwBQd2dgazgUNGctkLfivzn6xDz3g13Ow
	sMzuuxb74+do04pCNB57R2ixaDIp8gE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-4_zgce_EO4mo_jExUT_BWw-1; Wed, 04 Dec 2024 12:41:46 -0500
X-MC-Unique: 4_zgce_EO4mo_jExUT_BWw-1
X-Mimecast-MFC-AGG-ID: 4_zgce_EO4mo_jExUT_BWw
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5d0ae45646eso76547a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2024 09:41:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334105; x=1733938905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOxSnrK7S3S62uXLFm8Pnjix1Pct1bQjHiENe4UQbAE=;
        b=PH3lbUJ6EeLqSDmApHDF/lDrEeqhpuwohXV6ohLKyvzUGvmamw4xBiiQ+8SAWefbLw
         h/irPvtsaXuPLBTD+cFd4DGzR1Qf6FH0F/fYGglR5RkeokcDA86MGNKas1QyEE67lmW/
         zatoQUTMia6ilNaADSSRilwkXEVyz1Bl0A6zT6UiGSaM63BF96Omm4E7YMSL2aI8Ven6
         7AHiQlukt28kmJx5NMN3ItW54G/cUtjq/XR3S4TVsxAFQSlyPV5MJI0tEgu1D+AJHTMF
         RWJwhiARZpbY1dqAGmwtIkIskb374c157UA8ynDEZpWOTv30edw2H4G8vcbFE4y48XeS
         GA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9tppLyxKKp0XTTQ0d1QSD1C0CXzITSeJMPrkNqHd+G8ao7DnhaaaNChQ7C5ubkP4kjr5nebwv2JBNBl3hVaHsLCQX@vger.kernel.org
X-Gm-Message-State: AOJu0YyWro2u1ks+ppF1MPznfraQ5MnKaADhUYZU/BDsaB7taGQTk1Sk
	/yLvVwQdORMk0aBYbueRkvZIWR5tzbcuCo+hb7dBhi7ciuX94opAQiDMeqX5nIQX7hS0EBbDWWz
	szJVchVt8hxd2/Qazo5ZZ/iRGNKpMBa0I94LM0cdOV1draKbRWKqVHmR3Xbo37+IARnqMhoE=
X-Gm-Gg: ASbGncuOVZejS991qVT04i1TjEsA2Zgc45cP2FR7glTTjsouI0ym7BodoHGG/K1k6vS
	Cz/1t0QiGVBN6PRhsr0827J4dVFV4/9d89G9SQ/3Vo1wk1veERxZIS2XvanhyKwAQVXUYBlkiRr
	+sqgkOuJqbf0ip+uQUo3396SbAYLJ5spewRL9RpjaBLBxwc0ZoPBz3zOr+OwU35mNfrzCsPNMBa
	8DDg37oFxdb2eJfdz5cFNMi48nE2o5iRoGg9FE8xWY0rxjpEx0q1hK8Yp3or0T0L7D5+toiTs44
	kJxaS/cbAW8aGqeHYAebgYGFf5h4bZm15LZFjOHYtzwugliupBjTQk/+hDhWuU91LbJ51gilMrQ
	S8Jsva2yU1mjCow/LQE0bcB7n
X-Received: by 2002:a05:6402:27d1:b0:5cf:74c0:b4af with SMTP id 4fb4d7f45d1cf-5d125009cbcmr282778a12.13.1733334105608;
        Wed, 04 Dec 2024 09:41:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEK48YDZDCOWn4rkhqyJsK2IGu5lDb70V48X0j+MIV8s40eegV2fQrA+WrrsIaMRI1iaKUwA==
X-Received: by 2002:a05:6402:27d1:b0:5cf:74c0:b4af with SMTP id 4fb4d7f45d1cf-5d125009cbcmr282748a12.13.1733334105190;
        Wed, 04 Dec 2024 09:41:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097e8d817sm7641983a12.63.2024.12.04.09.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 09:41:44 -0800 (PST)
Message-ID: <0fdff4ec-112a-485f-993a-c78c8b1b672d@redhat.com>
Date: Wed, 4 Dec 2024 18:41:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] platform/x86: serdev_helpers: Add
 get_serdev_controller_from_parent() helper
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20241116153533.84722-1-hdegoede@redhat.com>
 <20241116153533.84722-2-hdegoede@redhat.com>
 <c6ef83c3-824e-cb9d-93ec-80dc98cfa2b7@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c6ef83c3-824e-cb9d-93ec-80dc98cfa2b7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2-Dec-24 5:34 PM, Ilpo Järvinen wrote:
> On Sat, 16 Nov 2024, Hans de Goede wrote:
> 
>> The x86-android-tablets code needs to be able to get a serdev_controller
>> device from a PCI parent, rather then by the ACPI HID+UID of the parent,
>> because on some tablets the UARTs are enumerated as PCI devices instead
>> of ACPI devices.
>>
>> Split the code to walk the device hierarchy to find the serdev_controller
>> from its parents out into a get_serdev_controller_from_parent() helper
>> so that the x86-android-tablets code can re-use it.
>>
>> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/serdev_helpers.h | 60 +++++++++++++++------------
>>  1 file changed, 34 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/platform/x86/serdev_helpers.h b/drivers/platform/x86/serdev_helpers.h
>> index bcf3a0c356ea..b592b9ff6d93 100644
>> --- a/drivers/platform/x86/serdev_helpers.h
>> +++ b/drivers/platform/x86/serdev_helpers.h
>> @@ -22,32 +22,14 @@
>>  #include <linux/string.h>
>>  
>>  static inline struct device *
>> -get_serdev_controller(const char *serial_ctrl_hid,
>> -		      const char *serial_ctrl_uid,
>> -		      int serial_ctrl_port,
>> -		      const char *serdev_ctrl_name)
>> +get_serdev_controller_from_parent(struct device *ctrl_dev,
>> +				  int serial_ctrl_port,
>> +				  const char *serdev_ctrl_name)
>>  {
>> -	struct device *ctrl_dev, *child;
>> -	struct acpi_device *ctrl_adev;
>> +	struct device *child;
>>  	char name[32];
>>  	int i;
>>  
>> -	ctrl_adev = acpi_dev_get_first_match_dev(serial_ctrl_hid, serial_ctrl_uid, -1);
>> -	if (!ctrl_adev) {
>> -		pr_err("error could not get %s/%s serial-ctrl adev\n",
>> -		       serial_ctrl_hid, serial_ctrl_uid);
>> -		return ERR_PTR(-ENODEV);
>> -	}
>> -
>> -	/* get_first_physical_node() returns a weak ref */
>> -	ctrl_dev = get_device(acpi_get_first_physical_node(ctrl_adev));
>> -	if (!ctrl_dev) {
>> -		pr_err("error could not get %s/%s serial-ctrl physical node\n",
>> -		       serial_ctrl_hid, serial_ctrl_uid);
>> -		ctrl_dev = ERR_PTR(-ENODEV);
>> -		goto put_ctrl_adev;
>> -	}
>> -
>>  	/* Walk host -> uart-ctrl -> port -> serdev-ctrl */
>>  	for (i = 0; i < 3; i++) {
>>  		switch (i) {
>> @@ -67,14 +49,40 @@ get_serdev_controller(const char *serial_ctrl_hid,
>>  		put_device(ctrl_dev);
>>  		if (!child) {
>>  			pr_err("error could not find '%s' device\n", name);
>> -			ctrl_dev = ERR_PTR(-ENODEV);
>> -			goto put_ctrl_adev;
>> +			return ERR_PTR(-ENODEV);
>>  		}
>>  
>>  		ctrl_dev = child;
>>  	}
>>  
>> -put_ctrl_adev:
>> -	acpi_dev_put(ctrl_adev);
>>  	return ctrl_dev;
>>  }
>> +
>> +static inline struct device *
>> +get_serdev_controller(const char *serial_ctrl_hid,
>> +		      const char *serial_ctrl_uid,
>> +		      int serial_ctrl_port,
>> +		      const char *serdev_ctrl_name)
>> +{
>> +	struct acpi_device *adev;
>> +	struct device *parent;
>> +
>> +	adev = acpi_dev_get_first_match_dev(serial_ctrl_hid, serial_ctrl_uid, -1);
>> +	if (!adev) {
>> +		pr_err("error could not get %s/%s serial-ctrl adev\n",
>> +		       serial_ctrl_hid, serial_ctrl_uid);
> 
> Hi,
> 
> With the current code (and I suppose this moved too), W=1 build detects 
> that dell_uart_bl_pdev_probe() passed NULL which is then being formatted 
> here with %s. While it "works", it would be useful to solve the warning 
> and perhaps "/(null)" appearing in the print is also confusing to user 
> so maybe do another patch to change serial_ctrl_uid to e.g.:
> 
> 	serial_ctrl_uid ?: "*"
> 
> (There's another print below with the same problem).

Ack, for v3 I'll insert a new patch in the series before this patch
fixing this in the original code, including a Fixes: tag of the commit
introducing this.

Regards,

Hans




> 
> --
>  i.
> 
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +
>> +	/* get_first_physical_node() returns a weak ref */
>> +	parent = get_device(acpi_get_first_physical_node(adev));
>> +	acpi_dev_put(adev);
>> +	if (!parent) {
>> +		pr_err("error could not get %s/%s serial-ctrl physical node\n",
>> +		       serial_ctrl_hid, serial_ctrl_uid);
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +
>> +	/* This puts our reference on parent and returns a ref on the ctrl */
>> +	return get_serdev_controller_from_parent(parent, serial_ctrl_port, serdev_ctrl_name);
>> +}
>>
> 

