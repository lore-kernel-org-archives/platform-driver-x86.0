Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IP9J+ofu"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 506E1A0
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 06:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701699572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CVxcuA5O7vtHxh6BDYzSDk/ZrvKnBNgsg9DsBQMzwt4=;
	b=IP9J+ofuUqPLNnu7A33KXQbt4qxhOSu6O3X4CYNLT8a0yrcl6b71n1CBDWxB5v6ySv/bb8
	jXPXEyWlXd/lUfyqhCEl+S1bujkexj3em1eM3FCCAVBFG7rDrDKl5Anr0480EhpzfKFRYw
	VSjWesEWcqr/AK3Kp4yN7mcNVEPT0A8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-zK7KDZDdMT2M-325hRHSSA-1; Mon, 04 Dec 2023 09:19:26 -0500
X-MC-Unique: zK7KDZDdMT2M-325hRHSSA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a1b7de1efb1so36705266b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Dec 2023 06:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699565; x=1702304365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVxcuA5O7vtHxh6BDYzSDk/ZrvKnBNgsg9DsBQMzwt4=;
        b=oErw2Owisa21H+kf4QbwCrRqlBo5fARungZuOeOqTNHMX9WJXLsSDw3Bj7sMEAqabu
         ZFsLz0tzeA8BoL1zDcYeZKBlkUcPY64uTVSMOExJs8TjF+G0GPyo8QH+x9l0bkSOtDFi
         +hQsYDojberpE0hGcXhf/HGdmagsksIbHgSZVP7uaDxBqKmR0QeGVLQi6HFrSqErEARb
         bK52IzebCZTpingLTlBZhz0DrGIhaoWSpvNLR3KdGk8tRG5Vema7tH35GwC3kn8348TO
         z5kQ7Wr1ZrJ4mxmZAKetSrIwYMCXoBNqOp8jA5VIza7hKCkMvnWc9uV+RAMJeqO2WbGV
         Zyvg==
X-Gm-Message-State: AOJu0Yx7zrpMedMBmkD9Q9VFi75gYnftvf5o1l8KY6eD6GLvOQJt0i5w
	5jh1zBSGqxZqsc9zocxY+9yadiO3gSRshMEGntj5itOn/gt43/0FJKfAThlSiACM+Q6iLlTicoa
	NGwxGGAKMdVYauX2ifIH7YFqgpR7r6L+96A==
X-Received: by 2002:a17:906:51de:b0:a19:a19b:55f0 with SMTP id v30-20020a17090651de00b00a19a19b55f0mr284929ejk.128.1701699565256;
        Mon, 04 Dec 2023 06:19:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/EGVsdST4KQF6EyBnFKk8CMoutzazJzlTXbos+FVQn2CFyvQ/oSKstzczb4hmwV+z2HH0sw==
X-Received: by 2002:a17:906:51de:b0:a19:a19b:55f0 with SMTP id v30-20020a17090651de00b00a19a19b55f0mr284924ejk.128.1701699565007;
        Mon, 04 Dec 2023 06:19:25 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cb26-20020a170906a45a00b00a0958af2387sm5291092ejb.201.2023.12.04.06.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 06:19:24 -0800 (PST)
Message-ID: <5601c760-dc79-4131-99f0-961d5cdcfbc2@redhat.com>
Date: Mon, 4 Dec 2023 15:19:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] platform/x86: ISST: Process read/write blocked
 feature status
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 markgross@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20231130214751.3100418-1-srinivas.pandruvada@linux.intel.com>
 <20231130214751.3100418-5-srinivas.pandruvada@linux.intel.com>
 <d3b0dd08-4eca-4268-8b13-e60bd3d85524@redhat.com>
 <e64acb49-608b-a673-c145-7b6bf4c38d5a@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e64acb49-608b-a673-c145-7b6bf4c38d5a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/4/23 15:11, Ilpo Järvinen wrote:
> On Mon, 4 Dec 2023, Hans de Goede wrote:
>> On 11/30/23 22:47, Srinivas Pandruvada wrote:
>>> When a feature is read blocked, don't continue to read SST information
>>> and register with SST core.
>>>
>>> When the feature is write blocked, continue to offer read interface for
>>> SST parameters, but don't allow any operation to change state. A state
>>> change results from SST level change, feature change or class of service
>>> change.
>>>
>>> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>>> ---
>>> v2
>>> - Change read_blocked, write_blocked to bool
>>> - Move the check for power_domain_info->write_blocked for SST-CP
>>> to only write operations
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Did you drop Ilpo's Reviewed-by from v1 on purpose
>> because of the changes ? Or did you forget to add it ?
> 
> No he didn't because this patch had an issue in v1 so I never gave my 
> rev-by for this patch. ;-)

Ah, there are 2 patches with "Process read/write blocked feature status"
as part of the subject, that confused me :)

> But here it's now for v2:
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thanks & Regards,

Hans


