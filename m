Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793038702;
	b=VrGP5s93/y1zlUrna+LI9DU7G1Asmx8Oa7G8MUloJwNn4zkOwSU1T/btVjug3bscvecS
	 oNbN9Wle9Bqe/s2w/yqcYfZrKEci1KU7NRVPWq7DpzTGSidSegFYPMV1yxmY2ugaazmOI
	 WAnieKJ0KKSsi2tUkmjz8LKIQM8b2QDKPUQa01nGiE4pjz69dyqwJZ+GZ93iMglzxWkZ6
	 FiZilr4HLGmsl6OTKAtpcZ+op8qxzw0nTa8w1xmr+vsSknzohcuGG3Ai4H+JWvDkibcgL
	 N39zWzOzlI59exyfWHG+gDf9x1UZhGiXLZ5tQ0KMf1RazX9i5mpPTSO7f5GYXwiSikg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rUFVEl7fV+HUh8nhoQnb/g9LkM23VhHFCgUj8hV83sM=;
	b=NPxeGjkDzRmmCHElIuRMaroKOXfYTRhzra9h8DfvV9LVr9dKnXikA9K5PeVkWlOYyEMx
	 YjrNTd6ikH6H9ae0hN4oyv2kZwsI4w6xrjKKmPueepv/7Gj413BZmfN3CUlXAKOXyVQL/
	 rhgqS/ND7jJ1GlOPu+k7IehbYX6uJ6XCzOCcgznlrUWHDFMi/Ek9p+Smdo2v8XfSTIGVI
	 Ec1R0UyABCW8F/xLluCpDl4XOoi/TJfqGxIZI45i/WT5n1RDfDf56bLRHPKP/5+8QXBwF
	 j9OBS/pEOLnW/GAUTnC33Zb1cYWWJ8lPcfZTcF7VR0AY4PPhwVpeD9g3hBqNkXXRxmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fYOX5pph;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9D3606A31D
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 18:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E9D3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fYOX5pph
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33bb5afa736so528748eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 11:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793038701; cv=none;
        d=google.com; s=arc-20260327;
        b=X/bKGyCoIp3hgVTK6UHriTEcdPK4Sesc/oTl2CBjK6PtZ6DbzFLEeejZg8CJoUCOW2
         z0Q4C9m+O25mL4Fz1ogLC+pkA41WXbe3Xx758UA6Vm+8sHPHyy30yydivB6tHS+R3Lti
         XahUHjHcscAXMw3tl0/G/WLsp+i2Ur+h99X7KomXsAZNLaPpM3IWXX2D3wCe7ZIq++wu
         XmQh6oQTZkYinUpOQ94/R7EO5RwnRs9RKcQfc3mQPwNUGDTcn9H8HkMI6NWjSebp9S4p
         poSFjH0IDj+uKKQ1xeLgJfV/XheXSvb/kuyfbPQ5EfKlxdfI+OtmRMvp1dpUYwfeRhJ7
         avmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rUFVEl7fV+HUh8nhoQnb/g9LkM23VhHFCgUj8hV83sM=;
        fh=oSbqJrZK0e/U3ewV9WOAWvQ2uTq9g2KfeBU01eUWi9Q=;
        b=pXuIUiCM7yta0qxUhL9O+PutNjbdXpbik0IDDkZolYy0lwxBfi+LYI+ll6/LiyXm0V
         3cNbcdmAOo6hASjofaVLuqoWyuPHBekY8o6x4g/Ir/Z7om3TOmb5fO+MVYAdzOfF9wwV
         P2zx9iDigtRPOGMYzfYWQKeed5N1ItKfv+V4PcOKGd1RaST+QSvFGQGLgzsRKwhfNdms
         XRm0MukkgncyYzz4OfYhPxGD4Mjl+KX9J+pz0WJaEqaqn1H+dnVgS3jONvDNhSzrHz3i
         2ohbx35hgRSGjVMTuB1th1HdahseoE9pt7o7Lkil1DSfHEQpjU0DNbCQTiQUw+SDPhP8
         c5cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793038701; x=1793643501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUFVEl7fV+HUh8nhoQnb/g9LkM23VhHFCgUj8hV83sM=;
        b=fYOX5pphsGY/+i/Iy06yAJ16VPzT/i1wL+b30sH0lJqe8b5j0u4TWNje0SRlBJbpNd
         xVPxwEFG9gpIg7TXVB3JP/JIAyAYhYLwAH7rrfT9LYFSLkGi3RYylySiYPLv/ukn3+Ly
         JyseKMEDyDuVup5co5JLXOoLtQQU5jiH+mNAEf6A9yIusnp+kdQvXSAZP8VLEHU76Pow
         51SR089jLzIU4p3Jzib0uunNja3tletM5zojusi7gTZBYNg7T0rv6mVO2U2wp/P0/C8N
         6v2SiKCeY6alA0+WUBcAMtxszynbgR9tww5BjynoDnP1oyhIwpO1dCic4ze44VzEHFvv
         uBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038701; x=1793643501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUFVEl7fV+HUh8nhoQnb/g9LkM23VhHFCgUj8hV83sM=;
        b=pJtPuL/5An9nvVqpDQFwNGgJgq5SgWUYXkYeONrnLnSZOKPMsOyvkqODvqovoxA56W
         6aha6lAQgwPNEbAbv9TUOph9VBIX2GPcscllDKTHWcq8dxbo7kPj0Z4WP1zQ0/4LLSTZ
         +sRh9uYMw9ltWbwzLq4mTQX5O/vo2T99o9/QCnTdM5XGFRwDVua0hICt55f6xAzbWIf1
         9EtKgtn+WUK7BaXbTHhFYz3W/0bnRSt3Z6t2cf1FskP8HVYtNFQVe8wjJgGmuOPd4aZf
         FHob9I6IsUGIgRZ1/Ps00E+px/tUOpseHwWuImg+bh3jz4cJgVBb3CHm6Um9gAZtXfcJ
         dpMg==
