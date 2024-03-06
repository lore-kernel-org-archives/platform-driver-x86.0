Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE01E604C2
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 11:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709722888; cv=none; b=IiUMtJlpU1HRz2nTtRxrdFb41O0z4rYNr0cUcSfcKCwzSVCenqVIRNKdTxWW97xkO2Alp20NSArtYsrHTEacts0cMX1uj20PJJXsFNkjYOsV+WpLDePAz/xp8tzYAFRnD9TJkqdBK6/4iqHyIRLS690fw9aAbYzwqIVGfr1A4zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709722888; c=relaxed/simple;
	bh=0BtgKlkxEFfuAK3jbJm263LilfDmbaFMUABjdQurww4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wx+QH3SVyC9ornnYkILECW5kA7up7M3lpdEUMA07jquTkxEaFa89OTzkxq3ugC3vpmBCFmIehdKTh3pMZVLIlCOjVITST94QK8EyP6a9YjCyaZHmreL4lsRvEhivhcXv2JfcdJMhNt0DmwGTu7HIxnh+HcVSTjTZIH53v7GUCP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J+8TAByU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J+8TAByU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709722885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9/xdqIyX3WHBcfaU82MWvytSSDhoROzy1XJYnAGe0xU=;
	b=J+8TAByU07am243fz8GjUtlvV4QikhunozhKEw+wpFpnp8C7aTGN/5t47btOVX5QoGE6th
	2X9v6sLzaf19wbkGMqkbKagZjd2Y3I2ZabI9DZ5WRon82SqaA3rORSh1DMm6O3pnI8BFF8
	yQNQNcBur0OwaoUtbdQeMlEd9/2+9yw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-MJeKc52NM9epToKxeY2kTA-1; Wed, 06 Mar 2024 06:01:23 -0500
X-MC-Unique: MJeKc52NM9epToKxeY2kTA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a4455ae71fcso410809766b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Mar 2024 03:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709722882; x=1710327682;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/xdqIyX3WHBcfaU82MWvytSSDhoROzy1XJYnAGe0xU=;
        b=FXXbIKqlFN6Nbynz0yqXSePIjCKjogC29YIKQ4vfXszhouZvZKqpVaE0dhEz0LcVMM
         aYQ6aBXP0wN2IVUfF70h/kbgD/lx8xQVQYh4rqo1hfGeWxR2VrfZJWCAUSTPDW9ffU/m
         XVzxK+8NumviUttaEuU5oLWL4+IAf45XLpJsk1U9qZEqeBQUupBt3LwQ+Tq1XkiOBVIW
         RSuwy88XwqkGzUyPjThBLyb+O4PBSXblxa2ffdr8XY3KlQ/30gvW5AmPffmcbRQFbcVb
         NHRprxeHCdqTLmrqCuqQhaQid1MVHfZICz9Z/8T6nI9b0gV3C3d6czBE8LXcqE5M+Y7H
         bsCA==
X-Forwarded-Encrypted: i=1; AJvYcCXNvECbIQaXMwWcAd1su8Sa+Aee44RHRlb14MXxcx06w2g5hyeiiZ2BOsjHpXEhu4tA9cToZK1/Luhela4D+bOuQRMLzn4L3Up/Hy5Xj/LKA72T6w==
X-Gm-Message-State: AOJu0YyrOcmw01/6SFXFfzUnY1dXWrBGvnm98bVwZyz2olGApZoIeOI5
	KJDrwCBUnoN0G936kSKghGrzb7ZHCucKkIoIIA5rALoK9lG4K+TgF9Jpk9eIU/ESLhVXdfFPyWv
	zdtPUR7sKW/HqBF5nR4lYtKCXJ4aXr1J4WLscw6MfaRP5YkRr7t6rAucDo7Y40ykDeVJhPJE=
X-Received: by 2002:a17:906:4709:b0:a45:5831:4f00 with SMTP id y9-20020a170906470900b00a4558314f00mr5190501ejq.75.1709722882531;
        Wed, 06 Mar 2024 03:01:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGU2MCC7j95NF/rjcuadNvSxFpI8Ztf1NyvWpuIx8AEUaD0oPQp9HbDvXv2YrwJR9Zze55HCA==
X-Received: by 2002:a17:906:4709:b0:a45:5831:4f00 with SMTP id y9-20020a170906470900b00a4558314f00mr5190385ejq.75.1709722880571;
        Wed, 06 Mar 2024 03:01:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id wk15-20020a170907054f00b00a4519304f8bsm4011706ejb.14.2024.03.06.03.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 03:01:20 -0800 (PST)
Message-ID: <829d07c8-b602-4463-9f8e-dc8eb73aa077@redhat.com>
Date: Wed, 6 Mar 2024 12:01:19 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: add lenovo generic wmi driver
Content-Language: en-US, nl
To: =?UTF-8?B?6Im+6LaF?= <aichao@kylinos.cn>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 W_Armin <W_Armin@gmx.de>
Cc: "ilpo.jarvinen" <ilpo.jarvinen@linux.intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 platform-driver-x86 <platform-driver-x86@vger.kernel.org>
References: <2o0aznm5pjb-2o0c9lfkrd4@nsmail7.0.0--kylin--1>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2o0aznm5pjb-2o0c9lfkrd4@nsmail7.0.0--kylin--1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 3/6/24 09:17, 艾超 wrote:
> Hi
> 
>  
> 
>> I would be interested on which devices this driver was tested and is
>> expected to work with.
> 
>  
> 
> Lenovo A70，it is a Computer integrated machine.
> 
> 
>>> This looks similar to a switch.
>>> Would it be more useful for the user to report a standard switch instead
>>> of a key event which needs to be correlated with the sysfs file?
> 
>> I agree, maybe SW_CAMERA_LENS_COVER might be the right thing to use here,
>> if those camera states (open/closed) are meant to symbolize camera shutter states.
> 
>> In such a case the initial switch state has to be retrieved, or else the input device
>> cannot be registered until the first event is received (similar how the hp-wmi driver
>> handles SW_CAMERA_LENS_COVER events).
> 
>> Ai Chao, can you tell us if those two camera states are meant to act like a switch (camera switched off,
>> camera switched on) or meant to act like a key (camera button pressed, camera button released)?
> 
>  
> 
> The camera button is like a switch.  I can used SW_CAMERA_LENS_COVER to report input event , but the OS
> 
>  can't to show camera OSD. OS need a key value  map to the camera OSD.

Please use SW_CAMERA_LENS_COVER in the next version, that really is the correct
thing to do here, so that you not only report the event of the camera state
changing, but also the actual camera state (on/off) to userspace.

This will also allow you to remove the custom sysfs atribute since you
are now correctly reporting the value to userspace through the evdev event.

As for userspace not responding to SW_CAMERA_LENS_COVER, this is because
SW_CAMERA_LENS_COVER is relatively new and we need to add support to
userspace for this. SW_CAMERA_LENS_COVER is already used on whole a bunch of
Dell laptops for this, so we need to do this anyways.

Please file an issue against GNOME, lets say against gnome-settings-daemon
for this.

Regards,

Hans

