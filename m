Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5712F477E4D
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 23:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790379563; cv=none; b=pauFxop91Z2Raminjyub9pJ5wi1uRH9C5yyx8bZATa0BBS/tTdAWAs7bR8zz0U3teqOQh95d/fUsEUNzz0YdyPgwa+ywvO6s0lJDYA6F2NIPCBAReWz1thiCcNL+3VAW7vitNEcsUcw2TZlm0PrV0l9DIWRnj3ejftdonNJDuIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790379563; c=relaxed/simple;
	bh=p7BSvSSie05qdz9yTVaL49F87gbDbs0h12gL7X18nPg=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=Wz2GTXB3ed7hHkYvCHGy+bFzNoKhSFKxwCF+h2COrtlFOALQV75ysTwYsfBj589rmUs6hKqKYlsvomRMxgNtR+PZsoHFQXJUP2T2SauKuyjPQ/UiwuCNMCGxQhf/Tk+ignNgqE0m0M13QA0Q5ZqxP0Ak6R8+EA0+mKDV8/6/YKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=smZWxMK5; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="smZWxMK5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790379543; x=1790984343; i=w_armin@gmx.de;
	bh=dLYuJRoK++CTczEnqa0EL4aJRuuyexWI2TK6fThpaTI=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=smZWxMK5YBvkjbZfOWz46N2uxi0dAoLahML4h65pZLX/Cw8+4x4m9ln5YxYhMXrL
	 7X+DOZz+9uD+tfncjKSn4jRHXow2iAvVJrkEYOkpOVDZB48cmQy2tIuuqxj5pD9Yr
	 TDoTYSBhqIFqoZYCcpUvpj+W/A9m/rS2X5KzxCUcSeLHVz5eNqD9jrspkhH9HJLPN
	 Pc2FT5wjvELRDD+MS89C77mjeO86F3rioLaMen2P60OqyBDRiPNQ1/eTX0lpe7wZ6
	 pjSa5pDB9ipxG/AmjawOwniSgg507r1JwIf9c8cazuhTD9k4fKp2ONtI9PO67rKs4
	 n3z4y/+HPQuV+X3zOw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGRp-1xOMfq0PKX-00W5BG; Sat, 26
 Sep 2026 01:39:03 +0200
Content-Type: multipart/mixed; boundary="------------MplcusypwHiAqc6cFCCkOVLs"
Message-ID: <c22ead74-1aaf-4e04-9227-4eccb5e3b928@gmx.de>
Date: Sat, 26 Sep 2026 01:39:00 +0200
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
X-Provags-ID: V03:K1:FPhJiPvUGV2s11mFzj4/gRs0Kfi3hU1GAdzY7AazgRpB7sDdsSM
 5t60f5mlTjHcUCymzFmc48Jc6zGpydjj9qyFGU3zwc/30Mwo5+7lOmhLIIrQRHyKLm0Umcs
 uLWzVKaXNAjiCSTzUaDzusnE/cBGu6lOYH/79mRzvLfW2/s3KGexRIy3x5XrEfg8xpqvY+R
 XwtZvJpjF7Pe6Rrr7xN/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KIG5o75ChMw=;p+7NXtp63tHvKRTxdXC5LUzcR7u
 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
 aPJjMvyR3SJRlGHsZqZlEK25/Sg8k=

This is a multi-part message in MIME format.
--------------MplcusypwHiAqc6cFCCkOVLs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

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
>
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

I attached the necessary patch. It has only been compile-tested, so do not refrain from
asking me if it somehow does not work.

Thanks,
Armin Wolf

--------------MplcusypwHiAqc6cFCCkOVLs
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-wmi-Introduce-wmidev_exists.patch"
Content-Disposition: attachment;
 filename="0001-platform-wmi-Introduce-wmidev_exists.patch"
Content-Transfer-Encoding: base64

