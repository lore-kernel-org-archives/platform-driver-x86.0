Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2336838B7A9
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 10:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050770; cv=none; b=Om9kZlr6qgo6PrqiWrvgrZgU2wqEIWfCn1M7Cc4fPPvzdHOcs+seP+3NZKFbfn9Qm/Nt9Xzpt7Y87OQdA++luvKOZhQY0sz4szgce4jHG5bJqrCrU48zbtRoOcdtL/ye+shflpNZcc93nxAgCRanhi03Oxm9xr0NQKXHUqRKxt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050770; c=relaxed/simple;
	bh=iuXWIHV5c/Ye0sNQc1RGqNofp0ZOqn4Vk68ePMnKbus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxzJtz3mFXGCm7W5YLx8KrH8N2aCX7K0AfMhYG3s29iVGVyJjok+LYyP4446NfVbVMGlOHjvZBWFH+VUsfwREfHuArdrbaTiB/YbWqm6xct9eu0WgvGChlPz/pzd7chRvQmeuobIoze1yjIc1ZYzBAre3JQFrOnZZdhd8w3zcWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txbRyOPy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txbRyOPy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7897C2BCAF
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 10:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773050769;
	bh=iuXWIHV5c/Ye0sNQc1RGqNofp0ZOqn4Vk68ePMnKbus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=txbRyOPyc8o3P81R36MzKgkxuCc3gZ58YwHwkO277arLoROgF9ocWZ71opoXgR75G
	 0OlOVZ8FRhsrM+yjvNIhCsOCzIW2bPrtYuu4Tv0N0Rb8nGWwTn0RpoN1656OoY3Ofi
	 oJ92tf+5MVLbvMDOwXn+9axazOO7s+ahmlvH2zYpXMvfMNOrbz/716JwJGWnQGBwG4
	 H88yiyr1VXMi9MQZfhn/y2WWp+rzDPhtTyzIgbK6pEKTiGaYvtVdWVocETTz7jxKQQ
	 UkQVJX+js1X55bGiLedRUqxMId+IjdELhoYhz1DeY9rAR/GQoMG3UvqaJgTgI89E8+
	 t6/qw3Azt7Nkw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a2a59baa6so45055941fa.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 03:06:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV66fKIF3xSZpoUGnGpDhjupd+iR5Zk1XvlPnhfXufClLJoQL6LlSmG1IufeNh4HWHzBFmo6lyI2yvTQpBOl+g6jlgF@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRRf3arhYgkzjcD4s7G1RbNznobJESf4lZd3OvdpsPYRFWQ88
	3EGYknI087wfv8ZsoK3rxSbd4LtTfk4BmzEDksnf1qaH35+NyqxzWnXjQhAzVZBsbAtSNuxcwpA
	CB+U3gIxzSY3PqFW0/WIkOkgeCLp1yW5A7zHp+1IoLQ==
X-Received: by 2002:a2e:b683:0:b0:389:f20a:caeb with SMTP id
 38308e7fff4ca-38a40d68a29mr24869201fa.15.1773050768302; Mon, 09 Mar 2026
 03:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260218-meraki-swnodes-v2-1-92c521da241c@oss.qualcomm.com>
 <177280162204.1002992.12499935361323933725.b4-ty@kernel.org>
 <CAMRc=McqOD6FTQ9OGWUatL1NHHiW_O0YUZZK=CSHxOJNadhqEw@mail.gmail.com> <20260309095523.GT183676@google.com>
In-Reply-To: <20260309095523.GT183676@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 9 Mar 2026 11:05:56 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeosAePjj9acH432PVcnjUVfe=HzZ=TP3JFhp0tRdRy4w@mail.gmail.com>
X-Gm-Features: AaiRm533337Sev6m_ehjl_6S2nB4zjii9KUEqD6cC_Md2Tw3GeJ3MtQQKwlAsFU
Message-ID: <CAMRc=MeosAePjj9acH432PVcnjUVfe=HzZ=TP3JFhp0tRdRy4w@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 1/2] mfd: lpc_ich: expose the GPIO controller
 cell's software node
To: Lee Jones <lee@kernel.org>
Cc: Peter Tyser <ptyser@xes-inc.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 10:55=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 06 Mar 2026, Bartosz Golaszewski wrote:
>
> > On Fri, Mar 6, 2026 at 1:53=E2=80=AFPM Lee Jones <lee@kernel.org> wrote=
:
> > >
> > > On Wed, 18 Feb 2026 11:48:01 +0100, Bartosz Golaszewski wrote:
> > > > One of the users of this driver - meraki-mx100 - abuses the softwar=
e
> > > > node API by setting up a dummy software node without any logical li=
nk to
> > > > this GPIO controller and uses the fact that the GPIO core matches t=
he
> > > > controller's label against the swnode's name to make the lookup wor=
k.
> > > >
> > > > We want to remove this behavior from GPIOLIB in favor of actual mat=
ching
> > > > of firmware nodes but that would break this user. To facilitate tha=
t:
> > > > create a software node for the GPIO controller cell and expose its
> > > > address in the provided MFD header.
> > > >
> > > > [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/2] mfd: lpc_ich: expose the GPIO controller cell's software node
> > >       commit: a64ee7d8ddd6e04d82c06238a238b7877cbc35fc
> > >
> > > --
> > > Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> > >
> >
> > Hi Lee!
> >
> > Can you pick up patch 2/2 as well as per Ilpo's response and Ack?
>
> Are there dependencies between the two patches?
>

Yes, patch 2 needs to see the symbol exported in patch 1.

Bartosz
