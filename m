Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1352912BEBB
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jul 2024 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720600987; cv=none; b=ETLPLg0NQ5hUL/yvpNlBTAGK7sVq2fPR16/CfO6zdqs48mzy73VCE9st46hpDqlg8JX0BIVf01vJ2GAjfJFRS/9rICnDhta0Ub3gbhN47slP0nx5RE8KQx43g+Bq3x5ZJ0Z38VzuG5bNuyesd0zThwg/e5AWkRLAOP9n2ki3AGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720600987; c=relaxed/simple;
	bh=lZfZB14sPrfc7MngN8JsS8/MtxD36rdS6vK5hm8LtDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/dxkPlo7Vfqd71BTz8zR81A/6h5pNC7Qoe6A8qkgz1OmSdi3Zo83sta3mUJ7vrXiqR9/9dHXWBKWdqUDLuAwJ5nnBQJdHaRzdUxstcaMqxtNBNFxWwmIGd3+6zIhQaEF1ixkV+e1hrqVIzZdHPCMuoKRM+75ymT6Dxb0zHQcto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CcCu5nYC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CcCu5nYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720600985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJgYVM+WMIzsMKm1A5O+RYotrPSMFdTh1saeyeYnowg=;
	b=CcCu5nYCEkDmBlD3SRSc3xJR5U/DVALoPMqwpjjzEimeDW1ziHX9eFuRAJ4jRv+NoOieDs
	Dkbk1+Ha2s1eVrRgpyZrd2iS0EoOf17OymEOVOaDifzbXrL0hEsk9HAQGmJ6rGuA+LIrY8
	j4Hsmr80Z5KrrzG3MbhEAGyEw+ag6ZU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-p2hNhebMO3CESt939CiBKA-1; Wed, 10 Jul 2024 04:43:03 -0400
X-MC-Unique: p2hNhebMO3CESt939CiBKA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a797c5b4f47so39762466b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jul 2024 01:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720600982; x=1721205782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJgYVM+WMIzsMKm1A5O+RYotrPSMFdTh1saeyeYnowg=;
        b=NFFWD1AlUM7eDdpg+QgH6+vJwzYqOl8t4FNt9OqrW3naa3PTtm7305qm7z6eN/kwtD
         EH608EVX4sqVvSI5rbJMfIigY57aM7xfkRJjMFY3MadtKqUEZWp3mK3KdDliRUeSznGv
         b5pv7C7vOZ3S+fbI7PjKkxcEDhaS4ttrHs6nTYmT2Wfxs5YmdEva6yoAhmfY/r3SZCb3
         BNEOx0WPEJDW9sBNlxqilMY4EC1okjtVyURFX9dzxGnsyaCfhNF4JlPVF2axEDhfxp2i
         h7TU2NJ41nXA5ngvuCgp60FO4Hn0JXfjmr7eaUiGLsTvwtlgR9VnTWIBr40KMNHWyRgi
         l2Aw==
X-Gm-Message-State: AOJu0YyV9MLl+f91uiJ6GQybL2vsGLWjfCjcT1rbHPK18b7Hbiv4xUlI
	bKnFfGPWdnb/P8LY/5BU1Adxubu6gCih3phJFaCzZFcpgylI3QvscODTBT3K12uVdDYMKDZF8i5
	iEUs5sWEU9pGpRdvvtAnvsFNAohlRfNVzgHGiUVUVO00MQz+ddsKOvch9FLj1MDkdrusFWRHMv5
	QmbdgKEA==
X-Received: by 2002:a17:906:e2d0:b0:a6f:27e6:8892 with SMTP id a640c23a62f3a-a780b87f04dmr318531966b.60.1720600982269;
        Wed, 10 Jul 2024 01:43:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErdsOiUqIpxmtNy09RYxYpRzAtdn5Um/W14fqYxEEesOClyOVkCX0JVtuAaH+r3ljW/WVU/g==
X-Received: by 2002:a17:906:e2d0:b0:a6f:27e6:8892 with SMTP id a640c23a62f3a-a780b87f04dmr318530766b.60.1720600981888;
        Wed, 10 Jul 2024 01:43:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc688sm141317366b.3.2024.07.10.01.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 01:43:01 -0700 (PDT)
Message-ID: <a08a9721-7aa0-4c3b-95b0-a7695a2f6d80@redhat.com>
Date: Wed, 10 Jul 2024 10:43:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86/amd/pmf: Use existing input event
 codes to update system states
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 mario.limonciello@amd.com
References: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
 <531d4d0a-9ba0-e67f-6f84-d11de1a0156e@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <531d4d0a-9ba0-e67f-6f84-d11de1a0156e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 7/6/24 3:09 PM, Ilpo Järvinen wrote:
> On Tue, 2 Jul 2024, Shyam Sundar S K wrote:
> 
>> At present, the PMF driver employs custom system state codes to update
>> system states. It is recommended to replace these with existing input
> 
> This change entirely removes the way userspace worked before this change?
> We cannot take userspace functionality away like this.

I completely agree with you that we cannot just go and remove existing
userspace API.

But AFAICT in this case no known userspace code has ever actually started
relying on these custom udev events. The docs suggest creating a custom
udev rules files which I don't believe any distributions have actually
done, not has this been made part of the default udev rules shipped
with systemd.

So I think in this case we can get away with removing the udev event
generation and the sooner we do so, the smaller the chance something
does actually start depending on it.

And if I'm wrong it should be easy to add back the udev event generation
and send both the udev events and the key-presses.

Regards,

Hans


