Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033582F7F13
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 02:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782268328; cv=pass; b=RBlQlkAWkCzjrZzumqzHX3pZ/vJQC+UwBKsTXjwQApVQvY/eMUwY5VSo3tLD4AbAj4kTQx3bgEHSM6TESDRam2NYSvi1erewbrV/Q1sz401idyWlsZbA36BDGsImy6Nnqz1/XFS3ETxpGYCjtpgbTmkKh1swsqwsykS+n/DQH14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782268328; c=relaxed/simple;
	bh=VxMTWfa+0gelolCeFbo5dW/U8jSoLgs8EcTegEvQ01k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=JqnBArJCFZk4A+hh1vBerCSv1th5pUHsw7Hiz4I1PsdSYa+3ljsLhDglUqTuLWa0pOh0y488guPjQmQPfukjKGHy7luorWA09AdU4yj1rKVcmmWY/B6lWGkgWGtXH3yFneX0y2St9RNTMS+sue2N2zsuD2UJdbb5f3sMHTQhZ5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsaGazKR; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsaGazKR"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-697ebe536b6so836709a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 19:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782268325; cv=none;
        d=google.com; s=arc-20240605;
        b=kxMPTkZS59RnKdFzmJSJ80iyADvVLNCFenc5z8Z1/nY028SFissCSvJqxznmYqnI+J
         AhCwFWbAWhQqM578ndsAKbl2Hm4anjzvA0Ml4y9Cy61rD6P4e1QEMZaBwDfQIqoibxVs
         q28pwLBBr8TmkOcnN9YbR5mRnDNwg+Yfc0HY2h8pcQt+jkd9nYmg5WqrUttjECYIEmFX
         eiXED5GhtJlAFWhczL9Rl7iwDJtuRSJWnetrxZR+x1Qz8VgMbinOvRWI3RYgh5XH5DIg
         5dSSziHsjJhywoEnuCzooCOcZj2JGXlCsATbtAvMuL6rpxi8z81qAgXr9LJ5HwgQIIbh
         esiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VaJE2/rvPT8ZL7/aSjGxqhh43WUlt3EYdKs3TD0jCdw=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=TWN57NSH/a3BvCxheX/9/7ZNbgkl+LqxPkO4sUQvHF9J1VVn6/V7lcmAw2tkARSedi
         mCFblZ3h+rmyPgFCedB55/MkZ8iANPOztEbFy26Sk03TmeZKH1wGnMng3OjWFbOh4cff
         6fQkY52kc1D78LZoXhXCeB9qVNakiTSb0hwOUEaSmTFqpVHO7EoO0eYMjhuRfzs9+GwN
         erWlVAMR3G3Y4YV4qP5MOqfNhcHy51Xwvpuu9WrmNYLoL2U3vEbRctJr1W8UnH1x+mNm
         c5vnwDjvFUosj3ZhQGIDl4IkXRUGIjBeaRayL0h25htgtUStBIV1MQAVEoTETHJb6nuo
         dGkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782268325; x=1782873125; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaJE2/rvPT8ZL7/aSjGxqhh43WUlt3EYdKs3TD0jCdw=;
        b=ZsaGazKRtDf1uuL4RHeiG84x7X43hLOi9ElNPCEnh1tJHTZHzaGYQBPdRU+0Y0d7Kf
         /h3A0knQpGT4iynQusRiQbRaLdqIL29+DYcRUpjEdjm+1uSKkm4SCl5UNFYR1Bwp6CNk
         jT4YqPVBzzeJn9tyoWDGE8Y44zIx2QE02JyCtesjTdpdUoRSD+3eTUQgLAiSQXqKalkR
         xl0SwuH5RAAPe4BRIrcp1yMmjQnQV8S00FzPdcf7v7nEYetGAb3vlLvUGZnAielBv4lm
         zJshKYsH8AwPO+IFZZ7wcVkqQz3t+oyaJ/rHRv9ouELPUcVr/y8Eu8WpKu09UiwBWaLT
         x98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782268325; x=1782873125;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VaJE2/rvPT8ZL7/aSjGxqhh43WUlt3EYdKs3TD0jCdw=;
        b=SBga2qzft2/vKjPlxgJ1Es6+AyXMzq59v4FX/NtnBS2vUFZHg8yuEviLemoP82jZvT
         oN6jJYcQuyDjZE0vr779c5/v88ecQAfGdZEouU9T5JFQaYXKHPWBiJq9JIaa2Q7z0E4X
         azY1BYMip0h5vmuvXEx7+YkajTOwLNEA7k806mcfj2uyEeO7NWrBj6y96M2tpm55Gmum
         6gumoJ7rIzVVdV2vaUoDUIH8iNsCglU7iGKVFkee1FfUAqcaiEPT2sZoC33EyC1X6/Kl
         rpOC8T7IvKJLmnXx8HO8klNuq3kybd7wYtqxWQ5B/6eELVdsJlu9EQE7G4XfCKuvlJpQ
         f5Rw==
