Received: from mailczh03.softline.com (mailczh03.softline.com [5.43.230.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84E72594
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Dec 2024 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.43.230.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734607530; cv=none; b=F2Ty9aHhser3JBgC/CasPBaXmg9v3llRtfmNrJ+BJ2fhzugWNxf8HB6793tZ9n4fyiiv49kSu4Cur2rEvqpYs6nxCw0o4gMSEbyb7bTA6HpkHnZ/JSHp/MZb0K9ugSjgGrpyhJ4El162C1Ur1EsqdhcpifcmZHfY7A+rBDeUirQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734607530; c=relaxed/simple;
	bh=+edvd+icUVJFN6bP4HHTAIgTx8yKog4KBbyx4rgcHWU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XwZjE1GIQlTz1qVgZOcGpT6kt9LJ4zfUHKtBWnnjgSUmPLJ7V0lTSRJgMqMB8vJNBu9PNOd1Fu1hzW3gMkeMMb6TpUdA+et/cFe853UJI5xL+UzW20kJMgIPbqo+Jr1xwE6uBxKg9k3icK0DKm3PuXObJk8oO8pSkhWyIwEV6iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=softline.com; spf=pass smtp.mailfrom=softline.com; dkim=pass (2048-bit key) header.d=softline.com header.i=@softline.com header.b=fFLRMUUo; arc=none smtp.client-ip=5.43.230.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=softline.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=softline.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=softline.com header.i=@softline.com header.b="fFLRMUUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=softline.com;
	s=relay; t=1734607522;
	bh=+edvd+icUVJFN6bP4HHTAIgTx8yKog4KBbyx4rgcHWU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fFLRMUUoDhTYrVGULrbqZ1hkzSNdK+HOcQgbSdkDd4/tu2QvYI0hxk9L2kudDXHaT
	 trIi9egpN+c8+YcdB9RXOaAt0avGwn/mGLG+UtX5q4D5ntZKXk6jkvfuzOMKlF+Hxl
	 Vg7i0DwA0TXXeczZRxzPAOYVVL0PZ90WZH9//b4aemcuNPbBMiI5orVyL0t82XW9c+
	 YM3x73T5tFTi5B+AMBJphwkUX9ahR5hCxFCMOo/TXIOl+3VJOwktBgcid1TZMhL69T
	 lM9g5U3+0AE1CZMa+0F5+HPfXZivtl+zkKHb5vu3oWJuq57B0d1m5U+W+2AZlbhaaW
	 Umjh3C1pu0tgQ==
From: "Antipov, Dmitriy" <Dmitriy.Antipov@softline.com>
To: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"dmantipov@yandex.ru" <dmantipov@yandex.ru>
CC: "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"jlee@suse.com" <jlee@suse.com>
Subject: Re: [lvc-project] [PATCH] platform/x86: acer-wmi: fix fan mode setup
 in WMID_gaming_set_fan_mode()
Thread-Topic: [lvc-project] [PATCH] platform/x86: acer-wmi: fix fan mode setup
 in WMID_gaming_set_fan_mode()
Thread-Index: AQHbUJKQKBXjrNyRl0a9Ar9Jl3PVXLLtPe8A
Date: Thu, 19 Dec 2024 11:25:21 +0000
Message-ID: <f10a93f710667be330620dd550c164f0dbbd6799.camel@softline.com>
References: <20241216132400.302003-1-dmantipov@yandex.ru>
	 <724c98ef-848d-ecfd-63d0-18fd2a6b89f4@linux.intel.com>
In-Reply-To: <724c98ef-848d-ecfd-63d0-18fd2a6b89f4@linux.intel.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <3461D02FF6A40B4C939558A12579210D@softline.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVHVlLCAyMDI0LTEyLTE3IGF0IDE2OjQ3ICswMjAwLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToN
Cg0KDQo+IFdoZW4geW91IHVzZSBhbiAiYXV0b21hdGVkIiB0b29scyB0byBmaW5kICJwcm9ibGVt
cyIsIHlvdSBoYXZlIHRvIHJlYWTCoA0KDQpTdWNoIGEgc2VudGVuY2Ugd291bGQgaGF2ZSBtdWNo
IG1vcmUgZWZmZWN0IGlmIGNvcnJlY3RseSByZXBocmFzZWQuDQpGb3IgZXhhbXBsZTogIlNpbmNl
IEknbSBwYXlpbmcgeW91LCB5b3UgaGF2ZSB0byBbd2hhdGV2ZXJdIiBldGMuDQoNCkRtaXRyeQ0K
DQo=
