Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8885E351FB4
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763551168; cv=none; b=l2nUQaYIJH/rQf1POYNXuF/ll0vm2dGkHUK+A+gq9PLxJLjtWorYBShD3ExhhrkY2o9XmsSy8/Y/rWsR141YeYZjtDWLNKUY/kJl0x4C1GBnrSfXM7qNywHsQhH0pWyhkTGW5Zk/vecHe/Qt80cxfj/Sv4jt6mOTvLYFstBZ3NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763551168; c=relaxed/simple;
	bh=WbCeNEQYjGT3Eu+LxaSAAEtYgVueuAI1nlYaO5NlXok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QU+ENl1cBip8OHljxSiy7nKvvFG749UxPYCq3/Id/zJ73zgw26a2NleBV4vYVLciLa0jhU0Xyjkq58W3RvGz4VEP1WkJLhR8kdDb+7aLV+Zl125EQl1e3++M+Ji0dZQ1zrJjKPZWjpysmz8ZYKbP8J4Tw44ssir/wl+lrQ1xduo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JkEIjxIR; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JkEIjxIR"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59431f57bf6so6936300e87.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 03:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763551165; x=1764155965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbCeNEQYjGT3Eu+LxaSAAEtYgVueuAI1nlYaO5NlXok=;
        b=JkEIjxIRutpC/XTrVmecr6tQbwMSqXxqG5XyWGTs3dTMEmumBM6CC1mBjxlQcLGULI
         cPolt/kU5kRZTctD7cWCiKmWtRZPpKbjGviL+UkPfo9eK2w2eCH6uG5lovOLy18Nyg5G
         PtYBGVED27pHWEe5ZDgE4z3FNeaRYW9Vv2gTYKKoJr+rFe063eaPmXmV7n7yvdXtDTzB
         E5FOGdTAYJ7xxQ4DojZHMqPeptFSl9ostwBbSOWyob5hFFPSiIO6pZc8y/fCUWciSQiz
         S/4MfcAOTsGyDpZ5zzlhQ6sa3zqs1fo78Rmk0atF6/lX0VvrqAYXUtZ4ftKWhDkI9ciI
         B9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763551165; x=1764155965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WbCeNEQYjGT3Eu+LxaSAAEtYgVueuAI1nlYaO5NlXok=;
        b=GPlq4iQKpBd5pH8KaUyxXYSfCuSlfW8gCSmLev0QENZNpZetDbgzrTy5Rf0GKViRWt
         EfoZARfLhJnlrJ6Im/sZzbCISmCnzr+EcVEgKaHMeHJCRGyg3fo37Q1THmLktKXbHnkR
         FRR7iBi2gtydjz27yw7lqb5gGNmiZTGAhg0uq5KjaIwTM0/BM/SOASUUOthEJqUYwJm/
         arp8c4d0CU+6qpF6AkkFQFKEIRYMvlrahUbH8+4wmk7+7Uh0IIsUAv1MnGWOPVLBpnYz
         fElWxM3HKxfcoECWwlK/CgmltBjLG4olcLHznTINd9OVJrKuWBd/nFbp4rNAnPy2KNLl
         tlcg==
X-Forwarded-Encrypted: i=1; AJvYcCUd0MlRcHprtPi2MskpdtnHIuL3M4LA03kdE05uHkZuqnxLMRK5q5C6drJ/XiCmXgQfFlHA+XtIfcuvHCt2pLmMtJXZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz82/4i9L+jHY2qnKNg4lQSanbM/egfqMEM4JJadnfL57q2Nldq
	2bp/5lwz0EpvJ6ckvbFEiqMN27LLelaH4QOzm8o7n82oCuqSRlvhJZEKwLY0OIckA5Tw6i/a54E
	MGFG1psCNrkeZZ76kOfIT32QqN02XmJ+zZ4qac+P6+Q==
X-Gm-Gg: ASbGncvaMrmNsbI14rXPwxk9xiTMBhGebZJXBKVWAJACK9gA4/5xIygiebc1JzRvaRz
	gtgJSoPUh8TR7RkfF+W+6OCsEvbrqPgoQ+KqlKnDFoOsOW2/qfy6h3UYW345x291FWPegXl5mQT
	HF68nweZYELsHA5TujgW53ZHuwPQSRJf22ASpjfypMSAWlhlUTmm2C87iYOZ2L9+sJ8dCbFJVF4
	KBVZXGR9/EeS5lfd+H0DKB1fQZ2RzmfP9cWmbtd/wMo0sZz7H/don4ZTWwVYbP0K1VJuVPLxgaQ
	FwtRz9Bhn/VsWz+LijeTvN94Ii2z
X-Google-Smtp-Source: AGHT+IFnW8lvKzm+tstgg+v9Ecdt3fouI70kNCJhSsx8kXayoC1bE4JFYRQVI5GoNoks9Mw/bHmukNudaCJ2i2lxEaI=
X-Received: by 2002:a05:6512:3e0a:b0:590:6598:4edf with SMTP id
 2adb3069b0e04-5958426b10cmr7544951e87.47.1763551164716; Wed, 19 Nov 2025
 03:19:24 -0800 (PST)
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
Date: Wed, 19 Nov 2025 12:19:13 +0100
X-Gm-Features: AWmQ_bm2ABn_s60ghN8R8Xzr1zHV_fMgx0ePGuLT504X6z_Y5mx_QFom5qsG4Sg
Message-ID: <CAAofZF7sssziBbBnC5YwJMr_K8xFriHkjjo94LH90rC3RT_5GA@mail.gmail.com>
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

On Wed, Nov 19, 2025 at 12:12=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
> [...]
> Fine with me, thanks.
>
>
> For those system_wq changes you can follow a similar structure but alter
> it to match what is changed in the other interface.
>
> This seems already okay:
>
> "Replace system_wq with system_percpu_wq, keeping the same behavior."
>
> And again you can drop the old system_wq is kept for a while thing, it's
> irrelevant to those changes as they're no longer using the system_wq.
>
>
> (When sending the update, you can send all three drivers/platform/ change=
s
> in a single series.)

Perfect, many thanks!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
