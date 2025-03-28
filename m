Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE4C214205
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Mar 2025 11:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160378; cv=none; b=ZIkjTM8tEOU3cUm6JIczVAF3t8YMCULHogCp2AI87tu6coalDb7s/km4glU6jD4Xa/Fdcwv8auzbgIWYHIpd6JWHCeLbSw15EhOtU6xXDQLQGVsrCsudFqhkOCv3cj4Dt64xqXzzPEXM4E1KKzZq4cAIttHIIV+Qxd6zHt8u/QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160378; c=relaxed/simple;
	bh=hDvAV5mWAdzmYGGYZfq1LG8gMAxyhrotH/qCV3fjxSo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=peTG/jlrmnoCzDiydmZw+qqa15pQNQZKj+/hJO9Ab5qv+rLUbKjFw1K0ysJRz98P+zQ58aEBR0KtkqSCf4MX54QFnL8Sh4RBnPTpt9GO4LxFFvy+GZ2iIi5a0jH1yROqd6gfhP3KvHzIiWfHvlFxsYrMxLqKJaX0hn7YRMn5ANU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmmWpyOR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmmWpyOR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-391295490c8so87160f8f.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Mar 2025 04:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743160375; x=1743765175; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FHmRRo5YG9grcLfAAfi6oAyWJ6O5ab7mtAwpi55RZ18=;
        b=fmmWpyORF4QIoHhnY3xtGodOuoQXuZvtTGEQ7VaJTuHcKKB27EvmYhnL4E7VOyJlyD
         dVxBidDS/oI7BD2l8Y9QrcQwRM3wCFn+mKTGssvrRy5a4GMn6fUmlQTVhcWZwMrynk/U
         z4lgYRn0WRLl9l/3wDDYGdJDaPr1W2aTau9u0ihQaMnm1GxzheSDdb0mH7o+QK3yLy6V
         Mz8UZ7US86j8e3CBcTmYqRjtZQyx4+PRwxYc7CKNcmrOfxdb+XH7PLlo3a/z2SKDPEx0
         tFd4qp3b3QBGUdd5+i4wZ/1IJVFlbll8/DfrCoSulWW4g1PsjwjURiSTpbPXeE6KJxsf
         A/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743160375; x=1743765175;
        h=mime-version:user-agent:content-transfer-encoding
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHmRRo5YG9grcLfAAfi6oAyWJ6O5ab7mtAwpi55RZ18=;
        b=Ua2jmMyveoHqPolWhEysZ+U0Ef294l0iHQiRfgHMlZ4C8zhon+v6VwSjyUuoMBjkLJ
         qX9Zv+LtHOTyqRuRfX49RdMaXDPZDMuKMxNdZHt64LT14n+Z4Arq6PCDzC/IwBVK6eWz
         XvBvOwsxiUzWmyJUP29tftUPppmq8cZDiIOvPLJWesnRr7mP58Q/h0EuQJEDZhfEXXDs
         rmc4FyCgKHoAl3kDpqnYSEAMWHTEz/mrQn24sgfIE4pBw6TM2B+XyCmTzBrLupO3x0Y3
         jY1CUcPj789S8fH5PoRNgk4sVNUTFiKjbCpXq+EsEKrpwZKj6BT379N0PhVFxnr1C9E1
         GUFA==
X-Gm-Message-State: AOJu0Yx4V3lWKg7AXZUUP0L6Osiyfc9sTSZuXn4Bho17KMHaKW4EntcL
	ljicbp66gsad7/i6Tkqi8Mmh4tjAEYBBtIYRaTriq834G7YunDMN
