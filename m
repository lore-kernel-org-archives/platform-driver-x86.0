Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB3C20C497
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Apr 2025 10:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744887399; cv=none; b=O3Cw9fHJfrNCStfS/CpvTf9TsVu7hK8kEYw09dLGdazGkLFnsGCLV3MdYor5caLvwedW6/6HgQvl3ffgDJeCjG9ohL3YryqadKh1e/RE6LaYVxmHvjXIUlUQfKJ2m1ohMMAqadbQ05SVkD7m6N0ll3WnIFivIe9mSaFov6t7fMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744887399; c=relaxed/simple;
	bh=OCmUAMA/YPG4/piPLikliDWqIc+OBinUCTsW1Z00VPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBQ9ADWja5nUYCDR8MZagEPy7QuYWJag9XEI+zjdboQuET6uVF1ClFKWzDlqr+satfB+px9HaVsA1aXpZhZO6XXUIKOB7ET/R5EoqcGFb2yjEefDoN+6T7jb4cBc5E7sDshYhoHEQIAvDfcseh1uOkWmxfGz+hQmjDJG/E5G1xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XK/9L/jf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XK/9L/jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744887396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OL4LXzPm34hXOvIhRoRU6GuEFCM/KQvC81H1MT67IUk=;
	b=XK/9L/jfi8aBu2M2S8va97XSCbtpjfUfaSgE39yzP2eukwk+d9XEe9EVZ/OqHOvitxylmp
	fPgEFKCg7oQI02p2+M4ZGx5EnVgAu9yptURyFc8Ewyh1P8JPsLGJdg7jtwDcGkKPXgqxbm
	CPvAKAvDHZbMD0Ml+vfVuz0XDtdzA8s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-22iJpUgsPaWi4WHZnKdmkA-1; Thu, 17 Apr 2025 06:56:35 -0400
X-MC-Unique: 22iJpUgsPaWi4WHZnKdmkA-1
X-Mimecast-MFC-AGG-ID: 22iJpUgsPaWi4WHZnKdmkA_1744887395
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acb67aad0e2so21062366b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Apr 2025 03:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744887394; x=1745492194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OL4LXzPm34hXOvIhRoRU6GuEFCM/KQvC81H1MT67IUk=;
        b=Um03A3gFgzHDL8/00XUZzk08GQSDzbXARKHxfdamrK1aXMUU1Ouzm98xpSKJHOnLsH
         leP9GJcDpCgRiE14I/WrkExFERgjDAD4HZwn1Qsd1H4wYHB/sxMO4znesZM1aSYjYQ+3
         /6tt6H7XsKWlKQ3ypgA5YGhWA/Qqk3lw3/fzy50zvYAPwnhla3E+PCo4Z0lPXPVsHa2v
         oIRxV51j7kUvNaFRbcYCGdmwZ2Ey3N158ayxKONEec7xrQ50jlHAih9e1Z0mghnVjX0E
         q+0oc4OgdzQDmkNZ0577Gio+mf3M35zz1LjExwTsmj3NYKyvGg51m8q/VNKfw25KoSS0
         WSdg==
X-Forwarded-Encrypted: i=1; AJvYcCW7lGt9SB/hEBy6Ly19ybPFfMFAQivkEyszw2Kt1RNkMpRtgkOLG4m3Hz3gqtAEma/kN4m05AWlZqIRvpdBAmcp0skx@vger.kernel.org
X-Gm-Message-State: AOJu0YzdbAXXY/gD3UrBlVoNhLrtVFboDq/f35sUniQKKUBfdNquJPKe
	X7sWQ1vYKlEpj+fbdXVKLVgaAd0VYDl1jVsu8LewoyWSuDc8Jf66ipcG6nzc38/OOw0FrgBgpTi
	gBSp7bM47qrbOJ1vwz9YUU/p7hPYP9K2zGPc7u0N1fGOQHkrJE3w2jnzrxwHUrRcy0woseT4=
