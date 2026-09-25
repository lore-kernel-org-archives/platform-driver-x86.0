Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2333C819B
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 20:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790369679; cv=none; b=SVooh5N047/Zb/vwOKT3ZifWCZH3xEpl39Ab/sXlTZo17KRHVq/9Nh+rtwxONiosjHqzDXh4BCWOKVG7L31rl/lPilQYR8gGlE2laVc+D9CeZONsGkb9e1Aizq8TwZPx+bC6mOrJcQbp0P6hZlIsJ3fivGR9l59wJufTJdrvWhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790369679; c=relaxed/simple;
	bh=Bbx+4n3p+7GX469kg+UnBWBy+29hV7oQDAWSfAZ/fB8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oOGDtTyww5gpuPx5WcIijFcA6hh/XJSmw5huHb8Kwn5Ph+xS7YC3Ld4doFOtV//v/4BANEJ7wf2alCMkDDkHjmKyB6yW+r8XeUquqQksu5dmRAjAgZyWTzroI2ITTtI6vu0v4XAX109K+7EPLmLAhpcVYoBpvz1MRHeJOT6tU8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=A6YMoQG/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NVLQ/uZo; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="A6YMoQG/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NVLQ/uZo"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 910731D000B1;
	Fri, 25 Sep 2026 16:54:36 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 25 Sep 2026 16:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790369676;
	 x=1790456076; bh=E0ZXFQHVScU52TAzsg7GPoFR5v1BLgafJWJ7PWGaPQ0=; b=
	A6YMoQG/aY0ZdehIa9isP43KTadDyLCe7CHznDUjHr+aIzTpHYTNhCumUPtNvftZ
	Ss5G8vLUJsXi1FO+o1Zz26XYOPpJJIAdw8cER/k503nqhwc0bAPpCExhSFH5B30r
	xl0Xnz2lzqM1aK3I5kqOypjZ+O9l8NVA6Gi5anVjq4urV/MZusUPsaRtAugGrn0c
	R9wTMKR74/Qj+vTQ/uZwtdPUfmh+0z5dJBp4uO2geQP+YA2utzoaaCtA21SyEc4V
	AFmUDvudsgVvqVCSLIyeUVOxEUITGPE+qp6jPWeNICoKJyoIx2124D1XfuPL0Fyl
	PcAygg/hr/EPfs7x9OsI2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790369676; x=
	1790456076; bh=E0ZXFQHVScU52TAzsg7GPoFR5v1BLgafJWJ7PWGaPQ0=; b=N
	VLQ/uZoTcMR/nNe2XmB6PAFmOJGBqRJni0PHEWjaP1eyNnTWXD3rj9hJL12FG90A
	GI6hdkqhCF4QL3d7ugMiZ48HrsjVjS7TA3S5FLelq7u7ebwHDMtvbT1WBR9Th43/
	BxQGdMacGH+1XwcQAHa7mQRuN/DJieffdZG5tKcxDlJJRqUVB/lAQXRJYaPeJqDt
	NlU0tcC3PjZG1xH4HN0JUhMx3KJABWj+AJHvfepZqfMBcCLSJIRyHA59Rx2eJUjW
	NwClkElZWOa22LewABSwUZCLc06PXV84yD7v10DQ3lFOC8A2TYfhY56puVKCpTnk
	l/eXzjgpnmTz9wL50YwOw==
X-ME-Sender: <xms:i9-2anjubH3-MIugsAaObJUc1refhYHnBs6bSuVUOoR_1WTq6pstOA>
    <xme:i9-2au0s0AfcWx9pfhFzLuYtPuI42gLMvmo5hRkd3_sSzL4wVsX6k-jN_HYdxfl9_
    rEroj7N4tNVMNRH5LhduHPWwaQFwMi1Yfp9FzBUoM856vwV7MiHoHuR>
X-ME-Proxy-Cause: dmFkZTFuUTuuWL6f3GJhBpOd98IIp74ARIDi0HGGJa92+wi+aV57Ioe07nC9MjYuerAU4/
    yhW6key1td3aJXCMZdtRCM2PFlaXil/CO/CAxTIpn4oI5/s4MQaNIFNwFZ3fSmfnQUsjxu
    ZQVXLVYxxQ2qJDFs66bU7nQkjzDwJcQwJaR040Hah2k2iwqcidCG6AtZRn7/G5bvIAjt9E
    5FEZ3vHiYptGsxPtoPNAaqlY++RdXLI+dOKb6R9eaGupPg3A4sjQ/lHMGwpK3G/xIns6Ys
    C+diHPx+LNSXe82FevRF4y9SgveYkoYcPeiuzkqV6gKgmW0vZAfIb4VIMJo2UTo8LluPLH
    cV372SC2WL3+WDlfUyxxRS4CS3e2MjQebK9N28bpirTiZtyTKDALNobBaDFDHxRlLDRzpR
    gFhoPOggOaPW3op5+hCjJ4Dlb/jyHmLtl3HvnZToqQXqMTm5KWOBhTGn9QhY8O3G5SWBuL
    ah0mVTcyz5CNc7XIwl6z4PBHvRQ6kH6pDFLyTW7WYGjbFRW2sisnmeeAznp3yUvyimcwnU
    MZjcPEqL1DQ8IPXa/zUHlLgOa03HuOhxE6RJjM/ZkCU0JblD8uiLyLG2nQ9HQW0T4SVy+C
    S4mZvuoq98eN+FnyFVOIi2e012V3T0bbMOetoVqC7desUt8hh47cJ9MSo+Iw
