From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v2 4/5] platform:x86: Add Intel Telemetry Debugfs
 interfaces
Date: Wed, 30 Dec 2015 03:03:48 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42B74AD91@BGSMSX105.gar.corp.intel.com>
References: <1450867456-11366-1-git-send-email-souvik.k.chakravarty@intel.com>
 <20151230005005.GA29978@malice.jf.intel.com>
 <4325247.Z0uDHDCMpF@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:39612 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752158AbbL3DDx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Dec 2015 22:03:53 -0500
In-Reply-To: <4325247.Z0uDHDCMpF@vostro.rjw.lan>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Kasagar, Srinidhi" <srinidhi.kasagar@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "Muralidhar, Rajeev D" <rajeev.d.muralidhar@intel.com>, "Ghorai, Sukumar" <sukumar.ghorai@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Li, Aubrey" <aubrey.li@intel.com>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogcGxhdGZvcm0tZHJpdmVy
LXg4Ni1vd25lckB2Z2VyLmtlcm5lbC5vcmcgW21haWx0bzpwbGF0Zm9ybS1kcml2ZXItDQo+IHg4
Ni1vd25lckB2Z2VyLmtlcm5lbC5vcmddIE9uIEJlaGFsZiBPZiBSYWZhZWwgSi4gV3lzb2NraQ0K
PiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDMwLCAyMDE1IDc6NDIgQU0NCj4gVG86IERhcnJl
biBIYXJ0IDxkdmhhcnRAaW5mcmFkZWFkLm9yZz4NCj4gQ2M6IENoYWtyYXZhcnR5LCBTb3V2aWsg
SyA8c291dmlrLmsuY2hha3JhdmFydHlAaW50ZWwuY29tPjsgcGxhdGZvcm0tDQo+IGRyaXZlci14
ODZAdmdlci5rZXJuZWwub3JnOyBLYXNhZ2FyLCBTcmluaWRoaSA8c3JpbmlkaGkua2FzYWdhckBp
bnRlbC5jb20+Ow0KPiBaaGEsIFFpcGVuZyA8cWlwZW5nLnpoYUBpbnRlbC5jb20+OyBNdXJhbGlk
aGFyLCBSYWplZXYgRA0KPiA8cmFqZWV2LmQubXVyYWxpZGhhckBpbnRlbC5jb20+OyBHaG9yYWks
IFN1a3VtYXINCj4gPHN1a3VtYXIuZ2hvcmFpQGludGVsLmNvbT47IFl1LCBPbmcgSG9jayA8b25n
LmhvY2sueXVAaW50ZWwuY29tPjsgTGksDQo+IEF1YnJleSA8YXVicmV5LmxpQGludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA0LzVdIHBsYXRmb3JtOng4NjogQWRkIEludGVsIFRl
bGVtZXRyeSBEZWJ1Z2ZzDQo+IGludGVyZmFjZXMNCj4gDQo+IE9uIFR1ZXNkYXksIERlY2VtYmVy
IDI5LCAyMDE1IDA0OjUwOjA1IFBNIERhcnJlbiBIYXJ0IHdyb3RlOg0KPiA+IE9uIFdlZCwgRGVj
IDIzLCAyMDE1IGF0IDA0OjE0OjE2UE0gKzA1MzAsIFNvdXZpayBLdW1hciBDaGFrcmF2YXJ0eQ0K
PiB3cm90ZToNCj4gPiA+IFRoaXMgaW1wbGVtZW50cyBkZWJ1Z2ZzIGludGVyZmFjZXMgZm9yIHJl
YWRpbmcgdGhlIHRlbGVtZXRyeSBzYW1wbGVzDQo+ID4gPiBmcm9tIFNTUkFNIGFuZCBjb25maWd1
cmluZyBmaXJtd2FyZSB0cmFjZSB2ZXJib3NpdHkuDQo+ID4gPiBJbnRlcmZhY2UgY3JlYXRlZCB1
bmRlciAvc3lzL2tlcm5lbC9kZWJ1Zy90ZWxlbWV0cnkNCj4gPg0KPiA+IFdoYXQgd2FzIHRoZSBy
YXRpb25hbGUgZm9yIHBsYWNpbmcgdGhpcyB1bmRlcg0KPiA+IC9zeXMva2VybmVsL2RlYnVnL3Rl
bGVtZXRyeSwgaW5zdGVhZCBvZiAvc3lzL3Bvd2VyL3RlbGVtZXRyeSA/DQo+ID4NCj4gPiBSYWZh
ZWwsIHdvdWxkIHlvdSBsaWtlIHRvIHdlaWdoIGluIG9uIHRoaXMgc2VyaWVzPyBUaGlzIGJ1aWxk
cyBvbiB0b3ANCj4gPiBvZiBRaXBlbmcncyBwdW5pdCBkcml2ZXIgcXVldWVkIGluIG15IHRyZWUg
Zm9yIDQuNS4NCj4gDQo+IFdlbGwsIG1heSBJIHNlZSB0aGUgd2hvbGUgc2VyaWVzPw0KDQpJIGZv
cndhcmRlZCB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzIDEvNSwgMi81ICYgMy81IHRvIHlvdS4NCg0K
PiANCj4gVGhhbmtzLA0KPiBSYWZhZWwNCj4gDQo+IC0tDQo+IFRvIHVuc3Vic2NyaWJlIGZyb20g
dGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBwbGF0Zm9ybS1kcml2ZXIteDg2
Ig0KPiBpbiB0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9y
ZyBNb3JlIG1ham9yZG9tbw0KPiBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9y
ZG9tby1pbmZvLmh0bWwNCg==
