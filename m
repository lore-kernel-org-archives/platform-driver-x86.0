Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB5F1A9B46
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Mar 2025 07:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741245373; cv=none; b=eNqlS6OWX9EmzxEcYldpqqG7rfiTKgikmCvvgrevfn8dPxEbxhVcctZUpSXAMDtaP7S1wi2CNpY4Nn6D5iiYVeseN62dz7PPFVXqyDKVKe78exiMrQrvoxJvrYz/tV++H0dpFMEUDDOeC/BwxWqxxjWBblxnGLNdRPXU9BSJgFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741245373; c=relaxed/simple;
	bh=wGfAs74KCaUlJxPiFDfFiHceEtknho+iBeYZPc/m/SM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ey7un9mIVgE32Ipv/SX8fYi5e5FLs6K8M5zW1YtaLHiOMOxvsBPCJ9R34zVOKWGonmFcbORCtiJJ+kzypnAbv6+a82CN+3Y6tpjb0/RSUMDh8PFXT9IQbNCu15dKGq8JdQV8QsZhcE13KPih1NdJXpdletdxAkfCOon8uFY6V2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id cef8990e-fa5a-11ef-8397-005056bdd08f;
	Thu, 06 Mar 2025 09:15:42 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 6 Mar 2025 09:15:39 +0200
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	David E Box <david.e.box@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v9 5/6] net: stmmac: configure SerDes according
 to the interface mode
Message-ID: <Z8lLm9Ze9VAx3cE_@surfacebook.localdomain>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
 <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>

Thu, Feb 27, 2025 at 08:15:21PM +0800, Choong Yong Liang kirjoitti:
> Intel platform will configure the SerDes through PMC API based on the
> provided interface mode.

> This patch adds several new functions below:-
> - intel_tsn_lane_is_available(): This new function reads FIA lane
>   ownership registers and common lane registers through IPC commands
>   to know which lane the mGbE port is assigned to.
> - intel_mac_finish(): To configure the SerDes based on the assigned
>   lane and latest interface mode, it sends IPC command to the PMC through
>   PMC driver/API. The PMC acts as a proxy for R/W on behalf of the driver.
> - intel_set_reg_access(): Set the register access to the available TSN
>   interface.

...

> config DWMAC_INTEL

>  	default X86
>  	depends on X86 && STMMAC_ETH && PCI
>  	depends on COMMON_CLK
> +	depends on ACPI

Stray and unexplained change. Please, fix it. We don't need the dependencies
which are not realised in the compile time.

-- 
With Best Regards,
Andy Shevchenko


