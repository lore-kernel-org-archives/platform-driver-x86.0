Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917A53BB685
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 20:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790366732; cv=none; b=biwRDQr3ShBUWwLIok+4XuQK9qvn4PGgtje4alKeCBtZG0bOxyOMFgQvvMNlrLGSwRvt41Wy/Hgjsb/RaHVK7QDAozfNX8IlwozSLJSlT6ZZ1kFFz/ivHOXQRzEpp+8FpyTnLrmxZr+ReP3AUd5BEGI5TmitMmXvm9MHo4DN3cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790366732; c=relaxed/simple;
	bh=folkZ2e1yN2V8yJhrzSjMV/H6vaFGTyP1kjvoOlb67k=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=NiAcJb0bTNdSq97cBXjCGcyrEUup1zerfcqAKJVon1/jRs4bQT7/V4ST18jl1wTOd2ap/Pdn4yD9SzCsH2qF0QaZDKfbOt9Q5qxoYViGIUeLbUi6SZZ1zRo0BB7ZoPCIYsq+PjT0aDPH9xh635n7cOc5mC9NFgXLuwVc1QmoycA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AH3tvx9o; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AH3tvx9o"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144e32aaa1cso746941c88.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 13:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790366729; x=1790971529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Sc/i6S1sztROELgnMavOwHck5lUosuN2hOrqcWD1t24=;
        b=AH3tvx9o1beo8eVaE3cEvPqX3vjMdODKWVaZOWc4Hb9gE9+rLLs9X2T/R79nT2J5Dj
         XkXQ+pgN12O//itGbHb01j/DE1R9qLy8oriYU6YgLOlysMqsLA0rRCab5r946uvO5nRC
         cwrHGn7ClmaGXQOOvnN8EXlTEFKaKZZyTiR2JLse88V1mGcfnMrHF3AHid1FlADSLEAa
         +nAxNnhfLl/9m+CH3V0vDlW1NqC3lFTwluQKOR+x7S9e1BXJi9JGBkwa+eFxggU57wR2
         +99XeuJMeWmC8JgYmZMpnaS41e5kWoTJPlcvQsR9ZXFCTxe94wMqDptDwf/1icPBlWXD
         7KoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790366729; x=1790971529;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sc/i6S1sztROELgnMavOwHck5lUosuN2hOrqcWD1t24=;
        b=NB11R3mKc3gJOeaHrbZOyc0iL4pNaAVFf5KN5SBewjy7pWiavX2HdI4i1Rn8E4aHq5
         6Vlj63CuaopOPc4XnCYzrnfetqeGeG8tIkn/vcqov14Xn/1UM3HQxrjOU7WPT7PW7+NR
         yR7oFp4d5a0esgzb9AZQlX+tvXf9oO7fvDq3ATEJB0KHZRjtuMZ0HZWNbmb+Lluhmq7k
         AF5vK0njuPxiHOBLkK9dL0T7QRNfjN+6ehSWR7Z1WO25KOJu8qxOXs7D8BbkFa6V/PeD
         NqxGazm19BJR+4lE5sykaY9XC+V/8ewm6Bw/c9g6pOiIfdCXr/9Ny2TkHYB4Ry3n+/gX
         p1iA==
X-Forwarded-Encrypted: i=1; AKwUvBx9tpOdUoq51ppnsC9xTkCT6PlqxNDiuMcMoXAthgyY19c16//1+hUhZZUormLF4NZaCJ7OKUVO9pSoMFUV2CtZQUtF@vger.kernel.org
X-Gm-Message-State: AFuF++kDiSY+uHVxle7aTwKGiFCutRwV9YF/W679YaO7nIsAJOcyPmRU
	zkvVMU3E1IqrLFmsOHw8DxQ5VYMVe2yennuCdoe86cb/6ISOqcfpGzJO