X-Gm-Gg: ASbGncurxU6wG6I6y3fHlAbr1nPU7X/F8xkFR6XtEmaGQgSf1LKMW4CIyaCm6bmB8BR
	x0mOKTzC4jNNeAaQUe53aAX7cErvT3IG/2pcEk6DUKDAIxPltMBzZ7/HBafhchRJh+b0W+abshF
	t24LiMpZe0QpS0tMDCFSz1WL4TeNEkb7n9FTx6CT6DjebEC9t0UqOWhB9Rocuk6J/YH0imwtFEy
	yORG0VjSUEaPJlta3wGtu8GHKbNvuPJmSSlEXHNLMaSA7AjUCxm4/vvUCdUTXAK50fMKTeYuJTy
	BUOkzNmOMhC0Un3WfghDZbJ+xCHSL1P+8ruPvSH90c49w90V1oOOJnZasmbu70EDIkY90E13z8j
	nJ+kE2CAsGIzSxosxrMgKGQ==
X-Google-Smtp-Source: AGHT+IErgzYWLdiJ/Z483qzQmu6KMDB0kzsC9i08cdYHuOJis++LcTbQAxFoXMhYPuIZU/V3kATe4A==
X-Received: by 2002:a5d:64e9:0:b0:391:cd7:82f2 with SMTP id ffacd0b85a97d-39ad2aecc7amr2132880f8f.6.1743160374985;
        Fri, 28 Mar 2025 04:12:54 -0700 (PDT)
Received: from [192.168.1.239] (89-64-31-184.dynamic.chello.pl. [89.64.31.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b663860sm2308499f8f.39.2025.03.28.04.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 04:12:54 -0700 (PDT)
Message-ID: <67bbc55b6e55ed62e275ab1796cabf2060553d73.camel@gmail.com>
Subject: Re: [PATCH v2 1/1] platform/x86: Introduce dasharo-acpi platform
 driver
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: =?UTF-8?Q?Micha=C5=82_Kope=C4=87?= <michal.kopec@3mdeb.com>, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, piotr.krol@3mdeb.com, 
	maciej.pijanowski@3mdeb.com
Date: Fri, 28 Mar 2025 12:12:52 +0100
In-Reply-To: <20250327162113.571940-2-michal.kopec@3mdeb.com>
References: <20250327162113.571940-1-michal.kopec@3mdeb.com>
	 <20250327162113.571940-2-michal.kopec@3mdeb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-27 at 17:21 +0100, Micha=C5=82 Kope=C4=87 wrote:
>=20
> +
> +static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +			      u32 attr, int channel, long *val)
> +{
> +	struct dasharo_data *data =3D dev_get_drvdata(dev);
> +	int ret =3D 0;
> +	long value;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr =3D=3D hwmon_temp_input) {
> +			ret =3D dasharo_read_value_by_cap_idx(data,
> +				"GTMP",
> +				data->capabilities[DASHARO_FEATURE_TEMPERATURE][channel].cap,
> +				data->capabilities[DASHARO_FEATURE_TEMPERATURE][channel].index,
> +				&value);
> +
> +			if (ret > 0)
> +				*val =3D value * 1000;
> +		}
> +		break;

I think itwould be better if you could extract cap and index inside the
function itself as you're already passing the whole data struct. You
could replace these two arguments by just passing channel.

> +	case hwmon_fan:
> +		if (attr =3D=3D hwmon_fan_input) {
> +			ret =3D dasharo_read_value_by_cap_idx(data,
> +				"GFTH",
> +				data->capabilities[DASHARO_FEATURE_FAN_TACH][channel].cap,
> +				data->capabilities[DASHARO_FEATURE_FAN_TACH][channel].index,
> +				&value);
> +
> +			if (ret > 0)
> +				*val =3D value;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		if (attr =3D=3D hwmon_pwm_input) {
> +			ret =3D dasharo_read_value_by_cap_idx(data,
> +				"GFDC",
> +				data->capabilities[DASHARO_FEATURE_FAN_PWM][channel].cap,
> +				data->capabilities[DASHARO_FEATURE_FAN_PWM][channel].index,
> +				&value);
> +
> +			if (ret > 0)
> +				*val =3D value;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +

I think that's the only thing that stood out to me. Apart from that I
think you should add yourself to MAINTAINERS as well. My guess is 3mdeb
is planning on actually supporting this driver long-term? :)

Tomasz
