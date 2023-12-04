Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NArlmIXZ"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 176BA1AB
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 05:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701697914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZuXb/hRP1s1bxqPSxiXpK08WANyRx7i4mo+6WIHqAc=;
	b=NArlmIXZuL4JGbGR/kPZiXVK4FFvWVVhmnn9Ko1INK/D45xQvWPgNOBYElAL3uRL78gBGc
	xr9xVYJXijocfX7D/qIMHS2woJbG7WVgUby8Ek8zW59ypNDKfS2JEUdKjY9OUEf6zrdO9S
	X74JT6Gf+JvxZJ3nan99YsTTrgH7+qs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-uU7j4U2xMyySI1zghlws1A-1; Mon, 04 Dec 2023 08:51:53 -0500
X-MC-Unique: uU7j4U2xMyySI1zghlws1A-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50bf0f26df4so1268957e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Dec 2023 05:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701697911; x=1702302711;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZuXb/hRP1s1bxqPSxiXpK08WANyRx7i4mo+6WIHqAc=;
        b=tdyhASWHS3A2ptPRCJpx44CDyKGnSNHOlRnXLIlTs1jME1WQY2VclIhwzFIGWJPXGz
         jGljYOocW9cAwLCH6r5tcbwXapaXDch2/WEKIFLwEbjEjYLwcGm4ZEq8Pd0TEVTIoUEN
         UmelsC8eNzPYw4tiZvTvnxP7j3FyLP5psYlURc8H2kNPgtzc5d6VgUEUqa4DKxAD1b8t
         Mc+9gcRM42Sz2ttV3EwpOpyfwBu06k3WtIBcwMUTvJHTLWdDyS0Fi672ULtSc4sExqmJ
         cRfvuijcE9RN6TCX0bwLynVdahWMEHVPxGxVziHNsHKKE6J4yqNk6ESO/eQLaOSSeCBq
         tIOQ==
X-Gm-Message-State: AOJu0Yw+HgSsJIpuQuXEPnLoYRjQV6du/0iCc9dEbaq8KfqnyxUF7D0Q
	PhC8Nws0Ubfg+HKoHkJv14xvVnqWwt0bE+R4yuQSssPY3AXf+h0hJv4OXghT9xQ6mIp9bzk2dB1
	LXYYtCa3bNFadJVDHe08Ojxh9EnICzQds1pz7lxVqMg==
X-Received: by 2002:a05:6512:e83:b0:50b:d764:9695 with SMTP id bi3-20020a0565120e8300b0050bd7649695mr3431316lfb.121.1701697911302;
        Mon, 04 Dec 2023 05:51:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHklt6xVj6AheM4nJ/ITslI8zJe6Mb9FtMtlkAksyj04cP7Hg53B0/hSfLM0rl2wWGBvoysUQ==
X-Received: by 2002:a05:6512:e83:b0:50b:d764:9695 with SMTP id bi3-20020a0565120e8300b0050bd7649695mr3431304lfb.121.1701697910899;
        Mon, 04 Dec 2023 05:51:50 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id m22-20020a509316000000b0054ca2e83d4bsm2223332eda.17.2023.12.04.05.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 05:51:50 -0800 (PST)
Message-ID: <f2a3bab9-296c-43a1-9b7e-944c5044feaf@redhat.com>
Date: Mon, 4 Dec 2023 14:51:49 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 01/20] platform/x86/intel/vsec: Fix xa_alloc memory
 leak
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 rajvi.jingar@linux.intel.com
References: <20231129222132.2331261-1-david.e.box@linux.intel.com>
 <20231129222132.2331261-2-david.e.box@linux.intel.com>
 <5c21230-1176-4168-f31f-a0c1f1713ca8@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5c21230-1176-4168-f31f-a0c1f1713ca8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/30/23 12:02, Ilpo Järvinen wrote:
