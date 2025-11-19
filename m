Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF3233C19E
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 10:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763549801; cv=none; b=Lc6/u0SBZ/mKLG7C6iGpPi9TCKvSk6C8Mt2uNJcMylnUM8ZFFR4gvvISiwaekv4wfixKwfSnE73KBg+oO4Hl36+ZatzLA2yIo5rZLfNqyOGnmE+kjAdj2tsaZnd/rBc8dvKdkrX36z74ekxR1WuRVYNpR6InTkA7HyGI4YrIBXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763549801; c=relaxed/simple;
	bh=ky5zIvoeTFoovFZ5rXHn++r2xzHX73atbNIBcgTH5oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cj7ibKbsrscSzzW7KpurMF3sNRM+zUd9uY0CNYyKO+owDlJjb4yqr3qI9Bxg3CeT+XFOaWRBZbzDDhBj2NYTkLjmFNsN7+QSGZPcx6kZ6WE6lakhMpIFelcNb7jFrlDjZyuM0E0yRLgrWXlBTp5N4o5wicYeULhN42Eabgr/r90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XrLSMNRv; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XrLSMNRv"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-595910c9178so2603115e87.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 02:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763549797; x=1764154597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ky5zIvoeTFoovFZ5rXHn++r2xzHX73atbNIBcgTH5oc=;
        b=XrLSMNRv/iVdLQVDgyaSdQ480/8YtuXk4S3ncBqt6BnG2Oo1nRwdGWx3mvTa11ymQc
         0cSCXOgxWr8G6tKqyX4beTKgxKUzGGw0ahaY0w58msrNJs+5gE1Vknmzjx000cFMkq/s
         ZOphdzKtlhPRtT0DaXIt41yy8i2mndSM0nfiXnnw3WuA8N24laGFL3ujH1KtA7Vj1KKA
         uLITDUWYzLPI3MO8yLxQFNM4A6bnZ54MG3AeeEa4hZwX7hSQhiPW+oQq2sKursQfE4yw
         fE9U/zQDngyoYWuuFIMPn9MZ4bfQwjOU02u5oEosQC2XuU+oC6FGzwXfSu4lNb0X/eEM
         TWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549797; x=1764154597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ky5zIvoeTFoovFZ5rXHn++r2xzHX73atbNIBcgTH5oc=;
        b=BYX/dX1fZAOfCCpOweuGA6gQ74LSDDZz+gv06sPaZghYKE0kFu2BcSR8M60anUfZXS
         4pDQkhxY4fsifqx1T3n4jzd+heC9KNH+UBRZWUBVN/kUIpH1yGF07uTL4p8JmDjfrHOp
         0FzR5Zr2LK27DPqYFzk54vegZJ2dqSDfnrDwz1AO0AfLxCf6eLG7IAOjDIm4MmTdljX5
         Z86vaP2sYQI0t44FSIpf1NOI6CdPsOoDI4cDR9mVBPqGAD96OkF0qjlPlnzkZntSCRLJ
         Os6NRnF6TpIMwTaev4qs1x1V6vAd38mnaspuomG9LaYDX6XT4rLChWTZ/8FQiX89a6GR
         xxEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxNvrujFq7ilh6kAeHzTMZBv/xMOOsK8CqwZhoiUCqCPObsTK05Vrme85SvXkSlHmS5PEckafebGG0IwSsYEmElPWU@vger.kernel.org
X-Gm-Message-State: AOJu0YyRemNe7oTO4AEcE3nsCFg73L/OoqVP6GJxApvWA01SgRMeuqBR
	fw+v2wyHsWWCd9T30qsoQDq6C4jCOtjQ3JnzKH+tNK7SXyxtfSUF+OIlWvkK124tgyGJLh9fW63
	gByNehaddJLGxrXVcsQrDmZ3TknlEU9PQzQBcInYOFQ==
X-Gm-Gg: ASbGncv7oEKb7Be/ByO4CUoHgwJxs+4Pp+DzHotD5yNNMJjZ14RUw5Fu5tbNW8+k86s
	Qy+G34Rc0LmCgIBqoc3iPy6nNBDDL2itHlV7jf+q52zckDtJg9SEOfOgajb4s31IKJvsplTQh/C
	M4nms3eQSdG8cT8BBpvtAmr35ZjMoIIce9nNliEORc7WV7YYsFj860U/aQNo5KtqPE3xtx5O2xF
	qdQN1xrSi7LFY9u064akur0Cy8YVcan9Yh3W8DoH57x4GAOM8fz0GrhO0w/Y85t2Hl4vT1EoTyb
	ZACKQQA2ZiGem3wWjrgJ/Obpw1M5PU1wGzEiBDM=
X-Google-Smtp-Source: AGHT+IHmvaExkgaMhrJMP+SCUnxI9zK/ccqxDPDszICqbODRjTOcnY6Sn6QvHz9yIEZF1+5bC1bdQuvBgqq7AqO/dLo=
X-Received: by 2002:a05:6512:3c9e:b0:55f:4633:7b2 with SMTP id
 2adb3069b0e04-595841f842bmr6309957e87.46.1763549796586; Wed, 19 Nov 2025
 02:56:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107143837.247085-1-marco.crivellari@suse.com>
 <88c0ecd8-0d61-f4bc-ae13-cce971b9c69c@linux.intel.com> <CAAofZF52hxs_UbA+WkaugNceotzPMisziBj0+AKoL+X0pNrQbg@mail.gmail.com>
 <1db6c690-ca7b-5b68-c2f6-0d8b79c31880@linux.intel.com> <CAAofZF7GhnQ6nQyvLSbTPOv-k4Y=nM9BvoRNRJOA53bbWLo70g@mail.gmail.com>
 <bc69382e-c409-11f8-a278-d93d0f68ab1b@linux.intel.com>
In-Reply-To: <bc69382e-c409-11f8-a278-d93d0f68ab1b@linux.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 19 Nov 2025 11:56:25 +0100
X-Gm-Features: AWmQ_bljTRTlAH6w6AXbVegGLSNn0TfzgphNtzTUcDKlNdscYDAQOnUnzzbH0DA
Message-ID: <CAAofZF7GwRKQcNAUK9=j4mqnz+HX_ONG9YKs4PLztbjvJxrxZg@mail.gmail.com>
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

On Wed, Nov 19, 2025 at 11:38=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> [...]
> So after refactoring, WQ_UNBOUND cannot be specified as it has been
> removed AND the default behavior is "unbound", not "per-cpu", right?
> So it should be other way around, e.g.:
>
> The refactoring is going to alter the behavior of alloc_workqueue() to be
> unbound by default.

Yes, it makes sense. I changed that part.

This is the updated version:

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The refactoring is going to alter the default behavior of
alloc_workqueue() to be unbound by default.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn=E2=80=99t explicitly specify WQ_UNB=
OUND
must now use WQ_PERCPU. For more details see the Link tag below.

In order to keep alloc_workqueue() behavior identical, explicitly request
WQ_PERCPU.


Thanks!


--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
