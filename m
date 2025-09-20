Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B06D1F1932
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758366593; cv=none; b=s6gHQuavcE3hu8Lk7uxlzUxbnmglMAgu8T+VBy0NTXLty1iOqyKrBuDeGiNmrq0z6aNhNPL9ieDfk31KaN/cc4YeSFmM7BCrdy9dzJGvAjv4tHwSNJI1N/ZfLaIN20eG2JEpZzb2/5m7YbwJmVzXmjF9BrrRTa58H/nfbXtzPDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758366593; c=relaxed/simple;
	bh=MeBzeZuJoOFs/wopGR56y4qk193qtqPcQMc5SVf+pjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXXH4ak/xZMYFhtevFb4uLDbQcLMtI/RiZcSIJgjNwXsacWAGeYa2lvcuJmSvWpA1+tnHuykkp0t+aQMkbvfaGzz0HRyC3t/gWvZJ3ik9YdGoWwYn7XR+yh+NLL4PaVjfCCvrvMG8vO+CHjK02Xs1Yb4oTbovMuMU65zZYRvg0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMtswYyi; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMtswYyi"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b256c8ca246so282302566b.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 04:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758366590; x=1758971390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X17urZN/sTxWn0uDY3G1eFwtIfDtbusbjyQEUJk2cc4=;
        b=cMtswYyic9wgOzYQ5dVU/rpF4wn6qC/uF55iBzxcPFsDVXIvVWv4FNkmJTpiC52qEW
         TFLWxgG9tef4zpLuE2jOdjMPKHvroee+6xlqunoSMpbcqfkMhp4+Oo9JL9dkyWZ9IgZC
         OqwUA57IUhlbtBJqt5vflO/XrompwvpX0jMLDO/y8NkGt+4XnpDt8By32Wtv041TE+7N
         kzHHlnps9+ByIy44ToHbA/NXtfnm1SoKefmgzjtXXpC9XFHX9JH5/q0s2ShE+WkqLqEr
         wz3bS40zR5etj+e8Gt6jxfWiV/41rIk0ckxSh4vHxQ8C36n897f41W9adegcQZ3jQTKi
         rkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758366590; x=1758971390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X17urZN/sTxWn0uDY3G1eFwtIfDtbusbjyQEUJk2cc4=;
        b=XkjmBRF+vzRhye6FqcQjLIjcwl+z321TVJqA40BWE3ogSoQpfi0t3n7ZhDpkbEXwvQ
         YLwf6gH/XjMwCkXfeKCFD9ZyJFojeGZz3/cb9AvUO6DMEtiiaxAii387IRBRfjQNuja2
         cVt8Mfr3zVpKefxGFClu7cTwlq3aQuXPujrRfMl+dq9Ym/X3qTF5QNPs4nKvxt+Cf91a
         b5KM7pBhsnEJb2r8BOzJT8Ne1naskvN9JKbBr4tfMhpMe4iVPe6O2wdl7iz9bc8433xN
         RY7RIwAOLPw3vRq+EThZl9Ej+qvonBo58gLsxwDxqYMGHoYWmDZKIuzq/FQw7HOXs7Ut
         CG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+ne1dmxmLZnM0/st1w+nzM+P5DyF/h6lduQHgzZZHc+iWeq8KxN/Pn4YQ9To+q6foa9g4et7jrk9oM3egVBY6ArOs@vger.kernel.org
X-Gm-Message-State: AOJu0YwDN7IsPJgwangKI3ZkRPWCMcsdqmYpDA4tN4+wjLcAylA7vry6
	bK+d9+/zVIlhyyu2wPyTYrXOSA/YEOmaSlBOV7Ro/Nhl6kyekREccvZrhM++zDOHhjvHq/hpN9a
	N+UgZo2p5V4DMWxDCOmvqSxEP4atKGGc=
X-Gm-Gg: ASbGncs1Ggj5opJ9bwgW6oqLB5B2bd197KXXwcJphdH4u4XxRf9YRVMKCCMTGowWk/k
	D63qF3qKP9X3JGLiC4380BHCnT4THBfEAiXPkadWwtQvdTRIUpGB+P8/7gV0w5Wfb/Uy9B/YDiU
	TGq1E0aaa1J+PZfiYBdkRdAsUNfF2rSFzvAKVKODL1BVlXpDebL68oPy/tQdYT3Kq3lbgjqdIdF
	XhdZBI=
X-Google-Smtp-Source: AGHT+IF54dSsYeQx2UXi5HYBY96/XUcVDjyXk2jaijgN1HlELV5LNjc9WB4iYPgd5A0uBk+UQ28KZt+rinwqeDpfb0g=
X-Received: by 2002:a17:907:3e13:b0:b07:e04d:c89d with SMTP id
 a640c23a62f3a-b24f62163a5mr799361366b.48.1758366589468; Sat, 20 Sep 2025
 04:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250919204742.25581-1-hansg@kernel.org> <20250919204742.25581-13-hansg@kernel.org>
In-Reply-To: <20250919204742.25581-13-hansg@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 20 Sep 2025 14:09:12 +0300
X-Gm-Features: AS18NWBhiA4laOphSIffzsMSG2oe6Knk43mxWv4B6Hgz6iL_r4wX0JsjRt_Dzts
Message-ID: <CAHp75VcMNe02iCWyD3A4aCXOH4Q6Fm09xNO-OeaaBT4t5BPQPg@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] platform/x86: x86-android-tablets: replace
 bat_swnode with swnode_group
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 11:48=E2=80=AFPM Hans de Goede <hansg@kernel.org> w=
rote:
>
> Now that we are using software-nodes are used in more places it is
> useful to have a more generic mechanism to have the core code register
> software-nodes.
>
> Replace the bat_swnode registration mechanism with a more generic
> swnode_group registration mechanism.

...

> -       if (bat_swnode)
> -               software_node_unregister(bat_swnode);

> +       if (swnode_group)

Now this check is a dup and hence redundant.

> +               software_node_unregister_node_group(swnode_group);

...

> -       if (dev_info->bat_swnode) {
> -               ret =3D software_node_register(dev_info->bat_swnode);
> +       if (dev_info->swnode_group) {

Ditto.

> +               ret =3D software_node_register_node_group(dev_info->swnod=
e_group);
>                 if (ret) {
>                         x86_android_tablet_remove(pdev);
>                         return ret;
>                 }
> -               bat_swnode =3D dev_info->bat_swnode;
> +               swnode_group =3D dev_info->swnode_group;
>         }


--=20
With Best Regards,
Andy Shevchenko
