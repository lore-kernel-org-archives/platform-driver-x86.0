Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E962D2D9798
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 23:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137136; cv=none; b=SA4ufY//3UJaZ7Xu8/ZtIUHRIcDOlAQf9+/pljwbZSJYValpp8NDE05+zIUFGePNi2TOIjrc665BEJEMADAMwaLZaDT7S/ggN981glzYl8mYdYGjpR/p6IJl28cUGzFvBQ0YrTdweGUgDEHpe8JG9ogf9Kl6qLu2M1QUAOBZuws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137136; c=relaxed/simple;
	bh=l2e/ujWBSDuB+2IVgledu/+gXbBeJ8pUNmh2h0YwJ4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYCw7csDdi96NhXRK85RY44u2gCLUHQ1E9Tg0SQxkU/vrZYYDz5ofWWeCxA/ot+BoM2Lp2oUseojYI0wySrRp4WwK1z4mSpqOn38/mH2BGtCvImhyd3KTeYfR+PRiUmjuGtQNl8uSzxr83WbbFou9TBobD0MbiZ9tp3uOKsfsVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwV6B+x7; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwV6B+x7"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo11633461b3a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 15:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767137132; x=1767741932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7F2kJGHYqDpZ+Do5YwTgmLErhm5dkAEvqgtyJT7OYfQ=;
        b=WwV6B+x7LKH4Os38JmxmAIhRCXL1+8jxAD0SIrE9oE86mArf1POPQ9qGQhNsDaCQxF
         hTi8pYprSVW6+UtEllZ4yysZxATqMIopCeABB4YDliu9Pvw1aSL+HW949s9B9vqwtmYS
         UiZxxfVFCfWGORFtGEXYKZmvqZ4UdgWoQJOpOHBHpbyoe8AupeZ3Loo3sskovzFfiYNB
         BZi0u5TGcryDXR79OMYSIW55GP8v2Z7PqupCr8xp70WyMMuKziy+30e/j3RPfSS0PE+Y
         ol29cdhps7uOFP6aWblBgONQEe/06Axab1woDCJpC9EBKvEIBjFweullmJf649Nq6V4E
         34kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137132; x=1767741932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7F2kJGHYqDpZ+Do5YwTgmLErhm5dkAEvqgtyJT7OYfQ=;
        b=DwyconGzflW05JHNJu7lFiZjraJmfwfJNeKN14G36LE0VTm/u34YZHHMauWuntVHb0
         K5/kJ1I+CgoiGpGMS1SM9t7yscLFgGHqvLTsMR+8Y5L+s5GIV53mSME6PxwMQofnNS1a
         lx3f4owwAzXku5u1remNwDvyJVaesq2umOigatuhlClY3DMSr64EDILshWDzJAxNHohm
         5b02g5XWBtO8FbbQO1tTtk84Dldblbn9q6qcCbfg4t2ohN6faYQCcTB5cZwAobkepBss
         3oK1kSCTtm8RPHUpuco2PYPsE2kvaTXgLVuz1Y9g5b3lakX+S1gnTnNxAIXAMz/5AVl/
         oWhA==
X-Forwarded-Encrypted: i=1; AJvYcCXTGCOnqj7fwcYWUGrDnjU9KsB31IfFaupOOvt4a1GTfz5yUmbnF54u5tLOcI13APRlYWG4AXCakFkcjoHw9I6/Jcyt@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBv0EFnti0ru6rKP2hkrRfW1QBc7/7Ulo+hiVn0OPM1i3yy9G
	dnczH2RKIJFninqXANNDD4+iyUePVAw0DT2uFdIM+pltazzu9AVN0ADR
X-Gm-Gg: AY/fxX7APDSm+AKeHjgWah5CoCEPTco45EFJntFnZKT6QDTKJ9V/l/60xiyLTxqY8wT
	FSysV0Em6KgsaT6xXIf+EcHDiKRyt3QIdZ9jKFtcjjhVIrGRC+D4XX56lOPZdUMbL0CAoRuX7Q/
	LAylHG81syhbH2Z09KqRGVFILIVMHlo/MmHsxWm6Skert6YiTNZmnuEn2JxdgDHpXrezI9TQreY
	e2D3/Cm15j5WmiCFlPBzmeCNV0HKM/XRa/4tzkl7LZQ7hLrlhSL3sf/u3ckwMbZuxW70upwvZuk
	DiJ0NPI5K9fusMISCyFOYsnPqKJ/zUNYRBIe+JVlYqumsAZ5ibDZR9NZc6J7Qt6xFiCmSd+KqiA
	PzIFbKALAyzqbuBZxIzdBSK5qh0KHtY96iXXt1YYBo5dzN1425ToeGV/0SVWse6fmcJ5TCklRW8
	K5SlnQRWXBuIQ=
X-Google-Smtp-Source: AGHT+IEPZzDF3HvHUqckaD4jfdHp16buEoDVpGtUVIOkATh2YAL6gS18F8DLgVC2ZQ/mDsUrcAK3Zg==
X-Received: by 2002:a05:6a21:9997:b0:35e:86d3:88ca with SMTP id adf61e73a8af0-376aacfd817mr36203306637.59.1767137132106;
        Tue, 30 Dec 2025 15:25:32 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c2e20a646e8sm14197124a12.11.2025.12.30.15.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:25:31 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5D5264289545; Wed, 31 Dec 2025 06:25:28 +0700 (WIB)
Date: Wed, 31 Dec 2025 06:25:28 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Akiyoshi Kurita <weibu@redadmin.org>, Kurt Borja <kuurtb@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: alienware-wmi: fix typo
Message-ID: <aVRfaNBv6r4rXdUa@archie.me>
References: <20251230213431.656106-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fvB2anBiOh2iRjDp"
Content-Disposition: inline
In-Reply-To: <20251230213431.656106-1-weibu@redadmin.org>


--fvB2anBiOh2iRjDp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 06:34:31AM +0900, Akiyoshi Kurita wrote:
> diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Docume=
ntation/admin-guide/laptops/alienware-wmi.rst
> index 27a32a8057da..e532c60db8e2 100644
> --- a/Documentation/admin-guide/laptops/alienware-wmi.rst
> +++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
> @@ -105,7 +105,7 @@ information.
> =20
>  Manual fan control on the other hand, is not exposed directly by the AWCC
>  interface. Instead it let's us control a fan `boost` value. This `boost`=
 value
> -has the following aproximate behavior over the fan pwm:
> +has the following approximate behavior over the fan pwm:
> =20
>  ::
> =20

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--fvB2anBiOh2iRjDp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaVRfaAAKCRD2uYlJVVFO
o7yoAP4xgxlf6WfXwJkO84WghOA9SSdfFfNAcwWdQF0QVl+LDQEA/cR9XIgV1pkF
hwSzjt5T6wS19FhR5FE93YU7mcTlfQw=
=4Vkb
-----END PGP SIGNATURE-----

--fvB2anBiOh2iRjDp--
