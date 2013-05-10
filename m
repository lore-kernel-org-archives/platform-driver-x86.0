From: "Ren, Qiaowei" <qiaowei.ren@intel.com>
Subject: RE: [PATCH 3/4] driver: provide sysfs interfaces to access TXT log
Date: Fri, 10 May 2013 01:50:05 +0000
Message-ID: <9E0BE1322F2F2246BD820DA9FC397ADE9AC797@SHSMSX102.ccr.corp.intel.com>
References: <1367938519-840-1-git-send-email-qiaowei.ren@intel.com>
	 <1367938519-840-4-git-send-email-qiaowei.ren@intel.com>
	 <1367990202.2425.26.camel@x230>
	 <9E0BE1322F2F2246BD820DA9FC397ADE9A9BD2@SHSMSX102.ccr.corp.intel.com>
 <1368100938.2425.36.camel@x230>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:23492 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752392Ab3EJBuO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 May 2013 21:50:14 -0400
In-Reply-To: <1368100938.2425.36.camel@x230>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Wei, Gang" <gang.wei@intel.com>

T24gMjAxMy0wNS0wOSwgTWF0dGhldyBHYXJyZXR0IHdyb3RlOg0KPiBPbiBUaHUsIDIwMTMtMDUt
MDkgYXQgMDg6MDUgKzAwMDAsIFJlbiwgUWlhb3dlaSB3cm90ZToNCj4gPiBPbiAyMDEzLTA1LTA4
LCBNYXR0aGV3IEdhcnJldHQgd3JvdGU6DQo+ID4gPiBIb3cgZGlmZmVyZW50IGFyZSB0aGVzZSBs
b2dzIHRvIHRoZSBUUE0gbWVhc3VyZW1lbnRzIGV4cG9ydGVkIHZpYQ0KPiA+ID4gc2VjdXJpdHlm
cz8NCj4gPg0KPiA+IFRoZXNlIGxvZ3MgY29tZSBmcm9tIHRib290IChUcnVzdGVkIEJvb3QsIGFu
IG9wZW4gc291cmNlLCBwcmUta2VybmVsL1ZNTQ0KPiBtb2R1bGUgdGhhdCB1c2VzIEludGVswq4g
VHJ1c3RlZCBFeGVjdXRpb24gVGVjaG5vbG9neSAoSW50ZWzCriBUWFQpIHRvIHBlcmZvcm0gYQ0K
PiBtZWFzdXJlZCBhbmQgdmVyaWZpZWQgbGF1bmNoIG9mIGFuIE9TIGtlcm5lbC9WTU0uKSwgYW5k
IHNob3VsZCBiZSBkaWZmZXJlbnQNCj4gZnJvbSB0aG9zZSBUUE0gbWVhc3VyZW1lbnRzIChmcm9t
IEJJT1M/KSBleHBvcnRlZCB2aWEgc2VjdXJpdHkuDQo+IA0KPiBEaWZmZXJlbnQgaW4gd2hhdCB3
YXk/IFdoYXQgYXJlIHRoZXkgYWN0dWFsbHkgbG9nZ2luZz8NCg0KVGJvb3QgbG9nIHNob3VsZCBh
bHNvIGNvbnRhaW4gdHh0IGhlYXAgbWVtb3J5IGNvbnRlbnQsIGEgbG90IG9mIGV2ZW50IGxvZywg
ZXRjLg0KDQo+ID4gPiBTbyBJIHdyaXRlIGEgdmFsdWUgaGVyZSBhbmQgdGhlbiBJIHNlZSBkaWZm
ZXJlbnQgY2h1bmtzIG9mIGxvZz8gVGhpcw0KPiA+ID4gZG9lc24ndCBzZWVtIGxpa2UgYW4gb3B0
aW1hbCBpbnRlcmZhY2UuIFdoYXQgZG8gdGhlc2UgbG9ncyBhY3R1YWxseQ0KPiA+ID4gY29udGFp
bj8gSG93IGRvIEkga25vdyB3aGljaCBibG9jayBJIHNob3VsZCBiZSByZWFkaW5nPw0KPiA+DQo+
ID4gWWVzLiBTaW5jZSB0b3RhbCBsb2cgc2l6ZSBpcyBiaWdnZXIgdGhhbiBvbmUgcGFnZSA0Sywg
dGhlIGxvZyBoYXZlIHRvIGJlDQo+IGRpc3BsYXllZCBpbiA0Sy1ibG9jayBpbmRleGVkIGJ5IGJs
b2NrX2luZGV4Lg0KPiA+IFRoZXNlIGxvZ3Mgd2lsbCBiZSB2ZXJ5IGhlbHBmdWwgZm9yIHR4dCBy
ZWxhdGVkIGRlYnVnZ2luZy4NCj4gDQo+IElmIHRoZXkncmUgb25seSBpbnRlbmRlZCBmb3IgZGVi
dWdnaW5nIHRoZW4gc3lzZnMgcHJvYmFibHkgaXNuJ3QgdGhlIGJlc3QgcGxhY2UNCj4gZm9yIHRo
ZW0uIGRlYnVnZnMgbWlnaHQgbWFrZSBtb3JlIHNlbnNlLg0KDQpZZXMuIERlYnVnZnMgc2VlbXMg
dG8gYmUgYmV0dGVyIGNob2ljZS4gTWF5YmUgd2UgbmVlZCB0byBmdXJ0aGVyIGNvbnNpZGVyIHRo
ZSBwdXJwb3NlIG9mIG91dHB1dHRpbmcgdGJvb3QgbG9nLiBTbyBJIHdpbGwgdGVtcG9yYXJpbHkg
cmVtb3ZlIHRoaXMgZmVhdHVyZSBmcm9tIHRoaXMgcGF0Y2guDQoNClRoYW5rcywNClFpYW93ZWkN
Cg0K
