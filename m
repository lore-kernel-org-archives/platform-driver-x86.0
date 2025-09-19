Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5E32877F1
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 21:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758316247; cv=none; b=jTinsHdmo8e4qDAHrdYRSkHCGac0ION8wtpzopkaFloKGeyn/4ZVvC1bWuhlOVdPlk6imJ9U0DYdI1oHpiKANiZcq58R1nkwfivWjMusQJWvpsu8nKejhoroBN0aV3MmQzWygzS1rtyzEm3tCjEb6R5achjQcSAU1LAM++oDD0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758316247; c=relaxed/simple;
	bh=YVYXE4rV4dVgKRacn+kuBCprO8fk+dh6/f0Az8rlxDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMgp9Y3Kpl8V7Z+9RKjdmWTN42e/VZORCHawxlwQ/H5NxSYsdoT8CFI895QwaVnWnjxhghb/JT1uR/5lPcE1p58uDj29Yczl7R+d/6x44UbxtBdoXLw9WZc3/CMxnN3gYqmIUIlhWiVTxv+Wlbr0Zk6QQ/c6++9bVIts0g+e4nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQvsmWdm; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQvsmWdm"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-323266d6f57so2642236a91.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 14:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758316245; x=1758921045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SlNr862bl1akUsT+mERnh8HAtedZMp/ZdPCkCwTeaR4=;
        b=UQvsmWdmbLlDoNs2byM5Qwy0ATouMP4kglkYWlfh/WuGeB4FpGUhViBOIjiP6LjGlG
         0VWfeZWfPNb/kDMvm1q/lfDM98feZhdKK85UJcMqCXwZQYGhX5FwUHuXVf19WrfaIWLQ
         1yygf7gT/cRj7dA8kb2uP6yJbxb5zfiImCVfM5xwECJMpgMSFZOKWuyYSOHJbc8iijix
         WU4bhZct1g/7R4uOwVxPu1XEEIxy2eWIlJ3PvJ8yoDAPuW6r0EQISBnk8U0wRG94rbbP
         eqHODppn17VtNxmD9FGKcjJzHV6FJi1Tasx388Du3Fq5nkVW37GsJQ9ew9QAdHtRhL48
         W39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758316245; x=1758921045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlNr862bl1akUsT+mERnh8HAtedZMp/ZdPCkCwTeaR4=;
        b=YbeM9tR9KrOaMEdMg9qvSXBQEvRZ6sh/Lwk58Ow9giAatYAK7eZVQbLagQ8xX8YTCJ
         napAWhjBFUi8OnXi8S0gkGl6OfE0nNaZYX57+YFOf5QoFpmYRaS5iUFtvJaudZzhruCH
         y2FXaUMacN4tuhpb/6GgYguqgFYeDT1lXnbGHz5uMy1Q8HXAPFYRqZ4jKLKH8h0d3HS7
         koa1yy/EyjG4OehlwLJ8rrgAAiwHCCnSim1CMROaTQXdM+xbhRXYTkRorn/RrvrPnDEB
         lTGwQ703dkxkJbKJxOXzq0M/S17q7lh5KSY+O8zUrMp7YuTdX9qW3OHEVCrmxEhNB49J
         f08Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAH9J87YasSPwu2zIbXUKlssFdvAAb2HrYljzjGolmifve9OFcE++EEpz8RJ1X3k34VHRqtxR8JMCUQNQG1SxjkVfS@vger.kernel.org
X-Gm-Message-State: AOJu0YzCiR+dpBV+MNUMzqIXznpYCYsWL2p4L5n7G1g9pm8iZDQ5HfrH
	ZPUBUHlkczRlErvsbLSP58aFqWJwqTrw3cxj0SAGruECZMUqCTMeKuIF
X-Gm-Gg: ASbGncuV6sfN0lnrAwCZyaXkld86ZphnhULqOnUyGljrWWAuLyQeYw989CGk/yFKPrf
	//YvEz4Ozisn9uhj4nGHP3yudqK2WTeZPBwqjlgvFXMBbLwW8W3yI/SA8EIeUEvrF9xg7C5vS5V
	hepBxAD7AN8rU/wXwTrlgfnOWsOf1k9r12z0jgKmNIrSqgbMJzUF3iamc1gTFMQwT0N1mw16kmW
	FiwHykJ00kh2BkDemC+ccFTz7q5uig4btM+dRFhXx2l/VMAxlrqjkCV2x/idwS6i5i7Pgrc8OkY
	++EfNSi2rWh2zBsXeP+HriaMO6mLJu2T/s7XeQzeyc0blnA3oDseUBIFhdqNObO5RA4XKDUA8Yj
	0BNoqhRAf3Jmn56Qa1VwKVW4=
X-Google-Smtp-Source: AGHT+IGcnLzfR2KkF0cKFSl8SlX/KfhESd6grO4is0zJqwkBeZC2Z3N5ozZREKhzPLG02yP+h+fk2g==
X-Received: by 2002:a17:90b:17c5:b0:32b:ab1f:5113 with SMTP id 98e67ed59e1d1-3309836b17cmr4977084a91.28.1758316245321;
        Fri, 19 Sep 2025 14:10:45 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5621:6657:a035:d5ee])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfe669092sm6028015b3a.47.2025.09.19.14.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:10:44 -0700 (PDT)
Date: Fri, 19 Sep 2025 14:10:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 15/19] platform/x86: x86-android-tablets: Move Acer
 info to its own file
Message-ID: <6widc42sua6yl4fjnctcyg5f4su5vgtmqfmt5uyc4kg7ab5vjb@wd7udwjersm2>
References: <20250919204742.25581-1-hansg@kernel.org>
 <20250919204742.25581-16-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919204742.25581-16-hansg@kernel.org>

On Fri, Sep 19, 2025 at 10:47:38PM +0200, Hans de Goede wrote:
> Acer has several x86 based Android tablets which need x86-android-tablets
> support to work around their broken ACPI tables.
> 
> At the moment x86-android-tablets only support one model, move this to
> its own file before adding support for more models to avoid needing to
> move more code around later.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
