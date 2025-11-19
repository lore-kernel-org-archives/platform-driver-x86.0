Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0545F35E551
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 13:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560118; cv=none; b=dauwxoERNxrspq9kfeqY/WBEEu3PZEFEu0qvFVS/uUE6zbAghOVbR+CKocXzGMPKAGpYvoHWlORzYdygIkHmPMcmhF1kC1+fMfgOPZeFKdPdUeehbsLNcugGJoZJCVU2IAYI3SvX5zYY+kF7yXpSfirf3PyHpi2dur0Zpaz6EIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560118; c=relaxed/simple;
	bh=T2Bhlhd2OjAV6rBSTTQrw8tWFeX7IcMgFCiQuNxL4lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pQMfrfLv+dVkqZQ5Xno3n2ln0yGWFLXDSa/+jrvhQavofUQknSAvNF8oSiSQfcmq6qjJ+p9BxH/kUCeBBLiMr6vYS5yZp8flvbx23XbhiXmYcR4Gh3P4rjAjTirCCc56pXuTOGHlZr87WNzr/ONT7nQViY1mVyP5eMYb1otNmQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DA9Lh4Hw; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DA9Lh4Hw"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-591c9934e0cso9167289e87.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 05:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763560114; x=1764164914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2Bhlhd2OjAV6rBSTTQrw8tWFeX7IcMgFCiQuNxL4lY=;
        b=DA9Lh4Hw+oY+bqEe6h8b5kGQrOj8RARuXnZQK3gIXJca0FXwV/f/d9i7S0L2CNcLtD
         TiBHnFwDyRtSlLyX4OtBfrdnBQ3eKrR+yup0jceUVVSIpta9x+BRbGmmp6s0AVvlm61h
         EYabgtefdM/EGNNGFLYjqmQb/Tkc/jPXUAtSJLTNUd/suh8pwa4kX3giB11Xi8nxX0QZ
         Jkr0DrrM8uT2r8L1qCwT9L4OcVpmTn9w3hnjRfp4bq0bKbDj1dvXmjsc4jFfxOnLEAeB
         g6BayuXADxD0MV18D4o0YiDWXh8ke/We5UmVY9BL3gqc16L0IUXaml5ayyp+i75OUlEB
         briQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560114; x=1764164914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T2Bhlhd2OjAV6rBSTTQrw8tWFeX7IcMgFCiQuNxL4lY=;
        b=oQaqlHmZQ5JrvYyqo5D8GSSPK8cDYS3kiSfebknhQF68E3Pk1BbeSpfLk8aNhSpAla
         4p+Zc1xpYIQcgLtgI52xrbAVK/fuJ5YDz54Gn6xLLxx02gbcgbY6TgUdbXecSCOlOg/8
         CIgiwICqnFOKd2igV6UYtp9Wf0Y0bppErKGcIr+fV6Dfgv6MLEfBJjmFPJFs0gYvgA9N
         OjxlGUlzfpv94xmzEiUVBfiL8vYC/H58n5uXyZEyCE/KMT/PYvrtmu4MViP60wuuU0mi
         weZxXGhkMFgHn8TP5erEuJOtF9+2wtBXwQXwyjNhtlvG/gaawpHalS28idI6aBeQeAPS
         wUsw==
X-Forwarded-Encrypted: i=1; AJvYcCUmMSbLZw8kZWSq2+StvogsPEr+sv45v5VmhdwD98nqlDH5+oo4A/25Bcvi3NGVi3gD3Nudxb/RSo98UtU+cttIkaJ7@vger.kernel.org
X-Gm-Message-State: AOJu0YydK6aU7Qy9Tf9cZH/3wTcWNywU8KZoIKO8c5YkvOJixcdq6UjT
	/ZDdIBNSwFvo24UC+rt+YItorEttmfpy6hSNL5RjdhJkwAp+6EphN48RIiHv1k5nh4bltBN9HFH
	MEO7JR/aB/5PtvuVWuRuvD7LCJcQ9DqDo8Ncq2ZFz6w==
X-Gm-Gg: ASbGnctzvak/8Qs4xhKs/ar8kYz2qbkCpRM6zpvdjHfG8Ar6n2bATMskg9fh9xWZayg
	ZZd6t3C+2iEM0zBwwi/H20DGnp1P4KF4FqLz1A/ep1LgRoJhcqD9G4CUiVQWwVxB3szAU2qQVPN
	LeV6y1xwlwGjxQ+UMHC6tN0rK0k6dTXx3BEQ+ZHvR7gT/H2DIfnW5PgqBrivMV74mXWTElovdoo
	Yv9eX/c1k2TW1AoGpx7ga3POUVR4+saequJEBjGhOjyiK0uJGJRVF/xs8ofNCcpWwLeFjEWhbT8
	/ywB6sMGLedq5oBI43XFBItDshZe6gAWti/OXZo=
X-Google-Smtp-Source: AGHT+IESnidjOfk95weQJ+gd72JHAqgirD6KxoFmOMXwiEt1mJNX+SXg4B4jwVkMQBKp1H6PiYO2XjPlHniXQxEtguI=
X-Received: by 2002:a05:6512:b87:b0:595:7e9c:cdfa with SMTP id
 2adb3069b0e04-59584198675mr6713392e87.6.1763560114155; Wed, 19 Nov 2025
 05:48:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107143837.247085-1-marco.crivellari@suse.com>
 <88c0ecd8-0d61-f4bc-ae13-cce971b9c69c@linux.intel.com> <CAAofZF52hxs_UbA+WkaugNceotzPMisziBj0+AKoL+X0pNrQbg@mail.gmail.com>
 <1db6c690-ca7b-5b68-c2f6-0d8b79c31880@linux.intel.com> <CAAofZF7GhnQ6nQyvLSbTPOv-k4Y=nM9BvoRNRJOA53bbWLo70g@mail.gmail.com>
 <bc69382e-c409-11f8-a278-d93d0f68ab1b@linux.intel.com> <CAAofZF7GwRKQcNAUK9=j4mqnz+HX_ONG9YKs4PLztbjvJxrxZg@mail.gmail.com>
 <324dfca8-8f16-158c-8fb9-8efb52eff4ac@linux.intel.com>
In-Reply-To: <324dfca8-8f16-158c-8fb9-8efb52eff4ac@linux.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 19 Nov 2025 14:48:22 +0100
X-Gm-Features: AWmQ_bnJkvhics4c12KNJpyTqJ8PdxWV-g0F6zlS9s6AGYAux-Ork3g2QeB9VPY
Message-ID: <CAAofZF7AbQ12-3DzpN9Ai49VzOHa3VqyfZnXSpfVq7qijO1GRQ@mail.gmail.com>
Subject: Re: [PATCH] platform/surface: acpi-notify: add WQ_PERCPU to
 alloc_workqueue users
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
On Wed, Nov 19, 2025 at 12:12=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>[...]
>
> For those system_wq changes you can follow a similar structure but alter
> it to match what is changed in the other interface.
>
> This seems already okay:
>
> "Replace system_wq with system_percpu_wq, keeping the same behavior."

Sorry it's just to check with you before sending a useless series.
Sounds good this, for the 2 system_percpu_wq commit logs?
I don't think there is more to add here, because it is a wq rename.


This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

For more details see the Link tag below. Replace system_wq with
system_percpu_wq, keeping the same behavior.


Thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
