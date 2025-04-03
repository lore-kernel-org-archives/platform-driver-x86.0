Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F73161320
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Apr 2025 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743673421; cv=none; b=S78XmnSMSHRIXQDEP51dD+KXfXx+gn6EeDY+jPA6lKgj+ch4IU5elL110AkDTsBeKumR0vBhPzOFKh+Z2GrLE2lEnelL35+mbhGCeO3tVR2h9r5W0AYkbhYANS9f2ZreFaUISOKqHolFAzavk9iMSbF0Say5cUBFE8/3onwrYlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743673421; c=relaxed/simple;
	bh=v8ilmI592V+xwyPk7WS1ZX+wOm0r7ZxorpJ8b1C6pnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YSCOw3fsQZRLGfOstBboFegwBP5KZqipARgTUfgjfau2EuGJfuwwQgGMwQIVkCfdJutZnJqFyIi1mndVOjgQZlWDE9A270fOU7UF2WddDSWr5SMLnKxq6OAlbum3lPTp6ri6zGppTnamsn32ckgaKoJ+us+NOSlbaC12mnbo2Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F+yW9LCF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F+yW9LCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743673418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Goin50SWeyCOwvGGYVPwfg6NtKqtKC6dQtyLDWJYI80=;
	b=F+yW9LCFRe2Ls1m3Qpjw+XMJyRG3xFtdjjJQxIwanoMZVso0c4c8t0+DN25xmEnBTk64TL
	ZAocjA+6WWc4Ls84S8okQ2w8IX6JBXsb9D/779nxs3RHXoc9uV3Q3iKEqgydMfYJd+jYdA
	xc2IhGjB78IJoWuQNMpkO1o9yzN0IMM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-Jgsk9vT1Oq-lJIjzrJ-g8A-1; Thu, 03 Apr 2025 05:43:37 -0400
X-MC-Unique: Jgsk9vT1Oq-lJIjzrJ-g8A-1
X-Mimecast-MFC-AGG-ID: Jgsk9vT1Oq-lJIjzrJ-g8A_1743673416
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac384a889easo165357066b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Apr 2025 02:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743673416; x=1744278216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Goin50SWeyCOwvGGYVPwfg6NtKqtKC6dQtyLDWJYI80=;
        b=JfSdTEUjccKerk+nSabIlLG56l2Y1AIygzLzO2AfDYnEEwZOace9+K/mNMl88Ni+vJ
         gmTumwZ8eOtCCMb6TqBx80ckSnu++aZU28iSVsq8Wy9XJa4UZOpswLD58xDZ+Vb/l/4V
         E318Mw1xBRxSmYw3MLOm+++Zbqfay13wq2mKtb+BUNjzPoUKi9OBWeJ9qN4mFvBg+DE5
         spl7znDjKIr2hgNpLPjYfWWma6sFHjLudAW+bnopM4D2KSbxnlFLaAmeYuaqLMe2Zo1b
         C+6ZkhnOd/cjJ93QjYPcDr8HZ5/aOwAYk6DwEZ0SPngSKAnpUCShi4bJ1XBq5oDxvuq8
         oxyg==
X-Forwarded-Encrypted: i=1; AJvYcCWe3RIu33s3qTSxTnuEuDFzYfZ5fWS3Gk2LiP8pfwE0aeQLPzKt5VGCaJBiDQndz4daj6Mu33tknMoCickUxp34eUen@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4xTUgH7gOtjbA9WPJw/zuLMMXcS+vf9lwIj/iPvWOJOjIlKMk
	RGu+7hlqsMf8VywpxenZYJRMLH/FD0U411cAZ5PK16LTIiFlagVSjSBiEEcbQKfWl+ODqTKJ99C
	w+XY2X3cJ16F2AEtIeNKeKjOoE4aUyD1Rdw74q5/iFSRMtGEZ0+HRgHqpopjXLwHunbe8eS8=
X-Gm-Gg: ASbGncu2eWdh00YGptAHKZatl9Ki9v6xMB26986EQA6BTol+FieAj/E75ofBZRFlptR
	0tmgFFvVOLi3oB52V+iDIsfqIQiWkNXxxZTth0No2KDS6sVKB2ydQCDV17KzrOsII/1WoHpI3nG
	2KhA8igfR2X9xdvWrIpmZ7BNDBHIwzd8Uv98kWVv9Mo9IdxdCXkFP+sz1rQHZ6nzDxuiph9bVlO
	RAtc/DvxJQDlm+ecunTU2sdVGlYTKHT9rp4Vr4Yi6nFajLPtxWQazFZTLar9wA8VfjTJogzynWd
	S15yJeD7lBtyhTzEyx5kyMCZA4i9ldm4CgTXleUs4aVJtqWJ34KsQ4wdX/HS4q0l7idpFecImlP
	wZRmoqcqLAj51XNcowxRiiLz1rgr6INcajcpjik0X3aUmDF3VwEn1RHLMXdUxsrDIeg==
X-Received: by 2002:a17:907:1c90:b0:ac6:b80b:2331 with SMTP id a640c23a62f3a-ac7b6b486aamr212130266b.4.1743673415716;
        Thu, 03 Apr 2025 02:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZofBNIv8kjGjHbd5+LEA3qJQ6UovrE8gtp60Nk4m0SPj23PzTUOBJTvffRTXHgFwVRLQaYA==
X-Received: by 2002:a17:907:1c90:b0:ac6:b80b:2331 with SMTP id a640c23a62f3a-ac7b6b486aamr212127966b.4.1743673415292;
        Thu, 03 Apr 2025 02:43:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01bdf2bsm64019166b.162.2025.04.03.02.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 02:43:34 -0700 (PDT)
Message-ID: <474fe098-3cf0-4207-92a1-e033799a04af@redhat.com>
Date: Thu, 3 Apr 2025 11:43:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] platform/x86: int3472: Avoid GPIO regulator spikes
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250402202510.432888-1-hdegoede@redhat.com>
 <20250402202510.432888-7-hdegoede@redhat.com>
 <CAHp75Vcok+-NPEGKFbZawiJcjhgJK5upbyfXfCEtezYiMspvRw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vcok+-NPEGKFbZawiJcjhgJK5upbyfXfCEtezYiMspvRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2-Apr-25 11:04 PM, Andy Shevchenko wrote:
> On Wed, Apr 2, 2025 at 11:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Avoid the GPIO controlling the avdd regulator being driven low or high
>> for a very short time leading to spikes by adding an enable delay of 2 ms
>> and a minimum off to on delay of also 2 ms.
> 
> How 2ms was derived? From experiments or is there any other hint
> (Intel published sources somewhere, etc)?

2 ms is the minimum time ovXXXX sensors need to have there
reset line driven logical high to properly register the reset.

So that seemed like a sane value to use here to me.

> The code looks good to me
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Regards,

Hans

