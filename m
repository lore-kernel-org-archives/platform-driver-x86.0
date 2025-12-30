Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743614C97
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 23:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137025; cv=none; b=nP1YdEijfYeu0GRS3V1dQ13uvJy5spovma/BMWG4wgSg5Ea78AJ3Y5tB17TtWhj7OZpuSpTbF/8Zs04CoekqUxiojUPL0qOkrQ9HrLLgsDPSf9963SrwPEUfUnzB040Ky3tYgVUMPpkU4ixNHvne5/oKTEQMbn99GdRpMx6+ByY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137025; c=relaxed/simple;
	bh=dpARkM13b78pq9TpbH6X2Q70VD/8J/fJrvDH7ozD808=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SrUsi/J6KC6DcQPfJy4mXX7Q7WFQ7GWuitXXyHJ8dFi/4P4QWGhKhiY8jn1AtgMDPdMepW3twnarik/hDqE5+ERzKk/vKhz7VzMMhGX0s0779uoJlYE/Y6j7A9cCp+DhzH6tcPFxSrMvII/78we7oepBYcfAqpnbfYxg3BSpXhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6dqqsBu; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6dqqsBu"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so8930604b3a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 15:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767137023; x=1767741823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ppc/V/y5giPyVcC1Z+DEWgweC96ZEZVWoe6J0CM/U4U=;
        b=J6dqqsBumFcMEevdSf7YgJ5kZJCLRhPMV96S7IsH+YMILJQdOWSIrczK4CB31yTj/7
         9l3Uyb4I2JbsV23QJI06oM0VIZS3YSuvlia5ckMHdvsVV1g7pQs/7e9GDPv9YGDEO8Ik
         91Z8XP0JcjXeHzsGNYrXGdStl/y9sjilSCI29NdkZpMXuv1tTmd33HgR9pB/EcbkgzH9
         Q5SbsadigrcjssrZuocHVLGWsnUhxXSPLvzHlPmUfX9u/d2HCxDLBP8nYjWaDmWxvcH3
         g1KFezmiIpClQkA8uk1CSgpR6ox2S0l3/C1YTalwCEGjjxkKnddWOn1MmEL1AgkhLoCD
         svGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137023; x=1767741823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppc/V/y5giPyVcC1Z+DEWgweC96ZEZVWoe6J0CM/U4U=;
        b=p+MjdvLREXfcoCzRXbAWaM/pWgZ9sFP65QKwDQSVsmx1KHbvutGW5QddkfMZvCiv+p
         rdgWYSgNTirL6CmUlsS46pKv/A5IZ4kqsWwRyy9l9Ase4sQ/exu8hIT7HApkdVfTRdCE
         +IA/fkp54eD9RzHY9lXWtFHUe+uFoVQH3984P2xhgYB9UeY6YyJQF2YpwGCs5YMCEGfh
         fkfaRkrDTvOJTnJ9Bj/qrTbSpavCR145gdIirv680rdNLxMaVJzHHGLPS7U8xeefOpRL
         C2ZYGFcPO1BqVf8Y8T0U93B6O2Xf2dztC8JLiwHNWr8MRU42QlEOtzDNyfvphHMuuO3F
         UCjA==
X-Forwarded-Encrypted: i=1; AJvYcCVvj8QG+RLbdoDI4598NuLYOWjkyKuwyozmTKj6BUyd2R6UqMVrJxryH6IvnOX6eNtwERdjYUiTgMyEBOdG3q9aGQBB@vger.kernel.org
X-Gm-Message-State: AOJu0YyIK6VrWW0xdP9y12FGIdBgu1UaIxKZjXAVVR/0IfCh1kIXL/Ig
	P/+Vgu0yp5b6ASd+9M5Kzv5A8prPcMkwPRxdtslwdxjZHEkk2NZfvaDt
