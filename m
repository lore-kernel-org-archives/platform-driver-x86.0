Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B358F49
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Aug 2025 03:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756006576; cv=none; b=OcxxDT3P6uE3gbxZ8gmQ3uKb0JGP9nD97jOoviZkZ+FHr5C+CYQLztSjPfSNgvks4qz0n/UjbyMBtVQtEEerMxsIJ19/rhz7I0xxAKukfXog/I+h+Vm3Bgxx5czvJHTl+4vqS8SoXIPeYnSECunwXc0CmdCrw5SQx7gAmvm0W0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756006576; c=relaxed/simple;
	bh=w/B4sLjVOJEUoUBAvgedeo/VsWLxVITnnjZVfRyfO3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jlti8QYfpA9re7dSz/4qbF68qiC4O7zHAbKs/Ef0VDjcZxr+nAMR3q3Kh5A3euYA8trBukihsj3AEIDbyZpRKl/ruZR7hiLbFUwU/3MCcovMuO29IsuTRacg6iw/dUpaRLkdOYAwEzbzFplwcb9Hz8B8nlSxeQE7JbnMRAETQAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bune.city; spf=pass smtp.mailfrom=bune.city; dkim=pass (2048-bit key) header.d=bune.city header.i=@bune.city header.b=SwsHcvBx; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bune.city
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bune.city
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bune.city header.i=@bune.city header.b="SwsHcvBx"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4c8fhw6ZR4z9tsQ;
	Sun, 24 Aug 2025 05:36:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bune.city; s=MBO0001;
	t=1756006561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8aXY3Y0vJOqJpQmm3WE+jAyDCRyG/wwjqAmswigfFhk=;
	b=SwsHcvBx25vNgq97ehBk9rQp9HB5IZ4o3SVw09PRQD5w3k7Lh0ZrBTGgl8RvK4tXLkVCIi
	3d5U4woOjGPJn2R7f5XOaDCUieRfMEeKoNPiRsqWNfynLqZEnh+BAeWdswksLTpHEQDgIb
	P84Fl2x0zcv0WdXEEJy1WOj+YeEelejdUPs0UpKkTcVFtjMPg25iUxfSma2X7F4r6gCeYK
	mjjV7TTuJzbrypcXMFUMcxDArQYMYnaqzPvvTlnwHIDPJ3FwtHCUkmJKXm3GaowOLbT3u2
	L+AwehwP692lGtgqSdnrVKPLHLyt+WGQUWaDpnZbyns2k4E0dArecrZP0k1nbQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of lynne@bune.city designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=lynne@bune.city
Message-ID: <290b8e1a-1d7d-48a3-a8e2-0cba711f6848@bune.city>
Date: Sun, 24 Aug 2025 13:35:52 +1000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: PROBLEM: acer-wmi driver fails to initialise with Linux kernel
 >6.14
To: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
References: <3f56e68f-85df-4c0a-982c-43f9d635be38@bune.city>
 <13f268a6-ec17-4a97-ae69-4aec723d4329@gmx.de>
 <a720d568-ea56-4e27-9d28-66b60a681e69@bune.city>
 <b56c74bc-ce71-4ab8-a804-3d5d3de247b1@gmx.de>
 <5cbe2fe6-dc96-4f92-9c06-12c309c63185@bune.city>
 <8c08ade6-3b33-438d-b734-a82623c5ba7f@gmx.de>
Content-Language: en-AU
From: Lynne Megido <lynne@bune.city>
Autocrypt: addr=lynne@bune.city; keydata=
 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
 chJ4omUM9fg=
In-Reply-To: <8c08ade6-3b33-438d-b734-a82623c5ba7f@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UkpESry0ayvaRjOcGPTmRYsv"
X-Rspamd-Queue-Id: 4c8fhw6ZR4z9tsQ

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UkpESry0ayvaRjOcGPTmRYsv
Content-Type: multipart/mixed; boundary="------------iHuaT7uGaa0zX0hpQ0V8vF0R";
 protected-headers="v1"
From: Lynne Megido <lynne@bune.city>
To: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
Message-ID: <290b8e1a-1d7d-48a3-a8e2-0cba711f6848@bune.city>
Subject: Re: PROBLEM: acer-wmi driver fails to initialise with Linux kernel
 >6.14
References: <3f56e68f-85df-4c0a-982c-43f9d635be38@bune.city>
 <13f268a6-ec17-4a97-ae69-4aec723d4329@gmx.de>
 <a720d568-ea56-4e27-9d28-66b60a681e69@bune.city>
 <b56c74bc-ce71-4ab8-a804-3d5d3de247b1@gmx.de>
 <5cbe2fe6-dc96-4f92-9c06-12c309c63185@bune.city>
 <8c08ade6-3b33-438d-b734-a82623c5ba7f@gmx.de>
In-Reply-To: <8c08ade6-3b33-438d-b734-a82623c5ba7f@gmx.de>

--------------iHuaT7uGaa0zX0hpQ0V8vF0R
Content-Type: multipart/mixed; boundary="------------NnJEfa0cRVwpM7I5frvqt8Fk"

--------------NnJEfa0cRVwpM7I5frvqt8Fk
Content-Type: multipart/alternative;
 boundary="------------aIpNGoiwS9q1yQUgvCTsyC5f"

