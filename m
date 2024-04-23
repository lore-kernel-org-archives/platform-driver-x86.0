Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5AB1369A2
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713880401; cv=none; b=OwgiGbjCWodha6YNnfsV9tJuQ/wWeBaWV1vxu+h+/vQBjyAdxOONgIj/cKVlVo03SPwDs2VoB3IvL2gQaCydjaduoM18bOahH+2SNTLFP14/bvQMFICh07G1HNtQhILL5eiC2LE8DWoLql9tdX4fF4GkU3vLln6pnCCpqmjk/KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713880401; c=relaxed/simple;
	bh=MEB1HE7LBEYIZTOlmgb5PXTTuoZpxSopzn78Dq7kX5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUZcLLlhkpN+4r14l5Ld7EbPUZ8ESftYBht4plBGgMiKQGKQuLX6QGfBR44kuM0KcznPDs2iBFpVSb1FA15zx7LWQ1AdBCcjKkHBBiulcoiqUtErJFhaePNi3vToihUr2ZGY1zjLB1szESd0y2Lbb1SOPLgQcMLU2wJSK8vFi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NWqSQ98k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NWqSQ98k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713880399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IVF90XWHoHc9NfFUgT9VoULp5U8wgEinxJnSIXepTEs=;
	b=NWqSQ98k0QrngTsu1hovpv0XtkVeDW+NBxkP8h1/3kk9Pq8zB/JS2zOgGN+SlQ6W353gXK
	N7FyXklrjKrzshNnVm9hWULu9gva7Qd9+TFi2aCA5akk2YLW+GJGqT2YVC5R+Vdb4QD4gX
	LRIcUPk92ouvzZb5NxvDckbCgMk5q5s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-AWKJtUL4NhORe_mufJu7gA-1; Tue, 23 Apr 2024 09:53:17 -0400
X-MC-Unique: AWKJtUL4NhORe_mufJu7gA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a51a2113040so267202366b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 06:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713880395; x=1714485195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IVF90XWHoHc9NfFUgT9VoULp5U8wgEinxJnSIXepTEs=;
        b=EBrm2jtJRCJ672QT1gkYEWkk1lAX85+pc7uDtoHiqCn6R5QKh9vPsynEEQAB3wr4C1
         gkAJwAOnE9dmWv8cfeqth27BJtUPuDaIOJpokIyGwAx+3t+raibpevEMDmldn5TxhZQ8
         T+6H8edEgvESGQ7R2wfQGwdf6oSIruHcliVjK2SxZEXvjg62xEaOFtDs9HfoW5+I+oNf
         iivytl/BvsASJeQEuUWLImWpe2F3NV/3jU+YhrVBxLv+DIp2Uts6KEfnXhvOV5X+FjWX
         Rl2S3+XPMMyQORxBx1MwcKH9IBkcxxDnQH+BPv3jnkURqRtenkoiLMzcaz30wJELHPvU
         3H6g==
X-Forwarded-Encrypted: i=1; AJvYcCWOhpVp40vph1wwLM+8STlrgQqbzAd3dOcDK2RF/doqAg/CHLq/EoVS8dBIxUL9RXCaJa527F2h/bDZQu9oDHR4sBz8CGBMGRx02wAooyx+nOrrIQ==
X-Gm-Message-State: AOJu0YycxxwNShMW64C6VcWGnrNKreamE4yVxK7uF/WTALtoFhbQxke7
	emy75QW35SNbt+TSAalydhC4Nyedh2yKF/xBMWWAou48aUQj/D0xD6kJfpAXL/fniP5Q8SeO8NF
	K9OYUb49qRKoeHo/a0qLTgK+8MXGz9oVnpNeq+QhkKJOt474EQLde90lehS2ucur13AFmezw=
X-Received: by 2002:a17:907:20e9:b0:a52:24b7:b4fc with SMTP id rh9-20020a17090720e900b00a5224b7b4fcmr7617557ejb.72.1713880395159;
        Tue, 23 Apr 2024 06:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGltDwLDkMRMIF8OPkk+CrTWuDm0ywN9Wdl2wUd1DsoYHvi3sI01HJS8/xRDfSPGNJoFPEgCg==