X-Gm-Message-State: AOJu0YzmORJ7XedTCxSzf2El3yphNQUVXsIuU2L3O2fd1tiCWd6q2D8b
	tRAdRSQm55zNB/q53b0sCbabVA2ZuPRQWOq5UVZm8RkskPQHtat6yhsAF8ytN1G+Etp//aQ8wCK
	D9GiMvvrWsy2u1pJ59n8aoISglkdXo/x+bm0c
X-Gm-Gg: AfdE7cmi2H0miaHBIP+BffmypqweFVl6WL1kXnuxI6Zf3xiEBtv1ue4ygFerdAFpfCW
	0J1VYqhgX8hfFTikNX9jY5uFeiPAXntLy3kG+CJVAu3MXn/bepbV8nRi2Gz0TJjoQD+UqkH0xdD
	97uLAp+vqFzklNK+0jrF1ggGre3Kbj1wwsI4o47BXKN8KHeAPl6ssDOvhg/Sn1tmd1VrLwpSbGz
	RW+UMVSk355L790gvkZKJHk+1AT1OVTXJPBv6zmCt4c2kVqXlaXkj6QYD68MPNENE7OTRmgtr0g
	TrDQ/pkEJluVUCJtH/UQoh02Uv7kpAGVYHpF+fya
X-Received: by 2002:a05:6402:448a:b0:697:c194:5d99 with SMTP id
 4fb4d7f45d1cf-697c1945f84mr4348972a12.14.1782268325298; Tue, 23 Jun 2026
 19:32:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615091034.987029-1-radheykalra901@gmail.com> <20260615091034.987029-4-radheykalra901@gmail.com>
In-Reply-To: <20260615091034.987029-4-radheykalra901@gmail.com>
From: Radhey Kalra <radheykalra901@gmail.com>
Date: Wed, 24 Jun 2026 08:01:53 +0530
X-Gm-Features: AVVi8CfuJqRibyC2fQPCSojukMa57W0Hi2y94J35wC1Mdo4Gruh7ipdqYt5sUKc
Message-ID: <CAJ5VyXJaSQcG2L3zh9Jv684cxiOAy8dezbEARAqVdYaTNrK41A@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Gentle ping on this v10 series.

It rebases the Victus 15-fb0xxx support on platform-drivers-x86/for-next
as requested and keeps the gpu_delta fan-table parsing fix out of this
series.

Is there anything else I should adjust?

Thanks,
Radhey Kalra

On Mon, Jun 15, 2026 at 2:40=E2=80=AFPM Radhey Kalra <radheykalra901@gmail.=
com> wrote:
>
> HP Victus 15-fb0xxx board 8A3D exposes the Victus fan table and accepts
> the existing Victus fan-speed WMI control path. Add a DMI match using the
> Victus S thermal-profile and fan-control data.
>
> Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-wmi.c
> index 11de5c70c..0dcf29012 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -234,6 +234,10 @@ static const struct dmi_system_id hp_wmi_feature_boa=
rds[] __initconst =3D {
>                 .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8902") },
>                 .driver_data =3D (void *)&omen_v1_legacy_board_params,
>         },
> +       {
> +               .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
> +               .driver_data =3D (void *)&victus_s_board_params,
> +       },
>         {
>                 .matches =3D { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
>                 .driver_data =3D (void *)&omen_v1_legacy_board_params,
> --
> 2.54.0
>
