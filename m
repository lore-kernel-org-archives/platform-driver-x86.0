Received: from outbound.baidu.com (mx22.baidu.com [220.181.50.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497AD430BA2
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 02:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.181.50.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772418056; cv=none; b=Fwgqu4S7Md8emVoCsQjombxjRLxm52tAy6RcCLOvtjs2ZahGVBj/nP6oqF+/HMbQoRRPMKaHVOhWKTwVekHJcqZDAo25AQfqSuFpgZbVuBArb21/HL2i5zscNSqKcUC3k5ynv1pWKPUNLF7STI3hiRV6mbMUb0r3mpk0giWb9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772418056; c=relaxed/simple;
	bh=Vcmhgp/Qbn5v3de3paQJ2uI0xPAY5iL1Z58djJ1sMNU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=diK4Ytk/37+0CLHWSgSel55FY5nvMOTpndIoHfLOQ7Q0W24J7DhaPCI21p0RmJc8EQSQweisk67pi8B+lLo1/iGDwPBGLTCNH7/DL1oqct0XkHsADqdkAQSuOcEBcLpgucGRzT8uSZPIlx7NXYgpRfKv70+QjGKMcqRtdpm6B98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=220.181.50.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Hans de Goede
	<hansg@kernel.org>, =?utf-8?B?SWxwbyBKw6RydmluZW4=?=
	<ilpo.jarvinen@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIHBsYXRmb3JtL3g4NjogSVNTVDogQ2hlY2sgSFdQ?=
 =?utf-8?Q?_support_before_MSR_access?=
Thread-Topic: [PATCH] platform/x86: ISST: Check HWP support before MSR access
Thread-Index: AQHcqK06L9gOxSya+UyN8qnsjozNrrWahKig
Date: Mon, 2 Mar 2026 02:20:25 +0000
Message-ID: <2c70039312544a68adafe670b422e2bd@baidu.com>
References: <20260228122441.2284-1-lirongqing@baidu.com>
In-Reply-To: <20260228122441.2284-1-lirongqing@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-FEAS-Client-IP: 172.31.3.13
X-FE-Policy-ID: 52:10:53:SYSTEM

PiBPbiBzb21lIHN5c3RlbXMsIEhXUCBjYW4gYmUgZXhwbGljaXRseSBkaXNhYmxlZCBpbiB0aGUg
QklPUyBzZXR0aW5ncyBXaGVuDQo+IEhXUCBpcyBkaXNhYmxlZCBieSBmaXJtd2FyZSwgdGhlIEhX
UCBDUFVJRCBiaXQgaXMgbm90IHNldCwgYW5kIGF0dGVtcHRpbmcgdG8NCj4gcmVhZCBNU1JfUE1f
RU5BQkxFIHdpbGwgcmVzdWx0IGluIGEgR2VuZXJhbCBQcm90ZWN0aW9uDQo+IChHUCkgZmF1bHQu
DQo+IA0KPiBbICA0MjYuNzE1NDQxXSB1bmNoZWNrZWQgTVNSIGFjY2VzcyBlcnJvcjogUkRNU1Ig
ZnJvbSAweDc3MCBhdCBySVA6DQo+IDB4ZmZmZmZmZmZjMzNkYjkyZSAoZGlzYWJsZV9keW5hbWlj
X3NzdF9mZWF0dXJlcysweGUvMHg1MCBbaXNzdF90cG1pX2NvcmVdKQ0KPiBbICA0MjYuNzE1NDUw
XSBDYWxsIFRyYWNlOg0KPiBbICA0MjYuNzE1NDUzXSAgPFRBU0s+DQo+IFsgIDQyNi43MTU0NTRd
ICA/IGV4X2hhbmRsZXJfbXNyKzB4ZjYvMHgxNTAgWyAgNDI2LjcxNTQ2MV0gID8NCj4gZml4dXBf
ZXhjZXB0aW9uKzB4MWFkLzB4MzQwIFsgIDQyNi43MTU0NjJdICA/DQo+IGdwX3RyeV9maXh1cF9h
bmRfbm90aWZ5KzB4MWUvMHhiMCBbICA0MjYuNzE1NDY2XSAgPw0KPiBleGNfZ2VuZXJhbF9wcm90
ZWN0aW9uKzB4YzkvMHgzOTAgWyAgNDI2LjcxNTQ3MF0gID8NCj4gdGVybWluYXRlX3dhbGsrMHg2
NC8weDEwMCBbICA0MjYuNzE1NDc0XSAgPw0KPiBhc21fZXhjX2dlbmVyYWxfcHJvdGVjdGlvbisw
eDIyLzB4MzANCj4gWyAgNDI2LjcxNTQ3N10gID8gZGlzYWJsZV9keW5hbWljX3NzdF9mZWF0dXJl
cysweGUvMHg1MCBbaXNzdF90cG1pX2NvcmVdDQo+IFsgIDQyNi43MTU0ODBdICBpc3N0X2lmX2Rl
Zl9pb2N0bCsweGVjZS8weDEwNTAgW2lzc3RfdHBtaV9jb3JlXQ0KPiBbICA0MjYuNzE1NDg0XSAg
PyBpb2N0bF9oYXNfcGVybS5jb25zdHByb3AuNDIrMHhlMC8weDEzMA0KPiBbICA0MjYuNzE1NDg5
XSAgaXNzdF9pZl9kZWZfaW9jdGwrMHgxMGQvMHgxYTAgW2lzc3RfaWZfY29tbW9uXQ0KPiBbICA0
MjYuNzE1NDk1XSAgX19zZV9zeXNfaW9jdGwrMHg4Ni8weGMwIFsgIDQyNi43MTU0OThdDQo+IGRv
X3N5c2NhbGxfNjQrMHg4YS8weDEwMCBbICA0MjYuNzE1NTAwXQ0KPiBlbnRyeV9TWVNDQUxMXzY0
X2FmdGVyX2h3ZnJhbWUrMHg3OC8weGUyDQo+IFsgIDQyNi43MTU1MDNdIFJJUDogMDAzMzoweDdm
MzZlYWVmNTRhNw0KPiANCj4gQWRkIGEgY2hlY2sgZm9yIFg4Nl9GRUFUVVJFX0hXUCBiZWZvcmUg
YWNjZXNzaW5nIHRoZSBNU1IuIElmIEhXUCBpcyBub3QNCj4gYXZhaWxhYmxlLCByZXR1cm4gZmFs
c2Ugc2FmZWx5Lg0KDQpJdCByZXR1cm5zIHRydWUsIG5vdCBmYWxzZS4gQ291bGQgeW91IHJldmlz
ZSB0aGlzIGNvbW1pdCBtZXNzYWdlIGluIHRoZSBtZXJnZT8NCg0KW0xpLFJvbmdxaW5nXSANCg0K
DQo+IA0KPiBGaXhlczogMTJhN2QyY2I4MTFkZDhhICgicGxhdGZvcm0veDg2OiBJU1NUOiBBZGQg
U1NULUNQIHN1cHBvcnQgdmlhIFRQTUkiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBMaSBSb25nUWluZyA8
bGlyb25ncWluZ0BiYWlkdS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50
ZWwvc3BlZWRfc2VsZWN0X2lmL2lzc3RfdHBtaV9jb3JlLmMgfCAzICsrKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZv
cm0veDg2L2ludGVsL3NwZWVkX3NlbGVjdF9pZi9pc3N0X3RwbWlfY29yZS5jDQo+IGIvZHJpdmVy
cy9wbGF0Zm9ybS94ODYvaW50ZWwvc3BlZWRfc2VsZWN0X2lmL2lzc3RfdHBtaV9jb3JlLmMNCj4g
aW5kZXggYjhjZGFhMi4uNmY0NmNiYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94
ODYvaW50ZWwvc3BlZWRfc2VsZWN0X2lmL2lzc3RfdHBtaV9jb3JlLmMNCj4gKysrIGIvZHJpdmVy
cy9wbGF0Zm9ybS94ODYvaW50ZWwvc3BlZWRfc2VsZWN0X2lmL2lzc3RfdHBtaV9jb3JlLmMNCj4g
QEAgLTU1OCw2ICs1NTgsOSBAQCBzdGF0aWMgYm9vbCBkaXNhYmxlX2R5bmFtaWNfc3N0X2ZlYXR1
cmVzKHZvaWQpDQo+ICB7DQo+ICAJdTY0IHZhbHVlOw0KPiANCj4gKwlpZiAoIXN0YXRpY19jcHVf
aGFzKFg4Nl9GRUFUVVJFX0hXUCkpDQo+ICsJCXJldHVybiB0cnVlOw0KPiArDQo+ICAJcmRtc3Jx
KE1TUl9QTV9FTkFCTEUsIHZhbHVlKTsNCj4gIAlyZXR1cm4gISh2YWx1ZSAmIDB4MSk7DQo+ICB9
DQo+IC0tDQo+IDIuOS40DQoNCg==
