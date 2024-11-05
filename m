Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFC618C91D
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 08:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730794979; cv=none; b=fOPiszGwb8TlZQrTXPEj+A+N08+zpIlY53IycJzuRc9ZYWMC7sKCN8gG94P0sMD4uDWtTzT/RUuiZVPD1cSRBXntr851JS3U+ppWoaOVYecy8ecG9nntc886VomPNQBNPNRHq/lE/UANQLphyW/pVSfyTJDvwIsbKavR6dd5F9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730794979; c=relaxed/simple;
	bh=0VQSWTuXr6jcn5Pi6c/9vykX5jxfe6I47eY/rexE/4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DFtXNAbjcAT5QbznLk54AjdolqrKHpxlCUKbDTGRDVToFYFmPwizwoZ2LDJb2vujprYVaPIc8YYbXkawaRFNIy8JnIfX4SpHBOxY9z+dtcJaC4Sw9BvrlbFsN4iGQbZ2S/MzC84NiTJNtKtD4z41vSoC/TF1nKn0SSjAv3vnRUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S08SGx6/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S08SGx6/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1ecbso6221105a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Nov 2024 00:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730794977; x=1731399777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lZ/mgkd8+8iAYzm1upr4WzmodtGmziGXSjfGCo56mU=;
        b=S08SGx6/1X6aciolyUXaioDtKED/kQWP3HahBRNnB+HGj+oceNt8Bhh9Lh1LtQ5opE
         enm57+CxfDwDKJGVXYrEJnE23e7jkg6ZW7MUAn+TxMiG1WiB8Hi+tlcrJi7wHTz+CJWW
         hKq2ockuqXYoCiIojoMOPjrWwVCfrGlxPCa5Sso+Pq4Wv6LNNT38/nAOUTJnXtLX7neZ
         qJE/xGOg6EGELhXHioEV81HNx0wk2YONzpfjfGH1AxMxQuiy2M8J7Lt++69cdk3nmDrL
         PkF9irN0+G1NM8B63PGV8XyekT16lWfgAnE30wNkWYnJ50Ng7Hc8G9vqt8KZadqvo/Fn
         2JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730794977; x=1731399777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lZ/mgkd8+8iAYzm1upr4WzmodtGmziGXSjfGCo56mU=;
        b=mnnuL/rnASueVV+ig6+jPZi2ZGZalGoyIF8APSIqqMz9+Gr54iqODXbYL+5pUKILNH
         iIvQSwegX9wZLKQ4vUQRUfUgooHbUfG/TDX1Xr9lRS9laRPAmFkiy6T0DkeR4CQYZkdj
         jJ/EzVuOqaKv5wsHSHoY4Ny5B5ZbVUfI0/aR5LfbleV8V5GpO8pepluReBrT+v9VKt5I
         T5JJ+3ga9OnBRfDcR+RTPVL4UxVWmbUNllNUanDzTbyoqoE4QyW6WYAg4dnOexx/9rBT
         EN2Rk/QkenyZL4yoyUe4ZkM1W/ys+yVVJtSegYczXuvdggl3+3NnMY49X1QFSGUXPLW7
         4DjA==
X-Forwarded-Encrypted: i=1; AJvYcCUiibHiRVNwkdiR8HVBrS7ndB7uErziM0k2LSnc5aIUiWdTIT8znbB7X2ZKOpOcx0oh02wOXkeX5qg+YKATRKArzHHQ@vger.kernel.org
X-Gm-Message-State: AOJu0YynersITayE11LSnGR1pDRxI6Qlji/wYtr0e4/mW5y6PjxH4BSd
	6TN0EGQzVKeryjXYWqgHOiK41LfqaVjFnBfhga0lB5KE2X06/DTdfpjIBnPEvz4sCFBWg2aMlkq
	Yl5VLrBIf4BeHrBu/eU2re2ZaI74=
X-Google-Smtp-Source: AGHT+IF2W2W8Z5V2RmQKqCKK9Vg+QINVi02aKO22e5KToxzktf9ZE7GRcU6c9m1IhQR3hHR3GlQcBxaa2NjsDmimipw=
X-Received: by 2002:a17:906:a84a:b0:a9e:8522:19e1 with SMTP id
 a640c23a62f3a-a9e85221c0cmr875785366b.62.1730794976364; Tue, 05 Nov 2024
 00:22:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104200848.58693-1-hdegoede@redhat.com> <20241104200848.58693-3-hdegoede@redhat.com>
In-Reply-To: <20241104200848.58693-3-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 5 Nov 2024 10:22:20 +0200
Message-ID: <CAHp75VdJZeVmAjceMYQ-QZf-+RHAY5Y0nuyXgtVFzSiQ4yMPag@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] platform/x86: x86-android-tablets: Add support for
 getting i2c_adapter by PCI parent devname()
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 10:09=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> On the Vexia EDU ATLA 10 tablet, which ships with Android + a custom Linu=
x
> (guadalinex) using the custom Android kernel the I2C controllers are not
> enumerated as ACPI devices as they typically are.
>
> Instead they are enumerated as PCI devices which do not have ACPI firmwar=
e
> nodes associated with them, so getting the i2c_adapter by the ACPI path o=
f
> its firmware node does not work.
>
> Add support for getting the i2c_adapter by the devname() of its PCI paren=
t
> instead.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

...

>         struct i2c_board_info board_info =3D client_info->board_info;
> -       struct i2c_adapter *adap;
> +       struct i2c_adapter *adap =3D NULL;

Unneeded change.

--=20
With Best Regards,
Andy Shevchenko
