Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61F78F6C
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 13:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734786144; cv=none; b=PmcY+tyogVnkzeqij0ySjF3HdDqgW4liGDmNw/ENXvqsBV7KqPK1wH5plufjRAAJhf+YgAE6NS+gv5Vu2Zgl9C/IbSgJJTugIeRsb5tLQoojQL86Q16r9U46rGK1jE+ro+fCsjB5yKlWJiOQuQO88l+vL9vDx2iwxFfJb4EWBWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734786144; c=relaxed/simple;
	bh=SYd+XNUXTe7yQopaebA0xB/8gUiP/vhBeLZQBDOoJ9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UEkh1CHhJvNyedtIJXxQSybojJIY/Ii6HfcxOmSY5z4nmKr2htVCe6Gfm+pnYR24uO2/o8MIoflpnX+HfTnjtVsNDINnt/snJosavpBZxUMBDrl4qBtg3F7mwM+j/wlxDOeQ6IPdWSmjykxysVjQYUQa6OuE2s3Eaf1wp8Nbz18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UemwFkb5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UemwFkb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734786141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ODmUub3mfJwhKv3i88+Y0tokaQGix6bo9RZrqqNY5p4=;
	b=UemwFkb5sR/cEFePPNG6j/JL7XWtQv62Q3qt6P/OV/pacaRTAjVEEKF0/nkrtTkT/s5WgG
	VnfiNDH3oy7i5fKpq7WY+alz1eClqtduXQkfAHIENrOD88FHA+NmAMnQ6dK3Qy6SYP9WnR
	F/7E7VqcofGcfnBqkyJdKxJUXpVBYuo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-fbBRhUTbO4GGOQ378Vb90g-1; Sat, 21 Dec 2024 08:02:20 -0500
X-MC-Unique: fbBRhUTbO4GGOQ378Vb90g-1
X-Mimecast-MFC-AGG-ID: fbBRhUTbO4GGOQ378Vb90g
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d3eae7a9b8so2546676a12.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Dec 2024 05:02:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734786139; x=1735390939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODmUub3mfJwhKv3i88+Y0tokaQGix6bo9RZrqqNY5p4=;
        b=XMpHFYyZyGLG0VSlPt9y0rbaIUzgQpDSiubl4dWb1WdqvUpzl44B0c1Vzm9IkTDBn4
         odDb5gUFfiun7LvPCoupRhbjbRNAWffbW4f/RYpMlGZ7aw9FQlkLvxHwMiHD/R3AfmWl
         9bIXUtL59JiEqKCxTG8fVoaUFgA4duTDYxA+fz8O1KmTamTgIxiQgWfdmkOxyVfBXaDH
         ffWYZ8ekUCr5EJ9BlM6FLkVKXbW49oZo2X9xCVoFpQE9/Pq20FpQd4AblryXw8Tfa566
         RJq7jtoKJ4gVroZ8ElY0mbcDC85CKmI7WW8uIkdngLXrE9Ql+FFy1dS6Hj31LQFqtVMQ
         atmg==
X-Forwarded-Encrypted: i=1; AJvYcCVw1At1CSE+po4LHZQ02mIFq6x2eWnEYcmHSaJvaom9fYtz55TwDWGupqJGoaaeWKDSMO5mXtc2eCfZwSkhQK1PyYLI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+CwNQGSZQ7JT5EtTfZ3V5/4HFoHafdiEgPFk9rMSkmJe9USa4
	wcrYuD10QRHBAsE559Z4Az3xY6S9REHhfht6zfPCV/9A0pjc9JzaWgj7Ipz7nsLgkQDPt//pASc
	wVNlGmFSy9mQyRSepOX4KjZAd69yl/hjhfntckzkijcbTGuFMp30EPrBFMjmuN5WmhsHNIQU=
