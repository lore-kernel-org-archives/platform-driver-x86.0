Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7A71401C
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Apr 2024 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133186; cv=none; b=gTPauP+4MGPjuZYdaN0q2aTU7LX/q6BPOnFj/xtyTUyQqWVIi9AE00ZJ/tLw5wccOn1uSaRo8qOlpKTKclV8MeENvUw5kMfOIAvJ/umMxP3VtfljFS+2pfSXVMHKH49jcxFT3qA6AjYoS8Qd/LoHMun07DlHk5KgBNmAkEgy7Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133186; c=relaxed/simple;
	bh=2Z+Ejko7FofGkIpI4wJ7ZPsjyB8mCnSvFfx+1YEfT4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B5BYxLkoRa45kAjc3Bs4jFi4Ixg8GGtX9G2LXBXJwugCsq/EzzoA846K5Ebg433Ymr2DKuYOz3sjy2EoXwLFf9SHsrfRnkDDMLifYTUxQ+bb6RScPP4KfRBPfdbCTS34xV7w+l0RK7BgXuXf2qpzMmo1ViOZOhlbd4fxhRVBW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DjkhvEZh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DjkhvEZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712133184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hBwVccZBg0Fl5p97DfphA9YXGRXtnSdOSqA1Wworgs=;
	b=DjkhvEZhGrkB5nVC4eboxXbfrk7ypn5nOcfrV/avO+aoR3dtges1V1zXe5+oJrqet3vPk6
	nbkt4GCl2dJqyxeMZqdPsjU1LY6UD54jWUO1gp90i8v21B8mStM24d/RNdKXsHVare1EJj
	+QSoG1hQtpr1XbQtLWfzuSIc0XB5zOg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-raY8NPgGMMmxmTdzqwqDpA-1; Wed, 03 Apr 2024 04:33:02 -0400
X-MC-Unique: raY8NPgGMMmxmTdzqwqDpA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a4747f29e19so191312166b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Apr 2024 01:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712133182; x=1712737982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hBwVccZBg0Fl5p97DfphA9YXGRXtnSdOSqA1Wworgs=;
        b=ETrNK2YT2bcEgu4e12npocUoID05EyjxrZkkX5KSeKZua0Glfv2BG2yu8VGan0dGje
         1iZaSexXaNGoHlW/tmA+xz0CcbgtIqtUtke8vMfR372Jpxvjj9ewlMPzjg6TK4baPKSQ
         XEyJwzODWRlYJ9PgKvrcg5MoBDB/8YfwKMohYhmoPJaSzfcAym0s4FtNs9nkKBEY87Tr
         LFniMz4iHQKNebGXyQX11JbOx7NPojilpCbp/JRqGLNQQeVRyAz8f6JQIuTB7gi7Gwck
         d5YAcNj4LrZJYYMb3NtyOM7bwrCVi4yO7dmmK2AHjXHgbeE7viiWO0bnzRPaiWCexUSD
         iAWQ==
X-Gm-Message-State: AOJu0YxaHybvM+Ss3/xsghjRnqTPGkkJ4o7jJnNcpynmH17+G/40hVk1
	mEGgYozlpXaasMwTvRv+uAVgAOCzjUprZ7c0mUUTkrkyNOKEMHUXt03IsiVW1bNqUw7XspmvcZX
	QONkGralGZForfD5kidYi4QZSR31fAq6h25jwLbvWt952IcWMWBl32bxa3oqC0N2qjVLaGbU=
X-Received: by 2002:a17:906:1157:b0:a4e:6414:5afd with SMTP id i23-20020a170906115700b00a4e64145afdmr5759439eja.52.1712133181936;
        Wed, 03 Apr 2024 01:33:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUYrX1YOrnmR10vdbq+ufbRk4BHlYYJBSP3DuH1BuQ6YlKfpjx3idfoB6rTEHjFrNn1Q5mmA==
X-Received: by 2002:a17:906:1157:b0:a4e:6414:5afd with SMTP id i23-20020a170906115700b00a4e64145afdmr5759429eja.52.1712133181648;
        Wed, 03 Apr 2024 01:33:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id jx24-20020a170906ca5800b00a47152e6d10sm7426027ejb.134.2024.04.03.01.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 01:33:01 -0700 (PDT)
Message-ID: <283b5056-29df-486f-8a4a-5271af8a5b8c@redhat.com>
Date: Wed, 3 Apr 2024 10:33:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: leds: add LED_FUNCTION_FNLOCK
To: Gergo Koteles <soyer@irl.hu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ike Panhc <ike.pan@canonical.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1712063200.git.soyer@irl.hu>
 <8ac95e85a53dc0b8cce1e27fc1cab6d19221543b.1712063200.git.soyer@irl.hu>
 <6b47886e-09ac-4cb9-ab53-ca64f5320005@linaro.org>
 <5864594aa47ecfeb23d5d05a3afc02393f84b44e.camel@irl.hu>
 <a19688d3-5402-41c0-b10a-131cefed5b91@linaro.org>
 <2710283677cf12ca6b826565ec39652f560a43d8.camel@irl.hu>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2710283677cf12ca6b826565ec39652f560a43d8.camel@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi George,

On 4/2/24 8:50 PM, Gergo Koteles wrote:
> Hi Krzysztof,
> 
> On Tue, 2024-04-02 at 20:08 +0200, Krzysztof Kozlowski wrote:
>> On 02/04/2024 16:36, Gergo Koteles wrote:
>>> Hi Krzysztof,
>>>
>>> On Tue, 2024-04-02 at 15:55 +0200, Krzysztof Kozlowski wrote:
>>>>
>>>> Do we really need to define all these possible LED functions? Please
>>>> link to DTS user for this.
>>>>
>>>
>>> I think for userspace it's easier to support an LED with a specified
>>> name than to use various sysfs attributes. LED devices are easy to find
>>> because they available are in the /sys/class/leds/ directory.
>>> So I think it's a good thing to define LED names somewhere.
>>
>> You did not add anything for user-space, but DT bindings. We do not keep
>> here anything for user-space.
>>
> 
> The LED_FUNCTION_KBD_BACKLIGHT confused me. Ok, this shouldn't be here,
> I will remove it from v2.

I don't believe that is necessary, see my direct reply to Krzysztof first
email about this. According to Documentation/leds/leds-class.rst
you did exactly the right thing.

Also thank you for your interesting contribution. I have only briefly
looked over your other 2 patches, but I like the concept.

I'll hopefully have time to do a full review coming Monday.

Regards,

Hans


