Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC49B12E47
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jan 2024 20:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705783942; cv=none; b=n/AcEF/xVywCAmMMW/AEjgJ7jm0I9FC7DKRMiDeRAnmZkIA7dqRXsOIefjqn4SrH4578FlZPWmIMV/gD5/8SgMWXo97/szs+J3dsJVlM/KsMQ5LFUR8h6Ljqt++GN2zfKK3eDSG6XWRerBVHP5W009tjJMiQaiSYN6AI7HlfXcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705783942; c=relaxed/simple;
	bh=dZ8ee3weE0AugY1MEPStTwM1S5lfjOVcWZZLgxn2XVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Gz71dDJjJwhBGKNawnG+Rsah/o8iVIf3I/cWwJIp6ZOQ4M8W1Se0/Uq1Sky28l7dc9txYAjuEuJqHj0s2lRY0QPqIz9qH71qgUl+Ya5CSX5dX8RvUaoip1zcVk3LSxYjNT5Q8HKdASKGUprnoU2CFRocNheZlZ4JaXLI8nM8Ogw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=F/Xuyazg; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="F/Xuyazg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1705783935; x=1706388735; i=w_armin@gmx.de;
	bh=dZ8ee3weE0AugY1MEPStTwM1S5lfjOVcWZZLgxn2XVU=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=F/Xuyazg7th6DYXNpn7MbabRfx+FD+PoCNaOQxkCH98S3CFFy0eWCIJpQj4GOaFN
	 yvXjDRM6ATNuyLK4K4h6BqPDBXS9RzUXRztiNlRjEUrS32JqNs+2c8e6OIhzqhbLl
	 nRjKW66xpA8f/yDzr+gzopP5r3458uZVEelK3d2pf4h9dTqBKYE7R7SkavffCwISd
	 6I+fXXbXQcMQKoltgk7bPu1scycEcQCLS5svjSVKccgn9yx4PnajzK4qjkKWGt+Yh
	 b1CIrshBcnSk18C7D0ijn6zCSb+nghiCJhatXbzAimyndo2bE/IrGsR9UNJsqP3CP
	 f5l7bz/oGBI4hE3mGw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvsEn-1r9d960fPL-00sxIv; Sat, 20
 Jan 2024 21:52:15 +0100
Message-ID: <a8fa0308-0998-48e4-a104-c2b57ee9bd8e@gmx.de>
Date: Sat, 20 Jan 2024 21:52:14 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hp-wmi: info hotkey has no keycode or scancode
To: Dennis Nezic <dennisn@dennisn.mooo.com>,
 platform-driver-x86@vger.kernel.org
References: <ZawX2mquuTCv0tuF@panther>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZawX2mquuTCv0tuF@panther>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1PXbZjZdZd0YkzyG/Y/F+4OUevNy0+gYjCVI23KajcdpYT7ulnE
 OUuLV1cqH6dCrENJHVzF1yv+JMwViYqM4PJ8hlZshLeHe2sek45AWdpnbrRfRC8PnB3iTht
 bCvKPKDSzbLp6pukW3O7lfcO9sWHAGK/hp37h6bdPpLi/6jm//tzrRy0USCU+a9ZhDDibVR
 T6bpe8CIXzDhU7tdV859A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D3OcZ1zrFSA=;hTD1Al/0eLE76wwcEJd+ly/R8pX
 6NkaLcnnP7Yfgzngy/nrYrsH0h6un48rVLCITcJNMp+tNxTH0P3iSkMxw2uUKjMOzrXmehkzw
 KlQXn3OUld4mHMDi/+Y8u8kRNxL45oGhzg4x0RLgFlLfzVOV8fmf2hV63ly5OoxES47cd/0Ng
 aAgBb7sdz7NWQzL25eAbalWw5RCDxPxlcdclcgZemwMHjK9WCBOurMRxI1AX1F9K0lSl4prRY
 ftBXeLbUNX7GBl1LGqYrsNU7eBxxCCBgyfPzbIZKGjO2smON2Exgj+Vdbhg+kCRMPV4eHOlIF
 NNV0H6xF1gRIPlPIniChXYlAez5+VJfw04i6qyyxKAB0Aw67lGhag4na4OiD3DCXsduE7afNY
 AdAv+s3cYo2CT7XYfcOFDLMss7SaKpMnMOVUdp+vVcfcfNF4z/WFSKrovmLQGGbF6/yulQWYS
 UY2vDrNy9H3ysf6bz9MK65S57jGuere9kfs1Y+4y0OY141nEkSHsvVz+tofdIn4k4MWKqiy7A
 XXW8xsDttYPatwxhTA2WA29+eBBVCbykGt7vxSPPTTWz/NHmmICksX3haRtyKvbyvtke62sbP
 zR4XJHNUxCXYQxgsrBGimk5vzKlvDJWVDqs8xO1vPUwhF1OvBte+DRVsNlS5C/xTPlKvGG9vF
 1A3p/zaJjbx62LtuEAvQNjJE0ZWM2NZuHY1hOLpcjb71LiTDesbYx93dKVxrH3Zmx3ZAdReEN
 PObvhSarNSex+qpziCkWkTXPtdnodC2MCkXOh+tV40324dLHipfAHMTOqeqU/uJmA4pPkJucx
 jY9vt4Gshcib7szSNSbTzpbZB3uRDBNV3+8yUmOjQjumPdYOuZla8oOnAtcEKjLy/LDGF1PVX
 pGXZ/vw5MEbxF4vD7/HyhPH2LGf60lFjeFR/sTeBcQk8wVZEpcW+VgGCTaw3V3t6tJ2p7j57G
 VGchwKljrdmekvQPsbAdq05gjRI=

Am 20.01.24 um 19:58 schrieb Dennis Nezic:

> Guys, the "info" illuminated touch-key (hotkey?) on my laptop "doesn't
> work", showkey doesn't report any keycode or scancode. I don't see any
> wmi related error messages from dmesg. All the other illuminated
> "hotkeys" work fine, although confusingly evtest and "libinput
> debug-events" report that they're coming through the event interface
> associated with "AT Translated Set 2 keyboard" instead of "HP WMI
> hotkeys", but hey, as long as I receive them I'm okay :p.
>
> hp-wmi.c does seem to reference it:
>    { KE_KEY, 0x213b,  { KEY_INFO } },
>
> How can I go about troubleshooting this? (I'm using kernel 6.6.8)
>
Hello,

it can be possible that you machine does not use hp-wmi to deliver keycode=
s
to the operating system, but instead emulates a standard keyboard controll=
er.

Can you check with "kacpimon" that events concerning a PNP0C14 device are =
being
received?

Thanks,
Armin Wolf

