Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253078;
	b=kKDYaZj+ZMBR+chtETTI56G4fIi+z/C0yLrcH62vjo5LGGQpLrI3Zqi4qU/AUwC3p61x
	 qxWhOhurmXrp6htq6LkE1aQzU1bIJtBSh3eNE9SK58wJoBsAfQyANIPivp74GtsjIOgHd
	 V08BJzWdoO8FmLKDNuHkBqQmi3jbDwPXixjQNLzZll5Pr6ZjYx2gzP5R7DVgymvDWBBaU
	 BnjU5VUTlhn3rvNDUeWlqBbTXA8TAwwS1Tj6UBR61/OCsalIghim+fVeIhy6xesBYBJll
	 ni5JYYhmFiIZ2SLX4vpSeGgH7AZ2+W5YkTswyON0ROWYf3wS1wUE/lQ06xkMXPKmJDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253078;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MvWd0+CmwRokWvhLXpRIo+Vb+Gi+G9Ir/IiNgUEH2gU=;
	b=aofuD+Yf+8Wn3WpK2/Rx5hN/2UEamAMhlSp7W3j46656EdFQrm25vehjwlwy8Km7LYxe
	 Oz617bIKuOP8cEz/aPsUeIqfRDskLMi6wusgCFT4m8110xIpPjjsvGpoosUD7EoFfDACk
	 ssQe2V7v/HsLllQH5h0o5CD9jxg7/+LgUruHXV57fAuX/ZiuHuaBSTEswMJO6I0xLP7cO
	 tEGOoRZz5zSvd950p/0dV3d/WQ7lpq0+NryXXFkpVjmpsGgmwMav+Xg1kF8SLVniIYRBp
	 t/HAEVrvFiNsO+L4T5jsmvUq74c8ul4s1j7RSDIb8qfBfeyU2/3I1sdNkcW9TtndpbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cb2LBgsg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA89D606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 19:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cb2LBgsg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C50C1F00922
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 19:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794253077;
	bh=MvWd0+CmwRokWvhLXpRIo+Vb+Gi+G9Ir/IiNgUEH2gU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cb2LBgsg4n4sruyHj68RZq3ccVRcm5UuufSQqvsWoLVd3qVz8XzzsQWfgHw5tSGEg
	 pnbDt8jyDOtgQcuDXSppvRmXz6+GdHI65SpERZ6/usCv7vacjt+EkL7n3Ls6Ikr0Lo
	 Nlo01B8n9LjysiLed3s1rkW2YkDAiWoaNySqdsE53+WMqHUz4wivQxAjQHlvXi6R2u
	 y0gJYq7BWHrhIwqDkqY+K3UDmnnyWx7Rl8IWwLXoQGrceK7lrqRXnvi87XeYvNXj4a
	 dbaF1Ssx63xVGaryj9W1GN2E8iRypW66ZKa/ZoEAIXSk+Wk3kBXBewt9AduCWz5aks
	 kJpdbRUxxdgTg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3adfe77d336so9552271fa.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 11:37:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGd16aV8GescS1UQajX80qrwznIbnHkH/QzOKcBkpeddjg/9cczS/cgj6n+s8O744ok4wii5eKtk0dL4cYg+CdHa3lP@vger.kernel.org
X-Gm-Message-State: APuU4Z9tmII28tHMO5w3VPaR8AZ74wyPmGXgwEMMWW0z9556oSwSnT+d
	iHpPHHs1zzOhDitk47stw1qeZFRicmNFlujWojaPd7rAHPfjVPDCeNyrv8K+SnaGsF1PspicjKH
	uNW0QENn2F20v5kYD0UqHee3AGD3Q4kw=
X-Received: by 2002:a05:651c:41c7:b0:3ad:de02:e9a6 with SMTP id
 38308e7fff4ca-3ae09623c97mr429461fa.16.1794253075553; Mon, 09 Nov 2026
 11:37:55 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
 <ed4aac63-ac58-4e2a-ae45-ebf4da158228@oss.qualcomm.com> <CAJZ5v0gGeKEqMWvP3cQrXztZt-faFZJF+yNfygcBPT57f-a8Lw@mail.gmail.com>
 <34c23beb-88d5-4456-b84f-f00e31578468@kernel.org>
In-Reply-To: <34c23beb-88d5-4456-b84f-f00e31578468@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 20:37:43 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0haqd=UiGJq307O48NV=Ha2xHZiFQduHYaAPOf=2KA9=g@mail.gmail.com>
X-Gm-Features: AclHuK-vX_OAFSpUyezAsyhyijSyOhOZPP76kuRi9FiBvZGn9m4D3huc1FthJj8
Message-ID: <CAJZ5v0haqd=UiGJq307O48NV=Ha2xHZiFQduHYaAPOf=2KA9=g@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Make platform profiles firmware independent
To: Mario Limonciello <superm1@kernel.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Armin Wolf <W_Armin@gmx.de>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jack Wu <jackbb_wu@compal.com>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 6:39=E2=80=AFPM Mario Limonciello <superm1@kernel.or=
g> wrote:
>
> On 11/9/26 10:46, Rafael J. Wysocki (Intel) wrote:
> > On Mon, Nov 9, 2026 at 5:37=E2=80=AFPM Daniel Lezcano
> > <daniel.lezcano@oss.qualcomm.com> wrote:
> >>
> >>
> >> Hi,
> >>
> >> sashiko validated this series
> >>
> >> Is there any other comments for these changes I should take care of ?
> >
> > I'd love to see some feedback from someone having a vested interest in
> > this interface.  Mario?  Mark?
> >
> I am onboard with the new approach.
>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

All right then, applied as 7.5 material, thanks!
