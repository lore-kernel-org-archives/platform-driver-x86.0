Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2957131E49
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Mar 2025 14:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741272768; cv=none; b=iYoWcnkK9877ux/1Ayb6jpu7t2enO8FMDA+voPTtR/325pdlINqWWixpwLhBaiHPItvUaAf8F5KYoMd7XPXa8DVmbx1C4tJHOQyEjo2e+98zFurqyYuKw/JBXsJ3VeBi+/xTlxuvXZGKskx7oKNTnWTJtMzIstGuJdaX/KXCnBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741272768; c=relaxed/simple;
	bh=XS3hwENjNCDtV8L+71dZC8w2YiHjzfzQ0f/usLadV+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TONoo1LmZF/rhGoLeagKydObo6iTAwQvWyRq+8um+V4C3fx5Gzm2Lb5gs1QEKDqwKRycA8cW4XdlMzZd8q1GmzaTbtglIbUA5/zEnALtxp9ayzF8JrQhEFpxoL4z2VZd7NAxNAQSxNaUwDiqMd8vN/JWIh9RicRCqvTeL2kVfUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AbqOhxLU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AbqOhxLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741272765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8l7qABKwHCDWfbWvQGzQtXX9iScy9t9j1udXksFnIA=;
	b=AbqOhxLUH2o+NYykAWIreoG4Ji6SpsuLzg4+IFgoyMEonf11Sq3LEWF1N7wMjEYfUD9jxJ
	B9jICR5MvNFAPW0roLT6ctWWYOs9IBLvusZOm6CB86zEqsup+GP6O/lKVFL4ftaUpxYT2a
	RB0T89ZpMIl8zmAtry76qkv8ypEvtXM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-m4gUf3tzPSOtPnt86zWs2A-1; Thu, 06 Mar 2025 09:52:39 -0500
X-MC-Unique: m4gUf3tzPSOtPnt86zWs2A-1
X-Mimecast-MFC-AGG-ID: m4gUf3tzPSOtPnt86zWs2A_1741272758
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e5c5ea184dso841365a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Mar 2025 06:52:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741272758; x=1741877558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l8l7qABKwHCDWfbWvQGzQtXX9iScy9t9j1udXksFnIA=;
        b=Hu9qOuaB8i9jIoxUyT0wfUleoIO6/Qevpz1pxq+i2r4qf4552r5RIYuAXp1np9gtzv
         58wZsbsmejS8EaF7lE73lKTarrHae8QrVF70b2P8PITRBgvENvie0+EPYp0oR0OT0Lj1
         pH3HDP17wmlHmfz/4zmi5811v2HfKxZFrWJji03dvHg6nbUJgXC1W2jVY/ZCw6waCuww
         InyGuRr69kD4gdi7uuaYdVKYblqTcwxKeMSlSDz64IG0Ty9NFfdQCanMz/bayMiAeKOw
         8w+OKxDWPhh5qLw9eLGkn7+JxkyhvxCSLEvjkIHKCKwvQPqOnm+oYzB23VmePNz7hJYu
         j7IA==
X-Gm-Message-State: AOJu0YwsyZ047I/dMw8n+t/osSe4PW8oH/fvHI2NOLsBROL39UdtKQVJ
	iQtEwSScPo4JfU/M9sdUXM3CxHjq7NQz6lpFFQQX0XuOLSDETPdHssHzal/JG/eD3rvkOWI0Hm6
	i9KVkRNUNWQIsQFfJoRJwfljY51DA3CgqeK+Qiho8M9freAavebvJGzA2rx/unSlgpuk+vNc=
X-Gm-Gg: ASbGnctYd04/SPeJIV9VqyaUHdO2iEinZTneKtYydPRVjmD3LAUj3c7YAXtY3Vv3nhu
	/biTsJzGy9KbM7TmlfXrbljH4WgytY3GxGR6B8/Jf+zH6Djx1i1KxPTmcj06UHJVU2JEwzYC++Y
	w0trQNbYofY7lpVyovTO3aG0YtiCqa+5aqdqE0kBd3H0OLBy1QXgB0OltNdWMA1F0iTaF/V5POH
	UdYBtYyRLaLSRYNFvphS/SavcH1Kelrzyu6edbImZusNJ/gNOzYT4d8G8evRx6Spin1GcvQqrkX
	uXdn0mTvZw5DozTp69ZqdhSXB0lNp5dRjwRFQ9Z+qMAKVnfISfIJamH9BRVy4hWdAtNkEycMZet
	JNBTlplpkwTKg+iIHLqV/2TD+kXvMBNYdLAi8IP4GU85zBkfkckYdrjOCjKzqNc0gvA==
