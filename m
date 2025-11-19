Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3666B336EC4
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763547979; cv=none; b=hUlOf3nnrigBwS954y4iFOGbiXNzisQDAy68RFEA56zMkO6ZTOT+uWDZ6a98eI3a757+qT8bNDOuG9AfJLE/C+DeVDyrmcaQxbx6wN0d0t1N0I1ENaFs4ivirFD9PtN58OwpnPW6Gvm6o1kWsrFwSTDJIYXIH1IYk3HluMzJGNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763547979; c=relaxed/simple;
	bh=RZmhTimbN4j6tZfDc+bp0lAvHFl++RwtjO3rsNfrIJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q64ywx3iaGzLMhMAzx/Qo9QplH1CaBriAynov+nl5RqAL0oixqMaZT1d8lEuyP7NOQka1eilSVSRpXOFwY/AuSPT1emxQBZ7STS+t+miD/ALE/rupu7HlMO+mqtXPTr3QNq6bYOFiqKkb8fjhcdzSPItdvwkM1FE/pAm6+Kjmto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OcfrsC1L; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OcfrsC1L"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a33b06028so58980561fa.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 02:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763547975; x=1764152775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZmhTimbN4j6tZfDc+bp0lAvHFl++RwtjO3rsNfrIJo=;
        b=OcfrsC1LXGi7++FN7ZD7DhLktrN92hf6YOHawSbOeTjw7Ur+HyxWyqftl6WBgYz8gc
         7hAHB64Rna8Aj/HYe+331GK4rGADQTQ2qejsDCga9VTwJs224FfYS9gQpQj19Ukbul5h
         iYWF6fUs2h2L4nH3utiIRgKbaWoRXuFwFNsN5HEpZKzz2hjWPyx/1KPhftLhXrkxzq7P
         O6d1hG47uqjmazw9d9NR3yQIIjmEZt2F/BJ7Jpa+UlqDzoWasiRx43YODz2NjVwZC1W0
         HWJAFRw+cSLfuEbuG4yLzVokCma34PIR+Lt9fqv5fPVnc31FXL7y7TX5BD1gAhMFqKAz
         0cWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763547975; x=1764152775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RZmhTimbN4j6tZfDc+bp0lAvHFl++RwtjO3rsNfrIJo=;
        b=Wwyp+R3Tik74n1QVLqJ3Bet7C3BQOpFsDs8S9aqELPZHLDbm3uajb8+kiXDGc+7L+O
         Xwym3Bwv6P+vr6zImhpAemPjeVCoJaCjBYvhut6wq0ZUagZqV9/ENcaXyoF4K8scAWPl
         Tpc/IJA9tREYP6l0ydfnSN9iCAjUp35Fk6nUh17bGCclzDAFsXfi3fS7GxC3iCEgYrSq
         JbRLKTrnbVkRPG4J2c5oRNqqFz7mS67IBqvBPdtsIxh7seTPoYm1L78+f6o3aR4GeEgB
         1fMyc6V7ShGWQWN5nB+vXEgIfMoZ24jf5pBiKQYXFXMlEu8yPrTQSV1SFLk+LTTO5Pkc
         dv+w==
X-Forwarded-Encrypted: i=1; AJvYcCX/UQLgKb7vjsQDZJA/ijGBaYskYWMaR103Rt4Jvfz78pUK9BBVeLTsa2TEbWxK6Dp5RMs3iAkieaXI8LnUshZOKkLe@vger.kernel.org
X-Gm-Message-State: AOJu0YzD99QbwVZx0pDJt3p2Jk00I6h+fpwkDm5S+ORe6fbTjeE+N2rg
	YjoHUNlZYvKAby0AskdLFxnegmbok0GcOlb/gZSKkXa4wL6mIbHPozf5JSwtEps37HV0Zm8D73m
	epLrA7ZoSFau0D5f+1WuTcnifrpl4mEBfRNQbIDPkyA==
