Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231631F92E;
	Mon, 15 Dec 2025 18:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765824456; cv=none; b=pyWX0ix9EtzD3Bu5/7uaUNgy5gc2C/x8Jtr3f/e6hUeodNyWT8wJWWAVPoGPep/1zdoEhApvQGr/0vvAOydXSG07g9aF7Gzf0rWmRHckd3XmXQZKBrndHMwi+/CY7psEM4xUTyybqAX65/4bJ1qZbFGYLYcJG0QcFwxYHAOx+/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765824456; c=relaxed/simple;
	bh=tPwLsIL/3kJEnbi3YMG/YebDgIu49wgwv0jfGS8nrfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0ND0Wmq4xnE39ancfUujw2zFmmU0juBQx/mpl7zurR/kO/PGDPSugxIuplkud0zLxDyjJyvry8yREfNy8JO6yJKqmtNKYEVWMwH60u7+FwV7ioGZ7mCBCivvCYsdgixUGaajAyJ0Ob1+B1bgQJlBjwueEDGCHLtS8sXfCM0xpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3xSECMVH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3xSECMVH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pVbCaNvJv8vTTLGcUkzq78P+qj3ctcABTCkArtF+b0w=; b=3xSECMVHg5SXoKu/ahOcITprtj
	UJLuYDjEnhub0wrm18hOs423n5EZDUIHS6YJXCNI48UyH89kTm1v6TV/m5iI5jESMs6bEAjoW7Eiq
	re7+n004+lQwG8IUcH9QLZuos1WwID5FU9k66CN54R2BNmKGeY2I+Jc2KvdjZllTFQYoF0PeHQz9/
	HT8kBfkDe6BICrzVzM23BLAXEuDbWSWM5ZH2TNCvkrs0X2llWEQmpECOGfBH/XwP3pmpecdurU2G1
	KAlTn6XFgQsB3rxMs3DrUxLJBxGI1N+bX3cWVDRrd8Bi8822AeCUiCIbOd8I4nlZXvJsBO0LFlPrU
	oyzILc9w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVDbX-0000000491s-0zTj;
	Mon, 15 Dec 2025 18:47:31 +0000
Message-ID: <c6198da4-c596-4ed7-b4a4-f43046cca34c@infradead.org>
Date: Mon, 15 Dec 2025 10:47:27 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel/vsec: correct kernel-doc comments
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20251214201959.2195863-1-rdunlap@infradead.org>
 <cac479ad-e258-fb20-8005-3155e4a7f901@linux.intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <cac479ad-e258-fb20-8005-3155e4a7f901@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 12/15/25 6:10 AM, Ilpo Järvinen wrote:
> On Sun, 14 Dec 2025, Randy Dunlap wrote:
> 
>> Fix kernel-doc warnings in intel_vsec.h to eliminate all kernel-doc
>> warnings:
>>
>> Warning: include/linux/intel_vsec.h:92 struct member 'read_telem' not
>>  described in 'pmt_callbacks'
>> Warning: include/linux/intel_vsec.h:146 expecting prototype for struct
>>  intel_sec_device.  Prototype was for struct intel_vsec_device instead
>> Warning: include/linux/intel_vsec.h:146 struct member 'priv_data_size'
>>  not described in 'intel_vsec_device'
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: David E. Box <david.e.box@linux.intel.com>
>> Cc: Hans de Goede <hansg@kernel.org>
>> Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>> Cc: platform-driver-x86@vger.kernel.org
>> ---
>>  include/linux/intel_vsec.h |    7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> --- linux-next-20251201.orig/include/linux/intel_vsec.h
>> +++ linux-next-20251201/include/linux/intel_vsec.h
>> @@ -80,8 +80,8 @@ enum intel_vsec_quirks {
>>  
>>  /**
>>   * struct pmt_callbacks - Callback infrastructure for PMT devices
>> - * ->read_telem() when specified, called by client driver to access PMT data (instead
>> - * of direct copy).
>> + * @read_telem: when specified, called by client driver to access PMT
>> + * data (instead of direct copy).
>>   * @pdev:  PCI device reference for the callback's use
>>   * @guid:  ID of data to acccss
>>   * @data:  buffer for the data to be copied
> 
> Is it correct for kerneldoc to have the rest as @pdev, @guid, etc.,
> they are parameters to the callback, not members of this struct?

No, it's not correct. We get away with it in several kernel source files
because scripts/kernel-doc doesn't check/notice that.

Would you prefer to have them there but without the leading '@' sign?
Or completely delete those lines?
IMO they are useful/informative, so I would rather not delete them.

>> @@ -120,7 +120,7 @@ struct intel_vsec_platform_info {
>>  };
>>  
>>  /**
>> - * struct intel_sec_device - Auxbus specific device information
>> + * struct intel_vsec_device - Auxbus specific device information
>>   * @auxdev:        auxbus device struct for auxbus access
>>   * @pcidev:        pci device associated with the device
>>   * @resource:      any resources shared by the parent
>> @@ -128,6 +128,7 @@ struct intel_vsec_platform_info {
>>   * @num_resources: number of resources
>>   * @id:            xarray id
>>   * @priv_data:     any private data needed
>> + * @priv_data_size: size of private data area
>>   * @quirks:        specified quirks
>>   * @base_addr:     base address of entries (if specified)
>>   * @cap_id:        the enumerated id of the vsec feature
>>
> 

thanks.
-- 
~Randy

