Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EE286250
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734972780; cv=none; b=qxtM0kp2WFifHImYwhmaQ6V+O4lHwIdraxUXbgRq+n5QXpTNsOzp75/A7PKgSyMByf/F6GE1WRlNF1MbYFLhh8Ce1stC3q3csGi0HO/wozQJOewMpDl6yRlq15RaILaVMkcinRAaKzBq2Uh5jXvthVqhh1vUROT/swdGLfctbCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734972780; c=relaxed/simple;
	bh=mFe5uyhVVApbK7F0vPSk4nFPpBkSO2tk5O/PS/ndZzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXIW3ggLFxL6PwwQBz/U6Oa3oTI5nmPQ0sjpp+habPki0uBNor/Dl8FGK++QgMLSQri91MItV0sNtv/z75TqFk5OJ6yRO2PgFDkNkcZcxYn6ooZGrMF3YhGEKEGnA0TiFYHXJl6PRe5SMOSg4hf++dksEkMBKl1/ppUch038n4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=p1pQfdHk; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="p1pQfdHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734972775; x=1735577575; i=w_armin@gmx.de;
	bh=mFe5uyhVVApbK7F0vPSk4nFPpBkSO2tk5O/PS/ndZzo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=p1pQfdHkaRo2wNITRn3+6GqW7p8nj5x6l7/orgBoG9LlLckfMQcR3t52FRpI7loz
	 htZtcSDcZrAyFv4me793FZ1INF7CvtzmnzyBWxKk8HXqy5f4E0kVyygp/4MtafxK8
	 CrjGTwGxXmTLLQbbTxMs1FjCCA5EM9Bpf3MNd/OdEM0JRZlVfNXJWzf5r5UfdmlAu
	 pxdcUcaQaMcWp+C6qEifFSjlEYcBxj8oHPmZJSXvEgQep/5HGO+VXAFOIdd4SSdm8
	 hQZTuyQruWy4Pdbp1TNsRGo8+kG+I45z5BMWni7ewUWxxyv/UadbWDeOGV87NiFXV
	 CcEFIYJSpnD8Ra/R3A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N1fis-1tWLGB2Xxg-012qE1; Mon, 23
 Dec 2024 17:52:55 +0100
Message-ID: <57214e74-1337-4bfd-b9e3-635370c9880a@gmx.de>
Date: Mon, 23 Dec 2024 17:52:54 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hotkeys disabled on Asus H7606 platform in hardware on bootup
To: Stuart Balfour <sbalfour@att.net>
Cc: platform-driver-x86@vger.kernel.org
References: <D215090D-C185-4AAA-8BB7-31566F6D9C82@att.net>
 <75B5E2F7-AA33-46BC-B54A-892763CA2311@att.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <75B5E2F7-AA33-46BC-B54A-892763CA2311@att.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:NUa5z4xxrMYtfZrAzDOqOlHlpB39L/D/vvhf7ATdqjzz0aK95uR
 BA+D8Q2e7BRGCafmgivwap8VKo1rqm3RXi0ZCCCeTq3JgMLlvqRdva8EoRrFhn4zF0kWoYy
 p3nKovePWpr0obQBaS1F463laFE62kr0plNLGHJ8llOzb5WCZWknJi9glSOwXZZdxrcOgYg
 WbGtl3T4JNoqmYZZ/3GGA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GFS5Wo2miOQ=;HUOyoQ6Gi4RmrROY5pnr0N8Mr6r
 lMtjpO7ZlHXMLFQk8YdYC8fNMa6w2DAfeMcK9CQ3nzKFoPIlJQIhFIUbQ6vyv+gaKP6YUszaw
 JYCUgPLcZ+y0m1DQAY2DiO852lbg8odFGt4rbWeNzqGAJ3mKw8BYgY7X6h+ggf0dViaQxo2tr
 0+VUcVqt6SwSnEXMruP1ew6BYpLOWqRkrwlsanZb6lD3wyV7ZoSSfdgv2RpjpBGSWHdLbY9l8
 n89vQFNt19LNva7pb09J/IR2glij3ssBaHcXHbpo8cE07rUhQvKGfYuMsr+pEPxMgTu/6XIYb
 8wMqFZp0HJ7MVqPEw9QE+3QN4srSQJmfY8ynScl8RTtnbc8enMJT4Yr9DsjfBqpgRoXYCXbfb
 uoD32v64l3mGhh2nu9ZHHjr78TD2maXmqouK0+WIN1Q7MWfPEIJ8P8Uz5wVVv6NLPWUNiaYyR
 WiBXZBgVQHQKv+8uXPFKf/xvSexGkhmgH2D6Qhmi11L2b8T7WhzjvC+yuY6yq5uSw6Z3/IcFW
 JIsxyugn70FCjHWYQpYMGPCTracDui3a+doMW1xu3FNggJapPdvv+jfGxb/eUwDPuvwDVk0ln
 GvqTue68wv5+N3o7uSMCmSKAQ5aHiFpuEIPFRmYQ7G5qRXvGIoyE0DLuIBoPVI7l2lnb79nP2
 NUWEgOD81e1sUr2D4HZaCL6yb/edoqdUMSUohwk/36HvRK3AlIt/6CoapjKxdMfkEAh7yhXP3
 4nGA9Jh/LYZXwZoyHsfq+dKO6n5z/aBVM+m4XlpauUTcTelB9xGKxLRtSHxbbjcBzu3j+0K82
 AZqoSuRyJHXSrG+AgrZgz7+oBDm200GUHKTlu9981NsWN01rpp3Z7LWp0MTnl+UW6mCYRz3KN
 z9a/N7mV+n+Jrwnh7XZN0Z08SKdz9nYRdX8GfULPVJ9B95PciikC+FiguteQ6XGlak6eAxtVD
 yfpjMm3WsD54uodKuP+dmIW4gpIE+FY/hgCTS+NTXMK5KgclLpErMnCXWEoYD5N0+L/r2VcGC
 4aWEbED+MpAax9qK789bxvjlBcbo//3LLj4wsWwtR/N8UFgQhzaiLYIfAh8OSxdMoxH28J/+f
 iseYhtns78flEn/R9fBASqyqyAEdBt