X-Forwarded-Encrypted: i=1; AKwUvBwyUZzP5t801oqtVgqCwJlBwLXrI9C9IvYvqaPKIr61CmUAX/5axaNLjYzcD1h4v0cETbPW7eDToGuoAkBHnbR2XSEw@vger.kernel.org
X-Gm-Message-State: AFq9FYIYl8g0vso6OFn7HH92jr/fMUmQ+hYnsiAtmYfLXi/frBrzbf12
	aIPbf/OEo5dZhr3AL+Sck/zMbN/7VRY6+F1Y9MZqZ3MkBFUb7U3sJZ/gkJNYhfuL7DfzChJxVl0
	PYDIFnJwqOaCAF90tsczKTHs4cX9W+Bo=
X-Gm-Gg: AYBFou3qPVy/d9hqu8JDR/LDGDb7Y+CLGAo/21Vd4+Hwy6UGM2RhgytRG20afCSRr1V
	NdYS//GdW707Tgz8iJ1b6ov4WAj6m2VTaveq2G45v0fT/Te0DldaafaGxYfm6JUOD/h8Hm+76+r
	+grkH6yvZwKRSrASTP7fa6le42bqNoR+vVAmboEr/U2iQEmyUF7ybi0Hqd1UjNVIwf52ddmgdbY
	rfntaWYRNkTtwtQ6KM0dY1z7Ve9ESXum+F9XDVGOfHQCZBM/NoHamaWY1/kvc9Wf9oq4qZKLv1G
	63CKUR0GnkWQem4Qo+jW4f+97l4XufavxoN0Wu/KXQKQoZDRBf7gaoP+Mkt4tlxHCqpOylnwl/U
	NudfuPMRrXgbunj+OaxjOhirf6Ie8tkFPzjFZCZp00Vu8gO3IXPWEhjyUAlWB9LCmFHqy0Tt6+m
	LIQ5rqjnDbXT3BrX4XQ6ar5XU=
X-Received: by 2002:a05:7022:5f07:b0:146:ffa9:2117 with SMTP id
 a92af1059eb24-1993639e5f7mr16191284c88.1.1793038700920; Mon, 26 Oct 2026
 11:18:20 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com> <20261025040046.1602-13-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20261025040046.1602-13-atharvatiwarilinuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Oct 2026 14:18:09 -0400
X-Gm-Features: AclHuK_gGXqjT0cI7KV7tvEEJQhRHXFUqhLnyaELH9XqFgMeuwm1bkZPQKcDe-s
Message-ID: <CADnq5_NLhN4TKH-afTtJdF2d-e0=1kysf=pWiUpXu+bLhJFEeQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] drm/amdgpu: Skip AC/DC notification while the GPU
 is runtime suspended
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
> Plugging or unplugging the charger raises an ACPI AC event. The handler
> sent the new power source to the SMU without a runtime PM reference, so
> with GMUX keeping the GPU off every SMU message spun on skipped register
> reads for seconds. A runtime resume racing with that left the SMU
> firmware unable to start on MacBookPro15,1 and the GPU in runtime PM
> error state. Record the power source only and let the resume apply it.
>
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm=
/amdgpu_dpm.c
> index 808be6c42..b64f0b681 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
> @@ -30,6 +30,7 @@
>  #include "amd_pcie.h"
>  #include "amdgpu_display.h"
>  #include "hwmgr.h"
> +#include <linux/pm_runtime.h>
>  #include <linux/power_supply.h>
>  #include "amdgpu_smu.h"
>
> @@ -498,20 +499,26 @@ int amdgpu_dpm_smu_i2c_bus_access(struct amdgpu_dev=
ice *adev,
>
>  void amdgpu_pm_acpi_event_handler(struct amdgpu_device *adev)
>  {
> +       int active =3D 0;
> +
>         if (adev->pm.dpm_enabled) {
>                 mutex_lock(&adev->pm.mutex);
> +               active =3D adev->pm.rpm_mode =3D=3D AMDGPU_RUNPM_GMUX ?
> +                               pm_runtime_get_if_active(adev->dev) : 1;

There's no reason this needs to be GMUX only.  You can drop the
AMDGPU_RUNPM_GMUX check here.

Alex

> +
>                 if (power_supply_is_system_supplied() > 0)
>                         adev->pm.ac_power =3D true;
>                 else
>                         adev->pm.ac_power =3D false;
>
> -               if (adev->powerplay.pp_funcs &&
> -                   adev->powerplay.pp_funcs->notify_ac_dc)
> -                       amdgpu_dpm_notify_ac_dc(adev);
> -
> -               if (is_support_sw_smu(adev))
> -                       smu_set_ac_dc(adev->powerplay.pp_handle, true);
> +               if (active) {
> +                       if (adev->powerplay.pp_funcs &&
> +                           adev->powerplay.pp_funcs->notify_ac_dc)
> +                               amdgpu_dpm_notify_ac_dc(adev);
>
> +                       if (is_support_sw_smu(adev))
> +                               smu_set_ac_dc(adev->powerplay.pp_handle, =
true);
> +               }
>                 mutex_unlock(&adev->pm.mutex);
>         }
>  }
> --
> 2.55.0
>
