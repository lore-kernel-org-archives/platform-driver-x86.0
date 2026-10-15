Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B2358B6B2
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 20:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096540; cv=none; b=idDyrLoNz/MF8OgDM3AVGgFoZRQvShp5I8WTU98zLsT7tk0LQFUVZaNvv1zrJU3daD+wyHqtTJgBdgNIVBASpcIRMgYIDVRjB9NSHnNJjKgr/9ZKPdyOvUBw4f9t/kCGN/aJ9tqENT2QsORMjacH5K/8u5T63lGZkRi1HebsY2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096540; c=relaxed/simple;
	bh=PRk+p7MBcEy85UKTDrjRKi3cWGS2sSa1n7MhJZq0fng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u568uZK3fFCm80ICA473bavNla9NNELHP73OzsOq/HmPsKjfis5e9YKyC/CyXGvVwi0RRTDCWAOFWGVVTK/QQgfn5dHvGK0xg784GEhPusVrFV39GYnefJWMsE7euxsOMlxYlIRA1SFnJHfeqFLFpXS5z3hPB3Ym7jx9d0LOHgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RWgSRW2K; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RWgSRW2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792096534; x=1792701334; i=w_armin@gmx.de;
	bh=coCHhAwPUiGh/2fOgzXyn+PwHWHIOLc57SqUMRzWrcA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RWgSRW2KLHbOqUarPacJezYXwdxOHsH93of07c/rVCKEy7mGViJIUCBTh82G/iy4
	 yPxFCn0f4aybBnxwrFMV0FTvnyn5/xEh5McU8XUdDCsn6l3sx9fpsbTeud31AbbC4
	 BSM2v4zcVwQUx1IgHATJkDfsej9KXC3R08jqkx9Muc6/VM+NoNU+U5m8/GUwdRb4A
	 43d4zeL6S36rTyuYBDI8dTza1vrf2IVHvGz9ej+d9qSX3jQ5lzkKRnsdqtNVbjsU3
	 AjwQhRqd/lrMqOyCFiUOnle8GXfOO6eKcYgGMhIsZV94C+Ey2JcDowYVixQzfZ5sD
	 mwFwWt1OcScAi0mU9Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2V4P-1wdCUz1o0l-00v18J; Thu, 15
 Oct 2026 22:35:34 +0200
Message-ID: <81b73de2-62ef-4c7a-b5d3-d7cfc226b2b4@gmx.de>
Date: Thu, 15 Oct 2026 22:35:32 +0200
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
 <90fffebb-2c6e-49de-9a73-df194cff0845@gmx.de>
 <deae55a0-cc2e-453e-8713-7ccc53947923@app.fastmail.com>
 <c73ea81b-62b3-4cbc-a597-0672f65cdb1f@app.fastmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <c73ea81b-62b3-4cbc-a597-0672f65cdb1f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hgVNSC1uOYmnB/BF+smMfvkm3jiGMB81gNHWRejRQOhEx46mOf+
 8S85ow4cr7p8ZZ/zBKUGAumomW1k2fHJ6a02zPNmiAgNH8Zu1g1XNTw3Tn2MRukTmE0MADT
 v3FJ9gq5tjpwRFDrkStW9xSkXjN8zp+iK5n5nleIOgaqP/MwZe1eXwwSYrdgZGvAj87Cz3f
 N5wcDzia1myf0RNoSCfmQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4abJwt63cqM=;RB/6IaqqEkp/AiX5SL08Zs80PPb
 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

Am 03.10.26 um 00:08 schrieb Mark Pearson:

