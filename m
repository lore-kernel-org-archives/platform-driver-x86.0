Received: from outbound.baidu.com (mx24.baidu.com [111.206.215.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3188034574B;
	Sat, 28 Feb 2026 06:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.206.215.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772261898; cv=none; b=hWeMP7+MS0nsl9LAUfOFkaXLgGNq37mR1U14hs2v5OukF/jfmrmTEYqsdpkztNbqYdS92Le2ftCYvqXcRJdPzCT950njtUdo9w/z4Y7Xm4bgv+g5e8bkyn7fab1lEF1SyPUJvM13UQWiOt3TTx7HcExWvBtOYGsmb7VrSVZgEVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772261898; c=relaxed/simple;
	bh=xX51QkPH08p57jSYnWnA3nHfduSZCuPgb0sw1NZJHnk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=isvh+EIFpWMgwsH/GC9t2RYN7+ibVSzG1iKal6pwahST+rxN9QM1zxa663xZxFpiYBmQRbhPZk1T9argWpplcJ4KHNXVi9jKWevNe6hnXFmKS8C8dL1ejqRhf4x4POu+aTZMm449F5AKHdjInoYAEgFauzhS+LiN0ughLfadL40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=111.206.215.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Hans de Goede
	<hansg@kernel.org>, =?utf-8?B?SWxwbyBKw6RydmluZW4=?=
	<ilpo.jarvinen@linux.intel.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdW1JGQ10gcGxhdGZvcm0veDg2OiBpbnRlbF9zcGVl?=
 =?utf-8?B?ZF9zZWxlY3Q6IFVzZSBzdGF0aWNfY3B1X2hhcyBmb3IgSFdQIGNoZWNr?=
Thread-Topic: [PATCH][RFC] platform/x86: intel_speed_select: Use
 static_cpu_has for HWP check
Thread-Index: AQHcqGWxEzg7lcqN/0+aw5YlwBCekLWXrO5g
Date: Sat, 28 Feb 2026 06:57:50 +0000
Message-ID: <ad6453bb815f4445bd80239e96c827e5@baidu.com>
References: <20260228035108.2543-1-lirongqing@baidu.com>
In-Reply-To: <20260228035108.2543-1-lirongqing@baidu.com>
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
X-FEAS-Client-IP: 172.31.3.11
X-FE-Policy-ID: 52:10:53:SYSTEM

PiAgc3RhdGljIGJvb2wgZGlzYWJsZV9keW5hbWljX3NzdF9mZWF0dXJlcyh2b2lkKQ0KPiAgew0K
PiAtCXU2NCB2YWx1ZTsNCj4gLQ0KPiAtCXJkbXNycShNU1JfUE1fRU5BQkxFLCB2YWx1ZSk7DQo+
IC0JcmV0dXJuICEodmFsdWUgJiAweDEpOw0KPiArCXJldHVybiAhc3RhdGljX2NwdV9oYXMoWDg2
X0ZFQVRVUkVfSFdQKTsNCj4gIH0NCj4gDQo+ICAjZGVmaW5lIF9yZWFkX2NwX2luZm8obmFtZV9z
dHIsIG5hbWUsIG9mZnNldCwgc3RhcnQsIHdpZHRoLCBtdWx0X2ZhY3RvcilcDQo+IC0tDQoNCg0K
c3RhdGljX2NwdV9oYXMoWDg2X0ZFQVRVUkVfSFdQKSBpcyBkaWZmZXJlbnQgZnJvbSB2YWx1ZSBv
ZiBNU1JfUE1fRU5BQkxFLCB3aGVuIGludGVsX3BzdGF0ZT1ub19od3AgaXMgY29uZmlndXJlZCBp
biBrZXJuZWwgY21kbGluZQ0KDQpTb3JyeSBmb3IgdGhlIG5vaXNlLCBwbGVhc2UgZHJvcCB0aGlz
IHBhdGNoOw0KDQpbTGksUm9uZ3FpbmddIA0KDQoNCj4gMi45LjQNCg0K
