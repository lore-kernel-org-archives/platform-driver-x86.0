Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04FEDF59
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758368108; cv=none; b=FS7ieaUwDG9R/U0rsC2Gk6QNBuCoOEKVXPPufWijY+/BB5/W1MomTJXJgUvRi6qtv2SlvipS5EFFxggzdB0PHrcisS69IG1FQeEN8sYi2DkRTJYKN0AAnoTgPVbBLv3bvwsryk/yXaVDUzeAH3gMZw5IcaVKwzzFVqawiu7XBd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758368108; c=relaxed/simple;
	bh=5TQGVGhLGckA3C89CyzdzUQ4NPhjawQ0xTAyXZ2arRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amYnkdcpmBh28I+LUgVjbLPNCt04T1ohupuurs9DxH+h3EUXWH9KVfvMJg/x67xNQ3+Xk0HQgzrQ1pgW1y30LJxDVKHNGWDLyeC0kYH/EXLVIBRvRr1FkThnI7OGBdKMtti6/Zmdi2Rr/lmY346/xu+OGdBL+pjF+PvapRO99z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3RxE4zm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3RxE4zm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9D0C4CEEB;
	Sat, 20 Sep 2025 11:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758368108;
	bh=5TQGVGhLGckA3C89CyzdzUQ4NPhjawQ0xTAyXZ2arRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h3RxE4zmVH69TqspOVbHYkYaJJfNT87uTG1sVM2TbcGX4r7RpQ8nmDZZWAqlen6cD
	 iCNhwQWB7isi9z5fO0fteofCB0VyeSOF8bAsYFBwendE2TP7LcIeX2enbtMLeYyd/D
	 x0KT5ZVTFeTzKJCO/purhAyevvYS6/WQYX4+eeM+KpcRSfV5DMMwroxiR6INe1GrQW
	 C8FPghQkSE6IRnaWkV4ytMrS+I3INkmhc91bxYupzBR+LXmeLyUwnH7gVWHzZTnBJy
	 HYsaSjs1/fReFle3zj1B2F2GIqhkxvTlSW/HzPNLa7WHUjRSMlcO693oAXSaJryJSQ
	 2zdMJYVB2T1WA==
Message-ID: <8b00f4a1-82b0-4680-b3ea-a3a938e53e46@kernel.org>
Date: Sat, 20 Sep 2025 13:35:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/19] platform/x86: x86-android-tablets: Stop using
 EPROBE_DEFER
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann
 <arnd@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20250919204742.25581-1-hansg@kernel.org>
 <20250919204742.25581-20-hansg@kernel.org>
 <CAHp75VeuZGUOhQAey6r7Q_mPOmBG4j_UdWerVp1LZpeyUKmZag@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAHp75VeuZGUOhQAey6r7Q_mPOmBG4j_UdWerVp1LZpeyUKmZag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 20-Sep-25 1:21 PM, Andy Shevchenko wrote:
> On Fri, Sep 19, 2025 at 11:48 PM Hans de Goede <hansg@kernel.org> wrote:
>>
>> Since the x86-android-tablets code uses platform_create_bundle() it cannot
>> use EPROBE_DEFER and the driver-core will translate EPROBE_DEFER to ENXIO.
>>
>> Stop using EPROBE_DEFER instead log an error and return ENODEV, or for non
>> fatal cases log a warning and return 0.
> 
> 
> ...
> 
> 
>>         struct pci_dev *pdev;
>>
>>         pdev = pci_get_domain_bus_and_slot(0, 0, info->ctrl.pci.devfn);
>> -       if (!pdev)
>> -               return ERR_PTR(-EPROBE_DEFER);
>> +       if (!pdev) {
>> +               pr_err("error could not get PCI serdev at devfn 0x%02x\n", info->ctrl.pci.devfn);
> 
> TBH, I think this is unlikely to happen. If we have a PCI device, I
> hardly can imagine that we can't get it, yet it may be not enumerated,
> but the pdev seems to me won't ever be NULL. Am I mistaken?

I agree that this should never happen, but IMHO we should still check for it,
we cannot just assume that the device will be there.

This is like many other error checks in the kernel where without fault injection
the error will more or less never happen. Still we always add error checks to
be robust.

Regards,

Hans



> 
>> +               return ERR_PTR(-ENODEV);
>> +       }
>>
>>         /* This puts our reference on pdev and returns a ref on the ctrl */
>>         return get_serdev_controller_from_parent(&pdev->dev, 0, info->ctrl_devname);
> 
> ...
> 
>>         /* Reprobe the SDIO controller to enumerate the now enabled Wifi module */
>>         pdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0x11, 0));
>> -       if (!pdev)
>> -               return -EPROBE_DEFER;
>> +       if (!pdev) {
>> +               pr_warn("Could not get PCI SDIO at devfn 0x%02x\n", PCI_DEVFN(0x11, 0));
>> +               return 0;
>> +       }
> 
> Ditto here.
> 

