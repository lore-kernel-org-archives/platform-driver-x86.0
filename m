Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793039128;
	b=wlXNeOBLDO1KSXaKmWadOvHpE/ZBqwDcgZRrtqZQUD37n9SJnb8n9sHUhycI0OKTJVOE
	 O1AnKyKsoXw+AOqRqNkm0x9Vduy774dk712puOYeUysOaR+3DKXe0EtnC1cIvKKCZT3ao
	 /AFSKe3gNgjizfxxBKMzfL7K9PLz8eOSXATb2mEeQ1yOaRxBNWYeD6qT3fahxwe74EZ5I
	 LeLcDJK07i7u3g2UaJuLoN7MRnDdByxZmO6UNWU9GqJUaMBGcVmYekS6+4PD1GrPzsdER
	 l4jSoatE0jioSEUnaHAIIfjdRJlGJGbW837zEwshaIkRYaZ6EGygDixIpLdtncBjY4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Do/93Ec+a4uH5EBQqfEmx8Kskebovc78z6QXsKmL6Zw=;
	b=C7+VhL5maZEegjvoYa3uVbaijjbwjWNXNjemJM7BRr/bqSTuznXC4PnaSpJMHjTv5KLf
	 Bskj/RabEO++ztsHPuK4fTVAijtf0t7QRlxkfB7fkB2+xzMbPBJdZrGN03vw9e/6W77tu
	 Cd6fRlCcm8IVLWeNqE0iwWGBCx6hbOivGk4EDgVlB7paKeXeE+vVOrtb5z5usJaiUV51J
	 H/RIW6AsSs/0Os8msjfYcpG/dYk75N3O6BUMCryeEuPk2uHrGschs4IhMm8RnPQrCESYi
	 Gu/rGa8wIMueWGUIq0w1QI5gGm46wreK0p7k7onyGf1jNisy3YOrTJGyMFWXxI8cuBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=psje4x7z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5AA606A33B
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 18:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B5AA606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=psje4x7z
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35e8253292cso282680eec.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 11:25:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793039127; cv=none;
        d=google.com; s=arc-20260327;
        b=C8E3vD/R/SKKzNSKG5Eo4IvUQoaWpj3EcbCw+dzvd7WBXIhvympzNy6U1u+qNvtT8X
         MfbxiF0VgnsSWl0UU8/+Zj1W2hQX/5Yrq2C9N1V59uyRkHelHRow8aBcdKhg+7hJG2mO
         7CaWQIGl4nS2d1rMfaZmI2fOdhQ5l6zGMVtpopBw2c21toIgK5XAh1m8wmFeqV4hgHO1
         JmW3kqOS0s2XQTBk/V9vAPnn6wd8/N9udiPHh6wDbB2Z1hRxsKx8LlB+LKeMAQ6ukLJA
         IKGKpuuvF56pbf7qkdEOh2LW6x7dLJ2/kLmRa1KCMiYGxlyCDKtfJMfDTEPAL5wPR+Pa
         aKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Do/93Ec+a4uH5EBQqfEmx8Kskebovc78z6QXsKmL6Zw=;
        fh=duwj+UD0p/Ad/eRNFUv8qtNCftQEjKyeOaitoHeJlmg=;
        b=UywiK+Mlus1jw8L4sOSRJ4q/koRL4F5Iog4Zu7E0Gy2cdnDZSep3TRVhW5JzjGZgOD
         vnE18gKP4WxMbVAIWd2J8yzmuCxmV3hc0Gax1eK1Dk//mPWPZIFpxTI6vz0dCJBXaapd
         E/NwsC7olRHHN4fjUGV9wTATLT6YPE00Hp4JOmNw0I6JlutT6mQnq3APZzurSyED4pDv
         4zl3P65zTxkrGC09NkRKApe6uWO/0kpZgvTohEbj+C31+81VdqDSM2qwCa+tWLvHWbvU
         5YQ953smfJwlsXuQ8oBqCrpAqUAVfBN4yIyopsJBASx8Xnluakwqwh3l6FwTRMwzG1gG
         /o0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039127; x=1793643927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Do/93Ec+a4uH5EBQqfEmx8Kskebovc78z6QXsKmL6Zw=;
        b=psje4x7z1e4XGk6iRkqCgnwuVkNqyA5hL1Vp7pOb17/wITHwbAh0iYhBFF6mbhBM24
         xvmdiZrEk7sxlbtJGRrL1dDwskbybjtm5434K6pwAuao7iFW0fn7EYfBaW2jZrbWpbR6
         Kia39LOXBzpqlFZPdzAjJqwGYH0ePgO4sp83wQLX2dfMVkVgOoFzN4dRoLSC3BqTi2hG
         6Tpq8SbAjt+m4i2nllfijPXNXSM/UKkWJPZ3h+MsofLN8OHoYscFnm1bPA3vhxPndd4m
         9r4JKrstZNe2KzxJzptH//U3GfUJ4Hzpr3kyNTkkp4w8iMvy8jHjJ4zTlNpymwAGWsdb
         sUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039127; x=1793643927;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Do/93Ec+a4uH5EBQqfEmx8Kskebovc78z6QXsKmL6Zw=;
        b=Djp4jpedN1Z62aTtrJsUZeZEt9mQuI7BVoT/7Lb5O8mzn8Ceb4QUxfW8P4/2s+eGFe
         BSBLavFNe5/F7kU69XGETDksKBdSTC3v8eNZ3SvaN2J6awD9NqGyOoI7zQ+sa9NLfVJp
         xy2FJ0uWgr8k+CtxSwDqrMS9TPgBpHdolbecD/XxGwxZg06qo7S0HibWU6kTFzAt0R/+
         8kjdMQpi9G79Vv6mCNZiWEmMR9PgiAdsAZss86bHZrGGnzfXSNf/UOUNseasRvetgSGu
         ZLDIIkw04hzYMO6SBqd5H5YTBPxXNKnIPiTHHiHu4y/9+ZrhZcGQos/i7yrzEfACf9Ca
         NK3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyoyFVHhOL0INyRb2pRH3wPKlcxEfKepyALYoyLMoaS6zzQZUQbv+QpuQ7EseMyR6prMD5qMgxxrSmL4nGptsSn03x@vger.kernel.org
