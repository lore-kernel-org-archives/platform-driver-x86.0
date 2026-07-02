Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C271A01BE;
	Thu,  2 Jul 2026 17:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012978; cv=none; b=u6wLEdmaPK/7mHPrBqk+X03d6YkLNvfIfq+3XpOx7UvNAz5P6BHFM5darqRvKil1YUAymyTIudMXeYholJDniQSVmN3niaaZdbJrRD7DOJBn2X+AP3Qff3/a+PApOWG4gdK3w8SUbc1ypMPbfuzjs3hL4bxCGRKRKOFcnsDpMrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012978; c=relaxed/simple;
	bh=6uJjABzAQQCrRP7gx8b12/wI+DtsVWYkIZ1dZb3p+6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ol8ufDU8Z3ZztM2fmFm3s3nkBoASZvHCkA/W834CsBlYVFpw8BJYMKMhKXlzB2v8+OkTkWKyznT49uTWor2mBDDn615p8BCXK6AXFw0UsVKvT1338Op1IGW1ZJYxPkenUNuGthsMPJe0/fu6z7UfR+AlxjkgBXg7UJVvv3Rq0aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=eLqED3Kf; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="eLqED3Kf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783012968; x=1783617768; i=w_armin@gmx.de;
	bh=eBkBx+Ncvxe1x90DUURuh6QyiAFT+LmKlzeIcTVSzOU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eLqED3KfgvjjVGZosqzZDIl9N32pXJQhoFfQxuEiacuYzp106ggMpTBAi6seb0sL
	 qVFF4CsCnGeaz1MklbWosAzBMIUhWZp/AFmPJgC1hvUubwVpH+PvE9KZa4cOJ2X7r
	 GA+K7Yp0eeiE28CIKfibsurxggrNIP2X2cU3CmeEmNz+cRShRQd3SplKyn2x8JsbC
	 /0V+DumeJ6jM+2FvYdIE0KbqbQZSnzKuptecBh/QE2WzHdo7bGir5n0Q7sE7gAd21
	 SNjEL+m0qOLYWq7U9s72h2h0/LaLPAC9lBHdGqaArkF50mfDqc7CLkq8IHvDGwzft
	 AVwbK8Av1k8g2bC44w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeI2-1wVXSu1pJ6-00Jsux; Thu, 02
 Jul 2026 19:22:48 +0200
Message-ID: <c2ecc67e-7116-4f02-8d58-abb914336813@gmx.de>
Date: Thu, 2 Jul 2026 19:22:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] platform/x86: Fix various issues inside Dell WMI
 drivers
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260612173451.467629-1-W_Armin@gmx.de>
 <178290542683.22449.17910473378270100225.b4-ty@b4>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <178290542683.22449.17910473378270100225.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xW0u61Rg0YDhPqU0nmqDP2rxbwyeqgV5wY8KEVhjtFOQnaXh1Kh
 ccxd03C8YNFXu/O1lBTKLw1psl4sdOiSfy7J4Xx2vFkcTBtbok7IzFVg1IZyoWBtmDn+NbG
 UvW8l1N8oFpsdnt+7b4GOECB/vgN4TEGzUIrft+tam8lMvWj8mh1mHTGSuDwfEudGEf7Oh2
 2Eb+5UaSfYoBbK7DZdGVQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JPu7+NoRCQg=;We7UlgGPFe0OaGOXVlVmB88qkXa
 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
 7YmN++Ci8uuz5fATSh6JRvMMFXVhT4ic433G1hk

Am 01.07.26 um 13:30 schrieb Ilpo J=C3=A4rvinen:

> On Fri, 12 Jun 2026 19:34:47 +0200, Armin Wolf wrote:
>
>> During the review of a previous patch series, Sashiko found multiple
>> preexisting issues in multiple Dell WMI drivers. The first three
>> patches aim to fix those issues, while the last patch is based on
>> a suggestion of Ilpo himself.
>>
>> All patches where tested on a Dell Inspiron 3505 and appear to work
>> just fine.
>>
>> [...]
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent or clearly a regression fix.

Thank you :)

>
> The list of commits applied:
> [1/4] platform/x86: dell-privacy: Fix race condition
>        commit: a3ec96c8b7bc3a643779ddd7daa8a6f482e4917c
> [2/4] platform/x86: dell-wmi-base: Fix resource leak on module load fail=
ure
>        commit: f58553cda9aa84e1598a640870b137350cc24027
> [3/4] platform/x86: dell-wmi-base: Fix handling of ultra performance key
>        commit: cfe467c730f658e080ffc57bef36f0260333c5aa
> [4/4] platform/x86: dell-ddv: Use no_free_ptr() to simplify error handli=
ng
>        commit: 74850eb0012b94c77366b0476e4f3b1db349a4d2
>
> --
>   i.
>
