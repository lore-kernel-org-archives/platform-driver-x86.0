Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F56513775E
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 18:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736188411; cv=none; b=VXC4wcomiAicNLFpOSNryFCOx4EQKhBM9P0/IXVp53LGrUoB6sja60xBT01HMixJ9AatzQS7et3ue8HU3UB7+06/fKAYN8xeD7ZdsHnKRXx6rOFb+H6ikk6U5n9E6ih82Os8jX01w0vuqiKUUfjM14aFv4fRT2YNttI43h5AIJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736188411; c=relaxed/simple;
	bh=lg/svAvXiOmJQmZ2PTy/JRM5PafogJcNIhOx3rlMrs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gveINnXOTXABEAqIDHJ/55DtrRv79aSWD3UjXellRz2b8HkAvbrAhlFiyIaSGRVCsenlogIWry8X42KmmxDTXZL+bvritJvBMJrLT1vOXIotAkpIpD4kAG1WjFA5fhcMcBDZwZYYgNGTFSzyhHOZxJx2TDj/0Ku0hAg+F87Ulrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VawkUotK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VawkUotK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736188408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWlnkdv52RVIzR3sZQXxwd1WDf7fBB4R6QG+QsF7ePc=;
	b=VawkUotK5ceKrDBm19LE51vO7tpZsWDkMrM5KV0YJEN98oOcmA7Orx1/RTbHB2/RIHMjLX
	q5OuNcmm+WQlJsjWwCEIOZGnoEdwezMuAVyXDlk63LODx3wrivhuJpGhPj3sSdr6wUrMnf
	4SsiDyJ3XkGYlln0h8Uh52o2rQFEsGo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-zrpDLbDTMUyaUg1hRDag4g-1; Mon, 06 Jan 2025 13:33:26 -0500
X-MC-Unique: zrpDLbDTMUyaUg1hRDag4g-1
X-Mimecast-MFC-AGG-ID: zrpDLbDTMUyaUg1hRDag4g
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa67f18cb95so674411366b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jan 2025 10:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736188405; x=1736793205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWlnkdv52RVIzR3sZQXxwd1WDf7fBB4R6QG+QsF7ePc=;
        b=dN2+YmmKGI/TUgKOVizdNzlXGn8NJRnC0IyeB4MwMJkxIXWYJ8iI37j3jHacu5GTZ7
         tl6BOpX+AiwEGIXk2P0ECaiI+1xk/w/tlA0DxTrYpE58NGdCZn+AzhmEczjGwJPqQLFj
         12ckVZnOcWqjjFhbpIaOclaZ+c8eabeuJkgbnvgqy6scE0erNNqta7v3OdmhxJbOo3ob
         4GhDa2F6+qzLFnfAPy2ptuMWNwlhuPXnAa5H1yex2nkKDIBtIJD7ACbaJRsm6+VuPwS8
         NT0m0vfUMNnvnmVMTo1X8qmNO+rTD1IaSa38D3OGW4wLyXolWYQ3RcjT8Ea9Jl24xRON
         kHrA==
X-Gm-Message-State: AOJu0Ywu+9j5D1mPn/k4cv8kdRweLBJV/ZV/sGvyIQGDAjQAsS0GJnAN
	6edIGSoFEBNdimLt57mX96JwTKxsHVSmTQk6qIXyxm8MMlaHyE9NgVm710dQ4AgqWUSwNT/etvH
	bX8WBCfR65XDphya/MDpzl3tj8A69OMnhcFajDysdiihaten7GBsjja/AsjpJb7i8bF6Sgpg=
X-Gm-Gg: ASbGncs1k0QJV2cEWp6hrVbr2uTImZ32b4SQ/npTETcsRKKLLv9TJLPqplL6PUBXpsN
	tlOzO9XFuvwJ05vIAwm2drvsD/4Da2XMbYY/2bEBfRZPQ1Vq9iamcAiLt7LM2Uyl01T0JmPh55m
	+cVK2VMCnDcsfy+V/9J43qtoRSatZwuJnKBtCz8oTfPZJqPmFH31StGuVGDdmsGwfN86DZfCSJ9
	YgKYp2FQ0GUsWjeIEv/HDyWvof9HO57QEH90CUORvcsdpqtam0hr5AtqfaZHL9rinExP64YKn5d
	L+zB5fejC1lYQrhC4SzDenWWiHI3QqsLVhdfQF3KYDAc6dpZ04DKE5cgrUdGAY5bMm799R/ztIk
	NdwYNvo8AhbQF15DS5lKolDyRvlfwhqk=
