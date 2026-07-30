Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F711395AC7
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 22:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785449335; cv=pass; b=CgQLAhBGEGQ97qp8LGSmVqnrnP8l5B3yx2CPc7EacqN8dXme0CKTeTR8PJ10PbGCLJ7zy5ielVh7h26xzpKhivZTB/Yqaj1aD/xKsRTg4l/MaZV7XZtAURQzKFHPGcdcdQwuaJ1l49gS0MYiq4Z7/4jfXzAt4lTY9EvxjKspWvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785449335; c=relaxed/simple;
	bh=DN3co1XKFhNeGjyWgAuq91QA/HZEc5HQWOlWjkbI+Ns=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwIq0k8xsiJXDHPC5ZOmV3b0e/Qn/+HR5lPSZqM7RO/jALukP6jN6SRZD5GVqEwKp3Z7/Jdh0lOlIfC7I5VBVst6yaxssYMH9E/3bFctdAQnSxKJTdR+E/ph/Eteuabkz+y/hzDV/dOpAMQCF4MKS82dESGNeGql0CVXetg/J10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJ9X1plW; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJ9X1plW"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81fc442789cso5013157b3.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 15:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785449333; cv=none;
        d=google.com; s=arc-20260327;
        b=XuWTCJHHpRNOzztI5TgOZEA0bWHsSiSP8APYSisfYhp8yc3/Y6MTlCBrt+K+wwzMVw
         Y1E4F407j6jl+etlKgzc+kfNOeY3QDCXLDc0QxOjmT253XHOGi64n4oiVduY68zhNsQ4
         65mamBxxUodjLtHRXTJ8Sw2VF5xEI13KhQ3opWysOPPsDzKlRrSqvX+LjsBoWd3RwwbK
         JVWBe3BtQYawatyzOYg665k9wszGR187jmqNrWqKgDdqZUzf/xVr+sGetyMkQwT10Ax9
         qReCYJKr0zHyWWzldToJSrWVWpv6J46TqTcDEO51GuN3a/jiMF9O8o7t6IhZLstxEPg5
         xfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=DN3co1XKFhNeGjyWgAuq91QA/HZEc5HQWOlWjkbI+Ns=;
        fh=V4bcp99xgMrRkoXmRH08nke3buTm0RTKeWI6HwbVcpw=;
        b=W/dgIc7QDoWuOGAC/2cAyBiEwEntK76kCHKqgxLXIxdngBsDEPDmc3VTdowpe/KLnT
         GRszTFwT6ivGySLskAAlzbJ50c8CN0a67r68IhTOjHTTJ+gtd61hvGbuiXpM+A7khPEH
         aYu7DwqbQqgo2ubJIWteGjYCuQPC1ZhALs4SzkmDKzDTnpzkeU0MN2CB9hva125kd76w
         28GpVt5npIwFvbWxqlxYS8pUYofXXuKMmqX2TWQ7JliOgGOblxE9U1GM9GajZMlw0K46
         xFyaDcEh4giDKyZeztU8RPyILa3XfE0dQBNCfrOuas3UDRHftmL3SwTjB8i5k0LYuqD/
         1tTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785449333; x=1786054133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DN3co1XKFhNeGjyWgAuq91QA/HZEc5HQWOlWjkbI+Ns=;
        b=mJ9X1plWHON9zHyrDP6D7P/24qxnQLqLsdPf+hhdd8c6aStOOef+9YT/r7O0j3MZio
         qsaVqhbXPw3NVaXofA4LGxMuJPCgcQO0gq3wABF3R1EWaNRy+MVqgQFYJzf8HQ5/8JLM
         oNq5khGY3EncnppsMdXl4+Z0c0LSCUvaGIT2o0w2jktcZBz3wtVFIWAlKgdpZwbbbt/f
         ruS15g3qYJuTfs6Z4uMvJlsO74E6I58UZDvv6z4AK424FKN8wl9l8jCIIVppIwnEGzFT
         OTKrJSQdak4IOaIFv4WftxKxwXDjIYrFMMSc/DKpaFAmzwbvNElB7jmx3nqLsuQkvsUf
         ZLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785449333; x=1786054133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DN3co1XKFhNeGjyWgAuq91QA/HZEc5HQWOlWjkbI+Ns=;
        b=ELrN8HrsILOai91Nz++TcRampP6NSwXXQ9UUmjzLNf9mmM4vaQGBqyA0RbjCa7s0Qk
         twjse2QBZ8LTMXWyEv5ZBYmycBYYPWXwpOmsUrXv4dAKhwF2hOxr3i69CewBrfJ4G1vT
         LmzVNRLqo9K5UJDMA/pph4Y6klqMvVfAlBG+2hKHR0ImVV5Dklj7x2EvBbOOX1NxTrNA
         TPCX5RjGiZ1apU2FxL/eL7UrP8Y3nO8hxGU47+3Yic4LqHF9q7NVHaTUSWKaNUeW9rpZ
         +259uwLczdirf4WGCb84tHR4gjuehFkG0GBLSihmQbFT+9Dgra0nmbMCHs+KMtvOZ04N
         tq6w==
