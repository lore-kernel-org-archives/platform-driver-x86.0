Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB7181317
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Aug 2024 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724320000; cv=none; b=n7ofgZesMGvk3vfqDH/hhF9/3JiDY2xIGBbUeqdIKnab89GS9zye/APuIUP2E0bK7MiFR5luzXWvuT5+4RPQ8D9fQNOkp+g8xXDxxqhBpGmk9S/wm13px4h2jLlZryub6egtOwgFD3t4a4kErkctonASkVgHaRk0EWG0gwakh/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724320000; c=relaxed/simple;
	bh=9LgryV2GQqe/l3lws3rfKC2TYYO9HW3gUt67U7qz7g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLpBLDSMFkQzUCgWTmyDy7KbtuMaWQ4Fk19AzrHFMoghF8WtvGmYvSzV0Iq/laNs8NaDn/1jAlM7sJt/uSpLIa1j2eGL3xyEBYRP8DkTKMcWc+3NQZPF8GoY9xkmrDfLHGf2vFS74JcU3ixe5UQ/T+TMQlLXQh2P1PaH1vzaLIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=brVj9aLq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="brVj9aLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724319997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ggRp79wknNfn3alru8HeXa4AZlJP0k4bw1WSXsEJS38=;
	b=brVj9aLqdur/JldZXVbR9fAwoHUFsVht3CibmEghk1SrF/8cI6vsKlpZMXsAUqozpm+mQt
	TgDlN/RAJVJYsTGYx2mcJNhQdQnvkQDLHBYvg+65Mbb0kHC2QGBxb2+2Y6CtRdg7FZnUc3
	Yy0CGii6KjrsgM3zY1m+bzWrgw+ZQoE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-a9xFbRH3ORiDyc2AD4uD7w-1; Thu, 22 Aug 2024 05:46:36 -0400
X-MC-Unique: a9xFbRH3ORiDyc2AD4uD7w-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-53214baf2aaso573809e87.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Aug 2024 02:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319995; x=1724924795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ggRp79wknNfn3alru8HeXa4AZlJP0k4bw1WSXsEJS38=;
        b=LBUX4Yc0m/1Bhv+RATgF639JcREwuGDWkEWeMDWWqmwCD3HI+69ZXdcPSLpqVA6699
         4VifYMfq3ooGvuhC0CA5UtVQP7OSPlH4f7/8lP7560C5iXhUZl6EMbGfUxMmqA4f8J8h
         oDVMYbxbqmerLUCmo7/w2h0DGqtFmONQ4lC35eyIffjQ9ZIfOg78y+sDhxfa5+BkCmyP
         4IdiPV4WFCutQHNokNhhmLOwEl1q1+UgQ0KA5yjnAD/x5aVMf0Ag6seuBf/ILxFNE3TH
         1Dwo/oAi7Cm+f7P6NAytF1+OLwcEHemy6b1ugPQRyTxo2jX9lG8ZbwjfVY8MpuAraOI1
         zHEw==
X-Forwarded-Encrypted: i=1; AJvYcCUT0lwmALwwLsyniYgsg1PNTevS+qHFEOwDxxfLdMF6gLMkONnLhrsXJQfXFTZwo/W9CyY2CiCOZ3v/geqdANIh7wuQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj9txWCBtj8AqZlWNJq+wT0QVNras3+nDuY6SdpIV+fzTnyH6r
	0Fs155psqwJRrCDwIN+xM30eCiszssCCfXLY+JF5tytgMLJNpGMMHPqhTsJ/Xkk9S/AKzJZH4EY
	53L7P2vcitaNo4RaU4kc0robancsaGLiAmy7cfdaz4h2kOt25i0iftx9MqBPR/9SbO2MaHgk=
X-Received: by 2002:a05:6512:3b8c:b0:52e:fa5f:b6a7 with SMTP id 2adb3069b0e04-5334fbe5954mr1009811e87.13.1724319994699;
        Thu, 22 Aug 2024 02:46:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9xW+dmd/gXKMsIZeDVEH8teo4GMrxkxKCOlqmTdl1N95CvydtAPbONpi1qEeEezfv8gue9Q==
X-Received: by 2002:a05:6512:3b8c:b0:52e:fa5f:b6a7 with SMTP id 2adb3069b0e04-5334fbe5954mr1009786e87.13.1724319994097;
        Thu, 22 Aug 2024 02:46:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2ca516sm93612966b.87.2024.08.22.02.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 02:46:33 -0700 (PDT)
Message-ID: <0923283f-0b7a-4dcf-8d22-b55595b1ba35@redhat.com>
Date: Thu, 22 Aug 2024 11:46:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/platform/geode: switch GPIO buttons and LEDs to
 software properties
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Gross <mgross@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Borislav Petkov <bp@alien8.de>,
 linux-geode@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
References: <ZsV6MNS_tUPPSffJ@google.com>
 <a2366dcc-908e-41e9-875e-529610682dc1@redhat.com>
 <ZsYu0SEy8ZUKEJqP@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZsYu0SEy8ZUKEJqP@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/21/24 8:15 PM, Dmitry Torokhov wrote:
> On Wed, Aug 21, 2024 at 12:15:51PM +0200, Hans de Goede wrote:
>> Hi Dmitry,
>>
>> On 8/21/24 7:25 AM, Dmitry Torokhov wrote:
>>> Convert GPIO-connected buttons and LEDs in Geode boards to software
>>> nodes/properties, so that support for platform data can be removed from
>>> gpio-keys driver (which will rely purely on generic device properties
>>> for configuration).
>>>
>>> To avoid repeating the same data structures over and over and over
>>> factor them out into a new geode-common.c file.
>>>
>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Question has this been tested on at least 1 affected device ?
> 
> No unfortunately it has not been as I do not have the hardware. I am
> hoping folks on geode list could give this patch a spin.

Ok. I assume this is part of some bigger plan to remove platform_data
support from either LEDs and/or the GPIO buttons ?

I would rather not merge this untested, but if it is part of some
bigger plan, then I'm ok with merging this if still no-one has tested
this when the rest of the bits for the plan are ready.

IOW lets wait a bit to see if someone steps up to test and of not
then lets merge this before it becomes a blocker for further changes.

Regards,

Hans


