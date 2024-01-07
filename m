Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ECF13AC6;
	Sun,  7 Jan 2024 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CjdfwwB6"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EB38240E01BB;
	Sun,  7 Jan 2024 16:10:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UUKPEGfXS7Fn; Sun,  7 Jan 2024 16:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1704643808; bh=uicWjHVcjuJUbwy8PSbH0cgGsvhhw20EHj9qFuZ/dA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CjdfwwB6RVBAL52E+jk7Bl5fG5c48un2cY7asSRJKZG5KpexELYi9RW93GizIOB9w
	 KuUFalBTSF1utWoE0eRk1vP1u1avCmb1qQfL+FQ0t79934AeJ3Qxvr3zfCoi0LinwL
	 fZafCzQQ+xnvMfuIixsgO9p5K/yfmnb74tF1kb5cDGyg2Mmuws3rUNnLqyCP3IqRI3
	 qV6OhYsB+rneSW6/6OgQKfDIt43PZF42lN1Rth7TFQBBcHcslAeqzsdZrdBBq2WXI8
	 Io6h6tIZQSO9ddzrMTR7ImLy1ch+rTw4vk91LLzEBEOLQsk4PU66xLBp1E6oTFizWD
	 aLZARTrl13btJ5ssGBY9fhMSr7nOB/2ruuupjSVx3Mm9TgvOFqDjwQmQR5JAvEYaCU
	 qAZE931E8g0k2Q0DiYaniSx3ioancNIDW5IC0x6c/1sPkONyFkk6sA+NmFj4Imx6Mx
	 //8/o/QcnP3dRkzRGiDKo1YI4DAf6Izm3/MLjTbLaHqqpZwuRI6xEZodecaL/g/ZPn
	 1gNCAP2uyxCv7Cww8J2+sbSp1e2Yed2kdbekqvNq7K2KVbW/mgN45zKmpj02k0XZpz
	 4+zhJGnTrS8MnUMrm+kGg18L4uFz9khUiXt7vXiBxOB8c3uA4a+bJsUrnJsjAnWMWp
	 mODlxdNn2rxAuJ4XbOCEKfmk=
Received: from zn.tnic (pd9530f8c.dip0.t-ipconnect.de [217.83.15.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D03DC40E00C5;
	Sun,  7 Jan 2024 16:09:53 +0000 (UTC)
Date: Sun, 7 Jan 2024 17:09:47 +0100
From: Borislav Petkov <bp@alien8.de>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Johannes Stezenbach <js@sig21.net>, Takashi Iwai <tiwai@suse.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	platform-driver-x86@vger.kernel.org, x86@kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/5] x86: atom-punit/-pmc s2idle device state checks
Message-ID: <20240107160947.GBZZrMy9+60YW7qflX@fat_crate.local>
References: <20240107140310.46512-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240107140310.46512-1-hdegoede@redhat.com>

On Sun, Jan 07, 2024 at 03:03:05PM +0100, Hans de Goede wrote:
> clk and x86/tip maintainers, it is probably the cleanest if this
> entire series is merged through the pdx86 tree (*). Can we have
> your ack for merging patch 1/5 resp. 5/5 through the pdx86 tree ?

for patch 5:

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

> *) Andy recently mentioned that it might be a good idea to move
> some of the arch/x86/platform code to drivers/platform/x86,
> arch/x86/platform/atom/punit_atom_debug.c which is a completely
> standalone driver definitly is a good candidate for this

Moving *all* drivers away from arch/x86/platform/ and to
drivers/platform/x86/ where they really belong sounds like a good idea
to me.

arch/x86/platform should probably be only platform-specific code but not
standalone drivers.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