--------------aIpNGoiwS9q1yQUgvCTsyC5f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpPbiAyMi84LzI1IDIyOjI4LCBBcm1pbiBXb2xmIHdyb3RlOg0KPiBBbSAxNS4wOC4yNSB1
bSAwNDo1NyBzY2hyaWViIEx5bm5lIE1lZ2lkbzoNCj4NCj4+DQo+PiBPbiAxNC84LzI1IDIy
OjExLCBBcm1pbiBXb2xmIHdyb3RlOg0KPj4+IEFtIDEzLjA4LjI1IHVtIDAwOjQxIHNjaHJp
ZWIgTHlubmUgTWVnaWRvOg0KPj4+DQo+Pj4+ID4gQ2FuIHlvdSBmaXJzdCBsb2FkIHRoaXMg
ZHJpdmVyIGFuZCBzaGFyZSB0aGUgZG1lc2cgb3V0cHV0IHRoZW4/DQo+Pj4+DQo+Pj4+IFN1
cmUsIEkndmUgZG9uZSB0aGF0Og0KPj4+Pg0KPj4+PiBseW5uZUBwYXNpcGhhZWw6fi9Eb3du
bG9hZHMvYWNlci13bWkgNDVtcyA4LjUxJSA3R2lCLzMxR2lCDQo+Pj4+IOKdryBtYWtlDQo+
Pj4+IG1ha2UgLUMgL2xpYi9tb2R1bGVzL2B1bmFtZSAtcmAvYnVpbGQgTT1gcHdkYCBtb2R1
bGVzDQo+Pj4+IG1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMva2VybmVs
cy82LjE1LjktMjAxLmZjNDIueDg2XzY0Jw0KPj4+PiBtYWtlWzJdOiBFbnRlcmluZyBkaXJl
Y3RvcnkgJy9ob21lL2x5bm5lL0Rvd25sb2Fkcy9hY2VyLXdtaScNCj4+Pj4gwqAgQ0MgW01d
wqAgYWNlci13bWkubw0KPj4+PiDCoCBNT0RQT1NUIE1vZHVsZS5zeW12ZXJzDQo+Pj4+IMKg
IENDIFtNXcKgIGFjZXItd21pLm1vZC5vDQo+Pj4+IMKgIENDIFtNXcKgIC5tb2R1bGUtY29t
bW9uLm8NCj4+Pj4gwqAgTEQgW01dwqAgYWNlci13bWkua28NCj4+Pj4gwqAgQlRGIFtNXSBh
Y2VyLXdtaS5rbw0KPj4+PiBTa2lwcGluZyBCVEYgZ2VuZXJhdGlvbiBmb3IgYWNlci13bWku
a28gZHVlIHRvIHVuYXZhaWxhYmlsaXR5IG9mIA0KPj4+PiB2bWxpbnV4DQo+Pj4+IG1ha2Vb
Ml06IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9seW5uZS9Eb3dubG9hZHMvYWNlci13bWkn
DQo+Pj4+IG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy9rZXJuZWxzLzYu
MTUuOS0yMDEuZmM0Mi54ODZfNjQnDQo+Pj4+IGx5bm5lQHBhc2lwaGFlbDp+L0Rvd25sb2Fk
cy9hY2VyLXdtaSA2Nm1zIDEuODclIDlHaUIvMzFHaUINCj4+Pj4g4p2vIHN1ZG8gbW9kcHJv
YmUgLXIgYWNlci13bWkNCj4+Pj4gbHlubmVAcGFzaXBoYWVsOn4vRG93bmxvYWRzL2FjZXIt
d21pIDQwbXMgMi40NSUgOEdpQi8zMUdpQg0KPj4+PiDina8gc3VkbyBtb2Rwcm9iZSBzcGFy
c2Vfa2V5bWFwDQo+Pj4+IGx5bm5lQHBhc2lwaGFlbDp+L0Rvd25sb2Fkcy9hY2VyLXdtaSAz
Nm1zIDEuMTUlIDhHaUIvMzFHaUINCj4+Pj4g4p2vIHN1ZG8gbW9kcHJvYmUgcGxhdGZvcm1f
cHJvZmlsZQ0KPj4+PiBseW5uZUBwYXNpcGhhZWw6fi9Eb3dubG9hZHMvYWNlci13bWkgMzNt
cyAxLjIyJSA4R2lCLzMxR2lCDQo+Pj4+IOKdryBzdWRvIG1vZHByb2JlIHdtaV9ibW9mDQo+
Pj4+IGx5bm5lQHBhc2lwaGFlbDp+L0Rvd25sb2Fkcy9hY2VyLXdtaSA0Mm1zIDIuNzYlIDhH
aUIvMzFHaUINCj4+Pj4g4p2vIHN1ZG8gaW5zbW9kIGFjZXItd21pLmtvDQo+Pj4+IGx5bm5l
QHBhc2lwaGFlbDp+L0Rvd25sb2Fkcy9hY2VyLXdtaSA0M21zIDIuMzclIDEwR2lCLzMxR2lC
DQo+Pj4+IOKdryBzdWRvIGRtZXNnIHwgdGFpbCAtbiA2DQo+Pj4+IFvCoCAxNzkuNjAwNzQ1
XSBhY2VyX3dtaTogQWNlciBMYXB0b3AgQUNQSS1XTUkgRXh0cmFzDQo+Pj4+IFvCoCAxNzku
NjAwNzc1XSBhY2VyX3dtaTogRnVuY3Rpb24gYml0bWFwIGZvciBDb21tdW5pY2F0aW9uIEJ1
dHRvbjogDQo+Pj4+IDB4ODAxDQo+Pj4+IFvCoCAxNzkuNjEwNDczXSBpbnB1dDogQWNlciBX
TUkgaG90a2V5cyBhcyANCj4+Pj4gL2RldmljZXMvdmlydHVhbC9pbnB1dC9pbnB1dDM2DQo+
Pj4+IFvCoCAxNzkuNjI5OTQ4XSBhY2VyX3dtaTogU3VwcG9ydGVkIHBsYXRmb3JtIHByb2Zp
bGVzOiAwDQo+Pj4+IFvCoCAxNzkuNjI5OTUxXSBhY2VyLXdtaSBhY2VyLXdtaTogRmFpbGVk
IHRvIHJlZ2lzdGVyIA0KPj4+PiBwbGF0Zm9ybV9wcm9maWxlIGNsYXNzIGRldmljZSB3aXRo
IGVtcHR5IGNob2ljZXMNCj4+Pj4gW8KgIDE3OS42MzQ4NDBdIGFjZXItd21pIGFjZXItd21p
OiBwcm9iZSB3aXRoIGRyaXZlciBhY2VyLXdtaSBmYWlsZWQgDQo+Pj4+IHdpdGggZXJyb3Ig
LTIyDQo+Pj4+DQo+Pj4gSSBzZWUsIGRpZCB0aGUgcGxhdGZvcm0gcHJvZmlsZSBpbnRlcmZh
Y2Ugd29yayBvbiB5b3VyIG1hY2hpbmUgDQo+Pj4gYmVmb3JlIGtlcm5lbCA2LjE0Pw0KPj4+
DQo+PiBJJ20gY3VycmVudGx5IHJ1bm5pbmcgTGludXggNi4xMiBmcm9tIHRoaXMgQ09QUjoN
Cj4+IGh0dHBzOi8vY29wci5mZWRvcmFpbmZyYWNsb3VkLm9yZy9jb3Bycy9rd2l6YXJ0L2tl
cm5lbC1sb25ndGVybS02LjEyLw0KPj4NCj4+DQo+PiBUaGUgYnVpbHQtaW4gYWNlci13bWkg
ZHJpdmVyIGZ1bmN0aW9ucyBwcm9wZXJseSB3aXRoIHRoaXMga2VybmVsLg0KPj4NCj4+IFRo
ZSBtb2RpZmllZCB2ZXJzaW9uIHlvdSBzZW50IHRvIG1lIGZhaWxzIHRvIGJ1aWxkIGZvciA2
LjEyLCBob3dldmVyIC0NCj4+IGFsdGhvdWdoIEkgYXNzdW1lIHRoaXMgaXMgdG8gYmUgZXhw
ZWN0ZWQuDQo+Pg0KPj4gVW5sb2FkaW5nIChtb2Rwcm9iZSAtcikgYW5kIGxvYWRpbmcgKG1v
ZHByb2JlKSB0aGUgYnVpbHQtaW4gZHJpdmVyIG9uDQo+PiA2LjEyIHByb2R1Y2VzIHRoaXMg
b3V0cHV0Og0KPj4NCj4+DQo+PiBgYGANCj4+IFsgwqAyNTIuMDc0NTYyXSBhY2VyX3dtaTog
QWNlciBMYXB0b3AgV01JIEV4dHJhcyB1bmxvYWRlZA0KPj4gWyDCoDI1NS4yNDc4ODddIGFj
ZXJfd21pOiBBY2VyIExhcHRvcCBBQ1BJLVdNSSBFeHRyYXMNCj4+IFsgwqAyNTUuMjQ3OTQ1
XSBhY2VyX3dtaTogRnVuY3Rpb24gYml0bWFwIGZvciBDb21tdW5pY2F0aW9uIEJ1dHRvbjog
MHg4MDENCj4+IFsgwqAyNTUuMjYxMTI1XSBpbnB1dDogQWNlciBXTUkgaG90a2V5cyBhcyAv
ZGV2aWNlcy92aXJ0dWFsL2lucHV0L2lucHV0MzQNCj4+DQo+PiBgYGANCj4NCj4gQWxyaWdo
dCwgaSBhdHRhY2hlZCBhbm90aGVyIHZlcnNpb24gb2YgdGhlIGFjZXItd21pIGRyaXZlciBm
b3IgeW91IHRvIA0KPiB0ZXN0IHRoYXQNCj4gc2hvdWxkIHByb3Blcmx5IGxvYWQgb24geW91
ciBtYWNoaW5lLiBDYW4geW91IHRlc3QgdGhhdCBhbGwgcGxhdGZvcm0gDQo+IHByb2ZpbGVz
DQo+IHN1cHBvcnRlZCBieSB0aGlzIGRyaXZlciB3b3JrIGFzIGV4cGVjdGVkPw0KPg0KDQpB
aCwgdGhhdCB3b3JrcyENCg0KYGBgDQrina9zdWRvIGRtZXNnIHwgdGFpbCAtbiAzDQpbIMKg
MTI2Ljk0NTI4Ml0gYWNlcl93bWk6IEFjZXIgTGFwdG9wIEFDUEktV01JIEV4dHJhcw0KWyDC
oDEyNi45NDUzMjNdIGFjZXJfd21pOiBGdW5jdGlvbiBiaXRtYXAgZm9yIENvbW11bmljYXRp
b24gQnV0dG9uOiAweDgwMQ0KWyDCoDEyNi45NTUzMTVdIGlucHV0OiBBY2VyIFdNSSBob3Rr
ZXlzIGFzIC9kZXZpY2VzL3ZpcnR1YWwvaW5wdXQvaW5wdXQzNQ0KYGBgDQoNClByZXNzaW5n
IHRoZSBidXR0b24gbm93IGN5Y2xlcyBiZXR3ZWVuIHByb2ZpbGVzIGFzIGl0IGRpZCBiZWZv
cmUuDQoNCg0KPj4NCj4+Pj4gPiBBZGRpdGlvbmFsbHkgY291bGQgeW91IHNoYXJlIHRoZSBv
dXRwdXQgb2YgImFjcGlkdW1wIj8NCj4+Pj4NCj4+PiBUaGFua3MsIGJ1dCBuZXh0IHRpbWUg
cGxlYXNlIGF0dGFjaCB0aGUgcmVzdWx0aW5nIHRleHQgZmlsZSB0byB0aGUgDQo+Pj4gZW1h
aWwgaW5zdGVhZC4NCj4+Pg0KPj4+IEFybWluIFdvbGYNCj4+Pg0KPj4gTXkgYXBvbG9naWVz
LCBJJ20gbm90IGZhbWlsaWFyIHdpdGggbWFpbGluZyBsaXN0IGV0aXF1ZXR0ZS4gSSdsbCBk
byANCj4+IHRoYXQgaW4gZnV0dXJlLg0KPj4gVGhhbmtzIGZvciB5b3VyIHBhdGllbmNlIGFu
ZCBlZmZvcnQgaW4gdHJvdWJsZXNob290aW5nIHRoaXMgaXNzdWUuDQo+Pg0KPj4gTHlubmUN
Cj4NCj4gTm8gcHJvYmxlbSwgYnV0IHBsZWFzZSB1c2UgcmVwbHktYWxsIHNvIHRoYXQgZXZl
cnlvbmUgaW5jbHVkaW5nIHRoZSANCj4gbWFpbGluZyBsaXN0IGdldHMgdGhpcyBtZXNzYWdl
DQo+IChjb3VsZCBhbHNvIGhhdmUgYmVlbiBteSBmYXVsdCkuDQo+DQo+IFRoYW5rcywNCj4g
QXJtaW4gV29sZg0KDQoNCldob29wcywgbXkgYmFkLg0KDQoNClRoYW5rIHlvdSBzbyBtdWNo
IGZvciBhbGwgeW91ciBoZWxwLCBBcm1pbi4gVGhlIHByb3ZpZGVkIGFjZXItd21pIA0KdmVy
c2lvbiB3b3JrcyBncmVhdCBvbg0KTGludXggNi4xNS4xMC4NCg0KTHlubmUNCg0K
--------------aIpNGoiwS9q1yQUgvCTsyC5f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <font face=3D"monospace"><br>
    </font>
    <div class=3D"moz-cite-prefix"><font face=3D"monospace">On 22/8/25
        22:28, Armin Wolf wrote:<br>
      </font></div>
    <blockquote type=3D"cite"
      cite=3D"mid:8c08ade6-3b33-438d-b734-a82623c5ba7f@gmx.de"><font
        face=3D"monospace">Am 15.08.25 um 04:57 schrieb Lynne Megido:
        <br>
      </font>
      <font face=3D"monospace"><br>
      </font>
      <blockquote type=3D"cite">
        <font face=3D"monospace"><br>
          On 14/8/25 22:11, Armin Wolf wrote:
          <br>
        </font>
        <blockquote type=3D"cite"><font face=3D"monospace">Am 13.08.25 um=

            00:41 schrieb Lynne Megido:
            <br>
          </font>
          <font face=3D"monospace"><br>
          </font>
          <blockquote type=3D"cite"><font face=3D"monospace">&gt; Can you=

              first load this driver and share the dmesg output then?
              <br>
            </font>
            <font face=3D"monospace"><br>
              Sure, I've done that:
              <br>
            </font>
            <font face=3D"monospace"><br>
              lynne@pasiphael:~/Downloads/acer-wmi 45ms 8.51% 7GiB/31GiB
              <br>
              =E2=9D=AF make
              <br>
              make -C /lib/modules/`uname -r`/build M=3D`pwd` modules
              <br>
              make[1]: Entering directory
              '/usr/src/kernels/6.15.9-201.fc42.x86_64'
              <br>
              make[2]: Entering directory
              '/home/lynne/Downloads/acer-wmi'
              <br>
              =C2=A0 CC [M]=C2=A0 acer-wmi.o
              <br>
              =C2=A0 MODPOST Module.symvers
              <br>
              =C2=A0 CC [M]=C2=A0 acer-wmi.mod.o
              <br>
              =C2=A0 CC [M]=C2=A0 .module-common.o
              <br>
              =C2=A0 LD [M]=C2=A0 acer-wmi.ko
              <br>
              =C2=A0 BTF [M] acer-wmi.ko
              <br>
              Skipping BTF generation for acer-wmi.ko due to
              unavailability of vmlinux
              <br>
              make[2]: Leaving directory
              '/home/lynne/Downloads/acer-wmi'
              <br>
              make[1]: Leaving directory
              '/usr/src/kernels/6.15.9-201.fc42.x86_64'
              <br>
              lynne@pasiphael:~/Downloads/acer-wmi 66ms 1.87% 9GiB/31GiB
              <br>
              =E2=9D=AF sudo modprobe -r acer-wmi
              <br>
              lynne@pasiphael:~/Downloads/acer-wmi 40ms 2.45% 8GiB/31GiB
              <br>
              =E2=9D=AF sudo modprobe sparse_keymap
              <br>
              lynne@pasiphael:~/Downloads/acer-wmi 36ms 1.15% 8GiB/31GiB
              <br>
              =E2=9D=AF sudo modprobe platform_profile
              <br>
              lynne@pasiphael:~/Downloads/acer-wmi 33ms 1.22% 8GiB/31GiB
              <br>
              =E2=9D=AF sudo modprobe wmi_bmof
              <br>
              lynne@pasiphael:~/Downloads/acer-wmi 42ms 2.76% 8GiB/31GiB
              <br>
              =E2=9D=AF sudo insmod acer-wmi.ko
              <br>
              lynne@pasiphael:~/Downloads/acer-wmi 43ms 2.37%
              10GiB/31GiB
              <br>
              =E2=9D=AF sudo dmesg | tail -n 6
              <br>
              [=C2=A0 179.600745] acer_wmi: Acer Laptop ACPI-WMI Extras
              <br>
              [=C2=A0 179.600775] acer_wmi: Function bitmap for Communica=