X-Gm-Gg: ASbGnctz+WlxdJJNK3H2EZDdt22wjB72PJ4mfzHAXM+Eo+hyVRCkaQxjPyIakxRxe2q
	crtgzUBHUfJpcH/vgBSwjRobSEi1mp3Ne9wqDP8i92tsss9dLs9dMXS++w8wf4gnTmjlbXeBXlK
	lJT2lRpL7E4rIWjyfFMmYbrijD7C+fAOvXLQaX+8V+jLpZfeJiCfaaoj4DXqvPaUmKAtPHX0+ty
	FRs5Iqe8+TrCnYxyJaK3P29NENJSwKtQyhtqgcoVnDWoEQqA9LZ38xtBT0QOzm9GolLR1zAWfkT
	Szvav013quvPJQyJD6AQcasf868q2kz7E1EVXGA=
X-Google-Smtp-Source: AGHT+IE3JbcxhEiA7McipXOJXF9Xod3OqPQDw7fs10365Css5CtDUdgjA17S4uu6xg7AgIqlK8KiT9ynUc5xgtSkCDM=
X-Received: by 2002:a2e:8a98:0:b0:37b:af78:5901 with SMTP id
 38308e7fff4ca-37baf785d7bmr48562751fa.6.1763547975292; Wed, 19 Nov 2025
 02:26:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107143837.247085-1-marco.crivellari@suse.com>
 <88c0ecd8-0d61-f4bc-ae13-cce971b9c69c@linux.intel.com> <CAAofZF52hxs_UbA+WkaugNceotzPMisziBj0+AKoL+X0pNrQbg@mail.gmail.com>
 <1db6c690-ca7b-5b68-c2f6-0d8b79c31880@linux.intel.com>
In-Reply-To: <1db6c690-ca7b-5b68-c2f6-0d8b79c31880@linux.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 19 Nov 2025 11:26:04 +0100
X-Gm-Features: AWmQ_bl_OVb6zwsNjtmzNiMl0Wq-OlVeuuT5qGdebtTxoi8pflw5J1yrIGXcBGo
Message-ID: <CAAofZF7GhnQ6nQyvLSbTPOv-k4Y=nM9BvoRNRJOA53bbWLo70g@mail.gmail.com>
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

On Tue, Nov 18, 2025 at 3:43=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> [...]
> > What do you think, is it better in this way?
>
> Still quite non-specific to this particular change.
>
> > "
> > This continues the effort to refactor workqueue APIs, which began with
> > the introduction of new workqueues and a new alloc_workqueue flag in:
> >
> > commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq=
")
> > commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> >
>
> The refactoring is going to alter the default behavior of ...
> [*].
>
> > For more details see the Link tag below.
>
>
>
> > This change adds a new WQ_PERCPU flag to explicitly request
>
> This change doesn't add a new flag, "explicitly request" part is correct
> though but as written things are mixed up.
>
> I'd just replace this paragraph and the next with something much simpler
> and more to the point:
>
> "In order to keep alloc_workqueue() behavior identical, explicitly reques=
t
> WQ_PERCPU."
>
> > alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
> >
> > With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND)=
,
> > any alloc_workqueue() caller that doesn=E2=80=99t explicitly specify WQ=
_UNBOUND
> > must now use WQ_PERCPU.
>
> This belongs earlier to description of the refactoring (to [*]).
>
> > Once migration is complete, WQ_UNBOUND can be removed and unbound will
> > become the implicit default.
>
> This is irrelevant detail about refactoring since WQ_PERCPU is used here.

Thanks for the suggestions, I think it should be ok now:

This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The refactoring is going to alter the default behavior of
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn=E2=80=99t explicitly specify WQ_UNB=
OUND
must now use WQ_PERCPU.
For more details see the Link tag below.

In order to keep alloc_workqueue() behavior identical, explicitly request
WQ_PERCPU.


If it sounds good I will send the v2.

Thanks!


--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