RnJvbSA4ZmY1NDdiZGIwNDVjZjQ1YjUwMjZlNDBmMmMwYWFkYjZjN2RkNzRkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KRGF0
ZTogU2F0LCAyNiBTZXAgMjAyNiAwMToyNTo1OSArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIHBs
YXRmb3JtL3dtaTogSW50cm9kdWNlIHdtaWRldl9leGlzdHMoKQoKU29tZSBXTUkgZHJpdmVy
cyBuZWVkIHRvIGJlIGFibGUgdG8gZGV0ZWN0IHRoZSBleGlzdGVuY2Ugb2YgV01JCmRldmlj
ZXMgbWF0Y2hpbmcgYSBnaXZlbiBHVUlEIGluIG9yZGVyIHRvIGRldGVybWluZSB0aGUgYXZh
aWxhYmlsaXR5Cm9mIG9wdGlvbmFsIGZlYXR1cmVzLiBVc2luZyB3bWlfaGFzX2d1aWQoKSBm
b3IgdGhpcyB3aWxsIG5vdCB3b3JrIGZvcgpXTUkgZGV2aWNlcyB0aGF0IGNhbm5vdCBiZSB1
c2VkIHdpdGggdGhlIGxlZ2FjeSBHVUlELWJhc2VkIEFQSSAoYWthCmhhdmUgV01JX0dVSURf
RFVQTElDQVRFRCBzZXQpLgoKSW50cm9kdWNlIHdtaWRldl9leGlzdHMoKSB0aGF0IGFsc28g
Y2hlY2tzIFdNSSBkZXZpY2VzIHRoYXQgYXJlIG9ubHkKYXZhaWxhYmxlIHRvIHRoZSBidXMt
YmFzZWQgQVBJLiBBbHNvIG1hcmsgd21pX2hhc19ndWlkKCkgYXMgZGVwcmVjYXRlZApiZWNh
dXNlIG9ubHkgV01JIGRyaXZlcnMgdXNpbmcgdGhlIGxlZ2FjeSBHVUlELWJhc2VkIEFQSSB3
aWxsIGNvbnRpbnVlCnRvIGhhdmUgdXNlIGZvciBpdC4KClNpZ25lZC1vZmYtYnk6IEFybWlu
IFdvbGYgPFdfQXJtaW5AZ214LmRlPgotLS0KIGRyaXZlcnMvcGxhdGZvcm0vd21pL2NvcmUu
YyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQogaW5jbHVkZS9saW51
eC93bWkuaCAgICAgICAgIHwgIDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS93
bWkvY29yZS5jIGIvZHJpdmVycy9wbGF0Zm9ybS93bWkvY29yZS5jCmluZGV4IDUyOTgyNWRj
ZmJmZS4uYTk5ZGE5YjcwMzlkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3dtaS9j
b3JlLmMKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS93bWkvY29yZS5jCkBAIC0xNDUsNyArMTQ1
LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGdldF9hY3BpX21ldGhvZF9uYW1lKGNvbnN0IHN0
cnVjdCB3bWlfYmxvY2sgKndibG9jaywKIAlidWZmZXJbNF0gPSAnXDAnOwogfQogCi1zdGF0
aWMgaW50IHdtaWRldl9tYXRjaF9ndWlkKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3Qgdm9p
ZCAqZGF0YSkKK3N0YXRpYyBpbnQgd21pZGV2X21hdGNoX2d1aWRfbGVnYWN5KHN0cnVjdCBk
ZXZpY2UgKmRldiwgY29uc3Qgdm9pZCAqZGF0YSkKIHsKIAlzdHJ1Y3Qgd21pX2Jsb2NrICp3
YmxvY2sgPSBkZXZfdG9fd2Jsb2NrKGRldik7CiAJY29uc3QgZ3VpZF90ICpndWlkID0gZGF0
YTsKQEAgLTIxOCw3ICsyMTgsNyBAQCBzdGF0aWMgc3RydWN0IHdtaV9kZXZpY2UgKndtaV9m
aW5kX2RldmljZV9ieV9ndWlkKGNvbnN0IGNoYXIgKmd1aWRfc3RyaW5nKQogCWlmIChyZXQg
PCAwKQogCQlyZXR1cm4gRVJSX1BUUihyZXQpOwogCi0JZGV2ID0gYnVzX2ZpbmRfZGV2aWNl
KCZ3bWlfYnVzX3R5cGUsIE5VTEwsICZndWlkLCB3bWlkZXZfbWF0Y2hfZ3VpZCk7CisJZGV2
ID0gYnVzX2ZpbmRfZGV2aWNlKCZ3bWlfYnVzX3R5cGUsIE5VTEwsICZndWlkLCB3bWlkZXZf
bWF0Y2hfZ3VpZF9sZWdhY3kpOwogCWlmICghZGV2KQogCQlyZXR1cm4gRVJSX1BUUigtRU5P
REVWKTsKIApAQCAtODAwLDEwICs4MDAsMTAgQEAgYWNwaV9zdGF0dXMgd21pX3JlbW92ZV9u
b3RpZnlfaGFuZGxlcihjb25zdCBjaGFyICpndWlkKQogRVhQT1JUX1NZTUJPTF9HUEwod21p
X3JlbW92ZV9ub3RpZnlfaGFuZGxlcik7CiAKIC8qKgotICogd21pX2hhc19ndWlkIC0gQ2hl
Y2sgaWYgYSBHVUlEIGlzIGF2YWlsYWJsZQorICogd21pX2hhc19ndWlkIC0gQ2hlY2sgaWYg
YSBHVUlEIGlzIGF2YWlsYWJsZSAoZGVwcmVjYXRlZCkKICAqIEBndWlkX3N0cmluZzogMzYg
Y2hhciBzdHJpbmcgb2YgdGhlIGZvcm0gZmE1MGZmMmItZjJlOC00NWRlLTgzZmEtNjU0MTdm
MmY0OWJhCiAgKgotICogQ2hlY2sgaWYgYSBnaXZlbiBHVUlEIGlzIGRlZmluZWQgYnkgX1dE
Ry4KKyAqIENoZWNrIGlmIGEgZ2l2ZW4gR1VJRCBpcyBhdmFpbGFibGUgYW5kIHVzYWJsZSB3
aXRoIHRoZSBsZWdhY3kgR1VJRC1iYXNlZCBBUEkuCiAgKgogICogUmV0dXJuOiBUcnVlIGlm
IEdVSUQgaXMgYXZhaWxhYmxlLCBmYWxzZSBvdGhlcndpc2UuCiAgKi8KQEAgLTgyMSw2ICs4
MjEsMzEgQEAgYm9vbCB3bWlfaGFzX2d1aWQoY29uc3QgY2hhciAqZ3VpZF9zdHJpbmcpCiB9
CiBFWFBPUlRfU1lNQk9MX0dQTCh3bWlfaGFzX2d1aWQpOwogCitzdGF0aWMgaW50IHdtaWRl
dl9tYXRjaF9ndWlkKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKK3sKKwlzdHJ1
Y3Qgd21pX2Jsb2NrICp3YmxvY2sgPSBkZXZfdG9fd2Jsb2NrKGRldik7CisJY29uc3QgZ3Vp
ZF90ICpndWlkID0gZGF0YTsKKworCWlmIChndWlkX2VxdWFsKGd1aWQsICZ3YmxvY2stPmdi
bG9jay5ndWlkKSkKKwkJcmV0dXJuIDE7CisKKwlyZXR1cm4gMDsKK30KKworLyoqCisgKiB3
bWlkZXZfZXhpc3RzIC0gQ2hlY2sgaWYgYSBXTUkgZGV2aWNlIHdpdGggYSBnaXZlbiBHVUlE
IGV4aXN0cworICogQGd1aWQ6IEdVSUQgb2YgdGhlIFdNSSBkZXZpY2UgdG8gc2VhcmNoIGZv
cgorICoKKyAqIENoZWNrIGlmIGEgV01JIGRldmljZSB3aXRoIGEgZ2l2ZW4gR1VJRCBleGlz
dHMgYXQgdGhlIGdpdmVuIG1vbWVudC4KKyAqCisgKiBSZXR1cm46IFRydWUgaWYgYSBtYXRj
aGluZyBXTUkgZGV2aWNlIGV4aXN0cywgZmFsc2Ugb3RoZXJ3aXNlLgorICovCitib29sIHdt
aWRldl9leGlzdHMoY29uc3QgZ3VpZF90ICpndWlkKQoreworCXJldHVybiBidXNfZm9yX2Vh
Y2hfZGV2KCZ3bWlfYnVzX3R5cGUsIE5VTEwsICh2b2lkICopZ3VpZCwgd21pZGV2X21hdGNo
X2d1aWQpID09IDE7Cit9CitFWFBPUlRfU1lNQk9MX0dQTCh3bWlkZXZfZXhpc3RzKTsKKwog
LyoqCiAgKiB3bWlfZ2V0X2FjcGlfZGV2aWNlX3VpZCgpIC0gR2V0IF9VSUQgbmFtZSBvZiBB
Q1BJIGRldmljZSB0aGF0IGRlZmluZXMgR1VJRCAoZGVwcmVjYXRlZCkKICAqIEBndWlkX3N0
cmluZzogMzYgY2hhciBzdHJpbmcgb2YgdGhlIGZvcm0gZmE1MGZmMmItZjJlOC00NWRlLTgz
ZmEtNjU0MTdmMmY0OWJhCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3dtaS5oIGIvaW5j
bHVkZS9saW51eC93bWkuaAppbmRleCBkZWZjYjYyNGE3ZTIuLjNkZDIyM2YyZmYxOCAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9saW51eC93bWkuaAorKysgYi9pbmNsdWRlL2xpbnV4L3dtaS5o
CkBAIC0xMyw2ICsxMyw3IEBACiAjaW5jbHVkZSA8bGludXgvYWNwaS5oPgogI2luY2x1ZGUg
PGxpbnV4L2RldmljZS1pZC93bWkuaD4KICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgorI2lu
Y2x1ZGUgPGxpbnV4L3V1aWQuaD4KIAogLyoqCiAgKiBzdHJ1Y3Qgd21pX2RldmljZSAtIFdN
SSBkZXZpY2Ugc3RydWN0dXJlCkBAIC04Myw2ICs4NCw4IEBAIGFjcGlfc3RhdHVzIHdtaWRl
dl9ibG9ja19zZXQoc3RydWN0IHdtaV9kZXZpY2UgKndkZXYsIHU4IGluc3RhbmNlLCBjb25z
dCBzdHJ1Y3QKIAogdTggd21pZGV2X2luc3RhbmNlX2NvdW50KHN0cnVjdCB3bWlfZGV2aWNl
ICp3ZGV2KTsKIAorYm9vbCB3bWlkZXZfZXhpc3RzKGNvbnN0IGd1aWRfdCAqZ3VpZCk7CisK
IC8qKgogICogc3RydWN0IHdtaV9kcml2ZXIgLSBXTUkgZHJpdmVyIHN0cnVjdHVyZQogICog
QGRyaXZlcjogRHJpdmVyIG1vZGVsIHN0cnVjdHVyZQotLSAKMi41NS4wCgo=

--------------MplcusypwHiAqc6cFCCkOVLs--
