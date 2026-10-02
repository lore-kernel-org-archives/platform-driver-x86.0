Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B7F422531
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 22:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978954; cv=none; b=lqBamdqSOFI5RH/t3Efcq0bZASpG84IIGvZlO2yDCk16Vwp2tsEJRwk+Edy1vaIjHJi7zLkAPA6FWDdeZS8XfniNQS+q0P+QmZMfFImHVOm/vhs+ecPK1bhpEpj6G4jjiODXlh1LgJCRyHHD2jj1F36SVZlBGC2eZD/KJO2S/jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978954; c=relaxed/simple;
	bh=9wcm4N3huIoWuCgIPOf94fmCQXX/8Szq1BGkBZOAu0k=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ahhp5j/bO8KuXL/4cjboJbb/O/R9o+lL0/3/zIe0wPjIayFRbFsMr8qXJMO0SXcZkmk8Kz7V6zTgdiFCkEaR71BU1RPqU4sQ89hbV9axiPOXb5X9TLiaXkqVTgayjc/n6XF9BnCEx685s5auLJFu7lUjZrgoMLOR5HuV5BqIL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Ksdp7OZV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Se8r3tet; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Ksdp7OZV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Se8r3tet"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id 328E8EC0279
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 18:09:11 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 02 Oct 2026 18:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790978950;
	 x=1791065350; bh=pCSuIPdblIzqaBrIM04shoibTobkw2ZW1duRqeT89l4=; b=
	Ksdp7OZVjSYLbO1kfJ8VmAOkrgNeZvO/Dsx6O9m9lUgnZW2bfWOdaGQ/6CI6elXj
	Kt8X459ukkUw8ApDxkra5ACn/ff5gkvZ+Fxc6FTSIysGJHYmC2SF94zjvYUhNi5V
	9/ouztTY6TBU//vidKgbX34rhoV7DjJdI7ikEI6mhUj0T0+88q/H3VUx1FIvwWJT
	erCJAAKX7V6wLWPaDEu7vSwZgAFBFxnVQUgw5RZZhhP+e1trmMcmaGIyyF9cjaMk
	WeaJMbTd9zhwaEPJ+e664VQTy2UECl93cOEvL5iRxtRNvdcMadpD/KuqIUA080hf
	Viwh+NPubLirbx6gQv+HEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790978950; x=
	1791065350; bh=pCSuIPdblIzqaBrIM04shoibTobkw2ZW1duRqeT89l4=; b=S
	e8r3teteuMKxWh57DaI1RN67kL7J2Z8hNOBAhhkjJ/ge5u/yNsfvLZ2V5++dJsUO
	2gFXWeAIV/ED7BQVNaQP6mQRcBULXtef13m64WSuvzJ/Wc62j1wo3HsiR7b+EeG7
	MRxpu1eCZnMN62NZFdYO2ctbx/qSSNKizImMX2ZAKYN/lLfyuRE95ybJQg2vdlfQ
	+YuZPl53Un8ybHei9PjrCvUOpc0dTzN6vlrspWWOhfuk0dbKiHeinflrjw9YYC4L
	Ta9FTV6K/GJJhDSd+4H4QtpIwNrYwGr5kG3aIskOcLLhxJlK9IIDiJxKOffnf6+e
	pWpSVrVQ5Pz1busX5403A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790978950; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:LvUGyJyOdubjoToFBtfccYES8R7K0QEWRxpTDJmN0LEV476
	SDlUjzueNDG07QJ2+AQ85bp1LDwZxuflTJvjEs26VYJiOm/EifAS7xkiqwOK/XVe
	El2ikbLzyM/bLmRT5xksdd6S/DT1FvcDgy2vjOCAs+/Wp6sNFWINxui02mKToN2F
	C7C/KAcGKV3Z5/KGVla83jwag54tmY1PqRJS13WsLi7LCqSKWL68HHN9tl4B7V7l
	QExKOGL0MfY8gX6MTSnOqoFMmTyPrI0oePC1xvsa9NtsnqQ6Ao22wBYxX3jT4i6K
	OYsWNYRws4FKE69k+OXEwVmR3NkZG/rzPXPgb0g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:eUQ9V+zYLycFz/usZSs9N8p/gZDzTV5q9D+cBOXMqts=:9wcm4N3huIoWuCgIPOf94fmCQXX/8Szq1BGkBZOAu0k=;
