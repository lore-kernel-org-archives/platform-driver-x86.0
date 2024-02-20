Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F9869D0B
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Feb 2024 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708436186; cv=none; b=mAT9Y+ex1/eo4/VdIQz5mydFmx60oUw/6E5ymQW7IfBQHxb0j16py54uET0VcnYVczawORb3+3bOm4/3I/4kg+YKGu1hTy/Q+AJGuW5jaQ8I+hrnvdt+Fa7wf4B/UkyQWGLStYXjUYYktTwL+tD4cTFuElspm77O5tjrAqHl0Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708436186; c=relaxed/simple;
	bh=qTdIACvni1+zoPI4MGD4/d8fx6fNv/9KCQKVWS3UIvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHwEc9hlaisZojbj0aKV4uToBf5mBYkrT8lbvtgL+YJIkrsdLv3M8oAVDLR8/lVUdqWJs4nsg3yEIc08el5SjZHboVCy2Rcn4w8OYfMVVO9V1PCGo8a9AXeeaK6/bk7ccj/Wpyu6Yj8pfC5wV5CfToH6hnfhwPSaTeexVRaUoXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VrR5dL9u; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VrR5dL9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708436183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dC/PwcuJhyvtuLUW/w6kFb/neHxEwkC6wfvqzOyqLBI=;
	b=VrR5dL9uCVGRpz2BEtO8snzgiJRWedsm69L0Z6Nk5xGngj8ZbAfnzqmFWYKrLIph3Bsnny
	JJBC1hSRBK9D2jP6Jii6VBMz5qYmbn1c//EnjeqTZct52cNLTAlJzyJ0qdFG1Q+w9xZu1Y
	nF9wLJuHqSYbTFs4zI1f+ECnNrCV+SQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-6HPO-u5UMAaRMcMIqH8g6w-1; Tue, 20 Feb 2024 08:36:22 -0500
X-MC-Unique: 6HPO-u5UMAaRMcMIqH8g6w-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a3ecd8d3a8dso105743766b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Feb 2024 05:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708436181; x=1709040981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dC/PwcuJhyvtuLUW/w6kFb/neHxEwkC6wfvqzOyqLBI=;
        b=KERxIec4ds6PX3YKwjh6e3pMOx9KwYGdsuoU0+iauSaXwhIswWWQ2mh5pD+6yjjM56
         TROZgE3Dquoo4r1Ky9cIHm7gcbexHaqN+0rKfkdCRB8F91okaCjIIpWvOPzP3KmPX7e9
         IEMfpLx1SH4CfESIo1eba1KznZkyZ0Dx/gtiUcOmp1z5goUJeb2XxpRixnOZyVNR2hfU
         BFL+lKX4IgVcTCkgttkb/PJphAkw4q8PfNaxlFKEpdEXtLBNSC3HEgXp95r5O3Mlhebz
         L0+/nYUS8Y9RuRzE5nFn1FKx82NXFVMe4qHWSqu57CbzdlqYDhh2zA22yjT1oQY+0q72
         jIbg==
X-Gm-Message-State: AOJu0Yz1rIzMmFG4226pDYOSiDahWYixim4mP/Z4U87nFlyKP0eY/T9+
	s53hWRarGWSCfeiTbtBFGisavYpehy4xOgOJG6qL8GA1r0OAkDp5EkWVIHpQaITE2aE51dTTxnG
	WWYMeEer2M1Kt1gz+P2MaiGVrSHeGhg6JC4ARX/NYkfpPMCt+3lRB+JMfKMOORPIkO/VHqKmCxs
	+cKYI=
X-Received: by 2002:a17:906:378e:b0:a3e:fce7:9393 with SMTP id n14-20020a170906378e00b00a3efce79393mr1092836ejc.10.1708436180908;
        Tue, 20 Feb 2024 05:36:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVy2o5Zy4BSjVUWpl4VILDWUVt4NLr+Cp+ijBGARtWuOJh6N4mucYFS5HAyBE/dGIl+KsBWA==
X-Received: by 2002:a17:906:378e:b0:a3e:fce7:9393 with SMTP id n14-20020a170906378e00b00a3efce79393mr1092820ejc.10.1708436180561;
        Tue, 20 Feb 2024 05:36:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id vh6-20020a170907d38600b00a3cf436af4fsm3988382ejc.3.2024.02.20.05.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 05:36:20 -0800 (PST)
Message-ID: <17e3df4f-791f-47da-8eb8-d61f332d2cc1@redhat.com>
Date: Tue, 20 Feb 2024 14:36:19 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/hsmp: Add CONFIG_ACPI dependency
Content-Language: en-US, nl
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hegde, Suma" <Suma.Hegde@amd.com>
Cc: platform-driver-x86@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240130073415.3391685-1-suma.hegde@amd.com>
 <297e679c-a05e-4d02-bde4-53697ff9f4a7@redhat.com>
 <64d36beb-0123-4f00-b1e2-692f1f54064d@amd.com>
 <f4e34659-3571-2e3e-dfaa-db9bc4d79fde@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f4e34659-3571-2e3e-dfaa-db9bc4d79fde@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/20/24 13:06, Ilpo Järvinen wrote:
> On Tue, 20 Feb 2024, Hegde, Suma wrote:
>> On 2/19/2024 6:15 PM, Hans de Goede wrote:
>>> On 1/30/24 08:34, Suma Hegde wrote:
>>>> HSMP interface is only supported on x86 based AMD EPYC line of
>>>> processors. Driver uses ACPI APIs, so make it dependent on CONFIG_ACPI.
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes:
>>>> https://lore.kernel.org/oe-kbuild-all/202401281437.aus91srb-lkp@intel.com/
>>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>>> Thank you for your patch, I've applied this patch to my review-hans
>>> branch:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>>
>>> Note it will show up in my review-hans branch once I've pushed my
>>> local branch there, which might take a while.
>>>
>>> I will include this patch in my next fixes pull-req to Linus
>>> for the current kernel development cycle.
> 
>> This change was merged by Ilpo in review-ilpo branch into commit:
>> platform/x86/amd/hsmp: Add support for ACPI based probing.
> 
>>>> diff --git a/drivers/platform/x86/amd/Kconfig
>>>> b/drivers/platform/x86/amd/Kconfig
>>>> index 54753213cc61..f88682d36447 100644
>>>> --- a/drivers/platform/x86/amd/Kconfig
>>>> +++ b/drivers/platform/x86/amd/Kconfig
>>>> @@ -8,7 +8,7 @@ source "drivers/platform/x86/amd/pmc/Kconfig"
>>>>
>>>>   config AMD_HSMP
>>>>        tristate "AMD HSMP Driver"
>>>> -     depends on AMD_NB && X86_64
>>>> +     depends on AMD_NB && X86_64 && ACPI
> 
> Yes, it only belongs to for-next.
> 
> The change that triggered the build fail is (it is only in for-next):

Ah, my bad, thank you both for catching this.

I have dropped this from my review-hans branch now.

Regards,

Hans


