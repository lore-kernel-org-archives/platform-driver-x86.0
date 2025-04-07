Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673CF188596
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 13:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033778; cv=none; b=ZZjuCAM0QNA8Gus4lyiFG0rS9DqaV994JFZchhkP7kSBE61Y33o3Il+F5gTZHUdJK/ec9X6J06E9NwbBYpk1WvadDyE6ZvpCW+q2A+nx0VNzFOfGjpNIEJuyOtjpWJ9f3gUhzpmB8phtvenh8hc/AI1Bzpbm8TDvSF1XeJTFf7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033778; c=relaxed/simple;
	bh=M++UUTDzRKImZQdqbhoKv26o3chBYX3cA5ideJTdPFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tttPPb6IgAswxRZ9paAEpqUOwir4X8p/zVivVPTqw23DJRLoMTn3nWHHbZ8SEzHMWcjsjrS9ZaIEhBzRDTvnRuf/KRjRVnNRPAAGlc3zoeV//APMjxY2Eoylxr3YuUYCxZpvSaSQkZp8HKHXXA3k0cXpop3ffQ5gmmYYQO7BWOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FdxEgxTa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FdxEgxTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744033775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hCP1rGdk3Dh4Y0nOzYs0ZPOkBRfiIHmAKrJSH55swt4=;
	b=FdxEgxTavYJx6PCuwn8CcvakGDE6pNQExzp/SS1E0adEFj3qLP3U872OsO23vcHmim9DDG
	ZAITIIi5VdlQYi7FgUZu5N0Ti+J1vixICKnEuUNqEgzPYqghs9F+EzdnABl/Bpziac4GJX
	mfP6ZoTI7iec0Lcwod/ULGE+xhc1hvg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-LNth603mOgOK_Mdx1mywwg-1; Mon, 07 Apr 2025 09:49:34 -0400
X-MC-Unique: LNth603mOgOK_Mdx1mywwg-1
X-Mimecast-MFC-AGG-ID: LNth603mOgOK_Mdx1mywwg_1744033773
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-391345e3aa3so2560555f8f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Apr 2025 06:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033768; x=1744638568;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hCP1rGdk3Dh4Y0nOzYs0ZPOkBRfiIHmAKrJSH55swt4=;
        b=ZpYpYPzycfprxkMDRiQGffwrVB48jiee60IwCHBPtTL088Tq5K6lTehdnwh3PXSZeK
         USYKLa4/439s3cey8aY5+a8gq0+rxHSPCe3h62LbNXEBIHY5CJxeoUwE5K3BgYtw97u/
         GeNekHavLyFKldhyPBB7Hf3+4DFMevKe4jir81kISeeBGve6TBH1D710Az1uK+DZQ26o
         3f3bBuiNyYJ60LLojKbI5WNgGxZRXMmSqrASdZHNyT/OxLIaxzzL8R6CbB1JJlRh6y/h
         O6JOtbsICzfoVMM7swmHYJBWBpJ5KoG7Rd5aOJdhicZ5XM0XXavDTyVK1JLmmxbdHYyp
         Iyzw==
X-Forwarded-Encrypted: i=1; AJvYcCV6RC9OrOsJVumgzJM+Usqu0YKUrwUptEj9tcpTFb9RDe2EXFJ3ZVGu/juDnNi2nn9oTIqHPCS4oWqcehuu2W2nIxJX@vger.kernel.org
X-Gm-Message-State: AOJu0YzwAeDkAuhte9xDjvl7OVndlFa09uYd10uO/aSrxSuq/IjQK/t1
	NXnJCz0p33jNitkuThud3dUvDRL6HRo6X/MnMpYvhLEPHvIUjbUvDCmBYWfV50Pl3H9g8sQYD18
	4KG/52M7jjoI30ZJcrBBaq+okR1ufI7mq1CCwRl+1ujFesFwSz0wVtECUXbmUdUkvC3Qz4KeJ+Q
	7S+io=
X-Gm-Gg: ASbGncupAyxhjF9yTsEaJI41Op2V3ttNqs+w01jMuiwb4Jpo8Yf8IV5P/AbPmogyaH2
	ZAy3gIwBq7dmkHQ5vzi56KsUYi374fZiospGO30YN0lOodnbnEIZJvBGkMjMxnrY5PCtJm0hMjQ
	eTs2+bXussN9YManyiUDkz1Pyah16/HEJ+02Mn96SIwKXUC/m+dPx14PAC8LL15CRCclVmLG24x
	KdCrP37iUfZNrUwLr1W0WHAse1zRZJa7KeM5je0GXZ9XF85KhR/Sxh0iVnikXPAMWtJQzHrC2t1
	KRPqk/5m2VVmhMoJl7E=
X-Received: by 2002:a05:6000:2281:b0:39c:cc7:3c97 with SMTP id ffacd0b85a97d-39d6fd3646cmr5552091f8f.50.1744033767967;
        Mon, 07 Apr 2025 06:49:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtFvpPSvoCeXkH8Cli95ndUJBw7IlJTO6Zx62PTij8gWVZUajgEetyKCS9u+A6dctp5wFYIw==
X-Received: by 2002:a05:6000:2281:b0:39c:cc7:3c97 with SMTP id ffacd0b85a97d-39d6fd3646cmr5552081f8f.50.1744033767634;
        Mon, 07 Apr 2025 06:49:27 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b9d55sm11912823f8f.42.2025.04.07.06.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:49:27 -0700 (PDT)
Message-ID: <ba58d467-1525-496b-b8ba-b14aa04307a1@redhat.com>
Date: Mon, 7 Apr 2025 15:49:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: x86-android-tablets: Add "9v" to Vexia
 EDU ATLA 10 tablet symbols
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20250407092017.273124-1-hdegoede@redhat.com>
 <Z_OoouVSgw1xOpur@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z_OoouVSgw1xOpur@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7-Apr-25 12:27, Andy Shevchenko wrote:
> On Mon, Apr 07, 2025 at 11:20:15AM +0200, Hans de Goede wrote:
>> The Vexia EDU ATLA 10 tablet comes in 2 different versions with
>> significantly different mainboards. The only outward difference is that
>> the charging barrel on one is marked 5V and the other is marked 9V.
>>
>> Both need to be handled by the x86-android-tablets code. Add 9v to
>> the symbols for the existing support for the 9V Vexia EDU ATLA 10 tablet
>> symbols to prepare for adding support for the 5V version.
>>
>> All this patch does is s/vexia_edu_atla10_info/vexia_edu_atla10_9v_info/
> 
> And period :-)
> 
> All this patch does is s/vexia_edu_atla10_info/vexia_edu_atla10_9v_info/.

It feels a bit silly to send a v2 just to add a period to the commit msg.

Ilpo do you want me to send a v2 of this series?

Regards,

Hans