X-Gm-Gg: AY/fxX6gXt6L+oFBgppvn/1HeFpT+uPjSylzq2OzvEB+I1wcNQMmBBs2Wu9jV490d1Y
	N7qYVoWwPZKvfzEfQ7p6avy86T9AgOtbfwK6312TI7wPzeZQcQpwsK45NDhDVz8brRFSucxQNUw
	QeSCV2m0VHaLRZ/mQxXhx4pKGbztAsFJ0Kso8oCdfud5zyGSbAl3yzQyFMKqNs9j4JQZm2EX0on
	qXz5fb6oebXolkfculMVDURlwvLSGQdBu2QDhAH+7839IyOidzo0cyM+7fL6YaqoalOLTWcxoSZ
	OX97MvFwc/U6JzkJw9BFM7EohF+LbNuUfmh2EMrDCWVlVs2+ulL1R2lvro28KwK0TtePjgrId6u
	d/Z3fz/DakcIY4p4N4Njgk4gcvAuU+hux4E9FJlNDoyJS4d4PiL5k4YQUOuO2+ttEmyRBDfvO2p
	g389XPYEbGroo=
X-Google-Smtp-Source: AGHT+IH1A7txo40dzYd48YJzrYaGiNIAMOTmlGTdbdLBdcz+YA+p7mc2GmGa4VSQzEtfMg3GRaZ38A==
X-Received: by 2002:aa7:9a8c:0:b0:7e8:4587:e8bc with SMTP id d2e1a72fcca58-7ff66479851mr27754369b3a.47.1767137022692;
        Tue, 30 Dec 2025 15:23:42 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e792b65sm33871945b3a.58.2025.12.30.15.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:23:41 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 28236410EBC7; Wed, 31 Dec 2025 06:23:39 +0700 (WIB)
Date: Wed, 31 Dec 2025 06:23:39 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Haiyue Wang <haiyuewa@163.com>, linux-doc@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Akshay Gupta <akshay.gupta@amd.com>,
	"open list:AMD HSMP DRIVER" <platform-driver-x86@vger.kernel.org>,
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] docs: fix PPR for AMD EPYC broken link
Message-ID: <aVRe-0pW5MNQEFPj@archie.me>
References: <20251230133101.14362-1-haiyuewa@163.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G1cJwQdltQFUuZiF"
Content-Disposition: inline
In-Reply-To: <20251230133101.14362-1-haiyuewa@163.com>


--G1cJwQdltQFUuZiF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 09:30:50PM +0800, Haiyue Wang wrote:
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86=
/amd_hsmp.rst
> index a094f55c10b0..8bb411f0d70d 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -14,7 +14,7 @@ set of mailbox registers.
> =20
>  More details on the interface can be found in chapter
>  "7 Host System Management Port (HSMP)" of the family/model PPR
> -Eg: https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs=
/programmer-references/55898_B1_pub_0_50.zip
> +Eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
> =20
> =20
>  HSMP interface is supported on EPYC line of server CPUs and MI300A (APU).
> @@ -185,7 +185,7 @@ what happened. The transaction returns 0 on success.
> =20
>  More details on the interface and message definitions can be found in ch=
apter
>  "7 Host System Management Port (HSMP)" of the respective family/model PPR
> -eg: https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs=
/programmer-references/55898_B1_pub_0_50.zip
> +eg: https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
> =20
>  User space C-APIs are made available by linking against the esmi library,
>  which is provided by the E-SMS project https://www.amd.com/en/developer/=
e-sms.html.
> diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-=
devices/amd-sbi.rst
> index 07ceb44fbe5e..f91ddadefe48 100644
> --- a/Documentation/misc-devices/amd-sbi.rst
> +++ b/Documentation/misc-devices/amd-sbi.rst
> @@ -15,7 +15,7 @@ and SB Temperature Sensor Interface (SB-TSI)).
>  More details on the interface can be found in chapter
>  "5 Advanced Platform Management Link (APML)" of the family/model PPR [1]=
_.
> =20
> -.. [1] https://www.amd.com/content/dam/amd/en/documents/epyc-technical-d=
ocs/programmer-references/55898_B1_pub_0_50.zip
> +.. [1] https://docs.amd.com/v/u/en-US/55898_B1_pub_0_50
> =20
> =20
>  SBRMI device

Looks good, thanks!

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--G1cJwQdltQFUuZiF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaVRe9gAKCRD2uYlJVVFO
o22JAQCTLfhizF1Okt87pzmW5A4M7PaTbEp/5V3fugmw210CGAEA46GVztjYCJyG
IdNhR0rPr/5TecK65p5vdnSaYbXAqgY=
=mqEV
-----END PGP SIGNATURE-----

--G1cJwQdltQFUuZiF--
