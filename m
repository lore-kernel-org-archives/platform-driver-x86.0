Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C475F152171
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715606742; cv=none; b=VkA2iTnb67aWgrBcFG3YdHaWW6tGc4T6wB+tr5bwqMqjlVhpzRxPH+wu2NmMjY/8Z+HgM3fX5/U+6PzKHueIomHgRnujRSK3dQ/X5vUOFXSIEaVAgEg9DY5K55CcijJZe7f8ni+DP5EC0MZLjVDj+H8sjXB6/JWq4GhVdX0G904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715606742; c=relaxed/simple;
	bh=o5jeY7TWXbKIjhzaxzaX3C22KskmH0pq5FKShck2Y9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A24h1T9OM1ykVbOxHkRyBmtb9+Kp13l4k9DcBpk+lQF2hQJ0yz31em46bBPAjtIb7SVQ5GVvtl8hRL86Niifs6kpTVY1+3/yPpEKB1mhtIN+lwjCaFdjMsgwKm1kkLfTU+EyDKQpQeH3YQTsVyXhS6n7pTkPil4YAPgmrCeu39w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WzfJ3eQm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WzfJ3eQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715606739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+z/zqNSBsixXdq93l4WfxvlXFkuBQNfu7LOtzrV9yzA=;
	b=WzfJ3eQmgndr+/+JMOlaRSdkkPz+9uuUHLW70GAft1JOMpLbG4XGqiPDSFHtbY5JSCAP7H
	/+b3u1HMgo/eky7uycQd4j9rjYYt1D3IBQp4gGD4u0/g3CyO+6WHQofRkoNUzLwxVHR73G
	3akFkuMiv9K5OkQQJW9DFqyGRr79sJA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-sxJEoJ8BPOu2cpN5SOOpEg-1; Mon, 13 May 2024 09:25:38 -0400
X-MC-Unique: sxJEoJ8BPOu2cpN5SOOpEg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a5a1b50d45cso262739666b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 06:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715606736; x=1716211536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+z/zqNSBsixXdq93l4WfxvlXFkuBQNfu7LOtzrV9yzA=;
        b=Tv/rSVhrfqF0UNKwz8L6GVFRa8ifDU3g5qhTX+x/A5qXAxwia/1aYhFdpHUUk6nbOe
         lEq58iri4VpgTWv5O2bIZzvfg0D31bWYPr+tHUqYbglCOaTLZHsAbsUttfL8EXm0bLqY
         BQE2ia05qSR4SING2gsoz6iDK7aY/WTDpsZx6tN5O3z6Qb+lKyknkirs7gaPJgvxTITY
         1yydbFGZjQ+KWox27OV6xbmcb0Gjn/x+vZf5yv/I4Zi6TnaU45lXOtFilamuc+IvvEBd
         pgV+NmGUKpHXBuhVZ/929BLfNIICUtDVOPNAaFmdm9Bn6XOLytm3COIBfi9vcwpltDK0
         Bp0w==
X-Forwarded-Encrypted: i=1; AJvYcCXe10pJ2Dt5rmDK8lFLexDO6MeSpY5SaulPhDJH4lwvV3lljO3hXYzzU/ezmMrYHpUwQRcrqS6hTkSjVvTM6zGs+ty6Tug2SiRAOenj/Wt+vMRBXw==
X-Gm-Message-State: AOJu0YwVDBNAdq7DCANMhCaaQ+7RGuVZ6tu0zQPhvbnEdsXnsIbuteNC
	lpgKOJSr4Pk1503lO4zRmqfS/hjW9vzmGWGUoKKMOwMzN1pllJ1KCCX/x3odT3OEJFoL47hxZqI
	p4K8UPuD5qoCsyTR5q9gfCrS5kwaYc2ACj8ao7HlAQ7a4CG4tC6jRWcNeDD8kxzIAwqVarTE=
X-Received: by 2002:a17:907:7e92:b0:a5a:6686:ff9 with SMTP id a640c23a62f3a-a5a66861068mr205326266b.77.1715606735992;
        Mon, 13 May 2024 06:25:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHknakAqOb8OB5lTkb2LmXwPUtuLcwoBAsZ1KqqIyITAk+Z1uR/DOI8PtcANGaFDHS1qPVj+A==
X-Received: by 2002:a17:907:7e92:b0:a5a:6686:ff9 with SMTP id a640c23a62f3a-a5a66861068mr205323866b.77.1715606735545;
        Mon, 13 May 2024 06:25:35 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7f3dsm593217366b.123.2024.05.13.06.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 06:25:35 -0700 (PDT)
Message-ID: <30821935-7431-4f87-86ed-bd87cbf9a36e@redhat.com>
Date: Mon, 13 May 2024 15:25:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tools arch x86: Add dell-uart-backlight-emulator
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 AceLan Kao <acelan.kao@canonical.com>,
 Roman Bogoyev <roman@computercheck.com.au>,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org
References: <20240513111552.44880-1-hdegoede@redhat.com>
 <20240513111552.44880-3-hdegoede@redhat.com>
 <ZkILom0Ee5ei9xF-@smile.fi.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZkILom0Ee5ei9xF-@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/13/24 2:46 PM, Andy Shevchenko wrote:
> On Mon, May 13, 2024 at 01:15:51PM +0200, Hans de Goede wrote:
>> Dell All In One (AIO) models released after 2017 use a backlight controller
>> board connected to an UART.
>>
>> Add a small emulator to allow development and testing of
>> the drivers/platform/x86/dell/dell-uart-backlight.c driver for
>> this board, without requiring access to an actual Dell All In One.
> 
> ...
> 
>> +	if (argc != 2) {
>> +		fprintf(stderr, "Invalid or missing arguments\n");
>> +		fprintf(stderr, "Usage: %s <serial-port>\n", argv[0]);
>> +		return 1;
>> +	}
>> +
>> +	serial_fd = open(argv[1], O_RDWR | O_NOCTTY);
>> +	if (serial_fd == -1) {
>> +		fprintf(stderr, "Error opening %s: %s\n", argv[1], strerror(errno));
>> +		return 1;
> 
> So, looking at the `man error` it works like your custom approach with an
> additional things.

But that is a GNU / glibc extension. I would prefer to stick with plain libc
here, so that this can be build with other libc-s too. 
> Also, don't you want to use either different error codes (above is +1 and all
> below seems using -1), or be consistent and return -1 always?

the +1 code is for when the cmdline argument is likely wrong , -1 / 255 is
for IO errors.

> 
>> +	}
> 
> ...
> 
>> +		/* Respond with <total-len> <cmd> <data...> <csum> */
>> +		response[0] = len + 3; /* response length in bytes */
>> +		response[1] = buf[1];  /* ack cmd */
>> +		csum = dell_uart_checksum(response, len + 2);
>> +		response[len + 2] = csum;
> 
>> +		ret = write(serial_fd, response, len + 3);
> 
> response[0] can be reused here.
> 
>> +		if (ret != (len + 3))
> 
> And here.

Ack will fix.

Regards,

Hans


> 
>> +			fprintf(stderr, "Error writing %d bytes: %d\n",
>> +				len + 3, ret);
>> +	}
> 

