Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC29A398911
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344678; cv=pass; b=lFaGxCtYmXCWPkxPJEBiIOgmQ8jVCzfkSqQS+MCjKtgcACB8Bi5R1CnfhgBh9qP5GwbvkUozafyaItJPmkDK9hRHrb2kqsRQbFpPT5WPu6pWhAVMsIps0c8yjbkLfY/FnZQXesoM2zxWd3YPJS4m7/5tGDSBgOs4tCwfRs1q3YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344678; c=relaxed/simple;
	bh=atfxsE8BfY9ZYIcbeNpqBFNj6lKYI227OsjDeaGNzuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0jzlz4rTSECLyFfSBnqbNbMr1T9Qe3frixVL/MTxM/ELbd2FdG4gjVKVErNV+TLJnwCp3pEseB9ioYv+5FU7gxYMxSj+MAMnbpDX2VF0kUZN2IiaqIN90AokTNOHalE81sTJUXurq6aSKxazsi8ZfFRqAQKImMByGSTMzUQ828=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToIKF8CS; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToIKF8CS"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1c52d920b8so182848866b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 09 Aug 2026 23:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786344675; cv=none;
        d=google.com; s=arc-20260327;
        b=VxBFo4f8KVPlBRGzg73kcB/xBrgz1eS1Upokn/1quRBk4QbxP91d7uh+JAC8h+ZpP5
         GbEg4UO0spBjMnvfmCGcbvvnJnP/o/yfw7LJ8SZaNHkTOtXUWuySKSMixlb76kE/VXtl
         w9DwcdCtaVWal3+4OwNfDAIIoXBYPrgWzEWCfiQwrM3YTha5GS43ZhT6K1RRiA5KXCu7
         0OuxVa1Vrkig+gB+cuvc7TKZKbk6ZoKOs5P4Z+w4UZtf6hF192L6G5txIfF98OeuQW2i
         n9kV1n/3n4mfGF45jcP0/T1gfJfp9YKH/t+34AGa+IIBYHfKM8HDj6yWvoMUI4HPK//6
         tOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=atfxsE8BfY9ZYIcbeNpqBFNj6lKYI227OsjDeaGNzuU=;
        fh=OSmekBR/b4bnRVU/KC1EF/2OJUZqG6s8XDuMum3EzPE=;
        b=IPviCVxdnSDogZdLHOYrb1Ix4+/VHZinHQqrVdGAZ7qQeNMSSGxrkpy7/Zh6Vzt8mv
         S0srbmF8ND4fDP7iaqdlEMTfPzevtwy2lHr4HFjnkL3rlxT3g7S66JvAniUQM1miODeg
         LUeMbRO3+rXKkb+A9WiVo9rmti5rDGtNDVlAfBVRZRDMTxVchzwb52QHrh5wTiwhAnaB
         fbHJWSbxKHVNKN+yLv2hUFE+cHT380ixGxktDFMrjWf8uZfBpf4zNGHlVLL8K1MadyQ7
         SueOQ6AGi0i/w4HJbuNo0e7ZsPjfsfr6mHWOzT33NHCKpYVKSc3k2dudYXwFUy0WnCjO
         Um+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786344675; x=1786949475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=atfxsE8BfY9ZYIcbeNpqBFNj6lKYI227OsjDeaGNzuU=;
        b=ToIKF8CSv82/sZENuMcv25uMZ2BVHN3EDcV50xAqAgjB3ZJ4IauTTdhxET8C9kDFf+
         S6O9JdRc2MDBOA4AexTtfBpQig6qla7kzUkjf/GLumWaEd5nuagqh/XBn3yls18G/lpZ
         +Xiu8UB1YgDcfhLBQz1cC1ksve7Ig0VEQJwZmcRvWm8YDLQ4+cZTCaWItW7xbQDLbdhd
         PjOZzpIZ50xsHyFFa6i03NJPbZpreOZOcAQ1GSB1wLB3CxUzK/wD383tCJozV9nr7wlK
         v0+6CBXmEjIEynMCUmWfv9vNhTK7DuG4bvg4FtAvhZi7QE1RFwyqxYpFNbzb4jI5qtlf
         ppLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344675; x=1786949475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=atfxsE8BfY9ZYIcbeNpqBFNj6lKYI227OsjDeaGNzuU=;
        b=q2d2E+YwzCj2RhXXGWjdsLcJwJn4F92rWZqZtRd2XMRsxBouD7QSfBoYlCidjrVcTE
         pr9TBkEP7ts4quHqPM8VjJNPyXO24UVDv/Grit750BwT+QyPtPo+zHC28wn67vDpZ/Qr
         Bw7Lj30ErwNRbvWISvWenOwv0F7V2CHzS9MzX4rVvuKESp9083Ilhhgd9/csXZVQ7sBS
         0xnsJHTKxmUa2CcUdPVKela2NMr89+0aWBA5nIN9k0UVVeb+tTeUa+mdCNjySsNJ+Wrx
         MkVToSjIDWv079MgIvunMnUlRNCFCk31YVbdc5pQ0mHxKoeOR+VmYtPfwYYlEXhBTttj
         KxLw==
