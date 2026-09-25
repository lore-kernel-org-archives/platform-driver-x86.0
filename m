Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8503033EB
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 20:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366441; cv=none; b=IEbECmxIo5Oj1nQ0iKF60McOS/EABKLHaVZTwGXFOAK2GqMtsiKpzuBtHBscYDoGLzlR7/attgLUIq6KcekoH60v9uy/Zbk6/X0wmT052weExyRsRYZZZ/0uuU8j17JEG4sfp3X0Z0pHPCV6iz3658SQU2WmaHSbu1PLPuhJ2Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366441; c=relaxed/simple;
	bh=z4XTmvFf9UgKVemuwROKVStzxYSq3OwXeDu9HwbhEt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqDEUiPPhAVtRgzr0qweLjITvWZ7QU/A70Wi5QZ7613wlLT8ehBjyNbXqWmPX3fUol8pRodRMXtFLsvAOLSJ0qDSpQst1oHP5fAEAtVcAcyybfjQQmOTB6D8dFV9pa9BTEhEwe8TUXyrOKB3ucFf5U7L30Ub1kcX+uZcjxfG8jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=P4MCcMwV; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="P4MCcMwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790366433; x=1790971233; i=w_armin@gmx.de;
	bh=9AHnBngXtCRavSHJtanCigoBzl2u8rU2PPqO4Y8kWxo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=P4MCcMwVK4fA+ha2JJ7aqEVJ4qIdeLasSaOQ4fN0eUNyAgo3VZRrC3n2oOSPx7fi
	 FeKPvC++iKhw2KGVfRD44By+LyHPUdXUJI2WkK9FlE9r4E6GdD+I7egu/lU6ABVF2
	 zxGhvfxg7evnBCmscT5V+GWg5hnPDwxjQ87Jk2Z5fRE2UDItFXJjp5SFpwxJSVRRj
	 do593ciUBR53dkJdH0OhZhIINIwI5AQ4H0dAY2iWyGUbTnckDwBUDnKa9c9z8vdun
	 9y8Jdg9wm3Swcg7JQcz4KQb49aukz3z566qHuo2nhqNvTXdYS4c+nIH/V1rvAzDZN
	 MVY2TTNyOY/HLDjf3A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Ed-1wl0nc06SD-011AeU; Fri, 25
 Sep 2026 22:00:33 +0200
Message-ID: <90fffebb-2c6e-49de-9a73-df194cff0845@gmx.de>
Date: Fri, 25 Sep 2026 22:00:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/7] platform/x86: think-lmi: Initial ThinkLMI v2
 driver
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, Dell.Client.Kernel@dell.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-6-mpearson-lenovo@squebb.ca>
 <f0407ed1-3b8f-4285-8349-926edf80e54f@gmx.de>
 <f0c68763-7960-458f-8a82-f5761ea61890@app.fastmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <f0c68763-7960-458f-8a82-f5761ea61890@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:5Ph3OmBzmSMzsepCq9ZyacUp3K2cYmYsPa95sLcrzOd+wLNtmr7
 /jCLHMcn7jx7bQKRUC3a7Moqi8XOp9bAjewkEmvtS3UZczNtqwMX10ASWG3DM1D1yLkO/NT
 b/ovJ1wWxj2dhbcJfz/L3asgGgk1Ybxy5+Y6Hf3wKbYET1ZAG8HQXnrTLN+MBGe/9w9b0BE
 Cz8i+V6Yap0s4TVZPjn5A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+kyBOqVnhqM=;I8maV44e+w6B4+7SritLRqb9UeL
 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

Am 25.09.26 um 21:00 schrieb Mark Pearson:

