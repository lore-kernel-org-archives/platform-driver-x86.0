Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC9C156C76
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736165449; cv=none; b=E3XD4lZ8gwHkeQ+5FTvWyPj7GEWId2offUl8ZGn3sH4huegGhreLmuBNQyUFaPKxvkCapJG/wAs3CVs6pWvHdgxjAdhVwDc913uTtcZyX7hI3nHOtsFk3+UPmnTl+1EYlSMJGLIYILfAvp0n7tuRKbeYVkrklvBkIS+e634CQm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736165449; c=relaxed/simple;
	bh=h/SiA2Nst9YF+/qf+q3qCC2y4UuFq/eLrJbcTugMNmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GF7z4dMlGKLz4YMNZ+kMHRAqCFiaet83LP9ye1wTVeNSOXagPD9PR4q2WBpuW6LUpsSWb5ujcVqUyDgU91aJm+E7YFVB0v41NJ5v1kpPVjzWxDgGAS3TK/ymFPsRzPvuyQ/hEX+tdzK6F+EYU5AYdkL9rL/UIQiGbNsF2HC82bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WSh0T8Xk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WSh0T8Xk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736165445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNZKP+IxG7bCpDZSzbqhWjapYCnNn6/zGLpIuQqr0Lw=;
	b=WSh0T8XkfRVn6+3K4KKd5ZNsYUtLRBqxWM89YtnGu/vwNIhnRNNBgiaNQ7J9GCLiza6czt
	Ekn3oyuAZFNCAwmw/iCir51Sludk+nnLt0R5atER8eGO9WEY3Mug5QQu55mPP+HnI8H+e9
	ROEVsLQKCpSIHCsdVcNM1XHeJ1nqe5I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-mm_7t7tdPB2eQRdpj_KgPg-1; Mon, 06 Jan 2025 07:10:44 -0500
X-MC-Unique: mm_7t7tdPB2eQRdpj_KgPg-1
X-Mimecast-MFC-AGG-ID: mm_7t7tdPB2eQRdpj_KgPg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa66f6ce6bfso1007693966b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jan 2025 04:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736165443; x=1736770243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNZKP+IxG7bCpDZSzbqhWjapYCnNn6/zGLpIuQqr0Lw=;
        b=qIIZaxpYkUnlIJEf/5Rlb8waliXDYDhLd3NNm94hBDs1kzcf983QTJaCwl1byf6/h3
         YoA8dnVHG/UZL6ER1dHfFWNAbk+GLO25dWv4P85SxyC8ACDDwUkCiADWYj+QqoOpLUsw
         I52LN1ZjuRxylP/aZpcrmz/OxHsRVnT/TJhzfrtgibceZOcz3QzpviEvCKWufccDccKe
         gZRdJWHwDYNNFFTKibA3mZigZL5odVL3sdWfdk2seIyPTXE4rYFLOF935FLtYhj+5sRZ
         TfE7YMTNwgRjVlsx2/jLWE58qpHFkgMujqzeiinUkDU2lRkwZZCPficuV5LLz97XRmHY
         ifqg==
X-Forwarded-Encrypted: i=1; AJvYcCVShw5ANOl63GtKrgjmAPg8bWbrrcviVuzvfBK0yVEiq5SWs97Z9Ee93OP7WdgJYOfmgRGysCpbxX0h7cbjK4GPKNMs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8XTTxA5JmRzq5K8BAqAMOP8AnqmGjAhTRZdbUA7eGbCHbpv8K
	nnOEmohiAEN6d3OYeUM88NHR8+mxxsYSwmqwmzJEUsj+EPM8phr9hp8rTiAlW9L+lFcJ9kmPyp/
	H7dWl9ngsNmwiJcv4nVsMvB4VvjhIrRiK5L+xTl/sdMO7z3+N7d1UgVHdB5yemF+DO8sKOYE=
X-Gm-Gg: ASbGncvtzcq5BI8qgX+00vI53rxbeVYoey37LKRxK398nJPCxgR5DiQkbDYhs1Lh57F
	9JnE15GmbFgkSWaoHm9nvJTcrqzEAZoXFVnQxVi/ngg5biu+yiskeyDMZk9A+CxMobYhucdoDTW
	oICUoACyPTJ+vEA73AeLy9QG5qFFRW+5lrExLBZMFoTEJ508LOoJ/D+m9GiXHlNqv1/P3F7w+PG
	KDsogLnc2sfOtmSXXeaUJcOxdsJZpIZTBh+lYIJwwBUYeuLSXiZSe0xECDU
X-Received: by 2002:a17:907:728c:b0:aab:9430:40e9 with SMTP id a640c23a62f3a-aac2d420441mr5136220466b.32.1736165443494;
        Mon, 06 Jan 2025 04:10:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKin3ZmuDW00Ow2f9hMOrzlwab5GBqlOIwl7hfXkpgt0JX8rGsmdogPLehiiXGg8JjoVQZxg==
X-Received: by 2002:a17:907:728c:b0:aab:9430:40e9 with SMTP id a640c23a62f3a-aac2d420441mr5136217566b.32.1736165443124;
        Mon, 06 Jan 2025 04:10:43 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aae984dba62sm2017552766b.7.2025.01.06.04.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 04:10:42 -0800 (PST)
Message-ID: <3c9cefea-dd97-4b02-94b0-95483706df80@redhat.com>
Date: Mon, 6 Jan 2025 13:10:42 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] platform/x86: dell-smo8800: Add support for probing
 for the accelerometer i2c address
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Paul Menzel <pmenzel@molgen.mpg.de>, platform-driver-x86@vger.kernel.org
References: <20241221111103.26124-1-hdegoede@redhat.com>
 <CAHp75Vc1tTo1TO7H4WHt=JWV-FYJHqL0xV95kmyh0VEV64cbBQ@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vc1tTo1TO7H4WHt=JWV-FYJHqL0xV95kmyh0VEV64cbBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 23-Dec-24 6:10 PM, Andy Shevchenko wrote:
> On Sat, Dec 21, 2024 at 1:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
>> of the accelerometer. So a DMI product-name to address mapping table
>> is used.
>>
>> At support to have the kernel probe for the i2c-address for model
> 
> Add (?)
> 
> models

Ack to both, will fix for v11.

>> which are not on the list.
>>
>> The new probing code sits behind a new probe_i2c_addr module parameter,
>> which is disabled by default because probing might be dangerous.
> 
> ...
> 
>> +               pr_info("Pass dell_lis3lv02d.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!\n");
> 
> command line
> 
> (mind the space)

Ack, will fix for v11.

Regards,

Hans


