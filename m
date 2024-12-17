Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD1742A9B
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 20:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734466384; cv=none; b=UXrJ0nfkMXpp0iD0EC2Ws0ukEbODjaCJZ3CdcxxmRooXN+TBMksiXpGhn1BmQq1MKso78NMqIQg1JI/JAo18yDjEoZEH7qTJXenPbaS82WZTwdj7wVQZf5ialCv56onirnbsYhWouD8ZQx2/es3lrmtTI2HSZUlvIciy2GcX3WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734466384; c=relaxed/simple;
	bh=MewvUkUjVRNgreiyXtAP5PBqydLUhK9MEF+jIh0R1SM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVudjYHPIGLuK+OmaIs/rCurRoFxXhfilZQexKHQ+2wUgrg1DMXPQUSSqk2kZIhU49UfMdB30nD0Ep5fPpKgDyy/IuoTLUbAn5OD8KzZd+giLygXLa0H2oXcicSZjpFHwY8hnZr4VeMnFRHAK+jmL9EsEWdWaH/hbt0abrsxYA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qPw5j9aN; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qPw5j9aN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734466379; x=1735071179; i=w_armin@gmx.de;
	bh=MewvUkUjVRNgreiyXtAP5PBqydLUhK9MEF+jIh0R1SM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qPw5j9aNqk3NE+8iE4UdV/plZ6WfnkIJHU1Yt/85xCJwoJR9M+y/ClSkxZHu41hf
	 bju8HVvO6NDnKqAFsbw0OsY2RseCzZuKVQ5SIymRqqzDNVH4zO7+xDBDrwabdmK3V
	 Ri559RFKrTKoV+j4fgHUeS+iYy5RcUE28F3Xsp8CbEhfwczEKy4rXAH4agofOcyKU
	 5/QYBfoV5Bd+HeP/yEvaZB4wkf2sA7rrLKV3S3CV7rKm7lyso1u/mN5SOzKpCHUwc
	 zvgXDbSNl8Ul4bW6DQxaiCbHCf6IPN3p9RRH6+8etl47HTWF7cOR6NhKqG6m5P2jb
	 sZXsYm+FusVZOovtdQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTRQq-1t0VQE3wdg-00Sy9B; Tue, 17
 Dec 2024 21:12:59 +0100
Message-ID: <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
Date: Tue, 17 Dec 2024 21:12:58 +0100
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vrvQhshvnAofldCT+bSCrhoHAxy2r3Gjv9fEZtzeHK7T1cdf9UG
 xbnAY/UcHS/3XnpHQRYcJLqs9WCtiyumzGalwFaKPgSWeXYH2l0GeGiD3FLoVE8GVtT23Xj
 F+l+BdGbzoytyS9Gin6tnUqPrBIrkEdmAg60LtUusroe7BMxx6owUs0LWogJ1kw0w9zOs0u
 BXE8T1A6Xcua0gj/bF9Mg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TEGc6BNjWj4=;YYPAi5QZ0li583hQGDLxh7fvlZB
 2cNIcAO9LcBAZqEUML/E4EtjWysPU86D3teyf7wbjs9ZhEm+OmXY3vgUcVd0XQUF6trjVfhX2
 8FIRl6DAS/j4JXs3ksjJNYOPOvU4lpq/kHPFkOKAfwvO6/ofCbKcaRtEnkx/8b/AlcgxdNuHp
 RZgVdLPSDE/84FofMmEQ56tb/0/xDm5UYYm3xr91ERbphn+KGDxS1M+NkSrjRfaNIxNlgfC2p
 4TLDyPJlL/P2x5nQGLPe3IZy+bswiSiCopndrYJGm+xWmKCleNKKF9OIWUFJ7Ys/yR5Q5nrOa
 LD2h3n3l6+LnHc73EOYK81SzF1LwIWelSAas1QxZ/XuVbzgdbZpyKvNdpUI3DyyMiGEunYqNc
 fchV08mgT/rlxTESE1a3olG4IJPDVcbxUz5UQ+eYTC0waO+IgqsVygAOYPHFsN8Ehlycuyr5s
 Msw5kENWhGCw01l53Upt1BU5fVPDXZXyibEGnn+v0jgQdLeTZbiW+topM3WlNI8ow5tVzlpNr
 j71XNFQwzZ5+6L6dLO3hT7xz4cAk6EdShLjm6tNqoH08l4Xsiz0Hz/IuPjFiN5VV5YXLycIiB
 wydoOQagYg9lOu/E9pGreqWpYKNibj04CgV0oVWE8KpSAL6+JAtlVfLNDHs58G+jbNRhqJVHf
 HRpciznnM8r+GyR0qlOyyzYuO8q+qvHT0kbP+S+hCr+jlP3BzzXzDMbCPpqCQbCg4uPzszY5X
 ecgOSWCta8ysIK8rbVj8BrUOJI5AFKUd3zmCcWK0Jo0SL6SGiPEfLIH9uyxDNc/pU8i/z4P/g
 nLAXdIRynOoEQ1YgLvIhdyNAC8DaMRnOxErzf9NCJiMeTO8Vneyrip/3JvjoD8OVIT0BiqVh7
 49AGFEdsE6TA1wbmvkhq/RjFUKYO0GEawCfiu+raGFhGSjnbHAAYe1nGCGoNHKlEEdbzWQRrJ
 Bmag56cGv7avfHYB/HtYNo2tp0svdYvjjsQkOywH1HYbZ7RGq3VCCQ8TBfWgOHis5ZyPYTTBo
 4AWjRFXhPySfr3ncWeoftbNwNWYLkMiWUQv7xtWUffWUmb7MMJlJn2jU8ltWCcxL1Iz8jAg3l
 vzhnf/NBzYCV6PDyZsoZyCbMcK28a1

Am 17.12.24 um 18:41 schrieb Hridesh MG:

> On Tue, Dec 17, 2024 at 6:58=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> This seems to be caused by an oddly named ACPI table ("$H20"). I will a=
sk the
>> ACPICA guys if this check can be relaxed. Other than that this error is=
 harmless.
> Thanks,
>
>> It also seems that the ACPI code contains the necessary logic to submit=
 an turbo mode
>> WMI event. I suspect that some settings have to be enabled first.
> Okay that's interesting, I did catch a WMI call on windows (it was
> something named APge action iirc) when the turbo button was pressed.
> I'm guessing this means that I will have to learn ACPI and how linux
> implements it if i wish to debug this issue.

Actually i think you need to look into the Windows application and check i=
f they call a
WMI method during initialization to enable this event. On the Linux side t=
his event should
be supported if received.

>> The thermal control should be handled by thermald.
> I don't have thermald installed, afaik the only thing responsible for
> managing cpu clock speeds right now is intel_pstate.

Then i suggest you install thermald so that the platform profile fully wor=
ks.

Also can you tell me what special OC calls are necessary on your machine? =
I know of another user
which might suffer from the same problem.

Thanks,
Armin Wolf

