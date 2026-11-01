Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793543208;
	b=rh2e/yeyqYbWL57MONBas6HeyRLg6Tk1BRso4/4S3QrfMZj1TUH7gsXvHYGlAADiJ9JO
	 8efPXzidSbmnJoyqT/GMEIYwBRP1nJ9VhEsRxoKIBGDRGEMiPZrPZBMqbBcAkpaLz6DHl
	 WsdvrrdqLRQeQ8BaqcXh1HG0qJ+Qx43ntI6jAFoL5ATUGFW8gYkuOMZsEZdQj6j/7lCz+
	 /yMh9yjeTMql9pHXPtNpHxqCdrWDmFN5Tce21XyMwqjveMylThncyeESbfqFGztWbODW4
	 d40SGBzulsBG71/pEx/idbX0vLthkCBKsJCZbt5Ml2u3Ut5xMzm1Y8AI2wq/OVVT8pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VSMhtPmYj28P/PYH23LQ0LHJkDrgHurxFkaRZSD9+Uk=;
	b=tgcgz0ZK9KBBXxfK4q2mldn5HRoeaTbobbaMINho3swcTwdZqRGyg6f1zCFZ3oDDjnuw
	 Da6+bCoXeBTo4fe5MhfCVqBQ7AaswYl7OAFRe/Hf0cdUzDAbWBgUskUWtX/FkYZHnJNEF
	 wetK5shNoBJx9fBD6aG0DnAnORPL11Lou3Zvm8+NO8FKgeVsH7QAjwKhaz5DtBMttSxek
	 OI7n2bWyt5vfOx5o4WcxiGX1wLuBoBhCcVhhR/JuSSrcNT+5EgdKn5ywVXKAhTFBGmnJO
	 yLFeUgeceiC3pMO3RX0VuXKgR0IZVpeSvuugjvzVsny0Pwv2MAXVe80HZQzd6loxGYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b="SG2s/tPP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA642606A324
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 14:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA642606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=SG2s/tPP
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-703be215729so1047392eaf.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 06:26:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793543207; cv=none;
        d=google.com; s=arc-20260327;
        b=PeJd3QqWZ4ZDJ1XOGr72yJUFCpL/aMJ4gtjEShp4hErk5io/YGxjHReqo0SCY5/bU3
         Kkn4gfdcGN6PjjrOEKhOXncFpbsXiUBdEu3g1cw9bo48NCoALXIr0BGg96tGJr1OSBIo
         glZzm7EnFt/YgKEFS2Su8ty9N2j5RwF0P3mEJwR9RPmvrtZSHCik6mUMIB0KKIAchX4k
         Ui7t22PP59IN0QkkmUQfs6NtSPecXeCe/zU8sAaVXp8lScmCOeAd3p+mc/Mmd6sVVRY7
         h6HPZigdTeHIoikCvcvwJRWQbeyNpDUVudZ7D1A2lYsTYroLCkBOExsYPqtBHpRLaUp/
         IlqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VSMhtPmYj28P/PYH23LQ0LHJkDrgHurxFkaRZSD9+Uk=;
        fh=Oq0FEzrNxP3puOAwtc60vuaouLMTK55c2ggD1Oy9MPw=;
        b=dFEQedVRr+dqiGyTZCJ4qRQoEHSanhdySP3+IenGFR/yQEDhemc3CdP4w+FCADU2Rs
         iaXWvZJA1BEleZ6zppPxVvi1KlvpX3frXWlU4oWHAzAxZphDJkeYZ3hQNOSZ9MlJgalm
         Ke5bb20gl5n99O5eYRFRJscPVvw4kKldELZ53301KpT2I8F+Cs5Npa9333NGQfoWaLPj
         cuGkK6lTxEhw+tHzQHjzuhF5Bqa3OjBZ4aWDzHAzQobA/7MVI4ozvoAZSf+g+UBCnGvb
         JC578gCcPoPbA/Ega0VM4nfDQtWjG8ky2SEDQ7ty9JXuezb2bau5hhZ4454azcicqKQD
         YU0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793543207; x=1794148007; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSMhtPmYj28P/PYH23LQ0LHJkDrgHurxFkaRZSD9+Uk=;
        b=SG2s/tPP98PWmeaftY02H/z8zD336YrdgSY6n52NWltggx38Twlo9JM7IP4P5qLgob
         U8fQTxsqlqlYBPLj6JO1qUQd68MY7OI5ytFCMzlNOKpWCcoEOKv3rHBL3UO2RdkvO8lh
         5J4iTDpsh37P/T7IyWypweeAgYvBzSXVwtALo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543207; x=1794148007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VSMhtPmYj28P/PYH23LQ0LHJkDrgHurxFkaRZSD9+Uk=;
        b=bsQS7PgPPQbR8CLjqtW/jLDcUPr3BfVor6482Kt4HcGttdXEK8qb2A8RnOcPzVc0pT
         RTF5ioF1SVTS3RImSDfMY2ZFrZfZ2EaK2Q5p0L+Xcu4aFkKqcD6FSQycJZFwXcbHGUJP
         suJ5pOUE7rZ3u93g9EKNhiDXyqUiCx6GSHnZyohyaIBpMCkpqkKk0RdeaVGv2ExqPAk9
         fOKUoLFrRNPl5cfSaSaKuA3TaZ4HX2c3Dh0Zb+JFcEzDR+SWxhmvVjbVepV3IbR2cbXm
         U2BlpLXjy7BnFSBfgS0VuepYQDqlxpfOM15B0eBXNWZXUkGOYS89Hnj+t1uxu/7PoR2P
         2nvQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8zvPzv8bQeXtQp0eMnP3puKm0crhpQjmI1qMSBzNq/8duKOHsw2Z9bJ7HLDNYs6PEl6sBhzE9bcxmfYCI44TgSg6t@vger.kernel.org
