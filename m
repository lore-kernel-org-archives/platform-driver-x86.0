Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222112;
	b=YrBGg2XLS4DVxlsG+je8VR5+fan3RPBGGmi7gQSjrEudtJlU0JjsPpkooArKoIO8v9Wm
	 z6xdC7UNeAiXK6G67PVuSSMNndxv4HyI+vRyJeNY4CtUMFvej+l+JPVtZzVK37Bm0FTgd
	 hMO+mt2vTOBq17CU8Shigg6qMQtGetJIkgojE5Qv1Xk3Lc2wJdA+NbF0dMVHHQ64iJU4R
	 OIUP0D+no0fIBT57eHY3B6jOclj46MFrwvKmJpy1KjIpLvUbtIi84olPFeci01H5NvmdD
	 UYPDxmnTcUqEsxiRrt3jhPy0dgZAIjkv/xUZUYRhGz11jwi7SgCyNjufgNUl0IdnVHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222112;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=xZCuNtiE/RvgUGlq9aWOLBkXGZW67SdG7iTq4KVsRT0=;
	b=36Home8HvwI772l8Tpuy3joqqGNuJPNRE/JlWZzHmI1Ns+DSbEsdEERhxTm4vGkc8uyA
	 2HIgFwHEPU84LWp5sVYZ15WGZ0AFXY7kInjb9REs44u2iMcV0nfhp24jReW0u/WhLH3h+
	 BYB6vLTGTJimnx97UX2eU8XKw6bbpJzIpVGlb+FwAVgRhfR1Tv4CH2ciwrfP9/x65rMMt
	 L3s4ZWreetZTGNYdGby1P3chCXc13+MVJaHI7l9ujXBikvjO5YnER3wbBBlX+yiZmQAuY
	 MweIDaT7UVWv1PTy428KrEWzevnsGXXa9SLanxkF7S9N1ySnZK73bgDNKLVh3YqrtuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CgRXbhxB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD4760A2637;
	Sat, 21 Nov 2026 00:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CgRXbhxB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58E71F01570;
	Sat, 21 Nov 2026 00:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795222111;
	bh=xZCuNtiE/RvgUGlq9aWOLBkXGZW67SdG7iTq4KVsRT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CgRXbhxBV2XXdfOFv+augDdnz8IFkIp4M0qr+nj8Q977ELdnUdYlZHQqy14fOmZdp
	 z5ZY8Qm3ykWQ/aj35iKD/uRYKmojimDEI4U4lzUi8pPFPczhK2Q3FL8iYFtjDCIisH
	 qpUQcKZQabnPBiijcBLsbVFiM5cuvFuvKUNWVLUoU9ASxT59RttAwv3bj8MzoX/Epn
	 fJatvT9wtsjNygQno791zULziz20T8NLC9vqvvABSYlnsUZBBX9MAa7hjXcIwqHgEZ
	 pjddEpZE+Qs49ukqQy8eXy0SgGX+dxZO4cqOQSgNlwBCbqt42Y0luK4wuJLqJ9QewJ
	 /O2q1vbscoLMw==
Received: by pali.im (Postfix)
	id C8C114A0; Sat, 21 Nov 2026 01:48:28 +0100 (CET)
Date: Sat, 21 Nov 2026 01:48:28 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Brian Mak <bmak@nvidia.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>, Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be
 arch-independent
Message-ID: <20261121004828.rk2k2cq4id2ixkal@pali>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-5-bmak@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121000556.173028-5-bmak@nvidia.com>
User-Agent: NeoMutt/20180716

On Friday 20 November 2026 16:05:50 Brian Mak wrote:
> CONFIG_DELL_LAPTOP is currently not available on ARM64, due to a
> dependency on CONFIG_SERIO_I8042. This dependency is actually not
> necessary, as there is a fallback. Make it optional.

i8042 is used for controlling touchpad LED and for receiving rfkill
events when the dell-rbtn is not supported on the particular machine.

Touchpad led is available on more Vostro and Inspirion machines and
there is no fallback or detection of i8042 at all. Even there is no
error checking.

And for receiving rfkill events it is same situation.

So the dell-laptop driver expects that the SERIO_I8042 is enabled and
compiled in.

If none of these functionality is available on arm64 HW, then it makes
sense to make the SERIO_I8042 only for x86. And then in the dell-laptop
driver marking the x86 specific dependency via ifdefs. Which allows to
compile driver on arm64 without those specific functionalities.

> Signed-off-by: Brian Mak <bmak@nvidia.com>
> ---
>  drivers/platform/dell/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/dell/Kconfig b/drivers/platform/dell/Kconfig
> index 7030f817b6af..0223e2373508 100644
> --- a/drivers/platform/dell/Kconfig
> +++ b/drivers/platform/dell/Kconfig
> @@ -77,7 +77,7 @@ config DELL_LAPTOP
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
>  	depends on RFKILL || RFKILL = n
>  	depends on DELL_WMI || DELL_WMI = n
> -	depends on SERIO_I8042
> +	depends on SERIO_I8042 || SERIO_I8042 = n
>  	depends on DELL_SMBIOS
>  	select POWER_SUPPLY
>  	select LEDS_CLASS
> -- 
> 2.53.0
> 
