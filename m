Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC750221D9E
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 16:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764347395; cv=none; b=X/XmXCzr89Uc53BooXiKEv9J/zjhzAHwmT0kx3tgOWIeuTpRmUOEEHdZU1DXA2gGdpTiuk4++fITbEeFpKVFZQLODt51hDNB7k2Ozy1Fq+GwBqCYbYCjqRPIGpEFqaiV3rnx+4nTT77mmkQNKDrlWhUgm5woOxLlkgsj3ucsBmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764347395; c=relaxed/simple;
	bh=g9w7xMG+en/JDXXF8SXAVP8fHaRMUJvEBQlvx9JcIzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+RM2eS8W7eWrlCyLsAdY3favYNVlZ4I6rxNqmbmcyScDBEXX44Cjpr4pqOiru4In388Z7fF8xr8X0YkrEa8CeqJGGeaoBPflHfApoesUcORSufnjjjJwDq4zgMC+ftZePu5rGTlc2HdrAvzayybxYWa9k0A2gpgumdRJLg7CTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DmmTb55y; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DmmTb55y"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-591c98ebe90so2867299e87.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 08:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764347391; x=1764952191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYyVjVelkz5dmRR+mE/pObg2QIMgysLSVElFDZ9HNT8=;
        b=DmmTb55yVGmpHGhj4T2uZzbYVtU63Sa/FfCd2VGO/zNMWKxG9H2RBA7kq+gmzukZtF
         JnZNiMtYS44UFu2xBgqs7ihIebYM6KMHWN4RAoYVgCxz4XjGaG6EdAhodEmERRhde8Dt
         ESPSj700zvYsGkGjsvARk6QR5hJAwQxvAMENvEM/g1dds097YsbU14DHVtQSp/QEdu6c
         lzkJllvN7UvYL4V1M/A5Lqk3lu+Erd06SxhqBf4YIlWaDlLE57ylxUxSz5Zt4w9vfNc1
         DqL7G2jUUvLA5ljhgXyBHRJM/8vW4yUNlTr8Xi9HF1smYGeWaNtvfasfY3Fku7SlVQ8l
         pbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764347391; x=1764952191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sYyVjVelkz5dmRR+mE/pObg2QIMgysLSVElFDZ9HNT8=;
        b=FsUokS7wDGHwTM6eMmJuMLTTW4NyuaBM84XfGuau03IELewBy+pisdSUvl/gvnhoWP
         z83/d0bZMxhqHOJUVN9HSNVbmYBn/OcEEblDxy0/qoT2kPL1ojscl1T7sTw1ZcKg2bgc
         wG4kkS+4tH8QijvXkgQApvw7sOFNkfUv9D38CyewwOBLp9YYi4byRi1QzVqQAkWxBrYc
         H7ptVdb0f3/dThtW8eccB9fP9s4mbtmR5BhBQRKZxbwvPH3faSX1nu6PDn/sVBneVIdv
         fZp7Mk5xHwGaTyRwQkvmxL9fNcgdpOrVpw71/6UGJWE59bJ/K+SzfT4U3YSiVSusjyBv
         VDLg==
X-Forwarded-Encrypted: i=1; AJvYcCWin+Xo77m/Qu02o2UPYgqzsExrFEI7Ac3b2HLyZh4upmez/bXqPuBaHK1r2zIH2yyBh4UVHU9E3GHuQ+m3g41PqTHQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxZSxrrkVoByZkD2XQBz/1qi3MVXpg8n5lWTr9K2r2NkZ68Gcgw
	2xFR9b10u2p7bVbOTcTRt2kESKNiwOJQR+r1LCpZywynctMXVs40nbgdwPT/+k6j/JaMLuPS8Kz
	3mcw1cr0NdLLwCHUO81Y62Aet1nNZ1de0OD7W046c3A==
X-Gm-Gg: ASbGncvyYBByDR5Gd2FW9VRu/XLaOVtVBZBmONIIaRwsBmB5So0Ve0gVBMotjuSnaZd
	SMcAc+z4R82vMUbN3kNWvjQI3rZk1A/PtImy32jYxYoPwOaOc1ut8/GhAaw8gGWqZIhwdiUYbhY
	shhxWr2yi5zXCO8XqbH4o6HkGLsVLWo/2KThTC2Uni5A+DBdwzvzFXdE2q8a4m91RhU0fpcRnzA
	POuWV5S85pHT0h0nP2vxC7dMiZX7iBUI1X31n2NsP/WfSKF7d0e2x4ktELFAH0i92Ts8jxI9YaE
	t2gqdSxfm91lmg4LK8hcbxoPXDnp
X-Google-Smtp-Source: AGHT+IFJC85yzZoy0ZCZglYlfy+y/7IuUpIFGAvhB2qJbHyBFC39/FBxSfZT4Qg8LhrZCwlXBdnA796EOd8SMZrpjSQ=
X-Received: by 2002:a05:6512:1595:b0:595:831d:22eb with SMTP id
 2adb3069b0e04-596a3e9fda1mr10663550e87.1.1764347391092; Fri, 28 Nov 2025
 08:29:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127144125.233728-1-marco.crivellari@suse.com> <176432553810.7427.15425497321285301181.b4-ty@linux.intel.com>
In-Reply-To: <176432553810.7427.15425497321285301181.b4-ty@linux.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 28 Nov 2025 17:28:00 +0100
X-Gm-Features: AWmQ_bmYTxh2byHBwpXWPPUwze5qEPUtdrX5p0Eb-mekiCy7KjuGKx80PtYFpKU
Message-ID: <CAAofZF6Yo4TqF04sHuUawt0Ag=2uSDfK3Cc++pCGU9OTFqwZHg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] replace uses of system_wq with system_percpu_wq,
 request alloc_workqueue to be per-cpu
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 11:25=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> [...]
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
> The list of commits applied:
> [1/3] platform/surface: acpi-notify: add WQ_PERCPU to alloc_workqueue use=
rs
>       commit: f03dd5dd736d6aea94406a273be2a10f84bc60e1
> [2/3] platform: x86: replace use of system_wq with system_percpu_wq
>       commit: db4399501c58ad1225105224e7c9f03bc3d4fe39
> [3/3] platform: surface: replace use of system_wq with system_percpu_wq
>       commit: f720239ca39d72657e1bbf9c4c6270c78f548e43

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
