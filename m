Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795224986;
	b=g3QuT++lduLWtTH48bjR1f++aFefi3u3MoLFXhQzy3v6r2qxl6kfJBjW5rQwHp85ltNs
	 wI9arw3IEK+Tc7Q8qZCxyiNw6Ysj+RCrWTDaclXPKxIFXSSs2itnTDlNEzcS9ebBQk5ea
	 WvqCCNdmbGBOCh66Q78OSjT4JGUQRHiqOa4CIq2Wp7ss7Np4BTZWCikFHyg7NFb9Ma8Iz
	 jybofL0x5E3KmNL8AB3Sehr0J0rLPtU7IJ4E5Akj5cup9kUXAo4NYwIRrkpEV+NaeE50w
	 +ntR8dd4SRLal8oBEddaCLvyRD9wuW+WgJ+3RGO/iKJOrgM67UjGaqAISdUcSttfQ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795224986;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=nxpO5fwG+Mn4fh6sf6B4w9TOJPDDMQLf/nUrJV1rcTI=;
	b=rwKHMs+1theB0EvbeA0ZT90+lkw6pusoGq/+24s4N0NFa3fXyiJrjq0Hc/3jVjoumVC5
	 4XtwbVQ8MNPaO3n0Oo58ZUBc/U2BXyjq3wrbDoyEn5zlcnc5UmKhUkErV95IYZ1Zw2gRS
	 UZS5pwhatRL8HEEHgwH395vdVWmtEwmzfaoQ/OUL7cBIzg6tyEggw4QHFWO0pCPAyPxHe
	 CYKoxlEVJ8icXjPbu7oT8AMp0Ac5XZvhRX/6jihTZgBwTKLximd1SdzklPS78BObYV1J7
	 QVJ10KstdkJKW2bpJMY4V23dM7fJ0aCIIiFetg4XfQNE2VlAcjaE6T2X55OInulywFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cqdgWb0B;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45AB606A338;
	Sat, 21 Nov 2026 01:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45AB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cqdgWb0B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=nxpO5fwG+Mn4fh6sf6B4w9TOJPDDMQLf/nUrJV1rcTI=; b=cqdgWb0Bq38ZqdL2gtfHgmmH4g
	DXUUweeu+TgT7MpDFGung947/xhFyAqRBgPXVFAxRkmU8pvL1PHUb0i4XbPolY0aZ0makY3l2ZhoU
	8MQgcFdHpxqXw1EQDjvTX5WriLzoHahX7GoM00MYSHcDumu60bjt/YvljRMqBQMPZrTG+XFq8apgD
	MZbApVRfe6E+A2diZjZDOc5N92TIqE9CGYZp0GKSwJnwEcRfHIX6mKTIqsrySYEquY3ANf74LJJVq
	SkazTLoQ58IB7Cg/G3c4RBbICfkDJhrKiWFX4P5z6cc+n3XVSsbnFm645uoNxc0CxsTNc1Jw+4bgO
	mMELa5eQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUa1Q-0000000GeN8-2otV;
	Sat, 21 Nov 2026 01:36:09 +0000
Message-ID: <740cd96a-0815-48d1-9442-9816944ad078@infradead.org>
Date: Fri, 20 Nov 2026 17:36:07 -0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] platform/x86: dell: Make uart-backlight x86 only
To: Brian Mak <bmak@nvidia.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>,
 Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Lyndon Sanche <lsanche@lyndeno.ca>,
 Armin Wolf <W_Armin@gmx.de>, Prasanth Ksr <prasanth.ksr@dell.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-2-bmak@nvidia.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261121000556.173028-2-bmak@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/26 4:05 PM, Brian Mak wrote:
> Make dell-uart-backlight x86 only, as it uses some x86 helpers.
> 
> Signed-off-by: Brian Mak <bmak@nvidia.com>
> ---
>  drivers/platform/x86/dell/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index 9f0016056d7e..4c28d4c008fc 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -188,6 +188,7 @@ config DELL_UART_BACKLIGHT
>  	depends on ACPI_VIDEO
>  	depends on BACKLIGHT_CLASS_DEVICE
>  	depends on SERIAL_DEV_BUS
> +	depends on X86

DELL_UART_BACKLIGHT already depends on
X86_PLATFORM_DEVICES && X86_PLATFORM_DRIVERS_DELL, and
X86_PLATFORM_DEVICES depends on X86, so this should not
be needed.
Have you found a problem that you are trying to solve
with this?

>  	help
>  	  Say Y here if you want to support Dell AIO UART backlight interface.
>  	  The Dell AIO machines released after 2017 come with a UART interface

-- 
~Randy

