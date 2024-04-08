Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8149F446B7
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 09:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712568067; cv=none; b=Btkih805cnSnEHhHHZAScaB/ff7NIjnrTSVo/RxcsFz49dX0AzZCPrL8I1wqg2xV+3auYCay08L7Km+WmcKXiW5i2R23LUBCg2ndr3RZfjca3NuimcZc9h6RGij2X/qer/0M3/0Cfv/FC9h3JxLkNdo1vovX0sf7ASjKG1c5HC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712568067; c=relaxed/simple;
	bh=LlWw5D5iq3eRsOKi/6cRekmwRU6E2z6fXUzoAVyRkgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RHWqKXbeRmPv+vymAf1cs3nuVhCrmqGjyex8EAcCKloh7aA+7GcncBYLXkHNHK0CwiI1/epQaMkIbeoKb+f1t2+23RS2jBJ/F7n+Dj5e79ePYpiuRzZXMK/QS51WPu2Waa/EdL6e2qrVyxxK8ldwKyuqDmsHOapWO4GjW3XVMso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aStPL1rh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aStPL1rh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712568064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXql7UyGB0xfCaYsiXkmotNqC4Ch89jqlagi6eSTNP4=;
	b=aStPL1rhXBExIl4oJSyZOLwN15vVnefnVmzQ4L5pcSUVvK4fVCZl6XDPLturr2GQr4Jhl/
	LaG2KrYakjI146pULWVaNtsXx0lRgSL6vaNUZ2h+YR8uOvNgItE3cZdsZd9qbcBSdKaFM0
	KoDYgfRJMdHgTHuPem8LQrk4QwnOBRY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-YhN1I9mmMAaAtirsQAfTjQ-1; Mon, 08 Apr 2024 05:21:03 -0400
X-MC-Unique: YhN1I9mmMAaAtirsQAfTjQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a51abd0d7c6so183970166b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 02:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712568061; x=1713172861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vXql7UyGB0xfCaYsiXkmotNqC4Ch89jqlagi6eSTNP4=;
        b=kTazEAbEvuUSRXLRlxeR9bDIIhRIKi36DvEjeEiSIl0TYwRNEonELieF3cliaAf5Kb
         tspFy9ez79f8JoqMuz5ItQTAsPfhOTHbp60Igoc/AZGqY5VlxNurl7TO/5WdsMn+dytl
         K6FA08mkTFAxA45wp2u/45BI2Rf5nWFu+lgPhZkOgN61xPWL8K1lZBf0gMLd3ayxhOgI
         5imDxk+iSYFo1Ysy/go/nZzUIsNdkDEKhy+Pn6KNL3mk9+BnzMnKFHYbj3u2me88Fz63
         Kb5vP6hNOEKP2nstlgyPm79x9o/C8PObcJ3En0mksDfNXfDOUVlGgthq8cNs1nJblaUf
         Qjxg==
X-Forwarded-Encrypted: i=1; AJvYcCVKSL/w90+KCM/m/21+qbuoZJI6sUf3QDiBUoTHIFcbt9Dw5Ag74tRTScbpuKyAtexUxLxETk5UD7Xk/jhqpmKyBmQcMwvyETz3fRb25/SNBwf4Yg==
X-Gm-Message-State: AOJu0YyHG2D9GJsiHWaF5WZJFWSykiCQ7xgslDsFRj16MEFbAjwWke8m
	9Fkde1MmJJFLzmdU9ia6UQL1ifqT0lWudXhgISmCrsopDQCPLkVgM2eD7uwsGbvp2SPbiamxWj0
	fW7KRScpF34xu0Yxd0UbidgQ0+8shZ7cYvGykLVNqS83pMkqGWf6AoparwAtjPyprz0nHexPhgi
	UEoIB7Ng==
