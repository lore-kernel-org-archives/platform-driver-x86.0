Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E132153BF6
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 14:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473717; cv=none; b=AvE3kfYwtyDAo825nwezMq+is44LFc1KhhnJW3yTMADDPa268YSDuFSrE9HVKRm6tvX1ErlU6nNqNnpuAN27uHkZ1T74Bpad8PbKyqmChy1nEJyXnPIL+VPYeK+uP7kIfDxERFHg4/4EyB0mCKJIRfQvlf7CaC/5YXgOcG0Ro2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473717; c=relaxed/simple;
	bh=AI6spKZhz4JWrlNyXuIgItaquR7eJd+58DceIHTXTs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1Ru0aMH+axwzOPvvX9HHlMwfr36p88XcYjBMkERlasljUzqn7EuVejKIYugSz1RT0tezX7y77QjUYlVB4pqXl1TP9bT5+bNythNwKqYSIALhzO1/KAlAa03s8cpWRjASu+THsIYugeoZcNFTJdSpugQK05B9xAvKKKpfHubVj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SW/KMQzA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SW/KMQzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723473714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ct7/View+4l3ph9qWoSqlnR+2ecSNu4xsS9euEQ7PTY=;
	b=SW/KMQzAQtBNr7p96aBYu4Q4d6aGOuVO3V1CKErG/Fckxb57BRu7ltgBlsnuAnFkjEcmEl
	gfJ2HLQWiSwndxZHrfmqh6sLGpSt+0ZWfssZXk0KmXtLgT8/7z2Upo0cPbdzc157c/KZMg
	pfrqGDQjnIPbkcUW7WuTLgtEXdom9HE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-9__xZh2ONNCZD9lAFXHL8Q-1; Mon, 12 Aug 2024 10:41:52 -0400
X-MC-Unique: 9__xZh2ONNCZD9lAFXHL8Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7a8281dba5so375424066b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 07:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723473712; x=1724078512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ct7/View+4l3ph9qWoSqlnR+2ecSNu4xsS9euEQ7PTY=;
        b=D63b+LzqfgaMWOz7AyS54A/kQhWieKRZlGj4c5chtRvGQaV72gVqacLp2tLUSRjCHF
         I6SBSdZK0Hze0CjAjK1zNc/qr5VdKYxAag/6YdW4+UWU7eR5rw2TsG0B5Nvpvzo1qEz6
         aODjrdjbanuMN7VpmQMZ6VgaXVjKHoxxmRAA+zBSaEqwSOQWBz9uCTh0OxtkJmpJMXUj
         MRoFa4ag9fyNmzXSUrhGd1Ain5Iypo58vpj9Nl1KH74M0oXhRJE37R/rcPNa4lNfVoB4
         sI8FHxZtAtNPOSIpuX7+iyFU0M1xTDgEekFc74CG7JaPrMY0DMhAdw64Xm+lmyp71D1L
         KtNw==
X-Forwarded-Encrypted: i=1; AJvYcCWC2MzFaXm9OwjibUAWZJeT3NOOd6hbJ3AX7JZLf3+QUGbrMT/I6UlUn/CDwh39rEJXH/9du23kmbPl+zUdwppC/VoHz5RahM0tUYDhYYnmts+PNQ==
X-Gm-Message-State: AOJu0Ywv6W12WyGQlEBNpLoMU9PxoV9oFxzk+hyo8ZvDg6OT0CUAnHQy
	ipc2O6EThTvq2Okd82XJrHGiB83UPMmntPqK2FfycNfEMAsWbyN5vwugfNLEUyfQWd6L7HytRBD
	ksRcKK1w28Utv28M8fGBSeVG4GBRGG6TjXXpkdyci/9gcAIZG0sW5ZxB8YAkVq9cEQRzNlDY=
X-Received: by 2002:a17:906:7953:b0:a7d:4dc4:3d8 with SMTP id a640c23a62f3a-a80ed2cc78amr32944666b.54.1723473711662;
        Mon, 12 Aug 2024 07:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6pYDoPxHKF0JtU+KsXm6QfsnfgvBOvGxMFko4h6mu7vuViWNqYCE9tPtEA3SMKi5lL4X/DA==
X-Received: by 2002:a17:906:7953:b0:a7d:4dc4:3d8 with SMTP id a640c23a62f3a-a80ed2cc78amr32943066b.54.1723473711186;
        Mon, 12 Aug 2024 07:41:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb213782sm234549566b.156.2024.08.12.07.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 07:41:50 -0700 (PDT)
Message-ID: <80dc479e-33af-4d09-8177-7862c34a4882@redhat.com>
Date: Mon, 12 Aug 2024 16:41:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Ike Panhc <ike.pan@canonical.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, Jonathan Denose <jdenose@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, stable@vger.kernel.org
References: <20240805141608.170844-1-hdegoede@redhat.com>
 <ZrDwF919M0YZTqde@mail.gmail.com>
 <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>
 <ZroaE5Q6OdGe6ewz@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZroaE5Q6OdGe6ewz@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxim,

On 8/12/24 4:37 PM, Maxim Mikityanskiy wrote:
> On Mon, 05 Aug 2024 at 17:45:19 +0200, Hans de Goede wrote:
>> On 8/5/24 5:30 PM, Maxim Mikityanskiy wrote:
>>> That means, userspace is not filtering out events upon receiving
>>> KEY_TOUCHPAD_OFF. If we wanted to rely on that, we would need to send
>>> KEY_TOUCHPAD_TOGGLE from the driver, but we actually can't, because Z570
>>> is weird. It maintains the touchpad state in firmware to light up the
>>> status LED, but the firmware doesn't do the actual touchpad disablement.
>>>
>>> That is, if we use TOGGLE, the LED will get out of sync. If we use
>>> ON/OFF, the touchpad won't be disabled, unless we do it in the kernel.
>>
>> Ack.
>>
>> So how about this instead:
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>> index 1ace711f7442..b7fa06f793cb 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -1574,7 +1574,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
>>  	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
>>  	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
>>  	 */
>> -	if (priv->features.ctrl_ps2_aux_port)
>> +	if (send_events && priv->features.ctrl_ps2_aux_port)
>>  		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
>>  
>>  	/*
>>
>> Maxmime, if you still have your Z570 can you check if the touchpad state after a suspend/resume
>> correctly reflects the state before suspend/resume in both touchpad on / off states ?
> 
> *Maxim

Oops, sorry.

> Just a heads-up, my Z570 now belongs to a family member, we'll test what
> you asked, but right now there is a btrfs corruption on that laptop that
> we need to fix first, it interferes with kernel compilation =/

Note as discussed in another part of the thread the original bug report
actually was not on a Z570, so the whole usage of i8042_command() on
suspend/resume was a bit of a red herring. And the suspend/resume issue
has been fixed in another way in the mean time.

So there really is no need to test this change anymore. At the moment
there are no planned changes to ideapad-laptop related to this.

Good luck with the BTRFS problem.

Regards,

Hans


