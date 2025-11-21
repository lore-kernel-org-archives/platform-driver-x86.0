Received: from baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA952E9EBF
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763710028; cv=none; b=NEjhwqiRpR55+NfZj3H9J3t463XKS36Z/pMWIGlLQHc9L9tAnfnmQz22ot2OeuEz5fYktK71uYn+z5j6bhJc6XImPkMJS/Whe8w+i1+4QebWcCXE5tJOxwROsh/zrc4EOmbreg8V9pz7C+P7EyIHkE+Tu4bURld9DRO6QsGRNBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763710028; c=relaxed/simple;
	bh=XQEAne8LKw3i3tjv+0EdV6UQczB8PYSE6pcQd8dcuNo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YiV298xu2QftJA9g6k3eWL1UozskybBQbcXRshCKYoheqrf3my1AYtECVxYm/ffNRPavAoVmjnCrz0yuhOHune7htiGUPOec0Vt2i/pBjBde90VSV2S4Js7YevB5uG8JCYm+JAKNBP4lhytXgtTfhuuhg9iSBmhiLeb7faY8Kbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: "Li,Rongqing" <lirongqing@baidu.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
	"hansg@kernel.org" <hansg@kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: =?utf-8?B?UkU6IFvlpJbpg6jpgq7ku7ZdIFJlOiBwYW5pYyBvbiBzaG93X2F0dHI=?=
Thread-Topic: =?utf-8?B?W+WklumDqOmCruS7tl0gUmU6IHBhbmljIG9uIHNob3dfYXR0cg==?=
Thread-Index: AdxZus5n8Le7D1zWTsaLLYonXiaCKwAR7vWAAAFUWIAALAmEIA==
Date: Fri, 21 Nov 2025 07:26:34 +0000
Message-ID: <2c65353ab79a4c009aceddedc264edd5@baidu.com>
References: <719de07e4eb14bd4afcfad9772e5f686@baidu.com>
	 <ddc761afc091323bec7cb9eeb8df35d11afb4efb.camel@linux.intel.com>
 <bebab37ece85f7680085ff1bb10d64bf964bcb55.camel@linux.intel.com>
In-Reply-To: <bebab37ece85f7680085ff1bb10d64bf964bcb55.camel@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
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
X-FEAS-Client-IP: 172.31.3.14
X-FE-Policy-ID: 52:10:53:SYSTEM

PiANCj4gQWxzbyB5b3Ugc2FpZCB5b3Ugc2FpZCBpbnRlbC11bmNvcmUtZnJlcXVlbmN5LmtvIGlz
IGxvYWRlZC4gVGhhdCBtZWFucyB0aGF0DQo+IHlvdXIga2VybmVsIG1heSBoYXZlIGFkZGVkIGEg
Y3B1IG1vZGVsIGhlcmUgZm9yIHRoaXMgcGxhdGZvcm0gd2hpY2ggaGFzDQo+IFRQTUkuIEkgdGhp
bmsgYmV0dGVyIHRvIHJlcHJvZHVjZSBpbiBhbiB1cHN0cmVhbSBrZXJuZWwuDQo+IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE3Ljgvc291cmNlL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L2ludGVsL3UNCj4gbmNvcmUtZnJlcXVlbmN5L3VuY29yZS1mcmVxdWVuY3kuYyNMMjMwDQo+
IA0KDQpVcHN0cmVhbSBoYXMgbm90IGlzc3VlLCBzb3JyeSBmb3Igbm9pc2UNCg0KVGhhbmtzDQoN
Ci1MaQ0K
