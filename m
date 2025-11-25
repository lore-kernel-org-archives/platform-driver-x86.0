Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3A41B4F1F;
	Tue, 25 Nov 2025 00:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764031826; cv=none; b=dsN8ArA0c+cZRVShlhxSl1vhSDFQyb15DZGdof9J4RV+nT72d6vUZW2hxOHe6sHixVLJOeROHDMuzMtDCQNCCFXcsfUFQA4ouVY+By5AZp1+3E+bOV1MDUAIxTWx1OS8WieNECh9B9SZeXI9/EXBZJLsAQRLuN9Cb6TX67DQzJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764031826; c=relaxed/simple;
	bh=eHlc19PbjR2vPzpDaWWFNN6n5cZKh7RUMoJnxAAo/WE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t9G9RfcBeV6H/Ke3D9SsSn7DJKolXB/6skKQP9Mu+pa8FyEDykOFGeqmidVlgTK4eSXrt7ecZnT5G4dGghp5fi8/ArttwmsoUTFHbCDiw1hYJV8mVygtqPhd2AyM0M/GD2tSVqRzLvfl1oCT9JBM0zKdNtdIhoYR/o2OmSlq07Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ox6IHZFQ; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ox6IHZFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764031812; x=1764636612; i=w_armin@gmx.de;
	bh=eHlc19PbjR2vPzpDaWWFNN6n5cZKh7RUMoJnxAAo/WE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ox6IHZFQj9btE8TOYRYe5gZXcImHOLa4muIkVTuRw7P6dJY1I4N3jxxPEPiokMu6
	 HjLfTRMWKfTbl6fnfO/GQa6NqHmPv4/D8bUuryTACF6tFf/B3TYGXJpSN7Vi/7y7L
	 +sUB1mSis3xGRyqpLc8GOGcRRMwEqu4jGfNVRh3woZDmBl0PWD0v74cFxDk67GHKy
	 jL363o9LoFpxRmVXAlU7KoxlCcbE8jb1Mh4WkMm9owP1ov2QK7F2XFYcd1/L+hhOn
	 Rxud5xkd0qT2ymO+NX8RCj3ZuLXW2dxBnBrCsNg4ObyMHI7w7ASFHo10hE2nSDDgR
	 +1Wc9wSMaVD8ZAksLg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mkpex-1vppwx12qN-00jpyo; Tue, 25
 Nov 2025 01:50:12 +0100
Message-ID: <ac1e1b1b-68e3-45a0-9e12-440801af7e0f@gmx.de>
Date: Tue, 25 Nov 2025 01:50:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] platform/x86/uniwill: Handle more WMI events required
 for TUXEDO devices
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <20251117132530.32460-3-wse@tuxedocomputers.com>
 <fc1b75ce-113d-4de1-ac98-7616b17f915c@gmx.de>
 <29b24831-92d4-47c6-8daf-7d1879951d43@tuxedocomputers.com>
 <7cd7081f-b138-4548-a9fb-5c4d5165b036@gmx.de>
 <7276b961-8649-4bc0-87f7-a1f06cd4f3ad@tuxedocomputers.com>
 <5b554128-7466-4b34-9020-c0c39572f100@gmx.de>
 <3c075220-79f3-4dff-a760-6fe065147793@tuxedocomputers.com>
 <2d5d88fe-cd54-4311-b5cd-b1c435ff973d@gmx.de>
 <d4c7b31b-1335-47d5-992a-beace78614e5@tuxedocomputers.com>
 <f0161676-fde7-4c6f-8774-25d176265716@gmx.de>
 <eb66f09f-6f14-43c9-a319-8f2bc745e055@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <eb66f09f-6f14-43c9-a319-8f2bc745e055@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:X8rw54j/ZSVUNT6qdaoIInIdil5uuiYCSMBVKlEatsOgtXzcydB
 lPiJB2QTHGN4ergSHnxFc4Ym4vI7bHjsTK5AEPi8KIlEGxyW8yFq0shz4bfdhRFOe8eoYmb
 CgDJiiR3sinrlhsXR4SyZVmRq2+hO06CBtTws1qXKra2cLsGxEWp2ALtZ8uhz7JmEPdXs1q
 xYJXzd9VdqzPsydxo9AIw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lYCDQ4anz1c=;ZENXtJIyTxlzdnpm2kql/G2lURf
 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
 q4y/5pdXk7dtGG2hc=

Am 24.11.25 um 19:40 schrieb Werner Sembach:

> Hi
>
> Am 20.11.25 um 01:53 schrieb Armin Wolf:
>> [snip]
>>
>> Anyway, i attached the patch with the device descriptor=20
>> infrastructure. The callback called during probe cannot modify
>> the feature bitmap anymore, but i suggest that you simply set the=20
>> limit for cTGP to zero. The code responsible for
>> initializing cTGP support can then check if the cTGP limit is zero=20
>> and return early.=20
>
> Looked into it: whats the reason for the "__ro_after_init" in "static=20
> struct uniwill_device_descriptor device_descriptor __ro_after_init;"?
>
__ro_after_init tells the kernel to mark the variables annotated with it a=
s read-only after module initialization has finished.
I used it to ensure that the static device configuration data cannot be (a=
ccidentally) modified after module initialization.

> The thing Ilpo wrote sounded like just .driver_data itself should be=20
> read only, but as soon as it has an indirection, like here being=20
> copied over to a static variable, read/write is ok.

No, the device descriptor needs to be treated as read-only because, theore=
tically, multiple instances of the uniwill-laptop driver might probe.
If one of those instances modifies the descriptor, the other instances mig=
ht run into trouble.

I suggest that in order to dynamically modify the supported_features bitma=
p, you simply copy said variable from the descriptor
into uniwill_data and then use the probe() callback to modify it.

>
> Also: Why not just copy the device_descriptor over to uniwill_data=20
> instead of a static variable?

uniwill_data is not available during module initialization, so we have sto=
re it separately.

>
> And do I get that correctly: All you can do during the init callback=20
> is doing more sophisticated DMI matching?
>
Inside the callback provided dmi_system_id, you indeed can only do more so=
phisticated DMI matching. You should
use the probe() callback inside the descriptor to perform device-specific =
initialization that requires access
to the EC and/or uniwill_data.

Thanks,
Armin Wolf

> Best regards,
>
> Werner
>
>> [snip]
>
