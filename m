Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793554518;
	b=trq0tmMNu7t6SH+u79lzpdGbCgPjDPIEgYr8mLhcfsFmv9MNxTym0nI2Bt1TNWPCthUY
	 IBGy/MJsqAS5r0+15in6j+pQAqPtNMJ3KplyQpFEOoJxjFiEig5qrMnCQWbis1gE9DMkt
	 y9iv2OV3subMCVZiZ46xZ3AX6o7CrVbNNQZiIDin6bAsx1tuJeJw4oMk9envAba9M6Lch
	 gwxjv6Y01H9zb/ekGp7agQ0AfRMQOeWMNldnbiyI5mSUJ9mRfODUdzHONnZMLe9OMTtee
	 GyTDtK7sCbPo4bdOJAQfOUgrHAxwwIooKIofWKGd7IfrrFqq7GgDhulEHhLt17jqipw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793554518;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=IUhwRp2GMv6aqq+gdAO3Dnc/lbHaMi2enel7XlWw9lw=;
	b=tClDI5LKtbHCN5S5QAc+uQ6WD4uolKdUa0BjwSrisdiBaReA2l9yWXfxdUx2S51v0Pje
	 r3zyStLOvmQu6NG0ie1eB6ZshUGPnundFBtSM1k/J/zLmvPSWICLy72vqDBJWcy0kDFdY
	 cT7qxtIETp5+j7SDIGMBoOp6V42c6hC1BITuQnvvOA5dM3uS7Ug/HLdKgW29ZKvIlCQFx
	 BTTeJpQF4XH1q5GwFIaYzHyWjFIRIQ+jXfaki0XPl60UsFyegkXj7KGnBkr5OQ/8i/O8O
	 nxjNLEiV297QehulOgK4Fx3XnT4i5QlqrgZfV51b1DRZNSRXOskTtJvIkKWFMStpZrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=IHbuHhn5;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E75606A325
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 17:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E75606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=IHbuHhn5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793554514; x=1794159314; i=w_armin@gmx.de;
	bh=IUhwRp2GMv6aqq+gdAO3Dnc/lbHaMi2enel7XlWw9lw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IHbuHhn5jv2ZsA9G9JJPzoI+mLpF9yurhT2itHl/kV4clrqYtaQWPmQ8L62V4dpN
	 yv3ON4PrqwxjtTav1Shy5akClpYwZ9kUoeHUAlSb8Zb07GL/5cecE8sUJmxapxJ8I
	 ep/elfmyvcXfYEAp4K/AbuyAhRGgbWdN16rCWw+Mu/m3zy+rQt4pFMxUHh6G5vg/U
	 tnjmqKg5pQs2PiSytVu3fmxZI+dSNnbD5DbailctMkuWSyVGZevO3w2VzaH2Vg5o0
	 +5IABhOQDQcTf7ls7VexvOFVx2/H/C7jp5fNTmsKBFFkuJwU+Rq5q4xbvDF0S2aAB
	 rOX6Rq8l2buefXAzxQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYeR1-1x0d8508x9-00ThTV; Sun, 01
 Nov 2026 18:35:14 +0100
Message-ID: <875e4874-17bb-4c7d-831d-c0a26e6094f0@gmx.de>
Date: Sun, 1 Nov 2026 18:35:13 +0100
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
Subject: Re: [INFO] Gigabyte B650 EAGLE AX F38: RAM RGB via firmware WMI SMBus
To: SpinGiantCRM <chasemarshall009@gmail.com>, linux@weissschuh.net
Cc: platform-driver-x86@vger.kernel.org
References: <CAGinciUnqiFDpth40z4Kp8cDaL=b9i8HyEbOPezMoZ+uMW98eQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAGinciUnqiFDpth40z4Kp8cDaL=b9i8HyEbOPezMoZ+uMW98eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:pnRFN3PJtzTITUWdPrY/5dWIMXxvqT4XFIOOKNlwG7WhaQcwngB
 9CPJhXgHkupfNAzVR6G6OjoNT+G86A3pLd8pAwcP3derXm+VvV0M1XNnUVeXhbeelnU5qqp
 3IFoNOtyYkGQpFdNZb3WSUqytndoYg6ZA5xx9IHstDoaj5Iw+JvNbVouy/4lqZwt8eNcArd
 5FvQvMmBCS0WFSJ0OyOxw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RO0ezm7/Ewg=;F2WUxFG2eurr8ZSrB6iFpXausY1
 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

Am 17.10.26 um 13:32 schrieb SpinGiantCRM:

> Hi,
>
> Sharing some board-specific findings in case they are useful for Gigabyte
> WMI support. I wanted to control my RAM RGB on Linux and used OpenAI Codex
> to help investigate.
>
> System:
> - Gigabyte B650 EAGLE AX, BIOS F38 (16 January 2026).
> - G.Skill Trident Z5 Neo RGB, 2x16 GiB DDR5-6000 CL36. SMBIOS reports
>    F5-6000J3636F16G; the full retail kit suffix is unconfirmed.
> - CachyOS KDE Wayland, kernel 7.2.10-1-cachyos-bore; OpenRGB 1.0-2.1.
>
> The AMD SMBus PCI function (1022:790b) has no bound driver despite
> i2c_piix4 being loaded. The kernel logs an ACPI resource conflict between
> the native 0x0B00-0x0B08 range and \GSA1.SMBI at 0x0B00-0x0B0F. There is
> no native PIIX4 adapter in the I2C inventory.
>
> The useful result was reaching both RAM lighting controllers through the
> BIOS's existing WMI interface while leaving ACPI enforcement intact:
>
> - GUID DEADBEEF-2001-0000-00A0-C90629100000, instance 0, bus selector 2.
> - Method 0x61 returned SMBus base 0x0B00. Methods 0x69, 0x68 and 0x67
>    handled register-pointer selection, byte-data reads and byte-data writes.
> - Controllers at 7-bit addresses 0x71 and 0x73 both returned ENE signatures
>    and firmware name AUDA0-E6K5-0101, with eight logical LEDs each.
> - An experimental temporary kernel helper applied dim cyan for 30 seconds,
>    then restored the original palettes and rainbow mode. I personally saw
>    both sticks turn cyan and return to rainbow. The helper reported matching
>    readback for both the test and restoration.
> - A later requested off command also worked on both sticks, with matching
>    readback. The temporary helpers unloaded afterwards.

Interesting, can you share the output of acpidump?

Thanks,
Armin Wolf

> The helper policies excluded SPD transactions, ENE address remapping and
> persistent firmware saves. No ACPI relaxation was used. ENE register-pointer
> selection writes were used, so this was not a write-free investigation.
>
> This is an observation from one board/BIOS, not a claimed upstream kernel
> regression or a production driver. It was not retested on a vanilla kernel.
> The external helpers tainted the test boot. The existing gigabyte-wmi driver
> is bound to this firmware GUID; the helper used the legacy GUID-based API,
> so driver ownership and cross-client locking need review before any general
> implementation. The firmware mutex covers individual SMBus calls, not the
> whole ENE pointer-selection/data sequence.
>
> AI disclosure: Codex generated the diagnostic helper and wrapper code and
> helped analyse the firmware and draft this message. I approved the tests
> and reported the visible results. The logs are helper instrumentation, not
> an independent bus capture, and I am not claiming manual review of all the
> generated code. No patch or helper binary is attached.
>
> Recorded results and the observed firmware interface details are attached.
> I'm sharing the findings for anyone who finds them useful.
>
> Assisted-by: LLM
