Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281ED2512D8
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Mar 2025 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742818957; cv=none; b=pCRe/0oQGdsaxYSkxUxbFgFBC8EpDtVCgQcSUjaAwzBl3qWw4YcW4AdPYFcmGdpMBERjvEg+WBpNCdUO8FeiEZ8DCt/jwJSsHH7IbgY1i5vlbQGPK8yRgzMKFvYCVpxB9xyDU1tQUJ4lQ2SjkZyzeQS7eZ1wu5c7KvPHPSWDvvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742818957; c=relaxed/simple;
	bh=h6EXQtOMm1giDo9FOnn5Hqk0DnGCyR67Eox8XU5ZNHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ak9WA7PHzXqpU9G+QUgJq3WxMgfmR1i0DsNrJWaXgNVBZi8tCscLTfEdhvclauNXcsb2ibNtk/akqnVVANS/OA+GAEbN7nkKS3Y2LU9ZIRJzoqzbFczlnW8H2ttronYBqIH2hZCRKosQRW/f5WZmFX56ziy1NVX+mvtVbhW15x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fMkBKyXS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fMkBKyXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742818954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vBvMUUbkMLRaYqxLSSI92c3hpwamAvh7kByiodVp/2g=;
	b=fMkBKyXSkAOs4dg8CcAz84xCkHLts9uqPyEyYP00bCOCLCwH/j9+pGnTkvha3aRGhdQ/Tb
	8Jp31gG0i5QmJUoMklG7Cjuu/RW6j5/5Y/s2LNkmxSXloKW7psQ9hn7xhVjSk5Sr2mtnTV
	ODM8thRv/0quokR/UJZHxnyYdtJUDbc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-5vp1renWObqhaX2_PDuE_Q-1; Mon, 24 Mar 2025 08:20:23 -0400
X-MC-Unique: 5vp1renWObqhaX2_PDuE_Q-1
X-Mimecast-MFC-AGG-ID: 5vp1renWObqhaX2_PDuE_Q_1742818822
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac27d8ac365so269292766b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Mar 2025 05:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742818822; x=1743423622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vBvMUUbkMLRaYqxLSSI92c3hpwamAvh7kByiodVp/2g=;
        b=Dk7ABovRfBQ8N5Z+AmkSKGvzXY0Sp3KAmNWBsK5baz6rwdXwUwCJaVe/bLivi++pXi
         Q69z1MypkC6ZHqzcFaPIGAPu+QLyZbMN58EYcVhiGbSAXA++Oxrlx9cMRgv0adVZCWms
         Ly/pBVZ0fijIvXN2aO/NVNHg/+ckqgDMyK57rRLdVQfQ0DXtS7VWMxKH+wDblrRXDv9E
         rtVN0VvjMsuClV2hfwBRvO9+p+y9QdicYHILtp9I0dH2HCSxFCIwr9mWNg2ouaYpQ2N8
         rzttAR27qQtyNuG1TR9vv5bSarcxYxamqvgaI8wTj9q1HKj0wp20QjF5PYAFCsXDPVH1
         ogZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGSxxlkowL6hb/CrM+qCl7xh0gsSuzXtIz50myoOJ3dhPI1bniZdfpHeLSHt0o0bwO+LHHYddzgLhA3/mtjzuCYqUA@vger.kernel.org
X-Gm-Message-State: AOJu0YwhqeufKYAmGnVE+b5xVz0EGVhCuj+RtjShg932vQkQ6Yfv3zyD
	+MFr1DwXUmU7bfwO2M4ssZ9RO7nDKA8Uur1Vddr3T2hUJDTQOeByxFEnyF2/ZxlzgDhxFwe4RtI
	KLTets40/hjIQb83F2dJ12vMCqXMjuhWprUkTWnlaBAgnBr8DwmWVtshfvL8Esb9VpR1NDzQ=
