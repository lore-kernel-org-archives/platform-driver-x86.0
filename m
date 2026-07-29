Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F0832B10A;
	Wed, 29 Jul 2026 07:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785310346; cv=none; b=JXPAqI5QNPe9XaQZtVahQat4SGqgvzlpqkiKukNCIMEmfMNWROLSzReZDiCnY4gH4QRDYpM9ePtYcGMiDjL/AM9NS4EDc/laqVI/i9XuMITQdaKrahuev/RcoI1fZQNpEFfnC4eickntZ9SUp0dDxp+S/cULcfaVl+A0wIRywhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785310346; c=relaxed/simple;
	bh=VPHGTDg6nXRE6OIhpuuGA1XYqHSSrBxy9rYUmqukZZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dXxNrKt1QcB8pqESB52uQuZkxnbdDb3/q5MUPU7EPyxCJmvg1zBqbqjKVmQUSQvHaV4sbmXyIV3HvmcaLzR9FrFgNnLw/atYANpf1hZM6lq3B5JFh6l6kni6+7CUhTdsqRYVU861VfTY1TPDAFO/ZmIYHboIsW9MnXa440Lp96E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RN5XYHrh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RN5XYHrh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188C71F000E9;
	Wed, 29 Jul 2026 07:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785310331;
	bh=vb8mdw3c3pt9DF9acmr2o9LCi54eO3+RkzDU6juenvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RN5XYHrhBn8G3SkoGYh3sHItVH/EaIPpaCQ7eHL9vdA0R1QxSCQm5Sgl5CqKsOLIq
	 DOfYpicfbHFznQYkD0PICMU6V0sJivBOA+NKzU9RcSVxp+YrTFF1DfqAAShrB6RXlE
	 WliiAvJd/1RfLIpaKKHHPDel+clyyfdRWrcp8QSj7YZBkEkTMjkuV97ANJFIyag6eu
	 4XMca4JIAEyeZQ5er3CR09pKcOTugrCOi7NtSon6g1TGnz30YHmCZdMKCCMjvLwK78
	 ei/RvWVXCwdi/ocHfv3HQyWQr1OrZArpRNe8SiAM2CZHlXHUC3wGXcS26rg0bW5x+R
	 YjCFc8f2UfDJA==
Message-ID: <846ca0a3-bd37-4424-aa95-6ab255f48a48@kernel.org>
Date: Wed, 29 Jul 2026 09:32:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: asus-armoury: add Whisper Mode support
To: Marco Scardovi <scardracs@disroot.org>,
 platform-driver-x86@vger.kernel.org
Cc: luke@ljones.dev, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 denis.benato@linux.dev, linux-kernel@vger.kernel.org
References: <20260728071843.130492-1-scardracs@disroot.org>
 <d88d0945-71e0-4d21-b154-d0d837624858@kernel.org>
 <y0qKqYgBT5Cpfe4BHTFqrA@disroot.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <y0qKqYgBT5Cpfe4BHTFqrA@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Marco,

On 28-Jul-26 15:56, Marco Scardovi wrote:
> In data martedì 28 luglio 2026 13:39:39 Ora legale dell’Europa centrale, Hans 
> de Goede ha scritto:
>> Hi,
>>
>> Thank you for your patch.
>>
>> On 28-Jul-26 09:18, Marco Scardovi wrote:
>>> This series introduces support for ASUS WMI Whisper Mode hardware controls
>>> in the asus-wmi header and asus-armoury driver.
>>>
>>> Background & Findings:
>>> ----------------------
>>> After talking with Denis and thanks to NeuroMarshal reverse engineering
>>> and
>>> firmware trace analysis on modern ASUS laptops, three specific WMI Device
>>> IDs were identified that manage acoustic profiles and thermal regulation
>>> under ASUS Whisper Mode:
>>>
>>> 1. ASUS_WMI_DEVID_WHISPER_MODE (0x0012007A):
>>>    - Controls the BIOS-level Whisper Mode acoustic profile toggle
>>>    (read/write boolean).> 
>>> 2. ASUS_WMI_DEVID_WHISPER_ENABLE (0x00090022):
>>>    - Enables or disables Dynamic Whisper acoustic regulation (read/write
>>>    boolean).> 
>>> 3. ASUS_WMI_DEVID_WHISPER_STATUS (0x00090023):
>>>    - Reports status and allows runtime control over Dynamic Whisper state
>>>    (read/write boolean).
>> I wonder how this interacts with the platform_profile stuff ?
>>
>> I would expect enabling whisper mode to lower the max performance,
>> so does this automatically change the platform_profile away
>> from performance when it is set to performance ?
>>
>> Note the platform_profile API is extensible. To me it seems more
>> logical to expose this as a whisper mode platform-profile ?
>>
>> Regards,
>>
>> Hans
> 
> Hi Hans,
> 
> Thanks for the feedback!
> Here you can find my opinions on your questions.
> 
> 1. Interaction with platform_profile:
> In ASUS laptops, where presents, Whisper Mode operates as an
> independent boolean toggle/feature controlling fan acoustic target limits in
> firmware/EC, rather than acting as a global thermal profile. Setting 
> WHISPER_MODE or WHISPER_ENABLE via WMI sends a direct call to the EC/BIOS, 
> which adjusts acoustic thresholds internally without altering the active 
> platform_profile state (throttle_thermal_policy) in asus-wmi. IIRC on Windows 
> it even permits to "hear" the ambient to make the fans run in a way to blend 
> with the ambient noise.
> 
> 2. platform_profile vs firmware_attributes (asus-armoury):
> platform_profile is designed for mutually exclusive global power/thermal
> modes (Quiet, Balanced, Performance). Whisper Mode, on the other hand, 
> consists of independent BIOS feature toggles (0/1 controls for BIOS Whisper 
> Mode, Dynamic Whisper Enable, and Status).
> Since asus-armoury is dedicated to exposing BIOS/Armoury Crate firmware
> attributes via fw_attributes_class (similar to nv_dynamic_boost,
> nv_temp_target, panel_od, etc.), exposing these three WMI controls as
> sysfs firmware attributes fits the overall design of asus-armoury much
> better than extending platform_profile.
> 
> I hope I've been of help. Feel free to let me know if you have more 
> questions: I'll try to answer the best of my capacities.

Thank you for clarifying things. Since the EC/BIOS interface sees this
as 2 independent settings, I agree that exposing this as a firmware
attr is the best way to expose this.

Its a bit weird that one can select Performance profile and enable
whisper mode at the same time. But if that is how the Asus firmware
interfaces work, then that is how it is.

Regards,

Hans


