Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB95252912
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 20:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745957532; cv=none; b=fET2HHQ4uZ0YlwxOYMFXKXRQftYjBGg8c/FmmpbgCi8/sPEp3GRx5m7W2ieDu4cTwHO/0zCHpgp5BTKw1n/Q50/fAdu9PHWsVJdHyT3F1aOMARqmqrvib4n1YXJh/8rv4GPL8kGlakde2qP8geJtWJoU8kmO6eAg1Af6lt1uLHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745957532; c=relaxed/simple;
	bh=xj5XU8sYPGD84j0jqneTPtP0NmiFZ9+JyyzWk7jzS5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BT7akCCKO/hmLCwg++qVmKrMU95mEaVwbYjCG7kzguoM+2qWvbWp+0OdWE3DuFPjcB+K3D8XslVUBc43S2W31dJNfzl5eSBIHXRuZDoNP59Imbo1td7830mkQe6R6vxaNDkSX6Y1jGzEaRsawZxJaJVqn7ep4cSPBeyS6N8hpCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=eRwF6IsX; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="eRwF6IsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1745957528; x=1746562328; i=w_armin@gmx.de;
	bh=xj5XU8sYPGD84j0jqneTPtP0NmiFZ9+JyyzWk7jzS5s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eRwF6IsXUYR05cTnPKzOTTDT5tTGaAlV+hT6/oqk6NmObOHitgc2y6YAumSF5DDR
	 SlozFx0Bu3nxzdIr0NI1Bypq1k2edSPo09wW8A+ks8QiXBQH35XmkjSumQohMOlcK
	 oBurt1w4/CowVef6L99Ny7JWw6O0lw0Dr6FQ3CM0BbEFcHwsCVqT+Bc29RB/DFKtm
	 x95rmOf5HenbwfBWNsDc+4TQ8+dcDq2inSepfAbBQA5J1Yd89xQBJGKFFRxtkcFY0
	 5tbnsNN9mhf3wdbN+GZ0C4UQNAfPNBVAwMTdCFWs82K2D0esFE9+OB42le14OVhw+
	 bfn/wlu/EeMXy3yR2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY68T-1uYuiI2cSj-00NWiq; Tue, 29
 Apr 2025 22:12:07 +0200
Message-ID: <b658e3dc-5561-42ff-a866-e17aa41db64b@gmx.de>
Date: Tue, 29 Apr 2025 22:12:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: thinkpad_acpi: Unhandled HKEY event when toggling GNOME charging
 states
To: debarbos@redhat.com
Cc: hmh@hmh.eng.br, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.org,
 Mark Pearson <markpearson@lenovo.com>
References: <aBA4PyT3YdKaPFdn@debarbos-thinkpadt14gen5.rmtusma.csb>
 <ad09634e-e6a4-48af-9e02-345ffa866474@gmx.de>
 <aBDAZO7fR0FGTJ5Y@debarbos-thinkpadt14gen5.rmtusma.csb>
 <d7756075-0133-4511-9a9c-2971a3e5071a@gmx.de>
 <aBEVi3hsxCQGUm4R@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <aBEVi3hsxCQGUm4R@debarbos-thinkpadt14gen5.rmtusma.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:lYdzTtB0gtV3Wjw2qzLiekugiMq7RFnefdsnALywulCW5Y3eQ3Q
 sLDakjH0nYBXOkpvjHsV2AjrFkntkwhgYfjbB05dJ8tsr71XTcMUHqlFNuoTCGgegcDuTve
 BypH4g2PSwNeMrWHLGtvzL6s98Qz3iviswc7s54WR3l8lhjG+N2jTeV7sfLotHoIYFZVaSo
 GzSob6mS4a6Nj6eH+IsdQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lwLPfODCniA=;de5tYEEpIpC02uIQ+uAFMbh2Zcx
 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

Am 29.04.25 um 20:08 schrieb Derek Barbosa:

> Of course. I will label the two scenarios as Scenario 1 & Scenario 2
> respectively.
>
> Scenario 1 (below 80%):
>
> Battery roughly at 75%

I see, interesting. I CCed Mark Pearson, he works with Lenovo and maybe has some additional
info regarding this unknown 0x6013 event.

Thanks,
Armin Wolf