QW0gMjMuMTIuMjQgdW0gMTM6NDcgc2NocmllYiBTdHVhcnQgQmFsZm91cjoNCg0KPiBJIGJl
bGlldmUgdGhlIHBhdGNoIHlvdSBhcmUgcmVmZXJyaW5nIHRvIHdhcyByZWxhdGVkIHRvIEFz
dXMgdGhyb3R0bGUgdGhlcm1hbCBwb2xpY3kgaW4gbW9kdWxlIGFzdXMtd21pLiBUaGF0IHBy
b2JsZW0gaXMgdW5yZWxhdGVkIHRvIHRoaXMgb25lLiBLZXJuZWwgNi4xMi42IChsYXRlc3Qg
c3RhYmxlIGFzIG9mIDEyLzIzLzI0KSBkb2VzIG5vdCBzb2x2ZSB0aGlzIHByb2JsZW0uDQo+
DQpJIHVuZGVyc3RhbmQuIENhbiB5b3UgcGxlYXNlIHNlbmQgdGhlIG91dHB1dCBvZiAiYWNw
aWR1bXAiIGFuZCAiZG1lc2ciPw0KDQpUaGFua3MsDQpBcm1pbiBXb2xmDQoNCj4+IE9uIERl
YyAyMiwgMjAyNCwgYXQgNTozNyBQTSwgU3R1YXJ0IEJhbGZvdXIgPHNiYWxmb3VyQGF0dC5u
ZXQ+IHdyb3RlOg0KPj4NCj4+IO+7v0kgYW0gb24ga2VybmVsIDYuMTIuMSwgdGhvdWdoIEkg
ZG93bmxvYWRlZCBhc3VzLXdtaS5jICBmcm9tIHRvcCBvZiB0cmVlIGF0IGdpdC4gSWYgeW91
IGFyZSByZWZlcnJpbmcgdG8gdGhlIHBhdGNoIGluIFNlcHQuIDIwMjQgcmUgT09CRSBuZWFy
IHRoZSBib3R0b20gb2YgYXN1c193bWlfbGVkX2luaXQsIHllcyBJIHJlYnVpbHQgYW5kIHRl
c3RlZCB0aGUgZHJpdmVyIG9uIHRoZSBBc3VzIEg3NjA2IHBsYXRmb3JtLCBhbmQgaXQgZGlk
IG5vdCBlbmFibGUgdGhlIGJhY2tsaWdodC4gVGhhdOKAmXMgYSByZWxhdGVkIHByb2JsZW0u
IENhbiB5b3UgcHJvdmlkZSBhIFVSTCB0byB0aGUgcGF0Y2ggc3VibWl0dGFsIHlvdSByZWZl
ciB0bz8gU3BlY2lmaWNzIHJlYWxseSBoZWxwIGhlcmUuDQo+PiBUaGFua3MuDQo+Pg0KPj4+
IE9uIERlYyAyMiwgMjAyNCwgYXQgMToyMCBQTSwgQXJtaW4gV29sZiA8V19Bcm1pbkBnbXgu
ZGU+IHdyb3RlOg0KPj4+DQo+Pj4g77u/QW0gMjAuMTIuMjQgdW0gMjA6Mjggc2NocmllYiBT
dHVhcnQgQmFsZm91cjoNCj4+Pg0KPj4+PiBJIGhhdmUgYW4gQXN1cyBQcm9hcnQgUDE2IG1v
ZGVsIEg3NjA2V1YgUnl6ZW4gbGFwdG9wLiBPbiBNaW50IDIyLCBrZXJuZWwgNi4xMi4xIChi
dXQgbGF0ZXIga2VybmVscyBhcmUgc2ltaWxhcmx5IGFmZmxpY3RlZCksIG9uIGJvb3R1cCB0
aGUgaG90a2V5IGZ1bmN0aW9ucyBvZiBrZXlzIEYxLUYxMiBhcmUgaW5hY2Nlc3NpYmxlLiBF
dnRlc3QgZm9yIGV2ZW50NyAoaG90a2V5cykgc2hvd3Mgbm8gZXZlbnRzIGdlbmVyYXRlZCBm
b3Iga2V5IHByZXNzIGFuZCByZWxlYXNlIEYxLUYxMi4gRm5sb2NrIHRvZ2dsZSBGbitFU0Mg
aXMgaW5vcGVyYXRpdmUuIEZuK0Z4eCBpcyBzaW1pbGFybHkgaW5vcGVyYXRpdmUuIFRoZSBw
cm9ibGVtIGlzIHRoYXQgdGhlIGhvdGtleXMgYXJlIGRpc2FibGVkIGluIHRoZSBoYXJkd2Fy
ZS4gVGhleSB3b3JrIG9uIFdpbmRvd3MgMTEgMjRIMi4gVGhlIHJlbGV2YW50IGRyaXZlcnMg
dGhlcmUgYXJlIGNvbnRhaW5lZCBpbiB0aGUgQXN1cyBwcm9wcmlldGFyeSBjcmFwd2FyZS4g
SWYgeW91IGRvbuKAmXQgaW5zdGFsbCB0aGUgY3JhcHdhcmUsIG9yIHVuaW5zdGFsbCBpdCwg
eW91IG1heSBub3QgaGF2ZSB3b3JraW5nIGhvdGtleXMuIE9uIExpbnV4LCBhbiB1bmRlZmlu
ZWQgKGFzdXMtd21pLmgpIEFDUEkgZGV2aWNlIGlkIGlzIGFzc29jaWF0ZWQgd2l0aCBob3Rr
ZXlzIGFuZCB0aGF0IGRldmljZSBpcyB1bmRldGVjdGlibGUgdG8gdGhlIHNvZnR3YXJlIC0g
cXVlcnlpbmcgaXQgcmV0dXJucyBhIHByZXNlbmNlIGJpdCBvZiDigJww4oCdLiAgSXQgZG9l
cyBpbiBmYWN0IGV4aXN0IC0gaXQgdG9vayBtZSB3ZWVrcyB0byBmaW5kIGl0IGluIHRoZSBE
U0RULiBFdmVuIGV4cGVydHMgY291bGQgc3R1bXAgdGhlaXIgdG9lcyBvbiB0aGlzIG9uZS4g
VGhlIHB1dGF0aXZlIGRldmljZSBpZCBpcyAweDEwMDAxMy4gQXN1cyByZWxlYXNlZCB0aGlz
IHBsYXRmb3JtIG1pZC1BdWcuIDIwMjQuIEl04oCZcyBsaWtlbHkgb3RoZXIgbmV3ZXIgcGxh
dGZvcm1zIGFyZSBzaW1pbGFybHkgYWZmbGljdGVkLg0KPj4+Pg0KPj4+PiBJ4oCZbSBjbG9z
ZSB0byBhIHBhdGNoIGluIGFzdXMtd21pLmMsIGFkamFjZW50IHRvIHRoZSByZWNlbnQgcGF0
Y2ggZm9yIHRvZ2dsaW5nIHRoZSBPT0JFIGRldmljZSBkdXJpbmcgZHJpdmVyIGluaXRpYWxp
emF0aW9uLiBCdXQgdGhlIGRldmljZSB0aGlzIHRpbWUgY2Fubm90IGJlIGRldGVjdGVkLiBB
IOKAnHNlY3JldOKAnSBkZXZpY2UuIEkgdGhpbmsgdGhpcyBmaXggaXMgZ29pbmcgdG8gcmVx
dWlyZSBhIGNoYW5nZSB0byB0aGUgQUNQSS4gUG9raW5nIGFuIHVua25vd24gZGV2aWNlIGlz
IGEgcmVjaXBlIGZvciB1bnByZWRpY3RhYmxlIGVmZmVjdHMuIEZpcnN0IEkgbmVlZCB0byBn
ZXQgdGhpcyByZXBvcnRlZCBhcyBhIGJ1Zy4gV2hlcmUgd291bGQgdGhhdCBiZT8gVGhlbiBo
b3cgZG8gd2UgZml4IHNvbWV0aGluZyB0aGF0IGFjdHVhbGx5IHJlcXVpcmVzIGEgY3VzdG9t
IHBsYXRmb3JtLXNwZWNpZmljIEFDUEk/DQo+Pj4+DQo+Pj4+IFRoYW5rcyBmb3IgeW91ciBh
dHRlbnRpb24uIEl04oCZcyBiZWVuIGEgbG9uZyBoYXVsIHRvIGdldCBoZXJlLg0KPj4+IEhp
LA0KPj4+DQo+Pj4gdGhlIGxhdGVzdCA2LjEyIHN0YWJsZSBrZXJuZWwgY29udGFpbnMgYW4g
aW1wb3J0YW50IGZpeCBmb3IgYXN1cy13bWkuIERpZCB5b3UgdGVzdCBpdD8NCj4+Pg0KPj4+
IFRoYW5rcywNCj4+PiBBcm1pbiBXb2xmDQo+Pj4NCj4NCg==