X-Gm-Gg: ASbGncuJ5tH5cP7IlsNtVlpsGSNTJbENuZohA7CwOfxryP7YYMhpipBb76oCP997mwR
	IK42LeiFalHifcb3ktz3Mxgnb5fvuRB3P8RvhJboLt6iYJ2FZkfaEeYk5TqJKOd6o6IytoGKuI1
	Z7V1r44DwriHbXhtBQKUr1eZF3oGqIMI3V0PAp/0hZSR0fIBFJMic/IZ+Wu379cWE3ipqQsXnlm
	dzWVNVzmlsO9xYeC5sqM0ULuNWonQujk5Muq+AiUxPDdPfcc/zmoP2oOp0QaC+B+J3BhDFdjdh3
	J2ObOItb0/OP2ovTSJA=
X-Received: by 2002:a17:906:f59d:b0:ac2:344:a15e with SMTP id a640c23a62f3a-ac3f229ce3cmr1090886366b.22.1742818822008;
        Mon, 24 Mar 2025 05:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdipAoepu1nHwUhR/99bUNdfsf56iHHtxs7QMKyzshA4SqzjR1onmN3GV4yX3QhxM4Rn8h/Q==
X-Received: by 2002:a17:906:f59d:b0:ac2:344:a15e with SMTP id a640c23a62f3a-ac3f229ce3cmr1090882366b.22.1742818821496;
        Mon, 24 Mar 2025 05:20:21 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbded04sm671995466b.142.2025.03.24.05.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:20:20 -0700 (PDT)
Message-ID: <ba25c7e1-5031-48d1-a1f8-1b25d57856f5@redhat.com>
Date: Mon, 24 Mar 2025 13:20:20 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Added support for a some new buttons in ideapad-laptop
 driver Added entries to unsuported wmi codes in ideapad_keymap[] and one
 check in wmi_nofify in order to get wmi code 0x13d to trigger
 platform_profile_cycle
To: =?UTF-8?Q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>,
 ikepanhc@gmail.com, "Peter F. Patel-Schneider" <pfpschneider@gmail.com>
Cc: ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250321083003.84661-1-gasper.nemgar@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250321083003.84661-1-gasper.nemgar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gašper,

Than you for the new version.

On 21-Mar-25 09:30, Gašper Nemgar wrote:
> Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com>"
> ---
>  drivers/platform/x86/ideapad-laptop.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 30bd366d7..a03377d87 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1308,6 +1308,16 @@ static const struct key_entry ideapad_keymap[] = {
>  	/* Specific to some newer models */
>  	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
>  	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> +	/* Star- (User Asignable Key) */
> +	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },

Still ack,

> +	/* Eye */
> +	{ KE_KEY,	0x45 | 	, { KEY_BRIGHTNESS_CYCLE } },

According to:

https://ardes.bg/uploads/original/lenovo-yoga-9-2-in-1-14-g9-550178.jpg

there already is brightness up/down on Fn + F5 / Fn + F6, so I would just
map this to a free (not used elsewhere on the keyboard) KEY_PROG#.

> +	/* Performance toggle also Fn+Q */
> +	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },

I would make this KE_IGNORE with a comment that this is handled
inside the driver, following how this is done for the 0x02 / 0x03 keycodes:

        /* FnLock (handled by the firmware) */
        { KE_IGNORE,    0x02 | IDEAPAD_WMI_KEY },
        /* Esc (handled by the firmware) */
        { KE_IGNORE,    0x03 | IDEAPAD_WMI_KEY },


> +	/* shift + prtsc */
> +	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
> +	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> +	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
>  
>  	{ KE_END },
>  };
> @@ -2093,6 +2103,12 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>  
>  		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
>  			data->integer.value);
> +				
> +		/* performance button triggered by  ...  */
> +		if ((data->integer.value | IDEAPAD_WMI_KEY) == 0x13d ) {

You can drop the  | IDEAPAD_WMI_KEY here and just write:

		if (data->integer.value == 0x3d) {

> +			platform_profile_cycle();
> +			break;
> +		}
>  
>  		/* 0x02 FnLock, 0x03 Esc */
>  		if (data->integer.value == 0x02 || data->integer.value == 0x03)

Regards,

Hans


