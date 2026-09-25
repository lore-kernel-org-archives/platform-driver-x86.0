Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653E0442FD8
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 19:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790362864; cv=none; b=cdB0atomJpiLGPWrEMFoNdKFEIjFWqHxc4nEbnNF9IFuH+HWQg9xFWWFfW4EJYXDowgbgWT8425HLEZ0e78PMdE0ZF75Bl+ZzCM6w2XsO+vltuhPiH6FOh4tTdVYm645sCu/huufcApHd1d2akoXeOMrp2FvvVjms7352GF8/Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790362864; c=relaxed/simple;
	bh=kTWpMP2GvLkK+L5mceWxyeQXfj4dS998C9IkDsr4cYk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=L7y4uvefyWzPekQvl4xMS9EShiqbW+sIbjj3HfhnfkqEJCTlMMZgher0CM6xI6xWCA8biLgSGElRrq6e/g7V39c6nGNrZ5a7CPxL6oqo/KEmmyAlgDLXQGaE3vVs5YAF87dk9coNPkIcSNvDng8nay0jlxCM8W4JANhSZBIr3c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=sWoguMCE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iUtTOv59; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="sWoguMCE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iUtTOv59"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id B7C5B1D000BC;
	Fri, 25 Sep 2026 15:00:45 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 25 Sep 2026 15:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790362845;
	 x=1790449245; bh=8C14Jtw7boxZLsA8Lb+ve2LFE20yCeLGYoUYKJmflMs=; b=
	sWoguMCEhOW0ruK85zFwumBLH8Bl7TmFzQz5lyFQQXgCOMJUlnoNPRJjV+u8JKUg
	yePb8NqmTCSfjY1qItu6g+Hv+xTgEuXD7TYzQXfjesBmkM0hRIY8Csvk1b87BPDx
	AkNWyEWA5pFpelbOxu36OKdEo18ETWURKXTO/hdEQrXY0HkiNtddB1dVU0mvSzgP
	WrWdX7FFsD974C3Qs7lzWbyVfgJlrwI3ngyCRrTICiusU0IHWaauJJsCWFEcoJZL
	dY1GHyOnFxgUx2oZoVW/QxL+5KyjyveAspJPkZM+h1EI1waes4723Ab5jkBY24kr
	coNgtqQBcgcO+e8Bh+Fdrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790362845; x=
	1790449245; bh=8C14Jtw7boxZLsA8Lb+ve2LFE20yCeLGYoUYKJmflMs=; b=i
	UtTOv596awLz28UQZYFY//b6a15qUFnAkU6ns8KFbvK0v6beKDDX7zkmf+BrhzAH
	ym/qmPtqW4ATutBmNXOrddDWQoyki+o/c6/+LxyOq2XiU2AuIFYP1Vfi8WqoFPBZ
	KvuRWnlHDoPkXBG0IvsAEpog5VgPB8bX0y813vdqT88+v5BAW/T/CAwuhyDf26Sr
	1t5yFEWkO5Z3ctqnYdS4DPSnx8QrvCi7JCVpuTm6cbhMnh3HuZS5EdsbWFzWpLDY
	RVQhYIzt3aD5cjAJ2AFWwvSpz7Fo06m7yrl/93aGILiQHx7YCaLje7gE17BxD6An
	9v7rGFOmVORSgCDgJwH6Q==
X-ME-Sender: <xms:3cS2avC67QF6wEl6ymRxuTAfGqshmfywjZkk2QG3tuurYVAeGK_sDA>
    <xme:3cS2agUM-7jmj7BTMFuLRFg56vDwD7ICwTQQwm7ZihCcG7DYs6hNBv5zL_n2bN9--
    -aoVDap8kTRQ2thwGjlSpXNwzOIuD-r-UFjzPP1n6h19DX69F28GiVV>
X-ME-Proxy-Cause: dmFkZTF0wZnjqGUgdaECaUJau3ultgL1SmqJ3traz2CvDNcY/AwxEL9Wq7rDhk7v1kCrjs
    M6qdORutGOiAMasCNiI/HhtnqXVqTFfZH2MCap8uL6SBQDud4xCdGvFWS5EIaZHeuys6DZ
    Hic+Y9eZ6a8VR/5FK/rY8K6fZpwrDfrj70skmgDwtTS1esgbw5gtMcoBvn/8V4Gg8mwIBA
    +ix9cG4HJx8wnonzjDp2PYd2X/j22piJp0+eQMKjvZndCc2FgWoq5tdriXe4wNdFTvj6tZ
    amyBbYvzTF56NQHeJ9ucg2XWHXhZZjppVG90VBpoeauPjGk2wA143AFU7r4RPBAv/HLOWm
    wIZHf2FyYyvVjDo9oKo1s3HN8tUkZ89/D5KQOk4nxUSWS9eo5u43YKguey4SL2vCkDAl7I
    YB5L5zbKaBAqorjv59xO3o7FV46lSlZnw6iLixN53QaRFlqwQVK+3IfBjo8hUNm9nQ69nF
    6CEUxpJNiwEXn+HQmIhMbwVrZ1MaEiOyI55NHPrCveL6fv/Q9MIMDGZhvOLT3IGcB99pNF
    8rEyWnzwhRRrTnxFe45s2Ezh8X8xBVEnYvVptJo53i4eUG35VXLP/bRUbU1plUiUEZqECy
    tLO1SEtns2S/ckaSg12L4GdzUZCQA50pyMVUusrgb/NPgAyDYO0MHn6M5iPQ