tion
              Button: 0x801
              <br>
              [=C2=A0 179.610473] input: Acer WMI hotkeys as
              /devices/virtual/input/input36
              <br>
              [=C2=A0 179.629948] acer_wmi: Supported platform profiles: =
0
              <br>
              [=C2=A0 179.629951] acer-wmi acer-wmi: Failed to register
              platform_profile class device with empty choices
              <br>
              [=C2=A0 179.634840] acer-wmi acer-wmi: probe with driver
              acer-wmi failed with error -22
              <br>
            </font>
            <font face=3D"monospace"><br>
            </font></blockquote>
          <font face=3D"monospace">I see, did the platform profile
            interface work on your machine before kernel 6.14?
            <br>
          </font>
          <font face=3D"monospace"><br>
          </font></blockquote>
        <font face=3D"monospace">I'm currently running Linux 6.12 from
          this COPR:
          <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://copr.fedorainfracloud.=
org/coprs/kwizart/kernel-longterm-6.12/">https://copr.fedorainfracloud.or=
g/coprs/kwizart/kernel-longterm-6.12/</a>
          <br>
        </font>
        <font face=3D"monospace"><br>
        </font>
        <font face=3D"monospace"><br>
          The built-in acer-wmi driver functions properly with this
          kernel.
          <br>
        </font>
        <font face=3D"monospace"><br>
          The modified version you sent to me fails to build for 6.12,
          however -
          <br>
          although I assume this is to be expected.
          <br>
        </font>
        <font face=3D"monospace"><br>
          Unloading (modprobe -r) and loading (modprobe) the built-in
          driver on
          <br>
          6.12 produces this output:
          <br>
        </font>
        <font face=3D"monospace"><br>
        </font>
        <font face=3D"monospace"><br>
          ```
          <br>
          [ =C2=A0252.074562] acer_wmi: Acer Laptop WMI Extras unloaded
          <br>
          [ =C2=A0255.247887] acer_wmi: Acer Laptop ACPI-WMI Extras
          <br>
          [ =C2=A0255.247945] acer_wmi: Function bitmap for Communication=

          Button: 0x801
          <br>
          [ =C2=A0255.261125] input: Acer WMI hotkeys as
          /devices/virtual/input/input34
          <br>
        </font>
        <font face=3D"monospace"><br>
          ```
          <br>
        </font></blockquote>
      <font face=3D"monospace"><br>
        Alright, i attached another version of the acer-wmi driver for
        you to test that
        <br>
        should properly load on your machine. Can you test that all
        platform profiles
        <br>
        supported by this driver work as expected?=C2=A0<br>
        <br>
      </font></blockquote>
    <p><font face=3D"monospace"><br>
      </font></p>
    <p><font face=3D"monospace">Ah, that works!=C2=A0</font></p>
    <font face=3D"monospace">```</font><br>
    <font face=3D"monospace"><span
        style=3D"font-weight:bold;color:#54ff54;background-color:#ffffff;=
">=E2=9D=AF</span><span
        style=3D"color:#000000;background-color:#ffffff;"> sudo dmesg |
        tail -n 3</span><span
        style=3D"color:#000000;background-color:#ffffff;">
      </span><br>
      <span style=3D"color:#000000;background-color:#ffffff;">[
        =C2=A0126.945282] acer_wmi: Acer Laptop ACPI-WMI Extras</span><sp=
an
        style=3D"color:#000000;background-color:#ffffff;">
      </span><br>
      <span style=3D"color:#000000;background-color:#ffffff;">[
        =C2=A0126.945323] acer_wmi: Function bitmap for Communication But=
ton:
        0x801</span><span
        style=3D"color:#000000;background-color:#ffffff;">
      </span><br>
      <span style=3D"color:#000000;background-color:#ffffff;">[
        =C2=A0126.955315] input: Acer WMI hotkeys as
        /devices/virtual/input/input35</span></font><br>
    <font face=3D"monospace">```</font><br>
    <p><font face=3D"monospace">Pressing the button now cycles between
        profiles as it did before.</font></p>
    <p><font face=3D"monospace"><br>
      </font></p>
    <blockquote type=3D"cite"
      cite=3D"mid:8c08ade6-3b33-438d-b734-a82623c5ba7f@gmx.de">
      <blockquote type=3D"cite">
        <font face=3D"monospace"><br>
        </font>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite"><font face=3D"monospace">&gt;
              Additionally could you share the output of "acpidump"?
              <br>
            </font>
            <font face=3D"monospace"><br>
            </font></blockquote>
          <font face=3D"monospace">Thanks, but next time please attach th=
