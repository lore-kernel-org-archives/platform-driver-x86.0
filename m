Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651CF4502F
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 01:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792114606; cv=none; b=LXTfNjRTCs+i6bcwpq4wW0SYl7fvKEHyT3gHak8bhqnRhODz1iRSNyBg406D3eBG+8fFbapi3cw5TGeTrMsJSC7YabCoq8ahZYOYmKGQ1w1eueW8HxvN8y2Oc0aHl7rV3XOTUnZohtwwad7aUKSGxBeKZV0MJ6VagfBVdVvAfPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792114606; c=relaxed/simple;
	bh=4H9T4VUulD/tG05EyhxjVBGERFgglqehYCOeAIbuZXE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RUGogGpVmfXWWPJq1a9EID3+hC7CZsmUXkLW0UFWw46dPI69WCjF5iN6XtUPscRXSZXGWtMPqpKeJnoxJ1qPJ12tfN4ezG+a7tJK/dRZee0cw1a2I8Z5ihF2LWKZvHLWappYUq96cVOkPlvCCHiswyQRwQfSbgHlUZMGsKAl6K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=If8L2Doj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=daEsTwsh; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="If8L2Doj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="daEsTwsh"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id 57636EC011D
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 21:36:43 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 15 Oct 2026 21:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1792114602;
	 x=1792201002; bh=ul+ngWLywgKQiugJN9aGkJJiKF1Ax+rFjGUbRDbYI+w=; b=
	If8L2DojtQUQQz/iaVNxU/+Yjvr6AmNNDChxYHdYGf+4dthi44e6WNHIW3iXVbKn
	W5RA9/bQnGsB8hmknT7gcsALq/5P6/co/17r4W9lqs5M4E/k9wMPLRWmvCkG6YJy
	KFAfNSEX4KCR9eKZi2lYRbPKNMPYvmxYrSfsOYLqLqZBAeexkWc/ktfI5SsWC3ob
	3g1Wp9QIxsf4sWyAPo+SnK1U3fXDTV4ygTMJi5DxIorCIGHSunSbywZ8kHi5bqm3
	SEj43FzUoXx+IZGXMOnvaGeL1qjw6vmvVmxEeEDjI/L1yLli/I/KnTVCN0Yyqkev
	HqjK92m/Ig9mUKBF9O0aZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792114602; x=
	1792201002; bh=ul+ngWLywgKQiugJN9aGkJJiKF1Ax+rFjGUbRDbYI+w=; b=d
	aEsTwshue1BkVWxbX7l/8iOoJGRtx0F5qhyJ1gBjXNjXBqu8XoKjqBBhF1K8Wb1Q
	hFCKEbFQ808Hfiojgn1HDTJzh4p8EufYVnswSg0LnszWL4DHqcJ5PlzN1Ixnq+1P
	PPo0Weuo/azMd77y4ftl1mddRBq+R77Aeta5wwH3zctFTST0wi6zd6EBDQsj9Sdx
	oCJhPeeGOPHKuQkHfwbCgVbMGnCa2hiMGwfS9tUJfZljtXhiP5/SCRLaBdyE1Onn
	X29w4/lH1o/jTLACmrnjhDf2CHSj+SSBR8r5OqZl0AJvMmczfysyCktNPc5d8BDV
	jWMBviFow9b6IqZ7CZnRw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792114602; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:bTvB6HdiWxfrT6JyXqTfbK+Ff1EUtUtYgk9HfaVFEk/mibj
	EdR7kHBYM4n6Dl+KAniWuMqVQ4B6Xd4Bfw8clha9UtZF1V+lGitVJDiUED3jHcFD
	il8MYPUWOS+MclsdL8RQTofvwX0jf4rQTf7EBz5iPNQjllqwqYYs69M3vOGeIr1r
	H/JcNzKGV2AcAXvn5f8meS/DyB/BizID5Uv42AoyU+lLDBMqRyx8HGQU4nYIqryD
	z49AIjhV+Ii8h3Y6GKMns8l2aYmjk8H+IQ01EfaMXY+Pk0Y78BeaQ4EPJ34HOsdq
	zKY8YQ/xFNuqKRmgmgtwF8NWP89tu0j0CdPONiw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:dkIa20XfF4E+mV/e113h5rOu0RjtSCUMFJZbmQSM21Q=:4H9T4VUulD/tG05EyhxjVBGERFgglqehYCOeAIbuZXE=;
