From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v1 0/5] platform/x86: intel_telemetry: Fix counters and
 formatting
Date: Mon, 20 Nov 2017 03:12:23 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB4662906D8@BGSMSX102.gar.corp.intel.com>
References: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com>
 <CAHp75VcYMeRkuSO46WQRVPfAjuaJy1PmGfpdiZ-zod6RpXx4nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:36301 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751078AbdKTDM2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Nov 2017 22:12:28 -0500
In-Reply-To: <CAHp75VcYMeRkuSO46WQRVPfAjuaJy1PmGfpdiZ-zod6RpXx4nQ@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@intel.com>

T24gRnJpLCBOb3YgMTcsIDIwMTcgYXQgNzowNyBQTSwgQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNo
ZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToNCj4gT24gVGh1LCBOb3YgMTYsIDIwMTcgYXQgMTI6
MTggUE0sIFNvdXZpayBLdW1hciBDaGFrcmF2YXJ0eQ0KPiA8c291dmlrLmsuY2hha3JhdmFydHlA
aW50ZWwuY29tPiB3cm90ZToNCj4gPiBUaGlzIHBhdGNoc2V0IGZpeGVzDQo+ID4gaHR0cHM6Ly9i
dWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0xOTc4MzMsIGFuZCBvdGhlciBpc3N1
ZXMNCj4gPiByZWxhdGVkIHRvIHRlbGVtZXRyeSBjb3VudGVycy4gSXQgYWxzbyBjbGVhbnMgdXAg
Zm9ybWF0dGluZyBhbmQgcmVtb3Zlcw0KPiByZWR1bmRhbmFudCBjb2RlLg0KPiA+DQo+ID4gSXQg
aXMgcmViYXNlZCBvbiB0b3Agb2YgdGhlIFRFU1RJTkcgYnJhbmNoLg0KPiANCj4gT3ZlcmFsbCBs
b29rcyBub3Qgc28gYmFkLCBwbGVhc2UgYWRkcmVzcyBteSBjb21tZW50cy4NCg0KVGhhbmtzIGZv
ciB0aGUgY29tbWVudHMgQW5keS4gSSB3aWxsIHJlLXNwaW4gYW5vdGhlciBzZXQuDQo+IA0KPiA+
DQo+ID4gU291dmlrIEt1bWFyIENoYWtyYXZhcnR5ICg1KToNCj4gPiAgIHBsYXRmb3JtL3g4Njog
aW50ZWxfcG1jX2lwYzogRml4IHJlZ2lzdGVyIG5hbWVzDQo+ID4gICBwbGF0Zm9ybS94ODY6IGlu
dGVsX3RlbGVtZXRyeTogRml4IHN1c3BlbmQgc3RhdHMNCj4gPiAgIHBsYXRmb3JtL3g4NjogaW50
ZWxfdGVsZW1ldHJ5OiBGaXggbG9jYWwgdmFyaWFibGVzDQo+ID4gICBwbGF0Zm9ybS94ODY6IGlu
dGVsX3RlbGVtZXRyeTogUmVtb3ZlIHJlZHVuZGFuY2llcw0KPiA+ICAgcGxhdGZvcm0veDg2OiBp
bnRlbF90ZWxlbWV0cnk6IEltcHJvdmUgUzBpeCBsb2dzDQo+ID4NCj4gPiAgYXJjaC94ODYvaW5j
bHVkZS9hc20vaW50ZWxfcG1jX2lwYy5oICAgICAgICAgICB8ICAxMCArKy0NCj4gPiAgZHJpdmVy
cy9wbGF0Zm9ybS94ODYvaW50ZWxfcG1jX2lwYy5jICAgICAgICAgICB8ICAgNCArLQ0KPiA+ICBk
cml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbF90ZWxlbWV0cnlfZGVidWdmcy5jIHwgMTAxDQo+ID4g
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDU5IGluc2Vy
dGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gLS0NCj4gPiAyLjcuNA0KPiA+DQo+
IA0KPiANCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28N
Cg==
