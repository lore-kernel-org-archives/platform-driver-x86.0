Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6F741754
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Dec 2025 01:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767143053; cv=none; b=hppSlqIuJwBUXgjUFZwn0lVBTzbZUSEIIF9tCwsAVp6k34KPi4MnaaXaPzxX52UKu/jwhdbQwcGizGzAyYIJusLsi1S7CnVEd52hz8YnsYFwd/OIJ7SMvRaFInXEogBRtQ1qHDrYCmA8TcD/5C/krAp6g2zzwGi+9fs3megRYVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767143053; c=relaxed/simple;
	bh=Fpy8lm8jThG/D0yzwc9yXyPJWjjOL6JKFjNiS6/IWXc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=h8M69I1p7D33MK9asz/n6cOapG16GAZYPhrfYhIrkMAyFyc3fa877bCJoto93Y/KWu+Jt2Dlj6Zc6eCj4V7o2xFCpmGaRLYngIaJLt8twgg56TIO2EuyTUGcGXdVRiNtzGNyhsQoyoUHyGFAMyLfm1odmgG4Q4ueonMJpCj8ejQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meSNeOPv; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meSNeOPv"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-93a9f6efe8bso2592737241.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 17:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767143051; x=1767747851; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAX74BmvxVQXzJSekemr/FRqczFWgBJEcW2RYGIFiN4=;
        b=meSNeOPvV8FzxoRk3xCvojsFiEmJUPXlA2qUM5XLdm48puA3FAECS5KnbQDzIjtaDe
         CK6KwhwboZimEllJB0bpplHfoxrL35O1tS/PXnPImrgP7fHMJbA+AHvPrqoISrwoQD3Q
         1a0+Tawa7GGBJeDLwoWfezHpEfCKjYzesGzPKGd5UN7SIP1ghJ77wKth5/eXk5GokMiZ
         c4oWyCx/hZCAdYX8ic7gyQ+B0ENOPx+mSWoOOYMF8G1zeJ8FL0M9HbEaHbrT/G+BdkEi
         4eh2tq0Xq4OIlEmgVJl2NbKDjvGzvv4hRatUEjqIFRM0CN+WzNIZvnl/ayDKkm0hmqdg
         5o3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767143051; x=1767747851;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAX74BmvxVQXzJSekemr/FRqczFWgBJEcW2RYGIFiN4=;
        b=oNbDPsHEoKT9n5tf9mP0DNxHDpgUXl/2HbkfJXs8e40wa9vwMyp7SrJ32mSDfaUjba
         ApstKnEsdHzq5f8CyB3jVgM1a44E0NfAAkn15erpX+1BNtowW7NvvCGLyglizIftmjtk
         5jZH9XtezbgjeVAajtBYLU3PWPUYVChLllNzY7iG3D7vqeiNLMq01f7gK3Ew0FMUM+nv
         QQMqdIbvPoNu/F4aKdcfU7L7QHZfXprl/9YRxKoZP3qGUippi23q5URgWD1OcE0BJwLD
         PzEXk3J/h1YEuHZib3cGQvqAlKo2fEOR0AewosB2lElxd81LQ+p43d42kdUuosBmPBoi
         V5cA==
X-Forwarded-Encrypted: i=1; AJvYcCU/fBXr6ZjAxeiR+PvFAM9jUYNpP+0chYH2pcxX/LDrIL9xMsG7U+5u19Nd3zrWpVlhu8x1J3K5XBqCRaVbhn6NwKjh@vger.kernel.org
X-Gm-Message-State: AOJu0YygdE5CaXc1BA9zqGkwihxZ+Yap+Zt40kUWEaRogBzxZB0uHSyl
	ekJ41OdbbZ519oKCJTTZMOFd2/fqvwhuRvcVaxndpbw0JE6lAH3VUX1F
X-Gm-Gg: AY/fxX5c28+51Ac2GzwjCwuhCTdKaOYqB75ylUaDg6uv4F96joCBs6UUq+3v03mr/CM
	WFFxfI8YROHstnXhBnnm8fv+JZTDMSdqJ9JmcFdpjPm94gU+G4KtK/gxfKdIjUPJELecJbYobhQ
	iecGMhh0Dgm6ggXXnKF8BKUGzA6rwHwoUgMcx0ReOCs6QiseU6KnmxKvAb6kidVYtI0mmAmK8lX
	Kpz21R5EkXloTC7yLRtQIieEC2wt3+IQCtS2AVou4xay/jdf+iMCphV6d9WE7/xGS6U0jEvJPdT
	5a24NNUvavs+FmPO+H1eozfLLE3iwvuWay9v4Qr1BSR9C+IysEvmblBp7JaG+8sWXk7j1BuItMF
	XiZCk6LuUz4wNpzgOdnZJIZyZ3GrdshRkencS99Z7eUWqRoMol5yQvqqw63rEnq1qS8OomLEYmO
	rA0lSX
X-Google-Smtp-Source: AGHT+IFca3JpP06yUn+E3l+NnHbW8yPJjKbQ0ySWazbNvpK2ZNHGuhixKzTgRHDtOJHLh10RQE1NwA==
X-Received: by 2002:a05:6122:2a44:b0:557:16bd:4e52 with SMTP id 71dfb90a1353d-5615bd3102bmr9899489e0c.6.1767143051025;
        Tue, 30 Dec 2025 17:04:11 -0800 (PST)
Received: from localhost ([2800:bf0:61:1127:ab87:5602:531c:8dfb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5615d1329ffsm10746586e0c.13.2025.12.30.17.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 17:04:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Dec 2025 20:04:07 -0500
Message-Id: <DFBZXGXJ7V8U.2SVEP0L9EI8AA@gmail.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>,
 <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] docs: alienware-wmi: fix typo
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Akiyoshi Kurita" <weibu@redadmin.org>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251230213431.656106-1-weibu@redadmin.org>
In-Reply-To: <20251230213431.656106-1-weibu@redadmin.org>

On Tue Dec 30, 2025 at 4:34 PM -05, Akiyoshi Kurita wrote:
> Fix a typo in the manual fan control description ("aproximate" -> "approx=
imate").
> No functional change.
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>

Thanks, Akiyoshi!

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
>  Documentation/admin-guide/laptops/alienware-wmi.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Docume=
ntation/admin-guide/laptops/alienware-wmi.rst
> index 27a32a8057da..e532c60db8e2 100644
> --- a/Documentation/admin-guide/laptops/alienware-wmi.rst
> +++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
> @@ -105,7 +105,7 @@ information.
> =20
>  Manual fan control on the other hand, is not exposed directly by the AWC=
C
>  interface. Instead it let's us control a fan `boost` value. This `boost`=
 value
> -has the following aproximate behavior over the fan pwm:
> +has the following approximate behavior over the fan pwm:
> =20
>  ::
> =20

--=20
 ~ Kurt
