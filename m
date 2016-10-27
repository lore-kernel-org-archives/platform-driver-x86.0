From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v1 1/2] drivers/platform/x86: move module mlx-platform
 from arch/x86 to drivers/platform/x86
Date: Thu, 27 Oct 2016 15:26:35 +0000
Message-ID: <AM5PR0501MB20974BD5E2B376806B8F031FA2AA0@AM5PR0501MB2097.eurprd05.prod.outlook.com>
References: <1477576758-102003-1-git-send-email-vadimp@mellanox.com>
 <1477576750.5295.28.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-db5eur01on0079.outbound.protection.outlook.com ([104.47.2.79]:48304
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S935293AbcJ1HCg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Oct 2016 03:02:36 -0400
In-Reply-To: <1477576750.5295.28.camel@linux.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "fengguang.wu@intel.com" <fengguang.wu@intel.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "geert@linux-m68k.org" <geert@linux-m68k.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@kernel.org" <mchehab@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IFttYWlsdG86YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tXQ0KPiBTZW50OiBUaHVy
c2RheSwgT2N0b2JlciAyNywgMjAxNiA0OjU5IFBNDQo+IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZh
ZGltcEBtZWxsYW5veC5jb20+OyBkdmhhcnRAaW5mcmFkZWFkLm9yZzsNCj4gZmVuZ2d1YW5nLnd1
QGludGVsLmNvbQ0KPiBDYzogZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsgZ2VlcnRAbGludXgtbTY4ay5v
cmc7IGFrcG1AbGludXgtDQo+IGZvdW5kYXRpb24ub3JnOyBrdmFsb0Bjb2RlYXVyb3JhLm9yZzsg
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7DQo+IG1jaGVoYWJAa2VybmVsLm9yZzsgbGludXhA
cm9lY2stdXMubmV0OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBwbGF0Zm9ybS1k
cml2ZXIteDg2QHZnZXIua2VybmVsLm9yZzsgamlyaUByZXNudWxsaS51cw0KPiBTdWJqZWN0OiBS
ZTogW3BhdGNoIHYxIDEvMl0gZHJpdmVycy9wbGF0Zm9ybS94ODY6IG1vdmUgbW9kdWxlIG1seC1w
bGF0Zm9ybQ0KPiBmcm9tIGFyY2gveDg2IHRvIGRyaXZlcnMvcGxhdGZvcm0veDg2DQo+IA0KPiBP
biBUaHUsIDIwMTYtMTAtMjcgYXQgMTM6NTkgKzAwMDAsIHZhZGltcEBtZWxsYW5veC5jb20gd3Jv
dGU6DQo+ID4gRnJvbTogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbWVsbGFub3guY29tPg0KPiA+
DQo+ID4gTW92ZSBtb2R1bGUgbWx4LXBsYXRmb3JtLmMgZnJvbSBhcmNoL3g4Ni9wbGF0Zm9ybS9t
ZWxsYW5veC8gdG8NCj4gPiBkcml2ZXJzL3BsYXRmb3JtL3g4Ni8uDQo+ID4gUmVtb3ZlIGZvbGRl
ciBhcmNoL3g4Ni9wbGF0Zm9ybS9tZWxsYW5veC8gYW5kIHVwZGF0ZSByZWxldmFudCBNYWtlZmls
ZQ0KPiA+IGFuZCBLY29uZmlnLg0KPiANCj4gTm8gd2F5LCBwbGVhc2UgdXNlIC1NIC1DLg0KPiAN
Cg0KDQpIaSBBbmR5LA0KDQpJIGFtIGFmcmFpZCBJIGRpZG4ndCB1bmRlcnN0YW5kIHlvdXIgY29t
bWVudC4NCkNvdWxkIHlvdSwgcGxlYXNlLCBhZGQgc29tZSBtb3JlIGRldGFpbHM/DQoNClRoYW5r
cywNClZhZGltLg0KDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBWYWRpbSBQYXN0ZXJuYWsgPHZh
ZGltcEBtZWxsYW5veC5jb20+DQo+ID4gLS0tDQo+ID4gwqBNQUlOVEFJTkVSU8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfMKgwqDC
oDIgKy0NCj4gPiDCoGFyY2gveDg2L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfMKgwqAxMiAtLQ0KPiA+IMKgYXJjaC94ODYvcGxhdGZv
cm0vTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHzCoMKgwqAxIC0NCj4g
PiDCoGFyY2gveDg2L3BsYXRmb3JtL21lbGxhbm94L01ha2VmaWxlwqDCoMKgwqDCoMKgwqB8wqDC
oMKgMSAtDQo+ID4gwqBhcmNoL3g4Ni9wbGF0Zm9ybS9tZWxsYW5veC9tbHgtcGxhdGZvcm0uYyB8
IDI2NiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gLS0tLS0tLS0tLS0NCj4gPiDCoGRyaXZlcnMv
cGxhdGZvcm0veDg2L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfMKgwqAxNCAr
LQ0KPiA+IMKgZHJpdmVycy9wbGF0Zm9ybS94ODYvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHzCoMKgwqAxICsNCj4gPiDCoGRyaXZlcnMvcGxhdGZvcm0veDg2L21seC1wbGF0Zm9y
bS5jwqDCoMKgwqDCoMKgwqB8IDI2Ng0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiA+IMKgOCBmaWxlcyBjaGFuZ2VkLCAyODEgaW5zZXJ0aW9ucygrKSwgMjgyIGRlbGV0aW9u
cygtKQ0KPiA+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gveDg2L3BsYXRmb3JtL21lbGxhbm94
L01ha2VmaWxlDQo+ID4gwqBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC94ODYvcGxhdGZvcm0vbWVs
bGFub3gvbWx4LXBsYXRmb3JtLmMNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3Bs
YXRmb3JtL3g4Ni9tbHgtcGxhdGZvcm0uYw0KPiANCj4gDQo+IC0tDQo+IEFuZHkgU2hldmNoZW5r
byA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiBJbnRlbCBGaW5sYW5kIE95
DQo=