e
            resulting text file to the email instead.
            <br>
          </font>
          <font face=3D"monospace"><br>
            Armin Wolf
            <br>
          </font>
          <font face=3D"monospace"><br>
          </font></blockquote>
        <font face=3D"monospace">My apologies, I'm not familiar with
          mailing list etiquette. I'll do that in future.
          <br>
          Thanks for your patience and effort in troubleshooting this
          issue.
          <br>
        </font>
        <font face=3D"monospace"><br>
          Lynne
          <br>
        </font></blockquote>
      <font face=3D"monospace"><br>
        No problem, but please use reply-all so that everyone including
        the mailing list gets this message
        <br>
        (could also have been my fault).
        <br>
      </font>
      <font face=3D"monospace"><br>
        Thanks,
        <br>
        Armin Wolf=C2=A0<br>
      </font></blockquote>
    <font face=3D"monospace"><br>
    </font><br>
    <p><font face=3D"monospace">Whoops, my bad.</font></p>
    <p><font face=3D"monospace"><br>
      </font></p>
    <font face=3D"monospace">Thank you so much for all your help, Armin.
      The provided acer-wmi version works great on</font><br>
    <font face=3D"monospace">Linux=C2=A0
      <span style=3D"color:#000000;background-color:#ffffff;">6.15.10</sp=
