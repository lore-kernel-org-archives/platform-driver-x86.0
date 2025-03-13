Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DBD78C9C
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Mar 2025 19:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741893339; cv=none; b=fdiWvL9L9qNQMQE+Mb4k6sr1MLw0Fu7PwPZuM7sCTQy2TzGHR1y2StpDjry3HM6OZ8X1mvI8tZMp7HAZ+t8AIUllQ8iNM0v3K78uz4Ot7/jUAM89NSKO8qSeXyfM4/PVo347kDJ+wppK2FqptLGbjpkGosuzyHdrxYV4w+Z7eBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741893339; c=relaxed/simple;
	bh=nKA/E5BAVFgFgbpqM8yS8P0IYcpHhIaDjxvWq1HyZpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4oOOpgpEsMhHRmH0XW/X6mlSih7tFuP3+R++e5svE95ezgqzGo/7jguiI7FjRAK/w70uHXdkKeO+HnM7cjMt3eQ/Izx1ebFxgjraYOA5AfU2p4J2ry0EyLgiHbG6JMICg891dbM4dRELxiXnqNl+BJzxRdDVSZwKTfgYTQ+bM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MgSOnizL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MgSOnizL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741893333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/GeuUdoQ9yQB/N35y/SzwbvnWLDB0H21mABRRIcxTc=;
	b=MgSOnizLhWvIUVSOka006e1XY6sniP90+SsL1Py7SbXX3ggS2bcsU8PkmpCxeN09f85k9H
	FX1SGLKNdUDUz2+OdvwYck7r0berjAF+0pCz84fTbnZRlA0xU5mF3ZrRWaXzpNa5BBkPc+
	vCJ+qdt8MUVYLVKedSAKf3xpXvrbZ3U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-XhlKm1joP0SQVsJUAzNOQw-1; Thu, 13 Mar 2025 15:15:32 -0400
X-MC-Unique: XhlKm1joP0SQVsJUAzNOQw-1
X-Mimecast-MFC-AGG-ID: XhlKm1joP0SQVsJUAzNOQw_1741893331
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e6b2b8339fso1204252a12.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Mar 2025 12:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741893330; x=1742498130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/GeuUdoQ9yQB/N35y/SzwbvnWLDB0H21mABRRIcxTc=;
        b=A+58zvNmvpjA4pUuGbMEWp8zqDOm09XwDRbasboXiocUTUpA1tU2E5X/reqV4qgEOd
         XQZG5LGQL+s/WsQNhztunvh/y77F5TJn2UJrexXtTuO20klxFbPgqL8msuLG8TYPeIKM
         IKylUZvRVvTlrpNlNuDGxr7UfAGKTjyYVZehUUzrWAzdMbnY4f4w6ZFim3mZQ3KL2Ad7
         wqWkMOYlTmRrh3AMOSWxwlECUhIu3U4ELNqxinW/QIRmQc5/Snnjet12NKhEi5xH2xbK
         4Ww5Oj+wxZHJp2Uy6gm8f8ibYLDQEwwRMQ/QULOyu2M+rG/rD/InDX2SGqBwYadFuD0Q
         4mpQ==
X-Gm-Message-State: AOJu0YxaoHBPOgTaa9LPCcIbniH2VLIliog7MW4CgAF5+E5ZJwr/Wfhx
	rnPO5oR543wPUQuEccJ5rk83SNjuErwI9MHdx93F6bUi33jKswTc60kSWRinio7+7+61neRNK+x
	KFCFU54cx4o3aM85S7rkj5Xfjg1m/R0i+eLhoQh2ModcURLPDkJtZf1lSay1bz5abf4wOXei9Pw
	bq6pE=
