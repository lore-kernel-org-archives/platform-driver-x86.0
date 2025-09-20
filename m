Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD601C84AE
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758366362; cv=none; b=PIleuxdHmwlJzQViniqV0/tmTGjyvJ6nnPoBB9Mw0ddL5ubFWL8qPl6o1gFB7K+rUUngiSx2KbHP2eS6Wia9CFcnQuOKJBv+ivqGi1yiMrrziLgX/uc4eluU/Dprf3ETHoW5wj7Ph7ugMjeItkDLvp6kwK4D54nj84r/wU5axrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758366362; c=relaxed/simple;
	bh=mCUNJdodkxy1pqJIg71yxNNsEit7RPMvTXGJNCHZN8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaX3z5KD0H7d4MejKnuPmeSijuB+avtPt72rq15tv2INYU+M6nRrX9O81hkPLCSKskyiZIvOWJW97UoMFkCieCvwrh6QpNzxaZFVDfznMgo77jKaOGh8L8W2gCh8eFbJ7xzYMe3Cp9i9TWXqxB+AkG5i6B1s51iscJ2lSFinI8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHSsHx4r; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHSsHx4r"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b149efbed4eso468507466b.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 04:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758366359; x=1758971159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1HRbh1mAlx+ZSw9Lbnhf3Gb0XtR5LFugelrDStLu2Y=;
        b=QHSsHx4rhQLCFuuYVSYYtuhTXXPP3TQr1mdzdXIvY1lfE/1PWcuof7NPvvsR9w3wBt
         /JK5UOBlGR2P4EqQ1XGm1MWX1ESiUCeTagEkaqHjPkAGj3bX/EKdK7XsX4blYbggAL3Y
         Rc/ckX7IMPu3cPCHuZ+KFzo4yr48Og5o79GtTd4YJuTrFHdjuZ/AH1MZmmzxpR9F2jFW
         KDhxmobhsW9Pjvbdt+eabeU8J+qD6cBmxAC05KFVpcNag8GMZ6njceUe3mA0Iutj6l4q
         dMiqf3APSdCuBTHng/Fj1o5FhPC2+/XCW0RAaA1T1CAodbO9gWblFheiB5iQ3AZkrvaq
         rX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758366359; x=1758971159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1HRbh1mAlx+ZSw9Lbnhf3Gb0XtR5LFugelrDStLu2Y=;
        b=JZ+UyUcASU0ziyuTnESRba1hhJu0B9QuKLjXlRNeSY7I+To+GaZi2sBiFgMTI7uNFx
         wt4/tJOx3VgGBtJHKk4s5yRjce9SDNLJhO7iarFedGio0/gkE0x6DMhQTzGKdH5Vlvev
         wfvNvMfZDkFwenKgvJ6ZgZaaGLw9sYImFuH6re0hK5LtsYTBXz1ZcDSatLaZ36YPKEMS
         BGt3MdDYIbgdTRF+7zRKzKZCXQBt1O72KYkHhEILeUhCS6nVrdEtZ9at3lagEUgv6IIA
         fDWp1qvSQhJaAJgX2aJl2J2Ey6teBjd1+gv2hoJJYcPGq6i9DJ7vz208+9W2lKWYPz6d
         aS4A==
X-Forwarded-Encrypted: i=1; AJvYcCWMj6pg4EKEHG5VKiGFif3ZpLg2CaGS4xx7aJMRj4jIxdxMMzrc+oBXerBaq/7nPxFbVORMQSDDwTzEpaKWbOak8nK/@vger.kernel.org
X-Gm-Message-State: AOJu0YzCLiacoBnNBfMkuo9A88nkJmgcOQr/C7okyoFGhvSIaAe4DVkY
	T3XpRoIpUCXkIsWtMw4Ip/Pbc7iCziHn9kgR5KEsoYdXelvKxEUC89luF39d9VW+Wr19nQsgrj6
	PsZ4n8R1z27RPtT+RBuetR4MBs0f6SSM=
X-Gm-Gg: ASbGnctFjzj9901utOYv+LVQWWdtend7LoMf7RTGa3M+WKTQjxmY2QoY16O6iuaDINl
	1gAbo28CkzCL82zBOT6472+9lNSd/8RyyCHzqyD0QJaP12zmettepZQ531+ksTFBmAZQlYRAz/o
	mlX6V6+bIsEqbgT4J/qjDEmrDVlvIpuHrHv5e78tYkZkZkoyr3OjAS/QrYLKN3QTAy6JlCw/59a
	Uu/yp5l0TzTDSl6mQ==
X-Google-Smtp-Source: AGHT+IGKtr95qUfd49e8EfSo2FxedZmtpgrJzwLngx98vhLa4l7bhCpsTj5TS1Ruj6gPujE44DnUdOlUac+ttVCZfxU=
X-Received: by 2002:a17:907:3e0f:b0:b07:c90a:8ade with SMTP id
 a640c23a62f3a-b24ee5fac05mr727310566b.20.1758366359046; Sat, 20 Sep 2025
 04:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919204742.25581-1-hansg@kernel.org> <20250919204742.25581-10-hansg@kernel.org>
In-Reply-To: <20250919204742.25581-10-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 20 Sep 2025 14:05:21 +0300
X-Gm-Features: AS18NWCo-0fuW_h3T4HsV8gSZrKy0Ox66fedkIc6z8MqypV_UfVkjWxdj4R8crg
Message-ID: <CAHp75Vf6mzHPhm_sKZ68H=5nFCg2aEPdMke84ovB_knv4-+eJw@mail.gmail.com>
Subject: Re: [PATCH v3 09/19] platform/x86: x86-android-tablets: convert Yoga
 Tab2 fast charger to GPIO references
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 11:48=E2=80=AFPM Hans de Goede <hansg@kernel.org> w=
rote:

> Now that gpiolib supports software nodes to describe GPIOs, switch the
> driver away from using GPIO lookup tables for the fast charger device
> to using PROPERTY_ENTRY_GPIO().

...

> +       /*
> +        * Propagate pdev-fwnode set by x86-android-tablets to serdev.
> +        * The pdev-fwnode is a managed node, so it will be auto-put on
> +        * serdev_device_put().
> +        */
> +       device_set_node(&serdev->dev, fwnode_handle_get(dev_fwnode(&pdev-=
>dev)));

I would rather split these two

/* Comment about propagating... */
device_set_node(..., dev_fwnode(...));
/* Comment about reference counting */
fwnode_handle_get(dev_fwnode(&serdev->dev));

(note the parameter to fwnode_handle_get(), which seems to me aligned
with the explanation given).


--=20
With Best Regards,
Andy Shevchenko
