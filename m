Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8711AC88B
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Apr 2025 13:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809231; cv=none; b=VqTMU9lhNX/UvQiFXw9ht/MdVF8qvCkl0Ec6CON8F81uZRaF6zqzqKecdFnOJJSJmdD29zysVZPl1rPjYg3Fqz8cda37Zb3rrnoPdp9qt4rjQ9XzWlGaPlF9a1tbeb2yOBFujF5YT++4IQgU22Vq2mlu/CQ9AaSojqaikAR3S0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809231; c=relaxed/simple;
	bh=lmQ3ldP6CSiTlt7gNT7Czweqs9nShQBciErirXg2GpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Be/HxHHU/3oE/sqcCBfcEueiH/tO01HfAj+Ajg/Aso3cnCdCtT+poeM3F+jzhGmqCouEn1Loe22NDR9WpPDoFWjZHLqzyRyZVMtQ31HOJPljKQ+Zo/sFQydHDU8tYIEQJcvsZU5VVeLdMygIDdm3De7zAZmpXoNgTzTVFZTWMIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VNbDxygC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VNbDxygC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744809228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/f/vmYf/s2VSyVk3glayhF5GWaqEY9eUDhM5oTeVHKo=;
	b=VNbDxygCLB6qG7xNbOLuQc6eZFDShxgW1c8+024mwvIEerSh6vGqA1GCFvK/Ofwi1U1ava
	KmnBXXbNZnsHZ+LK6tPNanmVudHNWEY9zJjNYsQVx55g9AlCoBbUMMhEZzAMf+bdtgAvw7
	NDcvD2unIOqzChWxiLEyZZT7Rq85gp4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-tEHs8R4-MmOmHR81pECo4w-1; Wed, 16 Apr 2025 09:13:47 -0400
X-MC-Unique: tEHs8R4-MmOmHR81pECo4w-1
X-Mimecast-MFC-AGG-ID: tEHs8R4-MmOmHR81pECo4w_1744809226
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e5c1bb6a23so756718a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Apr 2025 06:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744809226; x=1745414026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/f/vmYf/s2VSyVk3glayhF5GWaqEY9eUDhM5oTeVHKo=;
        b=t56CwN+zqGcwpQ2iJr04CiOINhwtPjecYzuyexAayRAnASFCTW+DDMzm2ttMtrk36P
         1qXD9eJF6XR/sc3ZHgjak+drvgkVVCbvRwUG9X1SCqbdMBQOxXLp7rrzkc7eU1eY5yXH
         pMRSY4pGi2MmiDwCmlyZwQpJstCxWIqZzJvt57KcZ44tGAtA2XaxKUfrfSSsf7nCjvak
         wMaLgdkWXmZZGIJRXa1Df6IqgYQq08Kji9i26ZK26iaECWIXCgnwlWBIfK0JWZ6coiI/
         CAdoiJr+0s3FrDok/PKAF943JKmUxsqikPjIInMsDrit18cnMSXe3NCuhtyTOk3yNMSz
         4qEg==
X-Forwarded-Encrypted: i=1; AJvYcCV35wbtoI1cdpgs1G8G1CYIR3SYUCkii3jLwdga799bkn1ceUsDWaWZYb9t/yYNzhvZQQf0EkENhNfsHhzKtF5iVxo/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9KBsl5PrRuBvViKkO5tPnfToWsDiVDfxKf89pAu8youIgOX7Z
	WxrkhBOF8M1ykgGVdXKRTYDn63Va4+8d6pnLdEajdF439FCzKQlmyW3Ldeu7edGslTJ4m1Ev9tr
	84ESE+o28Hl+IjwFk+aF2gTayLYN7RmY+E9zWDzd2sEoersKniucJ1/6YncyTFm4laC6hftY=
