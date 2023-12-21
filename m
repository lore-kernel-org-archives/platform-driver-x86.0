Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE087318F
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 20:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CdWyEzJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703190034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GuyVgo92qdBEFVygvEiKdzq/yc7TkKebMwat1gsyPA0=;
	b=CdWyEzJFY6apnBKhmwAzcc/KuELr6oVh2jXhZz7m9RIewg+kuok8QUvRQorR9KJxTfMrjP
	E7Akc8KxapnD+C+6J4YO8e71C/f2UQXrCXvYHX/LPO682CWydQWD603TSs5z1YNInmmvIJ
	obcwqFqKUijDIfZVR6dIDwEWvdPAK/Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-rFcHeBdRM-aBbi4UELDbHg-1; Thu, 21 Dec 2023 15:20:32 -0500
X-MC-Unique: rFcHeBdRM-aBbi4UELDbHg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a1f6b30185bso65192566b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 12:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703190031; x=1703794831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GuyVgo92qdBEFVygvEiKdzq/yc7TkKebMwat1gsyPA0=;
        b=fFucD7rWvTsb5WmCZTCeW2tzluFzVrEJMxA2g7iF8KCvYjNjGS5zrHkP6PGn8Y04yG
         N9FceNORWcRbRAdef0wPevWJR1mCBGQglfpTCTpCDHWxflobpZ9q4Wy6rb8L5GofziEa
         kEq5ozpVu7mrpkNUVqWXs5z5E9PD5AoTgJMXSkY26Vt+Tuqf3p030GP7tDHnTjZUrRrN
         fZpeyG34rLbOAc5enypGdT6apcrNBuS39jmaA5SjMloGIfvm7SziOfYzBQbWo6UVeb1O
         R5i4G90UZPCS12viQTAFl2gtI5q8jl8CS2SJdAKyf7dQJsVz7TS5PuqNskfmdTIFFnrW
         cRNA==
X-Gm-Message-State: AOJu0YyC5EqDzChX5/rKSHsJNjuPN1COsw3ngL2pYGCTIAuSmBDBbHKM
	sXVXKNkNXDye+ODjclArMX7GiRmpvvRm/dOIbSUvGjBxs5hTpi2YO/VoVAT6hdgOgIAWHstjIc4
	h4H5dKNu3U/s4/BGLghMTg2rKlzpsdSO7rYs1keUFHQ==
X-Received: by 2002:a17:906:410d:b0:a23:195c:8aa6 with SMTP id j13-20020a170906410d00b00a23195c8aa6mr104365ejk.13.1703190031730;
        Thu, 21 Dec 2023 12:20:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZ4uRfSOYBzNMe5WTUkuE55E+4SjxZ8VpHp0TBB+diBDVomxrqOcLpmMF0qJIgR9Tq8shrBQ==
X-Received: by 2002:a17:906:410d:b0:a23:195c:8aa6 with SMTP id j13-20020a170906410d00b00a23195c8aa6mr104361ejk.13.1703190031420;
        Thu, 21 Dec 2023 12:20:31 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id hy25-20020a1709068a7900b00a2327e826ccsm1299994ejc.201.2023.12.21.12.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 12:20:30 -0800 (PST)
Message-ID: <0478c715-fc85-4024-aaa3-1ad6a51f86f7@redhat.com>
Date: Thu, 21 Dec 2023 21:20:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] platform/x86: Move hsmp_test to probe
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Suma Hegde <suma.hegde@amd.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20231221172114.1569559-1-suma.hegde@amd.com>
 <14b02288-a14b-4e06-acf2-f2145df565a6@t-8ch.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <14b02288-a14b-4e06-acf2-f2145df565a6@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 12/21/23 18:27, Thomas Weißschuh wrote:
> Hi,
> 
> The subjects of all patches in the series are
> very generic.
> They should have some more specific prefix IMO.

That is a good point, but that is something which
I can fix while merging these. So assuming this
is the only outstanding comment there is no need
to send a v4 for this.

Regards,

Hans



> 
> Dec 21, 2023 18:21:48 Suma Hegde <suma.hegde@amd.com>:
> 
>> This is in advance to supporting ACPI based probe.
>>
>> In case of non-ACPI driver, hsmp_test() can be
>> performed either in plat init() or in probe().
>>
>> however, in case of ACPI probing, hsmp_test() cannot
>> be called in init(), as the mailbox reg offsets and
>> base addresses are read from ACPI table in the probe().
>>
>> Hence, move hsmp_test() to probe as preparation for
>> ACPI support.
>>
>> Also use hsmp_send_message() directly in hsmp_test()
>> as the semaphore is already initialized in probe.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>> ---
>> Changes since v1:
>> 1. Add "Reviewed-by: Hans de Goede <hdegoede@redhat.com>"
>> Changes since v2:
>> 1. Add "Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>"
>>
>> drivers/platform/x86/amd/hsmp.c | 30 +++++++++++-------------------
>> 1 file changed, 11 insertions(+), 19 deletions(-)
> 