an>.</font>
    <p><font face=3D"monospace">Lynne</font></p>
  </body>
</html>

--------------aIpNGoiwS9q1yQUgvCTsyC5f--

--------------NnJEfa0cRVwpM7I5frvqt8Fk
Content-Type: application/pgp-keys; name="OpenPGP_0xF0A184B5213D9F90.asc"
Content-Disposition: attachment; filename="OpenPGP_0xF0A184B5213D9F90.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBF361HkBEACmcec2sVdVpfCfSVtoYbVSqDz5xLaHKUUBRFcULF9dbWCIYbb3
mYe6eMiWpgTtFdXGcWCUuAvtCEbA7hXbNGgJsE7O+uA70/rclVzsdgaDc13rooMa
xS6BvxRm1Cxdk3rHz6Q4kW2PNx1G3mAMNdBupigqXA9Aa8hoqG1oBaN96JEmZhM/
z0KYHknpQ836oEAlxvMRFLSmnTxDhd4KIq6Y1c4Y08ra/vNWEf5XT4nGyOizDvIq
PXTpUV0ZCZszaMnHBlRfpcJjocYRyB3siMC3fh71xriO2quQev3CZSkvY96eHjLs
e/HI47w4MpTmgHmcbH+ZtotW/W64vxsRRY7xL4Y/kloz0fmHj5Y0v/X0oVp7XUIs
1s3abObOsEKCU5+JbBVqUvD7gz1tmWEjDcEX4GmMu73BvKiLjIodIOoUeIngjIJ5
bnllCcMmySYn7Xw8fDzP2cyveS8Z2ho6FNuUYhV/30OhiS7U91pAZIedFeSiS5yU
O/1uDq+pfCFilm8xVFUJiODUVZG4EYzxmYEWCnjSQFuzKKBz7PjH5lfb+CWVkddZ
qPvrxWC5ED92/QSK3d215HuBGtb0GhuhY7KfUPr56j1DSKZJQAy5saLihEg+aF0j
h601fvY0yMsACqmnZ6sVd2ggjUFVR5Y5Aupq4tonHhGx2hYv57lX+r8agwARAQAB
zThMeW5uZSBQYWlnZSBMYXdzb24gKGh0dHBzOi8vYnVuZS5jaXR5KSA8bHlubmVA
YnVuZS5jaXR5PsLBjgQTAQgAOBYhBFJhC2V3uNhbyGISS/ChhLUhPZ+QBQJd+tR5
AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEPChhLUhPZ+Qhs4P/jDN9NsY
QCB8VxN2g3i7dyN2hJAX7/8sNAGLKD+jyJcNFb0/zlK/l5Qz8zLz2hYY/ZPE88QJ
dwITrJLk+3sTdXGDhDmOjobmtJEnv89M8hArygxzBekGkYXBZdkxRlBL7VEfBMS3
Tqm2txtjte+g5NbAQRPJiITFnLQWRA+MAoXB13AdOg6ylkJjE1BTthNUwqfMcK2B
TCUCGUTOY4e4NFrIsPODSt3LYJwQxmrDOvhPRXn2Be2IUV94HPqKe81e8tv8JWsh
a82Y10zFaI4n9cgIjrVuuQFIViVubocREfkCGCrPeinVo4vwNdoobC8kYC7IZ6ce
Bsa1J/2orDnisLDikvZ2KCeCms7c1JNiPuUrgkhMuDpxxBiYrR8I0Y0R5k6YN2Cn
sDyEVPyjEeJsF3FFX9U5KqWtyog5WUr5fjGaWiVi8P1r6AEipoQCizdsk4rd0jxD
ny06lOIizCeXaz8WJKjUvj4ND1n0NUNbITJOWPNcPbMCq5buTo+6FsV5SJgyIi+p
DFiiTBoo/d+EgwFjgYfaLJ/DzJP9mVNy1mxC33JT17ir0YYGxfUPKKyf8qq97h8m
b6Irlf5zEnJCraZD4zNjft8UeFALlC6FvRVU9ulW6ld4wS/yC0o8i+SFT7QIWD4s
V4YbgdRCfcxObODGhjEvJhwWgqZQVzYTY01x0cmEyYIBEAABAQAAAAAAAAAAAAAA
AP/Y/+AAEEpGSUYAAQEAAAEAAQAA/9sAQwAIBgYHBgUIBwcHCQkICgwUDQwLCwwZ
EhMPFB0aHx4dGhwcICQuJyAiLCMcHCg3KSwwMTQ0NB8nOT04MjwuMzQy/9sAQwEJ
CQkMCwwYDQ0YMiEcITIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIy
MjIyMjIyMjIyMjIyMjIy/8AAEQgAhwCHAwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEB
AAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUS
ITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5
OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeY
mZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq
8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALUR
AAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1Lw
FWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdo
aWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLD
xMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A
9Gooor3D5IKKKKACiiigAoqa2t2uZginA6k+gq7PpOEzC5LDs3esKmKpU5qEnqdF
PC1akHOC0MyilIIJBGCOopK3OcKKKKACil2Nt3bTt9ccUlFwsFFFFABRRRQAUUUU
AFFFFABRRRQBsaQgEDv3LY/KprK4M6Pu6hv0NR6b8tgT7k1BpjYuGX1WvnsSuepU
fZn2GX019U+SItUjCXQYD765P1qjWnrH34voazK9jBScqEWz5nHRUcRJIKciGSRU
XqxwKbWjpUG6VpiOF4H1rSvVVKm5voZ4ek6tRQXU01hRYBCB8mMVzjKUdlPUHFdB
DN5txMo+6mAP1zWJdjF3N/vmvNy2UueUZddT1s3pKEYeRDRRRXrnhhRRRQAUUUUA
FFFFABRRWXd+IdMspmhluMyLwyopbH5UpTjFXk7FwpzqO0Fc6+140nI/usf51mRX
1rYTpJdXEUKc8yMF7Vzd98QLeLSDa6dHI1y2V8yRcKoPf3NcDNPLcStLNI0kjdWY
5NfPzfvz82z7PBtww6g1rZfkesaj4k0a5kjEWowNgHJ3Y/nTIbmC4GYZ45P9xwf5
V5NTkkeJw8bMjjkMpwRXRQxjpQULXSPOxOVRrTc1KzZ66AWYKBkk4ArcbFjYhR97
GB7mvP8Awn4rja9it9WcKekc56E9t3p9a7XUJvMmCA5VP50Yquq8owjtuysry+VK
o3U3/T/gk+mKfLkc9zj/AD+dZU777iR+xYmtj/j10wno239TWHW2XxvKdT5HLnlV
SqKK/roFFFFemeEFFFFABRRRQAUUUUAFeSzgi4lDMGYOcsDnPPWu58Wam1lYrbRN
iW4yCR2Xv+fT864SON5ZFjjUs7kKqgckntXlY+onJQXQ+iyejKMHUez/AEG0V6Pa
fDSB9OQ3d5Ml6wy2zBRT6Y6n86xrz4d61BJi38m6TsVcKfxDf4mvN54nr8yORoru
NP8AhrfTYa/uordf7sY3t/QfzrI8SeErvw/iYuJ7Rm2rKBgg+hHahSTdg5kc9XoX
gPVPt7/2bdPl4V3xk/xKO34fy+lee1d0i9m0/VrW6gOJEkH4g8EfiDVq+yK5nFNo
9k1W4DEQKenLfWsylZizFick8k0le/QoqjTUEfFYis61RzYUUUVqYhRRRQAUUUUA
FFFFAHJeNbNmS3vV5VP3be2eR/Wq3gCyW78Txu65W3jaXn14A/U5/CrnjeZltbSE
fdd2Y/gB/jVTwHqsGma8y3LhIriPyw56K2QRn27V4ePS9rKx9Vlrk8Kr+f5np8T6
gdWnSSJBZBB5bjqTx/8AXq9VTUtQstMsmudQuo7a3yFaWRtqrnpk9qy9C8RaTqLG
3hu2S7Yki2ugYpWXkhlRuSpHII7fQgeXCnaLd2zslJS6WNGC6upNUuLd7UpbRqCk
x/iPH/1/yrzrx34mOoXT6VbcW1u/7xv77jj8hzXqMjFInZRlgpIHrXz67M7s7HLM
SST61dCDV7u5V1J3SsNrq/CeirM39o3C5VG/cqe5Hf8ACuUr0/RZIZNGtDAQUESr
x2IHP616mCpxnUu+h52a1p06No9dC/RRRXsnzAUUUUAFFFFABRRRQAUUUUAZ2taW
mrWDQ8CVfmjb0P8Aga80dSjsjDDKcEe9ek+IJJ4dDuntyQ4UAkdQM8/pXmleTmHL
zqy1Posm5vZSu9LnongHxNNLJ/ZF7JvVUzBIx5GP4T/Su/MUTyJK0aM6Z2MQCVz1
wa8p8H6XKJ21GVSse0rHn+InqfpXZrI6fddh9DWVPLnVhz3sGJzKNKq4JXt+Z0xO
Bk8CvGPGdjb2HiSdbZlMUoEu1eik9R+fP4138szCNnkdiFBJyc15Re3cl9eS3Mpy
8hz9B2FRVwiw6V5XbN8Fi3iJO0bJEFdd4JuW33VqTlMCQD0PQ/0/KuRrsfBNqyx3
N2wwGIjX3xyf6VeDv7ZWLzNx+rSv/Wp1tFFFe2fJhRRRQAUUUUAFFFFABRRRQBQ1
uTytEvWxn90y/nx/WvMK9Q1mFrjRruJBuYxnAHcjmvL68rML869D6LJreyl6noXh
nVxqNj5LgLPAApAGAV7EVuVwPg5mGtkDoYmDfTiu+rtwlRzpJs8vMaMaVdqOz1Gy
IJI2RujAg/jXlN3bPZ3cttJ9+Nip9/evWK8+8XbP7efbjPlru+uP8MVhmEE4KXY6
smqNVZQ6NfkZFnbNeXkNupwZHC59M969TtreK0to7eFdscYwBXlEcjxSLJGxV1IZ
SOxFelaJqi6rp6y8CVfllUdj6/Q1ll8optdTfOYVHGMl8K/M0qKKK9Q8AKKKKACi
iigAooooAKKKKACue1nwtDfuZ7VlgnPLDHyt9fQ10NFRUpxqK0ka0a9SjLmg7Mwv
D2gHSDJNPIrzuNvydFFbtFFOnTjTjyx2FWrTrTc5vUK8r1KSaXU7l58iUyNuHpz0
r1Suf13w2mpsbm3ZY7nHOfuv9fQ1zYyjKpBcvQ7ssxMKFR8/XqcDXQeD5XTWjGpO
ySM7h9OQf8+tU5PDurRPtNk591II/Suo8MaFLpokuboBZ5BtVM52r7+9cGGo1Pap
2tY9fHYmj9XklJO50VFFFe0fLBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAFFFFABRRRQAUUUUAf//ZwsGOBBMBCAA4FiEEUmELZXe42FvIYhJL8KGEtSE9
n5AFAl361qQCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ8KGEtSE9n5C/
vw/9E+mGw319ZYVXO2h4nR0j+1C/QBqU1ZyJmghWUtE/ZaZP1o8y7jL+mWGSD+LS
JMi5E/+U1cXHJ8dtl7BL1QUnVOQI22L6PhlRfY8OfTZvC6KCcFZuklD+6QKctdsX
afTUlX6cIVPTwqDUdxs5vQSX1WCe4II06oao512mwueqfoTE417E6FuhEmgcpo1v
h5szKe0o4VfmAUdUdxXliQnnmO4n4qHrk58yPAEDnwRq5IR/yB2C+jjiQXu8l8I+
7tps+D4cz+OgKFCOcdIqHBD5osxxcW9Wb8Q7N4Q5UoDQvNbWw+Zq56zAKKRkf8kZ
O/vMOoO7aeyJf99z8GFly5I7H22ioXB4CcDa5iJFLRK80D3Z/wMPc2WHjeldSQ1Y
2t2fMF8zJeMSCj80Hx2phTv0B7uHFaSxzyjHJLXgnuaDq/55jo3dMvMekDjqbf9a
yUYnaLL95JkqfWyv1rCk0lfsNg414zJKkXn0852euJdEP7/TunkoHqIyQmvLgtoF
4g30dpX48zJhw5VWPoItjXHSpmL+2cQ6VyFvGGWhBbNbT+lOJTbohny7gn0wK25Z
yaibzXVCfmgj/ZG8szzdB3TD7/CDcF4aiolMmSfq6QMYuX/WJWiJaIPLZFwhJ+S1
3BvqE7vNbTfdv9h9lRLZY/q9x9qhx/oxv3oI2FwVqITs6bTOwU0EXfrUeQEQALF6
vaIlbuXQ98UA/I1bveaSXkp4AOeruMekNHAFulhd//HfdZhPFBRwgJuaBIQFUnGT
NAYhj/ePshC2WeqXBM4USNxwLeutQSIDiCIq77bpgRFTKc4+qM+vv64zQTkJbG+K
9Qd2tXWKBxpZtbAdae91ExPk+BQPGEJ1kFhz4Px0bBfNXmoOs9Z46CMJRMnmpmQF
G09gCGvBNIQHuRgGyAg3glt3jSflFQepk4SDlG2AIFuAXvRN+HZU8TNXpUNb9nVG
YoYC3NuyROJLK+h6MCL88kh5/aWMeKZ3NzzShpD6xH2pkNwmh6eBA9hDE2jOvr31
3t+r1Q1Rxl2Vm1BB3NxubGPVK3K3jf1M07/5VA9DDP7GGF7kQSOl59WD2vxCUSql
JLJOGo86rQJTuFzsHkyVi7c9/5Z3d70fFaXzueBsko+TivixtOeVpu5bbnRfN3V2
qxje7Ptt/uCyvjUAcxkAbYdIZgXjYb0plBYmatQlfWOVShZyFzPDJkoAkkebpL1B
xrHYa4ks3z32obLEaenSv+tTnVGmyW7tlH5vSXSEDjL2QQ2VOltCRM7c36dXMIMD
M5KHCUUJzoRpC4kPpQWRu2/XZIjDjkzkf7JnGWadZBboNH0zH1WRgALosmtrPfBZ
xEdJUx/3etJkt0J0XMK4ZFzOEjnfXiRNW7LTMJL5ABEBAAHCwXYEGAEIACAWIQRS
YQtld7jYW8hiEkvwoYS1IT2fkAUCXfrUeQIbDAAKCRDwoYS1IT2fkCK9D/9ax0OI
C0vnMFBrsCHzXSd1+o3fDCuUOTfwqMdl2HWKyCUal525MTubqtAjvN8WqXTpJQnk
awSif/y4C+AAFbMEePdCDirbVB4NGJV2ngX2tvk9pJU15HmHsAELyoUtsCyb/acp
xr9thMy5bSh6vZaCA121zywwRgczzeIKtPPEFg9ApYoqX69D56Ctb55Um8C7m++k
8YPWpEJKtgiYlMjwYPQui9RLt9+iVtj5egSdD0eW3DSpo3Jn3OGNrdZGeLXr8abq
ZIPwrXaYlvhlV55N9i/Zt64AFGs0fVQs5hqwUJR3lg+3aXei2kM3XXcoE9yFdLbi
7uZwtOJYMp5DJ+MFgPIvT1EWoxaCNIrIzyWr3uF3fgTLwxgqOPSG2fyDzblUgX9w
2gD0Yxzezqr/ikib8M23OHaZvuvnoCeh4r1ymwu6CFl7uxsYgK7wIPn10YzS6nk6
twrDcY8fAyQeSrM507RTJmt8SW2fRArguQ6/q+a8fv9DBnwaMG5U3xQc4sfBJp02
h4f4N4G2CQZr7PBAA9OFgYNB6rccndpwFWwsch1Qv1ijx/zvPQvVxkP/KrdobYkW
VKLK6HBmet+lY1s2sPjJN+Af57PVT7rLFTEKqyX+Zxp56tyVLDRybfox9UhVbDPS
P+DbYvcxkef6wGA0p9CR8IYT4hdyEniiZQz1+A=3D=3D
=3DiUs0
-----END PGP PUBLIC KEY BLOCK-----

