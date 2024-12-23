Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3627E76D
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 23:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734995178; cv=none; b=hIAcwWJn5t0trtFPXaknV13debZFbZVkmuUwydYR7fDSRtm3FIrZ/26gW51X6SmYF2Cwg1dhwDweCBqW/2YBaTZDLJu6k0ARpvWvq/XqreHGCttqdgb3WTC0tNBSH0W7y5JKKmisMT2EZmI/16vJjGDLT1PqBRDGZhUZVEze8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734995178; c=relaxed/simple;
	bh=7XSTwuJKIzNVsl3sGGYB6BvaCDvSp93gPYb/j+KI8/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPEku9oA6iXiokdijymuCf9ipcy+j9ysCRbHCjoIi/fXSovxUCRujdTpvkL7OaqtNLdMR+vRcAd/muusvp4oE0RrJDBfUQzbZQPl8GDMT19lCPR2IoGabe6xyfmhLWvNUjYCTPPnyPwOhWR621fshlsn/MXcQbYiUyjypVJPohQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=oyfZNdDs; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="oyfZNdDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734995174; x=1735599974; i=w_armin@gmx.de;
	bh=7XSTwuJKIzNVsl3sGGYB6BvaCDvSp93gPYb/j+KI8/8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oyfZNdDsJHEFQJfZ6Jbd1SY7A0D6DxDNIUH6jFIWfTirn51lIlXAjeU4a+T49PCn
	 k3ZmzI2c0BDOW8HJINogKvt3j4h3ZMyUkn9aCUiTMRjubFgMrJEAGFUEGTIZ7wVrd
	 cFTKHftpn//kLT9uoSevhIIM+Bn8yEKn3ZAUGYN5hKk+hpkRGdLT9nPDg6m4t3ptg
	 1Z1xsCWAt7fcFVFEmEVJXhTTw0wrtxuF9P359twrTug1MIyoEkWPC9o2NBFhQuyDc
	 mPYHa/BwuYAil9DKMFIELTaVwq01315/EeJg9dMjm3uy+om2rvMapSBKXIkNi2yqc
	 Hj7mFfSkeBU+BNyc1w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4QsO-1ta4FU0o4c-011BCA; Tue, 24
 Dec 2024 00:06:14 +0100
Message-ID: <cea0918c-7c7d-49e1-8b33-b952b64d67f1@gmx.de>
Date: Tue, 24 Dec 2024 00:06:13 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Hridesh MG <hridesh699@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de>
 <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
 <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
 <CALiyAo=GpKN2Aty5c3Bw0Vh4U16vgUP29pZkaeBsOKw8kcK29w@mail.gmail.com>
 <c5124fb9-74af-4c90-9edc-ddb3517cd9ac@gmx.de>
 <CALiyAok0_JKE+BkUQxHHH8Z39FHq5bW0Hb1Gk-MYHgDy0yFoMA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAok0_JKE+BkUQxHHH8Z39FHq5bW0Hb1Gk-MYHgDy0yFoMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kBSlLSUCFVxsOlmK6nNur2GiujXxl3t0jpMnipBIOBFSpwH0RSp
 qmxDw5gM0J0BpzgzgWsTOWbA/+fX1SiFIGPbO8OYkdSbTB3ZMtU7cfIdUHpVkNVtqeca4CY
 daYYiZJZTrPVd14M8tCZj34AkSz/i/FikPwcqMTpwVqVo85dKDd6F7LHC0rsbhunyl1ms4T
 IZxjWkT3IJngT3ap6gg4w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CHz5uhcRjMg=;YzbaiUDBYsTKxRPfheDTcBG2zTj
 u+pvHm4rKIYxz9U9ddTNI9bYh/qJh6ARO+01KAtW1KEZSjBU5gJOowEbOAu2+vrTBroe8oArT
 myGhjyVZ8RwgXhKhz4mCJyWBzz+qH5Dw5XlkTSqBEf+b1DY9ycUn8h8LttBotKDDcg5/U7yAI
 mPBdePozLz5jkrI331UBAJjKEE+d7WsYrdm5ILh+mZKZH3IvSmQyQrWByk08Sa4gxrCdyKQeA
 f0MBwh5W20OztTQJyaOjr/Dz5n68vmq5DJ8L6it+mitUNkVHO9plFOtoJoOw0vahw1pgaFOuZ
 LC5otb6DYrcl5wjjm+VFD8dYU07ssVjaTVQsFExV4TIuRMPVgQLObiWB4htpCHDZ9A+LKD0mP
 fNQ4KbuZ/0Qlo21HvfUrIzcGa1WitrVkE7g8kqriNStIopH2PwHBfXk4iEGfb2hFbeXGho5c7
 4sTtunAsApoJFQ5uHiA9h8li1U9Ves5xB/aMHymR2uJfmjqzSqXrgsLYG5N8m71unsUYTl7EK
 +00gPhWvSy5hK7+7E4NhqVs0/BS+EHeR2msKLJgVJovARdZ6pIFvLqTKzI1qjPMTPEVk7Bma3
 iDYaPgk76q4+2m6cYNmM7TpRG5WIpo+ss+SMuWJDj2jWsQk7hN1pj28PXRLqmvVjyJG9Eh+hz
 TeVG6Jt17J0XtOfiTDiVBTzrMlWwdXIBUvKjyUu0Iw2CYXP10rSchuPpNTnAtSfEmiaUNBob8
 0V+iqblSJH0IoKmFKY+BbtEgbRzQusXnm/x/qWHC2PkUN0RxJFMAlwWJv1AWYTkOSgTo0idSv
 W/YcihUm9tn3N8BFOWvIpz5Ci9dA/9Z22TMX43fEy/IM0DQ/ev/1WBvx0L9UpoJOLTPYsNj/s
 YJFn+N/hLGvCvQou57Rgs+pcC0R/rgBLPEnFUyael5B6TUKqRNptd+SaaPmnLBuUlB0v5BMI2
 Z9PNcCzEyaIEDbTgqAhOSdRL6sojqa8XhXeq1M284JI0VkyaP3sOzv8TJ2/TPXUE4g7xMSWUY
 yo7yOemgzAuoDcXg3g7fHlUkEqt/qZEQ7kO3LHZdbnprYIDLutL14LVF5e4/tx01X+IUTywhH
 IDTRDc2nqq7bX0QjNbEklmnXhUHebi

Am 18.12.24 um 09:00 schrieb Hridesh MG:

> 18-Dec-2024 3:14:04 am Armin Wolf <W_Armin@gmx.de>:
>
> > Am 17.12.24 um 21:52 schrieb Hridesh MG:
> >>> Also can you tell me what special OC calls are necessary on your
> machine? I know of another user
> >>> which might suffer from the same problem.
> >> Yep, there's only one call - SetGamingMiscSetting (Method ID: 21)
> > Are the other OC WMI calls still submitted by the Windows application?
>
> This is the only WMI call made for enabling OC.
>
Could you figure out what arguments where passed to this WMI method call?

Thanks,
Armin Wolf

