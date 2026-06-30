Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335652F8EB8;
	Tue, 30 Jun 2026 21:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853655; cv=none; b=PAaSwsVKGAEpD9QHdTdbCizAcRULsyE2A1/DNBZq1oNyTRSoVhSPNAthmCqZn6Cq5z8CC+aofYXh3G+Eos2ukXEgU/YAouMServPdZcyiz+wC7bTErS3r5mBMtrhazeMEzILWEseyfYut6urJdMoZNIx6FXKtLLkiBnozMkLt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853655; c=relaxed/simple;
	bh=fWosLV7OsEIb4bEIh4VbsKitZXOczLuvRXxAe/bFYOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqUroUifSLv1wpg/5UabneEcMhCCzXkAmDRIfTwgKvqFn82wONcGgYTpNklIqvOQXaVe/+2KpRZcorWN+PKHcSMNiTbSK5IQSlHfYNLN5N40wXHI6oR/fLXIKdH35NrrJ/JJX7/dITpdCw5vViI+xt0JZSo+zCZKUAch1+tOcfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=AFnI1+fV; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="AFnI1+fV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782853647; x=1783458447; i=w_armin@gmx.de;
	bh=5PlfGQ47WxTrLDSxu8xeFXmf7JRHqSn+ddZcajq+y+c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AFnI1+fV0PjrLz6ENxCv4Lu5S1TGRs5g0LpaQIu3iSS0ohrzb5wq91Q3a+bqWmZh
	 2QQ0QLZg2ad1C/FG3Lxbh2ocPosEg/WYcDKLrd3jaY/u24jE5lzJuG7OrUvB3OQy5
	 yS7eBrT3+d3otIadvwcNyKdFGkDbDgBssJ3s+gc7ZZP02XO94zYtkpRC3vXZftY33
	 6hN9LseefiiuYasnZH52sHGu7h9XfgUFpxkiaZT03l9HRVoG0tMQz56k4yG06q+HE
	 ETLrLaX4tdwtC27xo7D+VkyWoWfnI42s0szE0j0mKomb8l5cxFxlV6Im+dtOWRyR1
	 XMZ0mT/Idnsifk3SUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMGNC-1wMb7p2vIM-00IDgD; Tue, 30
 Jun 2026 23:07:27 +0200
Message-ID: <66c11c86-f3cd-4d84-b8fc-9dad3b518b87@gmx.de>
Date: Tue, 30 Jun 2026 23:07:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] platform/x86: redmi-wmi/bitland-mifs-wmi: shared WMI GUID
 ownership
To: Nika Krasnova <nika@nikableh.moe>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>
Cc: Gladyshev Ilya <foxido@foxido.dev>, Mingyou Chen <qby140326@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623235235.28058-1-nika@nikableh.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260623235235.28058-1-nika@nikableh.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:6ohDL3zSxvOIpwY1VckZQvlXaPyZtWyhGAFin1OPswU5yXpbRJg
 uV8G+N59lyvy8zs+HwvqFXEq2FLDDlG08f+pQn9RfRmfBMwt3xuo8MncqG9Ac4l07BBLe+Q
 3NqIhXcrKhpby8wSpwUAiZpCAicBJELYB5a4IJnUeUh2da5akdN1zevt52+RN/IPwBezrry
 yN86z3ZF/Q2v8kONcvlww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:g9t5brvasbo=;vP3uBI1dwvsXuWntsmOwcXoNzle
 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
 iPhyQjKdA=

Am 24.06.26 um 01:48 schrieb Nika Krasnova:

