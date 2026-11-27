Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795786237;
	b=V1qvhg7DWBKYv2B3V+HssWXBEIH4qSVK+Rt/TQw6HQYZ44VonFAHMNz3B69apAfkfbiu
	 I1YcubIBK0FaK0kBWVZdijzLexCiCyAGKiE9XbLbZgSgD4fE4W0Xr1+jf5N4ws6SUYk67
	 czl0yKu2suWiXprKkQu2yIN6V2GGHV5DBUHiXvxyYO60dudPRXhUUS81tYLyM9QhZWchH
	 nVxT2CD+IgEpMxk0WxRpE7TXOC5aXzbdyv+2Ms9af2qyksfuDzngYqy/ybD9eatPAcfg3
	 O6pEuUOWPweSPYnQMOhLiCJX9LVywe14TWsqbvJBbQ4g2+nXGAmUxwLqZ2AB4Ph23tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786237;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=nPGTWrYZUtA6BZuh+wiLhpAh7CV60j0At2N6zzUUEOM=;
	b=rsFmeSycd83SSF3xFLK+gmsO1CNDrwawWMFxN32DUttOZ7x4CHJ30PBIfSTZwmIw/dLB
	 Ts/o+EP9dM0anqSIq3Zta5feGUjo4EwNvT1+pbxM7smTPWcQMGoqwOzERQVFdKfdes9wp
	 MZBlvOgFIYtLYiQeG2g+dKbMyVlCOtCTdWm9YRvWRc0w97aWyLu92iYQPD7mCQ0+TLLif
	 3wHPq1Xs1gW9bqrnbYox3rPKYC6hDvGToCJf3lJV8Sr5gHp7oPA2Pr4UeNdsdKEnZXTIS
	 6e8treY9j9XuhaX4unRdbJHzVLYllHryuHRE85s92/1hmOEuGX7mQmM87Qg0X4+iIeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=budjLwHz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C3A606A336;
	Fri, 27 Nov 2026 13:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C3A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=budjLwHz
ARC-Seal: i=1; a=rsa-sha256; t=1795786215; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kx6V3RXNRu4oinmMudDUyahfTGY477ZddjkK4aAMxAyCyVB8JpN3ZyfpSSUQ+wYqAEcScirkRR7wAimiFqIyNc9NdH9SYIsr2mNp/00MATXE3F04sfO9nicbsYq+VsKgOxsLVqBu11Tf16mqZiZAB2FckHvXHyHsVXB4gXoYR/w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795786215; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nPGTWrYZUtA6BZuh+wiLhpAh7CV60j0At2N6zzUUEOM=; 
	b=AUsj29NGcBXMu71K8dOc6/aQdhT+fjl7Iwz3a7fLPB/bxEWsZ154M9CW2/03GgcvSh6cDX0/RpXOdp6snWgFTeKFbDYy9+4x15gqU24vc5O+UBcZfnQNkIPbId57xP8mcem6ICz8ELrl/DXXgIFXgywzVvh0fvfpwhfMFzFQG6Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=budjLwHzh4iUUcl+0g/3mhgOy4ucbA4NA4mtN0FijtyfAAgTKQynIhrjH9Zv0ZHRbAucfC41eIRxLK2ANxYDblIUGZSUUHbmi4lbasnBcyWP/e4HSSwSi7K/Oxgoo2w+WReGoV3TaUXUSgUCZZfi3z8XTd3JFuADbrziDEX2+0r4lo9MQQ04RNKf8Kn1dUFBoNh2kYzg+u9LAvbXb2f9vHTp4loD2PGGYzBhpMjR1kZT/Sm6qKY+yc23XyZ3LkvvS+ceuEzhYZDS+PjBIONn5WhDPSKc8zEFOTkTYhTK9PSw+SiZb+r8680tzGmZ00pNXqcVTlkDshkwR/2czWRbOA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=nPGTWrYZUtA6BZuh+wiLhpAh7CV60j0At2N6zzUUEOM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795786212668151.25235551005665;
	Fri, 27 Nov 2026 05:30:12 -0800 (PST)
Message-ID: <4bf35b5511056fb224c5be7aacbd182b0841ac4e.camel@rong.moe>
Subject: Re: [PATCH 0/8] platform/x86: thinkpad_acpi: clean up hotkey
 polling and locking
From: Rong Zhang <i@rong.moe>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Henrique de Moraes
 Holschuh	 <hmh@hmh.eng.br>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark"	 <derekjohn.clark@gmail.com>, Hans de Goede
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, 	linux-kernel@vger.kernel.org
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 21:25:03 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-4 
X-ZohoMailClient: External

Hi Dmitry,

Thanks for working on this.

On Wed, 2026-11-25 at 15:11 -0800, Dmitry Torokhov wrote:
> This series fixes a kthread lifecycle bug and cleans up hotkey NVRAM
> polling setup and locking in thinkpad_acpi:
>=20
> - Remove the unsafe early return on TPACPI_LIFE_EXITING in
>   hotkey_kthread() so kthread_stop() never races with kthread exit.
> - Drop the dead -ENXIO check on hotkey_mask_set() in hotkey_init().
> - Drop obsolete tpacpi_lifecycle checks from hotkey_inputdev_open() and
>   hotkey_inputdev_close(), fold hotkey_poll_setup() calls into existing
>   hotkey_mutex critical sections, and remove hotkey_poll_setup_safe().
> - Call hotkey_poll_setup() in hotkey_user_mask_set() so that runtime
>   hotkey mask updates via /proc/acpi/ibm/hotkey also start or stop the
>   NVRAM polling thread.
> - Replace the HOTKEY_CONFIG_CRITICAL_START/END macros and manual
>   hotkey_thread_data_mutex lock/unlock calls with scoped_guard().
> - Convert hotkey_thread_data_mutex to a spinlock.
> - Remove the unused hotkey_poll_active bitfield from tp_features.
> - Drop the redundant tpacpi_inputdev->dev.parent assignment in
>   tpacpi_pdriver_probe().
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

The series LGTM, thus:

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> ---
> Dmitry Torokhov (8):
>       platform/x86: thinkpad_acpi: remove early exit in hotkey_kthread()
>       platform/x86: thinkpad_acpi: drop dead -ENXIO check in hotkey_init(=
)
>       platform/x86: thinkpad_acpi: simplify hotkey open/close and poll se=
tup
>       platform/x86: thinkpad_acpi: update polling state in hotkey_user_ma=
sk_set()
>       platform/x86: thinkpad_acpi: use scoped_guard() for hotkey config l=
ocking
>       platform/x86: thinkpad_acpi: convert hotkey_thread_data_mutex to a =
spinlock
>       platform/x86: thinkpad_acpi: remove unused hotkey_poll_active flag
>       platform/x86: thinkpad_acpi: drop redundant input device parent ass=
ignment
>=20
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 148 ++++++++++------------=
------
>  1 file changed, 52 insertions(+), 96 deletions(-)
> ---
> base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
> change-id: 20260930-thinkpad-acpi-hotkey-poll-6c5e037cbf3c
>=20
> Thanks.