X-Forwarded-Encrypted: i=1; AHgh+Rr5VORb5EcnXZGLtFLblg3TlKNyEHpXIYwDNarTadO7AgvXhBvl17u5HaerQaIypO6K+mDAjfRnKcRZcBRsO4IeLEST@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1EPe9Gj7a8OhZrJa9um88u7ZMPVN+aNHymOSG4gMsP48xNK8q
	uiDUNvJJ7quBxMSEdBTkOSuq5Z/PqlHopHx7N2x6da3M+SetOwUG92usNnN48hGxzV6hsEVhlSY
	87pDtGqhDwz/f6KWoapQAIdf61he1mDQ=
X-Gm-Gg: AR+sD126ToqIFUbgSWFcjqiwjuq3KAaQUr8qFl12dp8lYzqZZzc9Dd7CULG4ZrqGpAC
	87W5u3tvymj6CjsFtbeLDBPXVo6ibRevHbY14x7txZqUeltSGjfH10DJxn30c8zlfL5A0KKbqji
	tFwhKmWs4YiUC/y44BN2LcOCRVQwGtf7+bjv1cCrqnKVOQ7xK6kS04v8oVPtPLmn0Rckt05iW3R
	vfbTJZLK7RP2dc29yhHBlbcFlZmIUWDRCjokFHG5mCjx5drtBPOiM71wdKzE7zLSHnP1tCO0D+4
	NqWdMUssKOkgmD1lBZ5fdk2UmGrkg5GOZGZQbwUZiS/KJw==
X-Received: by 2002:a05:690c:6503:b0:814:47f2:1ff with SMTP id
 00721157ae682-81fc1e638c8mr15700227b3.27.1785449333420; Thu, 30 Jul 2026
 15:08:53 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 30 Jul 2026 15:08:52 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 30 Jul 2026 15:08:52 -0700
In-Reply-To: <24f5be9c-3773-4833-cbad-630a444cc5d4@linux.intel.com>
References: <20260630105234.54638-1-alhouseenyousef@gmail.com> <24f5be9c-3773-4833-cbad-630a444cc5d4@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Thu, 30 Jul 2026 15:08:52 -0700
X-Gm-Features: AUfX_mxikxm0fi_6sE0FQkDhDQZXcMP70TH-8D6lSuHoq-wMoDjnILDjYXue1JQ
Message-ID: <CAMuQ4bWWBKMD_XcaN_GB+MZQ-KdLYprqD0eKAB3K=UZTZWE57g@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: handle positive BIOS error codes
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org, krishna.chomal108@gmail.com, rafael.j.wysocki@intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

No specific hardware exhibited this; I found it by static inspection.
hp_wmi_perform_query() documents positive BIOS error returns, while
victus_s_gpu_thermal_profile_get() only initializes its output
arguments when the return is zero, so these two ret < 0 checks can
consume uninitialized values on a positive return.

I only ran strict checkpatch and a focused Clang build of hp-wmi.o. I
do not have a Victus S system to reproduce it. If hardware validation
is required for this change, I am happy to withdraw it.

Regards,
Yousef

On Tue, 21 Jul 2026 20:28:38 +0300 (EEST), "Ilpo J=C3=A4rvinen"
<ilpo.jarvinen@linux.intel.com> wrote:
> On Tue, 30 Jun 2026, Yousef Alhouseen wrote:
>
> > hp_wmi_perform_query() returns firmware BIOS error codes as positive
> > values. The Victus-S profile callers only reject negative errors, then
> > consume output fields that are not filled for a positive firmware error=
.
>
> On which hw you see this? Please add the info.
>
> > Treat every nonzero result from victus_s_gpu_thermal_profile_get()
> > as a failed query before using its outputs.
> >
> > Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> > ---
> > drivers/platform/x86/hp/hp-wmi.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp=
/hp-wmi.c
> > index 8ba286ed8721..50c5a1e152dd 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -1825,7 +1825,7 @@ static int victus_s_gpu_thermal_profile_set(bool =
ctgp_enable,
> > &current_ppab_state,
> > &current_dstate,
> > &current_gpu_slowdown_temp);
> > - if (ret < 0) {
> > + if (ret) {
> > pr_warn("GPU modes not updated, unable to get slowdown temp\n");
> > return ret;
> > }
> > @@ -1907,7 +1907,7 @@ static int platform_profile_victus_s_get_ec(enum =
platform_profile_option *profil
> > &current_ppab_state,
> > &current_dstate,
> > &current_gpu_slowdown_temp);
> > - if (ret < 0)
> > + if (ret)
> > return ret;
> > if (current_ctgp_state =3D=3D 0 && current_ppab_state =3D=3D 0)
> > *profile =3D PLATFORM_PROFILE_LOW_POWER;
> >
>
> --
> i.
