Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE1F153BD9
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 May 2025 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712855; cv=none; b=ilL77703ufXPBHLDxWqPwEJqkmzdlbiRQ8IXnhjy30/+3jODCejkB0kL01mArMEVozFwiqPfvOYvw2/nIEJTaRFKBZXycEWHgZUqhtMUb0SSPeiDd7gAyGWtY9j0XJ3Ue+5JIBFDnPuCRlO0WzmreLGdivPVdfn6i81PI3k8czY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712855; c=relaxed/simple;
	bh=YRoyK3BALEABx2JcCF10SK+pnBjrZ9BRPIqjbg5H2Nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEb2s4cIcyQJIICCOXdPmyL18ZcOMFiKMWKjxIUfVhvEv/g0YvEjcSs9bFZKH1pQJllaacKsJqEHk3cdSWOUaAJH9l2asUzuJx0PLkI5CBpR1GLirtOYTGjkSXWdpRfXtin7MoIYannkKEt3jpKTMHnYOKpLzZjObh8zj8eGLwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gIm+i1sA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gIm+i1sA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746712853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6TnCo9X9rFkd8dZfcQN25Ythz1cGmJDR0tW3PaauvIE=;
	b=gIm+i1sA9ZMQ8IWffTRwkLgIxAwkIXERxrw0mFFzC79BhnhWDztavJbnr4NtADs4Gc5u8W
	BRTxtLnHABEoa99I/i1duxDVNSe9PtOLBWaMR0CkK7lLHVtdmbIIKQlVdh8wYt50tI4Oax
	LuZlGaFOfPRDUR9s8wJsnvhcm6yjvjk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-foT4mKACOWK_UqtirLWNhQ-1; Thu, 08 May 2025 10:00:51 -0400
X-MC-Unique: foT4mKACOWK_UqtirLWNhQ-1
X-Mimecast-MFC-AGG-ID: foT4mKACOWK_UqtirLWNhQ_1746712850
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acb90bccc16so99671466b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 May 2025 07:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712850; x=1747317650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TnCo9X9rFkd8dZfcQN25Ythz1cGmJDR0tW3PaauvIE=;
        b=MfIcLyyZ/5sEL/X3TTKc61pc9kIfhWS2dCOCLLG1GFz7ztWWZiuD2iYTxPZ1kAxq9N
         JiFPfoAf3d+UAqw7Zr6DQVTw4vepvcr9vVTIjMps4kr9anD/eumRDsH+bGejgcWTEz87
         KHwshND1/n+39+s8WkJsiYXx9vgsmrQAyU0E/Hk3UH96HBg+rjoTKPH2XPyX1vliohGf
         9OiPfWhBgrYoCkBLuyu88r85TBdzX/p3IDIHovmvQlmUIp6Q8ZB0Cs0ZxQxY40YvxFEV
         MvifzbkyhdBWf1wPHDVlxt5+nDp2ag9aj4qsD4q85WpqA3yz5DFb9FtO2z7okR6MSBbE
         w1sg==
X-Forwarded-Encrypted: i=1; AJvYcCWsv2dD9dZO+2uSVNrCnePueGu0/xlxPNWJ3FdMS2NZzSbtn706wPybl6bVTNh2GeGCsAicmNm+dSserjZQ6oC8XCKo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3imqwfN2WtzGXTOI2tkidiQLbfw1BvUEKCIp6a4Nr1Lc+CxHV
	RqKrVv8NUD6XWmzX89mp+VMzWA4fzDSMRFnMiYK1vZsFS8886GGH28ItpdSKkoxi5hYzCPTkIYc
	KgbA6Q65wS2Sd3PISTkN12SqMPe2l6CifT5mcqon/eVkt/EwWsw1JjFkOZPDrS2JiGPvAscA=
X-Gm-Gg: ASbGncvubG3N2A3USDn0z2CbDpfl8KzhQlZdHLAEDSw91NiZAOficP2i3qxazix4iXj
	0j3MxdOtxiAN5D+iAUDJXkGmMV3t/kIBwYDX8EN1xzxzSBWmdWiqpm8KilM1ghMRlIqJSdZGB6O
	B4PjCCTGdt36KCDEWbxMK9YZlt1zPSYGii85l+pNNfK3f4MEK8mmxj1XLpEgxiik537n2/MzLLm
	HeQGZUOFfAO+DRjpqyOoeUZkZlv02h+yiI+EdZBEfAWJMvQQHGrwFGY/L1k8Ah2EH9vNc3uu0de
	7eQdxqeWROmKmVYdqrGWmb4vpG6PTKVnC+oPs/y8yBKV1sjMZYsV8DYDSZfybrwT3XMw96cnqI3
	TgsQpa2DCzy2sfivF3uKeKFuw66LF9zjJzBsvByaRB08mkIIvho8Wa4TFeve5Pg==
X-Received: by 2002:a17:907:1b0d:b0:ac1:dfab:d38e with SMTP id a640c23a62f3a-ad1e8ca918fmr791990666b.15.1746712849778;
        Thu, 08 May 2025 07:00:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs4kUttzZ/fXfN85MKSO8+LoixBy/tJ7xib42w1vjltEhwA+sdD5VBLF+aPCStQURh6GIMiA==
X-Received: by 2002:a17:907:1b0d:b0:ac1:dfab:d38e with SMTP id a640c23a62f3a-ad1e8ca918fmr791984266b.15.1746712849050;
        Thu, 08 May 2025 07:00:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a19e6sm1081594466b.46.2025.05.08.07.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:00:48 -0700 (PDT)
Message-ID: <dc3b07a9-cb0f-4f84-9e4b-c6e62ffc73df@redhat.com>
Date: Thu, 8 May 2025 16:00:47 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vcb-fcQHWqVDh=KUwhwvSP6KqUN8FsAMvDuwF2iD7=J1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 8-May-25 10:36 AM, Andy Shevchenko wrote:
> On Wed, May 7, 2025 at 9:52 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> This patch series does some small refactoring of the int3472 code to allow
>> re-using the sensor GPIO mapping code in the atomisp driver and then the
>> final patch in the series moves the atomisp driver over.
>>
>> About merging this, maybe the int3472 patches can be merged in time for
>> the 6.16 merge window and then the atomisp patch can be merged after
>> 6.16-rc1 is released, otherwise an immutable pdx86 branch with the first
>> 5 patches will be necessary.
> 
> Overall I'm pretty much liking this series, but one comment against
> the last patch (see there) and one question here. Can you isolate GPIO
> mapping code in a separate file, please? This will help to generalise
> this code outside of two mentioned drivers (I might need it in the
> future for something else, not related to cameras at all).

If you want to re-use this elsewhere then splitting it out
further sounds like a good plan.

But which bits do you need? Do you actually need the full code calling
the special DSM and then adding either GPIO-lookups, or gpio controlled
regulators / clks / LEDs ?

Because atm the int3472/discrete.c + other c files linked into the .ko
does all of that and for the atomisp2 case we actually want all of
that (although for now GPIO -> clk and LED is unused there).

Anyway I think it would be best for you (Andy) to come up with
a proposal / RFC patch series to split out what you need. I'm certainly
open to that and happy to review such a series.

Regards,

Hans


