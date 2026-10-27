Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793114549;
	b=uSEvmiSvVzlsvc0KUssO3XSDDWWdRyIghg6r/YNpD3WXQAN3VbrlNcxnQNqsRKE2w06g
	 IhLFBhTQXEORw/2NuF+OZuOTaHO+2MY4DoOGnRrQ4+QcyVa6k0B6+HEm5in2cEh7Yvg1+
	 3fbDR4nwsxtAZinNlku6FlH4w3eXdpGoC8vkuVK+y5NXYxxvx46xKDochEpdGYIo+p5xr
	 tB/fP8sqsFNipOSbgn8LW7UjxKcCyUVb3WGCTfXua2FqURdjY8gqW/0t1nD7x/Jv6NoaC
	 yIeRL3BA2MHE0ns4mZbA5yfHTa4YMR67UcSaZ+toxHFbXKzaaopysgYCksQGZZPuJ2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0gy1GbYoTDZfjLk4adPcTo+vL8RJLAqdM+FNRZN+GPw=;
	b=iM9+BmrXmz/GKqUyUGiOfC3IQRbgIyzLfC38EpbJ82gz5nZ7PAwXzE/pl0dSgkE5O5sj
	 Pmxk3S6oN7yW4WfNn4WZbwt5AnL8SXxxFcCn3K09K3KB0qjanc8rTXaGFkILCHS1g3FKT
	 LWWCAXcyEeTe/jO/uwj/b7HxmMDbLi+QQO/XUqif4FxMlHDVf3Pj7o3QgjSKIK1SRtxIH
	 XN7jBqHxcE3mt9yPNnfnGvIjhW/DuLwPX7yqp12bMnIF5oLySDtBmR1PMCjKs+dqEpOFs
	 FcgER1P63U/3rL92FR5MlWLgGy8GVcWS5cs4dzZ1G75XYSKJ5k6keTUfOC1ctQg3OuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSdHnOiB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.52
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2F1606A31D
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 15:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D2F1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSdHnOiB
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-7cc30120465so184153137.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 08:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793114548; cv=none;
        d=google.com; s=arc-20260327;
        b=W1+/K+fx1mIm9GMe60ARgS4km5Ijf43PI5rqy8g0H/LwgH3kJxVBrBhRGgPgkyBNvu
         BvIDCCzqKX61iSCRoqLeKw/vSR34ynOV5NhVgjK7vPkPQBLv4G5w4nSFrmWq861WMxey
         TOzLJghea5zPVoRmiTX5AES1xq6yrEWeCq1fhrpBRSptaWYxz/NEJiAPKv9WJ1+capjE
         a3jm/K0Mmg+UvwZnGni3aIWLxllohHAs96m7YmYxmpNEizbOfQTZBeJyD8hZdyE0a75i
         vMhF/1nUVJD5fNqf9vHIg2iPAQtBVLVGiD6TKixGP7mOpAuvwOT8EJBBcnbrIeqiViGH
         992w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0gy1GbYoTDZfjLk4adPcTo+vL8RJLAqdM+FNRZN+GPw=;
        fh=RrbDHWIRI36RfmHKU32ljiA2FOrJklopfBfowqN7z2E=;
        b=P5pm106AP266rS5/7MdFc5xYGNLIpybJUwax0Uaqz06e8YZyGoAiQFpSUXzPEQMn6f
         bG2j/GxuevSYQtGM+bb38CV8drDBJdFegSJiYsUFJunADjr02hZP1tIPDYaFWp7J+Lvt
         ZPQZwbQPVpiC8G4oQo7jBmAmHJFljy0cY4beBmsA1LOcOLk8KYLRMvlvfSoJm1c8SmzX
         8aQRwGfmlhbYS+WZmZHkjByirMX6Kwg5WI9skpAy46QnztY491ehnahqj03/P3FCzicG
         E+Twweta30YEQXs1ognNLZqaaHf0Znrp5vMSqd7Y5vZ8OII9Ud8Y3ZvG5akgAjPxfSIL
         HpBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114548; x=1793719348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0gy1GbYoTDZfjLk4adPcTo+vL8RJLAqdM+FNRZN+GPw=;
        b=rSdHnOiBHVDYoVQv5OsAPIJexs9GauRvr0qVYof54fNCMwrl2UeCsib7ZA3sPyHzg7
         EUmx2RJjAbgsE7vXgiJhaOeAN8ixi10oX9AR609nY7NabtRAsHdKeis97W1Pwf1YPgzi
         5tX3vTUeOHHd2H2V2LkSbI6f2HrGpB2I6Nz6V0T2nOgmMjzr8H4zdbr4FyI3Y5FdGSFY
         60h6IyWEhdSrI79pmztL47iXi7Bwyeqxp1Jxpoa/DTyRSO+JsTWk36Lg0C5INS1td/5r
         Sh/M9+SFnW/UAHqQXXcd58WcS634RkaxyeXMAFAlMKlEiHV+cEWctVBs+lZ/tbx0Qnao
         4nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114548; x=1793719348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gy1GbYoTDZfjLk4adPcTo+vL8RJLAqdM+FNRZN+GPw=;
        b=ZoxEn+m/NPhmdua6L4F2HGzSmJ8F27gFEyWdU1ovnk1GS0VdOP2bSi4NFqoj9paXDP
         q14X/zvYwQQ0W81vRAyP3HInNkeiKZiotDV7IPOIYlvm4mW+ShMO9Iinp1UiRNjq+eTP
         C8Mp6pmJfvo2SozPxM4C0hvm7p++ZqNxTr37EcfGExbx11SuATsU+bH28hSrqN096IRV
         eqz6qpmMfo8bfv9Wa/8MtUAvSn1+lOQHvjkwP2HonKnsWrkacwa1vIE5k1qGjy+7RvuS
         PzehPvt0ngCRnq4bQoiRhb11WV4iuxghTuhaMTuvlLEkIm5Oo8Ud/R6jEEMG+7iGDNm5
         0aVA==
