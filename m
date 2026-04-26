Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72952E888C;
	Sun, 26 Apr 2026 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777207865; cv=pass; b=GEmdwfi1+jHWc7qTDQcfMYAxVdS9VskB9/rJMDoytIj92e2CtGMOfKwbrkHrJk9KfOWi+wzKdFLGxlkLl4dTOtfa26oPfmeFfW/hpazMsLEqvYusTR7xmYmcrTkX0zcoeUAh1t21Bd3osS401/BO6tGmpA3FeH1euUbYT23XO3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777207865; c=relaxed/simple;
	bh=ch3pQIY31XUqdzQHSfAbXCrd45RugglYbBSk4bAs1JU=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=a6l20dToi7gI5iN22sO7h5j4Z/5nllUkdAAo0KwBR4jY+/efr/LSjD/hPHzX0lOAD6n+YSz4KBZxdbb4sCLUCPWC5Ah5BWHPxkPWyBP0hhNrkNwn1PV5Y3Tbt+rOk4u//erPhZeBNjYpQnIFDggkALSQrpJLqap6m39pUlHufcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=nMYjLCWG; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="nMYjLCWG"
ARC-Seal: i=1; a=rsa-sha256; t=1777207855; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S6fxFZyAbwZ1xYIT8XkWBCoYpJKDiaYIVUedY2DEYgUW3PzNm/W1dY67FRe5s4az2gIxi/AEuEbH/FgrpXmZzsaa1zroNblhxECRAkMaxDrLMdRHQxfuPWCteKkWgnt7mMqNA1lB07mQRYNooTmgQOETI4TmJc6r6Y5Uskbm5/k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777207855; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XD4w2q4kECMDG7qxcFSeN7vp+Zq83dnYmVZF3PEB0HE=; 
	b=l7Y7tVSNdvEccLkc6xKExcYd7WX+9Kbz6QkJucDHlG9+66MwRBkSxbCIoXx0DRim/ZoPynJcsTdvjZCQgvyw/M+vZ3zfhYPnmL6hNIg2cA845S0oQ08xLy7Q+nRKJPTUPnR0qyUvr5AqhivArlmeXL+pmP6ahQDSToUny4DGPB4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777207855;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=XD4w2q4kECMDG7qxcFSeN7vp+Zq83dnYmVZF3PEB0HE=;
	b=nMYjLCWGipWpd+2NNAZP8iQn43cx+z3Y7UNIfuLKXWEN1UgWpReoiG06CgDyVNX5
	pZ8qm68SEGwlssmcFvqpMq6/5FCIFTvSKi6MGX9dr6ktEjIbGofSfkmskrhPDKYqEwg
	J1q4a7CjNTkE125Wr+zj6yMhibf/oHaV1uFScLRX0EY1wGD3kj14yWKyIMDIp1fIPFH
	YnktHR5Pfg6Cex9IzM29xIPW9Ytbbfxrtqeqf4/l2Mjmab03/pXnToNp+Nl2N1Q/idb
	4xsaf6c1ucB4fN4FAI7Hw005T7+DpIWe9vIXHcN7KgiELQyEX7HxbPrM90pLbxhz8+U
	4AnH6ravJA==
Received: by mx.zohomail.com with SMTPS id 1777207852804279.99062008879434;
	Sun, 26 Apr 2026 05:50:52 -0700 (PDT)
Message-ID: <237b00349e3c1ffce21464cdd4301a8c017a2ba6.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: lenovo-wmi-other: fix uninitialized
 variable in lenovo wmi-other driver
From: Rong Zhang <i@rong.moe>
To: Yufei CHENG <cd345al@gmail.com>, mpearson-lenovo@squebb.ca, 
	derekjohn.clark@gmail.com
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260426102725.3204-1-cd345al@gmail.com>
References: <20260426102725.3204-1-cd345al@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Apr 2026 20:45:47 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Yufei,

The title is too verbose. No need to mention the driver's name twice.

On Sun, 2026-04-26 at 18:27 +0800, Yufei CHENG wrote:
> When the flag relax_fan_constraint is set, local variable 'raw'
> is never assigned, and lwmi_om_hwmon_write() will pass uninitialized
> value to lwmi_om_fan_get_set() resulting in undefined behavior.
>=20
> This flag allows user to bypass minimum fan RPM divisor rounding,
> but assignment to 'raw' only happens in the non-relaxed path.
> Fix by defaulting 'raw' to user provided 'val' in the else branch.
>=20
> Fixes: 51ed34282f63fab5b3996477cc56135eb4de5284

Please run scripts/checkpatch.pl before submitting patches.

> Signed-off-by: Yufei CHENG <cd345al@gmail.com>
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 6040f45aa..6c2febe1a 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -349,6 +349,8 @@ static int lwmi_om_hwmon_write(struct device *dev, en=
um hwmon_sensor_types type,
>  			 */
>  			if (!relax_fan_constraint)
>  				raw =3D val / LWMI_FAN_DIV * LWMI_FAN_DIV;
> +			else
> +				raw =3D val;

What an embarrassing mistake! I missed that when I was adding the code
path for rounding down. Thanks for fixing it.

With formatting issues fixed:

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> =20
>  			err =3D lwmi_om_fan_get_set(priv, channel, &raw, true);
>  			if (err)