X-Gm-Message-State: AFq9FYLyQ4L9WG9/9Fk1npxzEKsXLZEkbi9rOBsCIQcL6xEu5qF3+k1m
	rwu2PSQeUZgWDebJjUWA81W3Uvi1IWIaQddnqujThantcwRnYeY98JvlY1eEHzTtSG12MPZ3hLy
	hUBCNVvx0mwl/ppKSJrbMRXYRb4cfW333b0Wql8UoNQ==
X-Gm-Gg: AYBFou2rcn/eWfexLnaG1SfrC+AjWdjvfdedDGOoP9NSuM37E36oK+TrJPFJodsn8cd
	VkUNFwKhOXEBP4GZRzyUmOAs1ecjGhoOe63V8roOInBJHVtGdwnaHfzKdmhAyZ6pl/TYSapkBQ+
	HpYTawNOHVmRA9X/5T7VlBK5e01XhLxwAjLktx70888F2xLHMG7x8RBB9bdmn2C3+V5FWn1iuOS
	GF0JG7bb/lQ59to9Ei64iETeYGBuTSnfIm5Ak5KNXTld7BRA18w5e22Pd8UPvNxqA1mmLlFjvfr
	qZt9xV4dVl/iopjRly1P4KywZOjsdXafQt8NrKcUoap1sT1f2Uyi6pg/Qbq/1tP6j+0zLYuCHCE
	tB4mIWBysauXKY6tudqQEPKSlTP3Jgm80Jy/S3j8iQ3zI6MbcpTn8qqmW95jnR0jTBOuGQf4OAI
	1PYs+YFamu3pQiypNpDDKkGL1qaulpwf7Vra1rJkxxu4L/XmE=
