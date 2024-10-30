Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7815618D
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Oct 2024 00:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730246809; cv=none; b=ZIbZXP0bUZaeevv2L5M0QdevsP6KZTM/hA/sQ76sDDKst6kAhohgqDOlTRikhVk2qg+ajDwPhhibB6NTtcb2su1z18k7ktbigt2locwYhKJUPZxaAkvXnnVi3TfN98ltoO60uA+imOyGY4MJ5NTQm7SQpKJ4DJ48XouCTfC1hFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730246809; c=relaxed/simple;
	bh=QWKN7PM0Cc5U6JiYuYBlm1a+DrkINfRgEeaGoF3sXGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eSGIADHW3MyvjDo0EjtHxGSKdZJC+2k3/nbraSkpdgkM5vcUhsICuwDSDMqJNLfp04Cw6vJY7rvgJ9XqHQI6aF4MRQp5MKFLfVBoFvFcDokSQ/YJ4BLFPgZldXunCOvJbRuw5Km/EDk7ztYOb789FRO53SwifnaqJRWtjouws5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=G3YEmCDU; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="G3YEmCDU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1730246798; x=1730851598; i=w_armin@gmx.de;
	bh=QWKN7PM0Cc5U6JiYuYBlm1a+DrkINfRgEeaGoF3sXGY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=G3YEmCDU0sarzzbkHoNa92Pd9/8XmNieoPve0q2vPe/mUkmYclD7d38bnVh+sTMn
	 HTPVmenz2cdElnl9SeEA6ykOUPuwXDJBDtCk8rybQBazTsJGyvp6UTOXSPfhiVpdd
	 PYTAYnWWNMTixWlbvWrUryOuafRU6JsKGMUONznMpLH4+a6arkacbbWqTC3kgKyQT
	 lcPAvH6ltGIxIe2+KpiMRr4hxj0XXtx1+Sh485gsPMSH2gZrXYrtLqhnyRtkfJwHX
	 ace9eg9AknLU3qciWzfEsGkVO1ttffX3QNrDITWDY1mvQsTIOgozOq5MguV2ahrIH
	 j5m9LOY0CXGp6adl4w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MyKDU-1u4TuE1uvs-018MiX; Wed, 30
 Oct 2024 01:06:38 +0100
Message-ID: <6131c8e6-5a25-492f-a296-2ed56a9db360@gmx.de>
Date: Wed, 30 Oct 2024 01:06:37 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: "asus_wmi: Unknown key code 0xcf" when plugging in charger to
 laptop
To: Pau Espin Pedrol <pespin@espeweb.net>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org
References: <54d4860b-ec9c-4992-acf6-db3f90388293@espeweb.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <54d4860b-ec9c-4992-acf6-db3f90388293@espeweb.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GKulBr/c2V/XbKWJJM2IDbnhsDheNsZ8hbr0kVtyXKSncQyL+7G
 26tMPUEa4g9Evaz6bCv3Ex0kKRtdmHr7YxduMmig7Wk5xQOCTZVeUr4RrIc/oGrTKM3brkl
 eyZ98uuG5aBukTrq/9SF1MTV7nQcc7tm+w73E56Pai9k76HY0tCHJuITnBl2aslpNTgzeu6
 DO/YwU/X41FZPtCiXxaDw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cXnzRz9NcCA=;lTKlo5YRqxe8N2szjZOWol9TOvz
 APj+qJ8S2ieuG95m0+R9/ja7gbHb7x0BKv/iCM/119p257Vt1NtmS6XAg0oc+jLs0ykuw+P9a
 +NeWbewiERlwcG2a70q9qa6EDgBgYQOCUAca79+kGZIchZN5UYPvhWHuUG85Ieslgi3csM+7c
 nCloh6Y8hCU5SOjgPJqgfGUlGRI8rG/wBD06+y1ayb6xUkUG1DQc5VdJMbmsUbhJFyI2/vCAX
 Kl/EwcPkLHf2pUV0wyuY7euJjuQ5Wygzo6nG6ua4tENKx9I9s2ixbgayXjePaMYYkbnpkiYPD
 9xnKzha8VatkksqqX0Y/gF/noKvDdLo2aF4GSeZUgs2/4lDMtvSmbgWm6AWSecU9GT0pjCGyw
 qs6sVAkiHJAdJ49teXQpKY5DuVyHmH1sAQv73zCU2jd8OZEm3YPJ2fu4Nx6IU6jW2+AWEavGn
 ORSt7tMpkQPqwjKnoCFPCrwTPNZ1ynew3+dgR4vYvOzySV/laLrg6uDwAOV4ZqGW8G89zB1dg
 VVdNgHN12vp7JGlNZcF3hkV2w0/39O/x5PWGLwm07xwRxjXklrSlfyIxhadA77tlx+lvKlIXw
 /X7lGFIL2RScVwJQFHGpydPLAKI3db4pR2h4G2aPatxqO6nrwz1kiV+uBA+O1EDyfbN7ZtP/Z
 dcXTO4WZYD+icplOH3TFjil3JotQFNFLCt4Tlpf8W+jtDUNaoFRzve2MpBT2hCCWOcTJEgin3
 edbfueNy9nQEGSGweaGD7JX19gHGLLTEGquS2DhVjb7CEDrge8fQ00PukqNQN39S6+DnWuREy
 LwJEIpi89XMeUmhkPV3vP+8g==

Am 30.10.24 um 00:37 schrieb Pau Espin Pedrol:

> Hi all,
>
> I was using an Asus laptop today running Ubuntu 24.10 (kernel 6.11.5),
> and I noticed that every time I plug in the laptop charger I get the
> following message in dmesg:
>
> "asus_wmi: Unknown key code 0xcf"
>
> Having a quick look at current linux master
> drivers/platform/x86/asus-wmi.c, I couldn't find any reference to such
> code, so I guess specific handling for it is still missing in there.=C2=
=A0
> I don't know how that code should be handled or ignored, so sharing
> here in case somebody familiar with it wants to make the message
> disappear.
>
> Regards,
>
> Pau
>
>
Hi,

can you share the output of "acpidump"?

Thanks,
Armin Wolf

