Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABF31804E
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729696359; cv=none; b=hEIfCsr3cPOkUnBMy/Q7QK/L5ABNHePxEKW6OX5CYvVHCmjxHp0LMWsr0F1x3YWAN6RlA1xqp2Kw0kVFXGG7L5Gsj1pI88A1BspKyfCrIFXKyYGdXsq8KwCiGsWCArQR/gkbcLij26wBDLDDRzTeEHt2rpkNoyXI38PlU07skWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729696359; c=relaxed/simple;
	bh=sXUQrfoKn9IHaEJUSUdm5gj73lTdMnlDSJTKXHrDg48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jc+cn4xnKQWTqQKjmlbqyBu1p9WVKBpQVSRkvcSa/D2XE/UP3GmXnsO5JpcHpan9/9QJYut5VFYTD0lc5sRaz9hxJl3b1FH03fj9N0a2INhyPyfEcuSAtQrOaielltuJGpgvYb4L5swBtv3FXlDmIN4KXPauuwMQeT7WaGSyRKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgHUun1T; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgHUun1T"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4314b316495so67457625e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 08:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729696356; x=1730301156; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hmdO9uU7juzcZmwVHa6ODzIen1QJLe7rPSPdN0pjuy0=;
        b=kgHUun1TiwYvPBENC9MKtAfP82Cym/YIvLm7Jp53DmoChns6+HOp88LMC6GmsNhnMw
         RBg4emxoXoUC50iWPCQPp7/PWHTsbMyuLnHxwgnufeujn0ZYiEwBZIEcl4PNEqqZIRuh
         8TTFtWhY7Cujbw+VE3itR+kP5L5Y2TbwB0LtrvYE/R/ROEOgFiqcMoz6vff2YZ/iULio
         IXcuLoexlEB10y/1xZYgUv7856/1YOecx+FfEEf0jQ+5o1v/8i8vpaASVjugTJPRmK6u
         GOzD6TI8tQ9veR+JIpcIDpsgxCiEW/uyQQYZTxQXNisJZi8vf0y9YseGVCji6m7ZbtWw
         HKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729696356; x=1730301156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmdO9uU7juzcZmwVHa6ODzIen1QJLe7rPSPdN0pjuy0=;
        b=GSLMXD759RWtiykFSpk71BVFRKWXyLZfuLj0fDvKmp1jhRcGufpp1DFoiqZFU8nWC7
         8WJ6qj/rB2Yv85zYj8zVdhzlO+HGWV/oPXJ7JbmaQRCE30XvHUcjGWokePn8SA0bslF8
         YyxecmkgP1zGLgtUb35XtVMsZaSwaiGVBjGtiIoUXL5sxO3OgA3zE+7KVum7s0wFKQTj
         qpjAdGQgh7qUbeyQIexhAb9ulpWQVD8ekF9UtSy75d9Vi2x3pvjud6UrziRQjVXsojNL
         qf44gP0jAmzkazY07SQDXM0O3S8cTlXS9Dg7lxD+FHoMLo7783TZxmwST5GJlO4qfzPy
         7GGw==
X-Gm-Message-State: AOJu0YzitZRPiaMbj9N3CUWKP8bsnHN3hM0psUxXFwZeI5TkLaCXHFy9
	iMCdLfRpV63zb5skRG7fsIpMZ7Ezeo/WRGbRNVk4N/x8gwwN2mBqJOXLHhqCKTQy0B1qoq2kXgW
	oK2zzY+bVs4r101GLNKFmaPGa4YlInmQK
X-Google-Smtp-Source: AGHT+IFM/9QWzC5sI8nUi2kQmajjuEzgz7t6c9NjWbkP/0b3I4VUrSyl99USD/gUEd5/F2Q6kaRZNzP6jXRb77o8Grs=
X-Received: by 2002:adf:e9d2:0:b0:37d:5282:1339 with SMTP id
 ffacd0b85a97d-37efcf070eamr1878917f8f.22.1729696355735; Wed, 23 Oct 2024
 08:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+b5WFEXPJ==vruf-6DHrhS7j3pnTaj_EQE08BimxqyaNvktQQ@mail.gmail.com>
 <d1028755-6a7a-4db4-bd4b-e5a2d682af61@amd.com>
In-Reply-To: <d1028755-6a7a-4db4-bd4b-e5a2d682af61@amd.com>
From: Mischa Baars <mjbaars1977.backup@gmail.com>
Date: Wed, 23 Oct 2024 17:12:24 +0200
Message-ID: <CA+b5WFFa4hMeGnN0J2xd=FpU2Cxe_AjapWBpTFjfNhzUSOUAzA@mail.gmail.com>
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mario,

Why would this be the wrong mailing list?

I understood it exactly as the article tells us: there is an issue
with the HDMI 2.1 specifications and its intellectual property that
prevents the driver from being implemented as an open source driver in
its entirety, but that certain aspects could be implemented closed
source through the firmware.

What's holding the kernel driver developers / AMD back to take this road?

Kind regards,
Mischa.

On Wed, 23 Oct 2024, 15:12 Mario Limonciello, <mario.limonciello@amd.com> wrote:
>
> On 10/23/2024 03:36, Mischa Baars wrote:
> > Hi,
> >
> > I recently purchased a new television that is capable of 4k@120Hz
> > resolution and refresh rate, but when connected with the proper cables
> > to an AMD Radeon RX 6500 XT that does support HDMI 2.1, the maximum
> > resolution and refresh rate I get is 4k@60Hz.
> >
> > I've 'spoken' to AMD about this, and all they do is recommend
> > switching to Red Hat / Suse / Ubuntu and using the official closed
> > source AMD drivers. If it is supposed to work after that, remains
> > unclear.
> >
> > Did someone get the desired 4k@120Hz / HDMI 2.1 resolution and refresh
> > rate to work using the in-kernel amdgpu driver? If not, why does it
> > not work or when will it work? I have other vendors with other
> > hardware that have different restraints on the number of operating
> > systems that I can use, and they do not go well together.
> >
> > Kind regards,
> > Michael J. Baars, the Netherlands.
> >
>
> Hi,
>
> Your inquiry has come to the wrong mailing list, but I would mention a
> few things because I happen to be subscribed here too.
>
> 1) AMD doesn't have a closed source driver.  AMD has a packaged driver
> that is a DKMS package for use in older kernels before support has
> landed upstream.  With all AMD products on the market right now there is
> support in mainline kernel and with most products in LTS kernel too.
>
> 2) HDMI 2.1 covered in the past, and AMD's hands are tied.  Here's some
> recent press on it.
>
> https://www.tomshardware.com/pc-components/gpus/hdmi-forum-rejects-amds-hdmi-21-open-source-driver
