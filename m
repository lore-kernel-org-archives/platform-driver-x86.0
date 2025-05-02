Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61471547EE
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 May 2025 02:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746154788; cv=none; b=k3zrEnp+F8+ZY9RM/eF9H9N+MT8j/YSQEo7chu3qWAZs+LiK5Ea+F3GOMseqLGAwFisa+y3iGW0AbjtbWAsUq92uAFLI+x1Y0qTtgYiZYRK4VUqraS+wboFe8zit58d5EAWkSmwfqc101pLxqPnrsFQEWaOzsk5hXEjZfKql+ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746154788; c=relaxed/simple;
	bh=id/+7FT7HT8LnJ1XKan/+sXof2JXFaR8n1lKbxTA8ZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6jl/jK/CtqKSYcbBLtO72ynnZb4cAYPDcfKMrjJv2ZAiGChYFaKU4jBFEMzRZVThbpmQ5Q9rh6HtK0OnsXTys2YJYgLcQB8l8A6xd98fV2KyZiuAeF433SHX/5UpQf+McQYH/80FIQWETHktqZ3FJ4RAdgfElSOWn0TGGXdou4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MPTf12yP; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MPTf12yP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746154781; x=1746759581; i=w_armin@gmx.de;
	bh=C07HFTVwg8kOx4koxUlYPNo0M5+ueh8ur0S1JBI7ytI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MPTf12yPNBHkKOStwsf+TrfO8fvTuu9qmc9PA6xHshS1jUQ9iCBkJmCkYehRPrZi
	 fBizEM2rnLg785MEZt96qQuWZ9OLPtw6JApTAp0ymG5MlPfmvTNB1TomOhXs0E5KL
	 DghT25+rTRyR1scsYTKQHYW9SoYTuGmkrrof6IBzcKEb4RsJII5kVGFJ/w1xeyQAa
	 ShDwkQcia00P/rEkGCM7GLUCmIx1TrYdekQMninX6euuvTAqR+rEcOAd0H+2mBrsG
	 H+mv4dXcRcnQ4VH315bdeio17Cmm5jxBF9erjhXDlPfzjKCd+1q4q4i2OjOY7Mor5
	 rKzfDF2IR2Gq4jvbLQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hzj-1vAB2o26vH-00sRKr; Fri, 02
 May 2025 04:59:41 +0200
Message-ID: <1bfd228a-44ac-4e68-b3ae-4d1a94259e1f@gmx.de>
Date: Fri, 2 May 2025 04:59:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] platform/x86: asus-wmi: Fix wlan_ctrl_by_user
 detection
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Corentin Chary
 <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>,
 AceLan Kao <acelan.kao@canonical.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <20250501131702.103360-1-hdegoede@redhat.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250501131702.103360-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:lij6mgEOgyX3Pap/Jk8FtupAAm6Rikf4OdqiWR/L2+cGvFnnRlT
 pL/+nou2mtmLeWLoCgr/Lo4FePZ3xaa5xGmQlUUp1oaoWtpaoL95wBpSrp5l+kf1DGJYNdw
 7sSZSBCGwXFAUP6Jkt9MnyrmHKD9Cm2yUhYUAq7DmMJjlmLvqE6W9YiEREyyt4WBadus5sP
 gYr6MLoacBWIK6cL1hA3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Q48TNyD+YRw=;mTgCHuOsB/e4E2RquK//0Z97IPp
 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
 4OkCcgrW5BRpc=

Am 01.05.25 um 15:17 schrieb Hans de Goede:

> Hi All,
>
> Here is a patch which fixes:
> https://bugzilla.kernel.org/show_bug.cgi?id=219786
>
> The patch itself is trivial enough and seems obviously correct to me, but
> the code it fixes was first introduced in 2012 and we've been doing
> the wrong thing when setting rfkill state on some Asus laptops ever since.
>
> rfkill has always been a bit finicky on Asus laptops, so I must admit
> that I'm worried about this causing regressions (or maybe the fixed issue
> was the root cause of some of our issues?
>
> So I think we should try to get this into 6.15, but not backport it
> for a while to see if this does not cause regressions.
>
> Regards,
>
> Hans

I agree, this issue could potentially be the root cause for all the rfkill problems on
Asus devices. Since this patch has been tested on real hardware, i think that we can
safely add it to the 6.15 kernel.

Thanks,
Armin Wolf

>
>
> Hans de Goede (1):
>    platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection
>
>   drivers/platform/x86/asus-wmi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