X-Forwarded-Encrypted: i=1; AHgh+RobQXMhuSOpFBAFentwdvB7+ycxMtm5guAESL4N2SBQD6/WiK0sBOi5MIyqq8QkF77Q6+qtvCZ3pofmceZCItVYBj/S@vger.kernel.org
X-Gm-Message-State: AOJu0YxdhqLsZB6G20cnO8wFfn/Nz+jYpag1JbV980tgiCqOTzRNu0Po
	NrFGoojmzJiNPp1NnnL2xAZtKigcYzD6m8GzgI1ee6ydL9XV9gOyWTdxr3ryx0Y8m93F2UC0NOh
	ETeTOgV4sloRpXn6t7CvdVyofAnT637w=
X-Gm-Gg: AR+sD13HlJmYnKSWViqWV37gAf8GhzLla+gzpH7oJQB0c/fUErTfvak/hLS05siyuAB
	afijz5nJsBzdOUKYSN6c8vTLojnc3z9H8QcKjUoWwuTszDi5dwdr/vM/QBbce6/zBLWQnrbkIV1
	CIf0cLUFTcgwcnVLRZ7XF55Cdw2EH7PumKJpYfLmSL/H2HCrXIPmXYYJ1GHYdh5LHc+ObSnZg3x
	WMk3NfVUELo7reIR6+qu+iHt5YZsQ0UmbnX+M7gXKllGSNqIUV4ZuMDPhPkoGZ7Z4cHkaPao6z9
	AhOgjdpxxbT5rHFkswSkLFkCnjoNbXwOgty52ygABlI0okA0g5EodyCI7R3Nsei+sGivWX0HGlT
	5H/eVXTw56hVFDlx/cf7jODwHGVvqPxl71zZucQ7CEovmiFCbkfceVsRtOv/SuSZUvqz6pnXqUf
	RDldYofhFoLpM+3Ql1kGLtZB9bgGcfP9mnTSLEJCM17Q==
X-Received: by 2002:a17:907:d08e:b0:bed:9a7:5ed1 with SMTP id
 a640c23a62f3a-c20871a8cdemr913069966b.5.1786344674587; Sun, 09 Aug 2026
 23:51:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810052625.27614-1-phucduc.bui@gmail.com>
In-Reply-To: <20260810052625.27614-1-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 09:50:38 +0300
X-Gm-Features: AUfX_mxI9ias1386u9cDVwwWctiV8vuFcAHDW5DtkAl66oveRMJbWyEAzQvbA4M
Message-ID: <CAHp75VdsGhuq2JP9n-gbx52gLiK73zQVw2XEBrXmTnoO-Ojnhg@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform/x86: hp: hp_accel: Propagate errors from
 optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Eric Piel <eric.piel@tremplin-utc.net>, Hans de Goede <hansg@kernel.org>, 
	ilpo.jarvinen@linux.intel.com, Zha Qipeng <qipeng.zha@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:26=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagate=
d.
>
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.

Please, slow down with these patches.
Always try first a single or maximum a couple of patches of a kind to
see the comments, now you have to reconsider all what you already have
and basically wasted your time (instead of doing this better). See my
other reply in the other thread for the same problem.

--=20
With Best Regards,
Andy Shevchenko
