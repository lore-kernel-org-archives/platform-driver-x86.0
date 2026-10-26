Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793039159;
	b=svrXtOywkN3eMKRP6thoPtz2eFXAtEmJxxza3PGPqOTZVh+cMVjphM3qGNvDrX/Zxs7Y
	 9UMUxZASk6bv5mdf2tJ5tDxI+a5Ty1NYX9CUO+hkaOOAm3hzn9Qqv6Id5cG/j8/hZ1OmK
	 mm2eo3CAe7osDrZtMsaqtfBJ4rf0wFhA39e0SRKvoOMq5JUtNEJnZP0/Q50an32ASZhzs
	 2wqqA7Ivs7WWhVz1/WTkJpMiZh0KE0mjrIjI3FZRYie1IRr/1rmd+IT4DgM9FOJ4qs0tr
	 ITtEo3BmJ8ytIJaKjBTFxuC8RUTfoqxAp85Ns/2AVDA9FUHYA4Ba6YHuyeHfHvNrOlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Os8SsBDuhx8e1cUJ1s7YkJjosd5+qwq5mJVznKB4gFU=;
	b=W6TMJA1Pon6eoRKeFqRtl7D0QjrOLgbbgEx3y0MeG8mWjGXsCIzaYncwE6Feco+SlHDp
	 9g6+kgysZxrgCBbiWfm4cWsx+BJPHnnU6VpUCdTRJ0IaQbhaaT44R9Zkx+iEtiglO9dze
	 AnMPVS5AJpV5BDi/fmumZRqZTzPyCxFR+uaEPCSCHRnEWZg84lml238hGmczJEM+z5KTa
	 kSPxNHulehcMPohFyRkAymJqRxQwFqDxFDs4weqc9LGJwq3N0CWAHyWDSDHxA0GRm1IHS
	 jojgFjISJL30BUSaevxy2WcBFsTh/9BRJXgNssutrGtm4mOzqWKDSk5IxdRVlwRT+7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lbwuRd+E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2066B606A31D
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 18:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2066B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lbwuRd+E
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bb5afa736so529936eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 11:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793039158; cv=none;
        d=google.com; s=arc-20260327;
        b=EreLCckdsdKVFmr4bnyFy60QdEHowHr/dKhUhffeHsDi8IQV/YheDTEwOpBVHgF0PN
         hAfBt5aKPdp/ltoQklfe58PsPKMBA1ZSuhrYXyA7rM8V8PK2AgT9x+rKCxPiTdJWw5Vn
         Toonm+Qe0D6Ighi0lRGbyfZ9xzJZLRHfPCSA3NUD4yf/uePq/Enz50sPtDA7L2dMVrlE
         T5X78TMa+10RFKVexFTIySvsp+BzzzQCP+wh14pZwT+LbOt+NSL6Aay3c6ejykXHBw4C
         nr/jSBerjKsVPg0lNvG1tUcLKdYz+8DI9xpmN3sGrxezLsdJGJmnhniMUwsBaM42Lfpr
         Y5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Os8SsBDuhx8e1cUJ1s7YkJjosd5+qwq5mJVznKB4gFU=;
        fh=/rJF99jA8RizLq/5JpGIRQyIZ26O6Ochc/lDNFubbjg=;
        b=AO8ps6MnqN8tIRv+MHJ0UzkjRvAvS7uJuPVjG4+mT33DbcKBdgbTZsEGmlVVNP1gRy
         41NIKzwXQyPrak69wokS8ZuXxVBailgt0dpOUaPy0wIJoH8YI5+UCRppXc0EgnE6xVE7
         tABsMAYdBJKiCcH3/pbWXWI87Og4+l6extz7CTwy63gUxVsFerx7x3A5V340I7nBEHoU
         MRqAe8wKCVih1t674Cszb0+FMXptMAPbv4VpGXHO1VACCDKqsKzJF0SPdRDPonwXWDGO
         A1QzWHFTy1JCLFuAdxXNaf6FuAtPnfb8EO/fPiEJPWvqf8Tf5IsN3tbx9oblqk/zDcTF
         /tOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039158; x=1793643958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Os8SsBDuhx8e1cUJ1s7YkJjosd5+qwq5mJVznKB4gFU=;
        b=lbwuRd+E6IGbpx/R//bHxBaxtTULqnLTEPOgtj435togavFrY7DCao9Jpf3oyDVxKs
         MWsaSaYk63yGIG6j0VdJu0kxsnNN4Dc/AaXIclthMFkzIiaMMkJys0fiym+KULMW9ZLP
         u6sTd9Hi8W9+KgPwgnfE4vns13wMC83wHX+XTYlLK5NHtQK4Dv3BRfQAAz6M4kWg7dl4
         N5BRqH9iTNUNz8KvsN5ogrYNYzeupCISH5cMfqCJmBmRRN4xFT15SOUTUVQC03TgU/ZA
         WsU5OxwXQlZqgPrSMVxeUFYmGw+Kew8yFQfCQYFTAQbnOytGQeRGW8ssvLoGRkIozqvh
         2fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039158; x=1793643958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Os8SsBDuhx8e1cUJ1s7YkJjosd5+qwq5mJVznKB4gFU=;
        b=V05kA1p9yrKS8esq0TGJlwPZRN/QH4q973avnnhu2BRUEoi4bmfQHnpb6Parigcrv3
         EkQPobp0Iiv74gNrvdtqvKiS9MRfUi8ZIms0fEqHLQ15BC9Qo9I6abbb1WFT0tn+V0D3
         8z5aEwI8Ost/7fvF8AZllFnm4m2SMrudl2APuwcp7gJeiY8B3nkKWGAntCix2K+h4IA+
         PXxxdNPc5Tw4PcmDNwm80vIM/2/YqV9QuJsyjcU01viSng4QE6XDmQIH+ICTuzFn1RWW
         hMjSbaBf9ag2Lb/cfl9RWZ1Ric7m/d4Gzn2dGPI8/f2mbYmeTBcT5o2Bsh+CsX2tiVgN
         pLRg==
