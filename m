Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FFD299AAB
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777793188; cv=none; b=trU5NM0wmJagwoAdP6Sf9spJi3tCb/iNoEpHdfisZX3NQqyl/GE9r90QDzvp+BzeIQ+VDWc4NcCFPcL7dAwf0FMkVxNmTpE3Xxvc8nI+kdlRXD92YYm1GxhRPW8ZHULkjDlH5zUkgKSp/FgO+B8AvVKJIVb/fepX8j+XHF5qisE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777793188; c=relaxed/simple;
	bh=j2AgLSnxwlpFcwBDwvM7nDV/IQNFQY9JI+OAVicukx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4eNW+fVG1ebwabey9XkUdDZuELJSQwCBHdbmzYI19yzFx612Gn0JXI3MgIzqH5/nxrFCyXs/SWbYs1MM/lDcbGBlvYjdkc3HuTUbr1H6JjEGG9ySwyR4xH7OZZFzNXnFKgxJWqRUDnQmoFSk6RY4qrPLEyuyaLXr5+IjLDQXTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzKNGd+Y; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzKNGd+Y"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so1327605b3a.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 03 May 2026 00:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777793187; x=1778397987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1lHX1CZGJmov/5nosLd1rKvSEb6z/FL63h6r73laO64=;
        b=DzKNGd+YYoym7kT5YKEs03KFct8Mt3sFeKfIm4sTVVz4CPfYT/Dw0Ecqx9JKOmnrNV
         O9JoeScxDAX8r3OjFk5b7J1HfCqZUOc28OkX2Mgpb0xw9T1fYqHpq/2n/6S/mq6PHcZb
         6I2lYw7tmHrQlIL31LQ8n3osfgnxVAmI5VD/uLsNj3lBhw2VMuHL9J+x3c0e/me33mIx
         qCNwCMSHQDPQJiaARh0SGTqOOM6m2tYFph61I9KMgv8dXtuQgcd5YR/Q1mWULkrmS4T/
         SvwmX2fQJP9thH3fQRVv7/TgawOy9B/2yA6dkxZoDsYPmOlTe+soLkSxj/xOrmI8f/MA
         7vKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777793187; x=1778397987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lHX1CZGJmov/5nosLd1rKvSEb6z/FL63h6r73laO64=;
        b=l6sdNGaG5TbWKRFzU7Bawc4Wp2pQFATi6TycS6tL0NAbJSsKpP3YPQpjTsvjMCz/pa
         nVV943xuqtnfAHOnpHdylM2PLSgtpqViNmWRD0O5iHBt9AZ82gnsy+lPk1q2mUiYaMxU
         IfxQfrxiFjxKhyEQs+v1FYyDtbg2QOIvVMb6TxIQULuuNUXO9TgAjDEfHtGKAVwQWna9
         2wc47cIqhXjkKoI5ria6+S7HL5k3HXBQwfK5qDfA6yTk1A6i+UbgjUd0wICqJeKKT74N
         efO2XnCrzR+hRPwmTBmI/+52baP8YVCd+saTwyr9Lp+PwVj+SrlSWBrFzeOmv22p3wrM
         tKfQ==
X-Gm-Message-State: AOJu0Ywpd0MF2ylA+Fusxpu2duE/4ubX1gNCFVbPNhgH8EKfemg/QvXb
	FaVa1LPU108wFemddL8VSf9KXCq7olnKDMxe0wHCnbICRbzm8EigZZ6s