X-Gm-Message-State: AFq9FYIINPXsNSY0rz/g0amGw6um6DfSbCmuraqlkWQVt1oxq/u6kouE
	R39m1glrMefFkunQG5/hebyAFEZIakd2ozfCIET61KOo5q0DqcTJviP+b3dkogHzQjlZfsgWUYR
	AmtFHuzc3E7ddwCnIBCUUbDYsG/DDCSs=
X-Gm-Gg: AYBFou15EAKrXXBn8G3F6DUWroYgFhPLiGp7mXtHX4NwQyxz/Uf38iPJQMbjhuHycwN
	8lkefmKhrAcYrOZlar9e3aK4A2Xg7Wy5e+2/bSfG7LqOT+PIv6WvsKx1Cstz5aWHC4LzsN6Ecr4
	zwPizIrC8X/kgKmovXR7MaKxj6+lj8VhRiXlricy5GvCw79JjWMx+GcXSDNZt2EDAY/jqZ1litL
	PfM2On9uJAthY5WuS77YzEIz0DRzbvmGXPp2g1gydJWUOYILfrlemaaFv/b/mDjpaInVbu98gSu
	R+hgA2lA1miS6ZexvZHy8tui55kiUPHJBCb7vaxexJGtrA+AgIMx6JVVtIZOUYY3KAXjgSv0sPd
	VjgElr0ohC1oLfAqxdicyRPCJTJSUKXANklgrZqtGJGKsxwSL30i7Wd8xFL8ImWvhGOANw3Lcc3
	LRyz/q27P6Is6dRtmYFW1KSX0=
X-Received: by 2002:a05:7022:7f05:b0:17f:641e:7f6b with SMTP id
 a92af1059eb24-199345c5ecamr17915804c88.1.1793039127302; Mon, 26 Oct 2026
 11:25:27 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com> <20261025040046.1602-11-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20261025040046.1602-11-atharvatiwarilinuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Oct 2026 14:25:15 -0400
X-Gm-Features: AclHuK-iVje5ZZPGXAxueHXGbehXRgBbIH4abpn4VFZrQQC5igwZxtMQm-2wnbg
Message-ID: <CADnq5_O2tEUHOcbiKL8c4UHpy3AmOWtmM7A8o3jP2qLwkx2jUQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] drm/amdgpu: Catch register access while GMUX keeps
 the GPU off
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

