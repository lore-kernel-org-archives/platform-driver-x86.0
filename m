Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6468E129EC7
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 13:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wn10zjlL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702905908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1bx5TR2TZDBtKHEftLcZg6JazOkuYcSQtbdrdj3CQRc=;
	b=Wn10zjlLxUgIx0vjO9Y42s+g4OtQPry5wHrB2kNlsJHHdaQRdeZ6UYpk+AiQZmZefGbyWj
	B0vSNffMeCvsSJqqt2rvV03uF9HFnDevpKV69clUb/aeFBcHRlaLhVSkDpWUyiRIqtb8xe
	PjrNj09e4CHa11AD9AAi9fThIHzbAMc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-Z5DuI5AKOCaNPrMTPSSsEQ-1; Mon, 18 Dec 2023 08:25:06 -0500
X-MC-Unique: Z5DuI5AKOCaNPrMTPSSsEQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2336545b23so80821766b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 05:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702905906; x=1703510706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1bx5TR2TZDBtKHEftLcZg6JazOkuYcSQtbdrdj3CQRc=;
        b=YvupQC5A3lrCQkG9M9zc166hRnHMu7PcUTdYBIUFfGA/H8+hn9rCsUK48Kt6W4CB5r
         bBK42TVyp4hdibgemN4ObCKh396xTYTzXlIcrjpmWyaXfh4W8NxfhjVrHyDAGULgDiJh
         chuYtEKQsHGhOp46f4JBL1DhomsX09+vMgM3HSvGGM3Lww+xzXhnFuwmx7EhzpbTx53o
         JgG4UJ5Vjg5fdq+3OoYa21McXS2+1o73KyPGa+Wrzs+TacuEvvKpK12vW+xGGvX+MXlV
         KpGWDbnntccJ2n5KEpQgRPlF3sF29qAxUEXBkvVfFv2IvvicPtDu0x/Xc1z+XLqgqvfd
         6ozQ==
X-Gm-Message-State: AOJu0Ywf2I8btIMCDG/O7iSamVP2X9hlJmhU8TISOejqXR3wmRQhqZwo
	dQj8S/xqCfM3fyCxpIEnpJQ/We/Z19P9eIBOgFPeFzGf4IsDoFs8QFAEJ2+uF0jErR3HTKNXA5T
	ACbSowjXj/K92CufNiYWVCf78U7e2azgszw==
X-Received: by 2002:a17:907:9815:b0:a1e:5ea5:c5db with SMTP id ji21-20020a170907981500b00a1e5ea5c5dbmr9845983ejc.83.1702905905901;
        Mon, 18 Dec 2023 05:25:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFr7+vH+Wal3dISxtzhvvr7u055L190DsuLC0oKFlQZqffbMY6iUxzeGedasy3DLOoPJqGzGA==
X-Received: by 2002:a17:907:9815:b0:a1e:5ea5:c5db with SMTP id ji21-20020a170907981500b00a1e5ea5c5dbmr9845952ejc.83.1702905905486;
        Mon, 18 Dec 2023 05:25:05 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id l22-20020a1709061c5600b00a236cf1e4d0sm48526ejg.167.2023.12.18.05.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 05:25:04 -0800 (PST)
Message-ID: <f15e0ea0-a928-4e5c-8147-b4af49f0395e@redhat.com>
Date: Mon, 18 Dec 2023 14:25:03 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add a workaround for Framework 13 spurious IRQ1
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Goswami Sanket <Sanket.Goswami@amd.com>
References: <20231212045006.97581-1-mario.limonciello@amd.com>
 <85397fdb-b093-4c03-8613-3815352f2b2c@t-8ch.de>
 <53d6933e-e5e8-4db1-b2e3-b931dc8bf0bd@redhat.com>
 <0d3fb62-b5e8-228a-dfa9-55ae63089db@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0d3fb62-b5e8-228a-dfa9-55ae63089db@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/18/23 13:42, Ilpo Järvinen wrote:
> On Mon, 18 Dec 2023, Hans de Goede wrote:
>> On 12/12/23 21:19, Thomas Weißschuh wrote:
>>> On 2023-12-11 22:50:02-0600, Mario Limonciello wrote:
>>>> The 13" Framework laptop EC emits a spurious keyboard interrupt on every
>>>> resume from hardware sleep.  When a user closes the lid on an already
>>>> suspended system this causes the system to wake up.
>>>>
>>>> This series adjusts the previous Cezanne quirk (which has a much different
>>>> root cause) to be able to apply to other systems too. The Framework 13"
>>>> system is added to the list it will apply to.
>>>>
>>>> Mario Limonciello (4):
>>>>   platform/x86/amd/pmc: Move platform defines to header
>>>>   platform/x86/amd/pmc: Only run IRQ1 firmware version check on Cezanne
>>>>   platform/x86/amd/pmc: Move keyboard wakeup disablement detection to
>>>>     pmc-quirks
>>>>   platform/x86/amd/pmc: Disable keyboard wakeup on AMD Framework 13
>>>>
>>>>  drivers/platform/x86/amd/pmc/pmc-quirks.c | 20 ++++++++++++++
>>>>  drivers/platform/x86/amd/pmc/pmc.c        | 33 +++++++++--------------
>>>>  drivers/platform/x86/amd/pmc/pmc.h        | 12 +++++++++
>>>>  3 files changed, 45 insertions(+), 20 deletions(-)
>>>
>>> For the full series:
>>>
>>> Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
>>> Tested-by: Thomas Weißschuh <linux@weissschuh.net> # on AMD Framework 13
>>>
>>> The device now only wakes up when opening the lid.
>>
>> Thomas, thank you for the review and testing.
>>
>> The series looks good to me too:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Ilpo, do you plan on sending out one more fixes pull-req for 6.7
>> and if yes, can you add this series to that; or shall I merge
>> this into for-next so that it gets included in 6.8-rc1 ?
> 
> I was thinking not to but that was because I for some reason had missed 
> this series in the pending queue over the entire last week.
> 
> So I'll make make more pr taking this series, the thinkpad fan thing and 
> 1/2 intel pmc fix, 2/2 intel pmc is for material that is in next only. 

Great, thank you. I'll pick up the 2/2 pmc fix.

Regards,

Hans

