Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581BA28FFD5
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746652421; cv=none; b=OaXW7f81Jws3rCADhn6SN3OU95iZUy5LOc5RaoR0JphmSagkyJ9tj2rrBM7fgyxVJOiX1A4CniRYb151JIih6EJzo9aaFUlqiBmbRBzLnfV21yE1yfcXK6WeiififLcvGJQLeqiWFVgCIspV2GhywB5j9+LHAJE5l1u9XIm4KGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746652421; c=relaxed/simple;
	bh=rDi+M50iRkEBn8NyIC4MJndVXEuY8kocc7kmsv6+/pY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S59ZVsZ6z0bcHYzcFOJA4jaCvCftqnJxtEJQK3Q9vySkMr+90Yr7MZpTw6vtVTc+Ihbxvom6lgG2NFI0KOtKK+1WdcmAobU7lf6lQljkuiQP4zfeF9sUeFJsnA+Gv1VBhhZwRFBhAYEuE/qR5VSwSL5HaITkZoZDLkIpgO69CrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ULp4C9gS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ULp4C9gS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746652418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pyFruEMGsFO4LymNbk8Aadri71IZZ9QOzkfxFDvyktk=;
	b=ULp4C9gSV8QTXGgtceR6n6EI8ulDRdGOn0Z17H7X4V0deHS7gTw2sGKZBLAhjDpFkX1Mud
	EYPY1/MCiT53PAs7p1Z1dix3oJR+/n+KKwHz/UkXI6iXH1nE/qjeLvYjjNwP3zGOphDRus
	sAZR4Yzp81vv7AnUC7AdCvqJVB3VC7M=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-M2m9EpLfMASE1Q83-2n8kQ-1; Wed, 07 May 2025 17:13:37 -0400
X-MC-Unique: M2m9EpLfMASE1Q83-2n8kQ-1
X-Mimecast-MFC-AGG-ID: M2m9EpLfMASE1Q83-2n8kQ_1746652416
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acb66d17be4so17562066b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 May 2025 14:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746652415; x=1747257215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pyFruEMGsFO4LymNbk8Aadri71IZZ9QOzkfxFDvyktk=;
        b=Pu/28SWWzf3YXZXCy5dftvJtjVSmLdQiCYvo+6B2QLVgrV2xPcfETK1+ig3oSvIF2P
         DF1vsp2ZdgpSGX17v+UlsdRBUBBhinl4yR+fslihhRjFwz4w/KS0v3e03mgsWOuWIlPS
         mV0uLI1zFbcxRTgpkOHhVko4EnFeoj7xk7yyK4kJaWWuDI3JSHwTqFBiJeZG4VnFlo/U
         HPW445F/SPvQ/6TzaClYOJ7ufC3cgHTHGIOUYmU52t9dcB3bmfeb0cOJ56trYVCrEg1H
         ZwxMOS62mx3ppo9UKvaYjyW4hMqK+dfjH7/uJee75XOVEQoBZp2YCA97+jdagSNdLifz
         pUgA==
X-Forwarded-Encrypted: i=1; AJvYcCUYFsN7DUoCKJrrLpZdrRnys2HmpFAfTsHt2Av2Y1nVRTYSTsgd16iEb29sZpTPQGI1jVN782yf7L/ZtDw0NDlc/6Kv@vger.kernel.org
X-Gm-Message-State: AOJu0YyYD21N807+UoUaZ89TfoeivX+CYLb83BRDpusWTMc3hGOzzIbz
	ACTd3WisWMXuxzdQesefSBRpUcRlS9nhEn2IH7XGorMnZFDSAVvf+ymBN7T8FJerjUOacZrkJtm
	BTyvDJhP/d+aMihpGWo3yn/xQ4ofTPxbJAOjL35fzGRQpgkJ40PcIXsu1rDCZ//IDUW4Oj9DvyK
	pFMcE=
X-Gm-Gg: ASbGncupKNXlxfqsMSSzg8pz5Lujn9EmmzQITrHhJ1Au0n64tPWVpQd7HNxxKbazi+W
	A8wLrWzQF+975jEadaCmWgdGXfq9R/k0Zcss8OoQ8DzMLdqucJKdoinEvsepEUblSgACDbINRRQ
	SMw6ha/6yeC78HgA0qY7AtxD/2pxDjeJtW08kV1EFWzxAJ2RQsjHOgD8aX+t4FVtbtK7GUBtGqi
	6PsPUSX9AMvJqdM/Nno+lqSYUUi9yUlRVGi8HNSR18dw67SNXyXTQgeu8UoIql1xeggpeFS1PON
	DAj259B6iAYngFi29hZsi9FNXTyQ3/jjls1xvIVfD5U1FInkyetYFrYGz6xGxo8/SDmhgPGvafD
	CbiiLRbpoBPXZVobL2bju764NMZx2kYU2+Rh9084kdIQl8bWnwVY6zuZDjH0GrQ==
X-Received: by 2002:a17:907:7d88:b0:ac3:4139:9346 with SMTP id a640c23a62f3a-ad1e8b9c92bmr474554366b.9.1746652415454;
        Wed, 07 May 2025 14:13:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9Pd3cb9fBsixR0vs0CblTQxcvY90hk5Dm8Nag6f3wwTUMQqcKULDist3ihZOkXkbCvFhKHg==
X-Received: by 2002:a17:907:7d88:b0:ac3:4139:9346 with SMTP id a640c23a62f3a-ad1e8b9c92bmr474552966b.9.1746652415077;
        Wed, 07 May 2025 14:13:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a2df5sm961549766b.38.2025.05.07.14.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 14:13:34 -0700 (PDT)
Message-ID: <0d801367-da24-4596-83d9-08ccd89ca670@redhat.com>
Date: Wed, 7 May 2025 23:13:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for OV05C10
To: Sakari Ailus <sakari.ailus@iki.fi>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: W_Armin@gmx.de, ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
 <aBosuj_TbH7bzjfZ@valkosipuli.retiisi.eu>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aBosuj_TbH7bzjfZ@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 6-May-25 5:37 PM, Sakari Ailus wrote:
> Hi Pratap,
> 
> On Mon, May 05, 2025 at 01:11:26PM -0400, Pratap Nirujogi wrote:
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---

<snip>

>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
> 
> How will this scale? Can you use other sensors with this ISP? Although if
> you get little from firmware, there's not much you can do. That being said,
> switching to DisCo for Imaging could be an easier step in this case.

Note I've already talked to AMD about the way the camera setup
is currently being described in ACPI tables is suboptimal and
how they really should use proper ACPI description using e.g.
a _CRS with an I2cSerialBus resource for the sensor.

Although I must admit I did not bring up the ACPI DisCo for imaging
spec as something to also look at for future generations.

Note that there currently is hw shipping using the somewhat
broken ACPI sensor description this glue driver binds to,
so we're stuck with dealing with these ACPI tables as they
are already out there in the wild.

But yes for future hw generations it would be good to have
a better description of the hw in ACPI.

Regards,

Hans

