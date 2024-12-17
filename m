Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198DA1F707A
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448104; cv=none; b=KrO86IhtOv+bO6gmVQ0Lr6+hhsszP+Je40tDs4sKuu+INQ9QWjGPYW5HhZwOkSAG9YPR/6VoupANQlX9OK1TLXsWNfb2Kc6+oVKtIkY1Q4KS5WIHha9pa2eowMPrYPODa1UPPdoEqZvuPbIUUbmLhrYzj1sJ4GtjlOhALHWx1Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448104; c=relaxed/simple;
	bh=EnOLx/nHKpZaAJE5Zlhn7nWmQRH3Q2HYlAAYXXmpiJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KY462TPmh2NLjmJGZu4B5aHzWDyq1ChO9g2aDQwup8BbHoBHshb4pylfB5NAxYwW0LlhFpfCbN5eSTsAsxh23gUw3XU5+cxP1EOL7CWkmbdJy5/S/tzzinViL1gQXP6aRelf4K+tmeMG7v3c8+a041u+FNgh3Tm9NLbOeUqt1jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5qLMCar; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5qLMCar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734448099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D7ABiOnpBEGx89PJw5n4fgFhL0VnSY3UoS2smPvphwQ=;
	b=S5qLMCaroKOv72Ui+nrTCrRXB60mhldBWu99hVNLarud+aJgpkhGUGD4cW1yI5j7DBY0TO
	BXPgevqoWyepubYSu6DUXF+pQRrMvH92KpX/vHJ7t8dw9fpIL6hZtuC6BCC7zZcAweIRfb
	6xqT1YYic5rg05fVv8liCtunZWyq3pM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-Vc7LDWb9O_GzN2nWhNWk0Q-1; Tue, 17 Dec 2024 10:08:17 -0500
X-MC-Unique: Vc7LDWb9O_GzN2nWhNWk0Q-1
X-Mimecast-MFC-AGG-ID: Vc7LDWb9O_GzN2nWhNWk0Q
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aab954d1116so366810566b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 07:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734448097; x=1735052897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7ABiOnpBEGx89PJw5n4fgFhL0VnSY3UoS2smPvphwQ=;
        b=e6nbYIvfBRPMSamktheNLnWrwQH1xj1Rgl4iWRrc9phhoBWYZ0oneLMr5hXkfSsndW
         rdM6io/1igviqpk9LsLq1AWssuLb8XIHhnUS8Jorfm10mztwVyLj4DhWkgFkZuc+Yr7V
         xBibO1QpUF/64SH6xTZQGIjokd9KrgQhdRk6GtPnG4nSmbs9kgQT3HvNKU4LuNFuVdt8
         3I/1F+cU+6rWd3yerUIksR6tojE8HAVVsDoyUqFMD2BDyT2A/oO7rQ2PCq48W8P4FCc/
         ce7B/WC5QLgeN+osoIzMerMaK8cveIiKOmrN9r9ahGONxte92H1kUjf6Wl5QKk14eLX/
         C2pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJreFCAw06lCmnGT7KYBzTkMzQPOFUgswaXFcCHpUcsGuCVp30qeIZLnx7bxMLXAd5HGnEyzLaIwW+DTOqbAYs5OC4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlw6vUT1vLhj2NRazCwJ0Kb9EPUnsVK/JRU2sAKleFQm4YOtKt
	2/Qn7zZTRvGYZIwxeUgdCaB97hHhHBfu+I14XVzFKz7hYMw2ALY7sQHlPZTFZMGDB96AfnEprfV
	cLJZ9lSehn2xBsn9XK+5D7TxLrXyzyn4w1HIZOBJYezQYRgHN7Cjc5HLWnwMjvSH6sxrFr2o=
X-Gm-Gg: ASbGncvmjoh81fZnQRxbWWUGi7MgI5nX6r4/10/EODIaFhU5Mbdog/pBacMVtEWwAe/
	oqSZH0yYIdYrpx7vpLaJRU5LBkx6kNi30h2FBd2f4AyCmRjGtnbDXGL3QHbSVIWz5f+NJK0a4ol
	w7QxgSPIOamm0rIuha/uVcjMLtNCZkweOeyWk1DEQnokNSQUlKj3U6RjiyG4e/WVx4453LlmV5z
	MRi+nopPl2OLUfExkonjzmoKZY+NtVoutGNlA0HEnFgfFLH72HZdKgQynXYMOXr
X-Received: by 2002:a17:907:2d26:b0:aa6:691f:20a9 with SMTP id a640c23a62f3a-aab778d9db3mr1484535166b.4.1734448096595;
        Tue, 17 Dec 2024 07:08:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDWHkMPveAxZ0xKYxQGkeagwKHAxrWPUWCyDh6esu0iO6udkUJ+rwK5j9MucJziPskb6Bquw==
X-Received: by 2002:a17:907:2d26:b0:aa6:691f:20a9 with SMTP id a640c23a62f3a-aab778d9db3mr1484531766b.4.1734448096173;
        Tue, 17 Dec 2024 07:08:16 -0800 (PST)
Received: from [192.168.162.203] ([109.36.231.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9639363asm452932366b.169.2024.12.17.07.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 07:08:15 -0800 (PST)
Message-ID: <1aecf86b-6e3b-4755-8f1f-d3dbc8d13644@redhat.com>
Date: Tue, 17 Dec 2024 16:07:49 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Add samsung-galaxybook
 driver
To: Armin Wolf <W_Armin@gmx.de>, Joshua Grisham <josh@joshuagrisham.com>
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 corbet@lwn.net, linux-doc@vger.kernel.org, jdelvare@suse.com,
 linux@roeck-us.net, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241209163720.17597-1-josh@joshuagrisham.com>
 <53c5075b-1967-45d0-937f-463912dd966d@gmx.de>
 <CAMF+KebYQyN+gkHayAdZZHPU7DbghwpmVQaLFaf0TiBb-CVp7A@mail.gmail.com>
 <44cd9966-e24a-4386-a0cb-20b1022adcee@gmx.de>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <44cd9966-e24a-4386-a0cb-20b1022adcee@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Dec-24 2:41 AM, Armin Wolf wrote:

<snip>

>> Regarding the keycode do you mean that this should send something to
>> the input device via the sparse keymap or that the i8042 filter should
>> emit a key event, or? And/or that it could be handled with a hwdb
>> update in systemd so that this key gets mapped to the right event?
> 
> Please send the input event through the input device with the sparse keymap.
> 
>>
>> Regarding the specific keycode I assume that maybe the appropriate one
>> would be KEY_CAMERA_ACCESS_TOGGLE ? (though I have not seen any OSD
>> notification with this keycode but maybe it was only with older
>> versions of userspace tools I was originally testing this with..).
> 
> Depends, that will happen if recording gets disabled?

Since the driver handles the toggling of recording on/off itself
KEY_CAMERA_ACCESS_TOGGLE should not be used. As mentioned in my
reply to the v3 posting:

"It would be good to report the camera state to userspace using
a separate input/evdev device which reports SW_CAMERA_LENS_COVER
as discussed here:

https://lore.kernel.org/linux-media/CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=w82D6zKC9hnpw@mail.gmail.com/

the plan is to make that the canonical API to reported "muted"
cameras."

Regards,

Hans



