Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A973C65FD;
	Tue, 15 Sep 2026 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478371; cv=none; b=amb9q8MVZthYw7OWLeQkORhgOis09rXiQgh3DUT9J09VdmJRFOQ2MbJVta/6lk5q8/zY9ITGpdf+Lqdrz6Su2oqCznTPazT8Rz6G8UPyltWqagunFZ1JsBx5UO2onYx8FX81GuJJMGcSmHiLhGmp4Yc2jOa8iVBNXGvJ8mDk3x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478371; c=relaxed/simple;
	bh=SVuepb5qfMblq6RP1L3XJFZ0Q7e+JMWIKTiRz+aUxrk=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MVRn2XkIPdozocdamHcToqDq3kYjouWsMf86oQvduwjmK7NnlklCfu6WtPzM99p2NOhH8OL+uru7NOwtowsRrq7Uh57HerXCwqZTQXzZHHw1PKeA2qP5mxm3vNAoVt2KmUvjjlBwPQw47CHn287lsOiMiDRSBiXoYPOqCQ/HJXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+V7NSP3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+V7NSP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789478371; x=1821014371;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=SVuepb5qfMblq6RP1L3XJFZ0Q7e+JMWIKTiRz+aUxrk=;
  b=d+V7NSP3/wSUvxqOO5Q19lvGhepJmhsLDKcLGQsxN6gyE6kW/aL+W0NZ
   oS2tIB+8eG5l8+CCcFUL0ut4oVNYxo6TG166gMlM2cWFZIApn+eNxvG3p
   VDQ9272CHbdU2hm6de8h+bg8InE959w2HCz4wD06khiM/WcNgOxc5vgr1
   gDHEnhF+u0lBEMyj/k5nxuNiWxTnJOQj4hnTo8/DclMJ1KXbHvuhQqEt2
   FrzFpAMflGlZhO2zihqOX2jfh9PU72ZI+qGPGH7EASLotHEPb2wqUfdPx
   FFFYSW6ii0oBuWQY4aOLd+HvmQgWumkisVEfAlvANl5jzL1b4EBCV6wOa
   w==;
X-CSE-ConnectionGUID: ZwipdzF+RBGrdKfODHEALA==
X-CSE-MsgGUID: TLj7rUBhSsSBrvixtgCUZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100164647"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100164647"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:19:30 -0700
X-CSE-ConnectionGUID: 0gcTBJTdTCy+dghC/CXPvQ==
X-CSE-MsgGUID: WxWomO74QP65TaQ+mWPnqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269734764"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:19:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Pengyu Luo <mitltlatltl@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Vadim Pasternak <vadimp@nvidia.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Zha Qipeng <qipeng.zha@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, Kees Cook <kees@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Phil Elwell <phil@raspberrypi.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Pan Chuang <panchuang@vivo.com>
In-Reply-To: <20260717112103.213017-1-panchuang@vivo.com>
References: <20260717112103.213017-1-panchuang@vivo.com>
Subject: Re: [PATCH 0/7] platform: Remove redundant error messages on IRQ
 request failure
Message-Id: <178947835401.32141.4790012593418715097.b4-ty@b4>
Date: Tue, 15 Sep 2026 16:19:14 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 17 Jul 2026 19:20:38 +0800, Pan Chuang wrote:

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

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/7] platform: arm64: Remove redundant dev_err_probe()
      commit: d147ddd21884defe37051f2ad1101fb42e4767fd
[2/7] platform/chrome: Remove redundant dev_err()
      (no commit info)
[3/7] platform: cznic: turris-omnia-mcu: Remove redundant dev_err_probe()
      (no commit info)
[4/7] platform: goldfish: pipe: Remove redundant dev_err()
      (no commit info)
[5/7] platform/mellanox: Remove redundant dev_err()
      commit: cf613b192c76e887857ce592ce535799c21034ff
[6/7] platform/raspberrypi: Remove redundant dev_err()
      (no commit info)
[7/7] platform/x86: Remove redundant dev_err()/dev_err_probe()
      commit: 6047fcfc8971e0c01bdc840f661498b044dd8916

--
 i.