X-ME-Sender: <xms:qX_Rakoak0_Q9WFgXgDCM8rTrFs7U9S5XHBlORq2Pg4isoa7bxn66A>
    <xme:qX_RaleBB0_iVEW0lCGnUT_uI5NTGSgcBsNmr1oJpjoUJxmkj1cKPbp15n6a7pq05
    gXLKNKBCV0pwo6M_KWQ4y0oUMKtHL0YKBvwfsyW6kMRn3w9H2-0xWFq>
X-ME-Proxy-Cause: dmFkZTEYrEqohSqHaisglAQI8x+hYTh6VfquOCb0mb4JvokoGhOzMLj6WgsyZzj80vWoA6
    J6DN98pIi1+2oXoqVF2Zi6eXBqMaCCWEVhvRmfXlq7N8PLNTGkfu9cElJZ0yCjKPjNnZhC
    wPWBgyrvv43HGiZ4KJG3xciO5FqQSGlJkCCIvPMKOpWLUYHSsdRB27YGQKMc3e65Ew9VLZ
    /0t7BXyvor3k4nUL8hToVQy3sMFQmm6tWLBipzYP3/wtYS3c1x295480/v7LEUnoQMk+RI
    lZc6FP/MVbhx8Lrlm6EImU0nnu2Hjv1ZtaoemF0YLLIkJaacsTgfChIt5mUvnzm+aqD6Nq
    oaopU98uQV75A9vvVwaKQYn8K7qS1VLTDYJRIEWUHMPwKAJWsdIXZr0FxyDBp8HB9RdX2e
    XcNFEKlZHpZ9uU6JmQ3hnTSnRBsYUsvAaVeywFpMZDxGMRMU/UrmcyKHbRHTnWlg1QLUY5
    U8o+g7NtGBVSTCIBxkHxgK9I7Iit1booVtQO3x2ygDab5NF3eu8QLQdDAicgBLbpd75rio
    3bc2ycVJYETo8JaBsFY2f6iCqQjBvRUiLsUgvxkGXXqTjveA+SZ41pTQVpF7eE2zRuzXmO
    WQrLyb2tu74JzSxXPq0PF027MAlKEWv/u6Qr1NQfJayQh1Czt02AqpMlwNWQ
X-ME-Proxy: <xmx:qX_RaiQwzNhVh-oe0v6P48x53wkPuSRvCc8UQCC9QYIDlHWy20J7Tw>
    <xmx:qX_Rah03rq3eteNIqD83NfXtqJh7ohYK_N1OOr2vXQQXthqcsT-wFA>
    <xmx:qX_RavvgR-FR1KRE2o0pVw1sUIqaxqGiH5vJABp7QUUyGoyniGIQKQ>
    <xmx:qX_RavhHiR_7fG6pwoqClqvvKFYwg1vC7XefGnWjPdFJ71ZH8eNG1w>
    <xmx:qn_RajPAZOvS7iiE8lkaExu73WE13T-rk0SkHYCphYyxevKkyEk8eRTV>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 096012C0007C; Thu, 15 Oct 2026 21:36:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AcGzoZcWswFR
