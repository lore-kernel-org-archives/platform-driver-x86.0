Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456CB1D69E
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jul 2024 16:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720457253; cv=none; b=kQhBpjyPaJKjXpUv8S4bZi1BZ/AhuQN4bXupng/dkl93secST+1cRTFG8LuDHVgj7miZuWZqyXfWISRadqKUAKd7/EHcoNikTDo33W/pTiuK86jU3y8Zsbw2VAcgQP18w2c6kxEe7ICqpnJihpkQ63J7kdmdrzh9bi5VfMOPEv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720457253; c=relaxed/simple;
	bh=yY+VPTW/Wh0v9o5HwjAECQFHIu6DMhYaeLwZ7KO9grQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPqCeo6Zo1zcMJztWQA3wVt7tv3vWW7nkZydnu3Srlkbdr/QsRTmBdT0iv+xYX7EwhpO7nEgxIjoq89AmsZvRpMK/cAMCIwY0ghVzaX65CvinDHxh2h4NaiOmu8yjYgT/XFkLOXRr8HPw8PgYufreJ6xk4lF4PRgn4DMKFwKxSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+zhmURg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+zhmURg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4265921b0f6so18690735e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jul 2024 09:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720457250; x=1721062050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yY+VPTW/Wh0v9o5HwjAECQFHIu6DMhYaeLwZ7KO9grQ=;
        b=k+zhmURg1ZorsysGK5mnWemNIszOt03cTzT/SdFB2eH/pYax+oIBVI8BoCXfT8254h
         l5tYwkT0dzxyvp02CC5+BpMDjtzGC82Wdblw7GHYjT/xrJLozEglZoqWabm4Zi8sBh2v
         8ki+rNYjJPowwD/cn7801eenaDlp4Iu8VfwHM7+DesU83EQMTuAxqT7qXoOLo8megzIl
         PPtHGQoq9RjrwRkvnHe/iyFh8mav2S5HnwjPB24WYUd2ZDkTRCVh0FF2puH3HJ9iT54g
         W1khqRSnBPN2OnG8b9Dzapp3uGQ3z+W4Augt7nmVyCn0rdQOyacEM6wqWXtJKfdLlJw8
         Lkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720457250; x=1721062050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yY+VPTW/Wh0v9o5HwjAECQFHIu6DMhYaeLwZ7KO9grQ=;
        b=AZDFF8bm32oZGx8j6vzsvq64EWZIMKKAT3tWOicwD9pDCDJh15r6zGO5KgE/FUtzir
         EWfStYO+KRZelkGqu5O46gDClouZGNlCTQXklmgfJrphZbmQI5wb+NFwyBI5THc30+4Z
         +oNVWPSB9sWrr9rqT2/Ec74U5zwYsstea5iwL6ZTvNdN087sOzgDL50XKzADuZNPBOiS
         8ViY0Sf/oAq0iP47MKetUPOKfJLgdgQEEv2r/HDMSEhMSDvIEM5AbSx4U7WfjP3hR5PT
         4uw6WvuYypP1Lq+TwWh94lJOazIHoIyThLMNrFhEtzHqywmfJ4Iraje5nalkvmjsbImV
         zdGg==
X-Gm-Message-State: AOJu0YzImzp5ylWNWYVulBh9HTcMN87K7G+fvezDpJfHcf+j5nm3rp1X
	jVtRZOnvQlZtYTgKlYxh6oSIHqlB3sDifzBoQ0KH48U2/z9dBpMjAsGk9Q==
X-Google-Smtp-Source: AGHT+IGf7NjmPIu5M1Zp1HknKP43olkuqkBfgQuL57E+bdutAVqU5Nx1ynRa8a0RWvw3W3h/8C0hsg==
X-Received: by 2002:a1c:770c:0:b0:426:6241:5eb4 with SMTP id 5b1f17b1804b1-426708fa945mr865405e9.40.1720457250397;
        Mon, 08 Jul 2024 09:47:30 -0700 (PDT)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f07dasm5393055e9.12.2024.07.08.09.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 09:47:30 -0700 (PDT)
Date: Mon, 8 Jul 2024 18:47:28 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de, hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCHv10] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
Message-ID: <ZowYINjbirbYEEVD@alexis-pc>
References: <Zovh22-7B1jI7sfF@alexis-pc>
 <172045576536.3424.14598982078039514960.b4-ty@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172045576536.3424.14598982078039514960.b4-ty@linux.intel.com>

Thanks a lot for your time and suggestions.

Wish you a great evening.

Alexis
