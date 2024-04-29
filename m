Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13B21805E
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 09:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714384360; cv=none; b=WByALBd4Rm+C5SPE+f28JzFbPg4DUORrgVk5DuNBKjQCB4VaBpTMeV+ytwN7H/do1ZHhoEHtYs/d1Swy7tD9bte371wSZa6+IKhW133g9yqR2Alp0b62Z0D7mYh71H49L8ITEuRGAqQ3uXeT2DLF/h6+X5kA+q9eR+cymvX/134=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714384360; c=relaxed/simple;
	bh=8lmc6RPUW7XtP/9e6lAFF8Tr7BoAJ0DOMuN5cWgRUIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ea2nPpj26L4kusXHkuzu0blDw1lvfO4qtn+bEN4we5QrZEsilODxp3coGrGeDRvPUQ17Hlxhv9ZdkIJ3MuTh/xSvXG4KI6i8cUgCs1oBZRqljdluK27EFfEnw+AIXioYBdzIflwsKE+3WNTqnLpOkzdLxvLhPJsuSdjzBoQWFDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HzGf9xrS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HzGf9xrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714384357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CGUEVmVRzjuW9NU/8UsVuw1yRuUAIlhMy7Y7u3fuFoM=;
	b=HzGf9xrS7CnZ6bacsXNzPGZN7/7buHFyII8SIVV2/Zj765oPuSH9rK58xdHweUXdF4Wg0p
	O63WVKMc/6zI6Fd3F8kgcGgNDt9HNa9BXFogpyj5ziUIMJC5g0jAPRK5dkTwuWiJ/FpRma
	LXU00exMJqdQOSdI41dUx9wNei/Z36o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-xiTfM9_vM02EFoqU0Mmnrg-1; Mon, 29 Apr 2024 05:52:35 -0400
X-MC-Unique: xiTfM9_vM02EFoqU0Mmnrg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5727e55c002so896791a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 02:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714384354; x=1714989154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGUEVmVRzjuW9NU/8UsVuw1yRuUAIlhMy7Y7u3fuFoM=;
        b=hw5AEuBRMj7RoQ/WvEtcXcfKFLw0JJK2nvrdI3BrXFj5qqSfkVgVXQxim2VeZ2A7ap
         uBqQwbHhKCRePZhVm0HYnjUyQ3YCszTvF1qiYZuj1OLZB3fvrOskL+JzC6x2GKbNPQ5d
         IR205Q6Wx0NcZbNQLHvzHFB6PTUPzYx0GuRUTC4X2HJU3OI7t1TVft/LByzXoc+iONnF
         mZkx6DdjhnCOKCe5rPWEJH1CRTUcfa6jZz3PYxVQH+gRgH3SCcISCdY/hhkmatj61s2A
         DLRUinUWxpATb6+sYthLSHGL6bVaGgN1ujai5ljsbCXFGOogBjKzkjfmKpdi8qXnAvwr
         NxOg==
X-Forwarded-Encrypted: i=1; AJvYcCXLVaogX+rNJNoJMOzNej0QXOUEhocOxu5iW+m7nZ0HBVpBiIZ7AotzBKaRwRMw9qKE8uO7aQC1DPHEcYM29bFZlPK9K4pFyIPtH6wJ6ZKoiMCs5w==
X-Gm-Message-State: AOJu0YzCG1tj+QydpmJLFBjmkIcODRqFee9q5neUTbF7CMesfThejn5I
	NZQUpsXV+QJd9Vo+X0OCtlSP7LOmh/A10mcdRYUXfnqSBzVjN+sVWPfcK7/f3RH6B7Frcd/kNEw
	f9kPHeeh3EeCqoKllQQmuSaNIHGEv8kSH58KR0pNQ2CMt5ym7/n4cMkA73pxPW3AdT+bu/Tw=