X-Gm-Gg: AYBFou1tf3S+jb+N9pf+V1RtF/N0znIUPrEzsdieLavPz05o9iaKGrnUSVHZ2BDSfXW
	rk1Nnr9rvgOxMs0Hf5xCIsUD1VZT5qSLHAEf78VHokdNhS63KV2Xq1SrDD4oUMWC0APbTqaj3ee
	ju/uGtKsuSGX4JtR+VCVDqt4oHyhbXTBQxUuH5HwHXgZifKLyTdouPFU18ZhlZ3XVgysd1lzG16
	ms949f82MeZhXMBbCfq7K0YPJHsNvoV7X+ZxvK0iNi13sqNIlCf+ybpBQDdJRFS96Du3CotOVNf
	g+/ggUnN/vxoUGk1o5PofyQhkSVegLrTQYTabDvv7/YTrs4NqL8POAGXJvkZkxFcYVe9vj8evpr
	EAf0q8Nr4oMCYGXRWMZXUmIM5xeYk4BnuEq3OvTrbas1+I8UQ+flAZl9Ul+u3ksiNbRWSngFTOL
	MbJtdaKfCOu2RRhmn3VptreDXzu0j6QIgyX39ufLHp7EvlKfWYMtaWoQK1IQFhbT8+U+uSi+qGf
	KV9hcYULexMbVxf22IYhUDgdGxWK+j4StyHfUW1FZksBkkhvc9sG2Jeci7RMoQSFYn+
X-Received: by 2002:a05:701b:220a:b0:143:2969:f9f4 with SMTP id a92af1059eb24-146cfec8538mr1320080c88.24.1790366729193;
        Fri, 25 Sep 2026 13:05:29 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3416e4c2f50sm7695516eec.27.2026.09.25.13.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 13:05:28 -0700 (PDT)
Date: Fri, 25 Sep 2026 13:05:28 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>
CC: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Dell.Client.Kernel@dell.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_5/7=5D_platform/x86=3A_t?=
 =?US-ASCII?Q?hink-lmi=3A_Initial_ThinkLMI_v2_driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <f0c68763-7960-458f-8a82-f5761ea61890@app.fastmail.com>
