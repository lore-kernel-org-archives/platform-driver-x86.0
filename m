Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E6628C2CE
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 May 2025 11:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134103; cv=none; b=FpRVLYGiOacFdJOO3d1qDGksI9ocU3VFchMSJCF/ZwXH57DQy5zgRhwzegcV+hx+9EJPKClLSGAyMIgMZTh6UnbduEBPppuiCVhnJ2OssmOSGMq3OXSwx8QS4e/6wgsdMS8pd5lVS71UFTPCGpPOLaG52uQLdEQjtvpUfUKwXns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134103; c=relaxed/simple;
	bh=Pig+4/9/fm6cJ73Wi5yuTpEZVO3+fdaLqlUnJfxm6EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEpwG1X19pUSo0OjuW3Bf3Hi0pbHqqIojlpWl1td3oSta3OSwmgml0i1rtqsJ73ang9VN2W8/3A1UIDfaG0xaIJabOZCeXQBKjo1zzNERDPKIYWG49bm0PXdDCWH2tlCIgn1OT/zMAmCzNsqrMpp+uVWvoq2rQvW/AJW4Szqyug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=In/vGvDA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="In/vGvDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1747134092;
	bh=Pig+4/9/fm6cJ73Wi5yuTpEZVO3+fdaLqlUnJfxm6EM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=In/vGvDAsCzEeqt7ruBnVxw0fiW1i1jQZaiBmQ2lyDJJDX38gED+EvA2eAO6Q70R+
	 RWDqyADkFx3EfAnH7bh2ckkCDsLpO91zoNVn+za1OptfcR3Dm9Bbh/2FSn661T66gK
	 uSOk1u5uwDQZwtIge6y18X0p+ok7+v+b9Oay6Yuo=
Date: Tue, 13 May 2025 13:01:31 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jelle van der Waa <jvanderw@redhat.com>
Cc: Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Jelle van der Waa <jvanderwaa@redhat.com>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 1/1] platform/x86: ideapad: Expose charge_types
Message-ID: <b937d9e3-3b07-43d9-8d64-c08af6579c65@t-8ch.de>
References: <20250513083816.461771-1-jvanderw@redhat.com>
 <20250513083816.461771-2-jvanderw@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513083816.461771-2-jvanderw@redhat.com>

Hi Jelle,

On 2025-05-13 10:38:14+0200, Jelle van der Waa wrote:
> From: Jelle van der Waa <jvanderwaa@redhat.com>
> 
> Some Ideapad models support a battery conservation mode which limits the
> battery charge threshold for longer battery longevity. This is currently
> exposed via a custom conservation_mode attribute in sysfs.
> 
> The newly introduced charge_types sysfs attribute is a standardized
> replacement for laptops with a fixed end charge threshold. Setting it to
> `Long Life` would enable battery conservation mode. The standardized
> user space API would allow applications such as UPower to detect laptops
> which support this battery longevity mode and set it.
> 
> Tested on an Lenovo ideapad U330p.
> 
> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>

The code looks good, so:

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>

Some process notes:

* Your mail is coming from a different address than the Signed-off-by
* A changelog is missing from v2.
* You can replace the cover letter with an auxiliary block of text after
  the trailers in your patch.

> ---
>  .../obsolete/sysfs-platform-ideapad-laptop    |   8 ++
>  .../ABI/testing/sysfs-platform-ideapad-laptop |   9 --
>  drivers/platform/x86/Kconfig                  |   1 +
>  drivers/platform/x86/ideapad-laptop.c         | 110 +++++++++++++++++-
>  4 files changed, 116 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/ABI/obsolete/sysfs-platform-ideapad-laptop

<snip>