--------------NnJEfa0cRVwpM7I5frvqt8Fk--

--------------iHuaT7uGaa0zX0hpQ0V8vF0R--

--------------UkpESry0ayvaRjOcGPTmRYsv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEUmELZXe42FvIYhJL8KGEtSE9n5AFAmiqiJgFAwAAAAAACgkQ8KGEtSE9n5DW
VA//SH9e2Mi+iGH4cqz8YFeF7S9ZGb1hsYIqXWaY/3eVO5N7J39yWZKVLdmdjOPHQA5HCKNaxbNi
R54GYGBHYpWxMR5mg3SOhuxQ5xKU/wii/iaBYtWW7DDE1uzHW9InSaF+QfZ08UHgUpDSDQNfkO9L
mkBKVK5aG8gqlDaY/CDa8RXGTJCxd7HHNbo0q4iHZcuY/1LKBe3Go3GEpy8nP69u3G56XcUWHkst
SBcGZ60WmMozzB+Xzwi1R/nWoq4Cee0ss3w8R405Xl48LQDUlHCimJRCZxayR46Hhl5WXrcd5zoB
Cju+K5+RnmUb66Z1RetSti5qL02Dv0Hb62GIxMWhWqd8YZ2r6593o4/NmckSKLG+pvKSbkfm8afW
zK6S73GTCIKK7OMxB1urHD86SE2Ex8McDO6HMDB2p+mh63Bs6ylfcL3Iu0wonrmOPXoF5Q86dxF8
D5vrhaWQx+Autfr0OqZ/k1oeWNt5aK7fdbcoabJxKgwShtc+90/7Ud+ioAUyDbTAnox1ieF/gUmM
/e1PTBFUAK2pI4IhFzSEPpP/ppKIh1aBrgGVonnz4tIcCOdI1TtIh3kycstf314XQuGVvQsfwL0k
jsP5tKzl6R4EC1YZT6pYsvS9p7HI3J3wsSKlN0pc60SgFdbZAB32/kaD3uJPR1F2oy/+OTehYMbr
Ejg=
=lDnM
-----END PGP SIGNATURE-----

--------------UkpESry0ayvaRjOcGPTmRYsv--
