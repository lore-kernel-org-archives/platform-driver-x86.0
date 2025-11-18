Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A60D353884;
	Tue, 18 Nov 2025 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465489; cv=none; b=ldSEnycqAZtYiXcRwxqgxhJYmvdwtakIutj2Fy7KtxlMLoqn3KnG+6Z8zdrYGhmu+VVxs/IrkiWtBC8gANoEXUhHK0vMaBP/PMfHYsDAsoJl0HRiqcNyAiMHmXkBiHPM00v8hKgYg6vv8KM4OWgZFGAv8GHMqMwzDYa4KUT8yLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465489; c=relaxed/simple;
	bh=WWjlBi8y9vGSkYeBu8yY9ffltKapgzgGzI1AooLGp48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QfI2True4x/e4DPnG7zlJg+MGXWjX25OJfSPfLT+GVSPrj6TBU6adUmFvdmo+6Xf4dRbJNLcEfuII/fGD1Kga2NUIplUYvg/Pusr3kA7znSzYOCRXZq7A8R5ysRame/ra3yG4guw1P+d3vXfzu6lfOOgJoe562FXhftobUGLlnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uNDggNZt; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uNDggNZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763465484; x=1764070284; i=w_armin@gmx.de;
	bh=t9NyJe5WoU8lCbOacU27as4WZb5fuoYlNfVdXGUakKo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uNDggNZtJlXcYqpO8VejAE21ooPW1JQM/r4Pmh3EqYs/7qC+lB5bhy+zm4FuQeDs
	 c2QH2hNgB47iQhsGA5uCob2hztGtQ24T6FpPex+cgcL/sUqc40QKwFZV2rD0xuoqP
	 wanab2DeVDWBX/S44vGKv0RAlXU0RAU/fo229b9MHjGPOhN46CpsLDL6NfZhWph6A
	 k4kzEsaYmC71GotZ9xglz6lP0sb7I8oL0gZ6a3DgFxKTVZRgFXdvVppUrFGkPgfT0
	 4m+775glzN3avAPYUDbJaXQmcMxjyPnulBjGkaGQozcn/kHg+hiKs1KNBgAHKzKCB
	 lAn8ohsAwRXYlOMpjg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.146]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3lc9-1vM98q3uTr-005gLt; Tue, 18
 Nov 2025 12:31:24 +0100
Message-ID: <1ce9d218-d5cd-4821-b224-b52e314b7027@gmx.de>
Date: Tue, 18 Nov 2025 12:31:20 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Start of Upstream Support for TUXEDO NB02 devices
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251117132530.32460-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:9wDRHdRsksJi/Yuy9a4WqQpi5D6oh0zswsdz7biZ38eakhPxC8f
 cBHMwR2un8icTiLpW/0B2JGv/QfcdTONcDbxwKFo4OqQUCV3P0Z70ZlaYqc0Z18uy0/aAOb
 Q9D5Ipk/ajDPyueDZzzg+zK0qe4/TywpAk61mCkAhmwsPC6NCmgnna4p13A7DiLubbO6bvn
 TTg+CPftqOG6A1DXaQXeQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RlVjHyd3Cpo=;ZGXMuCtCByPSNO4paojPRUrDXcf
 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

Am 17.11.25 um 14:23 schrieb Werner Sembach:

> With the Uniwill driver from Armin now accepted I want to push the first
> big addon to it that I worked on in parallel.
>
> First this adds all current Tuxedo devices to use at least the input part
> of the new driver.
>
> Second it adds a new feature for cTGP control on Uniwill devices with
> NVIDIA GPUs and enables that on the TUXEDO devices.
>
> I have not yet enabled the other features in this driver for TUXEDO devices
> as they either don't apply (Uniwill did a line with Intel that behaves a
> little different to the rest of their ECs and that line is what the features
> Armin added are based on) or are, as of now, untested.
>
> There are plenty more features currently implemented in the out of tree
> tuxedo-drivers dkms package that I plan to port over one by one, but as
> always: No ETA given.

Very nice, i think that especially the cTGP control feature will be very popular with users.
I am also currently working to add fan table (aka "universal fan control"), PL1/PL2 power limit
and platform profile support to the driver, so you might be able to reuse some of that
functionality for your devices.

I think that we can merge the first two patches in the near future, but the remaining ones
dealing with the DMI table and cTGP support need some more work. What kind of control does
your software (Tuxedo control center) need over the cTGP values? I am asking because Intel
devices have fixed cTGP values for each platform profile. If your software does something
similar, then maybe we can integrate this into the platform profile mechanism.

Thanks,
Armin Wolf

>
> Werner Sembach (6):
>    platform/x86/uniwill: Add TUXEDO devices
>    platform/x86/uniwill: Handle more WMI events required for TUXEDO
>      devices
>    platform/x86/uniwill: Implement cTGP setting
>    platform/x86/uniwill: Make uniwill_dmi_table accessible in probe
>    platform/x86/uniwill: Run callbacks of uniwill_dmi_table
>    platform/x86/uniwill: Set cTGP support based on EC for TUXEDO IBP Gen7
>      MK1
>
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 546 ++++++++++++++++++--
>   drivers/platform/x86/uniwill/uniwill-wmi.h  |   2 +
>   2 files changed, 502 insertions(+), 46 deletions(-)
>
