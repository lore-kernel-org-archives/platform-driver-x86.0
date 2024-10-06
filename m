Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A99156997;
	Sun,  6 Oct 2024 08:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728203885; cv=none; b=gs4cS1GzuIMItwqNiW4rPLzKow9nVlUpJ9/75f/IqGdsHOUlM+xjmyDzFwav101O9cPyk2Xd9sxTmGLV7nXgxyfuT3hEHpQZtOUx7sdJkioGAJnE78R3lynmslM1vuCQL9LqifZbthogI02pTS8UU4s+j8rl1Piyqv0yx8wnqFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728203885; c=relaxed/simple;
	bh=vAUzClAZZRruqQFwLmVxUaCwYeQTOQ2JSyzAxQvZ91w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sO3XCFQhbYt8WWjM38Os0ez16TY7rBhQaesmb0jJiKLkvoSGhu8tepyVM7RrCHKpvPiQgRCchStk4Bosgv7H7toI+PVxhg73lvxlf4p+uB76HAoLmiXGpKM+HJzoKW3lDBLmoSZQq3L+542UhjMAHh7Oum+dh/ENZhAcJxH/734=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iEzyNvpi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iEzyNvpi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5632DC4CEC5;
	Sun,  6 Oct 2024 08:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728203884;
	bh=vAUzClAZZRruqQFwLmVxUaCwYeQTOQ2JSyzAxQvZ91w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEzyNvpiavQalYighhMfRCMWF/xOVVuk42ieIZ2EFpSMkbvZwLP6jezhoAxJfz4+f
	 jXyPE3dM8qWw+VEGhzAJiNfJf8pzjOoo96Z+jACu0SowqWkKSbT+PNnqzJe4Msj0Xo
	 G3wnyqUkClsy21MAoBFxNmO/v6ziG/0DoGw+xVG0=
Date: Sun, 6 Oct 2024 10:38:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Zhang Ning <zhangn1985@outlook.com>
Subject: Re: [PATCH v2 1/4] mfd: intel_soc_pmic_bxtwc: Use IRQ domain for USB
 Type-C device
Message-ID: <2024100653-map-unequal-d687@gregkh>
References: <20241005193029.1929139-1-andriy.shevchenko@linux.intel.com>
 <20241005193029.1929139-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005193029.1929139-2-andriy.shevchenko@linux.intel.com>

On Sat, Oct 05, 2024 at 10:27:04PM +0300, Andy Shevchenko wrote:
> While design wise the idea of converting the driver to use
> the hierarchy of the IRQ chips is correct, the implementation
> has (inherited) flaws. This was unveiled when platform_get_irq()
> had started WARN() on IRQ 0 that is supposed to be a Linux
> IRQ number (also known as vIRQ).
> 
> Rework the driver to respect IRQ domain when creating each MFD
> device separately, as the domain is not the same for all of them.
> 
> Fixes: 9c6235c86332 ("mfd: intel_soc_pmic_bxtwc: Add bxt_wcove_usbc device")
> Fixes: d2061f9cc32d ("usb: typec: add driver for Intel Whiskey Cove PMIC USB Type-C PHY")
> Fixes: 57129044f504 ("mfd: intel_soc_pmic_bxtwc: Use chained IRQs for second level IRQ chips")
> Reported-by: Zhang Ning <zhangn1985@outlook.com>
> Closes: https://lore.kernel.org/r/TY2PR01MB3322FEDCDC048B7D3794F922CDBA2@TY2PR01MB3322.jpnprd01.prod.outlook.com
> Tested-by: Zhang Ning <zhangn1985@outlook.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
