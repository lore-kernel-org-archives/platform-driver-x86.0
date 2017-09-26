From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v2 14/14] platform/x86: dell-wmi-smbios: clean up wmi
 descriptor check
Date: Tue, 26 Sep 2017 20:19:50 +0000
Message-ID: <d59f64d339a1425b9bb4ac590fff4cb9@ausx13mpc120.AMER.DELL.COM>
References: <cover.1506451187.git.mario.limonciello@dell.com>
 <4178d2bdfc69c94fe4972fee7b97b08202890e66.1506451187.git.mario.limonciello@dell.com>
 <201709262211.57222@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:18493 "EHLO
        esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S967680AbdIZUTw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2017 16:19:52 -0400
In-Reply-To: <201709262211.57222@pali>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYWxpIFJvaMOhciBbbWFpbHRv
OnBhbGkucm9oYXJAZ21haWwuY29tXQ0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMjYsIDIw
MTcgNDoxMiBQTQ0KPiBUbzogTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpb19MaW1vbmNpZWxsb0BE
ZWxsLmNvbT4NCj4gQ2M6IGR2aGFydEBpbmZyYWRlYWQub3JnOyBBbmR5IFNoZXZjaGVua28gPGFu
ZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+Ow0KPiBMS01MIDxsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnPjsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7DQo+IHF1YXNpc2Vj
QGdvb2dsZS5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxNC8xNF0gcGxhdGZvcm0veDg2
OiBkZWxsLXdtaS1zbWJpb3M6IGNsZWFuIHVwIHdtaQ0KPiBkZXNjcmlwdG9yIGNoZWNrDQo+IA0K
PiBPbiBUdWVzZGF5IDI2IFNlcHRlbWJlciAyMDE3IDIwOjUwOjEyIE1hcmlvIExpbW9uY2llbGxv
IHdyb3RlOg0KPiA+ICsJaWYgKHN0cm5jbXAob2JqLT5zdHJpbmcucG9pbnRlciwgIkRFTEwgV01J
IiwgOCkgIT0gMCkNCj4gDQo+IFNob3VsZCBub3QgYmUgdGhpcyBtZW1jbXA/IElJUkMgd2Ugd2Fu
dCB0byBjb21wYXJlIHRoYXQgYnVmZmVyIGlzIGVxdWFsDQo+IHRvIHNvbWUgYnl0ZXMsIHJpZ2h0
Pw0KPiANCg0KSXQgdXNlZCB0byBiZSBjb21wYXJpbmcgdGhlIGJ5dGVzLCBidXQgQW5keSBTLiB0
aG91Z2h0IHRoaXMgd2Fzbid0IHZlcnkgY2xlYXIuDQpUaGF0J3Mgd2h5IEkgYWRqdXN0ZWQgaXQg
dG8gY29tcGFyZSB0byB0aGUgc3RyaW5ncyB0aGF0IHRoZSBieXRlcyB1c2VkIGluc3RlYWQuDQo=
