From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v5] Support intel-vbtn based tablet mode switch
Date: Fri, 26 Jan 2018 16:29:28 +0000
Message-ID: <37b90c6c67cf41cfa218ccedfb811a9a@ausx13mpc120.AMER.DELL.COM>
References: <1516965688-9286-1-git-send-email-notmart@gmail.com>
 <CAHp75VftsyEGz-ap_UQDwP33yXtNEnuekLJpwm4-qXxw8Ud3vw@mail.gmail.com>
 <CAD6_BovK7A4kyBW1S5TOGxxXKnqaitSfg0bOuCkqRKSkSmicfA@mail.gmail.com>
 <5d6fd1c856db42a992f0307294c9e14b@ausx13mpc120.AMER.DELL.COM>
 <CAHp75VfB5wD91rY9G4tob--4UNYTFXnAMzDuhM=znRunrO8Z1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:31231 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752428AbeAZQ3c (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Jan 2018 11:29:32 -0500
In-Reply-To: <CAHp75VfB5wD91rY9G4tob--4UNYTFXnAMzDuhM=znRunrO8Z1g@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: andy.shevchenko@gmail.com
Cc: notmart@gmail.com, linux-kernel@vger.kernel.org, mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, bhush94@gmail.com, platform-driver-x86@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gW21h
aWx0bzphbmR5LnNoZXZjaGVua29AZ21haWwuY29tXQ0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkg
MjYsIDIwMTggMTA6MjggQU0NCj4gVG86IExpbW9uY2llbGxvLCBNYXJpbyA8TWFyaW9fTGltb25j
aWVsbG9ARGVsbC5jb20+DQo+IENjOiBNYXJjbyBNYXJ0aW4gPG5vdG1hcnRAZ21haWwuY29tPjsg
TGludXggS2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc+OyBNYXR0aGV3IEdhcnJldHQgPG1qZzU5QHNyY2YudWNhbS5vcmc+OyBQYWxpIFJvaMOhcg0K
PiA8cGFsaS5yb2hhckBnbWFpbC5jb20+OyBEYXJyZW4gSGFydCA8ZHZoYXJ0QGluZnJhZGVhZC5v
cmc+OyBBbmR5IFNoZXZjaGVua28NCj4gPGFuZHlAaW5mcmFkZWFkLm9yZz47IEJodXNoYW4gU2hh
aCA8Ymh1c2g5NEBnbWFpbC5jb20+OyBQbGF0Zm9ybSBEcml2ZXINCj4gPHBsYXRmb3JtLWRyaXZl
ci14ODZAdmdlci5rZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1XSBTdXBwb3J0
IGludGVsLXZidG4gYmFzZWQgdGFibGV0IG1vZGUgc3dpdGNoDQo+IA0KPiBPbiBGcmksIEphbiAy
NiwgMjAxOCBhdCA2OjIyIFBNLCAgPE1hcmlvLkxpbW9uY2llbGxvQGRlbGwuY29tPiB3cm90ZToN
Cj4gDQo+ID4gaHR0cDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2R2aGFydC9saW51eC1wbGF0
Zm9ybS1kcml2ZXJzLXg4Ni5naXQNCj4gPiBUaGUgdGVzdGluZyBicmFuY2guDQo+IA0KPiBTaW5j
ZSBQRHg4NiBzdWJzeXN0ZW0gaXMgbWFpbnRhaW5lZCBieSBtb3JlIHRoYW4gb25lIHBlcnNvbiB3
ZQ0KPiBlbmNvdXJhZ2UgdG8gdXNlIGltcGVyc29uYWwgVVJMLCBpLmUuDQo+IA0KPiBodHRwOi8v
Z2l0LmluZnJhZGVhZC5vcmcvbGludXgtcGxhdGZvcm0tZHJpdmVycy14ODYuZ2l0DQo+IA0KDQpU
aHgsIGRpZG4ndCBrbm93IHRoYXQgZXhpc3RlZC4NCg==