X-ME-Sender: <xms:hSvAalaG_UAuLdB7QAxx3j7wUrHhut6mcSGO0QBu2sGppNNsKXealg>
    <xme:hSvAanNKernNo8OQYRVVigYBWTnmWt0EbZ3E4U1OsSDY0ZOf8U9VP9QeWj5xPWPgJ
    k8oMrUtiY1r4T_z399rpkVeDI8YDNkFYlg8xVO7JDMvBW8fwFmZ-P4>
X-ME-Proxy-Cause: dmFkZTEp/dKlCo+Gg+J0+3HdIaJucbcySzZUz7VdhVEzftqMB/rQpbsPkZ36HZc+owHjf6
    YnrgaDiLndcM07w99r9IF8NAwdPXDfTiytzk1kZHbxgr7w3wFjBWXKdnPXBusjNnqFyQRS
    MHrkVtN9CqnQ1hHPhll1o0t6lBSEePVawWOtGFAUMFFZ9QoVcgsPJjAo//H18qMxm/q+hX
    9d2c5Gq4gTMYAzvaf3WfwdN4UtCGaVMhH79LJkID4+sQJA++9Fvam0hW53wIdj7Yrg1VZ7
    DZLIQXhZ/ulZFnN1H5+OkI1TzDcI+gjzxuVIfLSeKoTXz08qMoarhHhH5Mqy/GXRtVzDpb
    DahBz3aBKWhzh0ZgdQlOs2NBikgNG4V8v703mmAgT9WajQllx3k5pT267NcTAR9WXUnrSJ
    Ytl39UVPuDLXouQ0oW43hhns9at+AExS7JFZYlTW1Sr3xTFBiLzHV4LLkQua/VhlXthSvU
    GOsDzGIa40SyhA1oSf01O/tkdJVWieIgD3rSqgWtVr3ioVxySpOoqHymUJaxe8vdBx1a9m
    oj8a5qYSZBch2LRTbc0BZR69fDe7QhB7u/v5+Tue0bvnb1LLxyWGP4974ZupIWj61VkfMQ
    JHafuK/a0rJKvIn3Vj3CsFGrIFWLGOVs86K1ko0xwx7wpBefyievzMj7rhrQ
X-ME-Proxy: <xmx:hSvAajAthiKVHxmnEJMBEpDEWKXqFKnedryhWLfvOK9DSonrQ3d3wg>
    <xmx:hSvAajm9R9oKhBHi6YcqRVrVVMY4vTLmYobh5djvq42QFo5o9rBqag>
    <xmx:hSvAauci87b03qakkubAw2Ml0FfDEW_Igr8ADmCJNwm9fJ_q9Gkl-w>
    <xmx:hSvAanRhPmRBOdls0br0ZRiK8IsyLuuz9_14FUI4Kw98xeeQ6nQxWQ>
    <xmx:hivAal8TLYOcJzANvjc7wN6uaD9ENP-b27Cbaay9sh_FNxIzKRwO83jH>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 51C942C0006F; Fri,  2 Oct 2026 18:09:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AcGzoZcWswFR
Date: Fri, 02 Oct 2026 18:08:48 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: "Prasanth Ksr" <prasanth.ksr@dell.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, Dell.Client.Kernel@dell.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <c73ea81b-62b3-4cbc-a597-0672f65cdb1f@app.fastmail.com>
In-Reply-To: <deae55a0-cc2e-453e-8713-7ccc53947923@app.fastmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-6-mpearson-lenovo@squebb.ca>
 <f0407ed1-3b8f-4285-8349-926edf80e54f@gmx.de>
 <f0c68763-7960-458f-8a82-f5761ea61890@app.fastmail.com>
 <90fffebb-2c6e-49de-9a73-df194cff0845@gmx.de>
 <deae55a0-cc2e-453e-8713-7ccc53947923@app.fastmail.com>
Subject: Re: [RFC PATCH 5/7] platform/x86: think-lmi: Initial ThinkLMI v2 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Armin,