X-Gm-Gg: ASbGncsEJm6rRAnHtwHiWMDxvSRLncBHTflG4CHzJjl/tnI+y4C2v6ihsD4MMv631t3
	BdXIl7szDDLOCLjsU5Ow43+E//tPEfuc1nVp4tLSn78nlxOAuSZHE6vnTqp7BXenO5C8xkHMqmO
	F2YBK//9yNEY/wicfSYr+Kqsnz5AWRZcNbX6PdgscxfLLr1dGJtHQ5g9B/ZGVde5MGWLlg0ax0E
	+2Fw06MUdJ/azVcW9ehaKbdeZl8DXWh0UMATbmD+odiLHLrwro4KPIkbL0obZl6hZBGsx0hjoZ4
	UMTZwJnZehN9SP6VaUybRqq7jk3bTPEshuqRTIEcX9xcxDCG2JkfV2NohIHl2lCtWEswgbxgZFC
	+SX3Ic5LXWV5bNdFDq9/TFgAx/BgzFab+sQfJEuTLlXh7EVtg+a2UGbCucKtBow==
X-Received: by 2002:a17:906:c14a:b0:abf:48df:bf07 with SMTP id a640c23a62f3a-acb5a0f3217mr166983066b.15.1744887394559;
        Thu, 17 Apr 2025 03:56:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmXTLIs/C0jJL0/J6bYVdeeI9w2VhQAAKyxIIwhTpF7usa+7Gx9STkCC5W2ZRIwAo0FesEkQ==
X-Received: by 2002:a17:906:c14a:b0:abf:48df:bf07 with SMTP id a640c23a62f3a-acb5a0f3217mr166981566b.15.1744887394189;
        Thu, 17 Apr 2025 03:56:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d1ab3ecsm271784266b.131.2025.04.17.03.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 03:56:33 -0700 (PDT)
Message-ID: <b019b2c4-0c2e-4ba2-bfa3-83fab7fd415f@redhat.com>
Date: Thu, 17 Apr 2025 12:56:32 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] platform/x86: int3472: Add handshake pin support
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dan Scally <djrscally@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250416124037.90508-1-hdegoede@redhat.com>
 <20250416124037.90508-9-hdegoede@redhat.com>
 <Z__z_G21Ro2jGDkP@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z__z_G21Ro2jGDkP@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 16-Apr-25 8:16 PM, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 02:40:36PM +0200, Hans de Goede wrote:
>> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
>> pin defined in the INT3472 sensor companion device which describes
>> the sensor's GPIOs.
>>
>> This pin is primarily used on designs with a Lattice FPGA chip which is
>> capable of running the sensor independently of the main CPU for features
>> like presence detection. This pin needs to be driven high to make the FPGA
>> run the power-on sequence of the sensor. After driving the pin high,
>> the FPGA "firmware" needs 25ms to complete the power-on sequence.
>>
>> Add support for this modelling the handshake pin as a GPIO driven "dvdd"
>> regulator with a 25 ms enable time. This model was chosen because:
>>
>> 1. Sensor chips don't have a handshake pin, so we need to abstract this
>>    in some way which does not require modification to the sensor drivers,
>>    sensor drivers using the bulk-regulator API to get avdd + vddio + dvdd
>>    is normal. So this will work to get the right value set to the handshake
>>    pin without requiring sensor driver modifications.
>>
>> 2. Sensors typically wait only a small time for the sensor to power-on
>>    after de-asserting reset. Not the 25ms the Lattice chip requires.
>>    Using the regulator framework's enable_time allows hiding the need for
>>    this delay from the sensor drivers.
> 
> ...
> 
>>  			if (ret)
>>  				err_msg = "Failed to map regulator to sensor\n";
>>  
>> +			break;
> 
>> +			if (ret)
>> +				err_msg = "Failed to map regulator to sensor\n";
>> +
>>  			break;
> 
> As discussed this might be changed to have the same format string with supplied
> name as a parameter.

That does not work well, since this just stores a string to pass to
dev_err_probe() later.

So instead I've just gone with 2 unique errors for v4.

> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thank you.

Regards,

Hans