Date: Thu, 15 Oct 2026 21:36:20 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: "Prasanth Ksr" <prasanth.ksr@dell.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, Dell.Client.Kernel@dell.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-Id: <8de3cc82-cf96-49e7-9aab-fe24239d4376@app.fastmail.com>
In-Reply-To: <81b73de2-62ef-4c7a-b5d3-d7cfc226b2b4@gmx.de>
References: <mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-1-mpearson-lenovo@squebb.ca>
 <20260925160047.2063361-6-mpearson-lenovo@squebb.ca>
 <f0407ed1-3b8f-4285-8349-926edf80e54f@gmx.de>
 <f0c68763-7960-458f-8a82-f5761ea61890@app.fastmail.com>
 <90fffebb-2c6e-49de-9a73-df194cff0845@gmx.de>
 <deae55a0-cc2e-453e-8713-7ccc53947923@app.fastmail.com>
 <c73ea81b-62b3-4cbc-a597-0672f65cdb1f@app.fastmail.com>
 <81b73de2-62ef-4c7a-b5d3-d7cfc226b2b4@gmx.de>
Subject: Re: [RFC PATCH 5/7] platform/x86: think-lmi: Initial ThinkLMI v2 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Oct 15, 2026, at 4:35 PM, Armin Wolf wrote:
> Am 03.10.26 um 00:08 schrieb Mark Pearson:
>
>> Hi Armin,
>>
>> On Mon, Sep 28, 2026, at 9:08 PM, Mark Pearson wrote:
>>> On Fri, Sep 25, 2026, at 4:00 PM, Armin Wolf wrote:
>>>> Am 25.09.26 um 21:00 schrieb Mark Pearson:
>>>>
>>>>> Thanks Armin
>>>>>
>>>>> On Fri, Sep 25, 2026, at 2:53 PM, Armin Wolf wrote:
>>>>>> Am 25.09.26 um 18:00 schrieb Mark Pearson:
>>>>>>
>>>>>>> Lenovo Thinkpad, Thinkstation and ThinkCenter are moving to a new common
>>>>>>> WMI implementation.
>>>>>>>
>>>>>>> This driver adds initial support for the new implementation, allowing
>>>>>>> attributes to be read and modified.
>>>>>>>
>>>>>>> Certificate based authentication is not implemented in this
>>>>>>> version.
>>>>>>>
>>>>>>> think-lmi is updated to use this driver if supported by the HW and
>>>>>>> requested by the user.
>>>>>>>
>>>>>>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>>>>> ---
>>>>>>>     drivers/platform/x86/lenovo/think-lmi-v2.c | 960 +++++++++++++++++++++
>>>>>>>     drivers/platform/x86/lenovo/think-lmi.c    |   9 +-
>>>>>>>     drivers/platform/x86/lenovo/think-lmi.h    |  59 ++
>>>>>>>     3 files changed, 1025 insertions(+), 3 deletions(-)
>>>>>>>     create mode 100644 drivers/platform/x86/lenovo/think-lmi-v2.c
>>>>>>>
>>>>>>> diff --git a/drivers/platform/x86/lenovo/think-lmi-v2.c b/drivers/platform/x86/lenovo/think-lmi-v2.c
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..5bc0a349c5fb
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/platform/x86/lenovo/think-lmi-v2.c
>>>>>>> @@ -0,0 +1,960 @@
>>>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>>>> +/*
>>>>>>> + * Think LMI V2 BIOS configuration driver
>>>>>>> + *
>>>>>>> + * Copyright(C) 2026 Lenovo
>>>>>>> + * Distributed under the GPL-2.0 license
>>>>>>> + */
>>>>>>> +
>>>>>> ...
>>>>>>
>>>>>>> +/* Get password settings from BIOS */
>>>>>>> +static int tlmi_get_pwd_settings(void)
>>>>>>> +{
>>>>>>> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>>>>>>> +	const union acpi_object *obj;
>>>>>>> +	acpi_status status;
>>>>>>> +
>>>>>>> +	if (!tlmi_priv.can_get_password_settings)
>>>>>>> +		return -EOPNOTSUPP;
>>>>>>> +
>>>>>>> +	status = wmi_query_block(LENOVO_BIOS_ACCESS_DATA_GUID, 0, &output);
>>>>>> Big NACK from my side, this function is deprecated and scheduled for removal.
>>>>>>
>>>>>> If i understand correctly the core drivers needs two WMI GUIDs, one for
>>>>>> discovering
>>>>>> settings and one for operating on those settings. Please use the
>>>>>> component framework
>>>>>> to link those two together by register a component for the data GUID
>>>>>> and a component
>>>>>> master for the method GUID.
>>>>>>
>>>>>> This also allows you to use the modern buffer-based WMI API, so you can
>>>>>> leave ACPI
>>>>>> behind when writing this driver.
>>>>>>
>>>>> OK - good to know. As a note, I suspect the original driver will need updating here too.
>>>>>
>>>>> For "use the component framework to link those two together" - is there an example or documentation you can recommend as a reference for doing this?
>>>> https://docs.kernel.org/driver-api/component.html, other than that the
>>>> Lenvovo Gamezone drivers AFAIK uses it,
>>>> but in a IMHO convoluted way.
>>>>
>>> Thanks - I'm getting my head around this all :)
>>>
>>>>>>> +	if (ACPI_FAILURE(status))
>>>>>>> +		return -EIO;
>>>>>>> +
>>>>>>> +	obj = output.pointer;
>>>>>>> +	if (!obj)
>>>>>>> +		return -ENOMEM;
>>>>>>> +
>>>>>>> +	if (obj->type != ACPI_TYPE_PACKAGE) {
>>>>>>> +		kfree(obj);
>>>>>>> +		return -EIO;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	tlmi_priv.pwdcfg_v2.password_state = obj->package.elements[0].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.minlen = obj->package.elements[1].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.maxlen = obj->package.elements[2].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.strong_password = obj->package.elements[3].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.supported_encodings = obj->package.elements[4].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.supported_keyboard = obj->package.elements[5].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.hdd_user_password = obj->package.elements[6].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.hdd_master_password = obj->package.elements[7].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.nvme_user_password = obj->package.elements[8].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.nvme_master_password = obj->package.elements[9].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.deploy_mode = obj->package.elements[10].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.sys_mgr_pwd_ctrl = obj->package.elements[11].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.power_on_pwd_ctrl = obj->package.elements[12].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.storage_pwd_ctrl = obj->package.elements[13].integer.value;
>>>>>>> +	tlmi_priv.pwdcfg_v2.sys_mgr_setup_ctrl = obj->package.elements[14].integer.value;
>>>>>>> +
>>>>>>> +	if (WARN_ON(tlmi_priv.pwdcfg_v2.maxlen >= TLMI_PWD_BUFSIZE))
>>>>>>> +		tlmi_priv.pwdcfg_v2.maxlen = TLMI_PWD_BUFSIZE - 1;
>>>>>>> +
>>>>>>> +	tlmi_priv.pwd_admin = tlmi_create_auth(SVP, "bios-admin");
>>>>>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SVP_PWD)
>>>>>>> +		tlmi_priv.pwd_admin->pwd_enabled = true;
>>>>>>> +
>>>>>>> +	tlmi_priv.pwd_power = tlmi_create_auth(POP, "power-on");
>>>>>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_POP_PWD)
>>>>>>> +		tlmi_priv.pwd_power->pwd_enabled = true;
>>>>>>> +
>>>>>>> +	tlmi_priv.pwd_system = tlmi_create_auth(SMP, "system");
>>>>>>> +	if (tlmi_priv.pwdcfg_v2.password_state & TLMI_SMP_PWD)
>>>>>>> +		tlmi_priv.pwd_system->pwd_enabled = true;
>>>>>>> +
>>>>>>> +	tlmi_priv.pwd_hdd = tlmi_create_auth(HDD1, "hdd");
>>>>>>> +	tlmi_priv.pwd_hdd->index = 1;
>>>>>>> +	if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
>>>>>>> +	    tlmi_priv.pwdcfg.ext.hdd_master_password) {
>>>>>>> +		tlmi_priv.pwd_hdd->pwd_enabled = true;
>>>>>>> +		if (tlmi_priv.pwdcfg.ext.hdd_master_password)
>>>>>>> +			tlmi_priv.pwd_hdd->index =
>>>>>>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_master_password) - 1;
>>>>>>> +		else
>>>>>>> +			tlmi_priv.pwd_hdd->index =
>>>>>>> +				ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	tlmi_priv.pwd_nvme = tlmi_create_auth(NVME1, "nvme");
>>>>>>> +	tlmi_priv.pwd_nvme->index = 1;
>>>>>>> +	if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
>>>>>>> +	    tlmi_priv.pwdcfg.ext.nvme_master_password) {
>>>>>>> +		tlmi_priv.pwd_nvme->pwd_enabled = true;
>>>>>>> +		if (tlmi_priv.pwdcfg.ext.nvme_master_password)
>>>>>>> +			tlmi_priv.pwd_nvme->index =
>>>>>>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_master_password) - 1;
>>>>>>> +		else
>>>>>>> +			tlmi_priv.pwd_nvme->index =
>>>>>>> +				ffs(tlmi_priv.pwdcfg.ext.nvme_user_password) - 1;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	kfree(obj);
>>>>>>> +
>>>>>>> +	return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int tlmi_analyze(struct wmi_device *wdev)
>>>>>>> +{
>>>>>>> +	int i, ret;
>>>>>>> +
>>>>>>> +	if (wmi_has_guid(LENOVO_BIOS_CONFIGURATION_GUID))
>>>>>>> +		tlmi_priv.can_set_bios_settings = true;
>>>>>>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_DATA_GUID))
>>>>>>> +		tlmi_priv.can_get_password_settings = true;
>>>>>>> +	if (wmi_has_guid(LENOVO_BIOS_ACCESS_GUID)) {
>>>>>>> +		tlmi_priv.can_set_bios_password = true;
>>>>>>> +		tlmi_priv.certificate_support = true;
>>>>>>> +	}
>>>>>> This should be used to determine which components the component master wants
>>>>>> to bind to, as some of them seem to be optional.
>>>>>>
>>>>>> Using wmi_has_guid() will not work for duplicated GUIDs, so we need a
>>>>>> new function
>>>>>> here. I can write a patch that adds:
>>>>>>
>>>>>> 	bool wmidev_exists(const char *guid);
>>>>>>
>>>>>> You could then carry this patch with this patch series.
>>>>>>
>>>>> That would fantastic - thanks!
>>>>>
>>>>> Mark
>>>> Ok. Is the firmware interface still being in development? Because i
>>>> would prefer if the main
>>>> WMI object (aka the component master) would contain some WMI methods to
>>>> determine which optional
>>>> features are supported.
>>>>
>>> Sorry - somehow missed your message in my inbox.
>>>
>>> FW interface is pretty much done. Putting changes in would be quite
>>> hard now as we'd have to co-ordinate across three different business
>>> units and the 2027 platforms (where this is being targeted) are just
>>> around the corner.
>>>
>>> What did you have in mind? Changes aren't impossible...but difficult.
>>>
>>> Mark
>> Your patch works - but I changed it to accept a string as input first. e.g:
>>
>> bool wmidev_exists(const char *guid_string)
>> {
>>          guid_t guid;
>>          int ret;
>>
>>          ret = guid_parse(guid_string, &guid);
>>          if (ret < 0)
>>                  return false;
>>
>>          return bus_for_each_dev(&wmi_bus_type, NULL, (void *)&guid, wmidev_match_guid) == 1;
>> }
>>
>> Any concerns?
>>
>> Mark
>
> I plan to get rid of the GUID strings in the future, so having 
> wmidev_exists() accept a guid_t is
> preferable to me. You can use a small wrapper function inside your 
> driver if you want.
>

Understood. I've refactored my code to use your original patch (going in with Rong's series now)

Thanks!
Mark
