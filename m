Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F161CCCA2
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jul 2024 19:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719947758; cv=none; b=OLynAmyiG5ltl0Dp2JgE+MO7HznVg8dsVqAXChFxe/UOBgxya5KXFJ24jyjgVwfNsrxhEvT0ht2zs/UhMqxN+St6pWUF2SOCsEISTIt97H5aP/38CTe7lJy4ndtIWQv8Zhk5uAuDbm56imWlKfSd/UbnUUcfJeOS40HGqJj7Ofg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719947758; c=relaxed/simple;
	bh=XVYgl7stxuApEvQU/C547hFtmCZvyIV7HG0E7UpAXus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9szTbmsG28zyowx5/eDVRxn/9laMRWvX8L+EiMpboBgzCahjPv+8YmawCdR6HEe+248rZ0Z0TtxafikB3AcQHmTigxFQMTh5SlMNXQSuYgNg9xcGeFTOCu3sBHzyg5uL1JrNd+zDR08uzUnyFbgWQXWqitfSn24VltLQPzlOkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FobwSvBB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FobwSvBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719947755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Hf4Hn8E9sYvRywOdnCFtlcglvdvtce0hhg7HQwgfjY=;
	b=FobwSvBBjMkygsjoX4A4S9wkXYK/sI+evX+3QjiBPPVCNdeAOX8u40vd+7JgD8Jcur7z4Q
	dmFXWo+gP9W2+n22ovEqPBY9EmNVuoOZV1Md9TUi4ZjwMvGAqQo1uj/cRv6KpRFmf+5QO7
	orDlYYtNsN93FIkYp5z+X4xefM2Jg1k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-p00ni3UDMg-iMipc0iYpMw-1; Tue, 02 Jul 2024 15:15:52 -0400
X-MC-Unique: p00ni3UDMg-iMipc0iYpMw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-57851ae6090so1453089a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jul 2024 12:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719947751; x=1720552551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Hf4Hn8E9sYvRywOdnCFtlcglvdvtce0hhg7HQwgfjY=;
        b=ZSM+7nH/vaRzx6cKxC8zzFZwYrb2wctMaJhV77gniab3IOW8sMOHEqIEhls63yHwWf
         OMoRtaafGl6PegWr9bGbt840/iWcOORPzO5nV+icM7+jKpnUVPWHFQ9JEj8dMts4oBsr
         b6n6iq6RzYG4Zbs+zrzPB89rytgsrGWYuCfPvmDfAQYKREQOUHHPdB9Zz08QlSfGKjqc
         QCca/AyzRBjNtVnsnwrJy//QQO8u/rF4tqZhgZRFGUQcXvnZHjOYdVwwcfLVWz0aHRHc
         ATN77taXG6OI0IZcfmJqXA2iDong76U2TRcnwWfdilT9DrW9uAFPsvvlGdtKt9MRfW3Y
         3v2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgak3zxs6sLkT8IVcjYqRkuH4MhQbt7qwcaikQq0VHDEliYUeyeXhwy6X9S27rx1ciskM/DROnyHMAkzjekUJPy9UjYBj2zizB/WpzHZ8vISrEzQ==
X-Gm-Message-State: AOJu0Yw+wThl9jJ3rwqchPULMV1D2emu9Pt02Da8RFuiVv+n41AVSpRm
	FlsMpwxpmuZ9Mk0v3QY6HsKJaaWvC4jWDrVs7CB3W4dbtqbqlAN8duZCk8ja7ox0moASGahlAPR
	tWlXiUF4IJlfkD1f7TkF2bCVFZ1y0T9Fl87VjN7wblpqH5ROW/6cC+RvAfKSMKQ4Y81IQw7U=
X-Received: by 2002:a05:6402:11c9:b0:57d:46f4:7df5 with SMTP id 4fb4d7f45d1cf-5879f59bbc2mr7325305a12.23.1719947751027;
        Tue, 02 Jul 2024 12:15:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPgNAvIl+uKPMrCm/+he16pQATca+s9p+IoIeAaWVXVH074kRYoqFuRlKUkXNT5j41pHQEHg==
X-Received: by 2002:a05:6402:11c9:b0:57d:46f4:7df5 with SMTP id 4fb4d7f45d1cf-5879f59bbc2mr7325290a12.23.1719947750623;
        Tue, 02 Jul 2024 12:15:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58613815e1csm6098873a12.44.2024.07.02.12.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 12:15:50 -0700 (PDT)
Message-ID: <c980f524-1259-4a3e-9326-5f533e62bb25@redhat.com>
Date: Tue, 2 Jul 2024 21:15:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] platform/x86: dell-smo8800: Add a couple more
 models to lis3lv02d_devices[]
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240624111519.15652-1-hdegoede@redhat.com>
 <20240624111519.15652-6-hdegoede@redhat.com>
 <20240624181456.k7ikngwy2dohoqnw@pali>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240624181456.k7ikngwy2dohoqnw@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/24/24 8:14 PM, Pali Rohár wrote:
> On Monday 24 June 2024 13:15:17 Hans de Goede wrote:
>> Add the accelerometer address for the following laptop models
>> to lis3lv02d_devices[]:
>>
>> Dell Latitude E6330
>> Dell Latitude E6430
>> Dell XPS 15 9550
>>
>> Tested-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> q# Please enter the commit message for your changes. Lines starting
> 
> Garbage at the end of commit message.

Thanks, fixed for v5.

Regards,

Hans



> 
>> ---
>>  drivers/platform/x86/dell/dell-lis3lv02d.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
>> index e581b8e2a603..a7409db0505b 100644
>> --- a/drivers/platform/x86/dell/dell-lis3lv02d.c
>> +++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
>> @@ -43,10 +43,13 @@ static const struct dmi_system_id lis3lv02d_devices[] = {
>>  	 * Additional individual entries were added after verification.
>>  	 */
>>  	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5480",      0x29),
>> +	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6330",     0x29),
>> +	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6430",     0x29),
>>  	DELL_LIS3LV02D_DMI_ENTRY("Precision 3540",     0x29),
>>  	DELL_LIS3LV02D_DMI_ENTRY("Vostro V131",        0x1d),
>>  	DELL_LIS3LV02D_DMI_ENTRY("Vostro 5568",        0x29),
>>  	DELL_LIS3LV02D_DMI_ENTRY("XPS 15 7590",        0x29),
>> +	DELL_LIS3LV02D_DMI_ENTRY("XPS 15 9550",        0x29),
>>  	{ }
>>  };
>>  
>> -- 
>> 2.45.1
>>
> 

