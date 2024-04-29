Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E63D9E
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 09:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714384639; cv=none; b=gA1CyccrkA6tLLlYqPcBYGjdWS/TMXksfxI484j9Am6rAEOUQMDa4XlXJHma82hiRfRhuZ6rMLxNdMnhLXbs0YlQjUl3CtnBrWl7rQvMK+teioD+yZZsGm/jTYdLz7KBmbyN/hjdHmhddD8vJ2uUUQGHVxGHFcVPXbGzpbmturY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714384639; c=relaxed/simple;
	bh=brvwCY6FZorWteovK5U8m9Ys0YAK9RZEAOGg1JhwQY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuBqgXnQfY820T3pp1v9JOhm7K6lKnC+P3MLYS20ZLuispC/2jm5XAn62sTtK7QzVgBrnjID1aGpkuyjXiXZ+rkIffwvJJF2vJ3cKmAQvzvvwbxoW1jKC7rINNei9jUheZzqNVROar9hxM/jaQButDAUAx3Xcr77sD1949IXkRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WaCs9Juh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WaCs9Juh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714384636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8tSfhPIULlB9WuUsfgoUdLsvBAqT4frWKzQa+PDeg4=;
	b=WaCs9JuhGzvWP0wt5VhKemA/XVs4PYZ6mTaI0nu0F/kfE7y8VX3SCWQMCaLVWYQmWFJ1cD
	W+NkVMNtLEg0ZnXwvJ366J5OJZORyfxsR+W5zo4txrso3uOAKiUhILcNmMyj+4xBkMg3nW
	Jok2AY/NQrzU5qtD3cFHOkSZsq/BoN0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-XOmFpMYvMkKnl4_fVsdzGg-1; Mon, 29 Apr 2024 05:57:14 -0400
X-MC-Unique: XOmFpMYvMkKnl4_fVsdzGg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5705ef0b425so2179859a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 02:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714384633; x=1714989433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8tSfhPIULlB9WuUsfgoUdLsvBAqT4frWKzQa+PDeg4=;
        b=JoeP5xCmEoyCzV+cZor7er09kFoR8l60iWl/8Tc9dqAOmLYC026sANMIGuKDX5m/ft
         eKDgIYrwWQp+XgdWIAVWIHWWhd6CxASznVcUD5Vh6TumegckBc6sb3apAof9JZm5VlV5
         BvvAoo/UJLAhXblxM2cUZAf3XbG6MR5o8QHw8uKYw89cpTjOHmGJ57OFZo3WmvIy9Glf
         lqa6M7rV1G31AWpvKWMG265hDFXrvARVjj4swWOe9r3run50cEMDYRDpq7Dn7tpmIuIx
         8DtYeGwpEqA+3+WIFxDEuAMKSr06R9css0lc5fuIFeYOFb7IBSnYVWMioOW9tQAt/vTO
         lwzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+MWYe9mGNCx8QcRsR2nCJSGd4/HusYxlF8ef8MbJ8dJ7vqhTQzQCr6Ga7i3HcjjYDRHmpyJobQZpLkv0/yEPyPoNSqbo3SqnZIADV/xpjM8SZPA==
X-Gm-Message-State: AOJu0Yxp0qeLR8ca+BwFMujkReZrpsNHakWlcsGH6zYzFhND4uhDU+pU
	/Yk6JrhBU57rNnMTNjEqg3K/XvlI9niJIVNqRj80ER74JQ45ICqgcqGt2dtzmhKjWkh8ZXxDn8h
	VaM1k1RlwOpBIys0ztKp2mnwhrXzxLXNAAJnchVUl2vTYYQm8INktonNjZGORG9CrNsx/oyA=
X-Received: by 2002:a50:d7d5:0:b0:56f:ebcf:bd94 with SMTP id m21-20020a50d7d5000000b0056febcfbd94mr6167081edj.12.1714384633021;
        Mon, 29 Apr 2024 02:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbEPmGIHY5QDkhbLJptp6ibsxdN8/VzZvatEgJ32r2lnK7g7rMvKqK/d++rks8NdMDmGFFhA==
X-Received: by 2002:a50:d7d5:0:b0:56f:ebcf:bd94 with SMTP id m21-20020a50d7d5000000b0056febcfbd94mr6167062edj.12.1714384632502;
        Mon, 29 Apr 2024 02:57:12 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id o12-20020aa7dd4c000000b005704419f56csm12899966edw.86.2024.04.29.02.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 02:57:12 -0700 (PDT)