> Thanks Armin
>
> On Fri, Sep 25, 2026, at 2:53 PM, Armin Wolf wrote:
>> Am 25.09.26 um 18:00 schrieb Mark Pearson:
>>
>>> Lenovo Thinkpad, Thinkstation and ThinkCenter are moving to a new common
>>> WMI implementation.
>>>
>>> This driver adds initial support for the new implementation, allowing
>>> attributes to be read and modified.
>>>
>>> Certificate based authentication is not implemented in this
>>> version.
>>>
>>> think-lmi is updated to use this driver if supported by the HW and
>>> requested by the user.
>>>
>>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>> ---
>>>    drivers/platform/x86/lenovo/think-lmi-v2.c | 960 +++++++++++++++++++++
>>>    drivers/platform/x86/lenovo/think-lmi.c    |   9 +-
>>>    drivers/platform/x86/lenovo/think-lmi.h    |  59 ++
>>>    3 files changed, 1025 insertions(+), 3 deletions(-)
>>>    create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c
>>>
>>> diff --git a/drivers/platform/x86/lenovo/think-lmi-v2.c b/drivers/platform/x86/lenovo/think-lmi-v2.c
>>> new file mode 100644
>>> index 000000000000..5bc0a349c5fb
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo/think-lmi-v2.c
>>> @@ -0,0 +1,960 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Think LMI V2 BIOS configuration driver
>>> + *
>>> + * Copyright(C) 2026 Lenovo
>>> + * Distributed under the GPL-2.0 license
>>> + */
>>> +
>> ...
>>
>>> +/* Get password settings from BIOS */
>>> +static int tlmi_get_pwd_settings(void)
>>> +{
>>> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>>> +	const union acpi_object *obj;
>>> +	acpi_status status;
>>> +
>>> +	if (!tlmi_priv.can_get_password_settings)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	status = wmi_query_block(LENOVO_BIOS_ACCESS_DATA_GUID, 0, &output);
>> Big NACK from my side, this function is deprecated and scheduled for removal.
>>
>> If i understand correctly the core drivers needs two WMI GUIDs, one for
>> discovering
>> settings and one for operating on those settings. Please use the
>> component framework
>> to link those two together by register a component for the data GUID
>> and a component
>> master for the method GUID.
>>
>> This also allows you to use the modern buffer-based WMI API, so you can
>> leave ACPI
>> behind when writing this driver.
>>
> OK - good to know. As a note, I suspect the original driver will need updating here too.
>
> For "use the component framework to link those two together" - is there an example or documentation you can recommend as a reference for doing this?

https://docs.kernel.org/driver-api/component.html, other than that the Lenvovo Gamezone drivers AFAIK uses it,
but in a IMHO convoluted way.

>>> +	if (ACPI_FAILURE(status))
>>> +		return -EIO;
>>> +
>>> +	obj = output.pointer;
>>> +	if (!obj)
>>> +		return -ENOMEM;
>>> +
>>> +	if (obj->type != ACPI_TYPE_PACKAGE) {
>>> +		kfree(obj);
>>> +		return -EIO;
>>> +	}
>>> +
>>> +	tlmi_priv.pwdcfg_v2.password_state = obj->package.elements[0].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.minlen = obj->package.elements[1].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.maxlen = obj->package.elements[2].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.strong_password = obj->package.elements[3].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.supported_encodings = obj->package.elements[4].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.supported_keyboard = obj->package.elements[5].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.hdd_user_password = obj->package.elements[6].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.hdd_master_password = obj->package.elements[7].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.nvme_user_password = obj->package.elements[8].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.nvme_master_password = obj->package.elements[9].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.deploy_mode = obj->package.elements[10].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.sys_mgr_pwd_ctrl = obj->package.elements[11].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.power_on_pwd_ctrl = obj->package.elements[12].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.storage_pwd_ctrl = obj->package.elements[13].integer.value;
>>> +	tlmi_priv.pwdcfg_v2.sys_mgr_setup_ctrl = obj->package.elements[14].integer.value;
>>> +
>>> +	if (WARN_ON(tlmi_priv.pwdcfg_v2.maxlen >= TLMI_PWD_BUFSIZE))
>>> +		tlmi_priv.pwdcfg_v2.maxlen = TLMI_PWD_BUFSIZE - 1;
>>> +
>>> +	tlmi_priv.pwd_admin = tlmi_create_auth(SVP, "bios-admin");
>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SVP_PWD)
>>> +		tlmi_priv.pwd_admin->pwd_enabled = true;
>>> +
>>> +	tlmi_priv.pwd_power = tlmi_create_auth(POP, "power-on");
>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_POP_PWD)
>>> +		tlmi_priv.pwd_power->pwd_enabled = true;
>>> +
>>> +	tlmi_priv.pwd_system = tlmi_create_auth(SMP, "system");
>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SMP_PWD)
>>> +		tlmi_priv.pwd_system->pwd_enabled = true;
>>> +
>>> +	tlmi_priv.pwd_hdd = tlmi_create_auth(HDD1, "hdd");
>>> +	tlmi_priv.pwd_hdd->index = 1;
>>> +	if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
>>> +	    tlmi_priv.pwdcfg.ext.hdd_master_password) {
>>> +		tlmi_priv.pwd_hdd->pwd_enabled = true;
>>> +		if (tlmi_priv.pwdcfg.ext.hdd_master_password)
>>> +			tlmi_priv.pwd_hdd->index =
>>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_master_password) - 1;
>>> +		else
>>> +			tlmi_priv.pwd_hdd->index =
>>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>>> +	}
>>> +
>>> +	tlmi_priv.pwd_nvme = tlmi_create_auth(NVME1, "nvme");
>>> +	tlmi_priv.pwd_nvme->index = 1;
>>> +	if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>>> +	    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>> +		tlmi_priv.pwd_nvme->pwd_enabled = true;
>>> +		if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>>> +			tlmi_priv.pwd_nvme->index =
>>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_master_password) - 1;
>>> +		else
>>> +			tlmi_priv.pwd_nvme->index =
>>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_user_password) - 1;
>>> +	}
>>> +
>>> +	kfree(obj);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int tlmi_analyze(struct wmi_device *wdev)
>>> +{
>>> +	int i, ret;
>>> +
>>> +	if (wmi_has_guid(LENOVO_BIOS_CONFIGURATION_GUID))
>>> +		tlmi_priv.can_set_bios_settings = true;
>>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_DATA_GUID))
>>> +		tlmi_priv.can_get_password_settings = true;
>>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_GUID)) {
>>> +		tlmi_priv.can_set_bios_password = true;
>>> +		tlmi_priv.certificate_support = true;
>>> +	}
>> This should be used to determine which components the component master wants
>> to bind to, as some of them seem to be optional.
>>
>> Using wmi_has_guid() will not work for duplicated GUIDs, so we need a
>> new function
>> here. I can write a patch that adds:
>>
>> 	bool wmidev_exists(const char *guid);
>>
>> You could then carry this patch with this patch series.
>>
> That would fantastic - thanks!
>
> Mark

Ok. Is the firmware interface still being in development? Because i would prefer if the main
WMI object (aka the component master) would contain some WMI methods to determine which optional
features are supported.

Thanks,
Armin Wolf