> Hi Armin,
>
> On Mon, Sep 28, 2026, at 9:08 PM, Mark Pearson wrote:
>> On Fri, Sep 25, 2026, at 4:00 PM, Armin Wolf wrote:
>>> Am 25.09.26 um 21:00 schrieb Mark Pearson:
>>>
>>>> Thanks Armin
>>>>
>>>> On Fri, Sep 25, 2026, at 2:53 PM, Armin Wolf wrote:
>>>>> Am 25.09.26 um 18:00 schrieb Mark Pearson:
>>>>>
>>>>>> Lenovo Thinkpad, Thinkstation and ThinkCenter are moving to a new common
>>>>>> WMI implementation.
>>>>>>
>>>>>> This driver adds initial support for the new implementation, allowing
>>>>>> attributes to be read and modified.
>>>>>>
>>>>>> Certificate based authentication is not implemented in this
>>>>>> version.
>>>>>>
>>>>>> think-lmi is updated to use this driver if supported by the HW and
>>>>>> requested by the user.
>>>>>>
>>>>>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>>>> ---
>>>>>>     drivers/platform/x86/lenovo/think-lmi-v2.c | 960 +++++++++++++++++++++
>>>>>>     drivers/platform/x86/lenovo/think-lmi.c    |   9 +-
>>>>>>     drivers/platform/x86/lenovo/think-lmi.h    |  59 ++
>>>>>>     3 files changed, 1025 insertions(+), 3 deletions(-)
>>>>>>     create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c
>>>>>>
>>>>>> diff --git a/drivers/platform/x86/lenovo/think-lmi-v2.c b/drivers/platform/x86/lenovo/think-lmi-v2.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..5bc0a349c5fb
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/platform/x86/lenovo/think-lmi-v2.c
>>>>>> @@ -0,0 +1,960 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>>> +/*
>>>>>> + * Think LMI V2 BIOS configuration driver
>>>>>> + *
>>>>>> + * Copyright(C) 2026 Lenovo
>>>>>> + * Distributed under the GPL-2.0 license
>>>>>> + */
>>>>>> +
>>>>> ...
>>>>>
>>>>>> +/* Get password settings from BIOS */
>>>>>> +static int tlmi_get_pwd_settings(void)
>>>>>> +{
>>>>>> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>>>>>> +	const union acpi_object *obj;
>>>>>> +	acpi_status status;
>>>>>> +
>>>>>> +	if (!tlmi_priv.can_get_password_settings)
>>>>>> +		return -EOPNOTSUPP;
>>>>>> +
>>>>>> +	status = wmi_query_block(LENOVO_BIOS_ACCESS_DATA_GUID, 0, &output);
>>>>> Big NACK from my side, this function is deprecated and scheduled for removal.
>>>>>
>>>>> If i understand correctly the core drivers needs two WMI GUIDs, one for
>>>>> discovering
>>>>> settings and one for operating on those settings. Please use the
>>>>> component framework
>>>>> to link those two together by register a component for the data GUID
>>>>> and a component
>>>>> master for the method GUID.
>>>>>
>>>>> This also allows you to use the modern buffer-based WMI API, so you can
>>>>> leave ACPI
>>>>> behind when writing this driver.
>>>>>
>>>> OK - good to know. As a note, I suspect the original driver will need updating here too.
>>>>
>>>> For "use the component framework to link those two together" - is there an example or documentation you can recommend as a reference for doing this?
>>> https://docs.kernel.org/driver-api/component.html, other than that the
>>> Lenvovo Gamezone drivers AFAIK uses it,
>>> but in a IMHO convoluted way.
>>>
>> Thanks - I'm getting my head around this all :)
>>
>>>>>> +	if (ACPI_FAILURE(status))
>>>>>> +		return -EIO;
>>>>>> +
>>>>>> +	obj = output.pointer;
>>>>>> +	if (!obj)
>>>>>> +		return -ENOMEM;
>>>>>> +
>>>>>> +	if (obj->type != ACPI_TYPE_PACKAGE) {
>>>>>> +		kfree(obj);
>>>>>> +		return -EIO;
>>>>>> +	}
>>>>>> +
>>>>>> +	tlmi_priv.pwdcfg_v2.password_state = obj->package.elements[0].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.minlen = obj->package.elements[1].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.maxlen = obj->package.elements[2].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.strong_password = obj->package.elements[3].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.supported_encodings = obj->package.elements[4].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.supported_keyboard = obj->package.elements[5].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.hdd_user_password = obj->package.elements[6].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.hdd_master_password = obj->package.elements[7].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.nvme_user_password = obj->package.elements[8].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.nvme_master_password = obj->package.elements[9].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.deploy_mode = obj->package.elements[10].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.sys_mgr_pwd_ctrl = obj->package.elements[11].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.power_on_pwd_ctrl = obj->package.elements[12].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.storage_pwd_ctrl = obj->package.elements[13].integer.value;
>>>>>> +	tlmi_priv.pwdcfg_v2.sys_mgr_setup_ctrl = obj->package.elements[14].integer.value;
>>>>>> +
>>>>>> +	if (WARN_ON(tlmi_priv.pwdcfg_v2.maxlen >= TLMI_PWD_BUFSIZE))
>>>>>> +		tlmi_priv.pwdcfg_v2.maxlen = TLMI_PWD_BUFSIZE - 1;
>>>>>> +
>>>>>> +	tlmi_priv.pwd_admin = tlmi_create_auth(SVP, "bios-admin");
>>>>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SVP_PWD)
>>>>>> +		tlmi_priv.pwd_admin->pwd_enabled = true;
>>>>>> +
>>>>>> +	tlmi_priv.pwd_power = tlmi_create_auth(POP, "power-on");
>>>>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_POP_PWD)
>>>>>> +		tlmi_priv.pwd_power->pwd_enabled = true;
>>>>>> +
>>>>>> +	tlmi_priv.pwd_system = tlmi_create_auth(SMP, "system");
>>>>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SMP_PWD)
>>>>>> +		tlmi_priv.pwd_system->pwd_enabled = true;
>>>>>> +
>>>>>> +	tlmi_priv.pwd_hdd = tlmi_create_auth(HDD1, "hdd");
>>>>>> +	tlmi_priv.pwd_hdd->index = 1;
>>>>>> +	if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
>>>>>> +	    tlmi_priv.pwdcfg.ext.hdd_master_password) {
>>>>>> +		tlmi_priv.pwd_hdd->pwd_enabled = true;
>>>>>> +		if (tlmi_priv.pwdcfg.ext.hdd_master_password)
>>>>>> +			tlmi_priv.pwd_hdd->index =
>>>>>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_master_password) - 1;
>>>>>> +		else
>>>>>> +			tlmi_priv.pwd_hdd->index =
>>>>>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>>>>>> +	}
>>>>>> +
>>>>>> +	tlmi_priv.pwd_nvme = tlmi_create_auth(NVME1, "nvme");
>>>>>> +	tlmi_priv.pwd_nvme->index = 1;
>>>>>> +	if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>>>>>> +	    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>>>>> +		tlmi_priv.pwd_nvme->pwd_enabled = true;
>>>>>> +		if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>>>>>> +			tlmi_priv.pwd_nvme->index =
>>>>>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_master_password) - 1;
>>>>>> +		else
>>>>>> +			tlmi_priv.pwd_nvme->index =
>>>>>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_user_password) - 1;
>>>>>> +	}
>>>>>> +
>>>>>> +	kfree(obj);
>>>>>> +
>>>>>> +	return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int tlmi_analyze(struct wmi_device *wdev)
>>>>>> +{
>>>>>> +	int i, ret;
>>>>>> +
>>>>>> +	if (wmi_has_guid(LENOVO_BIOS_CONFIGURATION_GUID))
>>>>>> +		tlmi_priv.can_set_bios_settings = true;
>>>>>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_DATA_GUID))
>>>>>> +		tlmi_priv.can_get_password_settings = true;
>>>>>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_GUID)) {
>>>>>> +		tlmi_priv.can_set_bios_password = true;
>>>>>> +		tlmi_priv.certificate_support = true;
>>>>>> +	}
>>>>> This should be used to determine which components the component master wants
>>>>> to bind to, as some of them seem to be optional.
>>>>>
>>>>> Using wmi_has_guid() will not work for duplicated GUIDs, so we need a
>>>>> new function
>>>>> here. I can write a patch that adds:
>>>>>
>>>>> 	bool wmidev_exists(const char *guid);
>>>>>
>>>>> You could then carry this patch with this patch series.
>>>>>
>>>> That would fantastic - thanks!
>>>>
>>>> Mark
>>> Ok. Is the firmware interface still being in development? Because i
>>> would prefer if the main
>>> WMI object (aka the component master) would contain some WMI methods to
>>> determine which optional
>>> features are supported.
>>>
>> Sorry - somehow missed your message in my inbox.
>>
>> FW interface is pretty much done. Putting changes in would be quite
>> hard now as we'd have to co-ordinate across three different business
>> units and the 2027 platforms (where this is being targeted) are just
>> around the corner.
>>
>> What did you have in mind? Changes aren't impossible...but difficult.
>>
>> Mark
> Your patch works - but I changed it to accept a string as input first. e.g:
>
> bool wmidev_exists(const char *guid_string)
> {
>          guid_t guid;
>          int ret;
>
>          ret = guid_parse(guid_string, &guid);
>          if (ret < 0)
>                  return false;
>
>          return bus_for_each_dev(&wmi_bus_type, NULL, (void *)&guid, wmidev_match_guid) == 1;
> }
>
> Any concerns?
>
> Mark

I plan to get rid of the GUID strings in the future, so having wmidev_exists() accept a guid_t is
preferable to me. You can use a small wrapper function inside your driver if you want.

Thanks,
Armin Wolf