References: <mpearson-lenovo@squebb.ca> <20260925160047.2063361-1-mpearson-lenovo@squebb.ca> <20260925160047.2063361-6-mpearson-lenovo@squebb.ca> <f0407ed1-3b8f-4285-8349-926edf80e54f@gmx.de> <f0c68763-7960-458f-8a82-f5761ea61890@app.fastmail.com>
Message-ID: <B8915D67-6B93-43F9-9A6D-F9AFF3E55A27@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 25, 2026 12:00:24 PM PDT, Mark Pearson <mpearson-lenovo@squebb=
=2Eca> wrote:
>Thanks Armin
>
>On Fri, Sep 25, 2026, at 2:53 PM, Armin Wolf wrote:
>> Am 25=2E09=2E26 um 18:00 schrieb Mark Pearson:
>>
>>> Lenovo Thinkpad, Thinkstation and ThinkCenter are moving to a new comm=
on
>>> WMI implementation=2E
>>>
>>> This driver adds initial support for the new implementation, allowing
>>> attributes to be read and modified=2E
>>>
>>> Certificate based authentication is not implemented in this
>>> version=2E
>>>
>>> think-lmi is updated to use this driver if supported by the HW and
>>> requested by the user=2E
>>>
>>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb=2Eca>
>>> ---
>>>   drivers/platform/x86/lenovo/think-lmi-v2=2Ec | 960 +++++++++++++++++=
++++
>>>   drivers/platform/x86/lenovo/think-lmi=2Ec    |   9 +-
>>>   drivers/platform/x86/lenovo/think-lmi=2Eh    |  59 ++
>>>   3 files changed, 1025 insertions(+), 3 deletions(-)
>>>   create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2=2Ec
>>>
>>> diff --git a/drivers/platform/x86/lenovo/think-lmi-v2=2Ec b/drivers/pl=
atform/x86/lenovo/think-lmi-v2=2Ec
>>> new file mode 100644
>>> index 000000000000=2E=2E5bc0a349c5fb
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo/think-lmi-v2=2Ec
>>> @@ -0,0 +1,960 @@
>>> +// SPDX-License-Identifier: GPL-2=2E0-or-later
>>> +/*
>>> + * Think LMI V2 BIOS configuration driver
>>> + *
>>> + * Copyright(C) 2026 Lenovo
>>> + * Distributed under the GPL-2=2E0 license
>>> + */
>>> +
>>
>> =2E=2E=2E
>>
>>> +/* Get password settings from BIOS */
>>> +static int tlmi_get_pwd_settings(void)
>>> +{
>>> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>>> +	const union acpi_object *obj;
>>> +	acpi_status status;
>>> +
>>> +	if (!tlmi_priv=2Ecan_get_password_settings)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	status =3D wmi_query_block(LENOVO_BIOS_ACCESS_DATA_GUID, 0, &output)=
;
>>
>> Big NACK from my side, this function is deprecated and scheduled for re=
moval=2E
>>
>> If i understand correctly the core drivers needs two WMI GUIDs, one for=
=20
>> discovering
>> settings and one for operating on those settings=2E Please use the=20
>> component framework
>> to link those two together by register a component for the data GUID=20
>> and a component
>> master for the method GUID=2E
>>
>> This also allows you to use the modern buffer-based WMI API, so you can=
=20
>> leave ACPI
>> behind when writing this driver=2E
>>
>
>OK - good to know=2E As a note, I suspect the original driver will need u=
pdating here too=2E
>
>For "use the component framework to link those two together" - is there a=
n example or documentation you can recommend as a reference for doing this?
>

Mark,
We do this in lenovo-wmi-other/capdata=2E
- Derek

>>> +	if (ACPI_FAILURE(status))
>>> +		return -EIO;
>>> +
>>> +	obj =3D output=2Epointer;
>>> +	if (!obj)
>>> +		return -ENOMEM;
>>> +
>>> +	if (obj->type !=3D ACPI_TYPE_PACKAGE) {
>>> +		kfree(obj);
>>> +		return -EIO;
>>> +	}
>>> +
>>> +	tlmi_priv=2Epwdcfg_v2=2Epassword_state =3D obj->package=2Eelements[0=
]=2Einteger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Eminlen =3D obj->package=2Eelements[1]=2Einte=
ger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Emaxlen =3D obj->package=2Eelements[2]=2Einte=
ger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Estrong_password =3D obj->package=2Eelements[=
3]=2Einteger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Esupported_encodings =3D obj->package=2Eeleme=
nts[4]=2Einteger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Esupported_keyboard =3D obj->package=2Eelemen=
ts[5]=2Einteger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Ehdd_user_password =3D obj->package=2Eelement=
s[6]=2Einteger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Ehdd_master_password =3D obj->package=2Eeleme=
nts[7]=2Einteger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Envme_user_password =3D obj->package=2Eelemen=
ts[8]=2Einteger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Envme_master_password =3D obj->package=2Eelem=
ents[9]=2Einteger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Edeploy_mode =3D obj->package=2Eelements[10]=
=2Einteger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Esys_mgr_pwd_ctrl =3D obj->package=2Eelements=
[11]=2Einteger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Epower_on_pwd_ctrl =3D obj->package=2Eelement=
s[12]=2Einteger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Estorage_pwd_ctrl =3D obj->package=2Eelements=
[13]=2Einteger=2Evalue;
>>> +	tlmi_priv=2Epwdcfg_v2=2Esys_mgr_setup_ctrl =3D obj->package=2Eelemen=
ts[14]=2Einteger=2Evalue;
>>> +
>>> +	if (WARN_ON(tlmi_priv=2Epwdcfg_v2=2Emaxlen >=3D TLMI_PWD_BUFSIZE))
>>> +		tlmi_priv=2Epwdcfg_v2=2Emaxlen =3D TLMI_PWD_BUFSIZE - 1;
>>> +
>>> +	tlmi_priv=2Epwd_admin =3D tlmi_create_auth(SVP, "bios-admin");
>>> +	if (tlmi_priv=2Epwdcfg_v2=2Epassword_state & TLMI_SVP_PWD)
>>> +		tlmi_priv=2Epwd_admin->pwd_enabled =3D true;
>>> +
>>> +	tlmi_priv=2Epwd_power =3D tlmi_create_auth(POP, "power-on");
>>> +	if (tlmi_priv=2Epwdcfg_v2=2Epassword_state & TLMI_POP_PWD)
>>> +		tlmi_priv=2Epwd_power->pwd_enabled =3D true;
>>> +
>>> +	tlmi_priv=2Epwd_system =3D tlmi_create_auth(SMP, "system");
>>> +	if (tlmi_priv=2Epwdcfg_v2=2Epassword_state & TLMI_SMP_PWD)
>>> +		tlmi_priv=2Epwd_system->pwd_enabled =3D true;
>>> +
>>> +	tlmi_priv=2Epwd_hdd =3D tlmi_create_auth(HDD1, "hdd");
>>> +	tlmi_priv=2Epwd_hdd->index =3D 1;
>>> +	if (tlmi_priv=2Epwdcfg=2Eext=2Ehdd_user_password ||
>>> +	    tlmi_priv=2Epwdcfg=2Eext=2Ehdd_master_password) {
>>> +		tlmi_priv=2Epwd_hdd->pwd_enabled =3D true;
>>> +		if (tlmi_priv=2Epwdcfg=2Eext=2Ehdd_master_password)
>>> +			tlmi_priv=2Epwd_hdd->index =3D
>>> +				ffs(tlmi_priv=2Epwdcfg=2Eext=2Ehdd_master_password) - 1;
>>> +		else
>>> +			tlmi_priv=2Epwd_hdd->index =3D
>>> +				ffs(tlmi_priv=2Epwdcfg=2Eext=2Ehdd_user_password) - 1;
>>> +	}
>>> +
>>> +	tlmi_priv=2Epwd_nvme =3D tlmi_create_auth(NVME1, "nvme");
>>> +	tlmi_priv=2Epwd_nvme->index =3D 1;
>>> +	if (tlmi_priv=2Epwdcfg=2Eext=2Envme_user_password ||
>>> +	    tlmi_priv=2Epwdcfg=2Eext=2Envme_master_password) {
>>> +		tlmi_priv=2Epwd_nvme->pwd_enabled =3D true;
>>> +		if (tlmi_priv=2Epwdcfg=2Eext=2Envme_master_password)
>>> +			tlmi_priv=2Epwd_nvme->index =3D
>>> +				ffs(tlmi_priv=2Epwdcfg=2Eext=2Envme_master_password) - 1;
>>> +		else
>>> +			tlmi_priv=2Epwd_nvme->index =3D
>>> +				ffs(tlmi_priv=2Epwdcfg=2Eext=2Envme_user_password) - 1;
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
>>> +		tlmi_priv=2Ecan_set_bios_settings =3D true;
>>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_DATA_GUID))
>>> +		tlmi_priv=2Ecan_get_password_settings =3D true;
>>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_GUID)) {
>>> +		tlmi_priv=2Ecan_set_bios_password =3D true;
>>> +		tlmi_priv=2Ecertificate_support =3D true;
>>> +	}
>>
>> This should be used to determine which components the component master =
wants
>> to bind to, as some of them seem to be optional=2E
>>
>> Using wmi_has_guid() will not work for duplicated GUIDs, so we need a=
=20
>> new function
>> here=2E I can write a patch that adds:
>>
>> 	bool wmidev_exists(const char *guid);
>>
>> You could then carry this patch with this patch series=2E
>>
>That would fantastic - thanks!
>
>Mark

