Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.182.113.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501892;
	b=LFhY3i2gcF1e0K3LfjijBzCMpftPqHe3tPzJHhtSdNdhu6UlNZO+CSr2PK5GEnDaytM5
	 SQoAl13RleRB0ru2H//4juihUBWtZtawqyQ6dxC+lve3T+zh3AoZ09Iyb3dSvf6o3r+Ea
	 G45q7/SERtnYaFPIW11TnOXZ5G0NNEBNE7FcHFfNNo419jbX0eqSjxfzRZkLkBK1KpBn/
	 9yP6QLJWL05ZvRaXghdf9IN2yQQxRo0FxZJuSMXXx4AJXMYT5OfvjY7nulNXw1mc4xbsy
	 YF3NfMw/+nyEnKAhTIdSV4YSzMQrz7cOTyYPgGGICDixFgaSUojELwI7PxKhuz6npAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501892;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:
	 X-Spamd-Result:X-Rspamd-Action:X-Rspamd-Server;
	bh=dFbMb8AE6Yw9DziHA4r7D3bkKIOzfPramIwPHQ+C3N4=;
	b=vFKrVql0UFiZaM04g0pDdOstsnXvIpTz/oEes42mBbPKW3g0YN7/oU0ZxYOzYSf1jDU1
	 BnivZnhZGeoc76husL5yo4bucxPisGWZHBDTA34N+8wx3d/0COWawdPatxb0qFHbbwe4v
	 QmWuDXic8cmpRZCAA2AGOEMP0x3WZ/iue9OYcPosFXoIA9VnLO7IsHpzAQ5Txm1jn7S3m
	 17UcA9G0IWJxhN2V/C65VcNAaHXwnr5cktRCY46wv20fLlWh4nJrCNvvAq/Nx1MEsSVwW
	 QRVD4DC1ROrHPvI752L9Njuzv3JSfkzWBQb+gDSEQqpZR3qoY6JLRmz6Q0thPzdzfwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aosc.io;
	spf=pass smtp.mailfrom=aosc.io;
	dkim=pass header.d=aosc.io header.i=@aosc.io header.a=rsa-sha256 header.s=default header.b=mxHObK1L;
	arc=none smtp.remote-ip=217.182.113.132
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.113.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE2E606A32E;
	Thu, 12 Nov 2026 16:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AE2E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=aosc.io header.i=@aosc.io header.a=rsa-sha256 header.s=default header.b=mxHObK1L
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 5FE1F3E89F;
	Thu, 12 Nov 2026 16:44:44 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.38.223.107])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 10762400EE;
	Thu, 12 Nov 2026 16:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aosc.io; s=default;
	t=1794501878; bh=dFbMb8AE6Yw9DziHA4r7D3bkKIOzfPramIwPHQ+C3N4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=mxHObK1L/yKmRdMyPGn8PagqYJTC/hVNYOHGYs347oIUZWf5hlZUtx/psXbnAY4rj
	 LI5RIVyMxGghcOJ/LqVz6kKy/x5btKOt3cGRfzi5vLgkZnMd+AfH1LRQZpv8D/Fkw/
	 bybDniU4gN5GfVtkO3Sblm8CgQCdd7+BkXgxurow=
Received: from [192.168.13.5] (pool-108-27-76-52.nycmny.fios.verizon.net [108.27.76.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 3B02FE1E52;
	Thu, 12 Nov 2026 16:44:31 +0000 (UTC)
Message-ID: <9a26c741-6217-4155-a3dc-e34b4015f71c@aosc.io>
Date: Fri, 13 Nov 2026 00:44:27 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neko <neko205@aosc.io>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Redmi G 2022 (TM2135)
 quirk
To: Yun Wang <7z0423arsenova@proton.me>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mingyou Chen <qby140326@gmail.com>, Ilya Gladyshev
 <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 Chris Taraszka <chris@miget.com>, kexybiscuit@aosc.io, jeffbai@aosc.io
References: <20261106143114.95008-1-7z0423arsenova@proton.me>
In-Reply-To: <20261106143114.95008-1-7z0423arsenova@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 10762400EE
X-Spamd-Result: default: False [-0.30 / 10.00];
	R_SPF_ALLOW(-0.10)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	R_DKIM_ALLOW(-0.10)[aosc.io:s=default];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.38.0.0/16, country:FR];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[aosc.io,quarantine];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_DKIM_ALIGNED(0.00)[strict];
	RCVD_TLS_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linux.dev,gmx.de,miget.com,aosc.io];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[aosc.io:+]
X-Rspamd-Action: no action
X-Rspamd-Server: nf2.mymailcheap.com

Hi Yun,

在 2026/11/6 22:33, Yun Wang 写道:
> The Redmi G 2022 (board TM2135, BIOS RMGAD6T0P1313) implements only
> three modes: 0x02 for quiet, 0x01 for balanced and 0x03 for performance.
> The default profile table maps balanced to 0x00, but this firmware
> recognizes it as the performance mode. Because the firmware does not
> implement the AC adapter type query, setting balanced-performance or
> performance fails with -ENODATA.
> 
> Add a DMI entry with a three-entry profile table for this model and
> enable skip_ac_type_check. 0x04 is not used for performance: writing it
> succeeds and the value reads back as 0x04, but in three test runs on
> 7.2.11 the firmware did not emit WMI event 0x16, which it emits after
> every other mode change. The Fn+K hotkey also cycles only through the
> three modes above.
> 
> Tested on this machine with this patch and the series it depends on,
> built as an out-of-tree module and loaded on a 7.2.14 kernel. Writing
> low-power, balanced, and performance succeeds, the profile reads back
> correctly, and the firmware emits one 0x16 event for each (values 2, 1,
> and 3). Writing balanced-performance is rejected, and Fn+K cycles
> through low-power, balanced, and performance.
> 
> Claude Code (claude-opus-5-5) analyzed the ACPI tables, wrote the test
> scripts, specified the change and corrected this changelog. I wrote the
> code and the changelog and ran the tests on this machine.
> 
> Link: https://lore.kernel.org/platform-driver-x86/OT2JfRLDi6yHShYvywRZoFBYdW-TUgdKqKtahRM5b0cZxNo6eGZHnO5dKf4oYFaEtZhEsqU-Q-2OFe0D-qToJMVUrS5_d2aa2Q5LD50ISIc=@proton.me/
> Link: https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKyZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=@proton.me/
> Suggested-by: Mingyou Chen <qby140326@gmail.com>
> Signed-off-by: Yun Wang <7z0423arsenova@proton.me>

I have tested this patch on my Redmi G 2022 (board model TM2135) and 
have confirmed that I can now switch between "performance", "balanced", 
and "power-saver" power profiles via the KDE power manager tray.

Stress testing with s-tui also shows different power draw under 
different profiles.

Tested-by: Yu Pan <neko205@aosc.io>