X-Gm-Gg: ASbGncsZPdvH01CN9HSKrdoGMC3tAa2Gxoz1zC2PwnL/rosk35EPwl9B9a9UGQliwDX
	oMtlC4tzCbhXMvudRG7x8nZLasHoEKi9Xf57IZYPRkrIPrRMOCY3vtt6pUfJHueRQHyN/1kE5kt
	r1T9d/m2ldce6uLlwIyGXh6biKxG/HR9USb8O/8sD1JVVfaWIcEpqnF1mWeaGkbxt3svtUwbPuE
	bz8PI7bj9+L3LjJSdwTY7sNGz2TfYRo6qXWhwX3WUZ256EKVYWfdUiQo/Y4aNTBwH/OEho3O+X9
	mReEFsZv/t5XN4cqd+l+wuJpzSxvRKvFRjZqtvIq0zipuU9BpZf6041Am5lISxe12E48MP+WYxx
	wxOeeOJiWOR4DX8i+4LDZG2fzgzRxch8v5y3lR3d33qPDASDkH01H8DxFdKORmNQVkg==
X-Received: by 2002:a17:907:724c:b0:ac1:fab4:a83 with SMTP id a640c23a62f3a-ac3293464c2mr71382866b.25.1741893330100;
        Thu, 13 Mar 2025 12:15:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwVBGmR8gCSv1U/7U0EXf86khBXm0vn8IGX1wwa+GnD7cJoJ4LMLfGI2FGqUBrN3xRRbqUsQ==
X-Received: by 2002:a17:907:724c:b0:ac1:fab4:a83 with SMTP id a640c23a62f3a-ac3293464c2mr71380566b.25.1741893329700;
        Thu, 13 Mar 2025 12:15:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147f0cd3sm114988566b.70.2025.03.13.12.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 12:15:29 -0700 (PDT)
Message-ID: <82e04751-9977-4aff-af50-a98663efabf8@redhat.com>
Date: Thu, 13 Mar 2025 20:15:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Userspace expects F20 for
 mic-mute
To: Matheus Polkorny <mpolkorny@ipt.br>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
References: <20250220171942.1381605-2-mpolkorny@ipt.br>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250220171942.1381605-2-mpolkorny@ipt.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Matheus,

On 20-Feb-25 6:19 PM, Matheus Polkorny wrote:
> In Lenovo LOQ 15IRX9, userspace expects F20 for mic-mute
> KEY_MICMUTE does not work.
> Other machines, such as LOQ 15APH8 and LOQ 15IRH8, also
> use F20 for mic-mute.

The mapping of KEY_MICMUTE is due to a limit in keycodes
(cannot be larger then 247) in X11 / Xorg.

The mapping of this is therefor traditioinally done in
userspace through hwdb, see:

/lib/udev/hwdb.d/60-keyboard.hwdb

Note this mapping is being removed though. Xorg has moved
from having its own keyboard + mouse + touchpad drivers
to using libinput through xf86-input-libinput.

And with libinput the keycodes do reach that driver,
so the mapping of the touchpad-toggle and micmute
keys to F21-F24 is now done inside xf86-input-libinput
because the hwdb solution also impacts wayland and
we would like to move the correct KEY_MICMUTE, etc. in
Wayland. Mainly to free up F21-F24 codes to be actually
used for F21-F24 since some keyboards do have those keys.

See: 

https://gitlab.freedesktop.org/xorg/driver/xf86-input-libinput/-/commit/cb80d7f82d35f8068e06d45860ed958a948e15bf
https://github.com/systemd/systemd/pull/34325/

So NACK for this patch (sorry) for 2 reasons:

1. The mapping of MICMUTE -> F20 belongs in userspace
2. Even userspace is moving away from always doing this
   to only doing it inside Xorg by moving the mapping
   to xf86-input-libinput

Regards,

Hans




> 
> Signed-off-by: Matheus Polkorny <mpolkorny@ipt.br>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 30bd366d7b58..6420e28c08ec 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1306,7 +1306,7 @@ static const struct key_entry ideapad_keymap[] = {
>  	/* Refresh Rate Toggle */
>  	{ KE_KEY,	0x0a | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
>  	/* Specific to some newer models */
> -	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
> +	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_F20 } },
>  	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
>  
>  	{ KE_END },