> On Wed, 29 Nov 2023, David E. Box wrote:
> 
>> Commit 936874b77dd0 ("platform/x86/intel/vsec: Add PCI error recovery
>> support to Intel PMT") added an xarray to track the list of vsec devices to
>> be recovered after a PCI error. But it did not provide cleanup for the list
>> leading to a memory leak that was caught by kmemleak.  Do xa_alloc() before
>> devm_add_action_or_reset() so that the list may be cleaned up with
>> xa_erase() in the release function.
>>
>> Fixes: 936874b77dd0 ("platform/x86/intel/vsec: Add PCI error recovery support to Intel PMT")
>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>> ---
>>
>> V6 - Move xa_alloc() before ida_alloc() to reduce mutex use during error
>>      recovery.
>>    - Fix return value after id_alloc() fail
>>    - Add Fixes tag
>>    - Add more detail to changelog
>>
>> V5 - New patch
>>
>>  drivers/platform/x86/intel/vsec.c | 24 ++++++++++++++----------
>>  drivers/platform/x86/intel/vsec.h |  1 +
>>  2 files changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
>> index c1f9e4471b28..2d568466b4e2 100644
>> --- a/drivers/platform/x86/intel/vsec.c
>> +++ b/drivers/platform/x86/intel/vsec.c
>> @@ -120,6 +120,8 @@ static void intel_vsec_dev_release(struct device *dev)
>>  {
>>  	struct intel_vsec_device *intel_vsec_dev = dev_to_ivdev(dev);
>>  
>> +	xa_erase(&auxdev_array, intel_vsec_dev->id);
>> +
>>  	mutex_lock(&vsec_ida_lock);
>>  	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
>>  	mutex_unlock(&vsec_ida_lock);
>> @@ -135,19 +137,27 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>>  	struct auxiliary_device *auxdev = &intel_vsec_dev->auxdev;
>>  	int ret, id;
>>  
>> -	mutex_lock(&vsec_ida_lock);
>> -	ret = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
>> -	mutex_unlock(&vsec_ida_lock);
>> +	ret = xa_alloc(&auxdev_array, &intel_vsec_dev->id, intel_vsec_dev,
>> +		       PMT_XA_LIMIT, GFP_KERNEL);
>>  	if (ret < 0) {
>>  		kfree(intel_vsec_dev->resource);
>>  		kfree(intel_vsec_dev);
>>  		return ret;
>>  	}
>>  
>> +	mutex_lock(&vsec_ida_lock);
>> +	id = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
>> +	mutex_unlock(&vsec_ida_lock);
>> +	if (id < 0) {
>> +		kfree(intel_vsec_dev->resource);
>> +		kfree(intel_vsec_dev);
>> +		return id;
> 
> Thanks, this looks much better this way around but it is missing 
> xa_alloc() rollback now that the order is reversed.
> 
> Once that is fixed,
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

I have fixed this up, adding the missing:

	xa_erase(&auxdev_array, intel_vsec_dev->id);

to this error-exit path while merging this.

While looking into this I did find one other thing which
worries me (different issue, needs a separate fix):

intel_vsec_pci_slot_reset() uses

                devm_release_action(&pdev->dev, intel_vsec_remove_aux,
                                    &intel_vsec_dev->auxdev);

and seems to assume that after this intel_vsec_remove_aux()
has run for the auxdev-s. *But this is not the case*

devm_release_action() only removes the action from the list
of devres resources tied to the parent PCI device.

It does *NOT* call the registered action function,
so intel_vsec_remove_aux() is NOT called here.

And then on re-probing the device as is done in
intel_vsec_pci_slot_reset() a second set of aux
devices with the same parent will be created AFAICT.

So it seems that this also needs an explicit
intel_vsec_remove_aux() call for each auxdev!

###

This makes me wonder if the PCI error handling here
and specifically the reset code was ever tested ?

###

Note that simply forcing a reprobe using device_reprobe()
will cause all the aux-devices to also get removed through
the action on driver-unbind without ever needing
the auxdev_array at all!

I guess that you want the removal to happen before
the pci_restore_state(pdev) state though, so that
simply relying on the removal on driver unbind
is not an option ?

Regards,

Hans


