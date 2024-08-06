Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79EB6F073
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Aug 2024 17:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722966919; cv=none; b=lApLXXozfwdy4hM8GqNUnSziELFZLZj8RrO/xTtZhJIxzk2lufpuB9EbmqGMeSQHeDYit1v0S4MXTKFMLRLRWpBCdbyOgbMWLhE7MQsF2btbHeH3SYeJjZhq58eM+D1w5X95qAGaydOIJg6p2DOKxprEn7+OsGfUkcUEgG4vK00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722966919; c=relaxed/simple;
	bh=dlKor5S4KZTtlApY8vKRh+RBVjDgqah4CvicECM1T2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKRVLCRzCeIUxiKfFram8NtOQ8TlmJ1e3KHe6oMbnYZubegZWQDQCw3KoajhniHDYJEQHwG9192AMWfw1JXbhiqBdRHurxWkKk59wxxGRRp46Q+axxVhjvKlylMYlmH4xZF5L80EJKQSUFm/JEi+I6Xra6rHzcnpgZfwH44YjoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvC5bUz+; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvC5bUz+"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f1870c355cso10732301fa.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Aug 2024 10:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722966916; x=1723571716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dlKor5S4KZTtlApY8vKRh+RBVjDgqah4CvicECM1T2E=;
        b=XvC5bUz+J0ll/CRxXEMNOc2PzzGgKwkeLYTdvXGUWFy3qZpXwxddy0xCKqTTYTS/rT
         W3Ly+nYpkhpO7yK+eymGw/gQHtWIbVAGcAZ1rwfRxMevfar3nGbtlaQcGBVRMXqoitpF
         hudVe0hLLYDaZNSYzckZrT4Gd5F5PKR86lMUcBGXYQb0XLbMakBKM+VwOu9X04FONVvS
         LSKfNkibTYYqGlDl7jSdFr+EMSCO2SIpgVK8cwqntxo4XxlvzidBQtQ7hSf8To46lBAd
         bmljw29zCkq4Z1ES68NhlE8ec+dbRlRNi2nLryqulieO5MBc4z3vWbbfHBE3vrs/CHwE
         FtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722966916; x=1723571716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlKor5S4KZTtlApY8vKRh+RBVjDgqah4CvicECM1T2E=;
        b=nfe7HwVYH6YkGluz/XAt0XwfccWKilEa0X6vNGrXBZeJwW+io/w8z8ft5eiOKC4HqA
         Zb+o2CdqQ8zqJGPNlJ3xMlxTcQNR8ye5YGH+QlJkFNkLjUeczx4gA2jxY8Mqd0S9+JKu
         T/7Dh3nhZN7muecMqHr/1TKCwwqWREl03q54R9T15BZfkD+JpJdTyIUAmm50TpEP7Vd2
         z5gWeFVZLKroD3+P9ZALBz1aBGr/DwR81TR/LO0UZmrMtP1AmdLuwNu0QOlFsS2SzU/w
         hs2T2RE4JJAtlEUJDcpi5moZ4AC3bhPuTxrekoxX7SgWQpKbt4qxqkyo6sp1zTUz3i/6
         A1uw==
X-Forwarded-Encrypted: i=1; AJvYcCWYM8eFwJMOZZsTR63utZcdTjrhQHu3+NgiJaKx1wSZqm73GsYnZxdaMwtRtzhkGxIlpYggMDKyIDOGARIl/tx5mezugqnvHqcS4UqzGu9MKnCvQg==
X-Gm-Message-State: AOJu0Yye3Mh8gopdxMqxsMh0jfT4BVkbmzC15UAxLChlRlkVORogVGtO
	BpZYleFS+0z8R749V+gDceYQncdglGEPCwhjTClafwPJ3i+x5vqxmGkiRA==
X-Google-Smtp-Source: AGHT+IGslzbtBNGll023sYG20tJekoTuYzSHLMfH/zJMMs3DJvHbbhuUhDqEdxd54NQsliKDQzpvXQ==
X-Received: by 2002:a2e:9e02:0:b0:2ec:617b:4757 with SMTP id 38308e7fff4ca-2f15aa95757mr105344631fa.13.1722966915621;
        Tue, 06 Aug 2024 10:55:15 -0700 (PDT)
Received: from alexis-pc ([2a01:e0a:d77:ff0:2146:fb54:fbe:f1d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64952sm253629025e9.37.2024.08.06.10.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:55:15 -0700 (PDT)
Date: Tue, 6 Aug 2024 19:55:13 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: hp-wmi: Add thermal profile support
 for 8BAD boards
Message-ID: <ZrJjgVkVO5S7ljY9@alexis-pc>
References: <ZZFGgfsfrU2vuQoI@alexis-pc>
 <84632b31-6e97-4493-a97e-572d288b294d@leemhuis.info>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84632b31-6e97-4493-a97e-572d288b294d@leemhuis.info>

Hi Thorsten!

Thanks for the heads up! I've taken a look at the report and proposed a
patch to them that I've not submitted yet to the mailing list.

I'll wait on their feedback and see if it works for them.

Thanks again and have a great day,

Alexis
