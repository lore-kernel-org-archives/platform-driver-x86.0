Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECACF4F608
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hUFINTU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702901466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xfdrGrl0miDPMWiTSTrBQWbpyVQoJQdyZ333ubM2Dgo=;
	b=hUFINTU/JZBl/XbKg88S1O9YMUb1jg8TQkIuhV5jXaN59s/eK6asv2V+fCvUxxXjHWKdZa
	fam9WKeP4JE/HL1z1p6G2Uveqs42cBb2GmagJ+y6yAhG8aBxMd0uJ/kXIlB1zs6wftjyS3
	BwE56TccFVR9rcla64EI5yFFGaIBvVk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-qLWA8ZXoMeSYTClIk7qtnQ-1; Mon, 18 Dec 2023 07:11:05 -0500
X-MC-Unique: qLWA8ZXoMeSYTClIk7qtnQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40c348e529fso26708325e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 04:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901463; x=1703506263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfdrGrl0miDPMWiTSTrBQWbpyVQoJQdyZ333ubM2Dgo=;
        b=Q3PIW1CFJIw4zpgoa3gmdKlols2cM2LhCkgKzv3mP7zSqNo73hqP9xNu8uqkw4jJuN
         tiuwAE4JfsNmVmhnIsq4bA7moeMWDw1US1BQ471F/BRa4oBy400yMTavMRgcfQ5bQOOJ
         jlWtudUJrlcEK6dy8RD7aE/DfggvZ/TUqWCB5LJmQzVYpi6xYuDGd351uXvbUbqgFI1h
         q5rHroPPjvrSLOjGBcZy3O/9QT01F97PpXCzJ4Ed2Nb3hsJ/pvoD3T1XjKd4I2savJZX
         KG0Mf4Od8EnK7hD37jg1WgfQcWk5sHprOpHVNXMk838bMK4Co1rWSUD/oYc1ze71ZvVD
         9W9Q==
X-Gm-Message-State: AOJu0YwZ2xWrZPLEAh1p0FuataEDLkRywxo5qGRthfnStW/B8CG7aFG+
	/LmpFdXPYsMNQOh9Uou0XbpgEaArozEaHTkxKDx5ClXnj2B9LXBIHSLomAfPP5a7WKlcyKfz1iq
	s0+LIppEGVc5cmOdLrB+QNxr579FqprZWWE23nhwyvQ==
X-Received: by 2002:a05:600c:458d:b0:40c:349e:d8cc with SMTP id r13-20020a05600c458d00b0040c349ed8ccmr7197310wmo.52.1702901463238;
        Mon, 18 Dec 2023 04:11:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcSDpiXF02Y6ofb47B13h38+mmObXQJOpYHMS13hzPlA1hjfThem3v3LEimdbwFbWMJQ7VSw==
X-Received: by 2002:a05:600c:458d:b0:40c:349e:d8cc with SMTP id r13-20020a05600c458d00b0040c349ed8ccmr7197290wmo.52.1702901462855;
        Mon, 18 Dec 2023 04:11:02 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id v22-20020a1709063bd600b00a23596d256esm1039708ejf.84.2023.12.18.04.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 04:11:02 -0800 (PST)
Message-ID: <53d6933e-e5e8-4db1-b2e3-b931dc8bf0bd@redhat.com>
Date: Mon, 18 Dec 2023 13:11:01 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add a workaround for Framework 13 spurious IRQ1
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Goswami Sanket <Sanket.Goswami@amd.com>
References: <20231212045006.97581-1-mario.limonciello@amd.com>
 <85397fdb-b093-4c03-8613-3815352f2b2c@t-8ch.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <85397fdb-b093-4c03-8613-3815352f2b2c@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi All,

On 12/12/23 21:19, Thomas Weißschuh wrote:
> On 2023-12-11 22:50:02-0600, Mario Limonciello wrote:
>> The 13" Framework laptop EC emits a spurious keyboard interrupt on every
>> resume from hardware sleep.  When a user closes the lid on an already
>> suspended system this causes the system to wake up.
>>
>> This series adjusts the previous Cezanne quirk (which has a much different
>> root cause) to be able to apply to other systems too. The Framework 13"
>> system is added to the list it will apply to.
>>
>> Mario Limonciello (4):
>>   platform/x86/amd/pmc: Move platform defines to header
>>   platform/x86/amd/pmc: Only run IRQ1 firmware version check on Cezanne
>>   platform/x86/amd/pmc: Move keyboard wakeup disablement detection to
>>     pmc-quirks
>>   platform/x86/amd/pmc: Disable keyboard wakeup on AMD Framework 13
>>
>>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 20 ++++++++++++++
>>  drivers/platform/x86/amd/pmc/pmc.c        | 33 +++++++++--------------
>>  drivers/platform/x86/amd/pmc/pmc.h        | 12 +++++++++
>>  3 files changed, 45 insertions(+), 20 deletions(-)
> 
> For the full series:
> 
> Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
> Tested-by: Thomas Weißschuh <linux@weissschuh.net> # on AMD Framework 13
> 
> The device now only wakes up when opening the lid.

Thomas, thank you for the review and testing.

The series looks good to me too:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Ilpo, do you plan on sending out one more fixes pull-req for 6.7
and if yes, can you add this series to that; or shall I merge
this into for-next so that it gets included in 6.8-rc1 ?

Regards,

Hans

