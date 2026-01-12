Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C093806B2
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jan 2026 18:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241273; cv=none; b=F926od1jJs01yo+Hbs1vGo0/VrxtVcwJHIe2wDSd7+b5OiaB7KSr3btZ0o1kQqUHI+zIlPrGHRaSIMlZm6GNlr0tBX+GENeYFVBsNFa4W1qaD4gVOAw8hgWMEM3up7ZUbJ5P2eleCvYSjjPzJixsgRdGK0VcjSrBj3I+Mt6EIGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241273; c=relaxed/simple;
	bh=dHrr/T4aX+vs3oAgOvAPZZQy7mi8rDhEwAcJ4vKtt48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sG1pCIUK6r4USisEEj/awd0Lta17WLIJDjScYyyV7zQkvLOqGWATnS46f37Gt/IPOjpWtnjaqSrFdjdaFpdBarCZ/Sxz2FvVfEmyhbxw+zQJ2ziDj47IlfVzpC5lqqj9bddY7NG0U12bUo+jGu/PqZjqCCO5ZvPgcXCWzcZSx8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccDCxXBY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccDCxXBY"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0bae9aca3so42976395ad.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jan 2026 10:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768241272; x=1768846072; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDGQRAbPUjfkXaVJhLTd0EOsqSoToEi+iTNTPo6suIg=;
        b=ccDCxXBYhuF35ZvvT//IXUBYFG5RQ562qWvlVHF0KxTlZgMF2/fBrYhuPVTiiHNz2r
         yFVJovT+sUOPzu0DVGKbfN/CpH3NIR7DVIfkem+4VxjDz8TGjCvfbMnVEyMK8fAKSVoR
         z/TQYsTlkgM2Sor3aWES2vEgKdT0P5sNff55KAPIgJtJ/n5DvCHso7vTi/jiL/xn6r6L
         P7d8TnDWL7dm5snN7ESHk6zgqOoBV3fVuB10T0j3xdllJtCzQU3Fq/2qpSZOhg5wnt9x
         HCRawoUcJxy3U3dk9Y0j5moAtKv+PsgsBenN1d7daR5u+Vg8+sSInp2A6eSRX6HyoroD
         qUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768241272; x=1768846072;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDGQRAbPUjfkXaVJhLTd0EOsqSoToEi+iTNTPo6suIg=;
        b=uT/xG99qGXEXbyVbs2/nxFkb8usaQKHWl5Q+pcf5VXhSDgaEfGOeb7WPI5c1sLw1mr
         t7TL01EsW7LiKk3+e86S1aS88vT3bztbTpFMeHb1yiX0Uqdw+SQPXhzvG+SXGcH7Bkr8
         AhSEvdIr5iYLhDXrG/MMQ5fYxit40tz6OyBIWdyGr7lQ+kJd6210Ibm8q1hNJlOonvJd
         ZA5xG8TXmcad+LashZ8fcaTBD91GtYRtlRRv5Hz8smIvVhlhMv+rQhJibFzNIL16Wq2T
         UgjaWxni0gDfPz38ep94NpEB4LHUHRjds6YGDk3YKC3QMLIdH6hS04H5l1rFhb+y18++
         L5SA==
X-Forwarded-Encrypted: i=1; AJvYcCXAQZebroqx8KjkPXZJhi0WYhvMOfG9UQN8V8KhfM8liBXh9yQQLikV+T3vGn7uo7oKGe1wUqutElUf4bXV9FbmN2pQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7KltrlU9oSjsLKy6bsrw6dslGosvvwOloEwxJ7FQmrApa/GYN
	QPShkhhz9G+Vle8LNR7xK1unACNjw1lPpQkvOCdXHuRMFQVUUANb/iQ0
X-Gm-Gg: AY/fxX7zDwt21/D6exTM6YvuU0I2iZfQ3ZDeCL6xh0Chy1IsEnyUyk5Mg7vjrpS3haG
	HIEC7A8/1y9xhoY8Pp22GYW4x/jrj49ttipKZto7AoCDUh6nDV5fLj/NioC1N/aC+uJNYB5XX1Q
	eUurSTkmXP31En4jDcHnrnFd5J3891zwaXe8mZ1mlBDX0t1kDlM2a92ScLDWBhA6LOUVmiDhg/o
	EQQTU6buDV38Fu9CnWTTrh0sB7eOTAkQ7z/pTkCPZT8WcKGANf6WY1ihkzRzsCFLwbjadxFn8vw
	RFUI0z3nTIWUwjHglMBsm8u9iqzYbGLoumLHkOeKU/W/fU+EWaiBm5Hn4V4uNmsiwISvdEC8G9A
	c3LaUFXcOA2EXwRW6NPnR1F/EDkRAhcC8BmXX82O78+xxrcy7dbyNtqsFLVMYgkseLI3BEpsgRw
	TsLVkF/DnzrzVDCAE2JeE=
X-Google-Smtp-Source: AGHT+IEUzxrN8NZqXvPH5JJMBYF3btzaRQp1HHCq9owJBNQYe6YmOBfDUYXF/ZMNTxgE09jJO72Ljg==
X-Received: by 2002:a17:903:234c:b0:29d:6b8e:d565 with SMTP id d9443c01a7336-2a3ee4c0e80mr152917325ad.38.1768241271894;
        Mon, 12 Jan 2026 10:07:51 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88fcsm178881325ad.83.2026.01.12.10.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:07:51 -0800 (PST)
Date: Mon, 12 Jan 2026 23:37:43 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] platform/x86: hp-wmi: implement fan keep-alive
Message-ID: <aWU3oEJinHyO__1X@archlinux>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com>
 <20251230145053.516196-1-krishna.chomal108@gmail.com>
 <20251230145053.516196-3-krishna.chomal108@gmail.com>
 <6b2be55e-dcfe-74b7-d8ca-b78f49cedb7a@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b2be55e-dcfe-74b7-d8ca-b78f49cedb7a@linux.intel.com>

On Mon, Jan 12, 2026 at 05:14:12PM +0200, Ilpo Järvinen wrote:
[snip]
>>  static void __exit hp_wmi_bios_remove(struct platform_device *device)
>>  {
>>  	int i;
>> +	struct hp_wmi_hwmon_priv *ctx;
>
>Can't we just call this priv everywhere as per the normal custom?
>

Yes this was a mistake, I forgot to rename "ctx" to "priv" in v2, sorry.
I will ensure to fix this in v3.
