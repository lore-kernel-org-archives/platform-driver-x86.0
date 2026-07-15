Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3247439A046
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2026 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127994; cv=none; b=KcEsgswo5W+YDut+CBWXf1NB7W/Cq9l+XAULxUoTh+AjG8UptisO1h0Pq21GQkTz1rYXuM/nqfyYUMsLf4R9r5teTmZl2Y5LEo1oIRZF41uLWfHnFZpPlfIu668RSsLCpYXZ08bS3zKqdgDD7o7uQSwqZLL1WAAbv4MUes6ngOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127994; c=relaxed/simple;
	bh=Fq3EApb3mdMsCrCnwSH+pp0h1+urKkk6TgufwcsavTA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUQu4/FD9vgRPMF1avSMM0v7MIELZRLnYFP3qNf7WzW/nGdklp4H4ns1siSEodhE3GOGRtCETvwYDQpnKQRHcrvJRtTH0MrSiiTywea3qtQKbgtf0rx0g7yMFkEFeLPt3uQNX/IdFiUmcQ7OgWl8Frc39u+yKOHxhG+xc58A7DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOLoj8Tj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOLoj8Tj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199DA1F00A3A
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2026 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784127993;
	bh=Fq3EApb3mdMsCrCnwSH+pp0h1+urKkk6TgufwcsavTA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aOLoj8Tj2RQN5x1dDzawSawtdyB9nPVBhVa7WtniQPYpMDe/SryaWchW1ZkWdsCuP
	 gbSf6YlKessyGwU3ovN3KqV94StcTiS1D/XLOY7r8T/p81mD4vZJo4AmPQTYrXwQ79
	 gfvTo500lBQaE9zha/uoIJs1LpXdByVs+k+CChcHO3lnbDKWhmtMdszYEORsrgwwCw
	 R6HRos61VfXcvcPcS/c07lLC2URwFx4BeiPOL20cCx+s0kxK/vZ1oUN7av1+gVdAqD
	 BNbGwrkrfLbMUAZTPhcJ/A+EvOuh6sE2ZlolfIwHDQZo0RBxS7BQLBQxf1OukeyhXE
	 Xhz8tUI8jzHDw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso5291990e87.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2026 08:06:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrwdo7GY73LGJAdpev44qOqmc8GQOmzonCS8poYdcpqXPpCA5XMngdRkWU3HXYMqBWwMDN98osEAz+t9Cwl02x0V878@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9GBiWb3RyO2vuuIqg+/WrAPZUnd4bHjcR4rx+I7pg/rM4Gn/a
	30pQoQOXR4jag0Q+7yfquz0uebxxXXN5u5e/hrEDeV+b5nBEhlzaNZ4YER5OJmwJKnkjW32CQ6t
	dreZv+D6PIyyC+ZC6UwacPzKi0eqKiJXp5j063ODrIQ==
X-Received: by 2002:a05:6512:6185:b0:5b1:4fab:fbd4 with SMTP id
 2adb3069b0e04-5b159b8bbf7mr1391447e87.59.1784127991827; Wed, 15 Jul 2026
 08:06:31 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 10:06:30 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 10:06:30 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAMRc=MfOipGdiGXNgVrJVO8QOivQ-=8k3sX-nMfTS0DvdZcFnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
 <20260713-swnode-remove-on-dev-unreg-v7-3-6d6bc448427a@oss.qualcomm.com>
 <DJXNZLE3L756.K5DYSTKM1UHT@kernel.org> <CAMRc=MfOipGdiGXNgVrJVO8QOivQ-=8k3sX-nMfTS0DvdZcFnw@mail.gmail.com>
Date: Wed, 15 Jul 2026 10:06:30 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeXwaRSDJYKeoM6PfqWqRPh9KCMF8HATFvaTWUf6N6GYA@mail.gmail.com>
X-Gm-Features: AUfX_myDholJDSN2cDMXGUzfVzc3qcKtFWO9_fcTJk6A17fI1HiyRxBYBU-_K18
Message-ID: <CAMRc=MeXwaRSDJYKeoM6PfqWqRPh9KCMF8HATFvaTWUf6N6GYA@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] driver core: platform: unify release path
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 15:52:07 +0200, Bartosz Golaszewski <brgl@kernel.org> said:
> On Mon, 13 Jul 2026 20:45:13 +0200, Danilo Krummrich <dakr@kernel.org> said:
>> On Mon Jul 13, 2026 at 5:11 PM CEST, Bartosz Golaszewski wrote:
>>
>> So, either we have to special case platform_device_set_of_node() too (for the
>> case that a swnode is set already), or just require that the function must only
>> be called when no node has been set, as all users already do; I'd go for the
>> latter.
>
> This sounds good too and it should be easy to implement another test case while
> at it.

Oh but wouldn't that require us to introduce an integer return value for these
functions? Or are you talking about simply updating the API contract?

I think calling device_remove_software_node() on
is_software_node(dev_fwnode(dev)) in platform_device_set_fwnode() be enough
to handle that case, right?

Bart
