From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v5] Support intel-vbtn based tablet mode switch
Date: Fri, 26 Jan 2018 16:22:35 +0000
Message-ID: <5d6fd1c856db42a992f0307294c9e14b@ausx13mpc120.AMER.DELL.COM>
References: <1516965688-9286-1-git-send-email-notmart@gmail.com>
 <CAHp75VftsyEGz-ap_UQDwP33yXtNEnuekLJpwm4-qXxw8Ud3vw@mail.gmail.com>
 <CAD6_BovK7A4kyBW1S5TOGxxXKnqaitSfg0bOuCkqRKSkSmicfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:56245 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752813AbeAZQWj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Jan 2018 11:22:39 -0500
In-Reply-To: <CAD6_BovK7A4kyBW1S5TOGxxXKnqaitSfg0bOuCkqRKSkSmicfA@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: notmart@gmail.com, andy.shevchenko@gmail.com
Cc: linux-kernel@vger.kernel.org, mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, bhush94@gmail.com, platform-driver-x86@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJjbyBNYXJ0aW4gW21haWx0
bzpub3RtYXJ0QGdtYWlsLmNvbV0NCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDI2LCAyMDE4IDEw
OjE4IEFNDQo+IFRvOiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+
DQo+IENjOiBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0IDxsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnPjsgTWF0dGhldyBHYXJyZXR0DQo+IDxtamc1OUBzcmNmLnVjYW0ub3JnPjsgUGFsaSBS
b2jDoXIgPHBhbGkucm9oYXJAZ21haWwuY29tPjsgRGFycmVuIEhhcnQNCj4gPGR2aGFydEBpbmZy
YWRlYWQub3JnPjsgQW5keSBTaGV2Y2hlbmtvIDxhbmR5QGluZnJhZGVhZC5vcmc+OyBCaHVzaGFu
IFNoYWgNCj4gPGJodXNoOTRAZ21haWwuY29tPjsgUGxhdGZvcm0gRHJpdmVyIDxwbGF0Zm9ybS1k
cml2ZXIteDg2QHZnZXIua2VybmVsLm9yZz47DQo+IExpbW9uY2llbGxvLCBNYXJpbyA8TWFyaW9f
TGltb25jaWVsbG9ARGVsbC5jb20+OyBMaW1vbmNpZWxsbywgTWFyaW8NCj4gPE1hcmlvX0xpbW9u
Y2llbGxvQERlbGwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1XSBTdXBwb3J0IGludGVs
LXZidG4gYmFzZWQgdGFibGV0IG1vZGUgc3dpdGNoDQo+IA0KPiBPbiBGcmksIEphbiAyNiwgMjAx
OCBhdCA0OjU3IFBNLCBBbmR5IFNoZXZjaGVua28NCj4gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5j
b20+IHdyb3RlOg0KPiA+IE9uIEZyaSwgSmFuIDI2LCAyMDE4IGF0IDE6MjEgUE0sIE1hcmNvIE1h
cnRpbiA8bm90bWFydEBnbWFpbC5jb20+IHdyb3RlOg0KPiA+PiBTb21lIGxhcHRvcHMgc3VjaCBh
cyBEZWxsIEluc3Bpcm9uIDcwMDAgc2VyaWVzIGhhdmUgdGhlDQo+ID4+IHRhYmxldCBtb2RlIHN3
aXRjaCBpbXBsZW1lbnRlZCBpbiBJbnRlbCBBQ1BJLA0KPiA+PiB0aGUgZXZlbnRzIHRvIGVudGVy
IGFuZCBleGl0IHRoZSB0YWJsZXQgbW9kZSBhcmUgMHhDQyBhbmQgMHhDRA0KPiA+DQo+ID4gVGhh
bmtzIGZvciBhbiB1cGRhdGUuIEl0IGRvZXNuJ3QgYXBwbHkuDQo+ID4NCj4gPiBQbGVhc2UsIHJl
YmFzZSBvbiB0b3Agb2Ygb3VyIHRlc3RpbmcgYnJhbmNoLCBhZGQgTWFyaW8ncyB0YWcgYW5kIHJl
c2VuZC4NCj4gDQo+IHdoYXQgY2xvbmUvYnJhbmNoIEkgc2hvdWxkIGxvb2sgYXQ/DQo+IA0KPiAt
LQ0KPiBNYXJjbyBNYXJ0aW4NCg0KaHR0cDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2R2aGFy
dC9saW51eC1wbGF0Zm9ybS1kcml2ZXJzLXg4Ni5naXQNClRoZSB0ZXN0aW5nIGJyYW5jaC4NCg==
