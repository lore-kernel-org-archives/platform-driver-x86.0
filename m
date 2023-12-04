Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aNqftzjp"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE06FDF
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 06:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701698794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iP3CozqrLy0elTpkysoSjmWyp3cgCvt5iYfHQDtR2bY=;
	b=aNqftzjp2kDAdqUqCjSX/yUMRS89IHcFGMoz7DW9U55jUJz18pE29VgyWvHi8clqAPHSGI
	Hy0q2JcBfqsstYIKGcnnNoXC6mhgdoeOZ75NWwKVNu2mtNOGRj5aMT/UVSe9mRjINueAh7
	wL5S8lwKIzQFlEj6KJYChj2++zn6/X0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-jWexAAi2NPOLyRq14zDsdw-1; Mon, 04 Dec 2023 09:06:29 -0500
X-MC-Unique: jWexAAi2NPOLyRq14zDsdw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9fd0a58549bso637881166b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Dec 2023 06:06:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701698788; x=1702303588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iP3CozqrLy0elTpkysoSjmWyp3cgCvt5iYfHQDtR2bY=;
        b=DGsjSeFrhp4x3rHQp9xLhiV9ruBqU/7BhQNhlZZjkVkMj6yw+S8WvDoHA2qH3SgwFp
         0dY5yiTsdsAWs8D0FLHCAW2A/z5jDBXP6ZoZT7M06Ra+8/jKXKCvZ/5g9oUx45ZcFixt
         S0W+5Dcb1WXT8thAFrrxb8WGQyfEsIhqxulYo0pt2+P3kaIMrIRhaqr/LZdgKJgYwZ5x
         IWGE61ucRBydZ5xudwgX0oBn0C3kPlotibzFweykUVcGRJeQMTc/f9zspMYEQEE8F+Wg
         pWARtXZxlacCZ9P5pFfJ3sbXCXfGhOpjNbOxVK5KrySnWfZ67XK2XwOFe5YKVeTar7BV
         iQCQ==
X-Gm-Message-State: AOJu0YwUeptLRMfnxeDJAMy109ZlNIyXp42DKpIKdCduuEZcnvrh0qrI
	HJY1zHNPBqp2RSWarpbtXGHt2BwS5EhoIGZtQJpbpmPUlzQKrDFjhOre7icz9Sujj8xJcJS3oou
	od+NnhEpW4DxgJknqkKuBdha7itplSgxagyeP8rUT2w==
X-Received: by 2002:a17:907:a1a4:b0:a19:a409:37f3 with SMTP id om36-20020a170907a1a400b00a19a40937f3mr4028370ejc.76.1701698787967;
        Mon, 04 Dec 2023 06:06:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXAAxBoQkos/LUHu6WztgWbNUZ+1f6cABFS8k0RcUbcpnslt++Dhqr0L63KVtgnFx5Z0/G5w==
X-Received: by 2002:a17:907:a1a4:b0:a19:a409:37f3 with SMTP id om36-20020a170907a1a400b00a19a40937f3mr4028356ejc.76.1701698787653;
        Mon, 04 Dec 2023 06:06:27 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id sa12-20020a1709076d0c00b009fd585a2155sm5307858ejc.0.2023.12.04.06.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 06:06:27 -0800 (PST)
Message-ID: <f981896a-1c90-4475-84e8-7d459ffb97ed@redhat.com>
Date: Mon, 4 Dec 2023 15:06:26 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] TPMI update for permissions
Content-Language: en-US
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231130214751.3100418-1-srinivas.pandruvada@linux.intel.com>
 <e84824057954fa8593783c4433f5b535f0da6490.camel@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e84824057954fa8593783c4433f5b535f0da6490.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Srinivas,

On 12/1/23 00:24, srinivas pandruvada wrote:
> On Thu, 2023-11-30 at 13:47 -0800, Srinivas Pandruvada wrote:
>> Process read/write and enabled state for feature drivers. When a
>> feature
>> is disabled, don't create a device to load a feature driver. When a
>> read
>> is blocked then don't load feature drivers. When write is blocked
>> continue
>> to function in read only mode.
>>
>> v2:
>>         Dropped patch platform/x86/intel/tpmi: Add additional TPMI
>> header fields
>>         Addressed other review comments, details are in each patch
>>
> lkp@intel.com is complaining that these patches can't be applied. I
> will fix any issue after review and post v3 if required.

Thanks.

I guess this may conflict with or depend on:

"[PATCH V6 00/20] intel_pmc: Add telemetry API to read counters"

which I have just merged into pdx86/review-hans, please make
sure your next version on top of pdx86/review-hans.

Regards,

Hans


> 
> Thanks,
> Srinivas
> 
> 
>> Srinivas Pandruvada (5):
>>   platform/x86/intel/tpmi: Don't create devices for disabled features
>>   platform/x86/intel/tpmi: Modify external interface to get
>> read/write
>>     state
>>   platform/x86/intel/tpmi: Move TPMI ID definition
>>   platform/x86: ISST: Process read/write blocked feature status
>>   platform/x86/intel-uncore-freq: Process read/write blocked feature
>>     status
>>
>>  .../intel/speed_select_if/isst_tpmi_core.c    | 25 +++++++++++++
>>  drivers/platform/x86/intel/tpmi.c             | 35 +++++++++--------
>> --
>>  .../uncore-frequency/uncore-frequency-tpmi.c  | 15 ++++++++
>>  include/linux/intel_tpmi.h                    | 18 ++++++++--
>>  4 files changed, 72 insertions(+), 21 deletions(-)
>>
> 

