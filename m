Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9FF745CB
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gcQotWQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703163890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKUbSujUcjmbQNVNTnGKXDlRz29Lyk23in1kHV5SnwU=;
	b=gcQotWQ+m0ZW+T+03cqdoFhb5/Cg7Sns/2HyFf4jFDdKs5JnIgoG8ImFsPJXhb/sA5g/cY
	r4pUe0WS/DkCqTeKNXDnHdMFEhvIDWn5aMB9I3Y74y78gYdkPkg13AsEWS+UgRplOa/dbM
	ivVmDZnVXaeSINwI19PlPKDX82B1jYg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-Mb2_g0_bMqGFM2Y2iJtjLw-1; Thu, 21 Dec 2023 08:04:47 -0500
X-MC-Unique: Mb2_g0_bMqGFM2Y2iJtjLw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a018014e8e5so37280966b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Dec 2023 05:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703163886; x=1703768686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cKUbSujUcjmbQNVNTnGKXDlRz29Lyk23in1kHV5SnwU=;
        b=qW74BNKsn7M/gnh16MpR00SvCT/Wf/XcShNa4FjYr/CPwDXu0ftro12yCweC7ccuCw
         XMlbCV9YYsTCubrEw0j8+GPtfKm1lP40Pgcwwe5xt3CBYHkxcPIqZu0ZcJzF1jY+yTFy
         F9fO6l0zlaY865FNmUCNGhPC3ZiM7PmzPbVOWbWDsV0Cj4brKeBFWpCi6/5TsiwgJZk4
         E995KISnrEix0dtTxbwEOcuCP5vKWmnBLHjfVzp05Gw8SezuMY+t1j8ZaRZmcDCaYqKk
         Q/bqPD/mIEMYoDh7qEsPu1M1nK/PWESy9wokx+fjgR/DuIGjXSrM1qLPqhvFrfg1qsmY
         2BjQ==
X-Gm-Message-State: AOJu0Yz3IwyXCRe9lQoXgVAtbKJH0kjpTorQlPsaAJQ3rIu2vzJ9ZXwi
	x5gl/L6lTa34xifRI+g5mJ6bQxaKJCS32NmJj1lb6Hi+Zi6thA8Y8Qb/7TAaFNmCvPHdv1wUzGu
	3F63LujHcUBNbgm4oG5yFOhGNinPbSfdC2g==
X-Received: by 2002:a17:906:4c8e:b0:a1e:9d8b:1e86 with SMTP id q14-20020a1709064c8e00b00a1e9d8b1e86mr11143651eju.72.1703163886056;
        Thu, 21 Dec 2023 05:04:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+itG5vbj8FUnUO+KnlZB9cMqpbrWwUxk4M61vw39M2ROTdOf09d0+KzfhLbDo/uyzujBEdg==
X-Received: by 2002:a17:906:4c8e:b0:a1e:9d8b:1e86 with SMTP id q14-20020a1709064c8e00b00a1e9d8b1e86mr11143643eju.72.1703163885771;
        Thu, 21 Dec 2023 05:04:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ka23-20020a170907921700b00a236e9cfe74sm926599ejb.103.2023.12.21.05.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 05:04:44 -0800 (PST)
Message-ID: <7c70b998-6d8c-426e-93d9-eabf9e3475af@redhat.com>
Date: Thu, 21 Dec 2023 14:04:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: hp-bioscfg: Removed needless asm-generic
Content-Language: en-US, nl
To: Nick Desaulniers <ndesaulniers@google.com>,
 Tanzir Hasan <tanzirh@google.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>
References: <20231219-hp-password-v1-1-052fe7b6b7f1@google.com>
 <ZYM_gZAdEnczZiBz@google.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZYM_gZAdEnczZiBz@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/20/23 20:24, Nick Desaulniers wrote:
> On Tue, Dec 19, 2023 at 10:10:52PM +0000, Tanzir Hasan wrote:
>> asm-generic/posix-types.h is obtained through bioscfg.h so there is no
>> need to include it.
> 
> I verified that by:
> 1. building with V=1
> 2. taking the compiler invocation and adding -H
> 
> . drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
> .. ./include/linux/wmi.h
> ... ./include/linux/device.h
> .... ./include/linux/dev_printk.h
> ..... ./include/linux/compiler.h
> ...... ./arch/x86/include/generated/asm/rwonce.h
> ....... ./include/asm-generic/rwonce.h
> ........ ./include/linux/kasan-checks.h
> ......... ./include/linux/types.h
> .......... ./include/uapi/linux/types.h
> ........... ./arch/x86/include/generated/uapi/asm/types.h
> ............ ./arch/x86/include/asm/posix_types.h
> ............. ./arch/x86/include/uapi/asm/posix_types_64.h
> .............. ./include/uapi/asm-generic/posix_types.h
> 
>> It is also an asm-generic file which should be
>> avoided if possible.
> 
> Correct, though there is a linux/posix_types.h file.
> 
> biocfg.h hasn't seen any changes since introduction; perhaps some reference was
> removed in follow up changes to passwdobj-attributes.c, but nothing stood out.
> 
> Regardless, this file builds just fine without either (asm/posix_types.h or
> linux/posix_types.h), and asm-generic should not be used (as suggested by Al).
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>

Thank you both for the patch + review, I've applied this patch to my
review-hans  branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans








>> Suggest-by: Al Viro <viro@zeniv.linux.org.uk>
>> Signed-off-by: Tanzir Hasan <tanzirh@google.com>
>> ---
>>  drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
>> index 03d0188804ba..f7efe217a4bb 100644
>> --- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
>> +++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
>> @@ -7,7 +7,6 @@
>>   */
>>  
>>  #include "bioscfg.h"
>> -#include <asm-generic/posix_types.h>
>>  
>>  GET_INSTANCE_ID(password);
>>  /*
>>
>> ---
>> base-commit: 3fb7c66ac51a87984e043d9f47b7a509e3f53906
>> change-id: 20231219-hp-password-19068dc438b5
>>
>> Best regards,
>> -- 
>> Tanzir Hasan <tanzirh@google.com>
>>
> 

