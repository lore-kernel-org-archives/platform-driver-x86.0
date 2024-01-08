Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59D2611A;
	Mon,  8 Jan 2024 23:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJvTNZH4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 663E7C433F1;
	Mon,  8 Jan 2024 23:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704756832;
	bh=RXxUvLZiyFheB/gGeVT6N1rvxcjtUKnOOKLE7vzZ3Gg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZJvTNZH4CDhMcVp6MDkJJ0sojJgpCZm4/2X/6ETnoKyNBtBPI86OysHMdcTvAu8ld
	 kVPL/J7a7PNCyO/Ys6c6dHksiY7UskAUe5Ws3hSnWdSW1IsA7f5hSO97oZnZw3DO3y
	 UegXKbohJEyZuQs1ps4RGOBbnzjWTZLf/mt2e0qfQkhqqgrKn2RUiknEKg30I/M2WB
	 4d4dBxh9V1sxpR4Ktzl1ncRt6NLghOlT2l/wiD0Ah+ZFy+6ASEHMy4RvYDvLOxQtQb
	 XA1QAnsqIi6AxcegsFWOey1FRPscdpOzlDHvupvTpKFdA4Ek/Zu3rdjXemJBInpVZf
	 rL7GAuvJLqO8A==
Message-ID: <f7be075e4af9f9ee2c61ebef6c0b5ca2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240108130238.540794-2-hdegoede@redhat.com>
References: <20240108130238.540794-1-hdegoede@redhat.com> <20240108130238.540794-2-hdegoede@redhat.com>
Subject: Re: [PATCH v3 1/5] clk: x86: Move clk-pmc-atom register defines to include/linux/platform_data/x86/pmc_atom.h
From: Stephen Boyd <sboyd@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-clk@vger.kernel.org
To: Andy Shevchenko <andy@kernel.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, H . Peter Anvin <hpa@zytor.com>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Johannes Stezenbach <js@sig21.net>, Michael Turquette <mturquette@baylibre.com>, Takashi Iwai <tiwai@suse.de>, Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 08 Jan 2024 15:33:50 -0800
User-Agent: alot/0.10

Quoting Hans de Goede (2024-01-08 05:02:34)
> Move the register defines for the Atom (Bay Trail, Cherry Trail) PMC
> clocks to include/linux/platform_data/x86/pmc_atom.h.
>=20
> This is a preparation patch to extend the S0i3 readiness checks
> in drivers/platform/x86/pmc_atom.c with checking that the PMC
> clocks are off on suspend entry.
>=20
> Note these are added to include/linux/platform_data/x86/pmc_atom.h rather
> then to include/linux/platform_data/x86/clk-pmc-atom.h because the former
> already has all the other Atom PMC register defines.
>=20
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