X-Received: by 2002:a50:8acf:0:b0:572:67de:5fd2 with SMTP id k15-20020a508acf000000b0057267de5fd2mr6261360edk.0.1714384354677;
        Mon, 29 Apr 2024 02:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbcvMcPUkEvqGgIZBWtL988s90e+Ut+xz2VrMEpn7cGT9pDyXB4bcATZYb1TIPLASWhHcbOg==
X-Received: by 2002:a50:8acf:0:b0:572:67de:5fd2 with SMTP id k15-20020a508acf000000b0057267de5fd2mr6261334edk.0.1714384354271;
        Mon, 29 Apr 2024 02:52:34 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id p36-20020a056402502400b0056e064a6d2dsm13144468eda.2.2024.04.29.02.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 02:52:33 -0700 (PDT)
Message-ID: <b00d7c9c-db55-4337-84f1-fd1d19c00859@redhat.com>
Date: Mon, 29 Apr 2024 11:52:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/24] platform/x86: thinkpad_acpi: Change
 hotkey_reserved_mask initialization
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <20240424122834.19801-1-hdegoede@redhat.com>
 <20240424122834.19801-17-hdegoede@redhat.com>
 <d56986cf-e400-4f8f-d2aa-0fb1bba297cf@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d56986cf-e400-4f8f-d2aa-0fb1bba297cf@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

Thank you for reviewing this series.

On 4/25/24 11:14 AM, Ilpo Järvinen wrote:
> On Wed, 24 Apr 2024, Hans de Goede wrote:
> 
>> Change the hotkey_reserved_mask initialization to hardcode the list
>> of reserved keys. There are only a few reserved keys and the code to
>> iterate over the keymap will be removed when moving to sparse-keymaps.
> 
> Hi,
> 
> Consider extending this explanation. It's hard to see how the old and new 
> code are identical because there are more KEY_RESERVED entries in the 
> array than in the new code. I can see the list of keys in the new code 
> matches to those set using tpacpi_hotkey_driver_mask_set() but it's hard 
> to connect the dots here.

Right, this is basically the same question as which Mark asked. I've added
the following to the commit message while merging this series to clarify this:

"""
Note only the 32 original hotkeys are affected by any of the hotkey_*_mask
values, note:

        if (i < sizeof(hotkey_reserved_mask)*8)
                hotkey_reserved_mask |= 1 << i;

The (i < sizeof(hotkey_reserved_mask)*8) condition translates to (i < 32)
so this code only ever set bits in hotkey_reserved_mask for the 32 original
hotkeys. Therefor this patch does not set any bits in hotkey_reserved_mask
for the KEY_RESERVED mappings for the adaptive keyboard scancodes.
"""

> 
>> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 21 +++++++++++++++------
>>  1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 952bac635a18..cf5c741d1343 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -3545,6 +3545,19 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
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
>> @@ -3560,9 +3573,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>>  		if (hotkey_keycode_map[i] != KEY_RESERVED) {
>>  			input_set_capability(tpacpi_inputdev, EV_KEY,
>>  						hotkey_keycode_map[i]);
>> -		} else {
>> -			if (i < sizeof(hotkey_reserved_mask)*8)
>> -				hotkey_reserved_mask |= 1 << i;
>>  		}
>>  	}
>>  
>> @@ -3587,9 +3597,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>>  		/* Disable brightness up/down on Lenovo thinkpads when
>>  		 * ACPI is handling them, otherwise it is plain impossible
>>  		 * for userspace to do something even remotely sane */
>> -		hotkey_reserved_mask |=
>> -			(1 << TP_ACPI_HOTKEYSCAN_FNHOME)
>> -			| (1 << TP_ACPI_HOTKEYSCAN_FNEND);
>> +		hotkey_reserved_mask |= TP_ACPI_HKEY_BRGHTUP_MASK |
>> +					TP_ACPI_HKEY_BRGHTDWN_MASK;
> 
> This is a simple define replace that would belong to own patch?

This makes the code style identical to how the brightness keys are added
to the mask above. I guess this could have been in a separate patch, but
since it is less work for me to just leave it here I'm going to leave it here.

Regards,

Hans

