Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A231E536
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 20:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708115548; cv=none; b=C1poh0tmj+BbLmmbj+3CkSafjk/WFe1ZiesA+kEJShkcGQjynWsrLB/Y3NgaWR2p27ZQANp6r/ie1vkR+ehi7l5i5uGQU5pW8+g7nZB5OoCQCD2R3nXlZU1H/VBv8JBarHObSSfI3k7ZNgfTudF+IQWAWZCyE9HeKiBchUUzciI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708115548; c=relaxed/simple;
	bh=dddPI3snJRmYhNfwfhq9lgn3t/f08lhMubHACAMlcV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIsZkLgSFpJ8+ZyJaAM4fZ7muI6cTMCWQAIXQdVxsUiyG/5WwPtwXCpbu+jvDxFMr7oTNpm5yg9vJrYjIIHy8DOPaMiFa+5oub0nwjFc3/3c+Hqox72fXX93Bn4l4h1gjmx6ORolx3kOBukczL1l/lj2WKUPNWmuhTi/ik0eZ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JfjbAqrP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JfjbAqrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708115546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jY4J3Lfgz0NGH/pIBhx/xecDYBl4HnKUurHesWlBJ7g=;
	b=JfjbAqrPI+mfEnnSaEUyLsLMQZ087CYFbE0bzi107lanO8fUFxiTQTGkHAg/i/Av9qTgsO
	KewCHOdrW1d//1wpzDvKv7P24B8cCkwHxKHd8FHCzQP5FAaFdoNUbiWlw+TMRPLfTvU0gu
	xs8JLlO924SbTpYkJ97cP62rNm8dtOM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-JniIC3i0M6yFSkjI3UesfQ-1; Fri, 16 Feb 2024 15:32:23 -0500
X-MC-Unique: JniIC3i0M6yFSkjI3UesfQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-558aafe9bf2so1059725a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 12:32:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708115542; x=1708720342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jY4J3Lfgz0NGH/pIBhx/xecDYBl4HnKUurHesWlBJ7g=;
        b=DfGhqE+DaVrqxTQTTRQEJLIPoiFMJdwGqTAS56NZ6WT007pO9xJzMoKqiCiOoHYG9Y
         d9LOWgcipNJiI1VC/uDlfMu1WV+Hvz76r7YDBR4OQ3o7YRUE7pbhYrCvI5Dbd2rt3+tF
         ntZaTtHFQK4NE9OHoFwN0fGFbcYoCxloLhIfECCmmXBFHfA72mXbAWKES1F9TlMVpmFl
         8LVIq+39JdSwhTHkbCwgxeLuLudSkQivJv5zsSxfxPrTA5clMs4ytN8r/PrC3/OHcKoS
         K2byAE4pIx25T9QrqS9nRf7ZXPAaRWKVRnEGJENcoHSak0mO2ZOUgtwPjLdYgPYTi8QA
         DCTQ==
X-Gm-Message-State: AOJu0Yz9pSFgiY1L0xIK5/SX2wQdr/p7GEhkVpaDwvqrthXbOM+frndV
	MxaaVKMztCyrcso5ONE8TZ3dRUbdPghcpp6w0fYX0Z35t0Be7f8rIEeAQ2bCzvZ4ZbZCLfl0QtK
	jQsjYAVXVEU9vfNF7wUhMlZth48k0GnER/5TTeQ0TkxxmkR1bPM0sIpPeclyi7/98Z+urhdtVwE
	vpXL4=
X-Received: by 2002:a17:906:645:b0:a3d:9ed3:dd1f with SMTP id t5-20020a170906064500b00a3d9ed3dd1fmr3905532ejb.18.1708115542198;
        Fri, 16 Feb 2024 12:32:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZJ4K3qMpzKErymZxH252Ql/Ddb1yZrrrR+17l4udQc78n5g4paNUBd7CV+8AdSFIeF6lM5A==
X-Received: by 2002:a17:906:645:b0:a3d:9ed3:dd1f with SMTP id t5-20020a170906064500b00a3d9ed3dd1fmr3905523ejb.18.1708115541898;
        Fri, 16 Feb 2024 12:32:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b13-20020a1709062b4d00b00a3bd8a34b1bsm310559ejg.164.2024.02.16.12.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 12:32:21 -0800 (PST)
Message-ID: <52430547-2ff8-4542-8669-7f1bab4a3da2@redhat.com>
Date: Fri, 16 Feb 2024 21:32:20 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: platform/x86: intel-vbtn: 14c200b7ca46 breaks suspend on Thinkpad
 X1 Tablet Gen2
Content-Language: en-US, nl
To: Alexander Kobel <a-kobel@a-kobel.de>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <295984ce-bd4b-49bd-adc5-ffe7c898d7f0@a-kobel.de>
 <1b1f482d-6951-4b66-b510-7419f719114c@redhat.com>
 <eb9eec8d-d302-4ab2-a0d7-2df06c9eef52@a-kobel.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <eb9eec8d-d302-4ab2-a0d7-2df06c9eef52@a-kobel.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alexander,

On 2/14/24 13:01, Alexander Kobel wrote:
> Hi Hans,
> 
> On 14/02/2024 11.54, Hans de Goede wrote:

<snip>

>> So the idea behind the patch causing your regression was
>> that maybe on some hw we need to call "VBDL" which enables
>> event reporting after every event to fix event reporting
>> sometimes stopping by re-enabling event reporting after
>> every event. This assumes that calling "VBDL" more then
>> once does not have any side effects, where in your case
>> it clearly seems to have several undesirable side-effects.
>>
>> So again the fix probably is to simply just drop the
>> newly added "VBDL" call.
> 
> Thanks for taking the time for an explanation.  Sounds like *not* needing the VBDL call should be default, and that rather the devices that need it are quirky.

Ack, I completely agree.

It never became entirely clear if this call is even necessary to fix
the issue of missing tablet-mode-switch events on the Dell Inspiron 7352.

So for now I'm just going to drop the "VBDL" ACPI method call again
to fix the 2 issues this is causing on the ThinkPad X1 Tablet Gen2.

Regards,

Hans