X-ME-Proxy: <xmx:i9-2atLa-LnCM5Go01H5EgJWulCfnguKuEavQtXVHEIbC0ONY-kDJg>
    <xmx:i9-2ajM3c-vTRpBQSso0tN-bCOGfbFxO0VQg7W0xkuY-p8L6_OhwLg>
    <xmx:i9-2almuhFTHwVrh9RuJUCcjvHX4N0c9-CAhBUE3WgdyilWUGwRK-g>
    <xmx:i9-2av4sl6fs_2S4vCj6E6RfLvG_tRELVjUTUJ0NduOdjBGgH_kmRw>
    <xmx:jN-2arHvo0pgZCRMY4FYqLiWVqvOAlDazklwgg3BZvHEJOmFU25zkB6v>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 761662C0006F; Fri, 25 Sep 2026 16:54:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AcGzoZcWswFR
Date: Fri, 25 Sep 2026 16:54:14 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Armin Wolf" <W_Armin@gmx.de>
Cc: "Prasanth Ksr" <prasanth.ksr@dell.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dell.Client.Kernel@dell.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <c60ba808-6de2-44d9-a730-417d9ca04fa0@app.fastmail.com>
In-Reply-To: <B8915D67-6B93-43F9-9A6D-F9AFF3E55A27@gmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-6-mpearson-lenovo@squebb.ca>
 <f0407ed1-3b8f-4285-8349-926edf80e54f@gmx.de>
 <f0c68763-7960-458f-8a82-f5761ea61890@app.fastmail.com>
 <B8915D67-6B93-43F9-9A6D-F9AFF3E55A27@gmail.com>
Subject: Re: [RFC PATCH 5/7] platform/x86: think-lmi: Initial ThinkLMI v2 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Sep 25, 2026, at 4:05 PM, Derek J. Clark wrote:
> On September 25, 2026 12:00:24 PM PDT, Mark Pearson 
> <mpearson-lenovo@squebb.ca> wrote:
>>Thanks Armin
>>
>>On Fri, Sep 25, 2026, at 2:53 PM, Armin Wolf wrote:
>>> Am 25.09.26 um 18:00 schrieb Mark Pearson:
>>>
>>>> Lenovo Thinkpad, Thinkstation and ThinkCenter are moving to a new common
>>>> WMI implementation.
>>>>
>>>> This driver adds initial support for the new implementation, allowing
>>>> attributes to be read and modified.
>>>>
>>>> Certificate based authentication is not implemented in this
>>>> version.
>>>>
>>>> think-lmi is updated to use this driver if supported by the HW and
>>>> requested by the user.
>>>>
>>>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>> ---
>>>>   drivers/platform/x86/lenovo/think-lmi-v2.c | 960 +++++++++++++++++++++
>>>>   drivers/platform/x86/lenovo/think-lmi.c    |   9 +-
>>>>   drivers/platform/x86/lenovo/think-lmi.h    |  59 ++
>>>>   3 files changed, 1025 insertions(+), 3 deletions(-)
>>>>   create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c
>>>>
>>>> diff --git a/drivers/platform/x86/lenovo/think-lmi-v2.c b/drivers/platform/x86/lenovo/think-lmi-v2.c
>>>> new file mode 100644
>>>> index 000000000000..5bc0a349c5fb
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/lenovo/think-lmi-v2.c
>>>> @@ -0,0 +1,960 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * Think LMI V2 BIOS configuration driver
>>>> + *
>>>> + * Copyright(C) 2026 Lenovo
>>>> + * Distributed under the GPL-2.0 license
>>>> + */
>>>> +
>>>
>>> ...
>>>
>>>> +/* Get password settings from BIOS */
>>>> +static int tlmi_get_pwd_settings(void)
>>>> +{
>>>> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>>>> +	const union acpi_object *obj;
>>>> +	acpi_status status;
>>>> +
>>>> +	if (!tlmi_priv.can_get_password_settings)
>>>> +		return -EOPNOTSUPP;
>>>> +
>>>> +	status = wmi_query_block(LENOVO_BIOS_ACCESS_DATA_GUID, 0, &output);
>>>
>>> Big NACK from my side, this function is deprecated and scheduled for removal.
>>>
>>> If i understand correctly the core drivers needs two WMI GUIDs, one for 
>>> discovering
>>> settings and one for operating on those settings. Please use the 
>>> component framework
>>> to link those two together by register a component for the data GUID 
>>> and a component
>>> master for the method GUID.
>>>
>>> This also allows you to use the modern buffer-based WMI API, so you can 
>>> leave ACPI
>>> behind when writing this driver.
>>>
>>
>>OK - good to know. As a note, I suspect the original driver will need updating here too.
>>
>>For "use the component framework to link those two together" - is there an example or documentation you can recommend as a reference for doing this?
>>
>
> Mark,
> We do this in lenovo-wmi-other/capdata.
> - Derek
>
Perfect - thanks!
Mark