On Sun, Oct 25, 2026 at 12:26=E2=80=AFAM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> From: Andre Eikmeyer <dev@deq.rocks>
>
> As mentioned previous any access to the GPU when the GMUX has
> shut off the rails results in a CPU CATTER, skip and report
> any register access after the GPU was runtime suspended for GMUX power-of=
f.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  5 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  5 ++++
>  .../gpu/drm/amd/amdgpu/amdgpu_reg_access.c    | 24 +++++++++++++++++++
>  4 files changed, 36 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 6fd607587..ac8dfc3ab 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -881,6 +881,8 @@ struct amdgpu_device {
>         /* enable runtime pm on the device */
>         bool                            in_runpm;
>         bool                            has_pr3;
> +       /* GMUX has cut power, any register access would hang the PEG lin=
k */
> +       bool                            gmux_off;

You can drop this.  Nothing about this is GMUX specific.

>
>         bool                            ucode_sysfs_en;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index c1f196242..8185934b4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -946,6 +946,11 @@ bool amdgpu_device_skip_hw_access(struct amdgpu_devi=
ce *adev)
>         if (adev->no_hw_access)
>                 return true;
>
> +       if (unlikely(READ_ONCE(adev->gmux_off))) {
> +               WARN_RATELIMIT(1, "%s: register access while powered off =
by GMUX\n",
> +                                       dev_name(adev->dev));
> +               return true;
> +       }
>  #ifdef CONFIG_LOCKDEP
>         /*
>          * This is a bit complicated to understand, so worth a comment. W=
hat we assert
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 5ad7b6dd8..135798c76 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2932,6 +2932,9 @@ static int amdgpu_pmops_runtime_suspend(struct devi=
ce *dev)
>                 amdgpu_device_baco_enter(adev);
>         }
>
> +       if (adev->pm.rpm_mode =3D=3D AMDGPU_RUNPM_GMUX)
> +               WRITE_ONCE(adev->gmux_off, true);
> +
>         dev_dbg(&pdev->dev, "asic/device is runtime suspended\n");
>
>         return 0;
> @@ -2960,6 +2963,8 @@ static int amdgpu_pmops_runtime_resume(struct devic=
e *dev)
>         if (adev->pm.rpm_mode =3D=3D AMDGPU_RUNPM_NONE)
>                 return -EINVAL;
>
> +       WRITE_ONCE(adev->gmux_off, false);
> +
>         /* Avoids registers access if device is physically gone */
>         if (!pci_device_is_present(adev->pdev))
>                 adev->no_hw_access =3D true;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_reg_access.c
> index 7468855c1..bb5dbeb7f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
> @@ -594,6 +594,9 @@ u32 amdgpu_device_indirect_rreg(struct amdgpu_device =
*adev, u32 reg_addr)
>         void __iomem *pcie_data_offset;
>         u32 r;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return 0;
> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>
> @@ -677,6 +680,12 @@ u64 amdgpu_device_indirect_rreg64(struct amdgpu_devi=
ce *adev, u32 reg_addr)
>         void __iomem *pcie_data_offset;
>         u64 r;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return 0;
> +
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return 0;

Duplicate check here.

Alex

> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>
> @@ -706,6 +715,9 @@ u64 amdgpu_device_indirect_rreg64_ext(struct amdgpu_d=
evice *adev, u64 reg_addr)
>         void __iomem *pcie_data_offset;
>         u64 r;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return 0;
> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>         if ((reg_addr >> 32) && (adev->nbio.funcs->get_pcie_index_hi_offs=
et))
> @@ -762,6 +774,9 @@ void amdgpu_device_indirect_wreg(struct amdgpu_device=
 *adev, u32 reg_addr,
>         void __iomem *pcie_index_offset;
>         void __iomem *pcie_data_offset;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return;
> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>
> @@ -784,6 +799,9 @@ void amdgpu_device_indirect_wreg_ext(struct amdgpu_de=
vice *adev, u64 reg_addr,
>         void __iomem *pcie_index_hi_offset;
>         void __iomem *pcie_data_offset;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return;
> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>         if ((reg_addr >> 32) && (adev->nbio.funcs->get_pcie_index_hi_offs=
et))
> @@ -832,6 +850,9 @@ void amdgpu_device_indirect_wreg64(struct amdgpu_devi=
ce *adev, u32 reg_addr,
>         void __iomem *pcie_index_offset;
>         void __iomem *pcie_data_offset;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return;
> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>
> @@ -861,6 +882,9 @@ void amdgpu_device_indirect_wreg64_ext(struct amdgpu_=
device *adev, u64 reg_addr,
>         void __iomem *pcie_index_hi_offset;
>         void __iomem *pcie_data_offset;
>
> +       if (amdgpu_device_skip_hw_access(adev))
> +               return;
> +
>         pcie_index =3D adev->nbio.funcs->get_pcie_index_offset(adev);
>         pcie_data =3D adev->nbio.funcs->get_pcie_data_offset(adev);
>         if ((reg_addr >> 32) && (adev->nbio.funcs->get_pcie_index_hi_offs=
et))
> --
> 2.55.0
>
