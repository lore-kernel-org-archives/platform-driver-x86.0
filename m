Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9665415ECF7
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 14:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713970051; cv=none; b=hBrZH6HxjjLM+qqz8pgLUQ1kMThJxe2n6qnXSqLOE3NNJ6C9neTyn2Tv562CQFDQXC86m1wNAVJptuLFQGOownGtantpuSk+2wYmob1H6OWwSJ+dYy3H6X1ATHhJ3T/QHflpqIy2qxthwxAn32Cc7YMu7R7uioGh79XoJ8+62G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713970051; c=relaxed/simple;
	bh=YB0+Y5EK4KiFRjRN2E9lms3ioiTOaA0gmQk4v9Y3bQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4mMmrXhBO3wDOK4JIx88514wUi4hTTHJKEMTCg+MbVQRcg09rxivEFl44fL4t1WfS+OJFChSvHfs2Nvp+Sd4wGJIcCincGU5NmDRUpSTc04hfENA/ZBuTceiuKYKxy+UjmngoLJHmgRn5baba88cY6h1yD7NRqY7Q2s5zy7TKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MIEHRxma; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MIEHRxma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713970048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W7cBnmFr5IS+PwCda9FEghAT/JWy8Ybw7oLyBIcNh6c=;
	b=MIEHRxmaJzLJ7kjn7kbMM1MBquxuf4US45L25SoIT/02az5Ve/x3V38Y7GAm4/WTok9JY3
	5GTyOvbr1CqsftLXNHL4FMkWONiEjiC+PVXDAM3grztPzmdw8LVUKdYyVBQdXRBwunUKSP
	vRDJhFHUlzI7EPsUlBlACkWmUYILuxY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-ZHaaOBfGPmyYviOtKvGi-A-1; Wed, 24 Apr 2024 10:47:27 -0400
X-MC-Unique: ZHaaOBfGPmyYviOtKvGi-A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a55c019c6d5so176589066b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 07:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713970045; x=1714574845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7cBnmFr5IS+PwCda9FEghAT/JWy8Ybw7oLyBIcNh6c=;
        b=drHKwjGVrWNEZ/wlezbcEpGBa6ZhxQ/JkuRz0RV2i617Xrzm0S5dGzHFDTbUpepMhm
         kKprRQq9q1C4z8fw/xzD6OBmWRv+F4VLWGBFV7kfSdUx3XL/imF0jgEGtlw2gs3gSwbB
         AXMJMPd37Jq4K6ulNo0xpeop3BZLb3e247YRuySUPmOKpDhrZBNh6V9/SkUecueXDX/v
         AardSTbIyVN0nJMT6NWV8nlrVzgLm+2FjnP38E18l0csENTz4TJgg2sndOwVPLagX2IL
         8+8tpw2Pa08HJaZ3WvzCxup3t+KFSo2HW8X8mFpY0oE972WEl6jCGeq7/Yp2PexUrHNa
         l70w==
X-Forwarded-Encrypted: i=1; AJvYcCWoaVD+pXZMTpIhNP4/MobUoyhn6kuj73ARmkWCdc5YN1QHMCpjdAA5nVz3AQysIQHBmeBN39sVzjYM8Nj0iWpyINBw/guX6wxE0EQYcOSez+1STA==
X-Gm-Message-State: AOJu0YyJDeAxXj0R3D3cvucTt0lJaZAHwaGxJrnE05Y+gWBkftRwNWKP
	jgVj42Act6g/qr1+UfeEp9LfET40iio2bJ8efSfHchvZ8W1ifnSSqPmwxq17w+pTcEr+nackZae
	1WPbjmrJ2Tzyg0+9v7mO1sxOeZ+JI9UYUh8+9p45cTxVVXThXfhi85gFbpQupuue9MHaYMSKuH/
	UCp7E=
X-Received: by 2002:a17:906:3c45:b0:a58:9fb5:8768 with SMTP id i5-20020a1709063c4500b00a589fb58768mr942966ejg.56.1713970045641;
        Wed, 24 Apr 2024 07:47:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoq70Zb4L5GIgQMvrCCqW0wDN1xXQmNpIZbqJeirLJXZxAX+n8XCS/6hrktarTI4iyelb9xg==
X-Received: by 2002:a17:906:3c45:b0:a58:9fb5:8768 with SMTP id i5-20020a1709063c4500b00a589fb58768mr942948ejg.56.1713970045273;
        Wed, 24 Apr 2024 07:47:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i8-20020a170906264800b00a52433f0907sm8416793ejc.37.2024.04.24.07.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 07:47:24 -0700 (PDT)
Message-ID: <77524ca0-89bb-4223-bd42-532f34fdd055@redhat.com>
Date: Wed, 24 Apr 2024 16:47:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/24] platform/x86: thinkpad_acpi: Change
 hotkey_reserved_mask initialization
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi1 <njoshi1@lenovo.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20240424122834.19801-1-hdegoede@redhat.com>
 <20240424122834.19801-17-hdegoede@redhat.com>
 <5e0e0317-9e27-4a6b-8b7a-3828f4e3f7fb@app.fastmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5e0e0317-9e27-4a6b-8b7a-3828f4e3f7fb@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

