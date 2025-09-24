Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0398C246BB4
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Sep 2025 18:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758740252; cv=none; b=OB8qz4kyjaBXHfmwG8GwcJeXQt7EDbpz6IgoQqIdcRLiv75kelLgpmeC4JeTvSOAzFBALogayaA91tMHF1skh0TnTqp3HmA+wvUw6rFyw2EPu0Z0BCHauD1UJ20Agha6hckUh4r9Xeg6/OlPEGZJPzT5r7DDmJsxdI9wxloc174=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758740252; c=relaxed/simple;
	bh=kNOpPAEv1Tvm6ZWgty0aoGzYESfyUlxpiqxM+CU3MZk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Nd4J8bo1Vax/hDzZxZP/60rVOo2xGDMW8L+6KV1+HuyPUNjhRQL4Zrdd3WenjNMht4MPBGFzIn4fAJgC866IlLetJxgRAb+JnRnYBoY49jmxmYU+3iZWdgcIoH7WWbE/OSR+1LW0pUxsAouXjfH0OnOSlWY4pHLYa0KciZ/+PMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkDRZRhg; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkDRZRhg"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54aa789f9b5so149397e0c.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Sep 2025 11:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758740250; x=1759345050; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWxYD+pZFHZsKH8MBj/OhTAQAzw4i9BKYcOdXYJrXok=;
        b=QkDRZRhgV2eRKpp0oIEU+evqJETdBhjfD2sa6Yn3Z/RwuCHN7caVkQ/KdUoCfVnTha
         oeEuKvEwi/mvC1HS1EI+Lu/gl6C1DQjj3Som/3MJX+rE2bF2ZWvsZ4LjiAiKL5exJmpr
         ROXsPrbFf38DUOHODVXvnXqB/CDz+wfJMgyGe6/Ux4tf/2oO2O+RCYOgyR3hWtsTq1/j
         lGN/wYGj1sy3ChFciKzI+b2njQit9bAtZdNZAI7M8iNvFrQYSBi+kTC08/GrxjSYvluB
         f23xJ1a6MNm92QUf77y5Fhgb3QGireEJ5G3Tv10TQ+Q5cVS77nXZbfANUN8GygzmbDfU
         ABrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758740250; x=1759345050;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nWxYD+pZFHZsKH8MBj/OhTAQAzw4i9BKYcOdXYJrXok=;
        b=HMDyLHRAaHj4/CSNRzE+9opBTy24jJHpJIU7O0vRojjfJp3sw13OroX+TyCLeHaqoG
         Jxi+XzQV2Pgomt5LEi01Fby4GnzA2SMDTDbpaXIohZMGM/aQnw1F+E3FYZT3wL6GLmxy
         FMuQuXnvSHcnTTUNzgD4ChtVvIz4iDtIZC73ENF225TqGydTowbpnzJe+Y5b8HbFxzbA
         WQ4SmBlyxn8kxbW4w5p2SPcqcsY5vo//zOKMxoDcIEoueGN1NpjSDKNtKg2kr2lNV6Nl
         yPB+/+31mQ2Jo5bn7q67GsJxCIZtrpGLGIBet4CAEHweova1TuSXs/QEcXOX0ZBau9Zu
         4b7A==
X-Forwarded-Encrypted: i=1; AJvYcCWy9cx5u+TDPU/opU6NaY2jBrBqe7A5TSZb7q2SDoQh1Px+lIDEvH1Pm0/FaSlnLVGfZKHOGtLU8rZIxbzxW2FpaydC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6mvapmw3xBUIAhWhgiUiE0J1t3uCdEc+qqGh8gw5iLl9vzXUm
	2gcfw8A4Zyp8QhUoOx/cEFgSnw4SH7tZkGahIyju4vhb+walyaX1xrrQ
X-Gm-Gg: ASbGncuekJJPhJIG2pnXm/x0NsIc0Ic73X9IIPrpV1rN4SuAzJKiYqiZp2AzkusJwfy
	JH2gT7J66LCIDwUuYKj9HYtQXixfKPHRA3bCOa+PtfhCY94mkLM7wVN2yj1E7zL6GJPaaXaU+g3
	vuPaPiZYeCQ0N0lClLbWw6gWTw+9mGV+UPNxDqJlQBnNd4gyvkpFH/bg+Gt1Q+k4BYLPZ+60A6Q
	4YvijjQRmZLX/FE+b1zLtW411aHN/fP/LQ+4h44wy3EtzXPbBHTQnnBmvp+JCtQch2NUaNi6kgI
	2GFkqc0mwyf26IRXS6r6TODKA4kowCEXAtn+817Drp9NM82LR5nZfqBpaQvmLq+uhjO9cWryA/n
	b/NvjI5e/kQUkyCn3tQ==
X-Google-Smtp-Source: AGHT+IHWmF3DzElM3PjBWWk2+MFsruPtggt5CCo0r8SsjvoJ2undEYVJAosolyw/eldcVgkplc3xJg==
X-Received: by 2002:a05:6122:3c4d:b0:544:79bd:f937 with SMTP id 71dfb90a1353d-54bea3dd310mr486927e0c.15.1758740249769;
        Wed, 24 Sep 2025 11:57:29 -0700 (PDT)
Received: from localhost ([2800:bf0:4580:3149:7d4:54b1:c444:6f2f])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a9928f33asm2630255e0c.5.2025.09.24.11.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 11:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Sep 2025 13:57:28 -0500
Message-Id: <DD19DW23BFFN.3JNH1C2UEZFED@gmail.com>
Cc: <Dell.Client.Kernel@dell.com>, <kuurtb@gmail.com>
Subject: Re: [PATCH v2 1/1] alienware-wmi-wmax:Add AWCC support to Dell G15
 5530
From: "Kurt Borja" <kuurtb@gmail.com>
To: "tr1x_em" <admin@trix.is-a.dev>, <platform-driver-x86@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250924062721.209621-1-admin@trix.is-a.dev>
 <20250924062721.209621-2-admin@trix.is-a.dev>
In-Reply-To: <20250924062721.209621-2-admin@trix.is-a.dev>

Hi Saumya,

I overlooked a couple of things.

Please, add "platform/x86: " before "alienware-wmi-wmax" in the subject
and leave a space after each ":".

On Wed Sep 24, 2025 at 1:27 AM -05, tr1x_em wrote:
> Makes alienware-wmi load on G15 5530 by default Tested by me

Drop "Tested by me".

>

Here, just before your SoB without empty lines in between, add:

Cc: stable@vger.kernel.org

So it can be included in stable releases.

> Signed-off-by: Saumya <admin@trix.is-a.dev>
> ---
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pla=
tform/x86/dell/alienware-wmi-wmax.c
> index 31f9643a6..3b25a8283 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -209,6 +209,14 @@ static const struct dmi_system_id awcc_dmi_table[] _=
_initconst =3D {
>  		},
>  		.driver_data =3D &g_series_quirks,
>  	},
> +	{
> +		.ident =3D "Dell Inc. G15 5530",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5530"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
>  	{
>  		.ident =3D "Dell Inc. G16 7630",
>  		.matches =3D {
> --
> 2.51.0

Also, please Cc this to subsystem maintainers too:

 - Hans de Goede <hansg@kernel.org>
 - Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 ~ Kurt

