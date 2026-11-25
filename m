Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581575;
	b=p5jhR9py1Xe7V3jCnyofVPN//yPrfPrwjs+lIpWrdX6LONPu/FWCJ88dMjkjcRlGVCpM
	 0CSm9aGY3XhNeSfKv2r0t71DUGov3nks6/uErP7cZuYbQL/l21ZQGIseKkqlkl6zz9nqG
	 FoUSZE58C1wWw4OLKpofnaJx8h8CVT4PYE/S9pWfBzka/MiDH+qm0nMzbFK3Lm3apRiMm
	 CUvUOcXBa8v/FXTzS1wqo+qhXYKcDA+siTC7z4LJEKTAyDt5S3znjlpmEH4UuKXSZh9od
	 8kKZpHuP5Qp7VPYtzIisetCAv6wLqArbEzh0JGQMFwMKFhRyCZD4B+Ta02dqvy5qx7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581575;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=fMZ7lRXEHR7EUwCxUlnL1wD1t+cuPsYhKC030vqE+YE=;
	b=EVxdFqHlE5TqFrYvpR2P2h2gc5G7ro8gerzRkwCpjBkipISGhC71dLBmNDBFGdHW28B6
	 e6A+74rPGFfPA3x+mpHW6NHvsmu0TeoagyEqTIFlvP1Aq6JpUw+au35Cmp72S5KNys9rD
	 7RgfWFveqStw25+j3XUruE0s1KSaM8BHa4S48tZN8ZSYOCq1hyKqJeuy3ISPYesYpcOI0
	 LwgJ5GkdwV+vlyNupyO/nu+CFUuCUgCtro2WXSGMZFlGD2v0DYE84sfMEygLemGyzhLtD
	 UbUQ2ONpj766CG6knyYS9T9GVKQRx0ghW35rUfZfStk10OGoc8ofDrqk5yNt50C6gBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=a5+6Usgk;
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBD3606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 04:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCBD3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=a5+6Usgk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795581572; x=1795840772;
	bh=fMZ7lRXEHR7EUwCxUlnL1wD1t+cuPsYhKC030vqE+YE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=a5+6UsgkAneQAsP+lI/bDnxDQdFW+JBO4yBBcZfAcXDG/vSggZ3iMgYV85i55hpz3
	 NOHgiRDaeL1hr+RlMQM7bwM5rP5hjMMI1zwvLec3gBXKnrl4m8SU3oLLb8l3dCby0L
	 bT/ZK4tA8k96UKC/vmN7+bPKDUy78hQlZnLcRa8x6ul3wncHMnCXq8f5PekvFOogod
	 YL0eEdGN6t3zj0ZNartAmEpVpdkJnebpM6tBcUIqem6xgwxjBAqOfZD1kaelSP3Gjw
	 OdxCBvVoelbPYCx5SoiVGhh9ekgzM1HkJkXKCHj3OP4w6uPCA7xyrNelmslytXsaZu
	 d3obnLPjLQslg==
Date: Wed, 25 Nov 2026 04:39:26 +0000
To: Fuwei Xie <12313607@mail.sustech.edu.cn>
From: =?utf-8?Q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Cc: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Zheng Shuyang <yhshzh0@gmail.com>
Subject: Re: [RFC PATCH v3 0/5] platform/x86: huawei-wmi: expose native firmware power profiles
Message-ID: <hCsVvRfdJna6QMofi0p51idPd_JLLislzGzqFjePf9_91ayfS92LIselCT-narFk2u5zTRqLQsKFnz4bgRrNmjY5EKgq9UYj0n_CfmaCJjs=@protonmail.com>
In-Reply-To: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn>
References: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn>
Feedback-ID: 19860221:user:proton
X-Pm-Message-ID: b26fba8859e31b4dfe3c167fb5937d8f736cd6d9
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Fuwei,

Thanks for keeping the charge-mode patch in mind. I tried rebasing it
onto v3 to see how the two fit together. Updating the calls for the new
huawei_wmi_cmd() signature is straightforward, but two of v3's changes
still compile fine and change what the charge-mode code does:

- huawei_wmi_cmd() now returns the number of data bytes on success, but
  huawei_wmi_charge_mode_get() still does "if (err) return err;". With
  only the calls updated, every successful \GBCM call would come back
  as an error (a positive length), so probe would leave
  charge_mode_available false and the driver would quietly fall back to
  \SBTT, which is the bug the patch fixes.

- The reply no longer starts with the status byte, so the mode and the
  parameter move from ret[1]/ret[2] to data[0]/data[1].

With patch 4 the callers hold wmi_lock, so I also took the lock once in
huawei_wmi_charge_mode_set() around both the \GBCM read and the \SBCM
write. The getter ends up as:

static int huawei_wmi_charge_mode_get(struct huawei_wmi *huawei, u8 *mode, =
u8 *param)
{
=09u8 data[0xff];
=09int len;

=09len =3D huawei_wmi_cmd(huawei, BATTERY_CHARGE_MODE_GET, data, sizeof(dat=
a));
=09if (len < 0)
=09=09return len;
=09if (len < 2)
=09=09return -ENODATA;

=09if (mode)
=09=09*mode =3D data[0];
=09if (param)
=09=09*param =3D data[1];

=09return 0;
}

With that, the charge-mode patch plus your five patches on top of the
current for-next (61c0dac952b9) build cleanly in-tree with W=3D1 and
sparse. I haven't run the combination on the CREM-WXX9 yet. I'm happy
to send the whole rebased diff if it saves you time.

Ilpo, since Fuwei plans to rebase on top of the charge-mode patch,
would it work for you to take that one first? It still applies cleanly
to for-next.

I used Claude to work through the rebase and to draft
this reply, I checked both.

Thanks,
Eren

