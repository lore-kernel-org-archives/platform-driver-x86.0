Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E51F22C325
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 May 2025 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710325; cv=none; b=WAxAmC7aGe1ryRlylk7rjRFjgfaPoyLUHqMBYscNKIkkEQucmcUuPeu7dOG1qceMZfRZ4SzUi51lcH3A8nyL6W+V6hOuAcbX52+JRTMZlz8aSlX/UUgihd7yx6IU5IqPJO4D4Y+bH2RfUjBAJrw4gvIsnA/BR4LK3rp1xvfl0xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710325; c=relaxed/simple;
	bh=W7R2W+HGwaOU6KXHWl2UWLPNhw7Otc/RRAtwobGk9ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PaKeqbrjb+45wDdajxAUXUq4AXxte8cTkM7BEYFgjPjxzBEDmRGPJqmt4UmR9QUEIsCZMVbh4JmoN46TO8jM2YYR6vX0A2/f50Qt3SLKQTWyV5HnhUCHLVkzVG8FIVzyZhG+IV7M/1VwNRGMAeUnKP30jWeGxNoMr+JoI7PZJjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L1v/eeD2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L1v/eeD2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746710322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P6xOX054sXenbyfHXykTuJA03aPocYLq5zEpHsINXa4=;
	b=L1v/eeD2+bFWWon45rnwHsYak2OIT6g+jxffUItMpTy02cE8zyFW6ChF3Q7Sps9meXe/kL
	T8U6pqN9RUt0Cx7XXTLt5GgCMl1l5X6/vQW/gV3xXT0IRpVqIhPTNDfslcqjG2e932S3aC
	XqGHTEt3lJriswbXAUXfg7Tu8KDmo3M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-ABsCwlVAMoWk5eJg2NX-ZA-1; Thu, 08 May 2025 09:18:41 -0400
X-MC-Unique: ABsCwlVAMoWk5eJg2NX-ZA-1
X-Mimecast-MFC-AGG-ID: ABsCwlVAMoWk5eJg2NX-ZA_1746710320
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ab68fbe53a4so107289966b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 May 2025 06:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710319; x=1747315119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6xOX054sXenbyfHXykTuJA03aPocYLq5zEpHsINXa4=;
        b=om7/0T3kYWTPKEy8qHAFMy1qNbfTyDOi/U3bGy+HuU/jByp7EzqAUUM+ng3d7SQ3ql
         F75pOW2+GNt4iUhVSjqSXrVZznE/Q2AVxRrxp1VX4B7B1qGdSACzV8fPWXbnYoKJuBVL
         JE7j0AuefpjQMrwd/afNobX5soqVOrSQAEBmTAqlFglaaJUU9iSjr42ITpRIYlGzJzsw
         /X1INKGjfxUI5tfTgZTYDxGjD2WUAE2LvMtGtY7rAizpSux6R0MAMjWFp2lXGFv2zMIs
         TvrrDMQ/tS/cSUsAl4Nsw9I93hgarUizc+Z4qHNyBdyaTY1eXY3VZzS5coqDomdGkOCb
         qG+A==
X-Forwarded-Encrypted: i=1; AJvYcCUcTOL/B3sAaAFdOvZG1tkM7usamWwB0WEmSy9n4CLV9Fprqac4w5wnwaFa++w1N+FYZlqhbK5ByqNz2eQ/8n/XDp7P@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5XHyExvc2mBOBedKn83JcxjTz05ngOeeIpRjrQU+hijAoqehT
	aXU9/pYAnN96Md82ct5i34AniPSTzlwirF1BOwZIXXknEPUZZx6p4CCe0lojB8+0NqKGvFjSqWH
	AFFeo238G96s0dhAqhV/9whIgU0ABXQELP6j4ej9ToG9/NR8VJ4gs5GVyDlQvQhssQF8urlQluY
	iabD8=
X-Gm-Gg: ASbGncsrMHpk1oMyGaYTTOeViztSHLlQwoPP5+ZfO5O0Xu3isB9Go0K5EfwkZEuBi7e
	Pz1zS8EV4d2w1bmY7iocPonOzkYlSvnkyfa84Paot+Agba6pzEMux/Dx4NRPkdF38MMIC/gXi8D
	g6MJ6ZGptYNTFiJGHmZZp9oy64KfJ/HAq+4mICm8E5RV6jxFc2fEZ38qNmFUdA7It/D+reCxggp
	fjoNRt3qRTNLoxxRjk9Wx54ydZZmQOv3XkV8ML4UYGPDBMimwBn/9XDmMhyer7xXnnRHgsP1tdF
	Sba9exOOGu3QnmpAlErOkiqSRcdpsuVF7fkwUPaQ0yCVN86SLIhXTPiNysZPDBHbk2xKItQbEHs
	4gxyVmK9sax87UjZO/ghmacZrwyXyNCzAL4cBL7qjbMlEfe1UAM8BARNngWOVyA==
X-Received: by 2002:a17:907:7fa5:b0:ac7:c7cd:ac39 with SMTP id a640c23a62f3a-ad1e8ce1984mr600776466b.24.1746710319594;
        Thu, 08 May 2025 06:18:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjQisuRmo1A3ga06FkdeW6dRFUyT4fgAX707T6Omh7wPCOe7z/c9yRleLjQ2hsSAoTmaM+oQ==
X-Received: by 2002:a17:907:7fa5:b0:ac7:c7cd:ac39 with SMTP id a640c23a62f3a-ad1e8ce1984mr600773566b.24.1746710319159;
        Thu, 08 May 2025 06:18:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540478sm1081647966b.169.2025.05.08.06.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:18:37 -0700 (PDT)
Message-ID: <6d5a5cc2-a7b1-4032-82cd-0250f345dca9@redhat.com>
Date: Thu, 8 May 2025 15:18:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <20250507184737.154747-7-hdegoede@redhat.com>
 <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 8-May-25 10:34 AM, Andy Shevchenko wrote:
> On Wed, May 7, 2025 at 9:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Replace the duplicate code for calling the special Intel camera sensor GPIO
>> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
>> the sensor with a call to int3472_discrete_parse_crs() from the int3472
>> driver.
>>
>> Besides avoiding code duplication the int3472 version of the code also
>> supports more features, like mapping the powerdown GPIO to a regulator on
>> the mt9m114 which is necessary to make the camera on the Asus T100TA work.
> 
> ...
> 
> Don't you need the Kconfig(s) update to have proper dependencies all
> over these cases?

Yes I do, I thought about doing this already but forgot to actually
do it, thank you for catching this.

When I've some time for it I'll prepare a v2 of just this patch
addressing this and your s/then/than/ remark.

Since you and Sakari are happy with them patches 1-5 can be picked up
and merged by Ilpo as is, so I do not plan to send a v2 of those.

> Otherwise I am fully in favour of this change and the series as a whole, thanks!
> 
> ...
> 
>> +       /*
>> +        * On atomisp the _DSM to get the GPIO type must be made on the sensor
>> +        * adev, rather then on a separate INT3472 adev.
> 
> rather than
> 
> (FWIW, it's your typical mistake, it's something like the 10th time I
> noticed it :-)

Yeah, I'll try to remember to double check for this spelling mistake
myself, but I'm afraid I'll probably never learn. We have something
somewhat similar to than vs then in Dutch and I even do it wrong there :)

Regards,

Hans


