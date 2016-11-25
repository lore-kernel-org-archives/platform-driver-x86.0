From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v3 1/1] platform/x86: move module mlx-platform from
 arch/x86 to drivers/platform/x86
Date: Fri, 25 Nov 2016 10:35:48 +0000
Message-ID: <AM5PR0501MB20978B8B2F415CD2A94D1A65A2890@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1477898553-61392-1-git-send-email-vadimp@mellanox.com>
 <alpine.DEB.2.20.1610310930430.5481@nanos>
 <AM5PR0501MB20971C6FB6089705CC130C8FA2A60@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <CAHp75Vfstb1k_kgzLO0NQKJT_Eibo-Az_Bh+M1YFR5ONoVufuw@mail.gmail.com>
 <AM5PR0501MB209739CCF2AC3524B267B92EA2890@AM5PR0501MB2097.eurprd05.prod.outlook.com>
 <CAHp75VdTW9CYJiwt=CsESdQhsd5FEdAPx9FxDt_HUqbn_HxKjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0043.outbound.protection.outlook.com ([104.47.2.43]:61022
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752181AbcKZBig (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Nov 2016 20:38:36 -0500
In-Reply-To: <CAHp75VdTW9CYJiwt=CsESdQhsd5FEdAPx9FxDt_HUqbn_HxKjA@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, "dvhart@infradead.org" <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IFttYWlsdG86YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbV0NCj4gU2VudDogRnJpZGF5LCBOb3Zl
bWJlciAyNSwgMjAxNiAxMjowMyBQTQ0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbWVs
bGFub3guY29tPg0KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+OyBk
dmhhcnRAaW5mcmFkZWFkLm9yZzsgcGxhdGZvcm0tDQo+IGRyaXZlci14ODZAdmdlci5rZXJuZWwu
b3JnOyB4ODZAa2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gamly
aUByZXNudWxsaS51czsgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tDQo+IFN1Ympl
Y3Q6IFJlOiBbcGF0Y2ggdjMgMS8xXSBwbGF0Zm9ybS94ODY6IG1vdmUgbW9kdWxlIG1seC1wbGF0
Zm9ybSBmcm9tDQo+IGFyY2gveDg2IHRvIGRyaXZlcnMvcGxhdGZvcm0veDg2DQo+IA0KPiBPbiBG
cmksIE5vdiAyNSwgMjAxNiBhdCA2OjE0IEFNLCBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBtZWxs
YW5veC5jb20+DQo+IHdyb3RlOg0KPiA+PiBUaGFua3MgZm9yIHJlcGx5Lg0KPiA+Pg0KPiA+PiA+
IEZpcnN0IG9mIGFsbCwgcGxlYXNlIGF2b2lkIHRvcCBwb3N0aW5nLg0KPiA+Pg0KPiA+PiBTb3Jy
eSBmb3IgdGhhdC4NCj4gPj4gSSBwb3N0ZWQgb24gdG9wLCBiZWNhdXNlIGl0IGRvZXNuJ3QgY29t
ZSBhcyByZXBseSB0byBzb21ldGhpbmcgKGJ1dA0KPiA+PiBpdCBzZWVtcyBJIHNob3VsZCBwb3N0
IGF0IGJvdHRvbSBpbiBzdWMgY2FzZSkuDQo+ID4+DQo+ID4+ID4gSSB3aWxsIHByb2Nlc3MgdGhl
IHBkeDg2IG1haWxpbmcgbGlzdCBhbmQgcXVldWUgdGhpcyB3ZWVrLg0KPiA+DQo+ID4gSSBhbSB2
ZXJ5IHNvcnJ5IGZvciByZW1pbmRpbmcsIGJ1dCBJIHNlZSB0aGF0IGl0J3Mgc3RpbGwgbm90IG1l
cmdlZC4NCj4gDQo+IA0KPiBTb3JyeSBmb3IgdGhhdCwgd2UgZW5jb3VudGVyIG9uZSBpc3N1ZSB3
aXRoIHJlcG9zaXRvcnkgcGVybWlzc2lvbnMsIHNvLCBjdXJyZW50bHkNCj4gSSBjYW4ndCBkbyBt
dWNoLiBXZSBhcmUgdHJ5aW5nIHRvIHJlc29sdmUgdGhpcyBhcyBzb29uIGFzIHBvc3NpYmxlLg0K
PiBXZSBzdGlsbCBoYXZlIHRpbWUgYmVmb3JlIG1lcmdlIHdpbmRvdyAob25lIHdlZWsgb3Igc28p
Lg0KPiANCkhpIEFuZHksDQoNCk9LLCBJIHNlZS4NCkkganVzdCBoYXZlIGFub3RoZXIgcGF0Y2gs
IHlvdSBhbHJlYWR5IG1hZGUgcmV2aWV3IGZvciB0aGF0Lg0KQW5kIEkgYW0gd2FpdGluZyBmb3Ig
dGhlIG1lcmdlLCBpbiBvcmRlciB0byBzZW5kIHRoaXMgcGF0Y2ggKHRoaXMgaXMgdGhlIGNoYW5n
ZSBpbiBtbHgtcGxhdGZvcm0uYyBtb2R1bGUsIHdoaWNoIGlzIGdvaW5nIHRvIG1pZ3JhdGUpLg0K
QW5kIEkgYW0gYWZyYWlkIEkgY2FuIG1pc3NlZCBtZXJnZSB3aW5kb3cgZm9yIGl0Lg0KDQpUaGFu
a3MsDQpWYWRpbS4NCg0KPiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hl
bmtvDQo=
