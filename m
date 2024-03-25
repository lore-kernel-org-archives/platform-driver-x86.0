Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71DD3DABF1
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 14:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711377565; cv=none; b=QHtiIhLwQdLrIDuvO/xvLlAhJrOFEKBXklrMznQmF/xOuHwYvwZd5MD3lb7ZGbi0oW0n/rcwCpoQYdONTUfvN75YeWrZJCkzmKpmEyekjhBs94ZqhV8LFGyZMH5RmcXDXUxxRxzIykRiJPzz2FIjc+bpdZr1LgKeB99mn2jYHwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711377565; c=relaxed/simple;
	bh=Lk2RZF54j5U19d/YiH30sQZ8syu6Y9S/m5IF/jSrVTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IAk307V1HV8yyA/MHPoF0G8p0/Fr8FEMCpi6+TwkSMz8W7FDllA1s+BbS503wObZFwceVStvEKTO/9pkcCLdP+zvcZqYF9KK9R2kNLsuxjFPJavnADvLACfrULEEdPKJ6jRR8DS+8FTuOs5Um5UqPPXvCbq5gf1bg+ufRaRMask=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MDxIwWkj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MDxIwWkj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711377562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oCfsdsvP7ludbMjImrhMkYxGixVSdG100rZhA0Ja/AQ=;
	b=MDxIwWkjDuvJiY0EpXuBIj6n90N1CHhkswM5HEDPbT0Xz+A4uURS5BX6p+9rGWhJAknUrX
	JHedhMO3mWmnfae0ImzO+/iRn+T4vwuSM8MtT3H1iJNVeeSNVCdFLT1Hi5RZo5nfPZnDXa
	aCj2+pjr00O22yoyDdpaC6WxXOCOPtg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-dckk1254OoeqVkGN4YOrFw-1; Mon, 25 Mar 2024 10:39:21 -0400
X-MC-Unique: dckk1254OoeqVkGN4YOrFw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a4747f29e19so77852566b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 07:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711377560; x=1711982360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oCfsdsvP7ludbMjImrhMkYxGixVSdG100rZhA0Ja/AQ=;
        b=tJ9K72qlw1IFAaj75sCog30vLkxbWt0ONZrm7vORqMTbdPw4FSF7m2UYBoaYYtYOdc
         k+NeqlI27uAV0K4DS9t9ianQFiUSKANA3waLa/HkDAVG7PZTjhcHxeFn2WvgxIC7BO4p
         t++mUjQYp3A8nE8vY9xjg3Reo8LSq09HNq/EVZ8b1/SKdFGVLnmU46wm2MQJvVRiug+3
         +2/ROntxgLYm6blZ/Avp4Lwp4EIsXjdxWX9CxiutiU3NLkbxhmbWWjwbYJ/00ZkFoO7O
         BIU057Gs8fpPGlR06sHQtv6QaoVlT6+RiK0xPDvrl8pMArgqRvUjntNaIFpnu0/N7AZi
         TweA==
X-Forwarded-Encrypted: i=1; AJvYcCWN2v7qrQbIDbw1rY+/6Q02mJ4L9gDBaKB4kc9kFVhE274I3k115Kg9q5laC4l6iBqVyOn4hcKv61bBq6hMZjZwSiFnAtoSxHAcbo1dUu3hrT+cpA==
X-Gm-Message-State: AOJu0Yw63VyhmuOh1BfwGuWXNncxEjPqDAZ2ARHdib60JfjWQEldSKO0
	3jZvQwR2NGFdrEucHCXLTfI4GCjXbxKlCkuFGXFZT92P+GmY+Bu1cyTF1cXchSrdfkj3G53px5w
	oBV7gczDGWyswkRoJRd3ffg27aO8ILcTNQfUoJJFZGNs5QxHjt57nGfCIMy3blFeI5yq9e1k=
X-Received: by 2002:a17:907:3207:b0:a47:45ab:9ca2 with SMTP id xg7-20020a170907320700b00a4745ab9ca2mr4638369ejb.53.1711377560040;
        Mon, 25 Mar 2024 07:39:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8kVmDadyAF+9dx0r3pwwE1vrrxcSK97cIAiz4ejI3z5KyqN3+SpZcbuRADiMgVyErPyV/Cg==
X-Received: by 2002:a17:907:3207:b0:a47:45ab:9ca2 with SMTP id xg7-20020a170907320700b00a4745ab9ca2mr4638349ejb.53.1711377559694;
        Mon, 25 Mar 2024 07:39:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a10-20020a170906244a00b00a46ab5aaffcsm3125275ejb.178.2024.03.25.07.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 07:39:19 -0700 (PDT)
Message-ID: <42a58d00-87e2-43b7-8a9d-ec167e2a5d25@redhat.com>
Date: Mon, 25 Mar 2024 15:39:18 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: p2sb: Make p2sb_get_devfn() return void
Content-Language: en-US, nl
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20240305094500.23778-1-hdegoede@redhat.com>
 <mkrcd6it2ejerpwpxevq6obxbzz374fh7lc6fltqtxizugoqq2@kwvzznyqmflh>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <mkrcd6it2ejerpwpxevq6obxbzz374fh7lc6fltqtxizugoqq2@kwvzznyqmflh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/6/24 2:58 AM, Shinichiro Kawasaki wrote:
> On Mar 05, 2024 / 10:45, Hans de Goede wrote:
>> p2sb_get_devfn() always succeeds, make it return void and
>> remove error checking from its callers.
>>
>> Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks, looks good to me.
> 
> Reviewed-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

Thank you.

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans



