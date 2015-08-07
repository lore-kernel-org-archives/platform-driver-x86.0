From: "Chen, Yu C" <yu.c.chen@intel.com>
Subject: Re: [PATCH] [v2] surface pro 3: Add support driver for Surface Pro
 3 buttons
Date: Fri, 7 Aug 2015 08:48:18 +0000
Message-ID: <1438937513.2723.10.camel@localhost>
References: <1438934272-17959-1-git-send-email-yu.c.chen@intel.com>
	 <1438936078.2322.29.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:57639 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751108AbbHGIsa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Aug 2015 04:48:30 -0400
In-Reply-To: <1438936078.2322.29.camel@perches.com>
Content-Language: en-US
Content-ID: <A959235627F7B04CA1E5A79205448000@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "joe@perches.com" <joe@perches.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang, Rui" <rui.zhang@intel.com>, "jslaby@suse.com" <jslaby@suse.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, "Westerberg, Mika" <mika.westerberg@intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@osg.samsung.com" <mchehab@osg.samsung.com>, "arnd@arndb.de" <arnd@arndb.de>

T24gRnJpLCAyMDE1LTA4LTA3IGF0IDAxOjI3IC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToNCj4g
T24gRnJpLCAyMDE1LTA4LTA3IGF0IDE1OjU3ICswODAwLCBDaGVuIFl1IHdyb3RlOgkJCQkJXA0K
PiA+ICsJcmV0OwkJCQkJCQlcDQo+ID4gK30pDQo+IA0KPiBUaGlzIHNlZW1zIGEgYml0IGNvbXBs
aWNhdGVkLg0KPiANCj4gVGhlIGVsc2UgcmV0ID0gMCBpc24ndCBuZWNlc3NhcnkgYXMgaXQncyBp
bml0aWFsaXplZCB0byAwLg0KPiBib29sIG1pZ2h0IGJlIGJldHRlciB0aGFuIGludC4NCj4gDQpH
b3QuDQo+ID4gK3N0YXRpYyB2b2lkIHN1cmZhY2VfYnV0dG9uX25vdGlmeShzdHJ1Y3QgYWNwaV9k
ZXZpY2UgKmRldmljZSwgdTMyIGV2ZW50KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3Qgc3VyZmFjZV9i
dXR0b24gKmJ1dHRvbiA9IGFjcGlfZHJpdmVyX2RhdGEoZGV2aWNlKTsNCj4gPiArCXN0cnVjdCBp
bnB1dF9kZXYgKmlucHV0Ow0KPiA+ICsJaW50IGtleV9jb2RlID0gS0VZX1JFU0VSVkVEOw0KPiA+
ICsJYm9vbCBwcmVzc2VkID0gZmFsc2U7DQo+ID4gKw0KPiA+ICsJaWYgKCFoYW5kbGVfc3VyZmFj
ZV9idXR0b25fbm90aWZ5KFBPV0VSLCBLRVlfUE9XRVIpICYmDQo+ID4gKwkJIWhhbmRsZV9zdXJm
YWNlX2J1dHRvbl9ub3RpZnkoSE9NRSwgS0VZX0xFRlRNRVRBKSAmJg0KPiA+ICsJCSFoYW5kbGVf
c3VyZmFjZV9idXR0b25fbm90aWZ5KFZPTFVNRV9VUCwgS0VZX1ZPTFVNRVVQKSAmJg0KPiA+ICsJ
CSFoYW5kbGVfc3VyZmFjZV9idXR0b25fbm90aWZ5KFZPTFVNRV9ET1dOLCBLRVlfVk9MVU1FRE9X
TikpDQo+ID4gKwkJZGV2X2luZm9fcmF0ZWxpbWl0ZWQoJmRldmljZS0+ZGV2LA0KPiA+ICsJCQki
VW5zdXBwb3J0ZWQgZXZlbnQgWzB4JXhdXG4iLCBldmVudCk7DQo+IA0KPiBTb21lIG1pZ2h0IHBy
ZWZlciBhbGlnbm1lbnQgdG8gdGhlIG9wZW4gcGFyZW50aGVzaXM6DQo+IA0KPiAJaWYgKCFoYW5k
bGVfc3VyZmFjZV9idXR0b25fbm90aWZ5KFBPV0VSLCBLRVlfUE9XRVIpICYmDQo+IAkgICAgIWhh
bmRsZV9zdXJmYWNlX2J1dHRvbl9ub3RpZnkoSE9NRSwgS0VZX0xFRlRNRVRBKSAmJg0KPiAJICAg
ICFoYW5kbGVfc3VyZmFjZV9idXR0b25fbm90aWZ5KFZPTFVNRV9VUCwgS0VZX1ZPTFVNRVVQKSAm
Jg0KPiAJICAgICFoYW5kbGVfc3VyZmFjZV9idXR0b25fbm90aWZ5KFZPTFVNRV9ET1dOLCBLRVlf
Vk9MVU1FRE9XTikpDQo+IA0KPiBJIHRoaW5rIHRoZSBvbGRlciBzd2l0Y2gvY2FzZSB3YXMgZWFz
aWVyIHRvIHVuZGVyc3RhbmQuDQo+IA0KT0ssIHRoZW4gbGV0J3Mga2VlcCB0aGUgc3dpdGNoL2Nh
c2UuDQp0aGFua3MuDQoNCkJlc3QgUmVnYXJkcywNCll1DQo=
