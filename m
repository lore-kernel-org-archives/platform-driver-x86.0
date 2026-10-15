Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192F8599A4A;
	Thu, 15 Oct 2026 20:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096385; cv=none; b=H2MAxhO3qi+MawWUGXtOaNrig4DRruLTJFn/HNZcHwsRRCwgxfmjB2OHeFp3kUWkEU1e+OxDsOBPteWFic0ZBQKXUq8e1DDKiSOpSWLgEqJm7bDgRLv/JVUnakJeKeoCgYkEZsS7UnS77q5G5WtU+DobOzsaxDEqp9Ewd6Bvg0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096385; c=relaxed/simple;
	bh=jQlZM/MPlPUiimhTGa8Hhbi/heWx9TYCWjazoTLE38Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Capdba6HneMopEGm/hMFeD6/4BOzr1xAR39FJ3QDu8UBkXTQC8ziUYRiyFRudvjvI4jG+9Z58urQZR6UBSarQu7IN4uSm8QY/hZKPKFdJCNpjx7Gk/s4ycc86FdmpQUWztZTUOom+trJcjYr0lFvK4/UgAAtumTgl6WtlMtYBuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bPnPD0Zn; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bPnPD0Zn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792096375; x=1792701175; i=w_armin@gmx.de;
	bh=uU8g/jnGTtRIrrtUGQ2UOa23rVlHwa5CkP6EnasN0D4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bPnPD0ZnJ31ZdG8T5QEfPcT8rm77TUtC0w5kDJZTn7CkXXutmnxXe1WnQ8SUQZLa
	 FbMeACGVSGg6VuWkuywMNDcrUGePWUnIYAw6zvkTjT/EZPpgk+x0ZETsGtilMaaJ/
	 lUaPqBahA1AMNoH16CM9m8TN4BtAk3/tozxCmBpp2dk0lnJyc5xYBPaqcNwB5rq96
	 oALv4dceBaxD1at9ERLdQSCMs7HVqfxX8Ze5qgWEFBGQT/GYtHaLi0tkwlzYyIgpP
	 +4+8rPgMPXJ0CiIydpBtWcEuA/Od7wJOiOwfsMkeZU/2MCe/iDwRfc4CJrvOPaQ91
	 64HYZMcGs1bxoBgh8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHAH-1wgRgb3bCt-00qgnA; Thu, 15
 Oct 2026 22:32:54 +0200
Message-ID: <0d076133-2070-4873-9b3b-5b0d9e671ae6@gmx.de>
Date: Thu, 15 Oct 2026 22:32:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] platform/x86: uniwill-laptop: Lightbar fixes
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20261007144101.323289-1-W_Armin@gmx.de>
 <179148110928.29028.17146158167227573018.b4-ty@b4>
 <3a55c989-f16e-40a5-bd2c-201d45c82c85@gmx.de>
 <2a516987-83a4-d703-3226-be216e499b1a@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <2a516987-83a4-d703-3226-be216e499b1a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9QWDhZOEDg+iy9R2/ETnGwd/s+IRzggFNMDYNo84jfonARXlLjp
 idGlYNZL7sl6n6Dl+DXYPGgUQ5ybFZ3IJlk0u3I107rPRugPahFtyRZbxpUdR45vNPViv8W
 lxDMRBbPtrE3cPZxynSi/KjIWkYWftdnQHklYh9A51dxOqqyHJCpMjUi/gQ2t/Z3SPRihAD
 6KXkcCM3NbL58ifwwhZew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NIc6dhM/ykw=;7O7jP6FrmcBeFe3BgNmBFfvO9Dr
 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

Am 15.10.26 um 13:00 schrieb Ilpo J=C3=A4rvinen:

> On Sat, 10 Oct 2026, Armin Wolf wrote:
>
>> Am 08.10.26 um 19:38 schrieb Ilpo J=C3=A4rvinen:
>>
>>> On Wed, 07 Oct 2026 16:38:53 +0200, Armin Wolf wrote:
>>>
>>>> This patch series mainly deals with various issues inside the code
>>>> responsible for controlling the lightbar on supported devices.
>>>>
>>>> The first patch utilizes the improved multicolor LED API to report
>>>> the correct brightness of the lightbar to userspace. The next two
>>>> patches fix issues discovered inside the code for controlling
>>>> animations, while the fourth patch fixes an issue with the naming
>>>> of the LEDs in general. The last patch also adds support for another
>>>> variant of the Intel NUC x15 laptop kit.
>>>>
>>>> [...]
>>> Thank you for your contribution, it has been applied to my local
>>> review-ilpo-next branch. Note it will show up in the public
>>> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
>>> local branch there, which might take a while.
>> Thank you :)
>>
>> I noticed that the LED next branch contains a commit that requires trig=
gers
>> to implement a new callback and prints a warning if this is not the cas=
e.
>>
>> Should i wait till the next cycle to send a patch implementing said cal=
lback
>> or do you want to rebase for-next onto LED next?
> ...Goes to look at the other repo...
>
> I don't want to base on top of other maintainers next branches (or pull
> them into my for-next).
>
> I suppose it might be best to make that addition after -rc1 through
> fixes, or if time permits, already during the merge window in a separate
> PR after the usual for-next PR.
>
> --
>   i.

Ok, i will send the necessary patch when the marge window starts.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>> FYI [if applicable to your patch], as per Linus' policy change, also
>>> fixes are mostly routed through for-next unless the fix is for a
>>> commit introduced in the most recent cycle or is clearly a regression
>>> fix.
>>>
>>> The list of commits applied:
>>> [1/5] platform/x86: uniwill-laptop: Report correct lightbar brightness
>>>         commit: de41d8b4d0dbb81c81cd99c245238d878a3e1951
>>> [2/5] platform/x86: uniwill-laptop: Implement rainbow animation as tri=
gger
>>>         commit: 59e4e406b6c08ad41f3ad86db6d42b82d8539c12
>>> [3/5] platform/x86: uniwill-laptop: Fix breathing animation on Intel Q=
C
>>>         commit: 969a3bfa474e35828e142d0160f393a97d9bf0ee
>>> [4/5] platform/x86: uniwill-laptop: Label multicolor LEDs correctly
>>>         commit: 42e6b269fc1134a3fcce57539034ee496e2c1344
>>> [5/5] platform/x86: uniwill-laptop: Extend support for the Intel NUC x=
15
>>>         commit: 7a159a14ce0f5d5a3c2f835f39986ec5539ae374
>>>
>>> --
>>>    i.
>>>
>>>