> Hello,
>
> I am adding support for a mic-mute LED to redmi-wmi (a follow-up to the
> keymap patch [1]) and ran into a GUID ownership problem with
> bitland-mifs-wmi.
>
> bitland-mifs-wmi claims two WMI GUIDs in its id_table:
>
>    46C93E13-EE9B-4262-8488-563BCA757FEF  (event device)
>    B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B  (control device)
>
> redmi-wmi already claims the event GUID for its keymap, so the two
> overlap there today, with nothing deciding which one wins. The mic-mute
> LED needs the control device -- the EC mic-mute field sits behind its
> WMAA method -- and bitland-mifs-wmi claims that one too, so my patch
> would extend the overlap to the control GUID as well.
>
> Both drivers set MODULE_DEVICE_TABLE(wmi, ...), so udev autoloads both
> and the device goes to whichever probes first.
>
> The outcome is load-order dependent. Loading bitland-mifs-wmi first, it
> binds *both* devices, and a redmi-wmi loaded afterwards binds nothing:
>
>    $ for d in /sys/bus/wmi/devices/*; do \
>        printf '%s -> %s\n' "$(basename "$d")" \
>          "$(basename "$(readlink "$d/driver")")"; done | column -t
>    ...
>    46C93E13-EE9B-4262-8488-563BCA757FEF-0   ->  bitland-mifs-wmi
>    B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4   ->  bitland-mifs-wmi
>
> In this order redmi-wmi is shut out entirely, including the mic-mute key
> (bitland's keymap has none).
>
> This is a RedmiBook Pro 16 2024 (DMI_SYS_VENDOR "XIAOMI", board TM2309).
> These machines appear to share a common ODM firmware base with
> Bitland's: the same WMI GUIDs are exposed under a different DMI vendor.
> Neither driver inspects DMI, so neither can tell whose machine it is on.
>
> Two complications:
>
> - The control device (B60BFB48) is one multiplexed method (WMAA):
>    mic-mute, keyboard backlight, platform profile and fan all sit behind
>    it as sub-functions. Its features cannot be split between drivers; one
>    driver has to handle all of them.
>
> - The mic-mute LED needs one driver to own *both* devices. The EC
>    reflects an LED write as the very same WMI event as a physical
>    mic-mute key press, so suppressing the self-induced event requires the
>    LED-writing path and the key-event path to share state. A split
>    (control in one driver, event in the other) cannot coordinate it.
>
> So per machine one driver needs to own both devices and provide all the
> features that machine needs. The options I see:
>
>   1. The two are merged into one driver for this ODM platform that owns
>      both GUIDs and DMI-gates the per-brand pieces (keymap, mic-mute
>      LED).
>
>   2. bitland-mifs-wmi gains the Redmi mic-mute key + LED (DMI-gated to
>      XIAOMI), since it already owns both devices and provides the other
>      features here; redmi-wmi would then not bind on these machines.
>
>   3. redmi-wmi becomes the Redmi owner: it absorbs the control-device
>      features (backlight/profile/fan) plus the mic-mute LED, and
>      bitland-mifs-wmi DMI-gates itself out of Redmi hardware.
>
> In cases 2 and 3 the split is enforced by a DMI check in probe,
> returning -ENODEV on a vendor mismatch, so the declining driver yields
> the device to some'ne else. Both sides must gate from the start: once
> the wrong driver binds, the device is -EBUSY for the other and is not
> re-offered.
>
> Mingyou Chen (bitland-mifs-wmi author, CC'd) told me off-list that this
> is a GUID overlap, that his Bitland hardware has no mic-mute key, and
> that he is fine with the mic-mute support living in redmi-wmi.
>
> The mic-mute LED is already implemented and tested on my RedmiBook Pro
> 16. I can send it, and the bitland-mifs-wmi changes, as a proper series
> once we settle on a shape.
>
> This follows up the mic-mute keymap patch [1] and an earlier question
> about the overlap [2].

I think that Bitland also manufactures hardware for Xiaomi, so both drivers
seem to actually control the same hardware.

Because of this i would go with option 1 (merging both drivers into one).

Thanks,
Armin Wolf

>
> [1]: https://lore.kernel.org/all/20260620145928.2156909-1-nika@nikableh.moe/
> [2]: https://lore.kernel.org/all/20260531123345.237521-1-nika@nikableh.moe/
>
