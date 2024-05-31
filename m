Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0778B7E101
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 May 2024 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717136755; cv=none; b=l7KKWpLdfp+v3R9QVE6CZ76xFfVVrTSMykllF+wsD327LOCrCIdIUMM70j6DQ/IDxv2k01D8mXBC/o7Er7JwLHssxo+72zPvy8maC0WcxwRzafr5R6qmiCtrZDp5czkYFjEa9Ff1qDBpjyMx28hQjsBbwkG5y84eRR7w6x64izE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717136755; c=relaxed/simple;
	bh=LPn7pI3TB6DjADObvz3zF7wOMCMrEV65Mx1A5wlKOSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOAjMTx+IwbglujSGxFWjjeUyTOEJ629TKabDPzb8/AID/fRW0tJD10F5Ed+LuQFXicoseF9YzYBvlqxKR/glt70pfXzy2GqfnbKgEpaRhKlXbwXCLIas0BlZBkKWJ0ejvzYYV5Kn6UMdXTZkikMcn++Mc0W/nEUGW6arBrPY4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I+pr1tFc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I+pr1tFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717136752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+l7LmyUwwTZBpj4C4ev00SpK5zOV8Opc7l/5TGxNhU=;
	b=I+pr1tFcaI+0Xp+J8iVEq3j4X1KSZKAiA6r9dV/0oJac0T0lpyKngpYkpR8WOBK17PROcI
	j9xbHehTDQB2ZyBGa0euvvDWv5yu/bwntmWzOFg8vONXc4crC1W+84AdIjTHJblUHpDz7z
	Ci3Gb1nonDEmYSR9ssBMmstYsqnMv7E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-dKmjLz8HMKKPFvx4Tgi7MA-1; Fri, 31 May 2024 02:25:51 -0400
X-MC-Unique: dKmjLz8HMKKPFvx4Tgi7MA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a6265d3cb78so74436166b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 23:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717136750; x=1717741550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+l7LmyUwwTZBpj4C4ev00SpK5zOV8Opc7l/5TGxNhU=;
        b=iRsd6fw5iSnRliG33UDwaNRt+rSI795rphkWxgyyxDJvhkuYt7MoI+EohBhzRlhwqm
         FQlkSqbR4k8orYobC7cc7F2bq8keMfDWoNeGLDq/VR8RevNhMtPl5G/JqbjseJ9zcKIS
         oWOTY5BzqGtYCDrpWDAN4xZzKt3PabVOqjpnZO/f8+MmmsFg9821zhZJlINBIi30I5Gl
         l/Kfzx1zSSafqDFnMNGaRBh0hFbMlFhsXmCTV9zH6M9fk1NoYA4d+O22mE85i11WBTsF
         bpQn0xmxm825BeplyZXSvIE4qdmsQQKtdBEMEGL+t3AkKP6kKcQEp94QNx/xgsK8iIZN
         /azQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH6pmWcSs39U+3nYOeST6Gwz9iUU+yZJH0QrTE/VvVuShyJpyflGB0obzrbzrWjhiygaK24z5CUWN8+fN8tZZAHtr6umIwqwigcW7TTDGZLQOAgQ==
X-Gm-Message-State: AOJu0YzZU9ijUMC/GuiLZpIWv84XLJMOkr3cfLgNWaI6BzOk37o05vQz
	OOHYWEFCPQ2Im2YewSQvsJbcsI7jJWplWvuPwADv6wuo/sItWam2ex+t6j7mnBYumj2SVg/HaNm
	kpdRfejMBJbL9agOrtGmp+1CJneS/aywquLAiDBmoCNa9ThSV/xUPjP5s1qlinE+nFMd3Bfw=
X-Received: by 2002:a17:907:b96:b0:a68:2bf0:91 with SMTP id a640c23a62f3a-a682bf001c3mr46431266b.31.1717136749988;
        Thu, 30 May 2024 23:25:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxNCOep59GnmgfXZDzgXlozMP0mdaEajrH8u0WgMFInneMlj0iwoHjCVoi7d5d2UYQjVPg8A==
X-Received: by 2002:a17:907:b96:b0:a68:2bf0:91 with SMTP id a640c23a62f3a-a682bf001c3mr46430166b.31.1717136749485;
        Thu, 30 May 2024 23:25:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67eab85c65sm51030166b.160.2024.05.30.23.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 23:25:49 -0700 (PDT)
Message-ID: <1762dac4-184f-4c50-9577-62eb3408e4d4@redhat.com>
Date: Fri, 31 May 2024 08:25:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Input: silead - Always support 10 fingers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20240525193854.39130-1-hdegoede@redhat.com>
 <ZlK4ar5rnqW7F_4e@google.com>
 <9103e7ae-70f4-4ca0-a18d-322bdedbbdba@redhat.com>
 <ZlkRzbF_T8vgzxcr@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZlkRzbF_T8vgzxcr@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/31/24 1:54 AM, Dmitry Torokhov wrote:
> On Mon, May 27, 2024 at 09:46:54AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 5/26/24 6:19 AM, Dmitry Torokhov wrote:
>>> On Sat, May 25, 2024 at 09:38:52PM +0200, Hans de Goede wrote:
>>>> Hi all,
>>>>
>>>> The first patch in this series stops making the maximum number of supported
>>>> fingers in silead_ts configurable, replacing this with simply hardcoding it
>>>> to 10.
>>>>
>>>> The main reason for doing so is to avoid the need to have a boiler-plate
>>>> "silead,max-fingers=10" property in each silead touchscreen config.
>>>> The second patch removes this boilerplate from all silead touchscreen
>>>> configs in touchscreen_dmi.c .
>>>>
>>>> Dmitry, since touchscreen_dmi.c sees regular updates I believe it is
>>>> best to merge the 2 patches separately. As long as I know that patch 1/2
>>>> is queued for merging for say 6.11 then I can merge patch 2/2 independently
>>>> for the same cycle.
>>>
>>> Why don't you merge both of them with my ack for the silead.c?
>>
>> That works for me too, thanks.
>>
>> One challenge here is that I typically send out new touchscreen_dmi
>> entries as fixes. Are you ok with merging the silead change as a fix
>> too ?
> 
> Sorry, I am not sure what you mean here. Do you mean you do not want to
> wait for the next merge window and send it earlier?

Yes that is what I meant, sorry for not being clear.

> If so I'm fine with it.

Thank you.

Regards,

Hans

