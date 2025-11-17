Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4F9246BD8
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2025 10:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763374717; cv=none; b=lgq2n1VeM3vgKkgQy4ihwijzeCivuxRlgZvKBF2m1ow+30krYmy455dY58fCggpQG7c54ZYi1Fh3q+k6pFNfpPiyOoqILz4X1EzejMlAgZSlQuAdP13cPRS5P3IMBRenH5ji0in4p5t1q2CSkkbHsTgwM/FK0dea32KlHjfKgp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763374717; c=relaxed/simple;
	bh=QyS6BL30qh3TIy2KoeEVDD4nfZ7JSIzcxOHHGUGmkgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LTB/g+/i+5cFqS/2RlSOyvoM5QPY8vcwQ21WtKCbcAAjMvrOYbsdUuMmyeyrs9fpDVCKZmRDQAq+tMssRTjGBmKYcLijgx1eLAz9LVEiaJaVU1rsSL52gcTVsEjWxeKDRZMSaRUpwqZtG3bd90UV1hUZdQ9kiCGBCNlM01hmrYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMLZZ12E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMLZZ12E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC96C2BC86;
	Mon, 17 Nov 2025 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763374715;
	bh=QyS6BL30qh3TIy2KoeEVDD4nfZ7JSIzcxOHHGUGmkgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZMLZZ12EYn9E35UUkXNXFTCWGUPHRG60xQi3s7IjRgTCLCJ4APQ/i/blGZxi5Km/1
	 Om/ZGsI7/vZpVzEqYBSWkIaY4/ceuivWvC3vMqCpiObfSNXT6RmRdyPVD25cpQaiSM
	 c6U/ZU6Q0sllbo438cMClXWWiOZkSiK403uaZra30L6RNk+rgsZ5pABH+kV0YdDkPd
	 PNJrF9TO+ZE1R4G+dzLna6cRbJTrbr2GB+6U12OBMDDD4X5wjggb6fRXfymzMs+Ghr
	 nPx9sO3qcAcrq8X/LZpLIkxfvx9cpL015U4aRM9kEVL6twyQetZW2LqhDQTm8Q9kyj
	 aVlwc2V6WxUsQ==
Message-ID: <b32efcf0-9e15-4ece-bf1c-6327b49f6aa5@kernel.org>
Date: Mon, 17 Nov 2025 11:18:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness
 unexpectedly
To: Bugaddr <Bugaddr@protonmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com>
 <1536ce4a-5844-447f-9e86-197c71c6d364@gmx.de>
 <0RyizLnGQaxXLOtK-q6h-mHCTA2ergYBAIS-DkF1MPD9T5nx79rlaKdIOUBRft7Ghpy11OPo2OZM4waIjDbdnv2fnafWBDxWEYL75XZKtUo=@protonmail.com>
 <0b485b76-fb44-44a4-afab-d35fa31043db@gmx.de>
 <UyWxc6DtIYzBAkoHTnMQqR6ZTP_TVtFKEpJ1kFmuTP7jKLXmh5MJxU-qD7zLFosJPBpmpLN6Cl79prEADSrrvBQX4Wi6sltWot-u6i-RigI=@protonmail.com>
 <1854119a-c257-4954-81e0-6aa07538d0c5@gmx.de>
 <43a0661f-f70d-4a02-a89a-9686190ed3de@kernel.org>
 <xEdzYmxBwMOpzb0oiIr1q-SXgVMntKFDOqeoW1Q1wshnw7o-MZjLstwuSkj2Bc6E8DSEIMghxzhAKLbO8FtY4ABQHjYxG8SreVDidptyg2k=@protonmail.com>
 <tPQumZng3Py_n2et4MLRKu_-M-xqv-nzkFCCtnVryRamgSs5020dXq67qWVdrTG6mrFCDTGVDLGvoVvvnJZ_nQszJDQ4PWYCPbflKqGlqNs=@protonmail.com>
 <1szuDGB7r2yubTWirjmsulWXtSkOdmTU2dmYrMbB6Wp2Y2PzBxbJ63OT4BWW_zDRp8QnPhH0VGKG7UyjWzEnFITEo1QjD10ksXtTG44K7Ts=@protonmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <1szuDGB7r2yubTWirjmsulWXtSkOdmTU2dmYrMbB6Wp2Y2PzBxbJ63OT4BWW_zDRp8QnPhH0VGKG7UyjWzEnFITEo1QjD10ksXtTG44K7Ts=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 16-Nov-25 23:14, Bugaddr wrote:
> Hi everyone,
> 
> I've debugged and fixed the annoying Fn+F10 bug on Acer Nitro 5 AN515-58.
> 
> ROOT CAUSE:
> Firmware sends wrong scancode (0xef) which Linux maps to KEY_BRIGHTNESSDOWN instead of keyboard backlight control.
> 
> SOLUTION:
> Install this udev hwdb rule:
> 
> sudo tee /etc/udev/hwdb.d/90-acer-nitro5-an515-58.hwdb > /dev/null << 'EOF'
> # Acer Nitro 5 AN515-58 - Fix Fn+F10 scancode 0xef
> evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pnNitro*AN515-58*
>  KEYBOARD_KEY_ef=reserved
> EOF
> 
> sudo systemd-hwdb update && sudo udevadm trigger --sysname-match="event*"
> 
> TESTED ON:
> - Kernel: 6.17.8-arch1-1
> - Distribution: Arch Linux
> - Desktop: KDE Plasma (Wayland)
> 
> I have blogged my full analysis here: https://bugaddr.tech/posts/2025-11-16-debugging-the-acer-nitro-5-an515-58-fn-f10-keyboard-backlight-bug-on-linux/

Good work on debugging this and nice blogpost.

Question do the brightness up/down hotkeys still work after the hwdb fix ?

As Armin mentioned you really should submit a pull-request to systemd to get
this added to distros so the next Acer Nitro 5 AN515-58 will not be hit by
this issue. See e.g.:

https://github.com/systemd/systemd/pull/39392/commits

which makes some slightly different changes to hwdb.d/60-keyboard.hwdb

Regards,

Hans


