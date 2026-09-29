Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4541F12F8
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 01:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790644136; cv=none; b=eLYgVyfRlgNdiWVPaerI8fhdgiImkY2b+5IlbuqJEooBlyL2+oUqalCsvQSCz2ICKSP7mcbNGGfF4oPD4QoS+2chqnD5xYicEtqQs0Ccbif9S+SW99fhP0x+w7mQ/ftQBAVs8PV/MhQBMAzzD6xN8ZifpNeurZfA0Xt8LrsFIiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790644136; c=relaxed/simple;
	bh=653pP46gQwXTIIAWPuR4Js5P1o6nEmWLCRu0IIPyCVA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=m2MLb9sK0dadFfSJxwnr+U7Pp/06iWyPOmdkdZcCEFUbxgkbZsV5py8UYaxWm/iyALefGKHvKPpCfRpXCQFdYcSRaZU/sXmIvKlH9/v2bST5bB/w6x2DqSeg3b47u6UTpwmT5Y9AzobAWWVy0QMA0vUJkenCoKUOSH3ZuAmRk3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=KD3jxhu/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ltiYuJvt; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="KD3jxhu/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ltiYuJvt"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id C4D6A1D000F1;
	Mon, 28 Sep 2026 21:08:52 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 28 Sep 2026 21:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1790644132;
	 x=1790730532; bh=/9eyunkrVC6b97j+uavSiITFP4tyGLknG4fyiTuXlT4=; b=
	KD3jxhu/cD+1nTo7ifNScSqYblRDSRq/4t+EcJ1SIn7A57D5FqV2n/l5em5pwusa
	RgAZ6IPHRp/Cqk/MayH6WC9LwYwvl1UJLYqBxXJ8LvbU3tJ44Xf5fKOKI3qr+b2w
	aDiARubv/9jynk/G07uDr8jiki7Lblv8bUt+v1ji2ZloxxRzpB5t96llrbGLBMXo
	lljGy/B3wbkbGCpq60/JUG2N60/zYdHRzHjcaWDAxvkFmrmDetgztbcm0SIBcjqW
	aHzjQWh8ajp6GxaNdm/vrCFbrkyv6R3AxYFV8jLMMiOBADvJvvwpE1Sa9wkDklGZ
	D/w2joyXFLgSuFoxLJBGcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790644132; x=
	1790730532; bh=/9eyunkrVC6b97j+uavSiITFP4tyGLknG4fyiTuXlT4=; b=l
	tiYuJvtPulgp1JyV3oB7I3Lpb4glMTzBjMQPGp7UzVlclzhC8xsl0OyNSb+gqMur
	y4ZkDyusMZAPTDmGFC9xD8yaJVpQGmS6YgNd+RwoOAZKUGe8gdUfp4p1B+4298o5
	MVDUlxkrVQtzJExNMwjHBTa5WkDJg27I7bKiOUAGeQM1GMK7UmlD7uChE/ics5KQ
	ZtXYR9pa+rLAwRvdIbFOrfm/g3udXThNopXYAr14sCUBuuP3SwEICmyPvvcC92fF
	64LdbfNl2XNXkIQIywWd0F6wrHxwi1OfR1eiHoYh6WLvvBUNFPB1DbHL49mz6RPs
	VIQcyvV00x2re+XyufpqA==
X-ME-Sender: <xms:pA-7ahpBlOs1sOUk4_eND7UzNWpAdG3jIDnb-G4HkymmZKZ67Lws_g>
    <xme:pA-7aufnI-xUs8NrCEcUQ0Ged1Gn1UtYq0p-f1G5MvySnERzSCR3DtWRIPspib470
    Vi6Z94DlWKrCjIsX_mklRZIbYLs6i7765A85aTCUrTdQplJIDkB519d>