X-Received: by 2002:a05:6820:828:b0:70d:77b7:686b with SMTP id
 006d021491bc7-714f29bd919mr3821168eaf.40.1793543206773; Sun, 01 Nov 2026
 06:26:46 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026102101.224568-1-qby140326@gmail.com> <073e6aaa-12dd-4fc1-b7dd-4d27cb4e27b6@kernel.org>
 <CAAcRvKNvBKwVcPQ6vv-+OGZdL2Gxd-ocNyvZO_q-g083QNfR5w@mail.gmail.com>
 <f2dd98be-0551-4857-93c7-59ffad1d3e88@kernel.org> <CAAcRvKNYkXr+eor3JAYwO17vckeVAmYT+Dp+-wMobMmL40ukBg@mail.gmail.com>
 <fc016bc8-bc6e-47ed-a85e-891e522c3f24@kernel.org>
In-Reply-To: <fc016bc8-bc6e-47ed-a85e-891e522c3f24@kernel.org>
From: Chris Taraszka <chris@miget.com>
Date: Sun, 1 Nov 2026 15:26:32 +0100
X-Gm-Features: AclHuK-Zww_1hrg6V7YRypD6x2MCAdLGuHMa1GKcWFVyTX7OCr-uEhqE7nFiPjc
Message-ID: <CAAcRvKMdHPUNuG6Zd4g=M2settZ609-oZG6P_PMRk5xL3jRfoQ@mail.gmail.com>
Subject: Re: [PATCH v14 RESEND 0/6] Merge redmi-wmi into bitland-mifs-wmi
To: Hans de Goede <hansg@kernel.org>
Cc: Mingyou Chen <qby140326@gmail.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
	platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
	Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org, 
	Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>, 
	powerfullz <wleizc7319@gmail.com>, =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>, 
	=?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe <i@rsplwe.com>, 
	Bozhen Peng <bozhenpeng93@gmail.com>, Anton Karasev <uselessfire@gmail.com>, 
	Jame Jao <jaojame6@gmail.com>, Serhiy Shliapuhin <shlyapugin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026, Hans de Goede wrote:
> Hmm, so does Fn+space work under Windows ? If it works there, then there
> must be some way to make it work under Linux...

Not on this install. Xiaomi PC Manager fails to start here, and without
it Fn+Space does nothing under Windows either, so I cannot tell how it
works with the vendor software running.

> Ok, so the value-low indicates the state of the LED, right ?

Yes, inverted: value_low is the firmware's "mic on" state, so 1 means
LED off and 0 means LED on. The firmware builds it from the EC field
MIUT (EC 0x17 bit 4), which drives the LED: MIUT=1 turns it on.

> Interesting. Is there someway to manually toggle the LED like we do on
> other laptops, so that we can actually sync it to the alsa-mixer
> mic-mute state ?

Yes. WMAA has a SET for it: function 0x0A with sub-function (FUN3) 0x05,
where FUN4 = 1 means mic on (LED off) and any other value means muted
(LED on). The matching GET returns the same 1/0 state. I checked the
LED side by writing MIUT directly, which switches the LED on and off
without any event. The WMI SET itself I have only read in the SSDT so
far.

One catch: after the SET the firmware sleeps 150 ms and raises event
0x21 itself. So the driver has to ignore that echo, otherwise it
reports KEY_MICMUTE again and userspace toggles the mute back.

A key press toggles MIUT in the EC before the event is sent. So today,
pressing the key while the LED is on turns the LED off while userspace
mutes, which is exactly the desync you described.

If an LED class device with the audio-micmute trigger is how you would
like this done, I can do that on top of the TM2424 patches, together
with the Fn+K one.

On Wed, 28 Oct 2026, Mingyou Chen wrote:
> I think different models have different behaviors on this.
> Should we add a quirk item?

I think so. On the TM2424, 0x28 is the Fn+K request and the firmware
does not change the mode itself, while 0x16 on other models was
described in this thread as reporting a change that already happened.
A quirk flag for "0x28 requests a profile cycle" keeps it to models
where that has been checked. I will add it with the Fn+K patch.

Thanks,
Chris