X-Received: by 2002:a17:906:af7b:b0:a46:1d4b:d81 with SMTP id os27-20020a170906af7b00b00a461d4b0d81mr5221303ejb.62.1712568061726;
        Mon, 08 Apr 2024 02:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWOk6NEUrk9lnCfVbhMKNrjuoMqwfAbqHURxAw52jR4biGZq5z+GiQk0FKFdfGm0nyfmNnwA==
X-Received: by 2002:a17:906:af7b:b0:a46:1d4b:d81 with SMTP id os27-20020a170906af7b00b00a461d4b0d81mr5221290ejb.62.1712568061420;
        Mon, 08 Apr 2024 02:21:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o12-20020a170906358c00b00a51d0690052sm1617988ejb.124.2024.04.08.02.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 02:21:01 -0700 (PDT)
Message-ID: <2dd4f820-8b94-4e9b-909c-b43cb40bfc99@redhat.com>
Date: Mon, 8 Apr 2024 11:21:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: quickstart: Fix race condition when
 reporting input event
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com
Cc: rafael@kernel.org, linux-acpi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240327214524.123935-1-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240327214524.123935-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/27/24 10:45 PM, Armin Wolf wrote:
> Since commit e2ffcda16290 ("ACPI: OSL: Allow Notify () handlers to run
> on all CPUs"), the ACPI core allows multiple notify calls to be active
> at the same time. This means that two instances of quickstart_notify()
> running at the same time can mess which each others input sequences.
> 
> Fix this by protecting the input sequence with a mutex.
> 
> Compile-tested only.
> 
> Fixes: afd66f2a739e ("platform/x86: Add ACPI quickstart button (PNP0C32) driver")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
> This applies on the branch "review-hans". Maybe we could somehow
> document the concurrency rules for ACPI notify handlers?
> ---
>  drivers/platform/x86/quickstart.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/platform/x86/quickstart.c b/drivers/platform/x86/quickstart.c
> index ba3a7a25dda7..e40f852d42c1 100644
> --- a/drivers/platform/x86/quickstart.c
> +++ b/drivers/platform/x86/quickstart.c
> @@ -18,6 +18,7 @@
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> @@ -35,6 +36,7 @@
> 
>  struct quickstart_data {
>  	struct device *dev;
> +	struct mutex input_lock;	/* Protects input sequence during notify */
>  	struct input_dev *input_device;
>  	char input_name[32];
>  	char phys[32];
> @@ -73,7 +75,10 @@ static void quickstart_notify(acpi_handle handle, u32 event, void *context)
> 
>  	switch (event) {
>  	case QUICKSTART_EVENT_RUNTIME:
> +		mutex_lock(&data->input_lock);
>  		sparse_keymap_report_event(data->input_device, 0x1, 1, true);
> +		mutex_unlock(&data->input_lock);
> +
>  		acpi_bus_generate_netlink_event(DRIVER_NAME, dev_name(data->dev), event, 0);
>  		break;
>  	default:
> @@ -147,6 +152,13 @@ static void quickstart_notify_remove(void *context)
>  	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, quickstart_notify);
>  }
> 
> +static void quickstart_mutex_destroy(void *data)
> +{
> +	struct mutex *lock = data;
> +
> +	mutex_destroy(lock);
> +}
> +
>  static int quickstart_probe(struct platform_device *pdev)
>  {
>  	struct quickstart_data *data;
> @@ -165,6 +177,11 @@ static int quickstart_probe(struct platform_device *pdev)
>  	data->dev = &pdev->dev;
>  	dev_set_drvdata(&pdev->dev, data);
> 
> +	mutex_init(&data->input_lock);
> +	ret = devm_add_action_or_reset(&pdev->dev, quickstart_mutex_destroy, &data->input_lock);
> +	if (ret < 0)
> +		return ret;
> +
>  	/* We have to initialize the device wakeup before evaluating GHID because
>  	 * doing so will notify the device if the button was used to wake the machine
>  	 * from S5.
> --
> 2.39.2
> 

