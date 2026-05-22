Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BDA33A6F2
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 21:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779486597; cv=none; b=gCALQAc78adgXKCuGXsKvO8WM6OesOpWCVmgZsuztC6N1432teFXrnp8TpJSrUD7vF1gm53n6s8oHiKgILW5uA992Java0VnBoYxZukH0t2Xoz7y+dcn7LEpQ/IMqT0SCbMzlmxFMJE4hXkwGKJ/rWXJhrAIJpZaS7gVXTExO8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779486597; c=relaxed/simple;
	bh=4jO1hVzJcG5Y7H0/5thKB47LmscYlvqZvtWsmWnXFxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/4+tFDDZtg7xu9OfywgwB2dYEuCgpe3McSkt39VMsItdpkxXlHx6pU8TBIASHXWoPTDiOn8dPGonox0cFyRaA7Qjmdr/cwzAAWmojjixS89mgZ47Wr7c2CXXGBJ1WOQnULLr6j3vSz1g3AhSKDytOpREKk1isrI1HmLbOSSxe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=IHGwkd8S; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="IHGwkd8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779486580; x=1780091380; i=w_armin@gmx.de;
	bh=MDn7v65pQ3dmZTzdYPybSOxkrJgl4BSjBGl0XbvXQR0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IHGwkd8Svb8ybMGps3Mv4AjtYRf4WGs8Z/n1JK6MvWuduzWrpgUa3YnAzONVDdiJ
	 SEHDiC7bdkqB53dZmUXXapovRT6ssOJA/r20oQ1F13ffR2H8Oiq5R873ODvHUMWm2
	 /wFEjzT0hd76olhdBmMEXqjA9YwUScr9xbgGYhKQ7XZIc1cofVug9f2c1hDODs8aS
	 9MwUDs23XWOl0kp9GPpvyGyeMFiaqd7cfPZrKq1kSsPxJeENm0b9+wOFqsB8/FlFg
	 ob+9NUF6k/rroowczzUTrtTWRX1+bpqj0gq8K5MXDUpQ88zZCBDuCbxTF0PVLOCu1
	 G4iBLDtsaJkafmlV7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Msq6C-1xJKEF3ZcW-00vTuL; Fri, 22
 May 2026 23:49:39 +0200
Message-ID: <7f5dc54c-d648-4cc6-8679-a692b3519d7b@gmx.de>
Date: Fri, 22 May 2026 23:49:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unclaimed LEN0100 / LEN0111 / LEN0112 ACPI devices on ThinkPad X1
 Carbon Gen 13
To: big.block0203@fastmail.com, platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca, ibm-acpi-devel@lists.sourceforge.net
References: <260665ef-2862-4331-b61d-aacf1297ac90@app.fastmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <260665ef-2862-4331-b61d-aacf1297ac90@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:K4Q2cWYdCJQ8iYFb/5YGnX32RSjBqj3zVng9msWSW7VxJF+QV/S
 gnULMnrxWpSVBj68MvOIX016tIxHIxPxr4vxYTsHRd/ibD3iDnjFGlcKqIrZ++j9D/X5qht
 uMnvzRT1n/3Fg2za06wQiqZ85qL2HlGq78UtFxOM+9F+vU0F7vI9u+QGvi0l7F+RmM3I2vs
 GjKeU1StevxXfqeg3K8hg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lziP8zUCc4M=;6lgPYaVtEmUJt1EpSrpkRgNwFf4
 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
 wgy29xyT/l1JThe3mo=

Am 15.05.26 um 21:04 schrieb big.block0203@fastmail.com:

> Hi,
>
> On a ThinkPad X1 Carbon Gen 13 (Intel Core Ultra 7 258V / Lunar Lake)
> running kernel 7.0.6-200.fc44.x86_64, three Lenovo-private ACPI
> devices under the EC are declared present-and-functional (_STA = 0xf)
> but have no driver bound and no public identification I could find:
>
>      LEN0100:00  status=15  path=\_SB_.PC00.LPCB.EC__.ITSD
>      LEN0111:00  status=15  path=\_SB_.PC00.LPCB.EC__.LSSD
>      LEN0112:00  status=15  path=\_SB_.PC00.LPCB.EC__.LISD
>
> For context, the full LEN* / INT33D3 picture on this system:
>
>      LEN0071:00  status=?   driver=i8042 kbd   TrackPoint keyboard
>      LEN009F:00  status=0   driver=NONE        disabled by firmware
>      LEN0100:00  status=15  driver=NONE        <-- asking about
>      LEN0111:00  status=15  driver=NONE        <-- asking about
>      LEN0112:00  status=15  driver=NONE        <-- asking about
>      LEN0130:00  status=15  driver=NONE        Fn / Function Keys
>                                                per Lenovo Windows name
>      LEN0140:00  status=0   driver=NONE        disabled by firmware
>      LEN0268:00  status=15  driver=NONE        ThinkPad HKEY; matched
>                                                by thinkpad_acpi via the
>                                                ACPI bus, hence no
>                                                physical_node/driver link
>      LEN0310:00  status=?   driver=i8042 aux   TrackPoint pointing dev
>      INT33D3:00  status=15  driver=NONE        _cid PNP0C60, laptop/
>                                                slate mode indicator
>
> driver= column is from physical_node/driver. thinkpad_acpi (loaded and
> functional on this system, hotkeys work) doesn't create a platform
> binding for LEN0268, so it shows NONE there.
>
> Context for the question:
>
>    * The laptop has what appears to be an ambient light sensor element
>      in the top bezel next to the camera. No ACPI0008 device exists
>      anywhere in the namespace, and /sys/bus/iio/devices/ is empty.
>    * No INT3472 / IPU6 sensor-power stack on this SKU; the camera is
>      a UVC device on USB (Chicony 04f2:b7e0, driver uvcvideo).
>    * Earlier feedback from Jonathan Cameron on linux-iio confirmed
>      that INT33D3's _cid PNP0C60 makes it the laptop/slate mode
>      indicator, not an ALS, so the missing-ALS question redirected
>      here.
>    * The ACPI object names ITSD, LSSD, LISD are suggestive (Intel
>      Thermal Sensor Descriptor? Lid/Light Sensor? Lid State Detect?)
>      but I don't want to guess from names alone. The same
>      LEN0100/0111 IDs appear in ALSA-info dumps on older ThinkPads
>      (X1 Carbon Gen 8, T14 Gen 1, T15 Gen 1), so they aren't new to
>      this generation.
>
> Are any of LEN0100, LEN0111, or LEN0112 recognised IDs internally?
> In particular, is one of them an ambient light sensor or related
> device that should be bridged into IIO, or are they all internal EC
> bookkeeping that userspace isn't expected to see?
>
> Thanks,
> bigblock

Hi,

to me it seems that said devices only exist to pull-in some lenovo-specific
software, as they do not have any hardware attached to them.

Thanks,
Armin Wolf


