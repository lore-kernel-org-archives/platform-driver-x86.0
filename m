Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58A076044
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713193835; cv=none; b=JxdU5R5wcVTE0c9YQpBWqiLg5zNreTEThaE9DhupeglowH5pTkwQzu8st4gn+TWXPRvvrOppSs2bUedyPuPaTNgecqnAH4lXbDbyDbQOwaDHz9iA1E8Y1SDO0XErLLhA8Bg7vExc7+B+pK4sj1hf+W+wEmj5zrIo/4+dewQq4M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713193835; c=relaxed/simple;
	bh=zWaFqp45xreSd1kt8H0PrqpcJfPYwloQ5CpoGlW5FJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdVvogh2e/YXUaBAQwh174c/udI2yBTSvgmMhdDunQPJEzmv3nNx1Ttym74hANr2HCvdigIuXVHaTQyZIPYDSXLY3hiSLX+KyQWEdrJMKkiiRJzFdj5wR46sd1AoxJve5Z3jW/HzedC0i8Y8OTAxMbF7v8GoRWqKBYC70ne0Tlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bf+Ozg4Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bf+Ozg4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713193832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2aJKc1qLqZnJWxvdZ9CCWCQa3ouDy8zOEavGI3plEjw=;
	b=Bf+Ozg4YTI6BGcQlHVI7smv96oH2L2tvFUkA6hFQIHadX5QFjcALVOApCN59a8jGO/VGE0
	yTsDbP/+M2WG2pSGS/NdtAalm6NDDKGcRe9J/ffYLwoPliqEQvSr2rMXHAOPBex8n57Y1M
	y0SunWsWtzE5vyVy19HS+LoDUFyKQ/A=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-DzuX1vuuMGe7BGD-PsPhcA-1; Mon, 15 Apr 2024 11:10:31 -0400
X-MC-Unique: DzuX1vuuMGe7BGD-PsPhcA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-51701401bd4so2464650e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 08:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713193828; x=1713798628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2aJKc1qLqZnJWxvdZ9CCWCQa3ouDy8zOEavGI3plEjw=;
        b=JFHnHzUZoS1ar1WpBHYErx8P7kNghqxFk7u0KtbP/fpm1uNovlp6zVxhE4T2dKUW0G
         L6MjgtKJgpHdIuSVkgeZp09TEO3Ebf5GtQ73xJulZ+J+JMfZgYVYCaimyHIWNdxBl2cc
         Lf5yMCEfG+TU/y3jSJVOXAyd+HxuyVzt/hjThnymsRk4ssIuQms7WjtYhIg7vBMrb9DN
         sYtQg7KIMi1c3XGL5wvZ55WPlvTpGlYR0QARls3wRTQjT6mI37D97PdbqONgUW1muAHW
         kYS6zORP95jytBL8nHSllR2CRoA5j3WbFfRo0AM+qr6HnrsTtYVTylbdUAmOB5mXP7K/
         u/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRS7R4Rq8gxkRch2zKwWcH45rDoEIrb0auTVygXADt8mpiQXmKbGalapLxuqWyqkOplAGxHva0glXxXqnYGwh95nvevCo9NXbkrag11ku4AqRT+w==
X-Gm-Message-State: AOJu0YzoEWoi4kwzJ+ni7PhYCz9DvPxTX/ux77Zn+4b0ixipdRSWzTGw
	IJcqlicbEboM+T2DWfLrjdrPXsG8szPkHzCg4KHCYX4njvCXzxZ6zX8esQMKYUIARSQOpTQgxDu
	PlI2T4rE5V9QoJ047S0FoMIZAKySOK7B9FacuE1Qbmgl66do9wg8IxbKPSS0rdV71xP0E8ZE=
X-Received: by 2002:ac2:4d08:0:b0:517:84fd:2343 with SMTP id r8-20020ac24d08000000b0051784fd2343mr6248204lfi.41.1713193828620;
        Mon, 15 Apr 2024 08:10:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExaaXlGV0rESBoorCek8bZesfSkRVyMdj0WAYaof5VX8Izy8004klGK7UZXnewro1ZZRR2oQ==
X-Received: by 2002:ac2:4d08:0:b0:517:84fd:2343 with SMTP id r8-20020ac24d08000000b0051784fd2343mr6248186lfi.41.1713193828190;
        Mon, 15 Apr 2024 08:10:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qs1-20020a170906458100b00a5227c8f0e4sm5154321ejc.89.2024.04.15.08.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 08:10:27 -0700 (PDT)
Message-ID: <ab3caa8c-daf0-4d35-a7c7-b1a14f7bc1bb@redhat.com>
Date: Mon, 15 Apr 2024 17:10:27 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] platform/x86/intel/ifs: Classify error scenarios
 correctly
To: "Joseph, Jithu" <jithu.joseph@intel.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 ilpo.jarvinen@linux.intel.com, markgross@kernel.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 ashok.raj@intel.com, tony.luck@intel.com, rostedt@goodmis.org,
 ravi.v.shankar@intel.com, patches@lists.linux.dev
References: <20240412172349.544064-1-jithu.joseph@intel.com>
 <20240412172349.544064-2-jithu.joseph@intel.com>
 <69d360fc-85e4-4a6d-8f08-9f90dd7ec583@linux.intel.com>
 <57c32cfd-136d-4c72-9f4d-12599b508fb8@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <57c32cfd-136d-4c72-9f4d-12599b508fb8@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Thank you for this patch series.

On 4/12/24 9:31 PM, Joseph, Jithu wrote:
> Sathya,
> 
> Thanks for reviewing this
> 
> On 4/12/2024 11:32 AM, Kuppuswamy Sathyanarayanan wrote:
>>
>> On 4/12/24 10:23 AM, Jithu Joseph wrote:
>>> Based on inputs from hardware architects, only "scan signature failures"
>>> should be treated as actual hardware/cpu failure.
>>
>> Instead of just saying input from hardware architects, it would be better
>> if you mention the rationale behind it.
> 
> I can reword the first para as below:
> 
> "Scan controller error" means that scan hardware encountered an error
> prior to doing an actual test on the target CPU. It does not mean that
> there is an actual cpu/core failure. "scan signature failure" indicates
> that the test result on the target core did not match the expected value
> and should be treated as a cpu failure.
> 
> Current driver classifies both these scenarios as failures. Modify ...

I've modified the commit message using the rewording suggested above
while merging this patch and I have merged the entire series:

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans






>>> Current driver, in addition, classifies "scan controller error" scenario
>>> too as a hardware/cpu failure. Modify the driver to classify this situation
>>> with a more appropriate "untested" status instead of "fail" status.
>>>
>>> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
>>> Reviewed-by: Tony Luck <tony.luck@intel.com>
>>> Reviewe
>>
>> Code wise it looks good to me.
>>
>> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>
> 
> 
> Jithu
> 