X-Received: by 2002:a17:907:1c16:b0:aaf:208:fd3f with SMTP id a640c23a62f3a-aaf0209031bmr3287906266b.13.1736188405349;
        Mon, 06 Jan 2025 10:33:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGN4mTJJZxbklby5vcvnKrZdHwK40gGI80mqVEJPT/dyeSEVMoA9PDLDNBf7GmWLnojcifh+w==
X-Received: by 2002:a17:907:1c16:b0:aaf:208:fd3f with SMTP id a640c23a62f3a-aaf0209031bmr3287903866b.13.1736188404917;
        Mon, 06 Jan 2025 10:33:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f066112sm2270145566b.179.2025.01.06.10.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 10:33:24 -0800 (PST)
Message-ID: <5d2ee19b-eb78-4c67-9a5f-82859d8ae8bc@redhat.com>
Date: Mon, 6 Jan 2025 19:33:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Armin Wolf <W_Armin@gmx.de>, Hridesh MG <hridesh699@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de>
 <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
 <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
 <CALiyAon+5H_g1V-iNbjdLmjgYDJng+ePH0XeoYxijYurHj+uTg@mail.gmail.com>
 <31c28ea2-881c-42e3-b754-8b52ca7f63fd@gmx.de>
 <CALiyAo=_vGu50RoAPwFMv9J=mkaQWojAQxmB2qmwcEZ5Y8kfSg@mail.gmail.com>
 <583bbdfe-5c5a-4541-b30a-97eb89f2e4c3@gmx.de>
 <CALiyAo=Y1rh=OpTete0N=q2DrFh8CL449xAfSxfJuju+5tc_mQ@mail.gmail.com>
 <ceb159f1-2900-4946-a9c9-088ba99d2d67@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ceb159f1-2900-4946-a9c9-088ba99d2d67@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

On 6-Jan-25 5:59 PM, Armin Wolf wrote:
> Am 02.01.25 um 07:18 schrieb Hridesh MG:
> 
>> On Thu, Jan 2, 2025 at 1:51 AM Armin Wolf <W_Armin@gmx.de> wrote:
>>> Am 01.01.25 um 20:53 schrieb Hridesh MG:
>>>
>>>>> This ACPI method should trigger the turbo mode button (found inside the DSDT table):
>>>>>
>>>>>           Method (_Q58, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
>>>>>            {
>>>>>                   Debug = "=====PROJECT_QUERY_58====="
>>>>>                    ^^^WMID.FEBC [Zero] = 0x07
>>>>>                    ^^^WMID.FEBC [One] = 0x04
>>>>>                    ^^^WMID.FEBC [0x02] = One
>>>>>                    Notify (WMID, 0xBC) // Device-Specific
>>>>>           }
>>>>>
>>>> I feel like an idiot right now but I just realized something: So far
>>>> I've been assuming that the button I've been calling the "Turbo
>>>> Button" worked the same way on both Nitro and Predator laptops, but
>>>> that's not the case.
>>>>
>>>> On Predator laptops, the button directly enables Turbo mode but on the
>>>> Nitro it only opens the Nitro Sense app. I had assumed that both
>>>> buttons simply opened the app and that directly enabling Turbo mode
>>>> was a feature provided by the Linux driver.
>>>>
>>>> Given this, the ACPI code that you linked earlier is probably for the
>>>> Predator's "Turbo Button". Could it be that the button on my laptop
>>>> doesn’t use that ACPI code at all, considering its functionality is
>>>> completely different? (Though i doubt Acer would leave it in if it
>>>> wasn't being used)
>>> It is quite common for manufactures to just copy and paste ACPI code snippets, so it is not
>>> unusual to have some unused code inside the ACPI tables.
>>>
>>> Did you receive any input events or dmesg messages when pressing that button?
>>>
>>> If no then it could also be that this button depends on the Intel THC touch controller to work,
>>> take a look at https://lore.kernel.org/all/20241216014127.3722172-1-even.xu@intel.com for details
>>> about the Intel THC controller.
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>> I do receive input events, it shows up with the keycode 433 and symbol
>> XF86Presentation. I think you mentioned something regarding an i8042
>> filter, can we use that to call the function to cycle between the
>> profiles?
> 
> Since this is a valid keycode i advise against filtering it out. Instead it would make more
> sense to allow userspace to control the turbo state for example trough a sysfs attribute.
> 
> Then you can use a userspace program to react to this key press.

Since some laptops handle this completely in the EC, so far drivers
which get an event for this have been reacting to this event
themselves and calling the platform_profile_cycle() helper to cycle
through the various performance profiles.

I think it would be best to do this here too.

Regards,

Hans



