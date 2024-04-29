Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C941773A
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714380647; cv=none; b=MMTWlqSUNunNYjtqX7DQ439eltCN52j5cR7cz6HbdOQfdY1DeVq0hLaci/JyqDc4rXwnvLiy2kngQS04ZSdgIzmdNlxRzCMi94SnYVnKTjSsUrJ81zVhwrdqbBPe9H7lAZSvj+SiXTHTngO2YEl4JSWWEDaVoUapI7pzRTrLzFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714380647; c=relaxed/simple;
	bh=rgiNFHc2IiZm6jE3zuRUAG4WzacCroJtNIS3FrDF30Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SWxUevPc4pQuUYn4bDrgIyugqv+uIReMmiCPGi72/jwcSJ1phmCmO1IhgEsGhCveL8m2LmOn0w9vOpQrmozhXofj0EZiHOx5hmVVhlGT9Lhgi0CYMIijfTXIivOV+vDrlHw/nrqDN4FChQAcXI7uXo1jaULAMYp8r+1gC5vEMyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GynobMh2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GynobMh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714380644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W4pSc1DRjWptv/IaW1cez1QIGsgqWEz0OtUlnhdTYjs=;
	b=GynobMh2ojFTe3ifiiAbzn+8daMIdmICCnjEvOyK8n4mtbsZNpYdC5RFM081TsEz7pDwKe
	LIMMA8Rg8Ma6EtZYxrFqY3aNYyU5Zw2YcaFdWJYeeXqmNLSxDlzXO7vWBvmOP8j2Afc6EJ
	A4wVabv87yLkm9LSkg6B8v+VyMZaUik=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-CQ_hrtuCMpuAS2KaTu_beA-1; Mon, 29 Apr 2024 04:50:41 -0400
X-MC-Unique: CQ_hrtuCMpuAS2KaTu_beA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-516d46e1bafso1776380e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 01:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714380640; x=1714985440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4pSc1DRjWptv/IaW1cez1QIGsgqWEz0OtUlnhdTYjs=;
        b=GmBlsZDBf0LHWuc15omiOj9kDXiQhPCiGNunXD/H07glUejGVz7Msn8YOs0nK5l3+B
         CC2mJoKHRp8V7VPDzhFFzZAnOUVwOl7lc4uHw9VQiAfALVAjqJHLlPg2MfpXQ5WlIqLz
         GsScrQsKo+W0aqjV5tWkiWGgHGYu3awrxbof5bzE2G4rtKnZ5hDxWC3mCJmbelNgHqxS
         SoqRmhu/D/DCZcZTbrrf5kGsTV1dbA8NMNKjkXF70OZ23EcPe0Vl1I54Zf8N2csZY53i
         8XBofzC/t+pRep/ipPcbfLDLvQXCxz3AsjTZ/Gsr2O6a7oapsYtEGaL6kU1VlMW7hOfu
         d1xA==
X-Forwarded-Encrypted: i=1; AJvYcCVlCGGPH2z9HpQPFbIZ+jfefsIR4hJOP18vu28+J5aORUwGUjgmIFGEzeTg2v2dqXVDakjFZnVCQg2ZrSoehyZ1+pQSj32AX3lrvrJbt96Fv39Sjw==
X-Gm-Message-State: AOJu0YyYm57GjAkDpxM1RnA/Ho28vierLByFDOHILonjtZ1wVxOE4rMn
	d2RKOW5jqLfGtyHW03Qovkhx+RS81xf0DTlagC0talb4b12lqJRlRDQWn6TzgRGJQHwW2kMQjrO
	W44It6GYmWj0lIgd3aSTf0/JxEo1fG/skVlo4okKBWSj+wm34Jvei5fXLWyT599SWy7C9wTrErT
	FSHGI=