X-Forwarded-Encrypted: i=1; AKwUvBwafeLd8fjyEiOX0Umo8SuLvSI4blhPCI93wfGsZXjv53/5uUIGEhWFn1VXREEq2qm67QeJAIw/nu+XO9CVm/SiE4vl@vger.kernel.org
X-Gm-Message-State: AFq9FYLD6ufrdnj7JwYhvmcWnC/UNWzI4bxRrnDdRb0bMdMgY6zcfq7M
	Sa5VR+rDXJdXCn9jl62kIOqZyEyEOxfSbwX81sdL3x5X/EgDx2M4Rk4AFxqGC58l+2qBcTDG/ij
	sZ2ACsLshqJbvfQKZv1/1P9dAV5Iw3Q4=
X-Gm-Gg: AYBFou3L0tftxYYjWf1mhZgcmShkj5alAH2za6GDqksxnp8RJi865VuA9jBOYKIfn/Q
	HZ6BzmJmzf+0uoSYZQSkRs7YY1gQbE2DaXutkTks19CbTDjAh5+8rdi0XawNpyu4rx5nWvUAN6t
	DYBs5OmgzNbYJWEhH5MLHMEniS+5vsHZ3UUFSDDg6JHroE4R1akSi7l3O0aSz/wMouPLZ6rrO4O
	WKkQ1gC474jDXYb7lKH0Fq7DGGo993Ix9WidsFULuOZ/zcETww3DfmmL0DjW8g0YVGqcPmo4F4R
	D7gigcJMXGYLsoaIys7JeSOb/kZv7CPqgue44V96M3cAYkwl7CCP3e2U4Ay48Qpy+qnSwoL7VjC
	uVtMHBW+HX9nA1L+Bxj42gKol9F7i/fMhjQ3hXq3KGWDKrtGd/Mu44w/9MbT7sV3Vfnd2mVrSSp
	qSfdTdOSfsO7EtKUrkHuV+eLU=
