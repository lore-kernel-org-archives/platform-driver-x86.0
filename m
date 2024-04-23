Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0991B137745
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713881019; cv=none; b=k3DVsrdv0gGBccw8oVOBtlxb4edp5nhtZTdywrjOJYN7yvcX+we2b6JhQ/59i54HFnRJQyp4bzFHL9RBIKhAxexxJIA+p6trhzCAmwpAGzMtnCQTOav0s3l3iKJ2ix1l0j1rzomqMskPnZzyCOkp1hjrT9hxnr/LCnCF8XdC2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713881019; c=relaxed/simple;
	bh=VSC46LQaeWNdyEUuyjUUZM5uJyfACE+wY3NoOtdxENI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qBdyd6jyukjW5moUzoGxcJHKWk7ZyaR808Ck22gzllvXSwVEFtGX6hWdPmK//p5b1s951vny6BXIoBsuVLrmv4NSKAPVodAMZwdj0G1ErqyCqxrBStHC19ddQGquh/RyEirSm3klI6VU2MmE5jwmCku1l/gQHTvcMQZzrZwp1Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ys2nt9CL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ys2nt9CL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713881017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJfqScfLrfRZTXn1SDm3UAg9giThwOB5CrpLVy4Xp34=;
	b=Ys2nt9CLOaXQy7ClqbHOe0Wqxp4x193M+iE5dQV8cNiLl+2RbvhHyKdG7u3Eb9AEi0BVbX
	Jz/KFyFYYjz28x/JEdDIEyGTo7Kzvf3JmID8QvBeTFkWy9FBwIaIpnuLNpUmnYOnVoBE+N
	vAxqynwTmOJaCAmwkzasvlh8Q3At9W8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-1AVVHuI7MsKnW4sdkOfioA-1; Tue, 23 Apr 2024 10:03:35 -0400
X-MC-Unique: 1AVVHuI7MsKnW4sdkOfioA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a559bc02601so202658466b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 07:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713881014; x=1714485814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJfqScfLrfRZTXn1SDm3UAg9giThwOB5CrpLVy4Xp34=;
        b=bl4lJX/iYp6Ji+rdOn1ChMv2R7JjQC/THjhBgQJ6SqJTJyeotWowSa2VTa/VLOA7D6
         nVx+Jnr8F6sTkuR1NEoELG5TJdtRjI1NRAXfQg4ZUgfHJIiw88hzHNy9it+nvotX4S7e
         qXB27Q8RDOexKxKbCexz7zyOJWp2vGMzK+jDz2UJzQCfcBudf0E2MoP9oRXkLxnNTXLf
         t/K7P1sSKaDHtc1P9ANrztzufwDNlX4HLFr8d6QEsAMR7ZVT2QWfq+6T3Yz2GK0m102G
         WihODqLDjtSRLLnfQdu+887O9O1V7Fhr+WTJ8Izg/GJIozxi5LAtV5bD4zyLVde47uMa
         tiNw==
X-Forwarded-Encrypted: i=1; AJvYcCXqzt3+KjWYHxWNIQ20AlyJf2U9rng0Yr7JmxjDLkkhYZJI4n9CZs/zzpoaITogtSm+w3ODLUEkrJznpnjA3BtoVUSU7Cw71WN6K0nrwZwO0/IW3w==
X-Gm-Message-State: AOJu0YyBNTZPFOzWJFJMQT3qxmL60wWHuHCGE1OulL+wKieIGlZEVjqj
	avAO+OEOXLogYy5KvMXCFELSxVMlMq1jMoYlIfEd69mcOXK44thn3OYRfgjLM5P5iPJEfIeoy7L
	iJjMx2km6Fl5URpAroqoiZU0ox97nnQ6fBb+HERLOw9x/2JYorNejMfYepTIhdYNRWl8beJA=
X-Received: by 2002:a17:906:66da:b0:a55:61cc:7337 with SMTP id k26-20020a17090666da00b00a5561cc7337mr8483043ejp.43.1713881014014;
        Tue, 23 Apr 2024 07:03:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEKH/TF9Qchv+bYQML5vZGD9ViGeZb0oc4IEiioK2FmlKnPNfKX34v0HlhGbslqgklY4skMA==
X-Received: by 2002:a17:906:66da:b0:a55:61cc:7337 with SMTP id k26-20020a17090666da00b00a5561cc7337mr8483002ejp.43.1713881012949;
        Tue, 23 Apr 2024 07:03:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p10-20020a17090653ca00b00a5587038aefsm5704875ejo.156.2024.04.23.07.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 07:03:30 -0700 (PDT)
Message-ID: <c81eff46-6210-4d2a-bf6d-8dc8d396d170@redhat.com>
Date: Tue, 23 Apr 2024 16:03:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/24] platform/x86: thinkpad_acpi: Move adaptive kbd
 event handling to tpacpi_driver_event()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <20240421154520.37089-1-hdegoede@redhat.com>
 <20240421154520.37089-9-hdegoede@redhat.com>
 <a591120c-72c6-7b6c-92ba-c65c36a8d70f@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a591120c-72c6-7b6c-92ba-c65c36a8d70f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/22/24 10:29 AM, Ilpo Järvinen wrote:
> On Sun, 21 Apr 2024, Hans de Goede wrote:
> 
>> Factor out the adaptive kbd non hotkey event handling into
>> adaptive_keyboard_change_row() and adaptive_keyboard_s_quickview_row()
>> helpers and move the handling of TP_HKEY_EV_DFR_CHANGE_ROW and
>> TP_HKEY_EV_DFR_S_QUICKVIEW_ROW to tpacpi_driver_event().
>>
>> This groups all the handling of hotkey events which do not emit
>> a key press event together in tpacpi_driver_event().
>>
>> This is a preparation patch for moving to sparse-keymaps.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 85 +++++++++++++++-------------
>>  1 file changed, 45 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 0bbc462d604c..e8d30f4af126 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -3677,51 +3677,50 @@ static int adaptive_keyboard_get_next_mode(int mode)
>>  	return adaptive_keyboard_modes[i];
>>  }
>>  
>> +static void adaptive_keyboard_change_row(void)
>> +{
>> +	int mode;
>> +
>> +	if (adaptive_keyboard_mode_is_saved) {
>> +		mode = adaptive_keyboard_prev_mode;
>> +		adaptive_keyboard_mode_is_saved = false;
>> +	} else {
>> +		mode = adaptive_keyboard_get_mode();
>> +		if (mode < 0)
>> +			return;
>> +		mode = adaptive_keyboard_get_next_mode(mode);
>> +	}
>> +
>> +	adaptive_keyboard_set_mode(mode);
>> +}
>> +
>> +static void adaptive_keyboard_s_quickview_row(void)
>> +{
>> +	int mode = adaptive_keyboard_get_mode();
>> +
>> +	if (mode < 0)
> 
> Please try to keep call and it's error handling together, it costs one 
> line but takes less effort to understand:
> 
> 	int mode;
> 
> 	mode = adaptive_keyboard_get_mode();
> 	if (mode < 0)

Ack, I've changed this for v2 following your suggestion.

Regards,

Hans




> 
>> +		return;
>> +
>> +	adaptive_keyboard_prev_mode = mode;
>> +	adaptive_keyboard_mode_is_saved = true;
>> +
>> +	adaptive_keyboard_set_mode(FUNCTION_MODE);
>> +}
> 