On 4/24/24 4:17 PM, Mark Pearson wrote:
> Hi Hans,
> 
> On Wed, Apr 24, 2024, at 8:28 AM, Hans de Goede wrote:
>> Change the hotkey_reserved_mask initialization to hardcode the list
>> of reserved keys. There are only a few reserved keys and the code to
>> iterate over the keymap will be removed when moving to sparse-keymaps.
>>
>> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 21 +++++++++++++++------
>>  1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c 
>> b/drivers/platform/x86/thinkpad_acpi.c
>> index 952bac635a18..cf5c741d1343 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -3545,6 +3545,19 @@ static int __init hotkey_init(struct 
>> ibm_init_struct *iibm)
>>  	dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>>  		   "using keymap number %lu\n", keymap_id);
>>
>> +	/* Keys which should be reserved on both IBM and Lenovo models */
>> +	hotkey_reserved_mask = TP_ACPI_HKEY_KBD_LIGHT_MASK |
>> +			       TP_ACPI_HKEY_VOLUP_MASK |
>> +			       TP_ACPI_HKEY_VOLDWN_MASK |
>> +			       TP_ACPI_HKEY_MUTE_MASK;
>> +	/*
>> +	 * Reserve brightness up/down unconditionally on IBM models, on Lenovo
>> +	 * models these are disabled based on acpi_video_get_backlight_type().
>> +	 */
>> +	if (keymap_id == TPACPI_KEYMAP_IBM_GENERIC)
>> +		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
>> +					TP_ACPI_HKEY_BRGHTDWN_MASK;
>> +
>>  	hotkey_keycode_map = kmemdup(&tpacpi_keymaps[keymap_id],
>>  			TPACPI_HOTKEY_MAP_SIZE,	GFP_KERNEL);
>>  	if (!hotkey_keycode_map) {
>> @@ -3560,9 +3573,6 @@ static int __init hotkey_init(struct 
>> ibm_init_struct *iibm)
>>  		if (hotkey_keycode_map[i] != KEY_RESERVED) {
>>  			input_set_capability(tpacpi_inputdev, EV_KEY,
>>  						hotkey_keycode_map[i]);
>> -		} else {
>> -			if (i < sizeof(hotkey_reserved_mask)*8)
>> -				hotkey_reserved_mask |= 1 << i;
> 
> Just to check my understanding here - does this change mean that the keys marked as KEY_RESERVED in the lenovo map won't make it into the mask?
> 
> e.g the ones in this block:
>                 KEY_RESERVED,        /* Mute held, 0x103 */
>                 KEY_BRIGHTNESS_MIN,  /* Backlight off */
>                 KEY_RESERVED,        /* Clipping tool */
>                 KEY_RESERVED,        /* Cloud */
>                 KEY_RESERVED,
>                 KEY_VOICECOMMAND,    /* Voice */
>                 KEY_RESERVED,
>                 KEY_RESERVED,        /* Gestures */
>                 KEY_RESERVED,
>                 KEY_RESERVED,
>                 KEY_RESERVED,
>                 KEY_CONFIG,          /* Settings */
>                 KEY_RESERVED,        /* New tab */
>                 KEY_REFRESH,         /* Reload */
>                 KEY_BACK,            /* Back */
>                 KEY_RESERVED,        /* Microphone down */
>                 KEY_RESERVED,        /* Microphone up */
>                 KEY_RESERVED,        /* Microphone cancellation */
>                 KEY_RESERVED,        /* Camera mode */
>                 KEY_RESERVED,        /* Rotate display, 0x116 */
> 
> I'm not sure what the effect will be and I don't have the 2014 X1 Carbon (I assume it's the G1) available to test with unfortunately.

Only the 32 original hotkeys are affected by any of the hotkey_*_mask
values, note:

			if (i < sizeof(hotkey_reserved_mask)*8)
				hotkey_reserved_mask |= 1 << i;

The (i < sizeof(hotkey_reserved_mask)*8) condition translates to
(i < 32) so this code only ever set bits in hotkey_reserved_mask
for the 32 original hotkeys.

> Just wanted to be sure we weren't breaking something on older platforms.

That is appreciated. As I mentioned in the cover letter I have been
careful to try and not break older platforms, but double checking my
work is appreciated.

Regards,

Hans




> 
>>  		}
>>  	}
>>
>> @@ -3587,9 +3597,8 @@ static int __init hotkey_init(struct 
>> ibm_init_struct *iibm)
>>  		/* Disable brightness up/down on Lenovo thinkpads when
>>  		 * ACPI is handling them, otherwise it is plain impossible
>>  		 * for userspace to do something even remotely sane */
>> -		hotkey_reserved_mask |=
>> -			(1 << TP_ACPI_HOTKEYSCAN_FNHOME)
>> -			| (1 << TP_ACPI_HOTKEYSCAN_FNEND);
>> +		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
>> +					TP_ACPI_HKEY_BRGHTDWN_MASK;
>>  		hotkey_unmap(TP_ACPI_HOTKEYSCAN_FNHOME);
>>  		hotkey_unmap(TP_ACPI_HOTKEYSCAN_FNEND);
>>  	}
>> -- 
>> 2.44.0
> 