X-Received: by 2002:a05:7023:a46:b0:14b:edb2:c3bc with SMTP id
 a92af1059eb24-1991b9e5d7bmr16987682c88.0.1793039158092; Mon, 26 Oct 2026
 11:25:58 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com> <20261025040046.1602-12-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20261025040046.1602-12-atharvatiwarilinuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Oct 2026 14:25:46 -0400
X-Gm-Features: AclHuK9L_P-9DUQQyVR1q5n6RC6VuTR2frqkgDd6R4nvp8sd0RT2y__G1BnjdtI
Message-ID: <CADnq5_PRG_O7jy9P+mf7AQLerpfz6up=BejRSPMgYDh9xigm=A@mail.gmail.com>
Subject: Re: [PATCH 11/13] drm/amd/display: Refuse DP AUX while GMUX keeps the
 GPU off
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Andre Eikmeyer <dev@deq.rocks>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Kenneth Feng <kenneth.feng@amd.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>, 
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 12:11=E2=80=AFAM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> From: Andre Eikmeyer <dev@deq.rocks>
>
> fwupd reads /dev/drm_dp_aux* while the GPU is runtime suspended. The AUX
> device holds no runtime PM reference, so the transfer touched registers o=
f
> the powered off GPU and caused a CPU CATTER.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 7261317d4..b099bf520 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -24,6 +24,7 @@
>   *
>   */
>
> +#include <linux/pm_runtime.h>
>  #include <linux/vmalloc.h>
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/display/drm_dp_mst_helper.h>
> @@ -111,6 +112,20 @@ STATIC_IFN_KUNIT ssize_t dm_dp_aux_transfer(struct d=
rm_dp_aux *aux,
>         if (WARN_ON(msg->size > 16))
>                 return -E2BIG;
>
> +       ddc =3D TO_DM_AUX(aux)->ddc_service;
> +       adev =3D ddc->ctx->driver_context;
> +
> +       /*
> +        * User space reaches this through the drm_dp_aux_dev character d=
evice
> +        * without a runtime PM reference. Refuse the transfer while GMUX=
 keeps
> +        * the GPU powered off, a register access then hangs the PEG link=
.
> +        */
> +       pm_runtime_get_noresume(adev->dev);
> +       if (READ_ONCE(adev->gmux_off)) {

Nothing about this needs to be GMUX specific.

Alex

> +               pm_runtime_put_noidle(adev->dev);
> +               return -EBUSY;
> +       }
> +
>         payload.address =3D msg->address;
>         payload.data =3D msg->buffer;
>         payload.length =3D msg->size;
> @@ -126,13 +141,13 @@ STATIC_IFN_KUNIT ssize_t dm_dp_aux_transfer(struct =
drm_dp_aux *aux,
>         result =3D dc_link_aux_transfer_raw(TO_DM_AUX(aux)->ddc_service, =
&payload,
>                                       &operation_result);
>
> +       pm_runtime_put_autosuspend(adev->dev);
> +
>         /*
>          * w/a on certain intel platform where hpd is unexpected to pull =
low during
>          * 1st sideband message transaction by return AUX_RET_ERROR_HPD_D=
ISCON
>          * aux transaction is succuess in such case, therefore bypass the=
 error
>          */
> -       ddc =3D TO_DM_AUX(aux)->ddc_service;
> -       adev =3D ddc->ctx->driver_context;
>         if (adev->dm.aux_hpd_discon_quirk) {
>                 if (msg->address =3D=3D DP_SIDEBAND_MSG_DOWN_REQ_BASE &&
>                         operation_result =3D=3D AUX_RET_ERROR_HPD_DISCON)=
 {
> --
> 2.55.0
>