X-Gm-Gg: ASbGncurt0QIfcuJ8O9f0FvRot+08c9k0IjJDyMcgFHHC+VmQa5ZnUDE2UvyJh1KO24
	h1fWRnqBkEsjmUFvPZXcpjSUEb+4+gRG92PTToy8AlDNh6jDbQ5UzqIr10wp+k/oaqsKkH/nOtO
	goPMR6wjX+tv+FYisGfozKZii3OcV2ytt/3gK40tchngNhE6LEg/D8QGqYVUVYGeM5qMBcY9jR8
	dEu62vTeQ36ahUSD/27XKD56UiZd7WGfSt0kxkpm0OqCnf33rtJtD9B8Pi3/5pkLMweis/SUty8
	TeioIT1+obm1Yyl/uJwJKSZgz3zS322LeUM2dp56lYR64xHH6giFZGrjb/+tXMN3bzgHt0DV/xI
	9aRl1Y3aQrcU8Tm7kX6svexyknMUgNE4=
X-Received: by 2002:a05:6402:354c:b0:5d4:35c7:cd7c with SMTP id 4fb4d7f45d1cf-5d81ddfd836mr4692624a12.26.1734786139058;
        Sat, 21 Dec 2024 05:02:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgkaacKY1aXbt9NjWxu37CbGf6BZuj+XbF6PgxL1EAEy39FTRfluaPa0xNYlhNQz0+hM/KEQ==
X-Received: by 2002:a05:6402:354c:b0:5d4:35c7:cd7c with SMTP id 4fb4d7f45d1cf-5d81ddfd836mr4692607a12.26.1734786138672;
        Sat, 21 Dec 2024 05:02:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80678c6dfsm2774457a12.37.2024.12.21.05.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 05:02:17 -0800 (PST)
Message-ID: <233a3a9d-3b07-4451-935e-107bffd873f6@redhat.com>
Date: Sat, 21 Dec 2024 14:02:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] platform/x86: dell-laptop: Use
 power_supply_charge_types_show/_parse() helpers
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Jelle van der Waa <jelle@vdwaa.nl>, platform-driver-x86@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20241211174451.355421-1-hdegoede@redhat.com>
 <20241211174451.355421-5-hdegoede@redhat.com>
 <0030c3dd-c70c-d21b-de2b-ace0aeb4030d@linux.intel.com>
 <6760c9d3-ccf4-47de-bfe5-b59b8b9fca07@redhat.com>
 <c59ed113-6a43-4807-a006-ceb5a807fb90@t-8ch.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c59ed113-6a43-4807-a006-ceb5a807fb90@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 17-Dec-24 7:49 PM, Thomas Weißschuh wrote:
> Hi Hans,
> 
> On 2024-12-17 16:18:47+0100, Hans de Goede wrote:
>> On 17-Dec-24 1:01 PM, Ilpo Järvinen wrote:
>>> On Wed, 11 Dec 2024, Hans de Goede wrote:
>>>
>>>> Make battery_modes a map between tokens and enum power_supply_charge_type
>>>> values instead of between tokens and strings and use the new
>>>> power_supply_charge_types_show/_parse() helpers for show()/store()
>>>> to ensure that things are handled in the same way as in other drivers.
>>>>
>>>> This also changes battery_supported_modes to be a bitmap of charge-types
>>>> (enum power_supply_charge_type values) rather then a bitmap of indices
>>>> into battery_modes[].
>>>>
>>>> Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> [..]
> 
>> Note that merging this requires the earlier patches from this
>> series which have been merged into:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git/log/?h=for-next
>>
>> so this either requires an immutable tag from Sebastian for you to merge,
>> or this should be merged through Sebastian's tree.
> 
> If this goes in via the psy tree, you could already make it a power
> supply extension. The necessary code is in psy/for-next.

Yes I noticed that the power-supply extension support was just merged,
that is great. Thank you for your work on that!

> Not necessary obviously.

Right I'm afraid I don't have time to work on converting this to
a power-supply extension atm, so lets go with this incremental
improvement for now.

Regards,

Hans

p.s.

IK do have hw to test this on, so if someone else were to do a conversion
to the new power-supply extension model I would be happy to test.


