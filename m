Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80312FD1BF;
	Tue, 30 Dec 2025 08:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767084691; cv=none; b=TXcy5SM2PAX8PtfL77kWopCpOI5FAVuyqC9spno+wyBg4fa7zp22uKMpTYKniT4Z94whSO1dSbvVngulK3Z+BrfO4HJN/9hSfPdSyp6kxc3lrQDMXzmbpppVkiV5nKKkbZ9bEVBRXMEQRVYB4qDAVr/tEA764pizcEgiojwqI8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767084691; c=relaxed/simple;
	bh=HymnxAilPSgtvUeA33zmGzyrJpT3Oqe9NR3qBBtze24=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=eyScXIATTiMAyyY+CVnUh1/1SE8bNZM1+7v180tKNKy7zbQJtBDoDcpLmL/PlpcN+xO2tjPd5MQuxxkYsB6gEZoF/BfQoi/E3xbo9PUonsikpqnm46FGp/T1Y5sXgx3hIBqAU9gdBkdXPVqaaXhzaw0lTV7RAFFXk9c/5TAzbcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=NduPYVSa; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="NduPYVSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1767084669; x=1767689469; i=markus.elfring@web.de;
	bh=HymnxAilPSgtvUeA33zmGzyrJpT3Oqe9NR3qBBtze24=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NduPYVSaIp8WKDjS4+0/DNBCWSzlm0bq/eVI8QpqCWRV2UJs3uEGKruGoFlPUeay
	 uLdF3guq6Pvur7Xz6ZhZw9LDK+X5SZT0v2orlLdZXsp0Il4sgNd05HMpwQsXWxCoZ
	 5ZNPlgg8Q40/CHpAeov1T17OeXHXyK631LUYs8StKHaRJIp9/imtdBayBmefoaA0Z
	 TTmJFAzjMm9ktV81kjZFA+g/tYRdNq7zQ47OFLZ5EqQ28v4yaUFIp1JQNV2Ofd9P9
	 6DTLKGFBiDvleaqZ0wE14NmUO9SJ1YfVymccQsYawJ+JiE94B07LObP69smXbvTva
	 /dxwW9Easy1L76zubg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.0]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MIya8-1vKdFe3gBG-00U0Tu; Tue, 30
 Dec 2025 09:51:08 +0100
Message-ID: <ae25ee51-cc43-4173-9349-8447d92d419f@web.de>
Date: Tue, 30 Dec 2025 09:51:06 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jianhao Xu <jianhao.xu@seu.edu.cn>, Zilin Guan <zilin@seu.edu.cn>,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20251230064325.1036637-1-zilin@seu.edu.cn>
Subject: Re: [PATCH] platform/x86/amd: Fix memory leak in wbrf_record()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251230064325.1036637-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DbGGDGipbus8f95PSqibfJxE9LzjrVEBkzbSW8t4Alp3HTRQaoB
 xfaj5UYaT58nrxgBymBQDBV12FNfGzXUd655/EWwbRBzsgy7yVKWyfl61tODy9MGhFwFo4v
 sGNE1QIpxM5sC/0UKEXmszEB05MZ+kPZmm0GDxHFQz3Dg4MDMlmcJzNqmNO2fnIqs5gnB9Z
 QelE6HE3mn/IUz5+5PbtA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:t0gdnw3hhXc=;NV7yK5j0+j9RoP25GbqidD0Cjp2
 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
 /u0Bfndw=

=E2=80=A6
> Fix this by adding a free_tmp label and jumping to it when obj is NULL,
> ensuring tmp is properly freed.

How do you think about to increase the application of scope-based resource=
 management?

Regards,
Markus