X-Received: by 2002:a17:907:20e9:b0:a52:24b7:b4fc with SMTP id rh9-20020a17090720e900b00a5224b7b4fcmr7617547ejb.72.1713880394788;
        Tue, 23 Apr 2024 06:53:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kx18-20020a170907775200b00a57e2d39d56sm1628329ejc.223.2024.04.23.06.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 06:53:14 -0700 (PDT)
Message-ID: <e3375639-a315-4e0e-b43e-a5003cc7d6fb@redhat.com>
Date: Tue, 23 Apr 2024 15:53:13 +0200
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
 <48408c1a-1745-46a8-bd33-a13861dc9884@redhat.com>
 <be2db1e4-159f-4b69-a07e-70e8e04fb5c3@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <be2db1e4-159f-4b69-a07e-70e8e04fb5c3@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

On 4/23/24 2:15 PM, Mark Pearson wrote:
> Hi Hans
> 
> On Tue, Apr 23, 2024, at 4:35 AM, Hans de Goede wrote:
>> Hi Mark,
>>
>> On 4/22/24 9:27 PM, Mark Pearson wrote:
>>> Hi Hans,
>>>
>>> On Sun, Apr 21, 2024, at 11:45 AM, Hans de Goede wrote:
>>>> Factor out the adaptive kbd non hotkey event handling into
>>>> adaptive_keyboard_change_row() and adaptive_keyboard_s_quickview_row()
>>>> helpers and move the handling of TP_HKEY_EV_DFR_CHANGE_ROW and
>>>> TP_HKEY_EV_DFR_S_QUICKVIEW_ROW to tpacpi_driver_event().
>>>>
>>>> This groups all the handling of hotkey events which do not emit
>>>> a key press event together in tpacpi_driver_event().
>>>>
>>>> This is a preparation patch for moving to sparse-keymaps.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>  drivers/platform/x86/thinkpad_acpi.c | 85 +++++++++++++++-------------
>>>>  1 file changed, 45 insertions(+), 40 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
>>>> b/drivers/platform/x86/thinkpad_acpi.c
>>>> index 0bbc462d604c..e8d30f4af126 100644
>>>> --- a/drivers/platform/x86/thinkpad_acpi.c
>>>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>>>> @@ -3677,51 +3677,50 @@ static int adaptive_keyboard_get_next_mode(int 
>>>> mode)
>>>>  	return adaptive_keyboard_modes[i];
>>>>  }
>>>>
>>>> +static void adaptive_keyboard_change_row(void)
>>>> +{
>>>> +	int mode;
>>>> +
>>>> +	if (adaptive_keyboard_mode_is_saved) {
>>>> +		mode = adaptive_keyboard_prev_mode;
>>>> +		adaptive_keyboard_mode_is_saved = false;
>>>> +	} else {
>>>> +		mode = adaptive_keyboard_get_mode();
>>>> +		if (mode < 0)
>>>> +			return;
>>>> +		mode = adaptive_keyboard_get_next_mode(mode);
>>>> +	}
>>>> +
>>>> +	adaptive_keyboard_set_mode(mode);
>>>> +}
>>>> +
>>>> +static void adaptive_keyboard_s_quickview_row(void)
>>>> +{
>>>> +	int mode = adaptive_keyboard_get_mode();
>>>> +
>>>> +	if (mode < 0)
>>>> +		return;
>>>> +
>>>> +	adaptive_keyboard_prev_mode = mode;
>>>> +	adaptive_keyboard_mode_is_saved = true;
>>>> +
>>>> +	adaptive_keyboard_set_mode(FUNCTION_MODE);
>>>> +}
>>>> +
>>>>  static bool adaptive_keyboard_hotkey_notify_hotkey(const u32 hkey)
>>>>  {
>>>> -	int current_mode = 0;
>>>> -	int new_mode = 0;
>>>> -
>>>> -	switch (hkey) {
>>>> -	case TP_HKEY_EV_DFR_CHANGE_ROW:
>>>> -		if (adaptive_keyboard_mode_is_saved) {
>>>> -			new_mode = adaptive_keyboard_prev_mode;
>>>> -			adaptive_keyboard_mode_is_saved = false;
>>>> -		} else {
>>>> -			current_mode = adaptive_keyboard_get_mode();
>>>> -			if (current_mode < 0)
>>>> -				return false;
>>>> -			new_mode = adaptive_keyboard_get_next_mode(
>>>> -					current_mode);
>>>> -		}
>>>> -
>>>> -		if (adaptive_keyboard_set_mode(new_mode) < 0)
>>>> -			return false;
>>>> -
>>>> +	if (tpacpi_driver_event(hkey))
>>>>  		return true;
>>>>
>>>> -	case TP_HKEY_EV_DFR_S_QUICKVIEW_ROW:
>>>> -		current_mode = adaptive_keyboard_get_mode();
>>>> -		if (current_mode < 0)
>>>> -			return false;
>>>> -
>>>> -		adaptive_keyboard_prev_mode = current_mode;
>>>> -		adaptive_keyboard_mode_is_saved = true;
>>>> -
>>>> -		if (adaptive_keyboard_set_mode (FUNCTION_MODE) < 0)
>>>> -			return false;
>>>> -		return true;
>>>> -
>>>> -	default:
>>>> -		if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
>>>> -		    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
>>>> -			pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
>>>> -			return false;
>>>> -		}
>>>> -		tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
>>>> -				      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
>>>> -		return true;
>>>> +	if (hkey < TP_HKEY_EV_ADAPTIVE_KEY_START ||
>>>> +	    hkey > TP_HKEY_EV_ADAPTIVE_KEY_END) {
>>>> +		pr_info("Unhandled adaptive keyboard key: 0x%x\n", hkey);
>>>> +		return false;
>>>>  	}
>>>> +
>>>> +	tpacpi_input_send_key(hkey - TP_HKEY_EV_ADAPTIVE_KEY_START +
>>>> +			      TP_ACPI_HOTKEYSCAN_ADAPTIVE_START);
>>>> +	return true;
>>>>  }
>>>>
>>>>  static bool hotkey_notify_extended_hotkey(const u32 hkey)
>>>> @@ -11117,6 +11116,12 @@ static bool tpacpi_driver_event(const unsigned 
>>>> int hkey_event)
>>>>  		}
>>>>  		/* Key events are suppressed by default hotkey_user_mask */
>>>>  		return false;
>>>> +	case TP_HKEY_EV_DFR_CHANGE_ROW:
>>>> +		adaptive_keyboard_change_row();
>>>> +		return true;
>>>> +	case TP_HKEY_EV_DFR_S_QUICKVIEW_ROW:
>>>> +		adaptive_keyboard_s_quickview_row();
>>>
>>> Was there a reason to get rid of error handling that was previously done with adaptive_keyboard_set_mode and is now not used here?
>>
>> The error handling consisted of returning false instead of true
>> (for known_ev), causing an unknown event message to get logged on
>> top of the error already logged by adaptive_keyboard_get_mode() /
>> adaptive_keyboard_set_mode().
>>
>> This second unknown event error is consfusin / not helpful so
>> I've dropped the "return false" on error behavior, note that
>> the new helpers do still return early if get_mode() fails just
>> as before.
>>
>> I'll add a note about this to the commit message for v2 of
>> the series.
>>
> Thanks for the explanation - makes sense.
> 
> Reviwed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> 
> As a note - I've been working my way thru the patches. Is it OK to send one Reviewed-by at the end for all the patches for which I had no questions, or is it better to ack each one individually?

One Reviewed-by for the series when you're done (with possible
exception for some patches you have outstanding remarks for)
is fine.

Regards,

Hans