X-Gm-Gg: ASbGncs9hZZrKz+ii8zpanYR98HZsB7uWSHISeu+zDxx+ccS4hANhgJ2mfGbmvgzNZ3
	08MdFD6+jOlCo4TmzeeTb2hT3rb7brKGsScvY7yOcgiqp+PkDCAdaoyARnFPaQIR1D/jW67S78K
	UzYPSIFpqIkyn6oE3LvrrXsrWzO9xBg90CQ+q8qh3Fx/QxXHbGxolCdWn7IB+wLk/PgBbtJp0HN
	B/xz1A3p8RGq1IpfWckX8nPVKTWdGLhM7SVyUR3ccaGA4+x8D+ecvrirXoZ+aMxNAjqwl27DWSy
	a8jjC83NCOLmsuHjwO1YSNqHkgcwC96D6DdGts9JwAaAfJDSsMWBREGMbMJ0mRRfsuRmB4jA4Sk
	xIPCG3bBpkuzSgDO+mErIW+sGjq37G17iwzfDZaBSe/oLh7o0/dD0tUkQzoLnEA==
X-Received: by 2002:a05:6402:34d6:b0:5e0:8a34:3b5c with SMTP id 4fb4d7f45d1cf-5f4b8195b45mr1422244a12.0.1744809226361;
        Wed, 16 Apr 2025 06:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3beiNBlh8dSqUfqg891F37XG78wGXh7xlDvWXrW5bC+SXcgNFeW0EHdb7CFeltdKYO7q5SQ==
X-Received: by 2002:a05:6402:34d6:b0:5e0:8a34:3b5c with SMTP id 4fb4d7f45d1cf-5f4b8195b45mr1422214a12.0.1744809225937;
        Wed, 16 Apr 2025 06:13:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f505728sm8711170a12.64.2025.04.16.06.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:13:45 -0700 (PDT)
Message-ID: <02ec820b-4f2f-492d-a9e8-b028adae7747@redhat.com>
Date: Wed, 16 Apr 2025 15:13:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] platform/x86: int3472: Add handshake pin support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250402202510.432888-1-hdegoede@redhat.com>
 <20250402202510.432888-9-hdegoede@redhat.com>
 <CAHp75VcJcPAEi2dhVnOL6Um78VEwT9DsvC+h20ZHZ0kdoPH--Q@mail.gmail.com>
 <cb7b67c0-e68c-408c-a0aa-c6a862590c52@redhat.com>
 <CAHp75Vfa6FHMx71tUqcXKxyOwdVCiRLiRp9Zs+-4Sj8CpyOTPA@mail.gmail.com>
 <CAHp75VdVbcMo+2ctJcax1t0Gp-eN=bycZFWPMzinmo_=Z1e_3w@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdVbcMo+2ctJcax1t0Gp-eN=bycZFWPMzinmo_=Z1e_3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 16-Apr-25 3:09 PM, Andy Shevchenko wrote:
> On Wed, Apr 16, 2025 at 4:09 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Wed, Apr 16, 2025 at 2:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>> On 2-Apr-25 10:56 PM, Andy Shevchenko wrote:
>>>> On Wed, Apr 2, 2025 at 11:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
> ...
> 
>>>>>                         if (ret)
>>>>>                                 err_msg = "Failed to map regulator to sensor\n";
>>>>>
>>>>> +                       break;
>>>>> +               case INT3472_GPIO_TYPE_HANDSHAKE:
>>>>> +                       /* Setups using a handshake pin need 25 ms enable delay */
>>>>> +                       ret = skl_int3472_register_regulator(int3472, gpio,
>>>>> +                                                            25 * USEC_PER_MSEC,
>>>>> +                                                            con_id, NULL);
>>>>> +                       if (ret)
>>>>> +                               err_msg = "Failed to map regulator to sensor\n";
>>>>
>>>> A copy and paste mistake? Yes, I know that they are both represented
>>>> as regulators, but don't we want a bit of uniqueness in the messages?
>>>
>>> I actually did this on purpose to allow the compiler to use a single string
>>> for these saving some space. The difference of which case we hit should be clear
>>> from the earlier printed (dbg) message printed above the switch-case.
>>
>> I understand the idea, but if debug messages are off, how do we know
>> that? Or err_msg here is also a debug leveled one?
> 
> FWIW, you may use "... %s ...", regulator->name (maybe, I haven't
> checked) or similar, so the format string is the same.

That is a good idea, since I've already send out v3, I'll do so for v4.

But first I'll give you some time to review the unreviewed / modified
patches in v3, so that v4 can hopefully be the last version.

Regards,

Hans