On Mon, Sep 28, 2026, at 9:08 PM, Mark Pearson wrote:
> On Fri, Sep 25, 2026, at 4:00 PM, Armin Wolf wrote:
>> Am 25.09.26 um 21:00 schrieb Mark Pearson:
>>
>>> Thanks Armin
>>>
>>> On Fri, Sep 25, 2026, at 2:53 PM, Armin Wolf wrote:
>>>> Am 25.09.26 um 18:00 schrieb Mark Pearson:
>>>>
>>>>> Lenovo Thinkpad, Thinkstation and ThinkCenter are moving to a new common
>>>>> WMI implementation.
>>>>>
>>>>> This driver adds initial support for the new implementation, allowing
>>>>> attributes to be read and modified.
>>>>>
>>>>> Certificate based authentication is not implemented in this
>>>>> version.
>>>>>
>>>>> think-lmi is updated to use this driver if supported by the HW and
>>>>> requested by the user.
>>>>>
>>>>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>>> ---
>>>>>    drivers/platform/x86/lenovo/think-lmi-v2.c | 960 +++++++++++++++++++++
>>>>>    drivers/platform/x86/lenovo/think-lmi.c    |   9 +-
>>>>>    drivers/platform/x86/lenovo/think-lmi.h    |  59 ++
>>>>>    3 files changed, 1025 insertions(+), 3 deletions(-)
>>>>>    create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c
>>>>>
>>>>> diff --git a/drivers/platform/x86/lenovo/think-lmi-v2.c b/drivers/platform/x86/lenovo/think-lmi-v2.c
>>>>> new file mode 100644
>>>>> index 000000000000..5bc0a349c5fb
>>>>> --- /dev/null
>>>>> +++ b/drivers/platform/x86/lenovo/think-lmi-v2.c
>>>>> @@ -0,0 +1,960 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>> +/*
>>>>> + * Think LMI V2 BIOS configuration driver
>>>>> + *
>>>>> + * Copyright(C) 2026 Lenovo
>>>>> + * Distributed under the GPL-2.0 license
>>>>> + */
>>>>> +
>>>> ...
>>>>
>>>>> +/* Get password settings from BIOS */
>>>>> +static int tlmi_get_pwd_settings(void)
>>>>> +{
>>>>> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>>>>> +	const union acpi_object *obj;
>>>>> +	acpi_status status;
>>>>> +
>>>>> +	if (!tlmi_priv.can_get_password_settings)
>>>>> +		return -EOPNOTSUPP;
>>>>> +
>>>>> +	status = wmi_query_block(LENOVO_BIOS_ACCESS_DATA_GUID, 0, &output);
>>>> Big NACK from my side, this function is deprecated and scheduled for removal.
>>>>
>>>> If i understand correctly the core drivers needs two WMI GUIDs, one for
>>>> discovering
>>>> settings and one for operating on those settings. Please use the
>>>> component framework
>>>> to link those two together by register a component for the data GUID
>>>> and a component
>>>> master for the method GUID.
>>>>
>>>> This also allows you to use the modern buffer-based WMI API, so you can
>>>> leave ACPI
>>>> behind when writing this driver.
>>>>
>>> OK - good to know. As a note, I suspect the original driver will need updating here too.
>>>
>>> For "use the component framework to link those two together" - is there an example or documentation you can recommend as a reference for doing this?
>>
>> https://docs.kernel.org/driver-api/component.html, other than that the 
>> Lenvovo Gamezone drivers AFAIK uses it,
>> but in a IMHO convoluted way.
>>
> Thanks - I'm getting my head around this all :)
>
>>>>> +	if (ACPI_FAILURE(status))
>>>>> +		return -EIO;
>>>>> +
>>>>> +	obj = output.pointer;
>>>>> +	if (!obj)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	if (obj->type != ACPI_TYPE_PACKAGE) {
>>>>> +		kfree(obj);
>>>>> +		return -EIO;
>>>>> +	}
>>>>> +
>>>>> +	tlmi_priv.pwdcfg_v2.password_state = obj->package.elements[0].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.minlen = obj->package.elements[1].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.maxlen = obj->package.elements[2].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.strong_password = obj->package.elements[3].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.supported_encodings = obj->package.elements[4].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.supported_keyboard = obj->package.elements[5].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.hdd_user_password = obj->package.elements[6].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.hdd_master_password = obj->package.elements[7].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.nvme_user_password = obj->package.elements[8].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.nvme_master_password = obj->package.elements[9].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.deploy_mode = obj->package.elements[10].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.sys_mgr_pwd_ctrl = obj->package.elements[11].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.power_on_pwd_ctrl = obj->package.elements[12].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.storage_pwd_ctrl = obj->package.elements[13].integer.value;
>>>>> +	tlmi_priv.pwdcfg_v2.sys_mgr_setup_ctrl = obj->package.elements[14].integer.value;
>>>>> +
>>>>> +	if (WARN_ON(tlmi_priv.pwdcfg_v2.maxlen >= TLMI_PWD_BUFSIZE))
>>>>> +		tlmi_priv.pwdcfg_v2.maxlen = TLMI_PWD_BUFSIZE - 1;
>>>>> +
>>>>> +	tlmi_priv.pwd_admin = tlmi_create_auth(SVP, "bios-admin");
>>>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SVP_PWD)
>>>>> +		tlmi_priv.pwd_admin->pwd_enabled = true;
>>>>> +
>>>>> +	tlmi_priv.pwd_power = tlmi_create_auth(POP, "power-on");
>>>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_POP_PWD)
>>>>> +		tlmi_priv.pwd_power->pwd_enabled = true;
>>>>> +
>>>>> +	tlmi_priv.pwd_system = tlmi_create_auth(SMP, "system");
>>>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SMP_PWD)
>>>>> +		tlmi_priv.pwd_system->pwd_enabled = true;
>>>>> +
>>>>> +	tlmi_priv.pwd_hdd = tlmi_create_auth(HDD1, "hdd");
>>>>> +	tlmi_priv.pwd_hdd->index = 1;
>>>>> +	if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
>>>>> +	    tlmi_priv.pwdcfg.ext.hdd_master_password) {
>>>>> +		tlmi_priv.pwd_hdd->pwd_enabled = true;
>>>>> +		if (tlmi_priv.pwdcfg.ext.hdd_master_password)
>>>>> +			tlmi_priv.pwd_hdd->index =
>>>>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_master_password) - 1;
>>>>> +		else
>>>>> +			tlmi_priv.pwd_hdd->index =
>>>>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>>>>> +	}
>>>>> +
>>>>> +	tlmi_priv.pwd_nvme = tlmi_create_auth(NVME1, "nvme");
>>>>> +	tlmi_priv.pwd_nvme->index = 1;
>>>>> +	if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>>>>> +	    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>>>> +		tlmi_priv.pwd_nvme->pwd_enabled = true;
>>>>> +		if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>>>>> +			tlmi_priv.pwd_nvme->index =
>>>>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_master_password) - 1;
>>>>> +		else
>>>>> +			tlmi_priv.pwd_nvme->index =
>>>>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_user_password) - 1;
>>>>> +	}
>>>>> +
>>>>> +	kfree(obj);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int tlmi_analyze(struct wmi_device *wdev)
>>>>> +{
>>>>> +	int i, ret;
>>>>> +
>>>>> +	if (wmi_has_guid(LENOVO_BIOS_CONFIGURATION_GUID))
>>>>> +		tlmi_priv.can_set_bios_settings = true;
>>>>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_DATA_GUID))
>>>>> +		tlmi_priv.can_get_password_settings = true;
>>>>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_GUID)) {
>>>>> +		tlmi_priv.can_set_bios_password = true;
>>>>> +		tlmi_priv.certificate_support = true;
>>>>> +	}
>>>> This should be used to determine which components the component master wants
>>>> to bind to, as some of them seem to be optional.
>>>>
>>>> Using wmi_has_guid() will not work for duplicated GUIDs, so we need a
>>>> new function
>>>> here. I can write a patch that adds:
>>>>
>>>> 	bool wmidev_exists(const char *guid);
>>>>
>>>> You could then carry this patch with this patch series.
>>>>
>>> That would fantastic - thanks!
>>>
>>> Mark
>>
>> Ok. Is the firmware interface still being in development? Because i 
>> would prefer if the main
>> WMI object (aka the component master) would contain some WMI methods to 
>> determine which optional
>> features are supported.
>>
> Sorry - somehow missed your message in my inbox.
>
> FW interface is pretty much done. Putting changes in would be quite 
> hard now as we'd have to co-ordinate across three different business 
> units and the 2027 platforms (where this is being targeted) are just 
> around the corner.
>
> What did you have in mind? Changes aren't impossible...but difficult.
>
> Mark

Your patch works - but I changed it to accept a string as input first. e.g:

bool wmidev_exists(const char *guid_string)
{
        guid_t guid;
        int ret;

        ret = guid_parse(guid_string, &guid);
        if (ret < 0)
                return false;

        return bus_for_each_dev(&wmi_bus_type, NULL, (void *)&guid, wmidev_match_guid) == 1;
}

Any concerns?

Mark