X-Forwarded-Encrypted: i=1; AKwUvBxJGjUcWGEqyAG6Cden3bZ6K2F4AMILucrTFkDEQFrhhfSfLUUllo08c3NMLBBidNVV+39xCX43TvN3R8unAwHNvWxY@vger.kernel.org
X-Gm-Message-State: AFq9FYIeQpg9Pbfg1LnhRj/7Jv5TW3wllz6ZIVM0od0/bbsYxp0otcWQ
	a1PzbrgL8/ieT5LNWVaXFgsIzG5sp+8McU6cmnQtIx31l9soA67N34WG/u507/ABzL+IrwWr/Tr
	RXcDvJRgh2R4hxBp2OBIvBxFakMQuneI=
X-Gm-Gg: AYBFou2DCqmGYXcrQLqF6zctt3NRIDRwothkqBR2GMZAWiMRZLIKZFvI5B4ppDvcCSQ
	jcg0sPu8NGGpPajarIfAhY/lacOzwJtoPyp59Uvl/YMhZFHAQwNjbpGHGxegFhAwL97RYmr2c9L
	sI05HnrJr+ykw+QPQ2Fnk0SSj58SCGoWiOSl8bwmFBaRJsU5fQZ/fcZ0BteCcerl6U4H4ZCnImX
	D/BmyjYNzx1tHxFv20/VSL89LazPBEm9KSHdvDp+wa4YxbSL/Z31fAV5dTiWpn9X0SQxGgyq456
	V52PfVu2rChrEOGsEDcUgexwK1mGtQpT5rJA3jFGKv5h1myl59TnNdhbooLW9O1JfkFLRPYMNfx
	tRZXMcpVOv7MBVsYyaXolo6I2znRz4sRQYkXABlVv5b9PCjI+P/Ui9TLuP5aM29BcyWknEUGh3g
	F8ZuoYUGGVIuX4gNTUYqCcDnE=
X-Received: by 2002:a05:6102:3250:10b0:7cc:174b:f7ca with SMTP id
 ada2fe7eead31-7ce5c6ba0dfmr4003174137.0.1793114548478; Tue, 27 Oct 2026
 08:22:28 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADnq5_O2tEUHOcbiKL8c4UHpy3AmOWtmM7A8o3jP2qLwkx2jUQ@mail.gmail.com>
 <20261027082913.8002-1-atharvatiwarilinuxdev@gmail.com>
In-Reply-To: <20261027082913.8002-1-atharvatiwarilinuxdev@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Oct 2026 11:22:15 -0400
X-Gm-Features: AclHuK-Adz3pXhRznVuw9H0EI3Am4aff3rHKztB_BB4zRj3ojyCoORRQiP8JW0I
Message-ID: <CADnq5_PYSbB-Ges6vVgNcR4ZjYH4TxLZeAShifdV9uuH8swQzA@mail.gmail.com>
Subject: Re: [PATCH 10/13] drm/amdgpu: Catch register access while GMUX keeps
 the GPU off
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: airlied@gmail.com, alexander.deucher@amd.com, 
	amd-gfx@lists.freedesktop.org, bhelgaas@google.com, bp@alien8.de, 
	christian.koenig@amd.com, dave.hansen@linux.intel.com, dev@deq.rocks, 
	dri-devel@lists.freedesktop.org, hansg@kernel.org, harry.wentland@amd.com, 
	hpa@zytor.com, ilpo.jarvinen@linux.intel.com, kenneth.feng@amd.com, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, mingo@redhat.com, 
	platform-driver-x86@vger.kernel.org, simona@ffwll.ch, siqueira@igalia.com, 
	sunpeng.li@amd.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:29=E2=80=AFAM Atharva Tiwari
<atharvatiwarilinuxdev@gmail.com> wrote:
>
> > You can drop this.  Nothing about this is GMUX specific.
>
> I agree, but there needs to be another variable. Using pm_runtime_suspend=
ed
> or using any other pm function will not work, as amdgpu_pmops_runtime_res=
ume
> also requires hardware access and even though hardware is accessable by t=
hen
> pm core will show that its runtime suspended.
>

I guess the runpm code doesn't update the status until after
resume/suspend?  If so, call it something like runpm_active.

Alex
