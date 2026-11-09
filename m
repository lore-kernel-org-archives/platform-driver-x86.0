Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248962;
	b=4cbP0K6oR/Nif/aFw3EFQvXL+ZTaGmSLAVpHP7urb06elmnKzLhdasBnSnIWsMYBV4hO
	 jkXlPp265o24Hwcb366g17qE4DkvaAIu1dhmwpFXKdiRuGYVdXPB6vP6C+Q7fRmMjCtpC
	 9APy9eO//+No5dzUEqezEre34ecAKhyH9vYgXdP/5sRjdOyRSAUdXvya6L3Qe2S/ZXUMi
	 fnNXed0UiQOxc7Q33Aab0FhVG5K9ybtlF9mkEYFpdqUomAKlShVNTaJUewSwgMJ4YcEfR
	 PCEaLLlzBQsI6vAXIvRGJHrcOjMMrwamUePl4pOouP2OBI00I6Q+BxmhEO/1SxF0qXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248962;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xHCyj2jSkeRuM2kkMIc0lW2hAHSKhEvR+GoR0PMU0nU=;
	b=uD5hgq26jCVpk54HvcSMpJ9/ZNWfpmLsRLWIPvp+dwKtwdFX0mDEiszsOoR7HZVq3Ax6
	 TU63uF9KVJmRAmIAH+zNlPGvoMQNmUIN2PsdUNE7em2/fwzAn+52BjMAIPktlVgJ5qDG9
	 lD73eDh1o81yDiTpohTzaC2br8FESwe0ddvf9mcJkKDt9Xbefutr/6z9k/iQdoY/BZ9Vy
	 bSdwRXmrVTDfeRPbP7qLZnDap17pApiWveuL0vxvSUMQUrRxmcRNFc6pJE/DH3l2vih1y
	 lPW7DK0d0d/JJpA5Mc091bEy1f60HQVRdd2+TF8HFk4HtHr1waiV3cU20XrZ/xoXVSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="B/2W0E9m";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB36070EE4
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B/2W0E9m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD201F00904
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248961;
	bh=xHCyj2jSkeRuM2kkMIc0lW2hAHSKhEvR+GoR0PMU0nU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=B/2W0E9mz2VL9ouaryUGi8jRnWgcOzeX1rDzNf/SYs9uheOrsbw8GXBhych+zv5XG
	 /t/q+hwBmX5Zqq2CKIUU/tV/wtE0L+ndunUZ6xH/g5TNfq4gZ+XrU21yvrAMKfE2k7
	 3bhZyne7gZK7rNMf893nIA+rynnojmbaUptptOjQFj8r4A819GVL9aFJbX8/SJMi9H
	 2ORQVniqkPQ0gn/y4x3N0l8eh4PGT4WtYyUItEhslGMVBZDS9xcr0CWDDfnHyE+SXX
	 pPkcRF7UxdFo+SEKFvgMimAwJ9c/7/fBQpXslol1Q3qYYyEpRJZlpsB4PYKZnNHn8Z
	 9tGt6X83cMcUA==
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so772079e0c.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 10:29:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEyG3Qv8NCWdZEaQkUqYtViRTqdltScpyTlVc7rbAlOSSnbcxrKPvhZTT3Aik9eSqpCh60HapSlYcyy+ZfrmnH+vNYA@vger.kernel.org
X-Gm-Message-State: APuU4Z8NSlY4uQJAcURMAFQ+Wf/RyRJ7aJ2aCYlPWreK/9VfOZwAT4R1
	iIbPz07bcrBf8x3E5ToqTKdPglf5kqBJx2kA2KnrV8incQoWtXajZKoRV8g59yeK8A5rVt1xwcc
	60VVUnhn3LRxeBeglvikA75cZmJUxlmo=
X-Received: by 2002:a05:6122:4d0d:b0:5ec:d5e1:ee47 with SMTP id
 71dfb90a1353d-5ece7233e70mr1789035e0c.5.1794248960224; Mon, 09 Nov 2026
 10:29:20 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930222650.1883805-1-jordan@brough.org> <20260930222650.1883805-2-jordan@brough.org>
 <3cd06bed-83bd-425a-387b-f1d3b073cb47@linux.intel.com>
In-Reply-To: <3cd06bed-83bd-425a-387b-f1d3b073cb47@linux.intel.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 19:29:05 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hxx-jZxgD+2aJXy2Y_LLz0_aeU4wgpx6+Bkq-YqvHmkw@mail.gmail.com>
X-Gm-Features: AclHuK_RUBk_HS-TRf-9SPVkJfBBsG7409hOdJvXCSLjtBD3J9gHu_L1S9k7nAo
Message-ID: <CAJZ5v0hxx-jZxgD+2aJXy2Y_LLz0_aeU4wgpx6+Bkq-YqvHmkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ACPI: battery: add acpi_ prefix to the battery
 hook API
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jordan Brough <jordan@brough.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	Antheas Kapenekakis <lkml@antheas.dev>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Armin Wolf <W_Armin@gmx.de>, Jonathan Woithe <jwoithe@just42.net>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Matan Ziv-Av <matan@svgalib.org>, 
	Nikita Kravets <teackot@gmail.com>, =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
	Joshua Grisham <josh@joshuagrisham.com>, Jeremy Soller <jeremy@system76.com>, 
	System76 Product Development <productdev@system76.com>, Azael Avalos <coproscefalo@gmail.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-acpi@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, chrome-platform@lists.linux.dev, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:18=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Wed, 30 Sep 2026, Jordan Brough wrote:
>
> > Rename battery_hook_register(), battery_hook_unregister() and
> > devm_battery_hook_register() to acpi_battery_hook_register(),
> > acpi_battery_hook_unregister() and devm_acpi_battery_hook_register(), s=
o
> > that the exported ACPI battery hook API has a consistent namespace, and
> > update all in-tree callers.
> >
> > No functional change.
> >
> > Signed-off-by: Jordan Brough <jordan@brough.org>
>
> Acked-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
>
> With one known caveat! There's c72dd9994952 ("platform/x86: add Acer
> battery control driver") in the pdx86 tree so if Rafael takes this like h=
e
> proposed in his reply to patch 2, that needs to be handled during merge.

Well, I haven't applied it yet, so no worries.

It's in my 7.5 queue ATM.
