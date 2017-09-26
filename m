From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v2 09/14] platform/x86: dell-smbios: rename to
 dell-wmi-smbios
Date: Tue, 26 Sep 2017 20:18:54 +0000
Message-ID: <cdc310f9f2d347ba83930cab5fef8efa@ausx13mpc120.AMER.DELL.COM>
References: <cover.1506451187.git.mario.limonciello@dell.com>
 <746fb34ff44824808e7892f81247436f80c7ab83.1506451187.git.mario.limonciello@dell.com>
 <201709262206.13177@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa6.dell-outbound.iphmx.com ([68.232.149.229]:55851 "EHLO
        esa6.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S935846AbdIZUS4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2017 16:18:56 -0400
In-Reply-To: <201709262206.13177@pali>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYWxpIFJvaMOhciBbbWFpbHRv
OnBhbGkucm9oYXJAZ21haWwuY29tXQ0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMjYsIDIw
MTcgNDowNiBQTQ0KPiBUbzogTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpb19MaW1vbmNpZWxsb0BE
ZWxsLmNvbT4NCj4gQ2M6IGR2aGFydEBpbmZyYWRlYWQub3JnOyBBbmR5IFNoZXZjaGVua28gPGFu
ZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+Ow0KPiBMS01MIDxsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnPjsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7DQo+IHF1YXNpc2Vj
QGdvb2dsZS5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwOS8xNF0gcGxhdGZvcm0veDg2
OiBkZWxsLXNtYmlvczogcmVuYW1lIHRvIGRlbGwtd21pLQ0KPiBzbWJpb3MNCj4gDQo+IE9uIFR1
ZXNkYXkgMjYgU2VwdGVtYmVyIDIwMTcgMjA6NTA6MDcgTWFyaW8gTGltb25jaWVsbG8gd3JvdGU6
DQo+ID4gVGhpcyBmb2xsb3dzIHRoZSBzdHlsZSBvZiB0aGUgcmVzdCBvZiB0aGUgcGxhdGZvcm0g
eDg2IFdNSSBkcml2ZXJzLg0KPiA+DQo+ID4gUmVuYW1pbmcgdGhlIGRyaXZlciByZXF1aXJlcyBh
ZGp1c3RpbmcgdGhlIG90aGVyIGRyaXZlcnMgdXNpbmcNCj4gPiBkZWxsLXNtYmlvcyB0byBwaWNr
IHVwIHRoZSBuZXdseSBuYW1lZCBpbmNsdWRlcy4NCj4gPg0KPiA+IFdoaWxlIHJlbmFtaW5nLCBJ
IG5vdGljZWQgdGhhdCB0aGlzIGRyaXZlciB3YXMgbWlzc2luZyBmcm9tDQo+ID4gTUFJTlRBSU5F
UlMuIEFkZCBpdCB0byB0aGF0IGFuZCBteXNlbGYgdG8gdGhlIGxpc3Qgb2YgcGVvcGxlDQo+ID4g
bWFpbnRhaW5nIGl0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFyaW8gTGltb25jaWVsbG8g
PG1hcmlvLmxpbW9uY2llbGxvQGRlbGwuY29tPg0KPiANCj4gTm93IHdoZW4gZHJpdmVyIHN1cHBv
cnRzIGJvdGggb2xkIGFuZCBuZXcgV01JIGNhbGwgaW50ZXJmYWNlLCBJIHRoaW5rDQo+IHRoYXQg
cmVuYW1pbmcgaXMgbm90IG5lZWRlZC4uLg0KPiANCg0KU28gYWxsIG90aGVyIGRyaXZlcnMgdGhh
dCB1c2UgV01JIGhhdmUgIldNSSIgaW4gdGhlIG5hbWUsIHRoaXMgd291bGQgYmUNCmJyZWFraW5n
IHByZXZpb3VzbHkgc2V0IHByZWNlZGVuY2UuICBEYXJlbiwgQW5keSwgd2hhdCB3b3VsZCB5b3Ug
bGlrZQ0KbWUgdG8gZG8/DQo=