X-ME-Proxy-Cause: dmFkZTFjUjDwdkrl2009bsyxHc3DHuY+sWxe2/eH6xMF5RD+6R+HfKK9ywhs4rIFM76s7h
    q3hbzDgb9Fl8VLf5z1WUs+roCFy1qxR+9GA0NXUGkYLfCGQ05qyafxD6iPEXKku0+kPILS
    sEpVT6Lrz6s/A3tFV0hlx5sO6PMmb5nXbUuBsR0faFR+jEYxKrGPp+8FbZ66dDLV+y9NHj
    A30iEEaTM2vL8STChTfF39UltcRiSA1CviRLu4nngMup67FrAERYWqKsYFI3X2ZyLO+RYD
    LWI8XeVYpo0qIA2W1d2f9nAzhJay20NiIt6PgDJMkciYI59eQu24j5SgSQBT476gay8hsD
    Rnbv/0OhbZVQIy3F9FOyEH8L/1bxnRkhDkHNmWEwQkoT5Y4aMgW5gUrfmlYBLPmQkInoao
    TlWEa+6+t8Pg5hCPkaudBzgFDMZJn7s+mWac0tlBb8FtJFimFJh+Jv2u9wLLc1l6TdXfWi
    ECfEUu3zOPCd+e1N5r876Y614GrM4hUv0N3sVKIfMRAauZmCwPdiYE3UglgYmm1wu+12gW
    pG7Injl7mjH+Y0MuNaoCOWoOF3HQ3Pq4cLzH/UE72Ocq3jHnRdYlaPflGl3ts5yk8mk/lV
    BX+b4JnxR8YzF3kKLRMc6L/wUxmGPdNykpJXBySWjDVCIAE1PR6j7dw/VOCg
X-ME-Proxy: <xmx:pA-7avRSCjbR6ADT1PFB9Wwal-SpRt6S5UTedE-OqV3ohjuJ7QkXOg>
    <xmx:pA-7aq3pKaypingpgLNCfKDHd-Iyde5XAxAJEuFdwN6zGVZQw7yztQ>
    <xmx:pA-7aktIINuhiqa453Vkcj1Be9kR8Xu7J4hWcqU9HksYdWbJbOXbPA>
    <xmx:pA-7agglP4szFNcwsyZ_JCm4Hso4LR5mv3VhgYcA1v5YF8kzu5AsKw>
    <xmx:pA-7aoPyDc_5lazmwmpSd_M4WUdvJkpAmNDVZGRXg7g4XXYnHIc-ffHr>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id E5AF42C0006F; Mon, 28 Sep 2026 21:08:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AcGzoZcWswFR
Date: Mon, 28 Sep 2026 21:08:31 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: "Prasanth Ksr" <prasanth.ksr@dell.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, Dell.Client.Kernel@dell.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <deae55a0-cc2e-453e-8713-7ccc53947923@app.fastmail.com>
In-Reply-To: <90fffebb-2c6e-49de-9a73-df194cff0845@gmx.de>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-6-mpearson-lenovo@squebb.ca>
 <f0407ed1-3b8f-4285-8349-926edf80e54f@gmx.de>
 <f0c68763-7960-458f-8a82-f5761ea61890@app.fastmail.com>
 <90fffebb-2c6e-49de-9a73-df194cff0845@gmx.de>
Subject: Re: [RFC PATCH 5/7] platform/x86: think-lmi: Initial ThinkLMI v2 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Fri, Sep 25, 2026, at 4:00 PM, Armin Wolf wrote:
> Am 25.09.26 um 21:00 schrieb Mark Pearson:
>
>> Thanks Armin
>>
>> On Fri, Sep 25, 2026, at 2:53 PM, Armin Wolf wrote:
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
>>>>    drivers/platform/x86/lenovo/think-lmi-v2.c | 960 +++++++++++++++++++++
>>>>    drivers/platform/x86/lenovo/think-lmi.c    |   9 +-
>>>>    drivers/platform/x86/lenovo/think-lmi.h    |  59 ++
>>>>    3 files changed, 1025 insertions(+), 3 deletions(-)
>>>>    create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c
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
>> OK - good to know. As a note, I suspect the original driver will need updating here too.
>>
>> For "use the component framework to link those two together" - is there an example or documentation you can recommend as a reference for doing this?
>
> https://docs.kernel.org/driver-api/component.html, other than that the 
> Lenvovo Gamezone drivers AFAIK uses it,
> but in a IMHO convoluted way.
>
Thanks - I'm getting my head around this all :)

