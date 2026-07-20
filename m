Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BACF39447C;
	Mon, 20 Jul 2026 03:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518171; cv=none; b=HMoSfHJtnsDKUAmqVkDf7lz6uFrDUQI4YUbclNwzgkq5kqJ0R34hn1vOd8eGIEe0eAVdnip93Oan0Ol+5+9nbf54BI6kN/eq7H/Rjj3PV0DubngdFg9dXhrrDmQW78e5mxYYy+du7j4t4f94yo60Fov60BH676PyvyJatvU0Ock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518171; c=relaxed/simple;
	bh=214XucBSCXglyXLcAXS5vLYlv0vnCQjD4vLJ/PWCYgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ozn5gaFIV51eUjnoehPiCs2MpDOkrcoAm7GAf+UmHqNAEyfosuwPgAvAirKzVcWBFf/VTxNyxzI52fOQW7+fnUThS/jC7Yewkp3hu3ghF+JUTYyQXAkQ9cCShtb0eIGj7e2l/xYtitYXzgNdcuaO1K8iyhJ7wR5d599WCu4B3C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEbgZVZW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEbgZVZW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D199A1F000E9;
	Mon, 20 Jul 2026 03:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784518169;
	bh=JLPjFZyeixXWhuHf9F/Xdw05dLLXUk59vTcZGoKAz1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TEbgZVZWTLIKqARTj/Jpj0t8zss5wiSS5rKMieHWR/wmmKzmCxQ9ZDwQyT/+OQ09p
	 jlUnePSUL8j3htF6r3fgbxSQTn9/+ELBQTf/VRn+fvfpb9DR0GlkwZafoq+4a80B6b
	 Ft0cShKW7eyb+v7hDOKkz4O5JpSWYsyS33VWqLBl9wGz0fT8Tx6h1VHl1wz5BvgMeA
	 bEKs31ruPBY4mr8fYPuP41WPud6VsNx6WP7kOqer96bwkxduYY8SedrWSP008n7Awh
	 Q1LNIoObCEUrohEv8wyEOB+9uZSaHqUoaUSBQbkRcTWGxx32C1e3GAollD1ags/6gX
	 pEfdD0RmiwBNQ==
Date: Mon, 20 Jul 2026 03:29:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Pan Chuang <panchuang@vivo.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Zha Qipeng <qipeng.zha@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Kees Cook <kees@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	"open list:ARM64 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CHROME HARDWARE PLATFORM SUPPORT" <chrome-platform@lists.linux.dev>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: (subset) [PATCH 0/7] platform: Remove redundant error messages
 on IRQ request failure
Message-ID: <al2WEhARVz5mpNGw@google.com>
References: <20260717112103.213017-1-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717112103.213017-1-panchuang@vivo.com>

On Fri, Jul 17, 2026 at 07:20:38PM +0800, Pan Chuang wrote:
> devm_request_threaded_irq() and devm_request_any_context_irq()
> automatically log detailed error messages on failure via
> the devm_request_result() helper, which prints device
> name, IRQ number, handler functions, and error code.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this
> automatic logging.
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[2/7] platform/chrome: Remove redundant dev_err()
      commit: 17376e7311cdec252b61cb1ecec43be61907781b

Thanks!
