Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458FC175A5;
	Tue,  6 Jan 2026 11:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767697262; cv=none; b=q5K10d0B9gXkYwsnE2udxPZlOOspKnSBgyvmW0jSZxIpbWq3ipFTt21B/kYjjchFoKar7SPXOxbZJ8aDDO2cRqq+ugxSx20u/mky2+TxrmhqXTckssraJlcP4TQvWeD15rYij7WRm6kYhn9a3NJCq1r9ZQT5ZKltd1kpjSG9BlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767697262; c=relaxed/simple;
	bh=hHK+Xfk6315BsU0hYuSUtCB4Vev7vL9BXBnzUVOUB+4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=THQw0TXxdkvWOJv+7aNUZKUoG+mtKyogrZet09bp9YX+T8C82FARgARGPLw0sjnTJCcXLCofFUokzr3ZJ88IQm0huyjhR+KfcmqfwQeWMZoJ4gYqsq7tZvcNilW2Se8rG8yI3Fpco2Yn6hXems98Jk3XftlZq0WgTP0G60Z/NvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=YQkY/KrD; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="YQkY/KrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1767697251; x=1768302051; i=markus.elfring@web.de;
	bh=hHK+Xfk6315BsU0hYuSUtCB4Vev7vL9BXBnzUVOUB+4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YQkY/KrDZvAqRJ2LgmJmKSWh8AY5ax5RF47Hz5smXE+TcmtSmVPQwJA/DK/z9WUA
	 U7DYLvz2OhFYzbo+BC0cMQGTqyNc+4US5uRzBoDe5WeBEO8ojquGkHs/NjXDLL9g8
	 O45583j1zfzad9cptbA3V4de1aXDC4IQaiOGW+UTABbOQSxID+T9E3MbCQ9l7dejo
	 iHZK6ODeaO7DAWY9UC3KEuHhPBgXlt3E8YccNkv9hsHKZMOU8H/I7tN3BEC04vbdj
	 1fqHgb6QK4HzWsyt1mUk+ZCQjJBd9zIpO7kukEFjLo4drfxaabXqwrL1/KhOrIOuW
	 H/EvzblXuIImgmtzXA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.180]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MgibW-1w4S0k3jKe-00pFkM; Tue, 06
 Jan 2026 12:00:50 +0100
Message-ID: <fd8f6c9e-35ef-4c41-a3ab-f773aebe6a9d@web.de>
Date: Tue, 6 Jan 2026 12:00:48 +0100
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
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260106091318.747019-1-zilin@seu.edu.cn>
Subject: Re: [PATCH v3 1/2] platform/x86/amd: Fix memory leak in wbrf_record()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260106091318.747019-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E6ni7DVyLfQDydOicrcmk5FlTZnDbpCaZR3O/X+0iJCoGbL20jG
 rMNOe+wVqm260sh2PA2rHItVXRRwbwdseLndruT8+7XAR94i/GB7UaJY9lWCobuxr5P1zdS
 p7pJUrRGwD6sls8EAbXEktjI/+L8fmiTBvMNtNW1VWDR+wMXuRpLW3KAoR9rDgMQS0ZqLEt
 h8/+gfsLzqsp+n6Q4OcDQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gmsbsYIe0Lg=;HWVVfq+9JQhC2p3QNpnkYSAJIdn
 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
 Bx/UoxOY=

=E2=80=A6
> ---
> Changes in v3:
> - Split from v2 to separate the fix from the cleanup.
=E2=80=A6

Would a cover letter be helpful also for such a small patch series?

Regards,
Markus