X-Gm-Gg: AeBDiestRs8aWuFeUehRQ4xZOSNFrUU2VyM3G2QbAAO6FxehjD73zIUD0pC/ZyuaEm6
	Zx87K22BBWOGrujYcXD5lEmrHMhTQ0Hmi3vIHCVqCX/9KeSOAsNtTpaGjPtamCA9+hryskQUYth
	hNUmsHDUkI897dDryPviBgEx8oG4QhHbAs59U1yIUFChjJY95bM0uYfFbwX7aI750968ppV58yq
	ANEmKuOpONHykYbcADVsl8dd0oww4ntwaklV0myFrZpZglIepHw8OLnSkCj/Oz2YzDS20rceMTF
	LmqAk5R/Mith2zFL2qe7YevQ3nxBIpNLDphNoTqaftiAkgAH2zM3+4Kf7L2Ipsr+OsPaQ60+lbh
	HNhT1NdREAu8IY9qGWyYM9nHkskRNCc58BxXMWZc+KF+PBBvqb9Zj1r+O9WIraZ1LvSyz2B1eVw
	qvvA8WcTYKfdp9wVnU8saKHUuRpBTpMmuJdBh7OlYDP9Fxf/rX60rt6W8jsZwyc8sAU/bjuHKlC
	sBae6UwcF/rth/w/zHGWRK7jHNUCMY=
X-Received: by 2002:a05:6a00:800c:b0:82c:e09b:3f76 with SMTP id d2e1a72fcca58-8352d283812mr4649208b3a.41.1777793186626;
        Sun, 03 May 2026 00:26:26 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:bfac:abd3:86cf:47a3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4b371sm7263017b3a.49.2026.05.03.00.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 00:26:26 -0700 (PDT)
Date: Sun, 3 May 2026 12:56:22 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: yue li <mc.root.ly@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [REGRESSION] hp-wmi fails to probe on HP OMEN (board 8D41)
Message-ID: <afb0f9gaS5z_SmRX@archlinux>
References: <CABd86uaQY9-ZSU-_PHKtZZyWnDFHLEsuaM+NBV5nOLWA+YSX7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CABd86uaQY9-ZSU-_PHKtZZyWnDFHLEsuaM+NBV5nOLWA+YSX7A@mail.gmail.com>

On Thu, Apr 30, 2026 at 12:59:58PM +0800, yue li wrote:
>Hi,
>
>I am reporting a regression in the hp-wmi driver on an HP OMEN laptop.
>
>System:
>
>Vendor: HP
>Product: OMEN MAX Gaming Laptop 16-ah0089TX
>Board: 8D41
>BIOS: F.12
>Kernel: 7.0.2-zen1-1-zen
>
>Regression:
>The hp-wmi driver works correctly on kernel 6.18.6-zen1-1-zen,
>but fails to probe on 7.0.2-zen1-1-zen with error -22.
>
>Issue:
>On the affected kernel, loading the module fails:
>
>modprobe: ERROR: could not insert 'hp_wmi': No such device
>
>dmesg output:
>
>hp_wmi: Unknown EC layout for board 8D41. Thermal profile readback
>will be disabled.
>hp-wmi hp-wmi: probe with driver hp-wmi failed with error -22
>
>The system exposes the expected WMI GUIDs:
>
>5FB7F034-2C63-45E9-BE91-3D44E2C707E4
>95F24279-4D7B-4334-9387-ACCDC67EF61C
>
>This suggests the driver matches the device, but fails during probe due to
>the unknown EC layout.
>
>Question:
>Is this board expected to be supported? If not, would it be acceptable to
>allow the driver to load in a degraded mode instead of failing probe?
>
>Please let me know if additional logs or testing are required.
>
>Thanks.

Hi Yue Li,

Thanks for reporting. This is a known issue [1]. There are 2 failures in
your dmesg output:
1. Unknown EC layout: The fix for this has been sent recently.
    Currently, it is in the review-ilpo-fixes branch [2].
2. Probe failed: This is due to a failure in parsing the fan table. The
    fix for this has been merged into 7.1-rc1 [3].

Using kernel 7.1 (or applying the above mentioned 2 patch manually to
your current build) should restore full support for your device.

Thanks, and apologies for the inconvenience.

[1] https://lore.kernel.org/platform-driver-x86/4ae4d7f9-f1db-4394-b0d9-c75dc39afcf8@gmail.com
[2] https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=review-ilpo-fixes&id=c2d4b76458c9ebf81eae2916970320f1f61ad002
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86/hp/hp-wmi.c?h=v7.1-rc1&id=9d317a54e46d3b6420567dc5b63e9d7ff5c064a3
