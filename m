Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F861E526
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713861310; cv=none; b=BRm0Xqcut5kBOanniV3YoY+t1utORPor+pAoa5iZdsBI+RXmcdCvvTtVK/9PlcTjChB5BtjQ7UNeokTjW14eDEf1fTKPeK1YWyq1uSmQrSeaig2i1vexoIf1lq+0Q9mZZR0UjLCJYjD409f0U0ICKlH35Q4Sp7/TyzcO9zx0Ndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713861310; c=relaxed/simple;
	bh=sHbgME6uiWITK48JW0XVkV+HsksmBicsQlTa1h7pmp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvSVDCtLPTVv8X42HaKhefJEdqiTdF5K9n+GddxtVNoCXqdMd94X7nBQqDLWUz8UmY3wuSLGmb2TuPgaYR09Hypeza8hRDdsEwmsygpUga9PkOPDvjRkWDxg8oghm81Jqm17B/eG419PfYD9+Vne4O0ReN4PPGD/HyEu/QO9wLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VG3vteX9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VG3vteX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713861307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuCZlkhR6CJcvu6bt7VGJhHFidB/RrQLb/ndWNyC344=;
	b=VG3vteX9HKIOA4mn/ro1jZcfVVgbCAqxGM5OyFlVawBHgaaW12XuPMPuYgVKuR0Yk2J+fk
	HZ9uz8i7eGvR7ueUe/ZT99EO4D3qmifiFQbGPZI5nO5RlGHZwSCqCHfF3ZiT/RQ6JBZBba
	5GsPKgvJosO7+/nYpc9wCs11J5V6YOs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-FYlRVdf-PGyF7VDYzsbkxg-1; Tue, 23 Apr 2024 04:35:04 -0400
X-MC-Unique: FYlRVdf-PGyF7VDYzsbkxg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a57bf8ae2fcso80234066b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 01:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713861303; x=1714466103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fuCZlkhR6CJcvu6bt7VGJhHFidB/RrQLb/ndWNyC344=;
        b=lqc2rFcjFrLtEelwyqduc4HfZZWsC+Ae9WSRdR9/IzNyr7crVW2OnLODnv31WJAKfs
         wqx+yneEIm0Fczrg0gQo9GUnqQ1hPd1RM5s716lG76B6tNZavWTxaeJDDYkgAVjYJSXA
         utTwrCRU9J+MlTciqiFpoaEN7YmuWYiUKJkNQJJsehQJ6H/aY0CpOGBAqEF0CRz2CjLw
         g0OyLnFcC5GOjv2gMm2dscPArPsrVXkzxSK1soqZ3U583e3pu0HahTA+VVMLj/wKS7vY
         cjXToDYjcovqSS/26bzQ+7N+WgGw/aVjPXNwukKD8hMtp2HU6MaqcTKbo7KOh6pNz9v2
         /0ng==
X-Forwarded-Encrypted: i=1; AJvYcCVnh9Tg0g34rt2SBsowkeMUJzSbL5FmSztSMb1wFlOhXJP0TrrmnVzg3JK2BQOHKU0M1VR52FgnurTF6LlkVKKhU/EWqdfQ4vfI8HZgRvZAj3cUZw==
X-Gm-Message-State: AOJu0YzNwOPd1Dl4xr3Y5qqKgVOAxTGDXoxhjXBSZsLbS2aGDFW/7A3s
	WLviyxpDy4PByEqPXrbocghtHV6pvbovXup4Ie0ZEQGAHvpoFzjafylNIKOVrRVinDQu/exAUDP
	NhnAeyz+PeEXFUr0Sz/VKSYxFb/blLgVZJuzhxHP6Kv2H1Z1AyEGqCdVqraU+fgoqjTPx4PE=
X-Received: by 2002:a17:907:7f2a:b0:a55:bb1c:80fb with SMTP id qf42-20020a1709077f2a00b00a55bb1c80fbmr3783767ejc.15.1713861303044;
        Tue, 23 Apr 2024 01:35:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGTOHjOh6JE6w6XiCS49xz0gpI+dE9rfbVtJZrbSDPUg11Jh+H6xEAtTvfvnkn2cWRXF8ksA==
X-Received: by 2002:a17:907:7f2a:b0:a55:bb1c:80fb with SMTP id qf42-20020a1709077f2a00b00a55bb1c80fbmr3783747ejc.15.1713861302629;
        Tue, 23 Apr 2024 01:35:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dn22-20020a17090794d600b00a5577f7be5esm6263058ejc.81.2024.04.23.01.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 01:35:02 -0700 (PDT)