X-ME-Proxy: <xmx:3cS2akpRPM9P5E1zwQQOH7AU9LwLT1aRJx71jFZHTP72KWD8zXIybA>
    <xmx:3cS2akt4PNyRZxHfWt0BHWPVtsiW1i4mzX0JErPgxZ8-jLBlvD8viA>
    <xmx:3cS2apH10HwDQj_LCbYbeuTZHt6VtXhnkn3SN2QHhqJ2aEVCNdZzhQ>
    <xmx:3cS2atbPrY9_pAcOHQ3hPhlBVtRjsN2dp5H60P8y85BeSsEyDiGGMA>
    <xmx:3cS2ammjpweTHjnyWOq2L8YYKt7-lKNc0db8DBcoWrLAgXM7A_C6qse6>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 46E552C0006C; Fri, 25 Sep 2026 15:00:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AcGzoZcWswFR
Date: Fri, 25 Sep 2026 15:00:24 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: "Prasanth Ksr" <prasanth.ksr@dell.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, Dell.Client.Kernel@dell.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <f0c68763-7960-458f-8a82-f5761ea61890@app.fastmail.com>
In-Reply-To: <f0407ed1-3b8f-4285-8349-926edf80e54f@gmx.de>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-6-mpearson-lenovo@squebb.ca>
 <f0407ed1-3b8f-4285-8349-926edf80e54f@gmx.de>
Subject: Re: [RFC PATCH 5/7] platform/x86: think-lmi: Initial ThinkLMI v2 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Armin

