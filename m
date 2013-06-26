From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: Re: [PATCH 4/8] minnowboard: Add base platform driver for the
 MinnowBoard
Date: Wed, 26 Jun 2013 04:52:46 +0000
Message-ID: <1372222365.9179.4.camel@x230>
References: <cover.1372211451.git.dvhart@linux.intel.com>
	 <a459c0b97ea41148af901fc73dbeff98778c7419.1372211451.git.dvhart@linux.intel.com>
	 <20130626040026.GA23621@quad.lixom.net>
	 <1372221808.8177.52.camel@envy.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-by2lp0241.outbound.protection.outlook.com ([207.46.163.241]:20742
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750766Ab3FZEwu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Jun 2013 00:52:50 -0400
In-Reply-To: <1372221808.8177.52.camel@envy.home>
Content-Language: en-US
Content-ID: <30F4A32BAC0FE4418AF8FC999672FD01@namprd05.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Olof Johansson <olof@lixom.net>, "David S. Miller" <davem@davemloft.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "peter.p.waskiewicz.jr@intel.com" <peter.p.waskiewicz.jr@intel.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "danders@circuitco.com" <danders@circuitco.com>, "vishal.l.verma@intel.com" <vishal.l.verma@intel.com>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Richard Purdie <richard.purdie@linuxfoundation.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

T24gVHVlLCAyMDEzLTA2LTI1IGF0IDIxOjQzIC0wNzAwLCBEYXJyZW4gSGFydCB3cm90ZToNCg0K
PiAxKSBJIG5lZWQgdGltZSwgcG9zc2libHkgYSBjb3VwbGUgb2YgbW9udGhzLCB0byBnZXQgcHJv
cGVyIEFDUEkgc3VwcG9ydA0KPiBmb3IgdGhlc2UgZHJpdmVycyBpbnRvIHRoZSBmaXJtd2FyZS4g
VGhlbiBJIGNhbiByZXdyaXRlIHRoZXNlIGFzIEFDUEkNCj4gZHJpdmVycyBhcyBpcyBwcm9wZXIg
Zm9yIGFuIHg4NiBib2FyZC4gSSd2ZSBhbHJlYWR5IHN0YXJ0ZWQgZG93biB0aGlzDQo+IHBhdGgu
DQoNCkEgY291cGxlIG9mIG1vbnRocyBwdXNoZXMgeW91IGJhY2sgb25lIGtlcm5lbCByZWxlYXNl
LiBJdCdzIG5vdCBhIGh1Z2UNCmRlYWwuIEkgdGhpbmsgSSBzaWRlIHdpdGggT2xvZiBoZXJlIC0g
dGhlIGtlcm5lbCBkZXZlbG9wZXJzIGhhdmUgcHVzaGVkDQpiYWNrIGFnYWluc3QgaGFyZGNvZGVk
IGFuZCBOSUhlZCBBUk0gZGV2aWNlIGRlc2NyaXB0b3JzLCBhbmQgZ2l2ZW4gdGhhdA0Kd2UgaGF2
ZSBhIHBlcmZlY3RseSByZWFzb25hYmxlIHN0YW5kYXJkIGluIHRoZSBYODYgd29ybGQgKGllLCBB
Q1BJKSwgSSdtDQpub3QgZW50aHVzaWFzdGljIGFib3V0IG1lcmdpbmcgc29tZXRoaW5nIHRoYXQn
cyAoYSkgZ29pbmcgdG8gYmUNCnN1cGVyc2VkZWQgaW4gdGhlIG5lYXIgZnV0dXJlIGFuZCAoYikg
bWF5IGVuZCB1cCBzZXJ2aW5nIGFzIGFuIGV4YW1wbGUNCnRvIG90aGVycyB3aG8gdGhpbmsgdGhp
cyBpcyBvay4NCg0KRG8gdGhlc2UgYm9hcmRzIGN1cnJlbnRseSBib290IGFueSBvdGhlciBPU2Vz
Pw0KDQo+IFNlZSB3aGF0IGhhcHBlbnMgd2hlbiBjb3JlIGtlcm5lbCBwZW9wbGUgYXJlIGFsbG93
ZWQgdG8gd3JpdGUgZHJpdmVyDQo+IGNvZGU/IEhvdyBkb2VzIHRoaXMgcmVsYXRlIHRvIGNvbnZl
cnRpbmcgdGhpcyBvdmVyIHRvIGFuIEFDUEkgZGV2aWNlDQo+IGRyaXZlcj8gSSBndWVzcyBJIHdv
dWxkIHJlcGxhY2UgdGhlIGFib3ZlIHdpdGgNCj4gTU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCAu
Li4pID8gSWYgSSBkbyB0aGUgYWJvdmUuLi4uIGlzIHRoaXMgc3RpbGwgYW4NCj4gZXZpbCBib2Fy
ZC1maWxlPyBXaGF0IG1ha2VzIHRoZSBhY3BpIG1ldGhvZCBvZiBkaXNjb3ZlciBzdXBlcmlvciB0
bw0KPiBzZXR0aW5nIHVwIGxpbnV4LWhvdHBsdWcgdmlhIGRtaT8NCg0KTU9EVUxFX0RFVklDRV9U
QUJMRSBpcyBpbnZpc2libGUgdG8gdGhlIHJ1bm5pbmcgZHJpdmVyLCBpdCBqdXN0IGV4cG9ydHMN
Cm1ldGFkYXRhIHRoYXQgdWRldiB3aWxsIHVzZSB0byBkZWNpZGUgd2hldGhlciB0byBsb2FkIHRo
ZSBkcml2ZXIuIElmIGENCmRyaXZlciBpcyBpbnRlbmRlZCB0byBkZWFsIHdpdGggYSBzcGVjaWZp
YyBib2FyZCwgRE1JIG1ha2VzIHNlbnNlLiBJZg0KaXQncyBpbnRlbmRlZCB0byBkZWFsIHdpdGgg
YSBzcGVjaWZpYyBBQ1BJIGRldmljZSAoaWUsIHNvbWV0aGluZyB3aXRoIGENCl9ISUQgdGhhdCBk
ZWZpbmVzIHRoZSBwcm9ncmFtbWluZyBtb2RlbCksIEFDUEkgbWFrZXMgc2Vuc2UuDQoNCi0tIA0K
TWF0dGhldyBHYXJyZXR0IHwgbWpnNTlAc3JjZi51Y2FtLm9yZw0K