Message-ID: <48408c1a-1745-46a8-bd33-a13861dc9884@redhat.com>
Date: Tue, 23 Apr 2024 10:35:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/24] platform/x86: thinkpad_acpi: Move adaptive kbd
 event handling to tpacpi_driver_event()
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi1 <njoshi1@lenovo.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20240421154520.37089-1-hdegoede@redhat.com>
 <20240421154520.37089-9-hdegoede@redhat.com>
 <3b8a783f-eeaf-4f30-8a12-57c14f51bfc5@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3b8a783f-eeaf-4f30-8a12-57c14f51bfc5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

On 4/22/24 9:27 PM, Mark Pearson wrote:
> Hi Hans,
> 
> On Sun, Apr 21, 2024, at 11:45 AM, Hans de Goede wrote:
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
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
>> b/drivers/platform/x86/thinkpad_acpi.c
>> index 0bbc462d604c..e8d30f4af126 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -3677,51 +3677,50 @@ static int adaptive_keyboard_get_next_mode(int 
>> mode)
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
>> +		return;
>> +
>> +	adaptive_keyboard_prev_mode = mode;
>> +	adaptive_keyboard_mode_is_saved = true;
>> +
>> +	adaptive_keyboard_set_mode(FUNCTION_MODE);
>> +}
>> +
>>  static bool adaptive_keyboard_hotkey_notify_hotkey(const u32 hkey)
>>  {
>> -	int current_mode = 0;
>> -	int new_mode = 0;
>> -
>> -	switch (hkey) {
>> -	case TP_HKEY_EV_DFR_CHANGE_ROW:
>> -		if (adaptive_keyboard_mode_is_saved) {
>> -			new_mode = adaptive_keyboard_prev_mode;
>> -			adaptive_keyboard_mode_is_saved = false;
>> -		} else {
>> -			current_mode = adaptive_keyboard_get_mode();
>> -			if (current_mode < 0)
>> -				return false;
>> -			new_mode = adaptive_keyboard_get_next_mode(
>> -					current_mode);
>> -		}
>> -
>> -		if (adaptive_keyboard_set_mode(new_mode) < 0)
>> -			return false;
>> -
>> +	if (tpacpi_driver_event(hkey))
>>  		return true;
>>
>> -	case TP_HKEY_EV_DFR_S_QUICKVIEW_ROW:
>> -		current_mode = adaptive_keyboard_get_mode();
>> -		if (current_mode < 0)
>> -			return false;
>> -
>> -		adaptive_keyboard_prev_mode = current_mode;
>> -		adaptive_keyboard_mode_is_saved = true;
>> -
>> -		if (adaptive_keyboard_set_mode (FUNCTION_MODE) < 0)
>> -			return false;
>> -		return true;
>> -
>> -	default:
>> -		if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
>> -		    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
>> -			pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
>> -			return false;
>> -		}
>> -		tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
>> -				      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
>> -		return true;
>> +	if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
>> +	    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
>> +		pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
>> +		return false;
>>  	}
>> +
>> +	tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
>> +			      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
>> +	return true;
>>  }
>>
>>  static bool hotkey_notify_extended_hotkey(const u32 hkey)
>> @@ -11117,6 +11116,12 @@ static bool tpacpi_driver_event(const unsigned 
>> int hkey_event)
>>  		}
>>  		/* Key events are suppressed by default hotkey_user_mask */
>>  		return false;
>> +	case TP_HKEY_EV_DFR_CHANGE_ROW:
>> +		adaptive_keyboard_change_row();
>> +		return true;
>> +	case TP_HKEY_EV_DFR_S_QUICKVIEW_ROW:
>> +		adaptive_keyboard_s_quickview_row();
> 
> Was there a reason to get rid of error handling that was previously done with adaptive_keyboard_set_mode and is now not used here?

The error handling consisted of returning false instead of true
(for known_ev), causing an unknown event message to get logged on
top of the error already logged by adaptive_keyboard_get_mode() /
adaptive_keyboard_set_mode().

This second unknown event error is consfusin / not helpful so
I've dropped the "return false" on error behavior, note that
the new helpers do still return early if get_mode() fails just
as before.

I'll add a note about this to the commit message for v2 of
the series.

Regards,

Hans






> 
>> +		return true;
>>  	case TP_HKEY_EV_THM_CSM_COMPLETED:
>>  		lapsensor_refresh();
>>  		/* If we are already accessing DYTC then skip dytc update */
>> -- 
>> 2.44.0
> 
> Thanks
> Mark
> 

