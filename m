Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BBA353888
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472495; cv=none; b=THzsUeKOEwP9TL7roKFJQdRNkhlEoV+stJtRfCYBZAFg4Q0DuEF4rtDT7AtWa/RnGd0zPI4rrPjX33jgWVU4IJezUcyFnMQAlog1n37qum+BYqgNctF/jYrFZZd8VH5GJ1SM+rLo7KM+cojxkpwX5RO71qGK9lTB4Zkwe9KjvNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472495; c=relaxed/simple;
	bh=PV+hKgp8uBhGJIz2lyCBr079r6/P6n3mZp3kZ9Hxwx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a5eZi4Dv8jx0chq7qrwP5FF7KHgExdaqSqBysA9cEXg2AhOWnAjeDFiEFL5QjRg+baAaRuTeMi1+O1GlccD5/QgFPbriCNgXD8kELu1lwRxPpFjE9lsurEYUkxyPfQtoMPW6ev+mfY3c0IXPkeqTHHuAXutah+eT3CxcdoofS3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Qu/B0ffG; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Qu/B0ffG"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37a875e3418so39115241fa.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 05:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763472489; x=1764077289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV+hKgp8uBhGJIz2lyCBr079r6/P6n3mZp3kZ9Hxwx4=;
        b=Qu/B0ffGSMM2fFkjOGkcSjSTjepi3mna8SMxp7CGbCTlbMtbJKfkBssU4SLwux+/UG
         I94P0biRDvF4US6QEX5QMzk6aGbfiXJI1jInf8g9LXeX34l0AQqjun4Bvi0tajnMGbKl
         LGSK8MLqiNsX0gdiPdZEMwCmoFj4Zxm0cBp61n2Gj7CNzIMBsbSCc/K7TeFxqo3lBQqX
         ls3ZBhKf0zFTtdQOXXKYYmxWEtQF/KRJ0oWRCx685XhuiL+LmC8M+MlK7iNmmCPM8y8H
         l+D/wN5ll9tEO8Cn2jVnEBbGUzV0acCMa0aoOTnWOpY7fdgIljo83rJ/xKDfkHPr3vbg
         2YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763472489; x=1764077289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PV+hKgp8uBhGJIz2lyCBr079r6/P6n3mZp3kZ9Hxwx4=;
        b=wRl0f0Y3J3fqK5Cgg2tpeEcB96D80jhsmythlO9H/Y3G0dG2zqYfCpUbSG48TiDSC+
         KTEfrRnvSHqXTRAfdERCGHNK2wuDxFwUpL0cdhewLxZtagq5YE8nKFm+GLB2Wr/0EAvM
         S6cQzXfYKCNZm/U5tT497vlK0+8KU2B2WAkGefVz5kJsWdYHNTpncsa0SITi6FTbjfPA
         1Q8qgFxAZ9D4QJF9hhL6z4/MniUOCnSdDxZD5NsfT7Lh+Ih4ZwGiJFDF1lVA8SEnSNaX
         64tprl30ecZJB3i++GdqPWLZ/iSFeEtkvp3dXwyVEyuSeFnI02Ce8TfunDoC+/IvBdWf
         gdbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbdD2ChtyPEgufOhxzE+ehG4HBOxu49wSV06kKvtuulkgb57WJhs0kTGomN9jtdo/R9GZFJBGekcDJM+NzekysuwN1@vger.kernel.org
X-Gm-Message-State: AOJu0YxBPeaElV6s6t/RVWxW68mul60z6Ta4AFnOaz38j3XZYkn9bBex
	ELT1S7WoT1ju0mkdCyRQfUcaTowdcnns/VZo/s4ZcINhwWVftyA9Z2jdMKp0XaYEGU7Qc8Czvt8
	2JYIPrVkask2AbqtmORnJBNWA2hnutRThaP2wtkCTvA==
X-Gm-Gg: ASbGncvstnjOitvRuxaea+NgGyTiS9IgTlHGz2+GRsBO5ktFLbRTx0n+YfkYNwTAcBK
	tv0FfI2GH+/CLVVpjS7QNOLg0PG2nuSz0h5AABY/ysEaObCEj95GfBPmmTppvDo1OgCqFwlqxy9
	PYT2yWRWgGF64zdNztgHemZl/MP9UaBimBdC5LdBM9ALY3P1CxgTqU5PqBXagOONMp2NkE39aQb
	A1Nhr69c5/JDxnsqTqRh8E1fR3Bg7u4Lm3ElOR9yHeRpsNN2YHnGRp9rUurNc9IgRdT8Qz4zZfA
	aQyrXzeEBLjjzJ+ZMg==
X-Google-Smtp-Source: AGHT+IGXQujTcEnxPmTc9ankguNH9w0HeEIeKci4lU15+oAw3lsbCHx5VNCbBhRID/I9TxJd9rtkWoQzL5V6xtJTI/U=
X-Received: by 2002:a05:6512:15a2:b0:595:7de0:cb1d with SMTP id
 2adb3069b0e04-595842261f9mr5584951e87.53.1763472489197; Tue, 18 Nov 2025
 05:28:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107143837.247085-1-marco.crivellari@suse.com> <88c0ecd8-0d61-f4bc-ae13-cce971b9c69c@linux.intel.com>
In-Reply-To: <88c0ecd8-0d61-f4bc-ae13-cce971b9c69c@linux.intel.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 18 Nov 2025 14:27:57 +0100
X-Gm-Features: AWmQ_blMGySV8Rjgy7wIg0d9EsJcuMvHSLiIGonIHI11koP3rfWDFpUXzHb387E
Message-ID: <CAAofZF52hxs_UbA+WkaugNceotzPMisziBj0+AKoL+X0pNrQbg@mail.gmail.com>
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

On Tue, Nov 18, 2025 at 12:30=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> [...]
> Hi,
>
> There's lots of words in this but it's extremely confusingly written.
>
> On one hand, you're saying "most workloads benefit from unbound queues"
> but then end up using percpu anyway in the actual diff!?!

Yes, to keep the same behavior.
There are subsystems who are asked to convert the workqueue to unbound.
So in this case I will send the v2 with the change.

> If this is to support refactoring efforts, start the
> description/justification in the changelog with that, with only a concise
> explanation of the refactoring goal (you don't need to explain everything
> that is already in the changelogs of the commits you refer above).

It makes sense.

> And I'd expect explanation to the forementioned inconsistency, it might b=
e
> because of the refactoring in steps. But if that's the case, you should
> instead mention that either a) there will be a follow-up to migrate to
> unbound where applicable (assuming it cannot be done now) or b) state
> that this change is just to keep behavior the same and each case needs to
> be evaluated once the refactoring is complete whether unbound could be
> used or not.

What do you think, is it better in this way?

"
This continues the effort to refactor workqueue APIs, which began with
the introduction of new workqueues and a new alloc_workqueue flag in:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

For more details see the Link tag below.

This change adds a new WQ_PERCPU flag to explicitly request
alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.

With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
any alloc_workqueue() caller that doesn=E2=80=99t explicitly specify WQ_UNB=
OUND
must now use WQ_PERCPU.

Once migration is complete, WQ_UNBOUND can be removed and unbound will
become the implicit default.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
"

The Link is the original upstream discussion with all the details.
I think adding more details here will be too much (and unrelated with the
work itself).

> Also, there's one copy-pasted typo "worqueue" in the other patches
> relating to pdx86 (and likely all your other copy-pasted
> descriptions to other subsystems than pdx86 ;-)).

Uh, I completely missed that!

Thanks!
--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
