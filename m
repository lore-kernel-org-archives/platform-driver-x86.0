Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C94015442C;
	Mon, 24 Nov 2025 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764009650; cv=none; b=lEiO9UmJli0AEQeHXjJNjR1sTmIL/77XmkU16ZMov78XHD18tZiO0P8W7d53iJorlMeHL91p3qUGQiCTcda4lVsrPihIWIkth86qcztDPRCrADchtMxRh96lN11i7hN+Xs9ioNw+ptMZQsFsbO2PhNNaTkKPK8INN08OZoemQ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764009650; c=relaxed/simple;
	bh=Rp2zFr5deJ5Ksq+5S8eCwvmKbFxqN4regQbgi14qcao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+kofG1rHn3EkZil8LWGZqdHFwZcgYa4GD/ip2F2tyL+upJV7GT9Az9He12mrQ5E6KJDA58ajt3eMcS/5SZMT8eSKjD3LAssRdq0qayrak0wA0tjjlqoBQ7+41/B0XjUC9EBU36g0zKgmR1ePDuLKR2yWEhhCrngZbW/Lv90fhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=ouHm/vJT; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ouHm/vJT"
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 148B22FC004D;
	Mon, 24 Nov 2025 19:40:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764009645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWhdjfbAdbUDmdLNikJjreZbqzsV6+txJDlCbxjGCyc=;
	b=ouHm/vJTQPtYvcnXqBGC78nscTMOgmZYPk1+NIoIFazbZAe/j3gdjXrSWUz85nHVgSD7oD
	TtuyjecUhGh+EXm2n5LQFctgkHDIF9SXOCMyNtgkkNzNXILBxL9gdQmXlprGmU1XkaOOsc
	t2W+rAaPApTQqa+zojK3JVjjgvqUaH4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <eb66f09f-6f14-43c9-a319-8f2bc745e055@tuxedocomputers.com>
Date: Mon, 24 Nov 2025 19:40:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] platform/x86/uniwill: Handle more WMI events required
 for TUXEDO devices
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
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
Content-Language: en-US, de-DE
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <f0161676-fde7-4c6f-8774-25d176265716@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Am 20.11.25 um 01:53 schrieb Armin Wolf:
> [snip]
>
> Anyway, i attached the patch with the device descriptor infrastructure. The 
> callback called during probe cannot modify
> the feature bitmap anymore, but i suggest that you simply set the limit for 
> cTGP to zero. The code responsible for
> initializing cTGP support can then check if the cTGP limit is zero and return 
> early. 

Looked into it: whats the reason for the "__ro_after_init" in "static struct 
uniwill_device_descriptor device_descriptor __ro_after_init;"?

The thing Ilpo wrote sounded like just .driver_data itself should be read only, 
but as soon as it has an indirection, like here being copied over to a static 
variable, read/write is ok.

Also: Why not just copy the device_descriptor over to uniwill_data instead of a 
static variable?

And do I get that correctly: All you can do during the init callback is doing 
more sophisticated DMI matching?

Best regards,

Werner

> [snip]
