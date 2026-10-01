Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A514ACC68;
	Thu,  1 Oct 2026 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845309; cv=none; b=trMggDkeY6X9BqHkvQ2OyY6UtyGs6avRUKRJTjE2uGXMFv4gBx5RlVZU97wBEGyppQomW+Uc1G2kHsBkZyl6/O+q9JwSQsskE+dAdsMnHRWCra5B45XUxOVgmQoEd/vr0pmH8Eg66CQBV7ymhFktIxb/WHT/HmCku+XbwyfDX9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845309; c=relaxed/simple;
	bh=4DtI74gs23eEuB+8WhdzZ5vE3jytl69617uOOJzJpfg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ioZ+eWrdffSKWf+uU5f80ciD3Pep3hSwaUuDyq9oVNZkzs4Hy7+YcBAsjPWG0NM5iTjY/zuXgDImvn3fjHQzkMqUISbz/KsDC9WZBrRNdifQEKBr/RtO+3KPitGY70+kkGlDLouq3LFeA1mB0JCqjHsxHvm6FX6eJnyMaI6ERPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tuxedo.de; spf=pass smtp.mailfrom=tuxedo.de; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tuxedo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedo.de
Received: from mail.tuxedocomputers.com (localhost [IPv6:::1])
	(Authenticated sender: cs@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 05B092FC004D;
	Thu,  1 Oct 2026 11:01:33 +0200 (CEST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 01 Oct 2026 11:01:33 +0200
From: Christoffer Sandberg <cs@tuxedo.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Mohamed Jouini <amad3v@gmail.com>, Hans de
 Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] platform/x86: uniwill-laptop: Map the screen rotation
 key
In-Reply-To: <263ec1ec-181a-4f96-92f4-25674559e961@tuxedocomputers.com>
References: <20260925211635.1422516-1-amad3v@gmail.com>
 <20260925211635.1422516-4-amad3v@gmail.com>
 <94e5619d-02eb-4b55-bfcb-67964ee1def3@gmx.de>
 <263ec1ec-181a-4f96-92f4-25674559e961@tuxedocomputers.com>
Message-ID: <66a47248ecfa1704186274f2c245d3f5@tuxedo.de>
X-Sender: cs@tuxedo.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit



On 30.9.2026 01:22, Werner Sembach wrote:
> Am 26.09.26 um 01:52 schrieb Armin Wolf:
>> Am 25.09.26 um 23:16 schrieb Mohamed Jouini:
>> 
>>> The PCSpecialist Recoil 16 AMD / TUXEDO Stellaris 16 Gen7 chassis has 
>>> an
>>> "Sc" key next to F12, meant to rotate the lay-flat screen by 180 
>>> degrees.
>>> It reports WMI event 0xD0, which is currently reported as 
>>> KEY_UNKNOWN.
>>> Map it to KEY_ROTATE_DISPLAY.
>> 
>> Unless Tuxedo know more about this event code:
> don't have the device at hand so pulled christoffer in the loop

As far as I know we do not have any device with this mapping. So, no 
objection ;)

>> 
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> 
>>> Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
>>> ---
>>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 3 +++
>>>   drivers/platform/x86/uniwill/uniwill-wmi.h  | 3 +++
>>>   2 files changed, 6 insertions(+)
>>> 
>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> index 0932e5937..f99c5e9ac 100644
>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> @@ -519,6 +519,9 @@ static const struct key_entry uniwill_keymap[] = 
>>> {
>>>       /* Reported when the user wants to toggle the webcam */
>>>       { KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { 
>>> KEY_UNKNOWN }},
>>>   +    /* Reported when the user wants to rotate the (lay-flat) 
>>> screen by 180 degrees */
>>> +    { KE_KEY,       UNIWILL_OSD_ROTATE_SCREEN,              { 
>>> KEY_ROTATE_DISPLAY }},
>>> +
>>>       { KE_END }
>>>   };
>>>   diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h 
>>> b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>> index b25b2f312..1b6f650c4 100644
>>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
>>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
>>> @@ -117,6 +117,9 @@
>>>     #define UNIWILL_OSD_WEBCAM_TOGGLE        0xCF
>>>   +/* "Sc" key next to F12 on the PCSpecialist Recoil 16 / Stellaris 
>>> 16 Gen7 */
>>> +#define UNIWILL_OSD_ROTATE_SCREEN        0xD0
>>> +
>>>   #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED    0xF0
>>>     struct device;