On Fri, Sep 25, 2026, at 2:53 PM, Armin Wolf wrote:
> Am 25.09.26 um 18:00 schrieb Mark Pearson:
>
>> Lenovo Thinkpad, Thinkstation and ThinkCenter are moving to a new common
>> WMI implementation.
>>
>> This driver adds initial support for the new implementation, allowing
>> attributes to be read and modified.
>>
>> Certificate based authentication is not implemented in this
>> version.
>>
>> think-lmi is updated to use this driver if supported by the HW and
>> requested by the user.
>>
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>>   drivers/platform/x86/lenovo/think-lmi-v2.c | 960 +++++++++++++++++++++
>>   drivers/platform/x86/lenovo/think-lmi.c    |   9 +-
>>   drivers/platform/x86/lenovo/think-lmi.h    |  59 ++
>>   3 files changed, 1025 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c
>>
>> diff --git a/drivers/platform/x86/lenovo/think-lmi-v2.c b/drivers/platform/x86/lenovo/think-lmi-v2.c
>> new file mode 100644
>> index 000000000000..5bc0a349c5fb
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo/think-lmi-v2.c
>> @@ -0,0 +1,960 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Think LMI V2 BIOS configuration driver
>> + *
>> + * Copyright(C) 2026 Lenovo
>> + * Distributed under the GPL-2.0 license
>> + */
>> +
>
> ...
>
>> +/* Get password settings from BIOS */
>> +static int tlmi_get_pwd_settings(void)
>> +{
>> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>> +	const union acpi_object *obj;
>> +	acpi_status status;
>> +
>> +	if (!tlmi_priv.can_get_password_settings)
>> +		return -EOPNOTSUPP;
>> +
>> +	status = wmi_query_block(LENOVO_BIOS_ACCESS_DATA_GUID, 0, &output);
>
> Big NACK from my side, this function is deprecated and scheduled for removal.
>
> If i understand correctly the core drivers needs two WMI GUIDs, one for 
> discovering
> settings and one for operating on those settings. Please use the 
> component framework
> to link those two together by register a component for the data GUID 
> and a component
> master for the method GUID.
>
> This also allows you to use the modern buffer-based WMI API, so you can 
> leave ACPI
> behind when writing this driver.
>

OK - good to know. As a note, I suspect the original driver will need updating here too.

For "use the component framework to link those two together" - is there an example or documentation you can recommend as a reference for doing this?

>> +	if (ACPI_FAILURE(status))
>> +		return -EIO;
>> +
>> +	obj = output.pointer;
>> +	if (!obj)
>> +		return -ENOMEM;
>> +
>> +	if (obj->type != ACPI_TYPE_PACKAGE) {
>> +		kfree(obj);
>> +		return -EIO;
>> +	}
>> +
>> +	tlmi_priv.pwdcfg_v2.password_state = obj->package.elements[0].integer.value;
>> +	tlmi_priv.pwdcfg_v2.minlen = obj->package.elements[1].integer.value;
>> +	tlmi_priv.pwdcfg_v2.maxlen = obj->package.elements[2].integer.value;
>> +	tlmi_priv.pwdcfg_v2.strong_password = obj->package.elements[3].integer.value;
>> +	tlmi_priv.pwdcfg_v2.supported_encodings = obj->package.elements[4].integer.value;
>> +	tlmi_priv.pwdcfg_v2.supported_keyboard = obj->package.elements[5].integer.value;
>> +	tlmi_priv.pwdcfg_v2.hdd_user_password = obj->package.elements[6].integer.value;
>> +	tlmi_priv.pwdcfg_v2.hdd_master_password = obj->package.elements[7].integer.value;
>> +	tlmi_priv.pwdcfg_v2.nvme_user_password = obj->package.elements[8].integer.value;
>> +	tlmi_priv.pwdcfg_v2.nvme_master_password = obj->package.elements[9].integer.value;
>> +	tlmi_priv.pwdcfg_v2.deploy_mode = obj->package.elements[10].integer.value;
>> +	tlmi_priv.pwdcfg_v2.sys_mgr_pwd_ctrl = obj->package.elements[11].integer.value;
>> +	tlmi_priv.pwdcfg_v2.power_on_pwd_ctrl = obj->package.elements[12].integer.value;
>> +	tlmi_priv.pwdcfg_v2.storage_pwd_ctrl = obj->package.elements[13].integer.value;
>> +	tlmi_priv.pwdcfg_v2.sys_mgr_setup_ctrl = obj->package.elements[14].integer.value;
>> +
>> +	if (WARN_ON(tlmi_priv.pwdcfg_v2.maxlen >= TLMI_PWD_BUFSIZE))
>> +		tlmi_priv.pwdcfg_v2.maxlen = TLMI_PWD_BUFSIZE - 1;
>> +
>> +	tlmi_priv.pwd_admin = tlmi_create_auth(SVP, "bios-admin");
>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SVP_PWD)
>> +		tlmi_priv.pwd_admin->pwd_enabled = true;
>> +
>> +	tlmi_priv.pwd_power = tlmi_create_auth(POP, "power-on");
>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_POP_PWD)
>> +		tlmi_priv.pwd_power->pwd_enabled = true;
>> +
>> +	tlmi_priv.pwd_system = tlmi_create_auth(SMP, "system");
>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SMP_PWD)
>> +		tlmi_priv.pwd_system->pwd_enabled = true;
>> +
>> +	tlmi_priv.pwd_hdd = tlmi_create_auth(HDD1, "hdd");
>> +	tlmi_priv.pwd_hdd->index = 1;
>> +	if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
>> +	    tlmi_priv.pwdcfg.ext.hdd_master_password) {
>> +		tlmi_priv.pwd_hdd->pwd_enabled = true;
>> +		if (tlmi_priv.pwdcfg.ext.hdd_master_password)
>> +			tlmi_priv.pwd_hdd->index =
>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_master_password) - 1;
>> +		else
>> +			tlmi_priv.pwd_hdd->index =
>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>> +	}
>> +
>> +	tlmi_priv.pwd_nvme = tlmi_create_auth(NVME1, "nvme");
>> +	tlmi_priv.pwd_nvme->index = 1;
>> +	if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>> +	    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>> +		tlmi_priv.pwd_nvme->pwd_enabled = true;
>> +		if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>> +			tlmi_priv.pwd_nvme->index =
>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_master_password) - 1;
>> +		else
>> +			tlmi_priv.pwd_nvme->index =
>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_user_password) - 1;
>> +	}
>> +
>> +	kfree(obj);
>> +
>> +	return 0;
>> +}
>> +
>> +static int tlmi_analyze(struct wmi_device *wdev)
>> +{
>> +	int i, ret;
>> +
>> +	if (wmi_has_guid(LENOVO_BIOS_CONFIGURATION_GUID))
>> +		tlmi_priv.can_set_bios_settings = true;
>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_DATA_GUID))
>> +		tlmi_priv.can_get_password_settings = true;
>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_GUID)) {
>> +		tlmi_priv.can_set_bios_password = true;
>> +		tlmi_priv.certificate_support = true;
>> +	}
>
> This should be used to determine which components the component master wants
> to bind to, as some of them seem to be optional.
>
> Using wmi_has_guid() will not work for duplicated GUIDs, so we need a 
> new function
> here. I can write a patch that adds:
>
> 	bool wmidev_exists(const char *guid);
>
> You could then carry this patch with this patch series.
>
That would fantastic - thanks!

Mark
