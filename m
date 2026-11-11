Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.148.24.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385651;
	b=D+bEF7OZz9yV8XZevOUs5goOTEoI+nQWMB7DSyZs4fnPwX/Bw4AKYyiem/KKsRdovmmH
	 3a54eI+GKgFAFKCFP9rt6GaROHULeodQyomDyBmmTdZpFPXkEyhb+Tm33q406dJb0uoGT
	 6I+btGiHPbmo5PXkhQOE2m07vXcMA1PCZEk+/i3nM36Z5mjx4Of1iBVhBvWkrCIbLM7v1
	 P3Yk055Ck4wRNlbVoRjZTRH7x+mjUGQc0yZzjscSwas5lIhFqktWgIiBwpDBp+RGj9i/r
	 Rn88VHlSmg/uwlPsarNkz7q2OBbLCCJreCi6X63OZhEuTEd13+Oi0Cb2IxZv38CFeFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385651;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=2Hb4zMhwDf1DB625s/cN8J5rDaFPOyjA9QV6MLWOkQU=;
	b=iKP0OZz+/c7JAh4XW7eZRtSa4mSfPoeS25nXG8AlKud6B0fodNhyIsQxv54+bZOvdPU7
	 fCfTBR/IdfV3iLx3H/PfFibwDmMoykp+rpNiFtEGKuoc18Nou+gdGREZu4WgjI2QQEbID
	 wX7Dbgr3cnP4SbgAHvMAm5+tIPA8TN5IpaC8maqaSH7TJGW0WDs7rLeCw1xqUeV/eq+F4
	 AHDeSWYsVVfwtIGScOa1FEFWFq8541LaVr+vl9ukcwBOWj8zAJcs9UjIlqa60q0lTyqnJ
	 uE26hiyL4XgvIzUW6F0w6xcqtsrwCIh34elalsOo/c3QAgVJgUNPvQClK2auYLWs9IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aquinas.su;
	spf=pass smtp.mailfrom=aquinas.su;
	dkim=pass header.d=aquinas.su header.i=@aquinas.su header.a=rsa-sha256 header.s=default header.b=gqDMXj2i;
	arc=none smtp.remote-ip=82.148.24.172
Received: from hope.aquinas.su (hope.aquinas.su [82.148.24.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54482606A335
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 08:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54482606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aquinas.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aquinas.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=aquinas.su header.i=@aquinas.su header.a=rsa-sha256 header.s=default header.b=gqDMXj2i
Received: from woolf.localnet (unknown [158.46.243.40])
	(Authenticated sender: admin@aquinas.su)
	by hope.aquinas.su (Postfix) with ESMTPSA id 99CF87864D;
	Wed, 11 Nov 2026 11:27:19 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aquinas.su; s=default;
	t=1794385640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Hb4zMhwDf1DB625s/cN8J5rDaFPOyjA9QV6MLWOkQU=;
	b=gqDMXj2i6oOZ7/Jrevv0wtyOLd5zzfuSWBTdX9ssYmbDO3K5CE09qqqfjhYma6+WDxqxDu
	17Kwb58Mrk7l35KCywDVkz9deqF8gFz3yzgZLE8/2JPrNW9lyLZoa8v3Z8/SSqomesqtDR
	cmYaHuJn/98aW2uvY0v8LCzuq3hA/112HovMjWBfleB7FjqD0JZe8OlOQohkJrVlsr+WoE
	C4tDBd1INbm9jaxVhUu5h2NJhsEcVjtKMHNS7nzdc0sLhzlLyNGDeyk0XlWO41QcEkEgg1
	OedNvFMHqsMJwso+5alSCmaaNtCtBIhr4y+zbYQSR+6kON83D/asEjNMbr6VxQ==
Authentication-Results: hope.aquinas.su;
	auth=pass smtp.auth=admin@aquinas.su smtp.mailfrom=admin@aquinas.su
From:
 =?UTF-8?B?0JrQvtC90LXQvdC60L4g0JDQvdC00YDQtdC5INCS0LjQutGC0L7RgNC+0LLQuNGH?=
 <admin@aquinas.su>
To: ilpo.jarvinen@linux.intel.com, saransh2304@gmail.com
Cc: platform-driver-x86@vger.kernel.org,
 Saransh Halwai <saransh2304@gmail.com>
Subject:
 Re: [PATCH v11] platform/x86: hp-wmi: Add multicolor LED support for HP
 keyboard backlight
Date: Wed, 11 Nov 2026 15:27:18 +0700
Message-ID: <cUvbYbbmT9G2TvUK0yHYhQ@aquinas.su>
In-Reply-To: <20261110210316.62037-1-saransh2304@gmail.com>
References: <20261110210316.62037-1-saransh2304@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"

SSdsbCBzZW5kIHYxMiB3aXRoIGZpeCBzb29uLiBJdCB3YXMgZml4ZWQgYnkgbWUgYW5kIG5vdyBJ
IGZvdW5kIG5vIGlzc3VlcyAoYXMgSSB1bmRlcnN0YW5kKS4KCtCSINC/0LjRgdGM0LzQtSDQvtGC
INGB0YDQtdC00LAsIDExINC90L7Rj9Cx0YDRjyAyMDI24oCv0LMuIDA0OjAzOjE2INCa0YDQsNGB
0L3QvtGP0YDRgdC6LCDRgdGC0LDQvdC00LDRgNGC0L3QvtC1INCy0YDQtdC80Y8g0L/QvtC70YzQ
t9C+0LLQsNGC0LXQu9GMIHNhcmFuc2gyMzA0QGdtYWlsLmNvbSDQvdCw0L/QuNGB0LDQuzoKPiBG
cm9tOiBTYXJhbnNoIEhhbHdhaSA8c2FyYW5zaDIzMDRAZ21haWwuY29tPgo+IAo+IEhpIElscG8s
Cj4gCj4gSSBub3RpY2VkIHRoYXQgdGhpcyBwYXRjaCB3YXMgd2l0aGRyYXduIGZyb20gcmV2aWV3
LWlscG8tbmV4dCBkdWUgdG8gYQo+IHJlcG9ydGVkIGNvbmZpZ3VyYXRpb24gaXNzdWUuCj4gCj4g
Q291bGQgeW91IHBvaW50IG1lIHRvIHRoZSBvcmlnaW5hbCByZXBvcnQgb3IgdGhlIGZhaWxpbmcg
Y29uZmlndXJhdGlvbj8KPiBJJ2QgYmUgaW50ZXJlc3RlZCBpbiBpbnZlc3RpZ2F0aW5nIGl0Lgo+
IAo+IEkndmUgdGVzdGVkIHYxMSBvbiBhbiBIUCBPbWVuIDE2LXdmMHh4eCBydW5uaW5nIExpbnV4
IDcuNC4wLXJjMi4KPiBBbGwgZm91ciBSR0Igem9uZXMgd2VyZSBkZXRlY3RlZCwgYW5kIGNoYW5n
aW5nIHRoZSBXQVNEIHpvbmUncyBjb2xvcgo+IHdvcmtlZCBjb3JyZWN0bHkuCj4gCj4gVGhhbmtz
LAo+IFNhcmFuc2ggSGFsd2FpCj4gCgo=