X-Received: by 2002:a17:907:3e21:b0:abf:6a53:2ce0 with SMTP id a640c23a62f3a-ac20d8bc92dmr662636966b.14.1741272758055;
        Thu, 06 Mar 2025 06:52:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTtG9PqamppLgHCSkLHkN2yXFS67KMnQIn5wc46xN5pe/wvFgmTNUvin6PAc6j/i10zXOkTw==
X-Received: by 2002:a17:907:3e21:b0:abf:6a53:2ce0 with SMTP id a640c23a62f3a-ac20d8bc92dmr662633666b.14.1741272757677;
        Thu, 06 Mar 2025 06:52:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23988830csm106500166b.131.2025.03.06.06.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:52:37 -0800 (PST)
Message-ID: <e6dc530d-b7dd-43f6-8dcd-f9188000d279@redhat.com>
Date: Thu, 6 Mar 2025 15:52:36 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: amd: Add ISP platform info
To: Mario Limonciello <mario.limonciello@amd.com>,
 "Nirujogi, Pratap" <pnirujog@amd.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, dominic.antony@amd.com
References: <20250228170238.3484860-1-pratap.nirujogi@amd.com>
 <cd25d131-bead-4a38-98dc-1011c2843286@redhat.com>
 <3d57b624-7753-4a4d-9051-0a55cbdff1ec@amd.com>
 <9b8c9eb7-c8d5-4c12-9ce5-c4b4df3b4223@redhat.com>
 <5909d7b0-8cb2-4aa9-b717-9b85a1b2a96e@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5909d7b0-8cb2-4aa9-b717-9b85a1b2a96e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mario,

On 5-Mar-25 4:42 PM, Mario Limonciello wrote:
> On 3/5/2025 09:26, Hans de Goede wrote:

<snip>

>> Thanks.
>>
>> So looking at this there are ACPI devices for the sensors, which
>> unfortunately lack a _CRS with an I2CSerialBusV2 resource pointing
>> to the ISP childdevice as bus-controller. So that i2c-client
>> instantiating would be instant.
>>
>> +Cc Mario
>>
>> Mario any chance that for the next (or the next-next) generation of
>> AMD devices we can get the ACPI tables fixed to properly describe
>> the sensors as having an I2cSerialBusV2 resource, just like how e.g.
>> I2C touchpads / touchscreens have this ?  I suspect this will benefit
>> Windows too. Likewise any enable GPIOs for the sensor really also
>> should be proper ACPi Gpio resources in the ACPI device describing
>> the sensor.
> 
> Due to the architecture of how the ISP is accessed "through" the GPU, I'm not sure it's viable and furthermore if it actually changes anything for Windows.  But the ISP team and BIOS team can certainly discuss it for future designs.

There could be an ACPI child device under the ACPI device / fwnode
for the GPU which models the ISP, this could have its own _HID
to allow the ISP driver to find it. If the I2C adapter part of
the ISP driver then sets the fwnode of the adapter to that child
fwnode, it can be used as the I2C controller reference in
I2cSerialBusV2 resources for the sensors.

This is how I2C devices generally are handled / enumerated under
ACPI and I don't really see why future AMD designs could not
follow how this is all supposed to work under ACPI instead of
having drivers need to manually instantiate the i2c-client.

This also allows putting things like the sensor i2c-address
(and GPIOs) in ACPI instead of having to hardcode this all in
the drivers.

And as mentioned before I think this would benefit the windows
drivers too, for similar reasons (not needing to hardcode
things like i2c-address and GPIOs which really belongs in
the ACPI tables).

Regards,

Hans


