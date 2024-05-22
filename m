Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628F81E863
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716384634; cv=none; b=szK37VpSw5E/Yxv7VrfYxDiKIYsiToZFGu0ZyQ1FSN2+jh9Th0f9nKdetIGu2NiWx1bOv6q5SIdMmGC/Sm/1PiQ1muH/SnuPBih0x/O3kJWm0gm01OJcMjMa8NvUXQMRi1M0+/GpJv22kopDaXAj71WuAubk8UAK3vKYdC0TBXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716384634; c=relaxed/simple;
	bh=jfXSgBwRrrQuCVqxMFawch12WTme63P9A8RO6bfAVF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=in5wDSK+E6t0scpWNWeIAw4yEuxBrjyt4k6qA7vVJprZdcz4Tr1ZZ7YJv2TpilnS3o6FmBbU7SaJqdv4N8/0ZA7D77qWroC3/gaxvUMoQDJcgYJsZJ5lqRD6lQZJg3mL8HAd5OZUq7bd9p0x2FQWECX+DCWWqnH2NJ0PAzF9Woo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SqRiNgie; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SqRiNgie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716384632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zU+6vg1pXYH/Fq9smC8GcZpWa9dzU2v7jBLJSVG9HRU=;
	b=SqRiNgielkjxPBYcF7X2Ak1JjJAt0Qmht8x36j3F3XCj7twEDskLlfkWknuUwDHT7Y3o6B
	b3HIOZCnML11oOO/tUcogYPWTrxUB4+SwMtvo4aF6utk6BMEKgpLdI+849nCtRfnRKExDf
	JP9jkjZeg5ndV2HgXwH6pkACPJB3m/M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-DZsbd_eVNOegdVUYAWhUtg-1; Wed, 22 May 2024 09:30:27 -0400
X-MC-Unique: DZsbd_eVNOegdVUYAWhUtg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a621c9a65f4so42626366b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 06:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716384626; x=1716989426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zU+6vg1pXYH/Fq9smC8GcZpWa9dzU2v7jBLJSVG9HRU=;
        b=Tm+RPMm5AnxeL0FdfIicscWKtDkJa9hgGmt54vaNW5Sc0t5FH3GwzqW4ayXc8ZjCQA
         MTu6lgR+UVtDLv1Plj8X/wvT9JSjWSKzh3v5N0Fze7b/KagupsXVtVro9BLpFtSbLr8K
         uNtU4RayzyPiEu50nqTmTFKe+3qGBFFDvhTD1TMYWQ17SxBDfZuYrDO0AC2nb9/d+Ncw
         ZaVQ47mkqNSAAzHZwBvT3LWsUbpQeR9M8UaHZYRX0HqL7IddXNwUrssI9OpPMZFNeKHr
         lyTHnoMFkIewLc5peq3F3iyyzI9xx8c9WAr6VsK8wbc3H2cC6Vav31Sq/vwgbocmmxts
         gxhA==
X-Forwarded-Encrypted: i=1; AJvYcCXZkYa2vesslY4pL10NOd2+cLpKlkg6xNWAghAJvB+ZBnffAsVpY+Rq/YYjiTzWMB40O8PtAQLCl6+0Itwi8bqgjU0PZYKGHRgvHIaxba+nv++fog==
X-Gm-Message-State: AOJu0YzHjF1RtjNB3Ddur+miI0NHcR/JiFAKECAzP5tQrH6+XJvpplkD
	S7xmQ6jl7WZL/FnyMDknkA55HS2TheVVoglL283QZiR6r5ndSnsMvvgHQBrEmAZZOtb9NDB0ol7
	R5gJ0IlsvpH+8HfWnFd6p99WS/npF8VX1IyyefIYb0ZGTOvf/bi1VKf0368yKROLaw+Tx7U0=
X-Received: by 2002:a17:906:d506:b0:a58:7298:fdfe with SMTP id a640c23a62f3a-a62281253bamr118450566b.53.1716384626428;
        Wed, 22 May 2024 06:30:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPs3As7TFkv/OA57+pBCFs+X1ihzxAdT//3QweWc2AAkyU5EJ3VQ3d5O3RGGsiWJBeuQQMPg==
X-Received: by 2002:a17:906:d506:b0:a58:7298:fdfe with SMTP id a640c23a62f3a-a62281253bamr118449166b.53.1716384626007;
        Wed, 22 May 2024 06:30:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17894d57sm1789298166b.73.2024.05.22.06.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 06:30:25 -0700 (PDT)
Message-ID: <889a480d-a535-4e31-a0d1-b1ea23d484ea@redhat.com>
Date: Wed, 22 May 2024 15:30:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/24] platform/x86: thinkpad_acpi: Switch to using
 sparse-keymap helpers
To: Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <20240424122834.19801-1-hdegoede@redhat.com>
 <20240424122834.19801-20-hdegoede@redhat.com>
 <1ae4267e-9515-4037-980e-b1f2961b166b@suse.cz>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1ae4267e-9515-4037-980e-b1f2961b166b@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vlastimil,

On 5/22/24 1:50 PM, Vlastimil Babka wrote:
> On 4/24/24 2:28 PM, Hans de Goede wrote:
>> Switch the hotkey keymap handling over to the sparse-keymap helpers,
>> there should be no functional changes from this.
>>
>> Note all the mappings to KEY_UNKNOWN are removed since that is the default
>> behavior of sparse_keymap_report_event() for unknown scancodes.
>>
>> Also drop the big comment about making changes to the keymaps since
>> the contents of that comment are mostly obsolete.
>>
>> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Hi,
> 
> I believe this is what gave me the following error compiling current
> Linus's master:
> 
> ERROR: modpost: "sparse_keymap_report_event"
> [drivers/platform/x86/thinkpad_acpi.ko] undefined!
> ERROR: modpost: "sparse_keymap_setup"
> [drivers/platform/x86/thinkpad_acpi.ko] undefined!
> 
> probably config THINKPAD_ACPI now has to depend/select INPUT_SPARSEKMAP?
> It's fixed when I configure it =m manually.

Thank you for reporting this. This should be fixed by:

https://lore.kernel.org/platform-driver-x86/20240522074813.379b9fc2@gandalf.local.home/T/#u

Which I will include in my next pdx86 fixes pull-request to Linus.

Regards,

Hans