Message-ID: <5ea90914-16f7-4904-b7a6-e1997880e5f0@redhat.com>
Date: Mon, 29 Apr 2024 11:57:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/24] platform/x86: thinkpad_acpi: Support for
 trackpoint doubletap
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi1 <njoshi1@lenovo.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20240424122834.19801-1-hdegoede@redhat.com>
 <20240424122834.19801-23-hdegoede@redhat.com>
 <8f150aef-0d56-4c5b-af17-9c66084a3ae7@app.fastmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8f150aef-0d56-4c5b-af17-9c66084a3ae7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

On 4/24/24 8:19 PM, Mark Pearson wrote:
> Hi Hans,
> 
> On Wed, Apr 24, 2024, at 8:28 AM, Hans de Goede wrote:
>> From: Mark Pearson <mpearson-lenovo@squebb.ca>
>>
>> Lenovo trackpoints are adding the ability to generate a doubletap event.
>> This handles the doubletap event and sends the KEY_PROG4 event to
>> userspace. Despite the driver itself not using KEY_PROG1 - KEY_PROG3 this
>> still uses KEY_PROG4 because of some keys being remapped to KEY_PROG1 -
>> KEY_PROG3 by default by the upstream udev hwdb containing:
>>
>> evdev:name:ThinkPad Extra Buttons:dmi:bvn*:bvr*:bd*:svnLENOVO*:pn*:*
>>  ...
>>  KEYBOARD_KEY_17=prog1
>>  KEYBOARD_KEY_1a=f20       # Microphone mute button
>>  KEYBOARD_KEY_45=bookmarks
>>  KEYBOARD_KEY_46=prog2     # Fn + PrtSc, on Windows: Snipping tool
>>  KEYBOARD_KEY_4a=prog3     # Fn + Right shift, on Windows: No idea
>>
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
>> Link: https://lore.kernel.org/r/20240417173124.9953-2-mpearson-lenovo@squebb.ca
>> [hdegoede@redhat.com: Adjust for switch to sparse-keymap keymaps]
>> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
>> b/drivers/platform/x86/thinkpad_acpi.c
>> index a53b00fecf1a..b6d6466215e1 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -248,6 +248,9 @@ enum tpacpi_hkey_event_t {
>>
>>  	/* Misc */
>>  	TP_HKEY_EV_RFKILL_CHANGED	= 0x7000, /* rfkill switch changed */
>> +
>> +	/* Misc2 */
>> +	TP_HKEY_EV_TRACK_DOUBLETAP      = 0x8036, /* trackpoint doubletap */
>>  };
>>
>>  
>> /****************************************************************************
>> @@ -3268,6 +3271,7 @@ static const struct key_entry keymap_lenovo[] 
>> __initconst = {
>>  	 * after switching to sparse keymap support. The mappings above use 
>> translated
>>  	 * scancodes to preserve uAPI compatibility, see 
>> tpacpi_input_send_key().
>>  	 */
>> +	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
>>  	{ KE_END }
>>  };
>>
>> @@ -3817,6 +3821,17 @@ static bool hotkey_notify_6xxx(const u32 hkey, 
>> bool *send_acpi_ev)
>>  	return true;
>>  }
>>
>> +static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
>> +{
>> +	switch (hkey) {
>> +	case TP_HKEY_EV_TRACK_DOUBLETAP:
>> +		tpacpi_input_send_key(hkey, send_acpi_ev);
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>>  static void hotkey_notify(struct ibm_struct *ibm, u32 event)
>>  {
>>  	u32 hkey;
>> @@ -3893,6 +3908,10 @@ static void hotkey_notify(struct ibm_struct 
>> *ibm, u32 event)
>>  				known_ev = true;
>>  			}
>>  			break;
>> +		case 8:
>> +			/* 0x8000-0x8FFF: misc2 */
>> +			known_ev = hotkey_notify_8xxx(hkey, &send_acpi_ev);
>> +			break;
>>  		}
>>  		if (!known_ev) {
>>  			pr_notice("unhandled HKEY event 0x%04x\n", hkey);
>> -- 
>> 2.44.0
> 
> Instead of needing hotkey_notify_8xxx, now we are using the sparse_keymap can we just use hotkey_notify_hotkey for case 8? No need to check what the hkey is either.

I prefer to keep things consistent and have each case #: path call a separate
helper for those #xxx codes.

ATM some of the simpler cases handle things directly, but as more handling for
different events get added that becomes a bit messy IMHO. I would actually
like to see those other cases converted to use a small helper function too
(with a switch-case in the helper for future proofing) to make things consistent.

Patches to do this small cleanup are welcome.

Regards,

Hans

