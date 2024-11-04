Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D5719309A
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730714696; cv=none; b=LgY5+vux+xRVi3NzdBMPhNcbqcZUT2KNlj82Ub45lSICWhpKDO/pIcqQpifQrCAolbWx4DsbDigG0I7ba9MZx0DSfrg2H7oIaOBNA6HmiWPZR/Ya9d2gcOBfeVCEZu1i/1IOncEghwgbeDs7K3izBER/V7H8EzuyqhrHIMF6FXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730714696; c=relaxed/simple;
	bh=j6FK+QcFXV1PXLH5fQz7HwdZu+CP4alnNimVP6X1tMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a59e34a99p3i5I+0155B/Bz7oIGYUmoWWacouT/hSwgHFOP1rjX+lbFJrLoJlhqMpDnWMivm3WDH0+0oy22FZirNEOdGNTRvYn+Sc8Oe+GIz+lopPatBpSOAaFTJC7VXn/6x8TpyBENlGTk0fnCWgNMzC059hYsE7l9YFWhXaZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JXdWVQbx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JXdWVQbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730714693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rr0x/642zGcE80hVGdWJ4xDKS0hjceKOyLETD5XhvJ4=;
	b=JXdWVQbxSaXCbyVj4z4CgyQsOs9dvtZPKrRmdITV8IX1q8maxSGZbWv5NSQ9BT0p5LjL18
	Ekykut5s9Ar1ov3NsaP7GK2ixzrOwen9r9TYUXqXpDA39ljNv0LavAXnIgE3RT4vrPGQhM
	2+vmAreh93ywA58BGmqtKalxvjXuTRo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-tF5ZlqcEM1GfgcYK6GKzhw-1; Mon, 04 Nov 2024 05:04:52 -0500
X-MC-Unique: tF5ZlqcEM1GfgcYK6GKzhw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a99fff1ad9cso351941366b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Nov 2024 02:04:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730714691; x=1731319491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rr0x/642zGcE80hVGdWJ4xDKS0hjceKOyLETD5XhvJ4=;
        b=ICWn7rI4C8OycSQvDIcwjsmE8/BODz9DH+bemDn75mf8S4t2mxtlhAWBe3xZgaChhG
         y3zCHfB3Sbj3MME/hTkkVwejEgwxSnA0Z/35L45JAT+tqPDTUMpmaSK+jWu9oaeYhgHW
         f8sroh7RqnoKMEnDCBP/lL7JKK0dDbGzhHXdABd/ztYJxFBcokNmWKX7DPxAPRdJNAbY
         44nWROtly61hEeTk9fcBMm8lBrb3srJA8ken1Ce+lS6ZZoo4UCa4gINbgKsfeyPrbKrm
         WWSOgS8g8sMY2BIuZWy7Tp/o3N2OIIgiU2aqut4orNHzzjxo+LwYl6QSDRq4YI0auDJx
         w0kg==
X-Forwarded-Encrypted: i=1; AJvYcCVm8MmyThdEdKlYrIbe6qe97QnCZxY/e9YUN9UqgiHAwZ/Pj3Kn/sv9TSrdSv1aNSm7zaPLKvrpIdwrxN/AIXNp8/EH@vger.kernel.org
X-Gm-Message-State: AOJu0YzvzOLJMxZ6jENtVxz4p+9h1idg0dglAcaoRy6c2MHRfoguhpuA
	dBmyMh2i79RuhpkdTJxTu2d/kfExD4VDILN1aVU1YSKAvw6IxczIlZDaVawdVi0b3cqTK0cfcmk
	orEnzhkEwzKGbp/KYP2e/B5i2ftty1YVoIIS37BiMqN7yLyQT3H8gkYbu3BB4Zir3SLhQ5nM=
X-Received: by 2002:a17:907:1c1d:b0:a9a:24a2:180b with SMTP id a640c23a62f3a-a9e3a7f2174mr1755624766b.57.1730714691058;
        Mon, 04 Nov 2024 02:04:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk/6X5iphD0pbEQ2fucbUHyw3wo9CHjAKQ/X/7Vcp/jJ3z+kYYgLixvBF2Ri7qLRxsJUMjTg==
X-Received: by 2002:a17:907:1c1d:b0:a9a:24a2:180b with SMTP id a640c23a62f3a-a9e3a7f2174mr1755621466b.57.1730714690591;
        Mon, 04 Nov 2024 02:04:50 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7700dbsm4086192a12.34.2024.11.04.02.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 02:04:50 -0800 (PST)
Message-ID: <0f27f32e-bf00-4f9d-a0b6-0625a6dae203@redhat.com>
Date: Mon, 4 Nov 2024 11:04:47 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 1/1] MAINTAINERS: replace bouncing maintainers
To: Lee Jones <lee@kernel.org>, konstantin@linuxfoundation.org,
 baocheng.su@siemens.com, tobias.schaffner@siemens.com, pavel@ucw.cz,
 ilpo.jarvinen@linux.intel.com, wim@linux-watchdog.org, linux@roeck-us.net,
 Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org,
 felix.moessbauer@siemens.com, christian.storm@siemens.com,
 quirin.gylstorff@siemens.com, chao.zeng@siemens.com
References: <20241028112359.3333152-1-benedikt.niedermayr@siemens.com>
 <20241028112359.3333152-2-benedikt.niedermayr@siemens.com>
 <173048213838.1966999.11456105703949125929.b4-ty@kernel.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <173048213838.1966999.11456105703949125929.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Lee,

On 1-Nov-24 6:28 PM, Lee Jones wrote:
> On Mon, 28 Oct 2024 12:23:59 +0100, Benedikt Niedermayr wrote:
>> Since complaints about bouncing maintainers raised [1] we have now a
>> replacement for maintainers that stepped away from their duties.
>>
>> [1] https://www.spinics.net/lists/platform-driver-x86/msg47105.html
>>
>>
> 
> Applied, thanks!
> 
> [1/1] MAINTAINERS: replace bouncing maintainers
>       commit: 64dd44a658065ab5595bbfe2cb4d8fd30c9e34a2

I'm not seeing this on either of:

https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git/log/?h=for-leds-next
https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next

?

Note I'm fine with you picking this up, I just want to make sure that
it does not fall through the cracks and drop it from my own patch queue
since it also touches pdx86 MAINTAINERS entries.

Regards,

Hans


