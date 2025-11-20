Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A00B31C584;
	Thu, 20 Nov 2025 20:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763671973; cv=none; b=AldMD5P5356g3ThMbZtqt2dUTuPdVEmszxATVk8PjBS+iARHTVzDSyzI9i6eWQdy80/GXRXJO05XP1inAWwXjz6rB5ki4ddlwd8vNe5OCDxgosPhrbyH5mbr4nr9bxmNGynqVc82EMyF9MqaqYpSN0JEyVyO7RMSNVPkves52/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763671973; c=relaxed/simple;
	bh=Ta7N+z0xqXoo+HgaH3QCw1/k7fxC2995khX/d/GoGPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r5V9td1O5aRyfjEPeiGOXZxzwUL89+BBTt5mlSqEC1ugQIVB74lTDvWj1rG9OJhbQ4QSFuB3MODb2jTUpeb82byoVII6Wts7Xe1/tg1d2lBpKfMtpnzuFuh0vfEGhS50MXO2Diptno4Nt28afr0UO9diQz4RHHTD8nVouii2un4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=FNkHvkeP; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="FNkHvkeP"
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 9DF3C2FC0055;
	Thu, 20 Nov 2025 21:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763671961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ZxSkw/bQ2wleEMCJAYh/kpS23Nd9mQCZU/NOgFiU9g=;
	b=FNkHvkePHGxuvGWXxCm/Fg06HEwCnAcA1onBk/R6a0mVHuAShn4jjir/lUKdjUEkVpuF0N
	OkHDuZjuEafPS9BjeQsiGVBC79rdsxMHtbeRzT1yOBpoOsoyPiqCKR00t4FY3fGhjLH2pj
	sY2feRmbZlKzT2SCl1ts8b5Pgrf7cr8=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <2af6c03d-b448-4da9-88aa-dbcb2d1e67f2@tuxedocomputers.com>
Date: Thu, 20 Nov 2025 21:52:40 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] platform/x86/uniwill: Handle more WMI events
 required for TUXEDO devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251118150839.55336-1-wse@tuxedocomputers.com>
 <20251118150839.55336-2-wse@tuxedocomputers.com>
 <69819b2c-9deb-481b-b404-fc6523c87a3f@tuxedocomputers.com>
 <2b7d8dca-b476-19c8-0bfb-7f3c0ccd2323@linux.intel.com>
 <ecc8e175-af33-4607-a720-5c380f7b5622@tuxedocomputers.com>
 <ed4d19d3-a438-4e0a-9feb-1c62edef46d1@tuxedocomputers.com>
 <cd10630c-cfc3-4462-0ff4-0554e9ddb596@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <cd10630c-cfc3-4462-0ff4-0554e9ddb596@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 20.11.25 um 17:31 schrieb Ilpo Järvinen:
> On Thu, 20 Nov 2025, Werner Sembach wrote:
>> Am 20.11.25 um 11:59 schrieb Werner Sembach:
>>> Am 20.11.25 um 11:44 schrieb Ilpo Järvinen:
>>>> On Wed, 19 Nov 2025, Werner Sembach wrote:
>>>>
>>>>> Am 18.11.25 um 16:02 schrieb Werner Sembach:
>>>>>> Handle some more WMI events that are triggered on TUXEDO devices.
>>>> To avoid another round-trip and a version, please write a bit more what
>>>> this is about than extremely vague "some".
>>>>
>>> ofc:
>>>
>>> I tested 3 more devices (InfinityBook 15 Gen9 Intel, Stellaris 16 Gen5 AMD
>>> and Intel) and found that these send additional WMI events that the devices
>>> Armin tested didn't.
>>>
>>> These are: UNIWILL_OSD_MUTE, UNIWILL_OSD_WEBCAM_TOGGLE, and
>>> UNIWILL_OSD_DC_ADAPTER_CHANGED
>>>
>>> I also went through our out-of-tree driver where additional WMI events are
>>> bound: UNIWILL_OSD_RADIOON, UNIWILL_OSD_RADIOOFF, and
>>> UNIWILL_OSD_KB_LED_LEVEL*
>>>
>>> While I don't know which devices exactly use them, at least one device does,
>>> otherwise we wouldn't have them there. Also I don't see any harm in binding
>>> them, so I did.
>> Forgot the most important part: Why i bound them even when some are just
>> ignored: This avoids warning spam in dmesg about unbound events.
> Hi Werner,
>
> I've actually no problem with the diff itself :-) but what I want is us
> to explain what we're doing in the changelog text. E.g., if you add code
> ignore something to avoid warning spam, please state that in the
> changelog (not just "handle" which is actually quite different than
> "ignore" if we start to really go into language details, yeah,
> "ignoring" is kind of "handling" too but must less precise, I think you
> get the point).
>
> Some things can be read from the patch itself, but it usually means more
> work and we rarely can infer motivations behind any non-trivial change so
> it's always useful to record such otherwise hidden details to the
> changelog. Nobody is perfect in this, I don't expect that, but please try
> to avoid vague expressions when writing the description.
>
> Stating why they're ignored (beyond just warning spam itself) is even
> better when e.g. you know something else handles the same
> event already. But it's understandable if you don't always know such
> details which itself might be useful knowledge for somebody wanting to
> change the code later (was something done on purpose or just because
> we did not know better at that time? is often what I'm left to ponder
> after reading a change from history, if changelog doesn't give that
> detail, I'll haveto guess and hope for the best).
>
> In general, if somebody asks about some detail from a submitter, it's
> worth to stop to consider if it's something should be added to the
> changelog (when no change to the diff itself is asked). It could point out
> something in the change that is not obvious enough. We're not writing
> these changelogs just for the people around now but also for the people
> that come after us (and might only see the change from the commit history
> as there's no guarantee any of us will be there then and/or doesn't
> remember anyway).
>
> That also means if I don't seem to be directly asking a question, I
> usually don't expect email reply (other than in a form of a new version of
> the patch that addresses the feedback :-)).
Ah sorry i misunderstood your "To avoid another round-trip and a version, please 
write a bit more what

this is about than extremely vague "some"."

Ok will give more details in the patch description, v3 incoming.

Best regards and thanks for being patient with my mistakes,

Werner

>
