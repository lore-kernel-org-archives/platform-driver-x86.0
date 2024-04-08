Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246C15380D
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 16:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712594658; cv=none; b=mzPUN6zYGULh9Py7Cb2c7PseuDpBadylCSzbw8fkPO4vZGTUDdNuh5zmTfKQyrSu8y3pYSN1NZu7v0z/8DmgNDx7uqX46RCrAM3D+3rUj2BU0azQV8x/eiGIYZsMyxDgFjbCtnlFzaApblDnhXF9oqAKl0iqcaAsyYHl06Gj2CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712594658; c=relaxed/simple;
	bh=Q40Nhtp/UWn1hH00vguHV+FRxjGoczqNGvdJjoUAI8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbiQdT5QircqZmNL2nB4Mt0TAMS5JKTU9axynL1c4v5W+2yn9+FUqkUSpcysaW7ZsWWuA1iZhYYPHNAP21RHDOoaIZL1KEw2fxZ2mtA0TyotSZv7cOLfqjn/Dt4Ea1eW7IRF44Mvf0/ohdNca7QYzvqOiY/ABVh62uILKvxpJ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UMZaVgnD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UMZaVgnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712594655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XV4RreSgwFZdRc94BiI6ZJcKw4YdyaXN3vX9jyesmAw=;
	b=UMZaVgnDg7KKl4GRgqAtKXC9GLpqW91NI+z5Fngzw85ZcGXRbG5Nk1vT+7VjAUPH7ISHDn
	w+Qdthb/anO4vIqndkqIkG8cKWsf+R53BZOyIvR+FUyJgrxa6uZ4qD2s/PR67jshBZxIgN
	zXCeF39//Q6DjikT21QMy/hU6kN3dvQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-CPtrOcfeNbe1d1gU_5swww-1; Mon, 08 Apr 2024 12:44:14 -0400
X-MC-Unique: CPtrOcfeNbe1d1gU_5swww-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a51aec8eb93so174827066b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 09:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712594653; x=1713199453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XV4RreSgwFZdRc94BiI6ZJcKw4YdyaXN3vX9jyesmAw=;
        b=Ox7NMBO3/yss5D8HYxtEjbeZy8Yg+eKONIuygr4EbFoUlpTqH5nWyHXdqRV+GiTMwN
         deyEFML/eYE++Bj1l68/9ak5toU/1G1Viit4TuLpUz6affMzG+HfUW4vpIIV/M6E4/tU
         dWM6CpxDv8qMoQKVVFyt/vf+rHHMbida5c78KFM0wx3xur0sOqCwz20Avqg3QQxINK3D
         BUBdghTl1l/82nIEZIQ9x39yKrD/Ane4NikNfANWVTIYPhKj0HdDL+kJJWabPyW3/0er
         gng/w/Y5knb/uabnPxKxCoeeFzEfom1hGqULMg30TyN+De90CDZKx7yfObokSJQxSWF+
         NiPg==
X-Forwarded-Encrypted: i=1; AJvYcCUH/2LsrI2rOPCuUIFx2RdvcmVQ6ibg+uHXBGto44saujnBywKqb3dr3emByOykZsLijSYRZdO92RxvpEpPdqTV2bbFLZnNvl1BdyexjuXizNRIYg==
X-Gm-Message-State: AOJu0YwHOJIe7dhDQBqo9qrqwphb7Ts36kyWL1yoc4TGeSEGcDgvGwt5
	YWb5OrJ+AOWKXGdaPkMbxF4nZuXdwkXSvi3B1kRZjlR++QxJOZwyM7+CwxlqIiH5fzrWLXlSkxu
	+e7Emkv65SrAgzYb/VLubtvzpsxSEdDNUUnAkwJD0A9TPV4aO45yudGyldjH1ZvocVt9J1l++Mh
	HKJKNEKA==
X-Received: by 2002:a17:906:3905:b0:a51:7b1c:bee9 with SMTP id f5-20020a170906390500b00a517b1cbee9mr5297463eje.25.1712594653371;
        Mon, 08 Apr 2024 09:44:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwjFOq6vfdIcsTUW/eNVMy11vELfDTUWGpsCA0S6k41h4Lp77wv3jj0sxF9gC9zwYfLr7yww==
X-Received: by 2002:a17:906:3905:b0:a51:7b1c:bee9 with SMTP id f5-20020a170906390500b00a517b1cbee9mr5297457eje.25.1712594653082;
        Mon, 08 Apr 2024 09:44:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id oz10-20020a1709077d8a00b00a4e533085aesm4581845ejc.129.2024.04.08.09.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 09:44:12 -0700 (PDT)
Message-ID: <667c44de-7c97-4f97-aca2-19337cadbbbc@redhat.com>
Date: Mon, 8 Apr 2024 18:44:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: toshiba_acpi: Silence logging for some
 events
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20240402124351.167152-1-hdegoede@redhat.com>
 <171259093806.17776.3713671881492753491.b4-ty@linux.intel.com>
 <451bb318-aeb0-466f-9507-4983dcfa4858@redhat.com>
 <55639aeb-09c5-b411-f97f-dc4ec7b43d05@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <55639aeb-09c5-b411-f97f-dc4ec7b43d05@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/8/24 6:39 PM, Ilpo Järvinen wrote:
> On Mon, 8 Apr 2024, Hans de Goede wrote:
>> On 4/8/24 5:42 PM, Ilpo Järvinen wrote:
>>> On Tue, 02 Apr 2024 14:43:51 +0200, Hans de Goede wrote:
>>>
>>>> Stop logging unknown event / unknown keycode messages on suspend /
>>>> resume on a Toshiba Portege Z830:
>>>>
>>>> 1. The Toshiba Portege Z830 sends a 0x8e event when the power button
>>>> is pressed, ignore this.
>>>>
>>>> 2. The Toshiba Portege Z830 sends a 0xe00 hotkey event on resume from
>>>> suspend, ignore this.
>>>>
>>>> [...]
>>>
>>>
>>> Thank you for your contribution, it has been applied to my local
>>> review-ilpo branch. Note it will show up in the public
>>> platform-drivers-x86/review-ilpo branch only once I've pushed my
>>> local branch there, which might take a while.
>>>
>>> The list of commits applied:
>>> [1/1] platform/x86: toshiba_acpi: Silence logging for some events
>>>       commit: 0dd50b3e2c3d651ea972c97cff1af67870f3deaf
>>
>> Thanks.
>>
>> Note I had also applied this to my review-hans branch for for-next,
>> I'll drop it there.
> 
> Okay, I even tried hard to avoid that by checking what you had in 
> review-hans branch but we just happened to work nearly at the same time 
> so it didn't help.

Yeah no worries, dropping the patch was almost 0 work.

Regards,

Hans

