Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA8614A0A4;
	Thu, 26 Dec 2024 06:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.182.66.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735193617; cv=none; b=S/XyN5u6pds6vTSqIYJETTKlt+mkU8gj+yRgmnCdgdqlEwIZ13hGrWa5QUMu3jUVvagzgHpo9PDLR7Ur9a24/OKoUn1la9ErHcK61TWOKAHo8KGGa/KuSd2BWDTxF/rEqw4K8gS6BSe6HIGvZmdYh7wcTlsMs52Amw4XpfVD1BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735193617; c=relaxed/simple;
	bh=lxQn2fRI5+PzUpX/8rZD9uRlSxQi3UB0PkzYuF/bqwU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hHJZOXzudnzeFlI4ROgvB+uwJDQVAF/cEDV9aPsvQydT9U8owFXHNU/ClGN7EdsjIBTf8PiwSLP1IL6bfgpZswxWhJJydvl2yne7omuZsrnLcg6N5FyWLofJwco/vHsXumey7JWpyPdpaoygR9kqfWa55PX0F9AdMdD6npiix8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=eSwZfmhK; arc=none smtp.client-ip=217.182.66.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="eSwZfmhK"
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id F2B323E8D6;
	Thu, 26 Dec 2024 07:13:33 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 0BD2F40071;
	Thu, 26 Dec 2024 06:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1735193612; bh=lxQn2fRI5+PzUpX/8rZD9uRlSxQi3UB0PkzYuF/bqwU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=eSwZfmhKsUWtXi3XVYB/Px1EJ3qksUngNhfxycRjBMrEXYOs/8ynaQyTlTw+dv4Xx
	 WMpXDecktpnb7IAqFGuxaLGdlOn/EnmiPLkKc6r+hkKWMjB4WtMF/0PsIHh2PxU5Lc
	 L4FFgDj7Bs8NZIcz4924iA3FRKVeRoIvxC64xVro=
Received: from [198.18.0.1] (unknown [203.175.14.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id D478740281;
	Thu, 26 Dec 2024 06:13:28 +0000 (UTC)
Message-ID: <57a6fff2-72cc-43c9-8769-0e35b6d79dc5@aosc.io>
Date: Thu, 26 Dec 2024 14:13:25 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: hp-wmi: mark 8A15 board for timed OMEN
 thermal profile
From: Mingcong Bai <jeffbai@aosc.io>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Alexis Belmonte <alexbelm48@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>,
 Kexy Biscuit <kexybiscuit@aosc.io>, xiaoxi404 <1577912515@qq.com>,
 Ai Chao <aichao@kylinos.cn>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20241223100748.2157703-1-jeffbai@aosc.io>
 <31f0819a-1a56-8f40-b898-76ed113ef545@linux.intel.com>
 <7c5bdef1-9201-4d38-a6e0-6acd95d8aa38@aosc.io>
Content-Language: en-US
In-Reply-To: <7c5bdef1-9201-4d38-a6e0-6acd95d8aa38@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,gmx.de,aosc.io,qq.com,kylinos.cn,baylibre.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,qq.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0BD2F40071

Hi all,

<snip>

>> Hi,
>>
>> I wanted to apply this but the first signed-off-by line threw me off. It
>> should contain person's name before the email address line like yours 
>> does
>> (assuming the first signed-off-by is necessary in the first place, the
>> patch itself looks quite trivial given it's just about adding one ID).
>>
> 
> Understood, but that is how this person represents themselves online. If 
> that is indeed a problem, I can consult them for how this should be 
> handled.
> 

I was able to get consent to use their real name in the patch. I will 
send out v2 shortly.

Best Regards,
Mingcong Bai

> Best Regards,
> Mingcong Bai