>>>> +	if (ACPI_FAILURE(status))
>>>> +		return -EIO;
>>>> +
>>>> +	obj = output.pointer;
>>>> +	if (!obj)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	if (obj->type != ACPI_TYPE_PACKAGE) {
>>>> +		kfree(obj);
>>>> +		return -EIO;
>>>> +	}
>>>> +
>>>> +	tlmi_priv.pwdcfg_v2.password_state = obj->package.elements[0].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.minlen = obj->package.elements[1].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.maxlen = obj->package.elements[2].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.strong_password = obj->package.elements[3].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.supported_encodings = obj->package.elements[4].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.supported_keyboard = obj->package.elements[5].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.hdd_user_password = obj->package.elements[6].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.hdd_master_password = obj->package.elements[7].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.nvme_user_password = obj->package.elements[8].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.nvme_master_password = obj->package.elements[9].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.deploy_mode = obj->package.elements[10].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.sys_mgr_pwd_ctrl = obj->package.elements[11].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.power_on_pwd_ctrl = obj->package.elements[12].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.storage_pwd_ctrl = obj->package.elements[13].integer.value;
>>>> +	tlmi_priv.pwdcfg_v2.sys_mgr_setup_ctrl = obj->package.elements[14].integer.value;
>>>> +
>>>> +	if (WARN_ON(tlmi_priv.pwdcfg_v2.maxlen >= TLMI_PWD_BUFSIZE))
>>>> +		tlmi_priv.pwdcfg_v2.maxlen = TLMI_PWD_BUFSIZE - 1;
>>>> +
>>>> +	tlmi_priv.pwd_admin = tlmi_create_auth(SVP, "bios-admin");
>>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SVP_PWD)
>>>> +		tlmi_priv.pwd_admin->pwd_enabled = true;
>>>> +
>>>> +	tlmi_priv.pwd_power = tlmi_create_auth(POP, "power-on");
>>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_POP_PWD)
>>>> +		tlmi_priv.pwd_power->pwd_enabled = true;
>>>> +
>>>> +	tlmi_priv.pwd_system = tlmi_create_auth(SMP, "system");
>>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SMP_PWD)
>>>> +		tlmi_priv.pwd_system->pwd_enabled = true;
>>>> +
>>>> +	tlmi_priv.pwd_hdd = tlmi_create_auth(HDD1, "hdd");
>>>> +	tlmi_priv.pwd_hdd->index = 1;
>>>> +	if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
>>>> +	    tlmi_priv.pwdcfg.ext.hdd_master_password) {
>>>> +		tlmi_priv.pwd_hdd->pwd_enabled = true;
>>>> +		if (tlmi_priv.pwdcfg.ext.hdd_master_password)
>>>> +			tlmi_priv.pwd_hdd->index =
>>>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_master_password) - 1;
>>>> +		else
>>>> +			tlmi_priv.pwd_hdd->index =
>>>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>>>> +	}
>>>> +
>>>> +	tlmi_priv.pwd_nvme = tlmi_create_auth(NVME1, "nvme");
>>>> +	tlmi_priv.pwd_nvme->index = 1;
>>>> +	if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>>>> +	    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>>> +		tlmi_priv.pwd_nvme->pwd_enabled = true;
>>>> +		if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>>>> +			tlmi_priv.pwd_nvme->index =
>>>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_master_password) - 1;
>>>> +		else
>>>> +			tlmi_priv.pwd_nvme->index =
>>>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_user_password) - 1;
>>>> +	}
>>>> +
>>>> +	kfree(obj);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int tlmi_analyze(struct wmi_device *wdev)
>>>> +{
>>>> +	int i, ret;
>>>> +
>>>> +	if (wmi_has_guid(LENOVO_BIOS_CONFIGURATION_GUID))
>>>> +		tlmi_priv.can_set_bios_settings = true;
>>>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_DATA_GUID))
>>>> +		tlmi_priv.can_get_password_settings = true;
>>>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_GUID)) {
>>>> +		tlmi_priv.can_set_bios_password = true;
>>>> +		tlmi_priv.certificate_support = true;
>>>> +	}
>>> This should be used to determine which components the component master wants
>>> to bind to, as some of them seem to be optional.
>>>
>>> Using wmi_has_guid() will not work for duplicated GUIDs, so we need a
>>> new function
>>> here. I can write a patch that adds:
>>>
>>> 	bool wmidev_exists(const char *guid);
>>>
>>> You could then carry this patch with this patch series.
>>>
>> That would fantastic - thanks!
>>
>> Mark
>
> Ok. Is the firmware interface still being in development? Because i 
> would prefer if the main
> WMI object (aka the component master) would contain some WMI methods to 
> determine which optional
> features are supported.
>
Sorry - somehow missed your message in my inbox.

FW interface is pretty much done. Putting changes in would be quite hard now as we'd have to co-ordinate across three different business units and the 2027 platforms (where this is being targeted) are just around the corner.

What did you have in mind? Changes aren't impossible...but difficult.

Mark