X-Received: by 2002:a19:ca48:0:b0:51a:c2fe:9f73 with SMTP id h8-20020a19ca48000000b0051ac2fe9f73mr6817429lfj.51.1714380640172;
        Mon, 29 Apr 2024 01:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPZvfe04RAChQ68MPCJFEVs/Wbv4x0GToG2MCNbkAXG4SNNBFJ2M3f+r52mlqGbnf4X7VMYA==
X-Received: by 2002:a19:ca48:0:b0:51a:c2fe:9f73 with SMTP id h8-20020a19ca48000000b0051ac2fe9f73mr6817413lfj.51.1714380639803;
        Mon, 29 Apr 2024 01:50:39 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id bu6-20020a170906a14600b00a57c75871d8sm8202164ejb.106.2024.04.29.01.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 01:50:39 -0700 (PDT)
Message-ID: <48163b9f-7aba-4874-8fb7-98bebc370548@redhat.com>
Date: Mon, 29 Apr 2024 10:50:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] platform/x86/amd/hsmp: ACPI, Non-ACPI code split and
 other misc changes
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: ilpo.jarvinen@linux.intel.com,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Suma Hegde <suma.hegde@amd.com>
References: <20240423091434.2063246-1-suma.hegde@amd.com>
 <a0a27a27-0deb-41c5-9625-ddaebf42f405@amd.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a0a27a27-0deb-41c5-9625-ddaebf42f405@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mario,

On 4/23/24 7:07 PM, Mario Limonciello wrote:
> On 4/23/2024 04:14, Suma Hegde wrote:
>> Patch1:
>> The first patch is to address the concerns mentioned by Limonciello,
>> Mario i.e to address the issue of
>> "Probing registers that don't match the same mailboxes randomly on
>> client or embedded parts might lead to unexpected behaviors".
>>
>> Because of some limitations, instead of the methods suggested by Mario,
>> family check is added to differentiate server socs and client socs.
>> This check is only for backward compatibility, Going forward all
>> systems will have ACPI based probing only.
>>
> 
> Thanks!  Hans, please drop the PM profile patch from your review queue in favor of this series instead.

You mean: "platform/x86/amd: Don't allow HSMP to be loaded on non-server hardware", right ?

now dropped.

Regards,

Hans



> 
>>
>> Patch2:
>> The second patch splits ACPI code into  separate file there by removing the
>> dependency of ACPI in Kconfig.
>> This is based on the suggestion from Ilpo Jarvinen.
>>
>>
>> Patch3:
>> The third patch makes HSMP as "default m" so that anyone who uses standard
>> distros will be able to use HSMP by dynamically loading it.
>>
>>
>> Suma Hegde (3):
>>    platform/x86/amd/hsmp: Check HSMP support on AMD family of processors
>>    platform/x86/amd/hsmp: Split the ACPI and non-ACPI code
>>    platform/x86/amd/hsmp: Make HSMP as default m
>>
>>   MAINTAINERS                                |   2 +-
>>   drivers/platform/x86/amd/Kconfig           |  14 +-
>>   drivers/platform/x86/amd/Makefile          |   3 +-
>>   drivers/platform/x86/amd/hsmp/Kconfig      |  18 +
>>   drivers/platform/x86/amd/hsmp/Makefile     |   9 +
>>   drivers/platform/x86/amd/hsmp/hsmp-acpi.c  | 219 ++++++++++++
>>   drivers/platform/x86/amd/{ => hsmp}/hsmp.c | 378 +++++----------------
>>   drivers/platform/x86/amd/hsmp/hsmp.h       |  82 +++++
>>   8 files changed, 425 insertions(+), 300 deletions(-)
>>   create mode 100644 drivers/platform/x86/amd/hsmp/Kconfig
>>   create mode 100644 drivers/platform/x86/amd/hsmp/Makefile
>>   create mode 100644 drivers/platform/x86/amd/hsmp/hsmp-acpi.c
>>   rename drivers/platform/x86/amd/{ => hsmp}/hsmp.c (71%)
>>   create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.h
>>
> 

