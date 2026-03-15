Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A541726ED40;
	Sun, 15 Mar 2026 22:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773615289; cv=none; b=OaTBELz4J2r6/6Ni94iLXQecHGYLfjcIYWG9G+8rqyCVu3jMtXif9Slcqqg65/ijn9MQJFtWwUUGR69BaXd7Wagpxeklqz46hO4phOwarA7dZzJc9zkdKUVx+EeRaOFKjIrztBU2MN2j7SidQXNRfQeBEgEKKTyczCsk/m4GYQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773615289; c=relaxed/simple;
	bh=GKxjJvY+SzU2poVEtuLZBEmAVST1MZWEoJKh5FLycCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BzrI2fOii6iGrLVUk/vSSzZ1KgmfwbPKxzJyHlGu3tiyq20NAnzE0IdG+n4oruKdYt5nRaI0Xo4YNRPVNd56fz7+BibbGyo3dz/uVnNkHCPtr9G8O//CUtTTp4O1WfcN1W84kBfN3DUh+a+zxQO9l6Fjl7yS+sjSrdCBKwJ7lk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pq9uu10f; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pq9uu10f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773615285; x=1774220085; i=w_armin@gmx.de;
	bh=GKxjJvY+SzU2poVEtuLZBEmAVST1MZWEoJKh5FLycCQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pq9uu10f4kG0Hv2E3GdgbVWoVe84h3p/So/vttTGWmsHbPlmHu+uLMZyp7VpF6B+
	 znP6eYPFFMVO58ejW2uJ6N8v+/+Vonpx9NopuJClEV9KsX8fKnWeJKZLaAtcEFhx5
	 qw0UqPdNBOuSdts1h4swWf8xTOK7honDJ+HfqsIiOQh9/3vnijOwCKmeiB6wCypZg
	 onk8HYzIXW9qivJXif3Co9jy75CqMYUe66zZU7uEqUpBDWhIPp7TYg+MaxN/oU0cw
	 vO70OSxDKhXomK+Efacuo7OPi26kIxPrgPINXf/Z945r/2WW/kLodCvOQ8yvAzDhs
	 zOh4WzEaOejpjHU8cA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryXN-1vEE7M2Lcz-00orOV; Sun, 15
 Mar 2026 23:54:45 +0100
Message-ID: <74508d73-07a8-432a-a106-31a40a17b141@gmx.de>
Date: Sun, 15 Mar 2026 23:54:43 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, lukas@wunner.de,
 platform-driver-x86@vger.kernel.org
References: <21b44fb3-238a-417d-b414-e7903b8fdc18@gmx.de>
 <20260315220841.24188-1-atharvatiwarilinuxdev@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260315220841.24188-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:mwFEhH2AI3YUZ4Dqk+wVP+ZCpk73+qNh5G9ESiwEvK7t2iUx+jh
 E2yvHMzH3mTgXCbPDE4OyAAXVcE3rotE6kIEg1fcJ+icjv7cmZgmInIrW+jU4uTqRE38116
 h1pNSfocUhwosLe+iyt91zHM0i8VA3SJt2hsCh+bf8RD7YXqWEUnAzb1Oyj3owyxkyfi61w
 3etQ2n97nBIPhVqGJ+2tg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aEHJK9teWpQ=;ZRCQstSf8S895/EBVuSG91Pf3rI
 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
 xPD5YtUC1hrFwBypZJxU

Am 15.03.26 um 23:08 schrieb Atharva Tiwari:

>> Systemd seems to already store the backlight brightness during shutdown/reboot, so maybe
>> having a small oneshot service that synchronizes those values with the EFI variable during
>> shutdown/reboot might be easier?
> This is logical only if we assume every system uses systemd, and that isint the case, and trying
> to port the same logical to every alternative to systemd will take more time and effort, than to just
> embed this logic in the kernel.

Such a daemon should also work with other init systems, it only needs to handle SIGTERM.

Thanks,
Armin Wolf

