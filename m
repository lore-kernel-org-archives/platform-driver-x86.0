Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06D5175A85
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 20:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778184840; cv=none; b=E5SsDp4dF12FdtSZUZXHRiL4MufASMuFUvjKNJzDmmdEuXfyiAuzICWyRkytDwi2YNcasd01lM4S6VcFf5h8L37b9mN0LG4e48QV0f29LJqjf+RmQWoWHLDzGEXDckqEzkcMXnMSsSyY4yTlgGVYwql/YCnAYnwlMI/y1K5CSRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778184840; c=relaxed/simple;
	bh=C08sgM0wTsnmhzLRdT/bf4jtPontO9nT4sAczqh4fEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5zlIrmCtbvTuvIpAnYUsEvFl5Bg6jxEF97Jpi6eGJQIwFc/QxvyKo+fk0lTYsSoqUQ/vCt6qTw6smwtbHvvQB5wyH9dJWXBOjd4FF0tMTm1RI4C1VP6iQ1ya7TH016x8HNCqFq88CnNlljn/U2Vc8+Y7gqy4nySLiv3In3xKZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZudsjD7j; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZudsjD7j"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c802803ac17so569310a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 13:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778184839; x=1778789639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C08sgM0wTsnmhzLRdT/bf4jtPontO9nT4sAczqh4fEY=;
        b=ZudsjD7jCu9xyouPqJeAbsGIMXgWRwkF1jFaafYCd1QaoHb4Dk+G5YFzF8yA1KrjEU
         TyQA3W6pGyDzjLhhUWwU5PlPeOF6LKT4PJs+qmtV5MncqbJGamOuApqv5yd1JFSerxEO
         eCgrPvsLAR8owfAbjdqjsPKiSSRg+4hnL2IBccSMCOz2fDzp6XE1C40dtXnxB9xBb9vl
         e/Y8iSdV3yb7mJELnCC9r4keQ4kLqWqZcgTl0wvreDWzGvu/pUkqsQ+kdQAQ62sML8N8
         QtySpWe0k4fWGxzrcgsULTbh1vyvbV8WQPuevyXV+5sG3+yZMFVCHg5Ly3Rg1Nr6Q6ia
         mi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778184839; x=1778789639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C08sgM0wTsnmhzLRdT/bf4jtPontO9nT4sAczqh4fEY=;
        b=XKjmHZz5vke9bt/z8E2mStGhMThQDV1PeSzmKIHr1n5oTOFjlm57lLQwzFjROEguxu
         1pJUz5+lN1au2HrW8saJCqPvrZMkca3Ujn0wOIY0/vMRSOr7ZwqTIjDDbK6vWacSu3a9
         wo7gbJUWO85BoGQaad/ZOl98WsbxnVKRHw3ph4nN/4G4aS0Fj/sKFxaXeDXEJB7aLImx
         hmEcyQmbaRSk+CCSD1nVjJ7846Iagh+keOMlQSvPbtGNZTVFIK9wlSHFN/e4UoOEDkIz
         gp5FQaMDwe3iu8hIx12vZBPuoZW21PL8TV8nDg5i0WgxRY31d4SaxUDC/crw0oiG1jA2
         HjPQ==
X-Gm-Message-State: AOJu0YwVnPiqoBG3GYa2AtmFvHr2axeMT7PfoLy0+u12moevMGqbb4TX
	9L896lu8BNT1AD4aoAa4HnatJFwSAnld4Ub3dvl84VUaPxM0+DIdxcxc
X-Gm-Gg: Acq92OFm0+WzZHZeb/l+wJTfLyGbe2Txd2yOQCGbBGOQu+vnxDEDenU5hcyDtguJwzd
	kmGd5Aja1g6F6maknAd5u/wYqzZvU10AMXZMHlmmKOkHOTd1BGfQYewp0+gBlshsZaGAEUW+Ns1
	BH1Qp+0ck9C6XYsquALvtHF6yDAumIHH7GNtrp+kJcXQSE3ny0yFl6G1IoBA+eMVXl4/CGfi0B0
	hAvao5iDZzrDy5MmFI0IJkk3Wy3g+sKBh0krWwGq8iC0jnXIfdL0xA3HNHA/EYRjO39QTnjTAmH
	NmXOjzSQFS4UM+crZ1hBGZart717DIyBPRNXvrG5ehE308B1y0JAxLIKfJWa02i9u2ps5xr/+oU
	nllzKRrME7MLGaIOc5T0A2mhfpomZgkGYRYU4YqTd0auMhu9B+j6kzdz9yMU8c1AsteD6OM8ccK
	gO+gVbwi9okAMeK5l0Le6wvrrEaIXPas//xx8=
X-Received: by 2002:a17:903:40c5:b0:2ae:6259:5aff with SMTP id d9443c01a7336-2ba78b30d7amr100106675ad.6.1778184839009;
        Thu, 07 May 2026 13:13:59 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:3613:8fd9:c407:baef:f7b9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae7558219sm7127805ad.23.2026.05.07.13.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:13:58 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: krishna.chomal108@gmail.com
Cc: platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	Radhey Kalra <radheykalra901@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
Date: Fri,  8 May 2026 01:43:12 +0530
Message-ID: <20260507201315.9868-1-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <afzffd9SRuZQEMXe@archlinux>
References: <20260507101347.27972-1-radheykalra901@gmail.com> <afzffd9SRuZQEMXe@archlinux>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ilpo, Krishna,

Thanks for the review.

Ilpo: understood about the Signed-off-by. I will use my real name.

I agree that v1 added an ad-hoc second DMI table and spread the model
choice into the hwmon code. I will rework this so the DMI .driver_data
describes the board features, including the fan-control operations and
limits. The hwmon path will use that data instead of checking another DMI
table, and unsupported operations will return -EOPNOTSUPP.

Krishna: thanks for pointing me at 9d317a54e46d ("platform/x86: hp-wmi:
fix fan table parsing"). My statement about the Victus S fan table came
from testing the 7.0.3 CachyOS/DKMS tree before accounting for that fix.
I will retest 8A3D with mainline including that commit. If the fan table
works there, v2 will use the table-derived limits. If it still fails, I
will include the actual WMI failure/parsing details and keep any fallback
limits in .driver_data rather than hardcoding them in the hwmon path.

Thanks,
Radhey Kalra
