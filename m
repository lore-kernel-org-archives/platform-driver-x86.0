Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KY/vTYWd"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245D5C7
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 03:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702295121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gLZ4KUgEvLDnwKAg4roHGuAnVoOR9CuyCDnJ+KhaDh4=;
	b=KY/vTYWdQbR9yndTl3iWurH15cK4vGBVQTs/ym4dUU205nVPwvDYCyt7LgiMXWgU3PWnqv
	TMPH+0R6c0dBWMgor3ducvltwZdKDJ9D8iULdEMFDiSMjQ7+InSJHIcgEJG3GM5hM/2YQW
	X++9kQr+8twmXjoCPZ8GPNqHIUaG5Iw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-Dt1qbC8MNTGYoBmDYEdoEQ-1; Mon, 11 Dec 2023 06:45:20 -0500
X-MC-Unique: Dt1qbC8MNTGYoBmDYEdoEQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-54caf6220c2so2721871a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 03:45:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702295119; x=1702899919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gLZ4KUgEvLDnwKAg4roHGuAnVoOR9CuyCDnJ+KhaDh4=;
        b=Pf5yEwcWu0jdvWW+Fy6uwqHrqkHIM0SxEy7RsqX43woO+HCh1d227KNvKGaRnp5Ipb
         eaYk4jBmNeIPcF5NIvq3moZ92q0r1innXHyQxiXnYYTTyD00/KZKufNcipScQ8cx06fL
         q5YejYz7BY/BRYvLHYiZNJ317sx8E8eV7Ojv5HQUBf0BL1S9kPuUHiDNRgomx8cXWP4E
         ayvCtcjakt/yMCQpqOncRBrRuMJr/JkJ8rRYgEXbCNtmF6rp6HD663nuU4MnBh4iEFJq
         4HQDdodgZiK1VXVNXXWVQJypzjnr1ASRsoO9ppPeG7om8K4R/8JCZpDMwB6bcl15kZFG
         Ifbw==
X-Gm-Message-State: AOJu0YxICaNTR7RBFaZYsTfIimTPHrDenA9tmX2rAOuYGOPI4mTiWuuI
	1FjK0gz7o5YjhBK711gxnWPKVVyWNeGv+/pCHzlxrYKB4H9LYxVSFxGTPJecD+mlG9JRCrFAXyo
	c6mD/jnOOYUoE3ZCPkqpic2AQCEJJM+OTnw==
X-Received: by 2002:a50:9e6b:0:b0:54b:1ca8:851e with SMTP id z98-20020a509e6b000000b0054b1ca8851emr2745806ede.2.1702295119014;
        Mon, 11 Dec 2023 03:45:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOml1mAb2dOWnv2X7f45Je/I6NHQxu5c6wiCmMQ960C9uZmb7dhmZ+BKjrrHrKBB/58iMdXA==
X-Received: by 2002:a50:9e6b:0:b0:54b:1ca8:851e with SMTP id z98-20020a509e6b000000b0054b1ca8851emr2745797ede.2.1702295118690;
        Mon, 11 Dec 2023 03:45:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 28-20020a508e5c000000b0054b686e5b3bsm3675915edx.68.2023.12.11.03.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 03:45:17 -0800 (PST)
Message-ID: <56f065d0-4cb5-43bb-b8d1-0ed275c54044@redhat.com>
Date: Mon, 11 Dec 2023 12:45:17 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] mmutable branch between pdx86 amd wbrf branch and wifi
 / amdgpu due for the v6.8 merge window
Content-Language: en-US, nl
To: Johannes Berg <johannes@sipsolutions.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <6395b87b-7cb6-4412-b6e5-e6075353fb6d@redhat.com>
 <5e14be1fc61d9d7027cd50f4148eea52e40fb9d3.camel@sipsolutions.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5e14be1fc61d9d7027cd50f4148eea52e40fb9d3.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Johannes,

On 12/11/23 12:41, Johannes Berg wrote:
> Hi,
> 
>> Here is a pull-request for the platform-drivers-x86 parts of:
>>
>> https://lore.kernel.org/platform-driver-x86/20231211100630.2170152-1-Jun.Ma2@amd.com/
>>
>> From my pov the pdx86 bits are ready and the platform-drivers-x86-amd-wbrf-v6.8-1 tag can be merged by you to merge the wifi-subsys resp. the amdgpu driver changes on top.
>>
>> This only adds kernel internal API, so if in the future the API needs work that can be done.
> 
> I've been fine with the wifi bits since around v3 of the patchset ;-)
> 
> So the idea is that I'll pull this into wireless-next and then apply the
> two wireless patches on top, right?

Right.

> AFAICT, since the other patches don't depend on wireless for
> compilation, this is the only thing I need to do, i.e. no need to have
> another separate branch to send it further on, right?

Right / correct.

Regards,

Hans




